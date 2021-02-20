<?php

namespace app\Http\Controllers;

/*
 * Antvel - Users Controller
 *
 * @author  Gustavo Ocanto <gustavoocanto@gmail.com>
 */

use App\Business;
use App\Helpers\File;
use App\Helpers\userHelper;
use App\Http\Controllers\Controller;
use App\Http\Controllers\ProductsController;
use App\Order;
use App\Person;
use App\Pincode;
use App\Product;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Validator;
use Mail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Symfony\Component\Console\Input\Input;

class UserController extends Controller
{
    private $form_rules = [
        'email'                 => 'required|email|unique:users,email,',
//        'nickname'              => 'required|max:255|unique:users,nickname,',
        'old_password'          => 'required_with:password,password_confirmation',
        'password'              => 'required_with:old_password,password_confirmation|confirmed|different:old_password',
        'password_confirmation' => 'required_with:old_password,password|different:old_password|same:password',
    ];

    /**
     * Inicializa variables para la validacion de perfil.
     */
    public function __construct()
    {
        $user = \Auth::user();

        if ($user) {
            // Validacion de campos unique
            $this->form_rules['email'] .= $user->id;
            $this->form_rules['nickname'] .= $user->id;

            // Validaciones segun tipo de user
//            if ($user->hasRole(['admin', 'person'])) {
                $form_rules['first_name'] = 'required|min:3|max:20|string';
                $form_rules['last_name'] = 'required|min:3|max:20|string';
//            } else {
//                $form_rules['business_name'] = 'required|min:5|max:30|string';
//            }
        }
    }

    //Paneles por defecto Usuarios
    private $view_panel = [
        'left'   => ['width' => '2', 'class' => 'user-panel'],
        'center' => ['width' => '10'],
    ];

    /**
     * Sube imagen de perfil y background de usuario.
     *
     * @param Request $request [description]
     *
     * @return [String] [Url de la imagen]
     */
    public function upload(Request $request)
    {
        $v = \Validator::make($request->all(), ['file' => 'image']);
        if ($v->fails()) {
            return $v->errors()->toJson();
        }

        return File::section('profile_img')->upload($request->file('file'));
    }

    /**
     * Vista de dashboard de usuario.
     *
     //* @return Illuminate\Contracts\View [Vista de dashboard]
     */
    public function dashBoard()
    {
        $panel = $this->view_panel;
        if((\Auth::user()->role == 'admin') || (\Auth::user()->role == 'subadmin')) {
            $query = Product::Free()->get();
        }else {
            $query = Product::where('user_id', \Auth::id())->Free()->get();
        }
        $products = ['active' => 0, 'inactive' => 0, 'lowStock' => 0, 'all' => $query->count()];
        foreach ($query as $row) {
            if ($row->status) {
                $products['active']++;
            } else {
                $products['inactive']++;
            }
            if ($row->stock <= $row->low_stock) {
                $products['lowStock']++;
            }
        }
        unset($query);
        if((\Auth::user()->role == 'admin') || (\Auth::user()->role == 'subadmin')) {
            $query = Order::ofType('order')->get();
        }else {
            $query = Order::auth()->ofType('order')->get();
        }
        $orders = ['closed' => 0, 'open' => 0, 'cancelled' => 0, 'all' => $query->count(), 'total' => 0, 'nopRate' => 0];
        foreach ($query as $row) {
            if ($row->status == 'cancelled') {
                $orders['cancelled']++;
            } elseif ($row->status == 'closed') {
                $orders['closed']++;
            } else {
                $orders['open']++;
            }
            foreach ($row->details as $deta) {
                $orders['total'] += ($deta->quantity * $deta->price);
                if ($row->status == 'closed' && !$deta->rate) {
                    $orders['nopRate']++;
                }
            }
        }
        unset($query);
        $sales = null;
        if (\Auth::check() && \Auth::user()->hasRole(['business', 'admin','subadmin'])) {
            if((\Auth::user()->role == 'admin') || (\Auth::user()->role == 'subadmin')) {
                $orders = Order::ofType('order')->get();
            }else {
                $orders = Order::where('seller_id', \Auth::user()->id)->ofType('order')->get();
            }

            $sales = ['closed' => 0, 'open' => 0, 'cancelled' => 0, 'all' => $orders->count(), 'total' => 0, 'rate' => 0, 'numRate' => 0, 'totalRate' => 0, 'nopRate' => 0];
            foreach ($orders as $row) {
                if ($row->status == 'cancelled') {
                    $sales['cancelled']++;
                } elseif ($row->status == 'closed') {
                    $sales['closed']++;
                } else {
                    $sales['open']++;
                }
                foreach ($row->details as $deta) {
                    $sales['total'] += ($deta->quantity * $deta->price);
                    if ($row->status == 'closed' && $deta->rate) {
                        $sales['numRate']++;
                        $sales['totalRate'] = $sales['totalRate'] + $deta->rate;
                    }
                    if ($row->status == 'closed' && !$deta->rate) {
                        $sales['nopRate']++;
                    }
                }
            }
            if ($sales['numRate']) {
                $sales['rate'] = $sales['totalRate'] / $sales['numRate'];
            }
        }

        return view('user.dashboard', compact('panel', 'products', 'orders', 'sales'));
    }

    /**
     * MUestra el perfil del usuario.
     *
     //* @return Illuminate\Contracts\View Vista de perfil
     */
    public function profile()
    {
        $user = User::findOrFail(\Auth::id())->relationsToArray();
        $panel = $this->view_panel;
        return view('user.profile', compact('panel', 'user'));
    }

    /**
     * Elimina el perfil del usuario(SOFT DELETE).
     *
     * @return string json
     */
    public function deleteAccount(Request $request)
    {
        $user = User::findOrFail(\Auth::id());
        $user->delete();

        if ($request->wantsJson()) {
            return \Response::json(['success' => true, 'message' => trans('user.profile_disabled')]);
        }

        \Session::flash('message', trans('user.profile_disabled'));

        return redirect()->back();
    }

    /**
     * Desactiva el perfil del usuario.
     *
     * @return string json
     */
    public function disableProfile(Request $request)
    {
        $user = \Auth::user();
        $date = \Carbon\Carbon::now();
        $user->update(['disabled_at' => $date]);

        if ($request->wantsJson()) {
            return \Response::json(['success' => true, 'message' => trans('user.profile_disabled'), 'date' => $date->toDateTimeString()]);
        }

        \Session::flash('message', trans('user.profile_disabled'));

        return redirect()->back();
    }

    /**
     * Activa el perfil del usuario.
     *
     * @return string json
     */
    public function activeProfile(Request $request)
    {
        $user = \Auth::user();
        $user->update(['disabled_at' => null]);

        if ($request->wantsJson()) {
            return \Response::json(['success' => true, 'message' => trans('user.profile_enabled')]);
        }

        \Session::flash('message', trans('user.profile_enabled'));

        return redirect()->back();
    }


    /**
     * Guarda los cambio del usuario.
     *
     * @param Request $request peticion
     *
     * @return Laravel Redirect
     */
    public function saveProfile(Request $request)
    {
        $editedEmail = $request->email;
        $user = \Auth::user();
        $savedEmail = $user->email;
        $this->form_rules['email'] .= $user->id;
        $v = \Validator::make($request->all(), $this->form_rules);

        if ($v->fails()) {
            return redirect()->back()->withErrors($v->errors())->withInput();
        }

        //user update
        \Session::flash('message', trans('user.saved'));
        $user->fill($request->all());
        $user->pic_url = $request->get('pic_url');
        if($request->get('password')) {
            $user->password = bcrypt($request->get('password'));
        }
        $user->save();

        //bussiness update
        if ($request->get('business_name') !== null && trim($request->get('business_name')) != '') {
            $business = Business::find($user->id);
            $business->business_name = $request->get('business_name');
            $business->save();
        }

        //person update
        if ($request->get('first_name') !== null && trim($request->get('first_name')) != '') {
            $person = Person::find($user->id);
            $person->first_name = $request->get('first_name');
            $person->last_name = $request->get('last_name');
            $person->birthday = $request->get('birthday');
            $person->sex = $request->get('sex');
            $person->save();
        }
        if ($editedEmail != $savedEmail) {
            $data['userid'] = $user->id;
            $data['email'] = $user->email;
            Session::put('data',$data);
            Mail::send('emails.changeEmailVerification',$data, function ($message) use ($data) {
                $message->to($data['email'])->subject(trans('user.emails.verification_account.subject'));
                $message->from(getenv('MAIL_USERNAME'));
                $message->replyTo('noreply@gmail.com');
            });
            
            $user->verified = 'no';
            $user->save();
            Session::flush();
            session()->put('message',trans('user.confirm_email'));
            return redirect('/');
        }
        return redirect()->back();
    }

    /**
     * Save the user preferences.
     *
     * @param [String] $index user preference key array
     * @param [Array]  $tags  products tags
     */
    public static function setPreferences($index = '', $tags = [])
    {
        $user = \Auth::user();
        if ($user) {
            $userHelper = new UserHelper();
            $categories = ProductsController::getTagsCategories($tags);
            $user->preferences = $userHelper->preferencesToJson($user->preferences, $index, $tags, $categories);
            $user->save();
        }
    }

    /**
     * Return the users preferences taking in account the key requered.
     *
     * @param [interger] $user_id         user id
     * @param [string]   $preferences_key user preferences array key
     *
     * @return [Array] info to evaluate user products suggestion
     */
    public static function getPreferences($preferences_key = '')
    {
        $preferences = (\Auth::user()) ? \Auth::user()->preferences : '';

        //getting the needle
        $userHelper = new UserHelper();

        return $userHelper->getPreferencesNeedle($preferences, $preferences_key);
    }

    public function getPoints()
    {
        $points = ['points' => '0'];
        $user = \Auth::user();
        if ($user) {
            $points = ['points' => $user->current_points];
        }

        return \Response::json($points);
    }

    /**
     * accountVerification allows users account verification.
     *
     * @param [string] $token is the var sent to users email to validate if the account belongs to him or not.
     */
    public function accountVerification($userid)
    {
        //validating if the token retrieved is valid
        $user = User::find($userid);

        if ($user) {
            $name = $user->name.' '.$user->last_name;
            Session::put('message', str_replace('[name]', $name, trans('user.account_verified_ok_message')));
        } else {
            Session::put('messageClass', 'alert alert-danger');
            Session::put('message', trans('user.account_verified_error_message'));
        }

        Session::save();

        return redirect('/');
    }
    public function emailVerification($userid)
    {
        //validating if the token retrieved is valid
        $user = User::find($userid);
        $person = Person::find($userid);
        if ($user) {
            $user->verified = 'yes';
            $user->save();
            $name = $person->first_name.' '.$person->last_name;
            Session::put('message', str_replace('[name]', $name, trans('user.account_verified_ok_message')));
        } else {
            Session::put('messageClass', 'alert alert-danger');
            Session::put('message', trans('user.account_verified_error_message'));
        }

        Session::save();

        return redirect('/');
    }
    public function buyerList() {
        $buyerList = User::where('role','=','person')->get();
        $panel = [
            'left'   => ['width' => '2', 'class' => 'user-panel'],
            'center' => ['width' => '10'],
        ];
        return view('user.buyerList', compact('panel','buyerList'));
    }
    public function sellerList() {
        $sellerList = User::where('role','=','business')->get();
        $panel = [
            'left'   => ['width' => '2', 'class' => 'user-panel'],
            'center' => ['width' => '10'],
        ];
        return view('user.sellerList', compact('panel','sellerList'));
    }
    public function productList() {
        $productList = Product::groupBy('product_status','id')->get();
        $panel = [
            'left'   => ['width' => '2', 'class' => 'user-panel'],
            'center' => ['width' => '10'],
        ];
        return view('user.productList', compact('panel','productList'));
    }
    public function subadminList() {
        $sellerList = User::where('role','=','subadmin')->get();
        $panel = [
            'left'   => ['width' => '2', 'class' => 'user-panel'],
            'center' => ['width' => '10'],
        ];
        return view('user.subadminList', compact('panel','sellerList'));
    }
    public function productApprove($productid) {
        $product = Product::find($productid);
        $product->product_status = 'approved';
        $product->save();

        $name = $product->product ? $product->product->nickname : '';
        $data['email'] = $product->product->email;
        $data['message'] = str_replace('[name]', $name, trans('user.product_verified_ok_message_seller'));
        Session::put('data',$data);
        Mail::send('emails.accountVerificationByAdmin',$data, function ($message) use ($data) {
            $message->to($data['email'])->subject('Product is Activated Successfully');
            $message->from(getenv('MAIL_USERNAME'));
            $message->replyTo('noreply@gmail.com');
        });
        session()->put('message', trans('user.product_approved'));
        return redirect('user/productList');
    }
    public function productReject($productid){

        $product = Product::find($productid);
        $product->product_status = 'rejected';
        $product->save();

        $name = $product->product ? $product->product->nickname : '';
        $data['email'] = $product->product->email;
        $data['message'] = str_replace('[name]', $name, trans('user.product_rejected_message_seller'));
        Session::put('data',$data);
        Mail::send('emails.accountVerificationByAdmin',$data, function ($message) use ($data) {
            $message->to($data['email'])->subject('Product is Rejected');
            $message->from(getenv('MAIL_USERNAME'));
            $message->replyTo('noreply@gmail.com');
        });

        Session::put('messageClass', 'alert alert-danger');
        session()->put('message', trans('user.product_rejected'));
        return redirect('user/productList');
    }
    public function sellerApprove($userid) {
        $user = User::find($userid);
        $user->type = 'trusted';
        $user->save();
        $name = $user->person ? $user->person->first_name.' '.$user->person->last_name : '';
        $data['email'] = $user->email;
        $data['message'] = str_replace('[name]', $name, trans('user.account_verified_ok_message_seller'));
        Session::put('data',$data);
        Mail::send('emails.accountVerificationByAdmin',$data, function ($message) use ($data) {
            $message->to($data['email'])->subject(trans('user.emails.verification_account_accept_seller.subject'));
            $message->from(getenv('MAIL_USERNAME'));
            $message->replyTo('noreply@gmail.com');
        });
        session()->put('message', trans('user.seller_approved'));
        return redirect()->back();
    }
    public function sellerReject($userid){
        $user = User::find($userid);
        $user->type = 'rejected';
        $user->save();

        $name = $user->person ? $user->person->first_name.' '.$user->person->last_name : '';
        $data['email'] = $user->email;
        $data['message'] = str_replace('[name]', $name, trans('user.account_rejected_message_seller'));
        Session::put('data',$data);
        Mail::send('emails.accountVerificationByAdmin',$data, function ($message) use ($data) {
            $message->to($data['email'])->subject(trans('user.emails.verification_account_reject_seller.subject'));
            $message->from(getenv('MAIL_USERNAME'));
            $message->replyTo('noreply@gmail.com');
        });

        Session::put('messageClass', 'alert alert-danger');
        session()->put('message', trans('user.seller_rejected'));
        return redirect()->back();
    }
    public function disable($userid){
        $user = User::find($userid);
        $user->verified = 'no';
        $user->save();

        Session::put('messageClass', 'alert alert-danger');
        session()->put('message', 'user disabed');
        return redirect()->back();
    }
    public function enable($userid){
        $user = User::find($userid);
        $user->verified = 'yes';
        $user->save();

        Session::put('messageClass', 'alert alert-danger');
        session()->put('message', 'user enable');
        return redirect()->back();
    }
    public function buyerdisable($userid){
        $user = User::find($userid);
        $user->verified = 'no';
        $user->save();

        Session::put('messageClass', 'alert alert-danger');
        session()->put('message', 'Buyer disabled');
        return redirect()->back();
    }
    public function buyerenable($userid){
        $user = User::find($userid);
        $user->verified = 'yes';
        $user->save();

        Session::put('messageClass', 'alert alert-success');
        session()->put('message', 'Buyer enabled');
        return redirect()->back();
    }
    public function edit($id)
    {
        try {
            $user = User::findOrFail($id);
            $panel = $this->view_panel;
            $persons = Person::where('user_id',$user->id)->first();
        } catch (ModelNotFoundException $e) {
            throw new NotFoundHttpException();
        }

        return view('user.edit', compact('user','persons','panel'));
    }
    public function create()
    {
        try {
            $userauth = User::findOrFail(Auth::user()->id);
            $panel = $this->view_panel;
            $persons = Person::where('user_id',$userauth->id)->first();
        } catch (ModelNotFoundException $e) {
            throw new NotFoundHttpException();
        }
        $pincodes = Pincode::all();
        return view('user.create', [
            'email' => session()->has('email') ? session()->get('email') : '',
            'pincodes' => $pincodes,
            'userauth' => $userauth,
            'persons'=>$persons,
            'panel'=>$panel
        ]);
    }

    public function updateuser(Request $request)
    {
        $user = User::find($request->userid);
        $user->mobile_phone = $request->mobile_phone;
        $user->area      =    $request->area;
        $user->role        = $request->role;
        $user->type    = $request->type;
        $user->twitter   = $request->twitter;
        $user->facebook   = $request->facebook;
        $user->verified   = $request->verified;
        $user->save();

        $person = Person::where('user_id',$request->userid)->first();
        if($person){
            $person->first_name = $request->first_name;
            $person->last_name = $request->last_name;
            $person->save();
        }else{
            $person = new Person();
            $person->user_id = $user->id;
            $person->first_name = $request->first_name;
            $person->last_name = $request->last_name;
            $person->save();
        }


        Session::put('messageClass', 'alert alert-success');
        session()->put('message', 'User Updated Successfully');
        return redirect('user/sellerList');
    }
    public function store(Request $request)
    {

        $rules = array(
            'first_name' => 'required|max:20|min:3',
            'last_name'  => 'required|max:20|min:3',
            'email'      => 'required|email|max:255|unique:users',
            'password'   => 'required|min:6|regex:/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}/',
            'password_confirm' => 'required|same:password',
//            'role'   => 'required',
        );
         $this->validate($request, $rules);


//            dd($request->all());

                $user = new User();
                $user->email   =$request->email;
                $user->mobile_phone      = $request->mobile_phone;
                $user->pincode_id =  $request->pincode_id;
//                 $user->city = $request->city;
                 $user->area = $request->area;
                 $user->role        = 'subadmin';
                 $user->nickname    = $request->email;
                 $user->password   = bcrypt($request->password);
                 $user->verified   = 'yes';
                 $user->save();

            $person = new Person();
            $person->user_id = $user->id;
            $person->first_name = $request->first_name;
            $person->last_name = $request->last_name;
            $person->save();

            return redirect('user/subadminList');

    }
   
}
