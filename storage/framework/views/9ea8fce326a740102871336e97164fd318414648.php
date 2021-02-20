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
						<span class="home-info-bar-text colorwhite"><?php echo e($main_company['phone_number']); ?></span>
					</a>
				</li>
				<li>
					<a href="mailto:<?php echo e($main_company['sales_email']); ?>">
						<span class="glyphicon glyphicon-envelope colorwhite"></span>
						<span class="colorwhite"><?php echo e($main_company['sales_email']); ?></span>
					</a>

				</li>
			</ul>
			<ul class="nav navbar-nav" style="float: right">
				<li>
					<a href="<?php echo url('trackorder'); ?>">
						<span class="glyphicon glyphicon-map-marker colorwhite"></span>
						<span class="colorwhite">Track Order</span>
					</a>

				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle colorwhite" data-toggle="dropdown" role="button" aria-expanded="false">
						<span class="fui fui-heart colorwhite"></span><?php echo e(trans('store.wish_list')); ?>

						<span class="caret colorwhitecaret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li ><a href="<?php echo e(route('orders.show_wish_list')); ?>"><?php echo e(trans('store.wish_list')); ?></a></li>
						<li><a href="<?php echo e(route('orders.show_list_directory')); ?>"><?php echo e(trans('store.your_wish_lists')); ?></a></li>
					</ul>
				</li>

				
					
						
						
						
						
						

						
						
					

                    
                        
                            

                                
                                    

                                            
                                            
                                             

                                    
                                
                            


                            
                        
                    
                        
                        
                        
                            
                                

                                        
                                        
                                         

                                
                            
                        
                        
                            
                        
						
						
									
										
                                         
										
									
						
                    
				


				<?php if(Auth::user()): ?>
					<li class="dropdown " id="push-notices" ng-controller="PushNoticesController"  ng-click="check()" ng-focus="check()">
						<a href="#" class="dropdown-toggle colorwhite" data-toggle="dropdown" role="button" aria-expanded="false">
							<span style="background-color: red" class="badge badge-notifications ng-hide" ng-cloak  ng-show="push">[[push]]</span>
							<span class="fui fui-chat"></span><?php echo e(trans('globals.notices')); ?>

							<span class="visible-xs-inline">
								<span class="caret colorwhitecaret"></span>
							</span>
						</a>
						<ul class="dropdown-menu notices" role="menu" ng-if="notices.length">
							<li ng-repeat="notice in notices" class="[[notice.status]]">
								<a href="[[getLink(notice)]]" ng-click="check(notice)">[[getDesc(notice)]]</a>
							</li>
							<li><?php echo link_to('user/notices/list', trans('globals.all')); ?></li>
						</ul>
					</li>

					<?php if(config('app.offering_user_points')): ?>
					<li>
						<a href="<?php echo e(route('paypal.buy_points')); ?>" ng-controller = "PushUsersPoints" ng-init = "pusher()">
							<span class="badge badge-points ng-hide" ng-cloak ng-show = "points" >[[ points | thousandSuffix ]]</span>
							<span class="fui fui-radio-unchecked"></span><?php echo e(trans('store.price')); ?>

						</a>
					</li>
					<?php endif; ?>
				<?php endif; ?>

				<?php if(config('app.offering_free_products')): ?>
					<li>
						<a href="<?php echo e(route('freeproducts.search')); ?>">
							<span class="fui fui-star-2"></span><?php echo e(trans('globals.products')); ?>

							<span class="badge badge-freeproducts"><?php echo e(trans('globals.free')); ?></span>
						</a>
					</li>
				<?php endif; ?>
				<?php echo $__env->make('user.partial.menu_top', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

			</ul>

		</div>
	</nav>

	<nav ng-controller="CategoriesController">
		<a href="<?php echo url('home'); ?>" class="navbar-brand1">
		<div class="navbar-brand" style="width: 10%;padding: 0 !important;">

				<?php if(isset($main_company['slogan'])): ?>
					<span class="navbar-brand-slogan colorwhite" style="padding-top: 5%;float: left;"><?php echo e($main_company['slogan']); ?></span>
				<?php endif; ?>
				<?php if($main_company['logo']): ?>
					<span class="navbar-brand-text" style="width: 20%;float: left">
							<img src="<?php echo e(url($main_company['logo'])); ?>" alt="" style="height: 100%;width: 190px;">
						</span>
				<?php else: ?>
					<span class="navbar-brand-text"><?php echo e($main_company['name']); ?></span>
				<?php endif; ?>
		</div>
		</a>
		<?php echo Form::model(Request::all(),['url'=> action('ProductsController@index'), 'method'=>'GET', 'id'=>'searchForm','style'=>'position:inherit']); ?>

		<div class="input-group" style="width: 80%">
			<span class="input-group-btn categories-search">
				<button  type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
					<span ng-bind="catSelected.name || '<?php echo e(isset($categories_menu[Request::get("category")]["name"]) ? $categories_menu[Request::get("category")]["name"] : trans("store.all_categories")); ?>'">
						<?php echo e(isset($categories_menu[Request::get('category')]['name']) ? $categories_menu[Request::get('category')]['name'] : trans('store.all_categories')); ?>

						</span> <span class="caret colorwhitecaret">
					</span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<?php $__currentLoopData = $categories_menu; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $categorie_menu): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
						<li >
							<a href="javascript:void(0)"
							   ng-click="setCategorie('<?php echo e($categorie_menu["id"]); ?>','<?php echo e($categorie_menu["name"]); ?>')" >
								<?php echo e($categorie_menu['name']); ?>

							</a>
						</li>
					<?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>

				</ul>
			</span>
			<input type="hidden" name="category" value="[[refine() || '<?php echo e(Request::get("category")); ?>']]"/>

			<?php echo $__env->make('partial.search_box',['angularController' => 'AutoCompleteCtrl', 'idSearch'=>'search'], array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

			<span class="input-group-btn">
				<button class="btn btn-default fui-search" type="submit"></button>
			</span>

		</div>
		<div class="cartbutton">
			<a href="<?php echo url('user/cart'); ?>" type="button" class="btn btn-success" style="background-color: rgba(63, 160, 63, 0.67);">
				<span class="glyphicon glyphicon-shopping-cart colorwhite"></span>
				Cart <span class="badge colorwhite" style="background-color: red">
					<div >
						
							
						
						
							<?php if(Auth::user() && Auth::user()->getCartCount()): ?>
							<?php echo e(Auth::user()->getCartCount()); ?>

							<?php elseif(!Auth::user() && is_array(Session::get('user.cart_content')) && array_sum(Session::get('user.cart_content'))): ?>
							<?php echo e(array_sum(Session::get('user.cart_content'))); ?>

								<?php else: ?>
								0
							<?php endif; ?>
					</div>

				</span></a></div>

		<?php echo Form::close(); ?>



		</nav>
</div>
