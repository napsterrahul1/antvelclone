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
        <div class="row">
            <div class="col-lg-10">
                <h5><?php echo e(trans('user.buyer')); ?></h5>
            </div>
            
                
                    
                    
                
            
        </div>
    </div>
    <div ng-controller="Orders">

        <div class="">
            <table class="table table-striped table-bordered datatable" id="buyer_list" style="margin-right:5px;">
                <thead>
                <tr>
                    <th style="">Sr. No.</th>
                    <th style="">Name</th>
                    <th>Email</th>
                    <th>Mobile Number</th>
                    <th>Email-Verified</th>
                    <th>Action</th>

                </tr>
                </thead>
                <tbody>
                <?php $t=1 ?>
                <?php $__currentLoopData = $buyerList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $buyer): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>

                <tr>
                    <td><?php echo e($t++); ?></td>
                    <td><?php echo e($buyer->person->first_name); ?> <?php echo e($buyer->person->last_name); ?></td>
                    <td><?php echo e($buyer->email); ?></td>
                    <td><?php echo e($buyer->mobile_phone); ?></td>
                    <td style="text-transform: capitalize"><?php echo e($buyer->verified); ?></td>
                    <td>
                        <a href="<?php echo e(url('user/'.$buyer->id.'/edit')); ?>" class="btn btn-info">Edit</a>
                        <?php if(Auth::user()->role != 'subadmin'): ?>
                    <?php if($buyer->verified == 'no'): ?>
                          <a href="<?php echo e(url('user/buyer/enable/'.$buyer->id)); ?>" class="btn btn-success">Enable</a>
                        <?php else: ?>

                        <a href="<?php echo e(url('user/buyer/disable/'.$buyer->id)); ?>" class="btn btn-danger">Disable</a>
                            <?php endif; ?>
                        <?php endif; ?>
                    </td>
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