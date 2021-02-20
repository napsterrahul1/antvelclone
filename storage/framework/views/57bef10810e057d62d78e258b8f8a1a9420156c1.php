<?php $__env->startSection('title'); ?>@parent  - <?php echo e(trans('store.cart_view.your_shopping_cart')); ?> <?php $__env->stopSection(); ?>

<?php $__env->startSection('page_class'); ?>products_view <?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumbs'); ?>
    @parent

    <?php if(isset($isResume)): ?>

        <?php echo Breadcrumbs::render('shoppingCartResume', $cartAddress->id); ?>


    <?php else: ?>

        <?php echo Breadcrumbs::render('shoppingCart'); ?>


    <?php endif; ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    @parent

    <?php $__env->startSection('center_content'); ?>

    <div class="panel panel-default" ng-controller = "ShoppingCart" >

        <div class="panel-heading">
            <h6><span class="glyphicon glyphicon-shopping-cart"></span> <?php echo e(trans('store.cart_view.your_shopping_cart')); ?></h6>
        </div>

        <div class="panel-body cart-resume">
            <?php echo $__env->make('partial.message', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

            
            <?php if(isset($isResume)): ?>
                <div class="alert alert-warning text-center text-small">
                    <h6><span class="fa fa-exclamation"></span>&nbsp;<?php echo e(trans('store.reviewOrder')); ?></h6>
                </div>
            <?php endif; ?>

            <?php if(count($cart['details']) == 0): ?>
                <div class="alert alert-warning text-center text-small">
                    <h6><?php echo e(trans('store.noCart')); ?></h6>
                    <?php if(!$user): ?>
                        <small><?php echo e(trans('store.cart_view.not_logged_disclaimer')); ?></small>
                    <?php endif; ?>
                    <p>&nbsp;</p>
                    <a class="btn btn-primary" href="<?php echo e(route('products')); ?>"><?php echo e(trans('store.continue_shopping')); ?></a>
                </div>
            <?php endif; ?>

            
            <?php if(count($cart['details']) > 0): ?>
                <div class="row">
                    <div class="col-xs-12 col-md-7 col-lg-8 text-left text-small">
                       <?php echo e(trans('store.productsInCart')); ?> <span class="ng-cloak">[[totalItems]]</span> <?php echo e(trans('store.items')); ?>: <strong class="ng-cloak">[[ totalAmount | currency:"<?php echo e(config('app.payment_method')); ?> " ]]</strong>
                    </div>
                    <div class="col-xs-12 col-md-5 col-lg-4 text-center">
                        <div class="form-inline clearfix">
                            <div class="btn-group pull-right">
                                <?php if(isset($isResume)): ?>
                                    <form action="https://test.payu.in/_payment" method="post" name="payuForm">
                                        <?php echo csrf_field(); ?>

                                        <input type="hidden" name="key" value="<?php echo $merchantkey ?>" />
                                        <input type="hidden" name="hash" value="<?php echo $hash ?>"/>
                                        <input type="hidden" name="txnid" value="<?php echo $txnid ?>" />
                                        <input type="hidden" name="amount" value="<?php echo '10' ?>" />
                                        <input type="hidden" name="firstname" value="<?php echo $user->firstname ?>" />
                                        <input type="hidden" name="email" value="<?php echo $user->email ?>" />
                                        <input type="hidden" name="phone" value="<?php echo '9403326847' ?>" />
                                        <input type="hidden" name="productinfo" value="<?php echo 'fastrack' ?>" />
                                        <input type="hidden" name="surl" value="<?php echo url('user/orders/success') ?>" />
                                        <input type="hidden" name="furl" value="<?php echo url('user/orders/failure') ?>" />
                                        <input type="hidden" name="service_provider" value="<?php echo 'payu_paisa' ?>" />
                                        <input type="hidden" name="lastname" value="<?php echo $user->lastname ?>" />
                                        <input type="hidden" name="curl" value="<?php echo url('user/orders/cancelorder') ?>" />
                                        <input type="hidden" name="address1" value="<?php echo $cartAddress->line1 ?>" />
                                        <input type="hidden" name="city" value="<?php echo $cartAddress->city ?>" />
                                        <input type="hidden" name="state" value="<?php echo $cartAddress->state ?>" />
                                        <input type="hidden" name="country" value="<?php echo $cartAddress->country ?>" />
                                        <input type="hidden" name="zipcode" value="<?php echo '411052' ?>" />
                                        <button class="btn btn-info" type="submit">
                                            <span class="fa fa-check-square-o"></span>&nbsp;
                                            <?php echo e(trans('store.placeYourOrder')); ?> online
                                        </button>
                                    </form><br>
                                    <a class="btn btn-info" href="<?php echo e(route('orders.place_order','cart')); ?>">
                                        <span class="fa fa-check-square-o"></span>&nbsp;Cash on Delivery
                                     </a>

                                    <?php else: ?>
                                    <a class="btn btn-info" href="<?php echo e(route('orders.check_out')); ?>">
                                        <span class="fa fa-credit-card"></span>&nbsp;
                                        <?php echo e(trans('store.checkOutCart')); ?>

                                    </a>
                                <?php endif; ?>
                            </div>

                            <?php if(isset($user) && $user->isTrusted() && config('app.offering_free_products')): ?>

                                <div class="btn-group pull-right">
                                    <a href="<?php echo e(route('freeproducts.create',[$cart->id])); ?>" type="button" class="btn btn-success"><?php echo e(trans('freeproduct.create')); ?></a>
                                    &nbsp;
                                </div>

                            <?php endif; ?>
                        </div>
                    </div>
                </div>
                <hr/>
            <?php endif; ?>

            
            <div class="row">
                <?php $__currentLoopData = $cart['details']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>

                    <div class="text-small col-lg-6">

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <a ng-controller="ModalCtrl" ng-init='data={"data":"<?php echo e($item['product']['id']); ?>"}' ng-click="modalOpen({templateUrl: base_url+'modalDetailsProductCart',controller:'getDetailsProductInCart',resolve:'data'})">
                                <img class="thumbnail" src='<?php echo e(\App\Helpers\Utility::getStoragePath() . $item["product"]["features"]["images"][0]); ?>' alt="<?php echo e($item['product']['name']); ?>" height="150" width="150">
                            </a>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">

                            <h6>
                                <a ng-controller="ModalCtrl" ng-init='data={"data":"<?php echo e($item['product']['id']); ?>"}' ng-click="modalOpen({templateUrl: base_url+'modalDetailsProductCart',controller:'getDetailsProductInCart',resolve:'data'})">
                                    <?php echo e($item['product']['name']); ?>

                                </a>
                            </h6>

                            <div>
                                <strong><?php echo e(Utility::showPrice($item['price'])); ?></strong>
                            </div>

                            <div>
                                <?php if(isset($isResume)): ?>
                                    <?php echo e($item['quantity'].' '.trans('store.items')); ?>

                                <?php else: ?>
                                    <strong>
                                        <?php if($item['product']['type'] != 'item'): ?>
                                            <span><?php echo e($item['quantity']); ?></span>
                                        <?php else: ?>

                                            <?php if($user): ?>
                                                <select class="form-control col-lg-6" name="cartQty" id="cartQty" ng-init = "cart['<?php echo e($item["product"]["id"]); ?>'] = '<?php echo e($item["quantity"]); ?>'" ng-model = "cart['<?php echo e($item['product']['id']); ?>']" ng-change = "changeQuantity('<?php echo e($cart["id"]); ?>', '<?php echo e($item["id"]); ?>', cart['<?php echo e($item["product"]["id"]); ?>'])" >

                                                    <?php for($i=1; $i<$item['product']['stock']; $i++): ?>

                                                    <option ng-selected="'<?php echo e($i); ?>' == '<?php echo e($item["quantity"]); ?>' " value="<?php echo e($i); ?>"><?php echo e($i); ?></option>

                                                    <?php endfor; ?>


                                                </select>
                                            <?php else: ?>
                                                 <span><?php echo e($item['quantity']); ?></span>
                                            <?php endif; ?>

                                            <small><?php echo e(trans('store.items')); ?></small>

                                        <?php endif; ?>
                                    </strong>
                                <?php endif; ?>
                            </div>

                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-small">
                            <a href="<?php echo e(action('OrdersController@removeFromOrder', ['cart', $item['product']['id']])); ?>"><?php echo e(trans('store.delete')); ?></a>
                            <?php if(isset($user)): ?>
                                | <a href="<?php echo e(action('OrdersController@moveFromOrder', ['cart', 'later', $item['product']['id']])); ?>"><?php echo e(trans('store.saveForLater')); ?></a>
                                | <a ng-controller="ModalCtrl" href="javascript:void(0)" ng-init='data={"data":"<?php echo e($item['product']['id']); ?>"}' ng-click="modalOpen({templateUrl: base_url+'modalDetailsProductCart',controller:'getDetailsProductInCart',resolve:'data'})"><?php echo e(trans('product.globals.view_details')); ?></a>
                            <?php endif; ?>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><hr/></div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
            </div>

            <!-- Address -->
            <?php if(isset($isResume) && count($cart['details']) > 0): ?>
                <div class="row">
                    <div class="col-xs-8 col-sm-9 col-md-6 col-lg-4">
                        <div class="panel panel-success">
                            <div class="panel-heading"><?php echo e(trans('store.shipToThisAddress')); ?></div>
                            <div class="panel-body">
                                <address>
                                    <strong><?php echo e($cartAddress->name_contact); ?></strong><br>
                                    <?php echo e($cartAddress->line1); ?>[[address.line1]]<br>
                                    <span ng-hide="address.details.line2 != ''"><?php echo e($cartAddress->line2); ?><br></span>
                                    <?php echo e($cartAddress->city); ?>, <?php echo e($cartAddress->state); ?><br>
                                    <?php echo e($cartAddress->country); ?><br>
                                    <?php echo e($cartAddress->phone); ?><br>
                                </address>
                            </div>
                            <div class="panel-footer"><a class="btn btn-success btn-sm" href="<?php echo e(route('orders.check_out')); ?>"><?php echo e(trans('globals.change_label')); ?></a></div>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

        </div> 

        <?php if(count($cart['details']) > 0): ?>
            <div class="panel-footer"><?php echo e(trans('store.priceDisclaimer')); ?></div>
        <?php endif; ?>

    </div> 


    

    <?php if($user && isset($laterCart) && count($laterCart['details']) > 0): ?>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h6><span class="glyphicon glyphicon-floppy-saved"></span> <?php echo e(trans('store.productsSavedForLater')); ?></h6>
            </div>
            <div class="panel-body">
                <div class="row">
                    <?php $__currentLoopData = $laterCart['details']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>

                        <div class="text-small col-lg-6">

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <a ng-controller="ModalCtrl" ng-init='data={"data":"<?php echo e($item['product']['id']); ?>"}' ng-click="modalOpen({templateUrl: base_url +'modalDetailsProductCart',controller:'getDetailsProductInCart',resolve:'data'})">
                                    <img class="thumbnail" src='<?php echo e(\App\Helpers\Utility::getStoragePath() . $item["product"]["features"]["images"][0]); ?>' alt="<?php echo e($item['product']['name']); ?>" height="150" width="150">
                                </a>
                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">

                                <h6>
                                    <a ng-controller="ModalCtrl" ng-init='data={"data":"<?php echo e($item['product']['id']); ?>"}' ng-click="modalOpen({templateUrl: base_url+'modalDetailsProductCart',controller:'getDetailsProductInCart',resolve:'data'})">
                                        <?php echo e($item['product']['name']); ?>

                                    </a>
                                </h6>

                                <div>
                                    <strong><?php echo e(Utility::showPrice($item['price'])); ?></strong>
                                </div>

                                <div>
                                    <?php if(isset($isResume)): ?>
                                        <?php echo e($item['quantity'].' '.trans('store.items')); ?>

                                    <?php else: ?>
                                        <strong>
                                            <?php if($item['product']['type'] != 'item'): ?>
                                                <span><?php echo e($item['quantity']); ?></span>
                                            <?php else: ?>
                                                <select class="form-control col-lg-6" name="quantity" id="quantity">

                                                    <?php for($i=0; $i<$item['product']['stock']; $i++): ?>

                                                    <option value="<?php echo e($i); ?>" <?php echo e(($item['quantity'] == $i) ? 'selected' : ''); ?>><?php echo e($i); ?></option>

                                                    <?php endfor; ?>

                                                </select> <small><?php echo e(trans('store.items')); ?></small>
                                            <?php endif; ?>
                                        </strong>
                                    <?php endif; ?>
                                </div>

                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-small">
                                <a href="<?php echo e(action('OrdersController@removeFromOrder', ['later', $item['product']['id']])); ?>"><?php echo e(trans('store.delete')); ?></a>
                                <?php if(isset($user)): ?>
                                    | <a href="<?php echo e(action('OrdersController@moveFromOrder', ['later','cart', $item['product']['id']])); ?>"><?php echo e(trans('store.moveToCart')); ?></a>
                                    | <a ng-controller="ModalCtrl" href="javascript:void(0)" ng-init='data={"data":"<?php echo e($item['product']['id']); ?>"}' ng-click="modalOpen({templateUrl: base_url+'modalDetailsProductCart',controller:'getDetailsProductInCart',resolve:'data'})"><?php echo e(trans('product.globals.view_details')); ?></a>
                                <?php endif; ?>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><hr/></div>
                        </div>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                </div>
            </div> 
            <div class="panel-footer"><?php echo e(trans('store.priceDisclaimer')); ?></div>
        </div> 

    <?php endif; ?>

    <?php if(isset($suggestions) && is_array($suggestions)): ?>
        <div class="row">&nbsp;</div>
        <div class="page-header">
            <h5><?php echo e(trans('store.suggestions.cart')); ?></h5>
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

<?php $__env->startSection('scripts'); ?>
    @parent
    <?php echo Html::script('js/star-rating.js'); ?>

    <script>
        (function(app){
            app.controller('ShoppingCart', ['$scope','$http', function($scope, $http)
            {
                $scope.totalAmount = '<?php echo e($totalAmount); ?>';
                $scope.totalItems = '<?php echo e($totalItems); ?>';

                $scope.changeQuantity = function(orderId, detailId, newValue)
                {
                    $scope.qtyUrl = "<?php echo e(route('orders.update_order_quantity', ['orderId', 'detailId','newValue'])); ?>";

                    var URLAPI = $scope.qtyUrl.replace('detailId', detailId);

                    URLAPI = URLAPI.replace('newValue', newValue);

                    URLAPI = URLAPI.replace('orderId', orderId);

                    $http.get(URLAPI)
                        .success(function(data)
                        {
                            var qtyDiff = data.detail.quantity - data.oldQuantity;

                            var priceDiff = qtyDiff * data.detail.price;

                            $scope.totalAmount = Number($scope.totalAmount) + priceDiff;

                            $scope.totalItems = Number($scope.totalItems) + qtyDiff;
                        });
                };


            }]);

        })(angular.module("AntVel"));
    </script>
<?php $__env->stopSection(); ?>


<?php echo $__env->make('layouts.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>