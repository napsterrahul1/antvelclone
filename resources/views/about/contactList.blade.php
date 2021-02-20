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
            {{--@if ((\Auth::user()->role == 'admin') || (\Auth::user()->role == 'subadmin'))--}}
                {{--<h5>{{ trans('user.all_orders') }}</h5>--}}
            {{--@elseif((\Auth::user()->role == 'business'))--}}
                {{--<h5>{{ trans('user.your_sales') }}</h5>--}}
            {{--@else--}}
                <h5>Contact-Us list</h5>
            {{--@endif--}}
        </div>

        {{--@include('orders.partial.filterInputs', ['filter' => $dateFrom.'*'.$dateTo])--}}

        <div ng-controller="Orders">

            <div class="tabbable">
                <ul class="nav nav-tabs hidden-xs">
                    <li class="{{ $select == 'open' || $select == '' ? 'active' : '' }}"><a href="#pane1" data-toggle="tab">{{ trans('store.enquiry') }}&nbsp;<span class="badge colorred">{{ count($contactUsEnquiry) }}</span></a></li>
                     <li class="{{ $select == 'rate' ? 'active' : '' }}"><a href="#pane4" data-toggle="tab">{{ trans('store.feedback') }}&nbsp;<span class="badge colorred">{{ count($contactUsFeedback) }}</span></a></li>
                    <li class="{{ $select == 'closed' ? 'active' : '' }}"><a href="#pane2" data-toggle="tab">{{ trans('store.complaints') }} <span class="badge colorred"> {{ count($contactUsComplaints) }}</span></a></li>
                    <li class="{{ $select == 'canceled' ? 'active' : '' }}"><a href="#pane3" data-toggle="tab">{{ trans('store.reviews') }} <span class="badge colorred">{{ count($contactUsReviews) }}</span></a></li>
                </ul>
                <div class="visible-xs-block">
                    <a href="#pane1" data-toggle="tab">{{ trans('store.enquiry') }}&nbsp;<span class="badge colorred">{{ count($contactUsEnquiry) }}</span></a> -
                    <a href="#pane4" data-toggle="tab">{{ trans('store.feedback') }}&nbsp;<span class="badge colorred">{{ count($contactUsFeedback) }}</span></a> -
                    <a href="#pane2" data-toggle="tab">{{ trans('store.complaints') }} <span class="badge colorred"> {{ count($contactUsComplaints) }}</span></a> -
                    <a href="#pane3" data-toggle="tab">{{ trans('store.reviews') }} <span class="badge colorred">{{ count($contactUsReviews) }}</span></a>
                </div>

                <div class="row">
                    &nbsp;
                </div>

                <div class="tab-content">

                    {{-- pending orders --}}
                    <div id="pane1" class="tab-pane fade {{ $select == 'open' || $select == ''?'in active':'' }}">
                        @if (count($contactUsEnquiry) > 0)
                            <div class="row">
                                <div class="col-lg-12">
                                    <table class="table table-hover table-responsive">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Name</th>
                                                <th class="text-center">Email</th>
                                                <th class="text-center">Number</th>
                                                <th class="text-center">Message</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($contactUsEnquiry as $order)
<!--                                            --><?php //$total = \Utility::totalOrder($order->details); ?>
                                            <tr>
                                                <td class="text-center">{!! $order->name !!}</td>
                                                <td class="text-center">{!! $order->email !!}</td>
                                                <td class="text-center">{!! $order->number !!}</td>
                                                <td class="text-center">{!! $order->message !!}</td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    {{--{!! $contactUsEnquiry->appends(['show' => 'open', 'filter' => $dateFrom.'*'.$dateTo])->render() !!}--}}
                                </div>
                            </div>
                        @else
                            <div class="row">
                                <div class="col-lg-12">
                                    <h6 class="alert-danger jumbotron">
                                        <span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;
                                        There is no Enquiry!
                                    </h6>
                                </div>
                            </div>
                        @endif
                    </div>

                    {{-- closed orders --}}
                    <div id="pane2" class="tab-pane fade {{ $select=='closed'?'in active':'' }}">
                        @if (count($contactUsComplaints) > 0)
                            <div class="row">
                                <div class="col-lg-12">
                                    <table class="table table-hover table-responsive">
                                        <thead>
                                        <tr>
                                            <th class="text-center">Name</th>
                                            <th class="text-center">Email</th>
                                            <th class="text-center">Number</th>
                                            <th class="text-center">Message</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach ($contactUsComplaints as $order)
                                        <!--                                            --><?php //$total = \Utility::totalOrder($order->details); ?>
                                        <tr>
                                            <td class="text-center">{!! $order->name !!}</td>
                                            <td class="text-center">{!! $order->email !!}</td>
                                            <td class="text-center">{!! $order->number !!}</td>
                                            <td class="text-center">{!! $order->message !!}</td>
                                        </tr>
                                        @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    {{--{!! $contactUsFeedback->appends(['show'=>'closed', 'filter' => $dateFrom.'|'.$dateTo])->render() !!}--}}
                                </div>
                            </div>
                        @else
                            <div class="row">
                                <div class="col-lg-12">
                                    <h6 class="alert-danger jumbotron">
                                        <span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;
                                        There is no Complaint!
                                    </h6>
                                </div>
                            </div>
                        @endif
                    </div>

                    {{-- cancelled orders --}}
                    <div id="pane3" class="tab-pane fade {{ $select=='canceled'?'in active':'' }}">
                        @if (count($contactUsReviews) > 0)
                            <div class="row">
                                <div class="col-lg-12">
                                    <table class="table table-hover table-responsive">
                                        <thead>
                                        <tr>
                                            <th class="text-center">Name</th>
                                            <th class="text-center">Email</th>
                                            <th class="text-center">Number</th>
                                            <th class="text-center">Message</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach ($contactUsReviews as $order)
                                        <!--                                            --><?php //$total = \Utility::totalOrder($order->details); ?>
                                        <tr>
                                            <td class="text-center">{!! $order->name !!}</td>
                                            <td class="text-center">{!! $order->email !!}</td>
                                            <td class="text-center">{!! $order->number !!}</td>
                                            <td class="text-center">{!! $order->message !!}</td>
                                        </tr>
                                        @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                {{--<div class="col-lg-12">--}}
                                    {{--{!! $contactUsComplaints->appends(['show'=>'canceled', 'filter' => $dateFrom.'|'.$dateTo])->render() !!}--}}
                                {{--</div>--}}
                            </div>
                        @else
                            <div class="row">
                                <div class="col-lg-12">
                                    <h6 class="alert-danger jumbotron">
                                        <span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;
                                        There is no Review!
                                    </h6>
                                </div>
                            </div>
                        @endif
                    </div>

                    {{-- rate products --}}
                    <div id="pane4" class="tab-pane fade {{ $select=='rate'?'in active':'' }}">
                        @if (count($contactUsFeedback) > 0)
                            <div class="row">
                                <div class="col-lg-12">
                                    <table class="table table-hover table-responsive">
                                        <thead>
                                        <tr>
                                            <th class="text-center">Name</th>
                                            <th class="text-center">Email</th>
                                            <th class="text-center">Number</th>
                                            <th class="text-center">Message</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach ($contactUsFeedback as $order)
                                                <!--                                            --><?php //$total = \Utility::totalOrder($order->details); ?>
                                        <tr>
                                            <td class="text-center">{!! $order->name !!}</td>
                                            <td class="text-center">{!! $order->email !!}</td>
                                            <td class="text-center">{!! $order->number !!}</td>
                                            <td class="text-center">{!! $order->message !!}</td>
                                        </tr>
                                        @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    {{--{!! $contactUsReviews->appends(['show'=>'rate', 'filter' => $dateFrom.'|'.$dateTo])->render() !!}--}}
                                </div>
                            </div>
                        @else
                            <div class="row">
                                <div class="col-lg-12">
                                    <h6 class="alert-danger jumbotron">
                                        <span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;
                                        There is no Feedback!
                                    </h6>
                                </div>
                            </div>
                        @endif
                    </div>

                </div><!-- /.tab-content -->
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