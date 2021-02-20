<?php $__env->startSection('title'); ?>@parent  - 404 <?php echo e(trans('globals.404_error.title')); ?>  <?php $__env->stopSection(); ?>

<?php $__env->startSection('classPanel'); ?> error-404 <?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

	<h1> <span class="glyphicon glyphicon-alert"></span> <?php echo e($main_company['name']); ?> 404!</h1>
	
	<p class="lead">
		
		<?php echo e(trans('globals.404_error.message_01')); ?>

		
		<a href="javascript.void(0)" onclick="window.history.back();" style="background-color: yellow;"><?php echo e(trans('globals.404_error.link_01')); ?></a>
		
		<?php echo e(trans('globals.404_error.message_02')); ?> <a href="<?php echo url('/'); ?>" style="background-color: yellow;"><?php echo e(trans('globals.404_error.link_02')); ?></a>
	</p>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('btn-back'); ?>
	<span class="glyphicon glyphicon-home"></span> <?php echo e(trans('globals.404_error.link_02')); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.notfound', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>