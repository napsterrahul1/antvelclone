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
        <div class="row">
            <div class="col-lg-10">
                <h5>{{ trans('user.buyer') }}</h5>
            </div>
            {{--<div class="col-lg-2">--}}
                {{--<a class="btn btn-primary btn-sm pull-right" href="{{ url('user/create') }}">--}}
                    {{--<span class="glyphicon glyphicon-plus"></span>&nbsp;--}}
                    {{--Add a new User--}}
                {{--</a>--}}
            {{--</div>--}}
        </div>
    </div>
    <div ng-controller="Orders">

        <div class="">
            <table class="table table-striped table-bordered datatable" id="buyer_list" style="margin-right:5px;">
                <thead>
                <tr>
                    <th style="">Sr. No.</th>
                    <th style="">Name</th>
                    <th>Email</th>
                    <th>Mobile Number</th>
                    <th>Email-Verified</th>
                    <th>Action</th>

                </tr>
                </thead>
                <tbody>
                <?php $t=1 ?>
                @foreach($buyerList as $buyer)

                <tr>
                    <td>{{ $t++ }}</td>
                    <td>{{ $buyer->person->first_name }} {{ $buyer->person->last_name }}</td>
                    <td>{{ $buyer->email }}</td>
                    <td>{{ $buyer->mobile_phone }}</td>
                    <td style="text-transform: capitalize">{{ $buyer->verified }}</td>
                    <td>
                        <a href="{{ url('user/'.$buyer->id.'/edit') }}" class="btn btn-info">Edit</a>
                        @if(Auth::user()->role != 'subadmin')
                    @if($buyer->verified == 'no')
                          <a href="{{ url('user/buyer/enable/'.$buyer->id) }}" class="btn btn-success">Enable</a>
                        @else

                        <a href="{{ url('user/buyer/disable/'.$buyer->id) }}" class="btn btn-danger">Disable</a>
                            @endif
                        @endif
                    </td>
                </tr>
                    @endforeach
                </tbody>

            </table>

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