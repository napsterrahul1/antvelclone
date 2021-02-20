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
            <h5><?php echo e(trans('user.product')); ?></h5>
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
                <?php $__currentLoopData = $productList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>

                <tr <?php if($product->product_status == 'pending'): ?> style="background-color: #00bdef;color: white" <?php endif; ?>>
                    <td><?php echo e($t++); ?></td>
                    <td><?php echo e($product->product->nickname); ?> </td>
                    <td><?php echo e($product->name); ?></td>
                    <td><?php echo e($product->price); ?></td>
                    <td style="text-transform: capitalize"><?php echo e($product->stock); ?></td>
                    <td style="text-transform: capitalize"><a href="<?php echo url('products/'.$product->id); ?>">
                            <?php if($product->product_status == 'pending'): ?>

                            <span class="label label-danger">Pending</span>
                    <?php else: ?>
                            <span class="label label-warning">view</span>
                        <?php endif; ?>
                        </a></td>
                </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                </tbody>

            </table>

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