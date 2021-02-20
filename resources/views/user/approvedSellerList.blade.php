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
            <h5>{{ trans('user.seller') }}</h5>
    </div>
    <div ng-controller="Orders">

        <div class="tabbable">

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