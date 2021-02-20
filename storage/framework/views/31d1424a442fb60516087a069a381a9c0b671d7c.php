<?php $__env->startSection('page_class'); ?>@parent- <?php echo e(trans('about.contact_us')); ?><?php $__env->stopSection(); ?>
<?php $__env->startSection('navigation'); ?>
  <?php echo $__env->make('partial.navigation_basic', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('panel_left_content'); ?>
<div class="list-group">
  <?php $menu=\Menu::backend(true);?>
  <?php $__currentLoopData = $menu; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
  <a class="list-group-item <?php echo e(isset($item['class'])?$item['class']:''); ?> <?php echo e(Utility::active($item['route'])); ?>" href='<?php echo e(url('/').$item['route']); ?>'><?php if(isset($item['icon'])): ?><span class="<?php echo e($item['icon']); ?>"></span><?php endif; ?> <?php echo e($item['text']); ?> <?php if(isset($item['cont'])&&$item['cont']>0): ?><span class="badge pull-right"><?php echo e($item['cont']); ?></span><?php endif; ?> </a>
  <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
</div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('footer'); ?>
<?php echo e(trans('company.powered_by')); ?>&nbsp;<a target="_blank" href="<?php echo e(trans('company.powered_url')); ?>"><?php echo e(trans('company.powered_brand')); ?></a>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>