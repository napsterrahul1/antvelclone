<?php

namespace app\Http\Controllers;

use App\Configuration;
use App\Eloquent\Collection;
use App\Eloquent\Model;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Auth;

abstract class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function __construct()
    {

        $count = Configuration::where('name','visitor')->first();
        $count->value = $count->value +1;
        $count->save();
        if (Auth()->user()) {
            $verified = Auth()->user()->verified;
            $role = Auth()->user()->role;
            $type = Auth()->user()->type;
            if ($verified == 'yes') {
                if($role == 'business') {
                    if ($type == 'trusted'){
                        return redirect('user/dashboard');
                    }else{
                        return redirect('/');
                    }
                }else {
                    return redirect('user/dashboard');
                }
            }else {
                return redirect('/');
            }
        }

    }
    protected static function isAssoc($arr)
    {
        $len = count($arr);
        $keys = array_keys($arr);
        for ($i = 0; $i < $len; $i++) {
            if ($i !== $keys[$i]) {
                return true;
            }
        }

        return false;
    }

    protected function json_or_dd($data, $only_data = true)
    {
        if ($data instanceof Collection) {
            $array = $data->toArray();
        } elseif ($data instanceof Model) {
            $array = $data->toArray();
        } else {
            $array = $data;
        }
        if (\Request::wantsJson() || !env('APP_DEBUG', false)) {
            die(json_encode($array));
        }
        if ($only_data) {
            dd($array);
        }
        dd($data);
    }
}
