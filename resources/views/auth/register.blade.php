@extends('layouts/master')
@section('page_class') wrapper-page @stop

@section('navigation')
	&nbsp;
@stop

@include('partial.message')

@section('content')

	<div class="content_wrapper_header">
		<h3>
			<a href="{!! url('/') !!}" title="{{ trans('globals.go_back_label') }}">
				{{ trans('user.set_up_new_account') }}
			</a>
		</h3>
	</div>

<div class="content_wrapper">
	<div class="row">
		<div class="col-md-12">

				{!! Form::open(['url'=>'/register', 'class'=>'form-horizontal registration-form', 'role'=>'form']) !!}

					<div class="form-group" id="business_div" style="display:none;">
						{!! Form::label('business_name',trans('user.business_name')) !!}
						{!! Form::text('business_name', Input::old('business_name') , ['ng-disabled'=>'disabled','class'=>'form-control']) !!}
					</div>

					<div class="form-group">
						<div class="col-md-6 col-lg-6 ">
							{!! Form::label('first_name',trans('user.first_name')) !!}:
							<div class="input-group">
				      			<div class="input-group-addon"><span class="fa fa-align-justify"></span></div>
								{!! Form::text('first_name', Input::old('first_name'), ['ng-disabled'=>'disabled','class'=>'form-control']) !!}
							</div>
						</div>
						<div class="col-md-6 col-lg-6 ">
							{!! Form::label('last_name',trans('user.last_name')) !!}:
							<div class="input-group">
				      			<div class="input-group-addon"><span class="fa fa-align-justify"></span></div>
								{!! Form::text('last_name', Input::old('last_name'), ['ng-disabled'=>'disabled','class'=>'form-control']) !!}
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="col-md-12">
							{!! Form::label('email',trans('user.email')) !!}:
							<div class="input-group">
					      		<div class="input-group-addon"><span class="fa fa-envelope"></span></div>
								{!! Form::email('email', $email, ['ng-disabled'=>'disabled','class'=>'form-control']) !!}
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							{!! Form::label('pnumber',trans('user.phone_number')) !!}:
							<div class="input-group">
								<div class="input-group-addon"><span class="fa fa-mobile-phone"></span></div>
								{!! Form::text('mobile_phone',null, ['ng-disabled'=>'disabled','class'=>'form-control']) !!}
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							{!! Form::label('usertype',trans('user.user_type')) !!}:
							<div class="input-group">
								<div class="input-group-addon"><span class="fa fa-mobile-phone"></span></div>
								<select class="form-control" name="role">
									<option value="person">Buyer</option>
									<option value="business">Vender</option>
								</select>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
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
					</div>
			<div class="form-group">
				<div class="col-md-12">
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
						<div class="col-md-12">
							{!! Form::label('password',trans('user.password')) !!}:
							<div class="input-group">
						      	<div class="input-group-addon"><span class="fa fa-lock"></span></div>
								{!! Form::password('password', ['class'=>'form-control']) !!}
							</div>
						</div>
					</div>
				<div class="form-group">
						<div class="col-md-12">
							{!! Form::label('confirm_password',trans('user.confirm_password')) !!}:
							<div class="input-group">
						      	<div class="input-group-addon"><span class="fa fa-lock"></span></div>
								{!! Form::password('password_confirm', ['class'=>'form-control']) !!}
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<hr>
							<div class="btn-group" role="group">
								<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-send"></span>&nbsp;{{ trans('user.create_my_account') }}</button>
								<a style="margin-left: 20px" href="{!! url('/') !!}" class="btn btn-info"><span class="fa fa-sign-in"></span>&nbsp;{{  trans('user.sign_in_my_account') }}</a>
							</div>
						</div>
					</div>

				{!! Form::close() !!}

		</div>
	</div>
</div>
	<input type="hidden" id="base_url" value="{!! url('/') !!}">

@endsection

@section('footer')
	&nbsp;
@stop

@section('scripts')
	<script>

	$('#pincode_id').change(function () {
		var pincode_id = $('#pincode_id').val();
		var base_url = $('#base_url').val();
		$.ajax({
			dataType: 'json',
			type: 'GET',
			url: base_url + '/getcitybypincode',
			data: { pincode_id:pincode_id},
			success: function (data) {
				if(data.name){
				$('#city').val(data.name);
				$('#city').css('color','black');
				}
				else {
					alert('city not found');
				}


			}
		});

	})
	</script>
@parent

@stop