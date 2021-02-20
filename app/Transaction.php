<?php

namespace app;

/*
 * Antvel - Business Model
 *
 * @author  Gustavo Ocanto <gustavoocanto@gmail.com>
 */

use App\Eloquent\Model;
use App\User;

class Transaction extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'transaction';

    public static function Success($request){
        $user = User::where('email',$request->email)->first();
        $transaction = new Transaction();
        $transaction->user_id = $user->id;
        $transaction->mihpayid = $request->mihpayid;
        $transaction->status = $request->status;
        $transaction->txnid = $request->txnid;
        $transaction->amount = $request->amount;
        $transaction->productinfo = $request->productinfo;
        $transaction->email = $request->email;
        $transaction->phone = $request->phone;
        $transaction->PG_TYPE = $request->PG_TYPE;
        $transaction->name_on_card = $request->name_on_card;
        $transaction->cardnum = $request->cardnum;
        $transaction->payuMoneyId = $request->payuMoneyId;
        $transaction->discount = $request->discount;
        $transaction->net_amount_debit = $request->net_amount_debit;
        $transaction->save();

        return 1;
    }

}
