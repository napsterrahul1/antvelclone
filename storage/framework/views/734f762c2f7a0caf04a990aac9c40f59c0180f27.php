<?php $__env->startSection('title'); ?>@parent- <?php echo e(trans('user.dashboard')); ?> <?php $__env->stopSection(); ?>

<?php $__env->startSection('page_class'); ?> 'user-dashboard' <?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
	@parent
	<?php $__env->startSection('panel_left_content'); ?>
		<?php echo $__env->make('user.partial.menu_dashboard', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
	<?php $__env->stopSection(); ?>
	<?php $__env->startSection('center_content'); ?>

		<div class="page-header">
			<h5><?php echo e(trans('user.dashboard')); ?></h5>
		</div>


	  	<?php if(\Auth::check() && \Auth::user()->hasRole(['business','admin'])): ?>

			<div class="row">
				<div class="col-md-12">
					<a class="btn btn-info btn-sm pull-right" ng-href="<?php echo e(route('products.create')); ?>"><span class="glyphicon glyphicon-plus"></span>&nbsp;<?php echo e(trans('product.globals.add')); ?></a>
				</div>
			</div>

			<div class="row">&nbsp;</div>

			<div class="list-group">
				<?php if(\Auth::user()->hasRole(['subadmin','admin'])): ?>
				<a href="javascript:void(0);" class="list-group-item active"><?php echo e(trans('user.all_products')); ?></a>
				<?php else: ?>
				<a href="javascript:void(0);" class="list-group-item active"><?php echo e(trans('user.your_products')); ?></a>
				<?php endif; ?>
				<a href="<?php echo e(route('products.myProducts')); ?>" class="list-group-item"><?php echo e(trans('globals.all')); ?><span class="badge"><?php echo e($products['all']); ?></span></a>
				<a href="<?php echo e(route('products.myProducts').'?filter=active'); ?>" class="list-group-item"><?php echo e(trans('globals.active')); ?><span class="badge"><?php echo e($products['active']); ?></span></a>
				<a href="<?php echo e(route('products.myProducts').'?filter=inactive'); ?>" class="list-group-item"><?php echo e(trans('globals.inactive')); ?><span class="badge"><?php echo e($products['inactive']); ?></span></a>
				<a href="<?php echo e(route('products.myProducts').'?filter=low'); ?>" class="list-group-item"><?php echo e(trans('product.inputs_view.low_stock')); ?><span class="badge"><?php echo e($products['lowStock']); ?></span></a>
			</div>

			<div class="list-group">
				<?php if(\Auth::user()->hasRole(['subadmin','admin'])): ?>
				<a href="javascript:void(0);" class="list-group-item active"><?php echo e(trans('user.all_sales')); ?></a>
				<?php else: ?>
				<a href="javascript:void(0);" class="list-group-item active"><?php echo e(trans('user.your_sales')); ?></a>
				<?php endif; ?>
					<a href="<?php echo e(route('orders.pendingOrders')); ?>" class="list-group-item"><?php echo e(trans('store.all_transactions')); ?><span class="badge"><?php echo e($sales['all']); ?></span></a>
				<a href="javascript:void(0);" class="list-group-item"><strong><?php echo e(trans('store.grand_total')); ?></strong><span class="badge"><?php echo e(\Utility::showPrice($sales['total'])); ?></span></a>
				<a href="<?php echo e(route('orders.pendingOrders')); ?>" class="list-group-item"><?php echo e(trans('store.openOrders')); ?><span class="badge"><?php echo e($sales['open']); ?></span></a>
				<a href="<?php echo e(route('orders.pendingOrders').'?show=closed'); ?>" class="list-group-item"><?php echo e(trans('store.closedOrders')); ?><span class="badge"><?php echo e($sales['closed']); ?></span></a>
				<a href="<?php echo e(route('orders.pendingOrders').'?show=canceled'); ?>" class="list-group-item"><?php echo e(trans('store.canceledOrders')); ?><span class="badge"><?php echo e($sales['cancelled']); ?></span></a>
				<a href="<?php echo e(route('orders.pendingOrders').'?show=rate'); ?>" class="list-group-item"><?php echo e(trans('store.rated_orders')); ?><span class="badge"><?php echo e(($sales['rate'])); ?></span></a>
			</div>

		<?php else: ?>

			<div class="list-group">
				<a href="javascript:void(0);" class="list-group-item active"><?php echo e(trans('user.your_orders')); ?></a>
				<a href="<?php echo e(route('orders.show_orders')); ?>" class="list-group-item"><?php echo e(trans('globals.all')); ?>&nbsp;<span class="badge"><?php echo e($orders['all']); ?></span></a>
				<a href="<?php echo e(route('orders.show_orders')); ?>" class="list-group-item"><?php echo e(trans('store.openOrders')); ?>&nbsp;<span class="badge"><?php echo e($orders['open']); ?></span></a>
				<a href="<?php echo e(route('orders.show_orders').'?show=closed'); ?>" class="list-group-item"><?php echo e(trans('store.closedOrders')); ?>&nbsp;<span class="badge"><?php echo e($orders['closed']); ?></span></a>
				<a href="<?php echo e(route('orders.show_orders').'?show=canceled'); ?>" class="list-group-item"><?php echo e(trans('store.canceledOrders')); ?>&nbsp;<span class="badge"><?php echo e($orders['cancelled']); ?></span></a>
				<a href="<?php echo e(route('orders.show_orders').'?show=rate'); ?>" class="list-group-item"><?php echo e(trans('store.waiting_for_rating')); ?>&nbsp;<span class="badge"><?php echo e($orders['nopRate']); ?></span></a>
			</div>

		<?php endif; ?>
	<?php $__env->stopSection(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('footer'); ?>
	@parent
<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
<script>

	(function() {
		var app = angular.module('AntVel');
		app.controller('DashboardController',function(){});

	})();
</script>
	@parent
<?php $__env->stopSection(); ?>


<?php echo $__env->make('layouts/master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>