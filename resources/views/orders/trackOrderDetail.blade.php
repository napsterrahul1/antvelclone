@extends('layouts.master')
@section('title')@parent - {{ trans('store.OrderDetails') }}  @stop
@section('page_class') 'products_view' @stop

@section('css')
	@parent
	<style>
		input[type='radio'] {
			-webkit-appearance:none;
			width:20px;
			height:20px;
			border:1px solid darkgray;
			border-radius:50%;
			outline:none;
			box-shadow:0 0 5px 0px gray inset;
		}
		input[type='radio']:hover {
			box-shadow:0 0 5px 0px orange inset;
		}

		.img-rounded{
			height: auto !important;
		}

		input[type='radio']:before {
			content:'';
			display:block;
			width:60%;
			height:60%;
			margin: 20% auto;
			border-radius:50%;
		}
		input[type='radio']:checked:before {
			background:green;
		}
		/* Timeline */
		.timeline,
		.timeline-horizontal {
			list-style: none;
			padding: 20px;
			position: relative;
		}
		.timeline:before {
			top: 40px;
			bottom: 0;
			position: absolute;
			content: " ";
			width: 3px;
			background-color: #eeeeee;
			left: 50%;
			margin-left: -1.5px;
		}
		.timeline .timeline-item {
			margin-bottom: 20px;
			position: relative;
		}
		.timeline .timeline-item:before,
		.timeline .timeline-item:after {
			content: "";
			display: table;
		}
		.timeline .timeline-item:after {
			clear: both;
		}
		.timeline .timeline-item .timeline-badge {
			color: #fff;
			width: 60px;
			height: 60px;
			line-height: 56px;
			font-size: 22px;
			text-align: center;
			position: absolute;
			top: 18px;
			left: 50%;
			margin-left: -25px;
			background-color: #7c7c7c;
			border: 3px solid #ffffff;
			z-index: 100;
			border-top-right-radius: 50%;
			border-top-left-radius: 50%;
			border-bottom-right-radius: 50%;
			border-bottom-left-radius: 50%;
		}
		.timeline .timeline-item .timeline-badge i,
		.timeline .timeline-item .timeline-badge .fa,
		.timeline .timeline-item .timeline-badge .glyphicon {
			top: 2px;
			left: 0px;
		}
		.timeline .timeline-item .timeline-badge.primary {
			background-color: #1f9eba;
		}
		.timeline .timeline-item .timeline-badge.info {
			background-color: #5bc0de;
		}
		.timeline .timeline-item .timeline-badge.success {
			background-color: #59ba1f;
		}
		.timeline .timeline-item .timeline-badge.warning {
			background-color: #d1bd10;
		}
		.timeline .timeline-item .timeline-badge.danger {
			background-color: #ba1f1f;
		}
		.timeline .timeline-item .timeline-panel {
			position: relative;
			width: 46%;
			float: left;
			right: 16px;
			border: 1px solid #c0c0c0;
			background: #ffffff;
			border-radius: 2px;
			padding: 20px;
			-webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
			box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
		}
		.timeline .timeline-item .timeline-panel:before {
			position: absolute;
			top: 26px;
			right: -16px;
			display: inline-block;
			border-top: 16px solid transparent;
			border-left: 16px solid #c0c0c0;
			border-right: 0 solid #c0c0c0;
			border-bottom: 16px solid transparent;
			content: " ";
		}
		.timeline .timeline-item .timeline-panel .timeline-title {
			margin-top: 0;
			color: inherit;
		}
		.timeline .timeline-item .timeline-panel .timeline-body > p,
		.timeline .timeline-item .timeline-panel .timeline-body > ul {
			margin-bottom: 0;
		}
		.timeline .timeline-item .timeline-panel .timeline-body > p + p {
			margin-top: 5px;
		}
		.timeline .timeline-item:last-child:nth-child(even) {
			float: right;
		}
		.timeline .timeline-item:nth-child(even) .timeline-panel {
			float: right;
			left: 16px;
		}
		.timeline .timeline-item:nth-child(even) .timeline-panel:before {
			border-left-width: 0;
			border-right-width: 14px;
			left: -14px;
			right: auto;
		}
		.timeline-horizontal {
			list-style: none;
			position: relative;
			padding: 20px 0px 20px 0px;
			display: inline-block;
		}
		.timeline-horizontal:before {
			height: 4px;
			top: auto;
			bottom: 26px;
			left: 40px;
			right: 0;
			width: 78%;
			margin-bottom: 20px;
		}
		.timeline-horizontal .timeline-item {
			display: table-cell;
			height: 50px;
			width: 20%;
			min-width: 200px;
			float: none !important;
			padding-left: 0px;
			padding-right: 20px;
			margin: 0 auto;
			vertical-align: bottom;
		}
		.timeline-horizontal .timeline-item .timeline-panel {
			top: auto;
			bottom: 64px;
			display: inline-block;
			float: none !important;
			left: 0 !important;
			right: 0 !important;
			width: 100%;
			margin-bottom: 20px;
		}
		.timeline-horizontal .timeline-item .timeline-panel:before {
			top: auto;
			bottom: -16px;
			left: 28px !important;
			right: auto;
			border-right: 16px solid transparent !important;
			border-top: 16px solid #c0c0c0 !important;
			border-bottom: 0 solid #c0c0c0 !important;
			border-left: 16px solid transparent !important;
		}
		.timeline-horizontal .timeline-item:before,
		.timeline-horizontal .timeline-item:after {
			display: none;
		}
		.timeline-horizontal .timeline-item .timeline-badge {
			top: auto;
			bottom: 0px;
			left: 43px;
			font-size: 10px;
		}
		.change-order-track-status {
			cursor: pointer;
		}
	</style>
@stop

@include('partial.message')

@section('content')
	@parent
@section('panel_left_content')
	@include('user.partial.menu_dashboard')
@stop

@section('center_content')

	<div ng-controller="StoreProducts" ng-cloak>

		<div class="page-header">
			<h5>{{ trans('store.OrderDetails') }}
				@if($order)
				<small>&nbsp;/&nbsp;{{ trans('store.ordered_on') }}&nbsp;{{ Carbon\Carbon::parse($order->created_at)->format('F j, Y') }}</small></h5>
			@endif
		</div>
		@if($order)
		<div class="panel panel-primary">

			<div class="panel-heading">
				<h6>
					<span class=""></span>&nbsp;
					Order tracking status
				</h6>
			</div>
			<div class="panel-body">
				<div class="row">
							<input type="hidden" value="{!! $order->id !!}" id="orderid">
										<div style="display:inline-block;width:100%;overflow-y:auto;">
											<ul class="timeline timeline-horizontal">
											@if(($user->role == 'admin') || ($user->role == 'subadmin'))
												<li class="timeline-item">
													<div class="timeline-badge change-order-track-status {!! $order->order_track_status_id >= 1 ? 'success' : 'danger-red' !!}" id="1">
														Initiated<i class="glyphicon"></i>
													</div>
												</li>
												<li class="timeline-item">
													<div class="timeline-badge change-order-track-status {!! $order->order_track_status_id >= 2 ? 'success' : 'danger-red' !!}" id="2">
														Packed<i class="glyphicon"></i>
													</div>
												</li>
												<li class="timeline-item">
													<div class="timeline-badge change-order-track-status {!! $order->order_track_status_id >= 3 ? 'success' : 'danger-red' !!}" id="3">
														Dispatched<i class="glyphicon"></i>
													</div>
												</li>
												<li class="timeline-item">
													<div class="timeline-badge change-order-track-status {!! $order->order_track_status_id == 4 ? 'success' : 'danger-red' !!}" id="4">
														Delivered<i class="glyphicon"></i>
													</div>
												</li>
											 @elseif (($user->role == 'person') || ($user->role == 'business'))
													<li class="timeline-item">
														<div class="timeline-badge {!! $order->order_track_status_id >= 1 ? 'success' : 'danger-red' !!}">
															Initiated<i class="glyphicon"></i>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge {!! $order->order_track_status_id >= 2 ? 'success' : 'danger-red' !!}">
															Packed<i class="glyphicon"></i>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge {!! $order->order_track_status_id >= 3 ? 'success' : 'danger-red' !!}">
															Dispatched<i class="glyphicon"></i>
														</div>
													</li>
													<li class="timeline-item">
														<div class="timeline-badge {!! $order->order_track_status_id == 4 ? 'success' : 'danger-red' !!}">
															Delivered<i class="glyphicon"></i>
														</div>
													</li>
											  @endif
											</ul>
										</div>

				</div>

			</div> {{-- detail panel-body --}}

			<div class="panel-footer">
				@if(($user->role == 'admin') || ($user->role == 'subadmin'))
					<strong>This product Order is {!! $order->order_track_status !!} </strong>
				@elseif (($user->role == 'person') || ($user->role == 'business'))
					<strong>Your Order is {!! $order->order_track_status !!}</strong>
				@endif
			</div>

		</div> {{-- detail panel-default --}}

		<div class="panel panel-default">
			<div class="panel-body" style="font-size: 12px; color: #000;">

				<div class="row">
					<div class="col-md-6">
						<label>
							<strong>
								{{ trans('store.view_address') }}
							</strong>
						</label>
						<div>


							{{ $orderAddress->name_contact }},&nbsp;{{ $orderAddress->line1 }}
							@if (trim($orderAddress->line2)!='')
								<span>,{{ $orderAddress->line2 }}</span>
							@endif


							{{ $orderAddress->city .','. $orderAddress->state }}, &nbsp;{{ $orderAddress->country }}<br>

							{{ trans('store.order_phone_num') }}:&nbsp;{{ $orderAddress->phone }}

						</div>

						@if ($order->rate)
							<div>
								<label>{{ trans('store.order_rating_value') }}:</label>&nbsp;
								{{ isset($order->rate) ? Utility::showRate($order->rate) : '' }}
							</div>
						@endif
					</div>

					<div class="col-md-6">
						<label>
							<strong>
								{{ trans('store.order_summary') }}
							</strong>
						</label>

						<div>{{ trans('store.status') }}:&nbsp;<strong>{{ $order->status }}</strong></div>
						<div>{{ trans('store.num_of_items') }}:&nbsp;<strong>{{ $totalItems.' '.trans('store.items') }}</strong></div>
						<div>Pyment Mode :&nbsp;<strong>{{ ($order->pay_mode = 'cod' || $order->pay_mode = '') ? 'Cash on Delivery' : 'online payment'}}</strong></div>

						<label>
							<strong>
								<div>{{ trans('store.grand_total') }}:&nbsp;{{ Utility::showPrice($grandTotal) }}</div>
							</strong>
						</label>

					</div>
				</div>
			</div>
		</div>

		<div class="row collapse" id="comments_panel">
			<div class="col-md-12">
				<div class="page-header">
					<h5><span class="glyphicon glyphicon-comment"></span>&nbsp;{{ trans('store.order_comments') }}</h5>
				</div>
				<div>
					@include('orders.partial.comments', ['order' => $order, 'comments' => $order_comments])
				</div>
			</div>
		</div>

		<div class="panel panel-primary">

			<div class="panel-heading">
				<h6>
					<span class="glyphicon glyphicon-folder-open"></span>&nbsp;
					{{ trans('store.order_items') }}
				</h6>
			</div>

			<div class="panel-body">

				<div class="row">

					<div class="col-md-12">

						<div class="row ng-hide hidden-xs">
							<div class="col-md-9">
								&nbsp;
							</div>
							<div class="col-md-1 text-center">
								<h6>{{ trans('store.quantity') }}</h6>
							</div>
							<div class="col-md-1 text-center">
								<h6>{{ trans('store.price') }}</h6>
							</div>
							<div class="col-md-1">&nbsp;</div>
						</div>

						<hr/>

						@foreach ($order->details as $detail)

							<div class="row">

								<div class="row">
									<div class="col-md-2 col-xs-4 text-center">
										<img  class="img-rounded" src='{{ \App\Helpers\Utility::getStoragePath() . $detail->product->features['images'][0] }}' alt="{{ $detail->product->name }}" width="90" height="90">
									</div>

									<div class="col-md-7 col-xs-8">
										<h6>
											<a>{{ $detail->product->name }}</a>
											@if ($detail->rate)
												<br>
												<small>
													<label>{{ trans('store.order_rating_value') }}:</label>&nbsp;
													{{ Utility::showRate($detail->rate) }}
												</small>
											@endif
										</h6>

										@if(isset($is_buyer) && $detail->product->type != 'item')
											<p> {{ $detail->product->type }}
												{{ trans('product.globals.digital_item') }}

												@if ($detail->product->type == 'key')

													<span>{{ ' '.trans('product.globals.key') }}</span>
													@if ($detail->product->status == '0')
														<a href="javascript:void(0)" ng-controller="ModalCtrl" ng-init="data={'data':'{{ $detail->product->id }}','order':'{{ $order->id }}'}" ng-click="modalOpen({templateUrl:'{!! url('user/modalSeeKeysPurchased') !!}',controller:'seeKeysPurchased',resolve:'data'})">
															{{ trans('product.globals.see_keys') }}
														</a>
													@endif

												@elseif ($detail->product->type == 'software_key')

													<span>{{ ' '.trans('product.controller.software_key') }}</span>

												@elseif ($detail->product->type == 'software')

													<span>{{ ' '.trans('product.globals.software') }}</span>

												@elseif ($detail->product->type == 'gift_card')

													<span>{{ ' '.trans('product.controller.gift_card') }}</span>

												@endif
											</p>
										@endif
									</div>

									<div class="col-md-1 col-xs-8 pull-xs-right text-right">
										<label>Quantity</label>
										<span class="visible-xs-inline">{{ trans('store.quantity') }}</span>&nbsp;<strong>{{ $detail->quantity }}</strong>
									</div>

									<div class="col-md-1 col-xs-8 pull-xs-right text-right">
										<label>Rate</label>
										<span class="visible-xs-inline">{{ trans('store.price') }}</span>&nbsp;<strong>{{ Utility::showPrice($detail->price) }}</strong>
									</div>

									@if(isset($is_seller) && $detail->product->type != 'item' && $order->status == 'pending')
										<div class="col-md-1 text-right">
											<a class="btn btn-info btn-sm" href="javascript: void(0)" ng-click="delivery('{{ $order->id }}', '{{ $detail->product->id }}')">{{ trans('store.delivery') }}</a>
											<span ng-show="detail.status=='0'">{{ trans('store.dispatched') }}</span>
										</div>
									@else
										<div class="col-md-1">&nbsp;</div>
									@endif

								</div>

								<hr/>

							</div>

						@endforeach

					</div>

				</div>

			</div> {{-- detail panel-body --}}

			<div class="panel-footer">
				<strong>{{ trans('store.grand_total') }}:</strong>&nbsp;{{ $totalItems.' '.trans('store.items') }},
				&nbsp;
				<strong>{{ Utility::showPrice($grandTotal) }}</strong>
			</div>

		</div> {{-- detail panel-default --}}
			@else
			<div style="color: red">Order not found</div>
@endif
	</div> {{-- controller --}}

@endsection
@stop

@section('scripts')
	@parent
	<script>
		(function(app){
			$('.change-order-track-status').click(function () {
				var order_track_status_id = $(this).attr('id');
				var orderid = $('#orderid').val();
				window.location = base_url + '/changeOrderTrackSatus/' + orderid + '/' + order_track_status_id;
			});
			app.controller('RateOrdersControllerModal', ['$scope', '$rootScope', '$http', '$modalInstance', '$window', function($scope, $rootScope, $http, $modalInstance, $window)
			{
				$scope.message = '';
				$scope.messageClass = '';
				$scope.urlShow = '{{ action("ProductsController@show", "productId") }}';
				$scope.busissnes = {};
				$scope.ratingOrdItems = {};
				$scope.noRate = false;

				$scope.rateSeller = function(order_id)
				{
					$scope.isDisabled = true;
					$sent_data = {};
					$sent_data.order_id = order_id;
					$sent_data.seller_rate = $scope.busissnes.rate_val;
					$sent_data.seller_comment = $scope.busissnes.comment;
					$http.post(base_url + '/user/rates/seller', $sent_data).
					success(function(data, status)
					{
						if (data.success)
						{
							$scope.messageClass = 'alert-success';
						}
						else
						{
							$scope.messageClass = 'alert-danger';
						}

						$scope.message = data.message;

						$modalInstance.close();
						$window.location.href = "{{ route('orders.show_orders') }}";
					});
				};

				$scope.rateProduct = function(detail_id, product_id)
				{
					messageBox = '';
					$sent_data = {};
					$scope.isDisabled = true;
					$('#btn_'+product_id).attr("disabled", true);
					$sent_data.detail_id = detail_id;
					$sent_data.product_rate = $('#rate_'+product_id).attr('aria-valuenow');
					$sent_data.product_comment = $('#comment_'+product_id).val();
					$http.post(base_url + '/user/rates/product', $sent_data).
					success(function(data, status)
					{
						if (data.success)
						{
							$scope.messageClass = 'alert-success';

						}
						else
						{
							$scope.messageClass = 'alert-danger';
						}

						$scope.message = data.message;
						$scope.isDisabled = false;
					});
				};
			}]);

			app.controller('StoreProducts', ['$scope','$http','notify', function($scope, $http, notify)
			{
				$scope.delivery=function(orderId,productId){
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