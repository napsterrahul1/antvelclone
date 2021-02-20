<div class="navbar-wrapper container backgroundgreen">
	<nav class="navbar navbar-inverse navbar-static-top backgroundgreen">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>

		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li>
					<a>
						<span class="glyphicon glyphicon-phone-alt colorwhite"></span>
						<span class="home-info-bar-text colorwhite">{{ $main_company['phone_number'] }}</span>
					</a>
				</li>
				<li>
					<a href="mailto:{{ $main_company['sales_email'] }}">
						<span class="glyphicon glyphicon-envelope colorwhite"></span>
						<span class="colorwhite">{{ $main_company['sales_email'] }}</span>
					</a>

				</li>
			</ul>
			<ul class="nav navbar-nav" style="float: right">
				<li>
					<a href="{!! url('trackorder') !!}">
						<span class="glyphicon glyphicon-map-marker colorwhite"></span>
						<span class="colorwhite">Track Order</span>
					</a>

				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle colorwhite" data-toggle="dropdown" role="button" aria-expanded="false">
						<span class="fui fui-heart colorwhite"></span>{{ trans('store.wish_list') }}
						<span class="caret colorwhitecaret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li ><a href="{{ route('orders.show_wish_list') }}">{{ trans('store.wish_list') }}</a></li>
						<li><a href="{{ route('orders.show_list_directory') }}">{{ trans('store.your_wish_lists') }}</a></li>
					</ul>
				</li>

				{{--<li class="dropdown">--}}
					{{--<a href="#cart" class="dropdown-toggle colorwhite" data-toggle="dropdown" role="button" aria-expanded="false">--}}
						{{--@if(Auth::user()&&Auth::user()->getCartCount())--}}
						{{--<span class="badge badge-cart colorwhite">{{ Auth::user()->getCartCount() }} </span>--}}
						{{--@elseif(!Auth::user() && is_array(Session::get('user.cart_content')) && array_sum(Session::get('user.cart_content')))--}}
						{{--<span class="badge badge-cart colorwhite">{{ array_sum(Session::get('user.cart_content')) }} </span>--}}
						{{--@endif--}}

						{{--<span class="glyphicon glyphicon-shopping-cart colorwhite"></span>{{ trans('store.cart') }}--}}
						{{--<span class="caret colorwhitecaret"></span>--}}
					{{--</a>--}}

                    {{--@if(Auth::user() && Auth::user()->getCartCount() > 0)--}}
                        {{--<ul class="dropdown-menu cart" role="menu">--}}
                            {{--@foreach(Auth::user()->getCartContent() as $orderDetail)--}}

                                {{--<li>--}}
                                    {{--<a href="{{ route('products.show',[$orderDetail->product->id]) }}" >--}}

                                            {{--<img src="{{  \App\Helpers\Utility::getStoragePath() . $orderDetail->product->FirstImage }}" alt="{{ $orderDetail->product->name }}" width="32" height="32" style="float: left; margin-right: 2px"/>--}}
                                            {{--{{ $orderDetail->product->name }}--}}
                                             {{--- {{ trans('store.quantity') }}: {{ $orderDetail->quantity }}--}}

                                    {{--</a>--}}
                                {{--</li>--}}
                            {{--@endforeach--}}


                            {{--<li><a class="btn btn-default" href="{{ route('orders.show_cart') }}" role="button">{{ trans('store.view_cart') }}</a></li>--}}
                        {{--</ul>--}}
                    {{--@elseif(!Auth::user() && is_array(Session::get('user.cart_content')))--}}
                        {{--<ul class="dropdown-menu cart" role="menu">--}}
                        {{--@foreach(Session::get('user.cart_content') as $product_id => $quantity)--}}
                        {{--@if($product=\App\Product::find($product_id))--}}
                            {{--<li>--}}
                                {{--<a href="{{ route('products.show',[$product_id]) }}" >--}}

                                        {{--<img src="{{ url('/').$product->first_image }}" width="32" height="32" style="float: left; margin-right: 2px"/>--}}
                                        {{--{{ $product->name }}--}}
                                         {{--- {{ trans('store.quantity') }}: {{ $quantity }}--}}

                                {{--</a>--}}
                            {{--</li>--}}
                        {{--@endif--}}
                        {{--@endforeach--}}
                            {{--<li><a class="btn btn-default" href="{{ route('orders.show_cart') }}" role="button">{{ trans('store.view_cart') }}</a></li>--}}
                        {{--</ul>--}}
						{{--@else--}}
						{{--<ul class="dropdown-menu cart" role="menu">--}}
									{{--<li>--}}
										{{--<a href="#" >--}}
                                         {{--NO product found in cart--}}
										{{--</a>--}}
									{{--</li>--}}
						{{--</ul>--}}
                    {{--@endif--}}
				{{--</li>--}}


				@if(Auth::user())
					<li class="dropdown " id="push-notices" ng-controller="PushNoticesController"  ng-click="check()" ng-focus="check()">
						<a href="#" class="dropdown-toggle colorwhite" data-toggle="dropdown" role="button" aria-expanded="false">
							<span style="background-color: red" class="badge badge-notifications ng-hide" ng-cloak  ng-show="push">[[push]]</span>
							<span class="fui fui-chat"></span>{{ trans('globals.notices') }}
							<span class="visible-xs-inline">
								<span class="caret colorwhitecaret"></span>
							</span>
						</a>
						<ul class="dropdown-menu notices" role="menu" ng-if="notices.length">
							<li ng-repeat="notice in notices" class="[[notice.status]]">
								<a href="[[getLink(notice)]]" ng-click="check(notice)">[[getDesc(notice)]]</a>
							</li>
							<li>{!! link_to('user/notices/list', trans('globals.all')) !!}</li>
						</ul>
					</li>

					@if (config('app.offering_user_points'))
					<li>
						<a href="{{ route('paypal.buy_points') }}" ng-controller = "PushUsersPoints" ng-init = "pusher()">
							<span class="badge badge-points ng-hide" ng-cloak ng-show = "points" >[[ points | thousandSuffix ]]</span>
							<span class="fui fui-radio-unchecked"></span>{{ trans('store.price') }}
						</a>
					</li>
					@endif
				@endif

				@if (config('app.offering_free_products'))
					<li>
						<a href="{{ route('freeproducts.search') }}">
							<span class="fui fui-star-2"></span>{{ trans('globals.products') }}
							<span class="badge badge-freeproducts">{{ trans('globals.free') }}</span>
						</a>
					</li>
				@endif
				@include('user.partial.menu_top')

			</ul>
{{--			@include('partial.navigation_help')--}}
		</div>
	</nav>

	<nav ng-controller="CategoriesController">
		<a href="{!! url('home') !!}" class="navbar-brand1">
		<div class="navbar-brand" style="width: 10%;padding: 0 !important;">

				@if(isset($main_company['slogan']))
					<span class="navbar-brand-slogan colorwhite" style="padding-top: 5%;float: left;">{{$main_company['slogan']}}</span>
				@endif
				@if($main_company['logo'])
					<span class="navbar-brand-text" style="width: 20%;float: left">
							<img src="{{url($main_company['logo'])}}" alt="" style="height: 100%;width: 190px;">
						</span>
				@else
					<span class="navbar-brand-text">{{ $main_company['name'] }}</span>
				@endif
		</div>
		</a>
		{!! Form::model(Request::all(),['url'=> action('ProductsController@index'), 'method'=>'GET', 'id'=>'searchForm','style'=>'position:inherit']) !!}
		<div class="input-group" style="width: 80%">
			<span class="input-group-btn categories-search">
				<button  type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
					<span ng-bind="catSelected.name || '{{ isset($categories_menu[Request::get("category")]["name"]) ? $categories_menu[Request::get("category")]["name"] : trans("store.all_categories") }}'">
						{{ isset($categories_menu[Request::get('category')]['name']) ? $categories_menu[Request::get('category')]['name'] : trans('store.all_categories') }}
						</span> <span class="caret colorwhitecaret">
					</span>
				</button>
				<ul class="dropdown-menu" role="menu">
					@foreach($categories_menu as $categorie_menu)
						<li >
							<a href="javascript:void(0)"
							   ng-click="setCategorie('{{ $categorie_menu["id"] }}','{{ $categorie_menu["name"] }}')" >
								{{ $categorie_menu['name'] }}
							</a>
						</li>
					@endforeach

				</ul>
			</span>
			<input type="hidden" name="category" value="[[refine() || '{{Request::get("category")}}']]"/>

			@include('partial.search_box',['angularController' => 'AutoCompleteCtrl', 'idSearch'=>'search'])

			<span class="input-group-btn">
				<button class="btn btn-default fui-search" type="submit"></button>
			</span>

		</div>
		<div class="cartbutton">
			<a href="{!! url('user/cart') !!}" type="button" class="btn btn-success" style="background-color: rgba(63, 160, 63, 0.67);">
				<span class="glyphicon glyphicon-shopping-cart colorwhite"></span>
				Cart <span class="badge colorwhite" style="background-color: red">
					<div >
						{{--@if(Auth::user())--}}
							{{--{{ Auth::user()->getCartCount() }}--}}
						{{--@else 0--}}
						{{--@endif--}}
							@if(Auth::user() && Auth::user()->getCartCount())
							{{ Auth::user()->getCartCount() }}
							@elseif(!Auth::user() && is_array(Session::get('user.cart_content')) && array_sum(Session::get('user.cart_content')))
							{{ array_sum(Session::get('user.cart_content')) }}
								@else
								0
							@endif
					</div>

				</span></a></div>

		{!! Form::close() !!}


		</nav>
</div>
