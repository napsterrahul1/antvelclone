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
            <h5><?php echo e(trans('user.seller')); ?></h5>
        </div>
        
            
                
               
            
        
         </div>
    </div>
    <div ng-controller="Orders">

        
            <table class="table table-striped table-bordered datatable" id="buyer_list" cellspacing="0" width="100%" style="margin-right:5px;">
                <thead>
                <tr>
                    <th style="">Sr. No.</th>
                    <th style="">Name</th>
                    <th>Email</th>
                    <th>Mobile Number</th>
                    <th>Email-Verified</th>
                    <th>Approve/Reject</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <?php $t=1 ?>
                <?php $__currentLoopData = $sellerList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $seller): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                    <tr>
                        <td><?php echo e($t++); ?></td>
                        <td><?php echo e($seller->person ? $seller->person->first_name : ''); ?> <?php echo e($seller->person ? $seller->person->last_name : ''); ?></td>
                        <td><?php echo e($seller->email); ?></td>
                        <td><?php echo e($seller->mobile_phone); ?></td>
                        <td style="text-transform: capitalize">
                            <?php echo e($seller->verified); ?>

                        </td>
                        <td>
                            <?php if($seller->type == 'normal'): ?>
                                <br>
                                <span style="text-align: center">Normal</span>
                            <?php elseif($seller->type == 'trusted'): ?>
                                <span style="text-align: center">Approved</span>
                            <?php elseif($seller->type == 'rejected'): ?>
                                <span style="text-align: center">Rejected</span>
                            <?php endif; ?>
                        </td>
                        <td style="text-transform: capitalize;width: 18%">
                            <a href="<?php echo e(url('user/'.$seller->id.'/edit')); ?>" class="btn btn-info">Edit</a>
                            <?php if(Auth::user()->role != 'subadmin'): ?>
                        <?php if($seller->verified == 'yes'): ?>
                            <?php if($seller->type == 'normal'): ?>
                                <a href="<?php echo e(url('user/seller/approve/'.$seller->id)); ?>" class="btn btn-success">Approve</a>
                                    <br>
                                <a href="<?php echo e(url('user/seller/reject/'.$seller->id)); ?>" class="btn btn-danger">Reject</a>
                            <?php endif; ?>
                                <a style="float: right" href="<?php echo e(url('user/seller/disable/'.$seller->id)); ?>" class="btn btn-danger">Disable</a>

                        <?php else: ?>
                                <a style="float: right" href="<?php echo e(url('user/seller/enable/'.$seller->id)); ?>" class="btn btn-success">Enable</a>
                            <?php endif; ?>
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                </tbody>

            </table>

        

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