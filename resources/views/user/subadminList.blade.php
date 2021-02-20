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
            <h5>{{ trans('user.subadminList') }}</h5>
        </div>
        <div class="col-lg-2">
            <a class="btn btn-primary btn-sm pull-right" href="{{ url('user/create') }}">
                <span class="glyphicon glyphicon-plus"></span>&nbsp;
               Add a new Subadmin
            </a>
        </div>
         </div>
    </div>
    <div ng-controller="Orders">

        <div class="tabbable">
            <table class="table table-striped table-bordered datatable" id="buyer_list" style="margin-right:5px;">
                <thead>
                <tr>
                    <th style="">Sr. No.</th>
                    <th style="">Name</th>
                    <th>Email</th>
                    <th>Mobile Number</th>
                    <th>Email-Verified</th>
                    <th>Approve/Reject</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <?php $t=1 ?>
                @foreach($sellerList as $seller)
                    <tr>
                        <td>{{ $t++ }}</td>
                        <td>{{ $seller->person ? $seller->person->first_name : '' }} {{ $seller->person ? $seller->person->last_name : '' }}</td>
                        <td>{{ $seller->email }}</td>
                        <td>{{ $seller->mobile_phone }}</td>
                        <td style="text-transform: capitalize">
                            {{ $seller->verified }}
                        </td>
                        <td>
                            @if($seller->type == 'normal')
                                <br>
                                <span style="text-align: center">Normal</span>
                            @elseif($seller->type == 'trusted')
                                <span style="text-align: center">Approved</span>
                            @elseif($seller->type == 'rejected')
                                <span style="text-align: center">Rejected</span>
                            @endif
                        </td>
                        <td style="text-transform: capitalize;width: 18%">
                            <a href="{{ url('user/'.$seller->id.'/edit') }}" class="btn btn-info">Edit</a>
                        @if($seller->verified == 'yes')
                            @if($seller->type == 'normal')
                                {{--<a href="{{ url('user/seller/approve/'.$seller->id) }}" class="btn btn-success">Approve</a>--}}
                                    {{--<br>--}}
                                {{--<a href="{{ url('user/seller/reject/'.$seller->id) }}" class="btn btn-danger">Reject</a>--}}
                            @endif
                                <a style="float: right" href="{{ url('user/seller/disable/'.$seller->id) }}" class="btn btn-danger">Disable</a>
                        @else
                                <a style="float: right" href="{{ url('user/seller/enable/'.$seller->id) }}" class="btn btn-success">Enable</a>
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