<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

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
        $this->middleware('guest', ['except' => 'logout']);
    }

    /**
     * Process the user login.
     *
     * @param Request $request
     *
     * @return void
     */
    public function login(Request $request)
    {
        if ($request->input('newuser')) {
            session()->flash('email', $request->input('email'));

            return redirect('/register');
        }

        return $this->handle($request);
    }

    /**
     * Handle the user login.
     *
     * @param Request $request
     *
     * @return void
     */
    protected function handle(Request $request)
    {
        $this->validate($request, $this->rules());
        if (auth()->attempt($this->credentials($request), $request->has('remember'))) {
            $verified = Auth()->user()->verified;
            $role = Auth()->user()->role;
            $type = Auth()->user()->type;
            if ($verified == 'yes') {
                if($role == 'business') {
                    if ($type == 'trusted'){
                        return redirect('user/dashboard');
                    }else{
                        $request->session()->flush();
                        return redirect('/')->withErrors(['email' => 'Your Account is verified and send for Approval',
                        ]);
                    }
                }else {
                    return redirect('user/dashboard');
                }
            }else {
                $request->session()->flush();
                return redirect('/')->withErrors(['email' => 'Your Account is not verified',
                ]);
            }
        }
        return redirect('/')
            ->withInput($request->only('email', 'remember'))
            ->withErrors([
                'email' => 'Enter Email and Password Does not Match',
//                'email' => $this->getFailedLoginMessage(),
            ]);
    }

    /**
     * Return the login validation rules.
     *
     * @return array
     */
    protected function rules()
    {
        $rules = [
            'email'    => 'required|email',
            'password' => 'required',
        ];

        if (!env('APP_DEBUG')) {
            $rules['g-recaptcha-response'] = 'required|recaptcha';
        }

        return $rules;
    }

    /**
     * Return the user credentials.
     *
     * @param Request $request
     *
     * @return array
     */
    protected function credentials(Request $request)
    {
        return [
            'email'    => $request->email,
            'password' => $request->password,
        ];
    }
}
