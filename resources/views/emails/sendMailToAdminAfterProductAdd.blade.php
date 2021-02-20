@extends('emails.template')
@section('content')
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="2" style="font-family:Verdana, Geneva, sans-serif; font-size:12px; text-align:left">
    <tr><td>&nbsp;</td></tr>
    <?php $data = Session::get('data'); ?>
    <tr>
        <td align="left">
            {{ $data['message'] }}
        </td>
    </tr>
    <tr>
        <td align="left">
            reply at
                <a href="mailto:{{ $main_company['support_email'] }}">{{ $main_company['support_email'] }}</a>
            {{ trans('user.emails.verification_account.msg_04') }}
        </td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td align="left">
           {{ trans('user.emails.verification_account.msg_05') }}
        </td>
    </tr>
</table>
@endsection