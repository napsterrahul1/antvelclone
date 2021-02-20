<?php $__env->startSection('title'); ?>@parent  - <?php echo e(trans('user.your_sales')); ?> <?php $__env->stopSection(); ?>
<?php $__env->startSection('page_class'); ?> 'products_view' <?php $__env->stopSection(); ?>

<?php echo $__env->make('partial.message', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

<?php $__env->startSection('css'); ?>
    @parent
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

    @parent
    <?php $__env->startSection('panel_left_content'); ?>
        <?php echo $__env->make('user.partial.menu_dashboard', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
    <?php $__env->stopSection(); ?>
    <?php $__env->startSection('center_content'); ?>

        <div class="page-header">
            <?php if((\Auth::user()->role == 'admin') || (\Auth::user()->role == 'subadmin')): ?>
                <h5><?php echo e(trans('user.all_orders')); ?></h5>
            <?php else: ?>
                <h5><?php echo e(trans('user.your_sales')); ?></h5>
            <?php endif; ?>
        </div>

        <?php echo $__env->make('orders.partial.filterInputs', ['filter' => $dateFrom.'*'.$dateTo], array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

        <div ng-controller="Orders">

            <div class="tabbable">
                <ul class="nav nav-tabs hidden-xs">
                    <li class="<?php echo e($select == 'open' || $select == '' ? 'active' : ''); ?>"><a href="#pane1" data-toggle="tab"><?php echo e(trans('store.openOrders')); ?>&nbsp;<span class="badge colorred"><?php echo e(count($openOrders)); ?></span></a></li>
                     <li class="<?php echo e($select == 'rate' ? 'active' : ''); ?>"><a href="#pane4" data-toggle="tab"><?php echo e(trans('store.unrated_orders')); ?>&nbsp;<span class="badge colorred"><?php echo e(count($unRate)); ?></span></a></li>
                    <li class="<?php echo e($select == 'closed' ? 'active' : ''); ?>"><a href="#pane2" data-toggle="tab"><?php echo e(trans('store.closedOrders')); ?> <span class="badge colorred"> <?php echo e(count($closedOrders)); ?></span></a></li>
                    <li class="<?php echo e($select == 'canceled' ? 'active' : ''); ?>"><a href="#pane3" data-toggle="tab"><?php echo e(trans('store.canceledOrders')); ?> <span class="badge colorred"><?php echo e(count($cancelledOrders)); ?></span></a></li>
                </ul>
                <div class="visible-xs-block">
                    <a href="#pane1" data-toggle="tab"><?php echo e(trans('store.open')); ?>&nbsp;<span class="badge colorred"><?php echo e(count($openOrders)); ?></span></a> -
                    <a href="#pane4" data-toggle="tab"><?php echo e(trans('store.unrated')); ?>&nbsp;<span class="badge colorred"><?php echo e(count($unRate)); ?></span></a> -
                    <a href="#pane2" data-toggle="tab"><?php echo e(trans('store.closed')); ?> <span class="badge colorred"> <?php echo e(count($closedOrders)); ?></span></a> -
                    <a href="#pane3" data-toggle="tab"><?php echo e(trans('store.cancelled')); ?> <span class="badge colorred"><?php echo e(count($cancelledOrders)); ?></span></a>
                </div>

                <div class="row">
                    &nbsp;
                </div>

                <div class="tab-content">

                    
                    <div id="pane1" class="tab-pane fade <?php echo e($select == 'open' || $select == ''?'in active':''); ?>">
                        <?php if(count($openOrders) > 0): ?>
                            <div class="row">
                                <div class="col-lg-12">
                                    <table class="table table-hover table-responsive">
                                        <thead>
                                            <tr>
                                                <th class="text-center"><?php echo e(trans('store.order_label')); ?></th>
                                                <th class="text-left"><?php echo e(trans('globals.customer_name')); ?></th>
                                                <th class="text-center"><?php echo e(trans('user.email')); ?></th>
                                                <th class="text-center"><?php echo e(trans('store.updated_on')); ?></th>
                                                <th class="text-center"><?php echo e(trans('store.items')); ?></th>
                                                <th class="text-right"><?php echo e(trans('globals.total')); ?></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php $__currentLoopData = $openOrders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $order): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                                            <?php $total = \Utility::totalOrder($order->details); ?>
                                            <tr>
                                                <td class="text-center">
                                                    <?php if(\Auth::user()->role == 'person'): ?>
                                                        <a href="<?php echo e(route('orders.show_order', $order->id)); ?>">#<?php echo e(\Utility::codeMasked($order->id)); ?></a>
                                                    <?php else: ?>
                                                        <a href="<?php echo e(route('orders.show_seller_order', $order->id)); ?>">#<?php echo e(\Utility::codeMasked($order->id)); ?></a>
                                                    <?php endif; ?>
                                                </td>
                                                <td class="text-left"><?php echo e($order->user->profile['fullName']); ?></td>
                                                <td class="text-center"><a href="mailto:<?php echo e($order->user->email); ?>"><?php echo e($order->user->email); ?></a></td>
                                                <td class="text-center"><?php echo e(Carbon\Carbon::parse($order->updated_at)->format('F j, Y')); ?></td>
                                                <td class="text-center"><?php echo e($total['qty']); ?></td>
                                                <td class="text-right"><?php echo e(\Utility::showPrice($total['total'])); ?></td>
                                            </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <?php echo $openOrders->appends(['show' => 'open', 'filter' => $dateFrom.'*'.$dateTo])->render(); ?>

                                </div>
                            </div>
                        <?php else: ?>
                            <div class="row">
                                <div class="col-lg-12">
                                    <h6 class="alert-danger jumbotron">
                                        <span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;
                                        <?php echo e(trans('store.noOpenOrders')); ?>!
                                    </h6>
                                </div>
                            </div>
                        <?php endif; ?>
                    </div>

                    
                    <div id="pane2" class="tab-pane fade <?php echo e($select=='closed'?'in active':''); ?>">
                        <?php if(count($closedOrders) > 0): ?>
                            <div class="row">
                                <div class="col-lg-12">
                                    <table class="table table-hover table-responsive">
                                        <thead>
                                            <tr>
                                                <th class="text-center"><?php echo e(trans('store.order_label')); ?></th>
                                                <th class="text-left"><?php echo e(trans('globals.customer_name')); ?></th>
                                                <th class="text-center"><?php echo e(trans('user.email')); ?></th>
                                                <th class="text-center"><?php echo e(trans('store.updated_on')); ?></th>
                                                <th class="text-center"><?php echo e(trans('store.items')); ?></th>
                                                <th class="text-right"><?php echo e(trans('globals.total')); ?></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php $__currentLoopData = $closedOrders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $order): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                                            <?php $total = \Utility::totalOrder($order->details); ?>
                                            <tr>
                                                <td class="text-center">
                                                    <?php if(\Auth::user()->role == 'person'): ?>
                                                        <a href="<?php echo e(route('orders.show_order', $order->id)); ?>">#<?php echo e(\Utility::codeMasked($order->id)); ?></a>
                                                    <?php else: ?>
                                                        <a href="<?php echo e(route('orders.show_seller_order', $order->id)); ?>">#<?php echo e(\Utility::codeMasked($order->id)); ?></a>
                                                    <?php endif; ?>
                                                </td>
                                                <td class="text-left"><?php echo e($order->user->profile['fullName']); ?></td>
                                                <td class="text-center"><a href="mailto:<?php echo e($order->user->email); ?>"><?php echo e($order->user->email); ?></a></td>
                                                <td class="text-center"><?php echo e(Carbon\Carbon::parse($order->updated_at)->format('F j, Y')); ?></td>
                                                <td class="text-center"><?php echo e($total['qty']); ?></td>
                                                <td class="text-right"><?php echo e(\Utility::showPrice($total['total'])); ?></td>
                                            </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <?php echo $closedOrders->appends(['show'=>'closed', 'filter' => $dateFrom.'|'.$dateTo])->render(); ?>

                                </div>
                            </div>
                        <?php else: ?>
                            <div class="row">
                                <div class="col-lg-12">
                                    <h6 class="alert-danger jumbotron">
                                        <span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;
                                        <?php echo e(trans('store.noClosedOrders')); ?>!
                                    </h6>
                                </div>
                            </div>
                        <?php endif; ?>
                    </div>

                    
                    <div id="pane3" class="tab-pane fade <?php echo e($select=='canceled'?'in active':''); ?>">
                        <?php if(count($cancelledOrders) > 0): ?>
                            <div class="row">
                                <div class="col-lg-12">
                                    <table class="table table-hover table-responsive">
                                        <thead>
                                            <tr>
                                                <th class="text-center"><?php echo e(trans('store.order_label')); ?></th>
                                                <th class="text-left"><?php echo e(trans('globals.customer_name')); ?></th>
                                                <th class="text-center"><?php echo e(trans('user.email')); ?></th>
                                                <th class="text-center"><?php echo e(trans('store.updated_on')); ?></th>
                                                <th class="text-center"><?php echo e(trans('store.items')); ?></th>
                                                <th class="text-right"><?php echo e(trans('globals.total')); ?></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php $__currentLoopData = $cancelledOrders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $order): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                                            <?php $total = \Utility::totalOrder($order->details); ?>
                                            <tr>
                                                <td class="text-center">
                                                    <?php if(\Auth::user()->role == 'person'): ?>
                                                        <a href="<?php echo e(route('orders.show_order', $order->id)); ?>">#<?php echo e(\Utility::codeMasked($order->id)); ?></a>
                                                    <?php else: ?>
                                                        <a href="<?php echo e(route('orders.show_seller_order', $order->id)); ?>">#<?php echo e(\Utility::codeMasked($order->id)); ?></a>
                                                    <?php endif; ?>
                                                </td>
                                                <td class="text-left"><?php echo e($order->user->profile['fullName']); ?></td>
                                                <td class="text-center"><a href="mailto:<?php echo e($order->user->email); ?>"><?php echo e($order->user->email); ?></a></td>
                                                <td class="text-center"><?php echo e(Carbon\Carbon::parse($order->updated_at)->format('F j, Y')); ?></td>
                                                <td class="text-center"><?php echo e($total['qty']); ?></td>
                                                <td class="text-right"><?php echo e(\Utility::showPrice($total['total'])); ?></td>
                                            </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <?php echo $cancelledOrders->appends(['show'=>'canceled', 'filter' => $dateFrom.'|'.$dateTo])->render(); ?>

                                </div>
                            </div>
                        <?php else: ?>
                            <div class="row">
                                <div class="col-lg-12">
                                    <h6 class="alert-danger jumbotron">
                                        <span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;
                                        <?php echo e(trans('store.noCanceledOrders')); ?>!
                                    </h6>
                                </div>
                            </div>
                        <?php endif; ?>
                    </div>

                    
                    <div id="pane4" class="tab-pane fade <?php echo e($select=='rate'?'in active':''); ?>">
                        <?php if(count($unRate) > 0): ?>
                            <div class="row">
                                <div class="col-lg-12">
                                    <table class="table table-hover table-responsive">
                                        <thead>
                                            <tr>
                                                <th class="text-center"><?php echo e(trans('store.order_label')); ?></th>
                                                <th class="text-left"><?php echo e(trans('globals.customer_name')); ?></th>
                                                <th class="text-center"><?php echo e(trans('user.email')); ?></th>
                                                <th class="text-center"><?php echo e(trans('store.updated_on')); ?></th>
                                                <th class="text-center"><?php echo e(trans('store.items')); ?></th>
                                                <th class="text-right"><?php echo e(trans('globals.total')); ?></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php $__currentLoopData = $unRate; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $order): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                                            <?php $total = \Utility::totalOrder($order->details); ?>
                                            <tr>
                                                <td class="text-center">
                                                    <?php if(\Auth::user()->role == 'person'): ?>
                                                        <a href="<?php echo e(route('orders.show_order', $order->id)); ?>">
                                                            #<?php echo e(\Utility::codeMasked($order->id)); ?>

                                                        </a>
                                                    <?php else: ?>
                                                        <a href="<?php echo e(route('orders.show_seller_order', $order->id)); ?>">
                                                            #<?php echo e(\Utility::codeMasked($order->id)); ?>

                                                        </a>
                                                    <?php endif; ?>
                                                    <span class="badge"> <?php echo e($order->status); ?></span>
                                                </td>
                                                <td class="text-left"><?php echo e($order->user->profile['fullName']); ?></td>
                                                <td class="text-center"><a href="mailto:<?php echo e($order->user->email); ?>"><?php echo e($order->user->email); ?></a></td>
                                                <td class="text-center"><?php echo e(Carbon\Carbon::parse($order->updated_at)->format('F j, Y')); ?></td>
                                                <td class="text-center"><?php echo e($total['qty']); ?></td>
                                                <td class="text-right"><?php echo e(\Utility::showPrice($total['total'])); ?></td>
                                            </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <?php echo $unRate->appends(['show'=>'rate', 'filter' => $dateFrom.'|'.$dateTo])->render(); ?>

                                </div>
                            </div>
                        <?php else: ?>
                            <div class="row">
                                <div class="col-lg-12">
                                    <h6 class="alert-danger jumbotron">
                                        <span class="glyphicon glyphicon-exclamation-sign"></span>&nbsp;
                                        <?php echo e(trans('store.noProductsRare')); ?>!
                                    </h6>
                                </div>
                            </div>
                        <?php endif; ?>
                    </div>

                </div><!-- /.tab-content -->
            </div><!-- /.tabbable -->

        </div> 
    <?php $__env->stopSection(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
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
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>