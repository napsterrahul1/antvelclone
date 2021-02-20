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
            <h5>{{ trans('user.product') }}</h5>
    </div>
    <div ng-controller="Orders">

        <div class="">
            <table class="table table-striped table-bordered datatable" id="product_list" style="margin-right:5px;">
                <thead>
                <tr>
                    <th style="">Sr. No.</th>
                    <th style="">Name</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>view</th>

                </tr>
                </thead>
                <tbody>
                <?php $t=1 ?>
                @foreach($productList as $product)

                <tr @if($product->product_status == 'pending') style="background-color: #00bdef;color: white" @endif>
                    <td>{{ $t++ }}</td>
                    <td>{{ $product->product->nickname }} </td>
                    <td>{{ $product->name }}</td>
                    <td>{{ $product->price }}</td>
                    <td style="text-transform: capitalize">{{ $product->stock }}</td>
                    <td style="text-transform: capitalize"><a href="{!! url('products/'.$product->id) !!}">
                            @if($product->product_status == 'pending')

                            <span class="label label-danger">Pending</span>
                    @else
                            <span class="label label-warning">view</span>
                        @endif
                        </a></td>
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