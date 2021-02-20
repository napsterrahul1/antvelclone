<div class="row">
	<div class="col-md-12">
		<div class="form-group">
			<div class="col-md-6 col-lg-6 ">
				{!! Form::label('first_name',trans('user.first_name')) !!}:
				<div class="input-group">
					<div class="input-group-addon"><span class="fa fa-align-justify"></span></div>
					{!! Form::text('first_name', null, ['ng-disabled'=>'disabled','class'=>'form-control']) !!}
				</div>
			</div>
			<div class="col-md-6 col-lg-6 ">
				{!! Form::label('last_name',trans('user.last_name')) !!}:
				<div class="input-group">
					<div class="input-group-addon"><span class="fa fa-align-justify"></span></div>
					{!! Form::text('last_name', null, ['ng-disabled'=>'disabled','class'=>'form-control']) !!}
				</div>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-6 col-lg-6">
				{!! Form::label('email',trans('user.email')) !!}:
				<div class="input-group">
					<div class="input-group-addon"><span class="fa fa-envelope"></span></div>
					{!! Form::email('email', $email, ['ng-disabled'=>'disabled','class'=>'form-control']) !!}
				</div>
			</div>
			<div class="col-md-6 col-lg-6">
				{!! Form::label('pnumber',trans('user.phone_number')) !!}:
				<div class="input-group">
					<div class="input-group-addon"><span class="fa fa-mobile-phone"></span></div>
					{!! Form::text('mobile_phone',null, ['ng-disabled'=>'disabled','class'=>'form-control']) !!}
				</div>
			</div>
		</div>


		<div class="form-group">
			<div class="col-md-6">
				{!! Form::label('pincode',trans('user.pincode')) !!}:
				<div class="input-group">
					<div class="input-group-addon"><span class="fa fa-map-pin"></span></div>
					<select class="form-control" name="pincode_id" id="pincode_id">
						<option>Select Pincode</option>
						@foreach($pincodes as $pincode)
							<option value="{!! $pincode->id !!}">{!! $pincode->pincode !!}</option>
						@endforeach
					</select>
				</div>
			</div>
			<div class="col-md-6">
				{!! Form::label('city',trans('user.city')) !!}:
				<div class="input-group">
					<div class="input-group-addon"><span class="fa fa-mobile-phone"></span></div>
					{!! Form::text('city',null, ['ng-disabled'=>'disabled','class'=>'form-control','id'=>'city','readonly','true']) !!}
				</div>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-12">
				{!! Form::label('area',trans('user.area')) !!}:
				<div class="input-group">
					<div class="input-group-addon"><span class="fa fa-mobile-phone"></span></div>
					{!! Form::text('area',null, ['ng-disabled'=>'disabled','class'=>'form-control']) !!}
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-6">
				{!! Form::label('password',trans('user.password')) !!}:
				<div class="input-group">
					<div class="input-group-addon"><span class="fa fa-lock"></span></div>
					{!! Form::password('password', ['class'=>'form-control']) !!}
				</div>
			</div>
			<div class="col-md-6">
				{!! Form::label('confirm_password',trans('user.confirm_password')) !!}:
				<div class="input-group">
					<div class="input-group-addon"><span class="fa fa-lock"></span></div>
					{!! Form::password('password_confirm', ['class'=>'form-control']) !!}
				</div>
			</div>
		</div>

	</div>
</div>