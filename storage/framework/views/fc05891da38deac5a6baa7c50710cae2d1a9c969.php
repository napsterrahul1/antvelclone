<?php
$storage_path = str_replace('/public',"" ,url('/')) . '/storage/files';
?>

<?php $__env->startSection('title'); ?>@parent- <?php echo e($product->name); ?> <?php $__env->stopSection(); ?>

<?php echo $__env->make('partial.message', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

<style>
	
	.product-img-box img{
    width: 100%;
	}
</style>

<?php $__env->startSection('metaLabels'); ?>
    @parent
    <?php echo $__env->make('partial.social_tags', [
        'title' => $product->name,
        'image' => isset($product->features['images'][0]) ? URL::to('/').$product->features['images'][0] : URL::to('/').'/img/no-image.jpg',
        'description' => $product->description,
        'id' =>$product->id,
        'brand' => isset($product->features['brand'])?$product->features['brand']:'',
        'rate_val' => $product->rate_val,
        'rate_count' => $product->rate_count
    ], array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumbs'); ?>
    @parent
    <?php echo Breadcrumbs::render('productDetail', $product); ?>

<?php $__env->stopSection(); ?>
<?php if($product->status==0): ?>
    <div class="alert alert-danger" role="alert">
        <?php echo e(trans('product.show_view.status_inactive')); ?>

    </div>
<?php endif; ?>

<?php $__env->startSection('content'); ?>
    @parent
	<?php
	$path = url('/');
	$path = str_replace('/public',"" ,$path) . '/storage/files';
	?>

    <?php if(Auth::id()===$product->user_id): ?>
        <?php $__env->startSection('panel_left_content'); ?>
            <?php echo $__env->make('user.partial.menu_dashboard', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

			<div class="row hidden-xs">
	            <div class="col-md-12">
	        		<?php echo Form::open(['route' => ['products.change_status', $product->id], 'method' => 'post', 'class' => 'form-inline']); ?>

	                    <a href="<?php echo e(route('products.edit',[$product->id])); ?>" class="btn btn-success btn-sm full-width">
							<span class="glyphicon glyphicon-edit"></span>&nbsp;
	                    	<?php echo e(trans('globals.edit')); ?>

	                    </a>

						<div class="row">&nbsp;</div>

	                    <button type="submit" class="btn btn-primary btn-danger btn-sm full-width">
							<span class="glyphicon <?php if($product->status): ?> glyphicon-ban-circle <?php else: ?> glyphicon-ok-circle <?php endif; ?>"></span>&nbsp;
	                    	<?php echo e($product->status ? trans('globals.disable') : trans('globals.enable')); ?>

	                    </button>

						<div class="row">&nbsp;</div>

	                    <?php if($product->type=='key'): ?>
	                        <button type="button" ng-controller="ModalCtrl" ng-init="data={'data':<?php echo e($product->id); ?>}" ng-click="modalOpen({templateUrl:'/modalAllKeys',controller:'getKeysVirtualProducts',resolve:'data'})" class="btn btn-primary btn-sm full-width">
								<span class="glyphicon glyphicon-eye-open"></span>&nbsp;
	                        	<?php echo e(trans('product.globals.see_keys')); ?>

	                        </button>
	                    <?php endif; ?>
	                <?php echo Form::close(); ?>

	            </div>
	        </div>

        <?php $__env->stopSection(); ?>
    <?php endif; ?>


	<?php $__env->startSection('center_content'); ?>

		<div class="page-header">
            <h5><?php echo e($product->name); ?></h5>
        </div>

		<div class="row">

			
			<div class="col-md-6" ng-controller = "ProductsGallery">


				
				<div class="">
					<div class="col-md-2">
					<ul class="list-inline" ng-controller = "ProductsGallery">
					<?php $selector = 0; $gallery = ''; ?>
						<?php if($product->features['images']): ?>
					<?php $__currentLoopData = $product->features['images']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $image): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
						<li>
							<a class="thumbnail" style="height: 60px;width: 60px;">
								<img src = "<?php echo e($storage_path . $image); ?>?h=60" lazy-img = "<?php echo e(url($image)); ?>?h=60" class="img-responsive img-rounded" ng-click = "setPortrait('<?php echo e($image); ?>?w=450')">
							</a>
						</li>
						<?php $gallery .= $image.'?w=450,'; ?>
					<?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
							<?php endif; ?>
		        	</ul>
		        	</div>
				</div>
				<img src = "<?php echo '[[getPortrait()]]' ? $storage_path .'[[getPortrait()]]' : url('/img/no-mage.png'); ?>" lazy-img = '[[getPortrait()]]' ng-init = "setPortrait('<?php echo e($product->features['images'][0]); ?>?w=450')" class = "img-responsive img-rounded col-md-10" >

			</div>


			
			<?php if($product->category_id == 3): ?>
	        <div class="col-md-2">
				<?php else: ?>
					<div class="col-md-3">
			<?php endif; ?>
				<hr class="visible-xs visible-sm">
				<h5 class="black_color"><?php echo e(\Utility::showPrice($product->price)); ?></h5>
				<hr class="hidden-sm hidden-xs">
				<ul class="list-unstyled">
					<li><label class="black_color"><?php echo e(trans('store.condition')); ?>:</label>&nbsp;<?php echo e(ucwords($product->condition)); ?></li>
					<li><label class="black_color"><?php echo e(trans('globals.brand')); ?>:</label>&nbsp;<?php echo e(ucwords($product->brand)); ?></li>
					<?php if($product->feature): ?>
					<?php $__currentLoopData = $product->features; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $feature): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
						<?php if($key != 'images'): ?>
							<li><label class="black_color"><?php echo e(ucwords($key)); ?>:</label>&nbsp;<?php echo e(ucwords( is_array($feature) ? implode(' ', $feature) : $feature )); ?></li>
						<?php endif; ?>
					<?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
					<?php endif; ?>
					<li>
						<?php if($product->stock <= $product->low_stock): ?>
							<span class = "label label-warning"><?php echo e(trans('store.lowStock')); ?></span>
						<?php else: ?>
							<span class = "label label-success"><?php echo e(trans('store.inStock')); ?></span>
						<?php endif; ?>
					</li>
				</ul>
				<hr class="visible-xs visible-sm">
	        </div>

			



					<?php if($product->category_id == 3): ?>
				<div class="col-md-4">
					<div class="panel panel-default">
						<div class="panel-body">

							<?php echo $__env->make('about.printing_form', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
						</div>
						</div>
						</div>
						<?php else: ?>
				<div class="col-md-3">
					<div class="panel panel-default">
		        	<div class="panel-body">

	                    <?php echo Form::open(array('url' => route('orders.add_to_order',['cart',$product->id]), 'method' => 'put')); ?>


	                    <?php if(auth()->user() ? auth()->user()->id : 0 != $product->user_id): ?>
							<?php if((($user ? $user->role : '') == 'admin') && ($product->product_status == 'pending')): ?>
								<br>
								<div class="row">
									<div class="col-lg-12">
										<a type="button" href="<?php echo url('user/product/approve/'.$product->id); ?>" class="btn btn-success btn-sm full-width">
											<span class="glyphicon glyphicon-check"></span>&nbsp;
											Approved
										</a>
									</div>
								</div>
                                 <br>
								<div class="row">
									<div class="col-lg-12">
										<a type="button" href="<?php echo url('user/product/reject/'.$product->id); ?>" class="btn btn-danger btn-sm full-width">
											<span class="glyphicon glyphicon-remove-circle"></span>&nbsp;
											Rejected
										</a>
									</div>
								</div>


								<?php else: ?>
								<div class="row">
									<div class="col-lg-12">
										<label for = "quantity"><?php echo e(trans('store.quantity_long')); ?>:</label>
										
				                            	
				                            	
				                                
				                        

										<input type="hidden" value="<?php echo $product->stock; ?>" id="quantitycount"/>
										<input class="form-control input-sm" type="number" value="1" name="quantity" id="quantity" placeholder="Quantity">

									</div>
								</div>

								<hr>

								<div class="row">
									<div class="col-lg-12">
										<button type="submit" class="btn btn-warning btn-sm full-width">
											<span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;
											<?php echo e(trans('store.add_to_cart')); ?>

										</button>
									</div>
								</div>

								<div class="row">&nbsp;</div>

								<div class="row">

									<div class="col-lg-12">

										<?php if(Auth::check()): ?>
											<div class="dropdown">

												<button class="btn btn-default dropdown-toggle btn-sm full-width" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" style="background-color: #3498db">
													<span class="glyphicon glyphicon-heart"></span>&nbsp;
													<?php echo e(trans('store.addToWishList')); ?>

													<span class="caret"></span>
												</button>

												<ul class="dropdown-menu dropdown-menu-left btn-sm" aria-labelledby="dropdownMenu1">
													<li>
														<a href="<?php echo e(route('orders.add_to_order',['wishlist',$product->id])); ?>">
															<?php echo e(trans('store.wish_list')); ?>

														</a>
													</li>
													<?php if(count($allWishes)>0): ?>
														<li class="dropdown-header"><?php echo e(trans('store.your_wish_lists')); ?></li>
													<?php endif; ?>
													<?php $__currentLoopData = $allWishes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $wishList): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
														<li><a href="<?php echo e(route('orders.add_to_order_by_id',[$wishList->id,$product->id])); ?>"><?php echo e($wishList->description); ?></a></li>
													<?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>

												</ul>
											</div>

										<?php else: ?>
											<a  href="<?php echo url('/'); ?>" class="btn btn-info full-width" style="background-color: #3498db">
												<span class="glyphicon glyphicon-heart"></span>&nbsp;
												<?php echo e(trans('store.addToWishList')); ?>

											</a>
										<?php endif; ?>

									</div>
								</div>
							<?php endif; ?>



							<hr>
						<?php endif; ?>

	                    <div class="row">
	                    	<div class="col-lg-12">
	                    		<button type="button" id="facebook" class="btn btn-primary btn-sm full-width" style="background-color: #5d6d7e">
									<span class="fa fa-facebook-square"></span>&nbsp;
									<?php echo e(trans('globals.share_on_facebook')); ?>

								</button>
	                    	</div>
	                    </div>
	                    <div class="row">&nbsp;</div>
	                    <div class="row">
	                    	<div class="col-lg-12">
	                    		<a id="twitter" href="https://twitter.com/intent/tweet?hashtags=antvel&text=<?php echo e(urlencode($product->name)); ?>&url=<?php echo e(Request::url()); ?>&via=_antvel" class="btn btn-success btn-sm full-width" style="background-color: #1abc9c">
									<span class="fa fa-twitter-square"></span>&nbsp;
									<?php echo e(trans('globals.share_on_twitter')); ?>

								</a>
	                    	</div>
	                    </div>

						
	                    <?php if($product->type=='key'): ?>
	                    	<hr>
	                       	<label for = "email"><?php echo e(trans('globals.send_to')); ?>:</label>
	                       	<?php echo Form::email('email',(Auth::check()?Auth::user()->email:null), ['class'=>'form-control input-sm',(Auth::check()?'':'disabled')=>(Auth::check()?'':'disabled')]); ?>

	                    <?php endif; ?>

	                    <?php echo Form::close(); ?>


					</div> 
					</div>
				</div>

				<?php endif; ?>
		</div>
		<hr>

		
		<?php if(trim($product->description) != ''): ?>
			<div class="row">&nbsp;</div>
			<div class="page-header">
	            <h5><?php echo e(trans('store.description')); ?></h5>
	        </div>
	        <div class="row">
	        	<div class="col-md-12">
					<?php echo e($product->description); ?>

	        	</div>
	        </div>
        <?php endif; ?>

		
		<?php if(count($reviews) > 0): ?>
			<div class="row">&nbsp;</div>
			<div class="page-header">
	            <h5><?php echo e(trans_choice('store.review', 7)); ?></h5>
	        </div>
	        <?php $__currentLoopData = $reviews; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $rev): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
		        <div class="row">
		        	<div class="col-lg-12">
			        	<small>
							<?php echo e(\Utility::showRate($rev['rate'])); ?>&nbsp;
							<?php echo e($rev['rate_comment']); ?>&nbsp;-&nbsp;
							<em><?php echo e(Carbon\Carbon::parse($rev['updated_at'])->format('F j, Y')); ?></em>
						</small>
					</div>
		        </div>
	        <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
        <?php endif; ?>

		<div class="row">&nbsp;</div>

		<div class="page-header">
            <h5><?php echo e(trans('store.suggestions.product')); ?></h5>
        </div>
		<div class="row">
			<?php if(count($product->group)): ?>
                <?php echo $__env->make('products.group', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
            <?php else: ?>
	            <section class="products_view">
                    <div class="container-fluid marketing">
                        <div class="row">
                            <?php $__currentLoopData = $suggestions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $productSuggestion): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                                <?php echo $__env->make('products.partial.productBox', $productSuggestion, array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                        </div>
                    </div>
	            </section>
            <?php endif; ?>
		</div>

	 <?php $__env->stopSection(); ?>
<?php $__env->stopSection(); ?>


<?php $__env->startSection('scripts'); ?>
    @parent

	<?php echo Html::script('/antvel-bower/angular-lazy-img/release/angular-lazy-img.min.js'); ?>


	<script src = "https://connect.facebook.net/en_US/sdk.js"></script>

    <script>

		(function(app){

			app.requires.push('angularLazyImg');

            /**
             * ProductsGallery
             * Allows changing the product portrait image
             * @param    $scope Angularjs scope object
             * @param    PassInfo is a service that lets passing info among controllers or divs
             */
            app.controller('ProductsGallery', function($scope, PassInfo){

            	$scope.gallery = '<?php echo e($gallery); ?>'.split(',');

            	$scope.setPortrait = function (pic)
            	{
            		PassInfo.setProperty(pic);
            	}

            	$scope.getPortrait = function ()
            	{
            		return PassInfo.getProperty();
            	}

            });

        })(angular.module("AntVel"));

        //Social Buttons
        $(document).ready(function() {
        	var count = $('#quantitycount').val();
			$('#quantity').blur(function () {
				var  val = $('#quantity').val();
				val = parseInt(val);
				count = parseInt(count);
				if(val > count){
					alert('Maximum '+ count +' quantity available for this product');
					$('#quantity').val(count);
				}
				if(val < 1){
					alert('Please select Minimum 1 quantity for this product');
					$('#quantity').val(1);
				}
			});
			$("#facebook").click(function() {

				$.getScript('//connect.facebook.net/en_US/sdk.js', function(){
				    FB.init({
				      appId      : "<?php echo e(env('FB_APP_ID')); ?>",
				      xfbml      : true,
				      version    : 'v2.5',
				      caption    : '<?php echo e($product->name); ?>',
				    });
					FB.ui(
					{
						method: 'share',
						href: '<?php echo e(Request::url()); ?>'
					},
					function(response) {}
					);
			  	});

			});
		});

		$('#twitter').click(function(event) {
		    var width  = 575,
		        height = 400,
		        left   = ($(window).width()  - width)  / 2,
		        top    = ($(window).height() - height) / 2,
		        url    = this.href,
		        opts   = 'status=1' +
		                 ',width='  + width  +
		                 ',height=' + height +
		                 ',top='    + top    +
		                 ',left='   + left;

		    window.open(url, '<?php echo e($product->name); ?>', opts);

		    return false;
		});

    </script>
<?php $__env->stopSection(); ?>



<?php echo $__env->make('layouts.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>