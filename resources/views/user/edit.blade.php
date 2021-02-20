@extends('layouts.master')
@section('title')@parent - {{ trans('user.your_sales') }} @stop
@section('page_class') 'products_view' @stop

@include('partial.message')

@section('css')
	@parent
@stop
@section('content')

	@parent
@section('panel_left_content')
	@include('user.partial.menu_dashboard')
@stop
@section('center_content')

	<div class="page-header">
		<h5>Edit user : - {!! $persons ? $persons->first_name: '' !!} {!! $persons ? $persons->last_name : '' !!}</h5>
	</div>
	<div ng-controller="Orders">

		<div class="">


			<div class="panel">
				<form method="post" action="{!! url('user/updateuser') !!}" novalidate>
					{!! csrf_field() !!}
					<div class="modal-header">
						Edit Your Details
					</div>
					<div class="panel-body" stop-event="touchend">
						<div class="container-fluid">
							<input type="hidden" name="newAddress._method" value="PUT". ng-model="_method">
							@include('user.partial.edit', ['user' => $user,'persons'=>$persons])
						</div>
					</div>
					<div class="panel-footer">

						<button class="btn btn-danger btn-sm" type="button" ng-click="$close(false)" >
							<span class="glyphicon glyphicon-remove"></span>&nbsp;
							{{ trans('globals.cancel') }}
						</button>

						<button class="btn btn-success btn-sm" type="submit">
							<span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;
							Save user
						</button>

					</div>
				</form>
			</div>

		</div><!-- /.tabbable -->

	</div> {{-- angularjs controller --}}
@stop
@stop

@section('scripts')
	@parent
	<script>
		(function(app){
			app.controller('Orders', ['$scope','$rootScope','$http','notify', function($scope,$rootScope,$http,notify){

				$scope.delivery = function(orderId,productId)
				{
					if (!productId || !orderId) return;
					$http.get('/virtualDelivery/'+orderId+'/'+productId+'/').success( function(data) {
						var messageClass='alert-danger';
						if (data.success){
							messageClass='alert-success';
							setTimeout(function(){ location.reload(); }, 3000);
						}
						notify({message:data.message,classes:messageClass});
					});
				}
			}]);

		})(angular.module("AntVel"));
	</script>
@stop






