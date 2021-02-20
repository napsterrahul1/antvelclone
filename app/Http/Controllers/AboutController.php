<?php

namespace app\Http\Controllers;

/*
 * Antvel - Company CMS Controller
 *
 * @author  Gustavo Ocanto <gustavoocanto@gmail.com>
 */

use App\Company;
use App\Http\Controllers\Controller;
use App\Http\Requests\ContactFormRequest;

class AboutController extends Controller
{
    public function create()
    {
        $kind_of_request = ['contact' => trans('company.contact'),
                    'sales'           => trans('company.sales'),
                    'support'         => trans('company.support'), ];

        $panel = ['center' => ['width' => '12']];

        return view('about.contact', compact('panel', 'kind_of_request'));
    }
    public function contact()
    {
        $kind_of_request = ['contact' => trans('company.contact'),
                    'sales'           => trans('company.sales'),
                    'support'         => trans('company.support'), ];

        $panel = ['center' => ['width' => '12']];

        return view('about.contactus', compact('panel', 'kind_of_request'));
    }

    public function store(ContactFormRequest $request)
    {
        $company = Company::select('contact_email',
                                  'sales_email',
                                  'support_email',
                                  'website_name')
                         ->find(1)
                         ->toArray();

        $from_address = $company[$request->get('type_of_request').'_email'];
        $name = $request->get('name');
        $email = $request->get('email');
        $number = $request->get('number');
        $message_ = $request->get('message');
        $title = trans('company.email_title_'.$request->get('type_of_request'));
        $thanks = trans('company.email_thanks_'.$request->get('type_of_request'));

        return view('emails.contact', compact('thanks', 'title', 'name', 'email', 'message_','number'));

        \Mail::send('emails.contact', compact('thanks', 'title', 'name', 'email', 'message_','number'),
            function ($message) use ($request, $company, $from_address, $email) {
                $message->from($from_address, $company['website_name']);
                $message->to($email)
                        ->cc($from_address)
                        ->subject(trans('about.contact').' :: '.$company['website_name']);
            });

        return \Redirect::route('contact')->with('message', $thanks);
    }

    public function about($tab = 'about')
    {
        return view('about.aboutus', compact('tab'));
    }

    public function refunds()
    {
        $tab = 'refund';
        return view('about.index', compact('tab'));
    }

    public function privacy()
    {
        $tab = 'privacy';
        return view('about.privacy_policies');
    }

    public function terms()
    {
        $tab = 'terms';
        return view('about.termsAndConditions', compact('tab'));
    }
    public function otherPolicies()
    {
        return view('about.other_policies');
    }
    public function userAgreement()
    {
        return view('about.user_agreement');
    }
}
