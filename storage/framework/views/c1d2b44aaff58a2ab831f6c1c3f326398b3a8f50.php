<?php $__env->startSection('title'); ?>@parent  - <?php echo e(trans('store.wish_list')); ?> <?php $__env->stopSection(); ?>
<?php $__env->startSection('page_class'); ?> 'products_view' <?php $__env->stopSection(); ?>

<?php $__env->startSection('css'); ?>
    @parent
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    @parent

    <?php if(\Auth::user()): ?>
        <?php $__env->startSection('panel_left_content'); ?>
            <?php echo $__env->make('user.partial.menu_dashboard', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
        <?php $__env->stopSection(); ?>
    <?php endif; ?>

    <?php $__env->startSection('center_content'); ?>

        <?php echo $__env->make('partial.message', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

        <ol class="breadcrumb">

            <li><a href="<?php echo e(route('orders.show_list_directory')); ?>"><?php echo e(trans('store.your_wish_lists')); ?></a></li>

            <li><?php echo e($wishListName); ?></li>

        </ol>
        <?php if($hasWishList || $hasLaterCart): ?>
            <div class="panel panel-primary">

                <div class="panel-heading">
                    <h6>
                        <span class="glyphicon glyphicon-gift"></span>&nbsp;
                        <?php echo e(trans('store.wish_list')); ?>

                        <?php if(trim($wishListName) != ''): ?>
                            &nbsp;-&nbsp;<?php echo e($wishListName); ?>

                        <?php endif; ?>
                    </h6>
                </div>

                <div class="panel-body">

                    

                    <?php if($hasWishList): ?>
                        <div class="row hidden-xs">
                            <div class="col-sm-9 text-left">
                                <h6><?php echo e(trans('store.wish_list_view.products_in_wish_list')); ?></h6>
                            </div>
                            <div class="col-sm-1 text-center">
                                <h6><?php echo e(trans('store.quantity')); ?></h6>
                            </div>
                            <div class="col-sm-2 text-right">
                                <h6><?php echo e(trans('store.price')); ?></h6>
                            </div>
                        </div>

                        <hr>

                        <?php $__currentLoopData = $cart->details; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $detail): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>

                            <div class="row">
                                <div class="col-sm-4 col-xs-8 text-center">
                                    <img  class="img-rounded" src='<?php echo e(\App\Helpers\Utility::getStoragePath() . $detail->product->features['images'][0]); ?>' alt="<?php echo e($detail->product->name); ?>" width="100%" height="300px">
                                </div>

                                <div class="col-sm-5 col-xs-8 text-left">
                                    <h6>
                                        <a href="<?php echo e(action('ProductsController@show', $detail->product->id)); ?>">
                                            <?php echo e($detail->product->name); ?>

                                        </a>
                                    </h6>
                                   <a href="<?php echo e(action('OrdersController@removeFromOrder', ['wishlist', $detail->product->id, $cart->id])); ?>">
                                        <?php echo e(trans('store.delete')); ?>

                                   </a> |
                                    <a href="<?php echo e(action('OrdersController@moveFromOrder', ['wishlist','cart', $detail->product->id])); ?>">
                                        <?php echo e(trans('store.moveToCart')); ?>

                                    </a>
                                </div>

                                <div class="col-sm-1 col-xs-4 text-center">
                                    <h6 class="hidden-xs">
                                        <?php echo e($detail->quantity); ?>

                                    </h6>
                                    <span class="visible-xs"><br>
                                        <?php echo e(trans('store.quantity').' '.$detail->quantity); ?>

                                    </span>
                                </div>

                                <div class="col-sm-2 col-xs-4 text-right">
                                    <h6 class="hidden-xs">
                                        <?php echo e(Utility::showPrice($detail->price)); ?>

                                    </h6>
                                    <span class="visible-xs"><br>
                                        <?php echo e(Utility::showPrice($detail->price)); ?>

                                    </span>
                                </div>

                            </div>
                            <hr>

                        <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                    <?php endif; ?>

                    

                    <?php if($hasLaterCart): ?>
                        <div class="page-header">
                            <h5><?php echo e(trans('store.productsSavedForLater')); ?></h5>
                        </div>

                        <?php $__currentLoopData = $laterCart->details; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $detail): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>

                            <div class="row">
                                <div class="col-lg-2 text-center">
                                    <img  class="img-rounded" src='<?php echo e(\App\Helpers\Utility::getStoragePath() . $detail->product->features['images'][0]); ?>' alt="<?php echo e($detail->product->name); ?>" width="90" height="90">
                                </div>
                                <div class="col-lg-7 text-left">
                                    <h6>
                                        <a href="<?php echo e(action('ProductsController@show', $detail->product->id)); ?>"><?php echo e($detail->product->name); ?></a>
                                    </h6>
                                    <a href="<?php echo e(action('OrdersController@removeFromOrder', ['later', $detail->product->id])); ?>">
                                    <?php echo e(trans('store.delete')); ?></a> |
                                    <a href="<?php echo e(action('OrdersController@moveFromOrder', ['later','cart', $detail->product->id])); ?>">
                                    <?php echo e(trans('store.moveBackToCart')); ?></a>
                                </div>
                                <div class="col-lg-1 text-center">
                                    <h6><?php echo e($detail->quantity); ?></h6>
                                </div>
                                <div class="col-lg-2 text-right">
                                    <h6><?php echo e(Utility::showPrice($detail->price)); ?></h6>
                                </div>
                            </div>

                        <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                    <?php endif; ?>

                </div> 

                <div class="panel-footer clearfix">
                    <div class="row">
                        <div class="col-md-12">
                            <?php echo e(trans('store.priceDisclaimer')); ?>

                        </div>
                    </div>
                    <div class="row">&nbsp;</div>
                    <div class="row">
                        <div class="col-md-12">
                            <a class="btn btn-success btn-sm" href="<?php echo e(route('products')); ?>">
                                <span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;
                                <?php echo e(trans('store.continue_shopping')); ?>

                            </a>
                        </div>
                    </div>
                </div>  

            </div> 

        
        <?php else: ?>

            <div class="row">&nbsp;</div>

            <div class="alert alert-warning" role="alert">

                <div class="row">
                    <div class="col-lg-12 text-center">
                        <strong class="text-center">
                            <?php echo e(str_replace('[name]', '('.ucfirst ($wishListName).')', trans('store.wish_list_view.empty_list_title'))); ?>

                        </strong>
                    </div>
                </div>
                <div class="row">&nbsp;</div>
                <div class="row">
                    <div class="col-lg-12 text-center"><?php echo e(trans('store.wish_list_view.empty_list_message')); ?></div>
                </div>

            </div>

            <div class="row">&nbsp;</div>

        <?php endif; ?> 

        <?php if(isset($suggestions) && is_array($suggestions)): ?>
            <div class="page-header">
                <h5><?php echo e(trans('store.suggestions.wish')); ?></h5>
            </div>
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

    <?php $__env->stopSection(); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>