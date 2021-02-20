<?php $__env->startSection('title'); ?>@parent  - <?php echo e(trans('product.globals.categories')); ?> <?php $__env->stopSection(); ?>
<?php $__env->startSection('panel_left_content'); ?>
@parent
<?php $__env->stopSection(); ?>
<?php $__env->startSection('center_content'); ?>
<div class="container-fluid">
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading" ng-init="search=''">
                <h6><span class="glyphicon glyphicon-tasks"></span> <?php echo e(trans('product.globals.categories')); ?>

                <a href="<?php echo e(url('wpanel/category/create')); ?>" class="btn btn-default btn-md pull-right"><?php echo e(trans('store.new_category')); ?></a>
                </h6>
            </div>
            <div class="panel-body" style="min-height:500px;">
                <input type="search" ng-model="search" class="form-control" placeholder="<?php echo e(trans('globals.search_for')); ?> <?php echo e(trans('product.inputs_view.name')); ?>"/>
                <?php echo $__env->make('categories.list_childs', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('script'); ?>
@parent
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.wpanel', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>