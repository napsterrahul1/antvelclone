<div class="row">

    <div class="col-lg-2 text-right">
        {!! Form::label('nickname','FIrst Name'.':') !!}
    </div>
<input type="hidden" name="userid" value="{!! $user->id !!}">
    <div class="col-lg-4">
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon input-sm"><span class="glyphicon glyphicon-user"></span></div>
                @if (isset($persons))
                    {!! Form::text('first_name', $persons ? $persons->first_name : null, ['id'=>'first_name','class'=>'form-control input-sm', 'required'=>'required', 'ng-init' => '_user.first_name = "'.$persons->first_name.'" ', 'ng-model'=>'_user.first_name']) !!}
                @else
                    {!! Form::text('first_name', null, ['id'=>'first_name','class'=>'form-control input-sm', 'required'=>'required', 'ng-model'=>'_user.first_name']) !!}
                @endif
            </div>
            <xt-validation-inline for="first_name"></xt-validation-inline>
        </div>
    </div>

    <div class="col-lg-2 text-right">
        {!! Form::label('nickname','Last Name'.':') !!}
    </div>

    <div class="col-lg-4">
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon input-sm"><span class="glyphicon glyphicon-user"></span></div>
                @if (isset($persons))
                    {!! Form::text('last_name', $persons ? $persons->last_name : null, ['id'=>'last_name','class'=>'form-control input-sm', 'required'=>'required', 'ng-init' => '_user.last_name = "'. $persons->last_name.'" ', 'ng-model'=>'_user.last_name']) !!}
                @else
                    {!! Form::text('last_name', null, ['id'=>'last_name','class'=>'form-control input-sm', 'required'=>'required', 'ng-model'=>'_user.last_name']) !!}
                @endif
            </div>
            <xt-validation-inline for="last_name"></xt-validation-inline>
        </div>
    </div>

    <div class="col-lg-2 text-right">
        {!! Form::label('nickname','Area'.':') !!}
    </div>

    <div class="col-lg-4">
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon input-sm"><span class="glyphicon glyphicon-user"></span></div>
                @if (isset($user))
                    {!! Form::text('area', $user->area ? $user->area : null, ['id'=>'area','class'=>'form-control input-sm', 'required'=>'required', 'ng-init' => '_user.area = "'.$user->area.'" ', 'ng-model'=>'_user.area']) !!}
               @endif
            </div>
            <xt-validation-inline for="area"></xt-validation-inline>
        </div>
    </div>

    <div class="col-lg-2 text-right">
        {!! Form::label('email','Email'.':') !!}
    </div>

    <div class="col-lg-4">
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon input-sm"><span class="glyphicon glyphicon-map-marker"></span></div>
                @if (isset($user))
                    {!! Form::text('email', $user->email ? $user->email : null, ['style'=>'color:black','id'=>'email','class'=>'form-control input-sm', 'required'=>'required', 'ng-init' => '_user.email = "'.$user->email.'" ', 'ng-model'=>'_user.email','readonly'=>'true']) !!}
                @else
                    {!! Form::text('email', null, ['id'=>'email','class'=>'form-control input-sm', 'required'=>'required', 'ng-model'=>'_user.email']) !!}
                @endif
            </div>
            <xt-validation-inline for="email"></xt-validation-inline>
        </div>
    </div>

</div>



<div class="row">

    <div class="col-lg-2 text-right">
        {!! Form::label('role', 'Role'.':') !!}
    </div>

    <div class="col-lg-4">
        <div class="form-group">
            @if (isset($user))
                <select name="role" id="role" class="form-control input-sm" ng-init = "_address.role = '{{ isset($user) ? $user->role : '' }}' " >
                    <option value="admin" <?= $user->role == 'admin' ? ' selected="selected"' : '';?>>Admin</option>
                    <option value="subadmin" <?= $user->role == 'subadmin' ? ' selected="selected"' : '';?>>SubAdmin</option>
                    <option value="person" <?= $user->role == 'person' ? ' selected="selected"' : '';?>>Person</option>
                    <option value="business" <?= $user->role == 'business' ? ' selected="selected"' : '';?>>Business</option>
                </select>
            @endif
            <xt-validation-inline for="country"></xt-validation-inline>
        </div>
    </div>

    <div class="col-lg-2 text-right">
        {!! Form::label('type', 'Type'.':') !!}
    </div>

    <div class="col-lg-4">
        <div class="form-group">
            @if (isset($user))
                <select name="type" id="type" class="form-control input-sm" ng-init = "_user.type = '{{ isset($user) ? $user->type : '' }}' " ng-model = "_user.type">
                    <option value="trusted" <?= $user->type == 'trusted' ? ' selected="selected"' : '';?>>trusted</option>
                    <option value="normal" <?= $user->type == 'normal' ? ' selected="selected"' : '';?>>normal</option>
                </select>
            @endif
            <xt-validation-inline for="country"></xt-validation-inline>
        </div>
    </div>

</div>



<div class="row">

    <div class="col-lg-2 text-right">
        {!! Form::label('verified', 'Verified'.':') !!}
    </div>

    <div class="col-lg-4">
        <div class="form-group">
            @if (isset($user))
                <select name="verified" id="verified" class="form-control input-sm" ng-init = "_user.verified = '{{ isset($user) ? $user->verified : '' }}' " ng-model = "_address.country">
                    <option value="yes" <?= $user->verified == 'yes' ? ' selected="selected"' : '';?>>Yes</option>
                    <option value="no" <?= $user->verified == 'no' ? ' selected="selected"' : '';?>>No</option>
                </select>
            @endif
            <xt-validation-inline for="verified"></xt-validation-inline>
        </div>
    </div>

    <div class="col-lg-2 text-right">
        {!! Form::label('phone','Phone'.':') !!}
    </div>

    <div class="col-lg-4">
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon input-sm"><span class="glyphicon glyphicon-map-marker"></span></div>
                @if (isset($user))
                    {!! Form::text('mobile_phone', $user->mobile_phone, ['id'=>'mobile_phone','class'=>'form-control input-sm', 'required'=>'required', 'ng-init' => '_user.mobile_phone = "'.$user->mobile_phone.'" ', 'ng-model'=>'_user.mobile_phone']) !!}
                @endif
            </div>
            <xt-validation-inline for="mobile_phone"></xt-validation-inline>
        </div>
    </div>

</div>

<div class="row">

    <div class="col-lg-2 text-right">
        {!! Form::label('twitter','Twitter'.':') !!}
    </div>

    <div class="col-lg-4">
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon input-sm"><span class="glyphicon glyphicon-user"></span></div>
                @if (isset($user))
                    {!! Form::text('twitter', $user->twitter, ['id'=>'twitter','class'=>'form-control input-sm', 'required'=>'required', 'ng-init' => '_address.nickname = "'.$user->twitter.'" ', 'ng-model'=>'_address.nickname']) !!}
               @endif
            </div>
            <xt-validation-inline for="nickname"></xt-validation-inline>
        </div>
    </div>

    <div class="col-lg-2 text-right">
        {!! Form::label('facebook','Facebook'.':') !!}
    </div>

    <div class="col-lg-4">
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon input-sm"><span class="glyphicon glyphicon-map-marker"></span></div>
                @if (isset($user))
                    {!! Form::text('facebook', $user->facebook, ['id'=>'facebook','class'=>'form-control input-sm', 'required'=>'required', 'ng-init' => '_address.line1 = "'.$user->facebook.'" ', 'ng-model'=>'_address.line1']) !!}
                @endif
            </div>
            <xt-validation-inline for="email"></xt-validation-inline>
        </div>
    </div>

</div>



