@extends('layouts.master')

@section('title')@parent - {{ trans('globals.home') }} @stop

@include('partial.message')

@section('content')

    <section class="products_view">

        <div class="container" id="home_content" style="padding: 0px;">



            {{-- -------------------------------------------------- --}}
            {{-- -------------------- carousel -------------------- --}}
            {{-- -------------------------------------------------- --}}
            <div class="home-info-bar clearfix">
                <div class="col-xs-2 col-md-2"></div>
                <div class="col-xs-8 col-md-8">
                    <div class="col-md-1"></div>
                    <div class="col-md-2 home-info-bar-text" style="padding: 8px;border-right: 2px solid grey;">Go quickly to &nbsp;<i class="fa fa-arrow-right" aria-hidden="true"></i></div>
                    {{--<div class="col-md-1 home-info-bar-icon"><div class="glyphicon glyphicon-forward"></div></div>--}}
                    <a href="{!! url('home') !!}" style="text-align: center">
                        <div class="col-md-2 home-info-bar-text hovergreen" style="border-right: 2px solid grey;text-align: center"> <div class="glyphicon glyphicon-erase"></div>&nbsp; Electronics</div></a>
                    <a href="{!! url('home/2') !!}">
                        <div class="col-md-2 home-info-bar-text hovergreen" style="border-right: 2px solid grey;text-align: center"><div class="glyphicon glyphicon-cutlery"></div>&nbsp; Food</div></a>
                    <a href="{!! url('home/3') !!}">
                        <div class="col-md-2 home-info-bar-text hovergreen" style="border-right: 2px solid grey;text-align: center"><div class="glyphicon glyphicon-print"></div>&nbsp; Printing</div></a>
                </div>
            </div>
@if(\Illuminate\Support\Facades\Auth::check())
                <div class="home-carousel-box" style="width: 100%">

                    <div id="store-home-carousel" class="carousel slide" data-ride="carousel">

                        {{-- indicators --}}
                        <ol class="carousel-indicators">
                            @for ($s=0; $s<count($suggestion['carousel']); $s++)
                                <li data-target="#store-home-carousel" data-slide-to="{{ $s }}" @if ($s==0) class="active" @endif ></li>
                            @endfor
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <?php $pos = 0; ?>
                            @foreach ($suggestion['carousel'] as $product)

                                {{-- slide items --}}
                                <div class="item @if ($i++==0) active @endif">
                                    @if (isset($banner[$pos]))
                                        <img src="{{url($banner[$pos++])}}" alt="{{ $product['name'] }}">
                                    @else
                                        <img src="{!! asset('/').'img/no-image.jpg' !!}" alt="{{ $product['name'] }}">
                                    @endif
                                    {{-- panel --}}
                                    <div class="jumbotron {{ $jumbotronClasses[mt_rand(0,1)] }} ">

                                        <h5>{{ str_limit($product['name'], 200,'...') }}</h5>

                                        <p class = "description">{{ str_limit($product['description'], 200,'...') }}</p>

                                        @if ($product['price'] > 0)
                                            <p class = "price">
                                                <strong>{!! \Utility::showPrice($product['price']) !!}</strong>
                                            </p>
                                        @endif

                                        <hr>

                                        <div class="btn-group" role="group" aria-label="...">

                                            <a href="{{ route('products.show',[$product['id']]) }}" class="btn btn-default btn-sm" style="width: 33%;">
                                                <div class = "glyphicon glyphicon-shopping-cart"></div>&nbsp;{{ trans('store.add_to_cart') }}
                                            </a>

                                            @if(Auth::user())

                                                <a href="{{ route('orders.add_to_order',['wishlist', $product[($product['type']=='freeproduct')?'parent_id':'id']]) }}" class="btn btn-default btn-sm" style="width: 33%;">
                                                    <div class = "glyphicon glyphicon-heart"></div>&nbsp;{{ trans('store.add_to_wish_list') }}
                                                </a>

                                            @else

                                                <a href="{!! url('/') !!}" class="btn btn-default btn-sm" style="width: 33%;">
                                                    <div class = "glyphicon glyphicon-heart"></div>&nbsp;{{ trans('store.add_to_wish_list') }}
                                                </a>

                                            @endif

                                            <a href="{{ route('products.show',[$product['id']]) }}" class="btn btn-default btn-sm" style="width: 33%;">

                                                <div class = "glyphicon glyphicon-eye-open"></div>&nbsp;{{ trans('store.viewDetails') }}

                                            </a>

                                        </div>

                                    </div>

                                </div> {{-- end item --}}

                            @endforeach

                        </div> {{-- end carousel-inner --}}


                    </div>

                </div> {{-- end carousel --}}

            @else
            <div class="home-carousel-box" style="width: 100%">

                <div id="store-home-carousel" class="carousel slide" data-ride="carousel">

                    {{-- indicators --}}
                    <ol class="carousel-indicators">
                        @for ($s=0; $s<count($suggestion['carousel']); $s++)
                            <li data-target="#store-home-carousel" data-slide-to="{{ $s }}" @if ($s==0) class="active" @endif ></li>
                        @endfor
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                    <?php $pos = 0; ?>

                    @foreach ($suggestion['carousel'] as $product)

                        {{-- slide items --}}
                        <div class="item @if ($i++==0) active @endif">
                            @if (isset($banner[$pos]))
                                <img src="{{url($banner[$pos++])}}" alt="{{ $product['name'] }}">
                            @else
                                <img src="{!! asset('/').'img/no-image.jpg' !!}" alt="{{ $product['name'] }}">
                            @endif
                            {{-- panel --}}
                            <div class="jumbotron jumbotron-box-left">

                                <h5>{{ str_limit($product['name'], 200,'...') }}</h5>

                                <p class = "description">{{ str_limit($product['description'], 200,'...') }}</p>

                                @if ($product['price'] > 0)
                                    <p class = "price">
                                        <strong>{!! \Utility::showPrice($product['price']) !!}</strong>
                                    </p>
                                @endif

                                <hr>

                                <div class="btn-group" role="group" aria-label="...">

                                    <a href="{{ route('products.show',[$product['id']]) }}" class="btn btn-default btn-sm" style="width: 33%;">
                                         <div class = "glyphicon glyphicon-shopping-cart"></div>&nbsp;{{ trans('store.add_to_cart') }}
                                    </a>

                                    @if(Auth::user())

                                        <a href="{{ route('orders.add_to_order',['wishlist', $product[($product['type']=='freeproduct')?'parent_id':'id']]) }}" class="btn btn-default btn-sm" style="width: 33%;">
                                            <div class = "glyphicon glyphicon-heart"></div>&nbsp;{{ trans('store.add_to_wish_list') }}
                                        </a>

                                    @else

                                        <a href="{!! url('/') !!}" class="btn btn-default btn-sm" style="width: 33%;">
                                            <div class = "glyphicon glyphicon-heart"></div>&nbsp;{{ trans('store.add_to_wish_list') }}
                                        </a>

                                    @endif

                                    <a href="{{ route('products.show',[$product['id']]) }}" class="btn btn-default btn-sm" style="width: 33%;">

                                        <div class = "glyphicon glyphicon-eye-open"></div>&nbsp;{{ trans('store.viewDetails') }}

                                    </a>

                                </div>

                            </div>

                                <div class="jumbotron jumbotron-box-right1">
                                    <div class="" ng-controller="LoginController">
                                        <div class="col-md-12">

                                            {!! Form::open(['url'=>'login','name'=>'loginForm', 'class'=>'form-horizontal','role'=>"form",'method'=>"POST"]) !!}

                                            {{ csrf_field() }}

                                            <div class="form-group"  style="margin-bottom: 0px;">
                                                <h6 class="black_color">{{ trans('user.email_address') }}</h6>
                                                <div class="input-group">
                                                    <div class="input-group-addon"><span class="fa fa-envelope-o"></span></div>
                                                    <input type="email" class="form-control" name="email" value="{{ old('email') }}" required>
                                                </div>
                                            </div>

                                            <div class="form-group"  style="margin-bottom: 0px;">
                                                <h6 class="black_color">{{ trans('user.password_message.password') }}</h6>
                                                <div class="input-group">
                                                    <div class="input-group-addon"><span class="fa fa-lock"></span></div>
                                                    <input ng-disabled="!havePassword" type="password" class="form-control" name="password">
                                                </div>
                                            </div>
                                            <div class="form-group" style="margin-bottom: 0px;">
                                                <label style="line-height: 1.5">
                                                    <a style="" href="{{ url('/password/reset') }}">
                                                        {{ trans('user.forgot_your_password') }}?
                                                    </a>
                                                </label>
                                                <br>
                                                <label style="line-height: 1.5">
                                                    <a href="{!! url('register') !!}">{{ trans('user.password_message.not_a_member') }}</a>
                                                </label>
                                            </div>
                                            <div class="form-group" style="text-align: center">

                                                <hr style="margin-bottom: 0px; margin-top: 0px;">
                                                <button type="submit" class="btn btn-primary" style="width: 100%;">
                                                    {{ trans('user.login') }}
                                                </button>
                                            </div>

                                            {!! Form::close() !!}

                                        </div> {{-- col --}}

                                    </div> {{-- row --}}

                                </div>

                        </div> {{-- end item --}}

                    @endforeach

                    </div> {{-- end carousel-inner --}}

                </div>

            </div> {{-- end carousel --}}
            {{-- panel --}}
@endif

            {{-- -------------------------------------------------- --}}
            {{-- -------------------- info bar -------------------- --}}
            {{-- -------------------------------------------------- --}}
            {{-- contact info --}}



            {{-- end info bar --}}

            {{-- -------------------------------------------------- --}}
            {{-- ------------------ Product List ------------------ --}}
            {{-- -------------------------------------------------- --}}

            @parent

            @section('center_content')

                {{-- viewed suggestions --}}
                <div class="clearfix home-products-wrapper">

                    <div class="col-lg-12">
                        @if (Auth::check())
                            <h4 class="home-title-section">{{ trans('store.suggestions.viewed') }}</h4>
                        @else
                            <h4 class="home-title-section">{{ trans('store.suggestions.viewed_unlogged') }}</h4>
                        @endif
                    </div>
                    <div class="container-fluid marketing">
                        <div class="row">
                            @foreach ($suggestion['viewed'] as $product)
                                @include('products.partial.productBox', $product)
                            @endforeach
                        </div>
                    </div>

                </div>

                {{-- categories suggestions --}}
                <div class="clearfix home-products-wrapper">

                    <div class="col-lg-12">
                        <h4 class="home-title-section">{{ trans('store.suggestions.categories') }}</h4>
                    </div>

                    <div class="container-fluid marketing">
                        <div class="row">
                            @foreach ($suggestion['categories'] as $product)
                                @include('products.partial.productBox', $product)
                            @endforeach
                        </div>
                    </div>

                </div>

                {{-- trending suggestions --}}
                <div class="clearfix home-products-wrapper">

                    <div class="col-lg-12">
                        @if (Auth::check())
                            <h4 class="home-title-section">{{ trans('store.suggestions.trends') }}</h4>
                        @else
                            <h4 class="home-title-section">{{ trans('store.suggestions.trends_unlogged') }}</h4>
                        @endif
                    </div>

                    <div class="container-fluid marketing">
                        <div class="row">
                            @foreach ($suggestion['purchased'] as $product)
                                @include('products.partial.productBox', $product)
                            @endforeach
                        </div>
                    </div>

                </div>

            @stop {{-- end center_content --}}


            {{-- -------------------------------------------------- --}}
            {{-- -------------------- Left Bar -------------------- --}}
            {{-- -------------------------------------------------- --}}

            {{--@section('panel_left_content')--}}

                {{--<div class="home-left-bar">--}}

                    {{-- rated products tag --}}
                    {{--@if (count($tagsCloud)>0 || true)--}}
                        {{--<div class="panel panel-default">--}}
                            {{--<div class="panel-heading">--}}
                                {{--{{ trans('globals.popular_tags') }}--}}
                            {{--</div>--}}
                            {{--<div class="panel-body">--}}
                                {{--<div class="tags-cloud">--}}
                                    {{--@foreach ($tagsCloud as $tag)--}}
                                        {{--<a href="{{ url(action('ProductsController@index')) }}/?search={{ $tag }}" class="t{{ mt_rand(1,10) }}" >--}}
                                            {{--{{ $tag }}--}}
                                        {{--</a>--}}
                                    {{--@endforeach--}}
                                {{--</div>--}}
                            {{--</div>--}}
                        {{--</div>--}}
                    {{--@endif--}}

                    {{-- upcoming events --}}

                    {{--@if (config('app.offering_free_products'))--}}

                        {{--@foreach ($events as $event)--}}

                            {{--@if (count($event['products'])>0)--}}

                                {{--<div class="panel panel-default">--}}

                                    {{--<div class="free-products-home-sign">--}}
                                        {{--<span>{{ trans('globals.free') }}</span>--}}
                                    {{--</div>--}}

                                    {{--<div class="panel-heading">--}}

                                       {{--{{ trans('globals.due_date') }}&nbsp;{{ Carbon\Carbon::parse($event['start_date'])->format('F j, Y') }}--}}

                                    {{--</div>--}}

                                    {{--<ul class="list-group">--}}
                                        {{--<li class="list-group-item" style="font-size: 12px;"><span class="fui-user icon-color"></span>&nbsp;{{ trans('freeproduct.min_participants') }}:&nbsp;<strong>{{ \Utility::thousandSuffix($event['min_participants']) }}</strong></li>--}}
                                        {{--<li class="list-group-item" style="font-size: 12px;"><span class="fui-user icon-color"></span>&nbsp;{{ trans('freeproduct.max_participants') }}:&nbsp;<strong>{{ \Utility::thousandSuffix($event['max_participants']) }}</strong></li>--}}
                                        {{--<li class="list-group-item" style="font-size: 12px;"><span class="fui-radio-unchecked icon-color"></span>&nbsp;{{ trans('freeproduct.participation_cost') }}:&nbsp;<strong>{{ \Utility::thousandSuffix($event['participation_cost']) }}</strong></li>--}}
                                        {{--<li class="list-group-item panel-default">Package</li>--}}
                                        {{--<li class="list-group-item clearfix" style="font-size: 12px;">--}}
                                            {{--@foreach ($event['products'] as $product)--}}
                                                {{--<a href="{{ route('products.show',[$product['id']]) }}" class="thumbnail col-xs-4 col-md-2 " style="margin: 0 5px 5px 0">--}}
                                                    {{--<img src='{{ asset('/').$product["features"]["images"][0] }}' class="img-rounded" alt="{{ $product['name'] }}">--}}
                                                {{--</a>--}}
                                            {{--@endforeach--}}
                                        {{--</li>--}}
                                        {{--<li class="list-group-item  panel-default">Description</li>--}}
                                        {{--<li class="list-group-item">--}}
                                            {{--{{ $event['description'] }}--}}
                                            {{--<hr>--}}
                                            {{--<div class="clearfix">--}}
                                                {{--<small>--}}
                                                    {{--<a href="{{ route('freeproducts.show',[$event['id']]) }}" class="pull-right">--}}
                                                        {{--<span class="fui-search icon-color"></span>&nbsp;{{ trans('globals.see_more') }}--}}
                                                    {{--</a>--}}
                                                {{--</small>--}}
                                            {{--</div>--}}
                                        {{--</li>--}}
                                    {{--</ul>--}}

                                {{--</div> --}}{{-- end panel --}}

                            {{--@endif --}}{{-- products >0 --}}

                        {{--@endforeach --}}{{-- free products --}}

                    {{--@endif --}}{{-- if offering free products --}}

                {{--</div> --}}{{-- end home-left-bar --}}

            {{--@stop --}}{{-- end panel_left_content --}}


            {{--/////////rahul code////////--}}

            @section('panel_left_content')
                <div  class="vertical-nav">

                    <div class="navbar navbar-default" role="navigation">

                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
                                <span class="sr-only">{{ trans('globals.refine') }}</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <span class="visible-xs-block navbar-brand">{{ trans('globals.refine') }}</span>
                        </div>

                        <div id="menu-left-category" class="navbar-collapse collapse sidebar-navbar-collapse" ng-cloak style="padding: 10px">

                            <div class="filters-applied ng-cloak visible-xs" ng-show="filters" >
                        <span ng-repeat="filter in filters">
                            <button type="button" class="text-capitalize btn btn-warning btn-xs"  ng-click="removeFilter(filter)">
                                <span ng-bind-html="(filter.value.name)? filter.value.name:filter.value"></span>
                                <span data-role="remove" class="glyphicon glyphicon-remove"></span>
                            </button>
                        </span>
                            </div>

                            @foreach ($filters as $key => $filter)
                                {{-- filter menu --}}
                                <ul class="nav navbar-nav {{ $key }}" >
                                    <h4 class="small breadcrumb @if($key=='categories') no_margin_top @endif">{{ trans('globals.filters.'.$key) }}</h4>
                                    <?php $i=0; ?>
                                    @if($key=='category')
                                        @foreach ($filter as $id => $item)
                                            <?php if (5<$i++){ break; } ?>
                                            <li>
                                                <a href="{{ url('/products?').\Utility::getUrlQueryString($refine, 'category', urlencode($item['id'].'|'.$item['name'])) }}">
                                                    {{ ucfirst($item['name']) }} <small><span class="badge" style="float: right;">{{ $item['qty'] }}</span></small>
                                                </a>
                                            </li>
                                        @endforeach

                                    @else

                                        @foreach ($filter as $item => $count)
                                            <?php if (5<$i++){ break; } ?>
                                            <li>
                                                <a href="{{ url('/products?').\Utility::getUrlQueryString($refine, $key, urlencode($item)) }}">
                                                    {{ ucfirst($item) }} <span class="badge" style="float: right;">{{ $count }}</span>
                                                </a>
                                            </li>
                                        @endforeach
                                    @endif
                                </ul>
                                {{-- end menu --}}

                                {{-- see more modal --}}
                                <script type='text/ng-template' id="{{ $key }}-snippet" class="panel">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button ng-click="$close(false)" type="button" class="close"><span aria-hidden="true">&times;</span></button>
                                            {{ trans('globals.filters.'.$key) }}
                                        </div>
                                        <div class="modal-body">
                                            <div class="container-fluid">
                                                <ul class="list-inline">
                                                    @if($key=='category')
                                                        @foreach ($filter as $id => $item)
                                                            <li class="text-capitalize  col-xs-12 col-sm-4 col-md-4">
                                                                <a href="{{ url('/products?').\Utility::getUrlQueryString($refine, 'category', urlencode($item['id'].'|'.$item['name'])) }}" >
                                                                    {{ $item['name'] }} <span class="badge" style="float: right;">{{ $item['qty'] }}</span>
                                                                </a>
                                                            </li>
                                                        @endforeach
                                                    @else
                                                        @foreach ($filter as $item => $count)
                                                            <li class="text-capitalize  col-xs-12 col-sm-4 col-md-4">
                                                                <a href="{{ url('/products?').\Utility::getUrlQueryString($refine, $key, urlencode($item)) }}" >
                                                                    {{ $item }} <span class="badge" style="float: right;">{{ $count }}</span>
                                                                </a>
                                                            </li>
                                                        @endforeach
                                                    @endif
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="modal-footer clearfix">
                                            <button ng-click="$close(false)" class="btn btn-info btn-sm pull-left">
                                                {{ trans('globals.close_label') }}
                                            </button>
                                        </div>
                                    </div>
                                </script>

                                {{-- end see more     --}}
                                @if ($i > 6)
                                    <small ng-controller="ModalCtrl" ng-click="modalOpen({templateUrl:'{{ $key }}-snippet', size: 'md'})" >
                                        <a href="javascript:void(0)">
                                            <span class="glyphicon glyphicon-zoom-in"></span>&nbsp;
                                            {{ trans('globals.see_more') }}
                                        </a>
                                    </small>
                                @elseif($i == 0)
                                    <ul class="nav navbar-nav" >
                                        <li><a href="javascript:window.history.back()"><span class="glyphicon glyphicon-menu-left"></span>&nbsp;{{ trans('globals.go_back_label') }}</a></li>
                                        @if (isset($filterSelected[$key]) && count($filterSelected) > 0)
                                            <li>
                                                <a href="{{ ucwords($filterSelected[$key]['url']) }}">
                                                    <span class="glyphicon glyphicon-remove"></span>&nbsp;
                                                    {{ ucwords($filterSelected[$key]['label']) }}
                                                </a>
                                            </li>
                                        @endif
                                    </ul>
                                @endif
                            @endforeach

                            <ul class="nav navbar-nav list-group price-range">
                                <h4 class="small breadcrumb">{{ trans('globals.filters.price_range') }}</h4>
                                <li>
                                    <div class="row">
                                        <div class="col-md-10">
                                            <form method="GET" action="{!! url('products') !!}" name="rangepriceForm" novalidate>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-addon input-sm"><i class="fa fa-inr" aria-hidden="true"></i></div>
                                                        <input class="form-control input-sm" type="number" value="{{ isset($refine['min']) ? $refine['min'] : '' }}" name="min" id="min" placeholder="{{ trans('globals.min_label') }}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group">
                                                            <div class="input-group-addon input-sm"><i class="fa fa-inr" aria-hidden="true"></i></div>
                                                            <input class="form-control input-sm" type="number" value="{{ isset($refine['max']) ? $refine['max'] : '' }}" name="max" id="max" placeholder="{{ trans('globals.max_label') }}">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-success btn-sm" style="width: 100%;">
                                                        <span class="glyphicon glyphicon-filter"></span>&nbsp;
                                                        {{ trans('globals.go_label') }}
                                                    </button>
                                                </div>
                                                @foreach ($refine as $key => $value)
                                                    @if (trim($value)!='' && $key != 'category_name' && $key != 'min' && $key != 'max')
                                                        <?php $value = $key == 'category' ? $value.'|'.urlencode($refine['category_name']) : $value; ?>
                                                        <input type="hidden" name="{{ $key }}" id="{{ $key }}" value="{{ $value }}">
                                                    @endif
                                                @endforeach
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-md-2">&nbsp;</div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            @stop
            {{--rahul code--}}
        </div> {{-- end container-fluid --}}

    </section> {{-- end products_view --}}
    <script>
        $(function(){
//                $('#store-home-carousel.slide').carousel({
//                    interval: 5000,
//                    pause: "hover"
//                });
        $('input').focus(function(){
                $("#store-home-carousel").carousel('pause');
            }).blur(function() {
                $("#store-home-carousel").carousel('pause');
            });
        });
    </script>

@stop {{-- end content --}}
