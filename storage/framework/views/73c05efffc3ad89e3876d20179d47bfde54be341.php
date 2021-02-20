
<style>
    .option:hover
    {
        background-color: #2ecc71 !important;
    }
</style>
<?php
if (isset($productSuggestion)) {
    $auxProduct=isset($product) ? $product : '';
    $product=$productSuggestion;
}
 ?>
<div class="col-xs-6 col-sm-6 col-md-3 clearfix product-overflow">

    
    <div class="thumbnail clearfix product-overflow" ng-controller = "ProductBox">

        <div class="product-price">
            <?php echo \Utility::showPrice($product['price']); ?>

        </div>

        <div class="product-reviews <?php if(!$product['rate_val']): ?> hide <?php endif; ?>">
            <?php echo \Utility::thousandSuffix($product['rate_val']); ?>

            <small>
                <?php echo e(trans_choice('store.review', $product['rate_val'])); ?>

            </small>
        </div>

        <?php if($product['type'] == 'freeproduct'): ?>
            <div class="free-products-box-sign"><span><?php echo e(trans('globals.free')); ?></span></div>
        <?php endif; ?>

        <div class="product-img-box" ng-click = "goTo('<?php echo e(route("products.show",[$product["id"]])); ?>')">
            <?php if(isset($product["features"]["images"][0])): ?>
                <img  src='<?php echo e(\App\Helpers\Utility::getStoragePath() . $product["features"]["images"][0]); ?>?h=250' alt="<?php echo e($product['name']); ?>">
            <?php else: ?>
                <img  src='<?php echo asset('/').'img/no-image.jpg'; ?>'  alt="<?php echo e($product['name']); ?>">
            <?php endif; ?>
        </div>

        <h6 class="product-name">
            <a href = "<?php echo e(route('products.show',[$product['id']])); ?>" style="color: black">
                <?php echo e(str_limit($product['name'], 100,'...')); ?>

            </a>
        </h6>

        

        
        <?php if($product['category_id'] == 3): ?>
            <div class="product-actions">

                
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 wrapper">

                </div>
                
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 wrapper" ng-click = "goTo('<?php echo e(route("products.show",[$product["id"]])); ?>')">
                    <div class="glyphicon glyphicon-eye-open option"></div>
                </div>

                
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 wrapper">
                </div>




            </div>
            <?php else: ?>
        <div class="product-actions">

            
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 wrapper" ng-click="submit('#add-<?php echo e($product["id"]); ?>')">
                <div class = "glyphicon glyphicon-shopping-cart option">
                    <?php if($product['type'] != 'freeproduct'): ?>
                        <?php echo Form::open(['method' => 'put', 'route' => ['orders.add_to_order','cart', $product['id']], 'id' => 'add-'.$product['id'] ]); ?>

                        <?php echo Form::close(); ?>

                    <?php endif; ?>
                </div>
            </div>

            
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 wrapper"  ng-click = "goTo('<?php echo e(route("orders.add_to_order",["wishlist", $product[($product["type"]=="freeproduct")?"parent_id":"id"]])); ?>')">
                <div class="glyphicon glyphicon-heart option"></div>
            </div>

            
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 wrapper" ng-click = "goTo('<?php echo e(route("products.show",[$product["id"]])); ?>')">
                <div class="glyphicon glyphicon-eye-open option"></div>
            </div>

        </div>
        <?php endif; ?>
        

    </div>
    

</div>

<?php
if (isset($productSuggestion)) {
    $product=$auxProduct;
}
 ?>