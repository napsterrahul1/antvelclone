<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Person;
use App\Pincode;
use App\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use Mail;
use Session;
class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */
    use RegistersUsers;

    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Show the registration form.
     *
     * @return void
     */
    public function showRegistrationForm()
    {
        $pincodes = Pincode::all();
        return view('auth.register', [
            'email' => session()->has('email') ? session()->get('email') : '',
            'pincodes' => $pincodes
        ]);
    }

    /**
     * Process the user registration.
     *
     * @return void
     */
    public function register(Request $request)
    {
        $this->validate($request, $this->rules());

        $user = $this->createUser($request->all());

        $this->sendRegistrationEmail($request->all(),$user->id);

//        auth()->login($user);

        return redirect($this->redirectTo);
    }

    /**
     * Return the registration validation rules.
     *
     * @return array
     */
    protected function rules()
    {
        return [
            'first_name' => 'required|max:20|min:3',
            'last_name'  => 'required|max:20|min:3',
            'email'      => 'required|email|max:255|unique:users',
            'password'   => 'required|min:6|regex:/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}/',
            'password_confirm' => 'required|same:password',
            'role'   => 'required',
//            'city'   => 'required',
        ];

    }

    /**
     * Create a new user.
     *
     * @param array $data
     *
     * @return User
     */
    protected function createUser(array $data)
    {
        $user = User::create([
            'email'       => $data['email'],
            'mobile_phone'       => $data['mobile_phone'],
            'pincode_id' =>$data['pincode_id'],
//            'city' =>$data['city'],
            'area' =>$data['area'],
            'role'        => $data['role'],
            'nickname'    => $data['email'],
            'password'    => bcrypt($data['password']),
        ]);

        Person::create([
            'user_id'    => $user->id,
            'first_name' => $data['first_name'],
            'last_name'  => $data['last_name'],
        ]);

        return $user;
    }

    /**
     * Send the registration email.
     *
     * @param array $data
     *
     * @return void
     */
    protected function sendRegistrationEmail(array $data,$userid)
    {

        $title = trans('user.emails.verification_account.subject');

        $name = $data['first_name'].' '.$data['last_name'];
        $data['userid'] = $userid;
        Session::put('data',$data);
        
      Mail::send('emails.accountVerification',$data, function ($message) use ($data) {
            $message->to($data['email'])->subject(trans('user.emails.verification_account.subject'));
            $message->from(getenv('MAIL_USERNAME'));
            $message->replyTo('noreply@gmail.com');
        });

        session()->put('message', trans('user.signUp_message', ['_name' => $name]));

        session()->save();
    }
}
