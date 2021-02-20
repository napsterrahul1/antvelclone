<div class="vertical-nav" style="border-right: 2px solid #ddd">
	<div class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<span class="visible-xs navbar-brand">Dashboard</span>
		</div>
		<div class="navbar-collapse collapse sidebar-navbar-collapse">
			<ul class="nav navbar-nav list-group">
			<?php $menu=\Menu::dashboard(true);?>
			<?php $__currentLoopData = $menu; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
			    <li class="list-group-item <?php echo e(isset($item['class'])?$item['class']:''); ?> <?php echo e(Utility::active($item['route'])); ?>" style="border-left: 0px;border-right: 0px;border-top: 0px;">
					<a href='<?php echo e(url($item['route'])); ?>'><?php if(isset($item['icon'])): ?><span class="<?php echo e($item['icon']); ?>"></span><?php endif; ?> <?php echo e($item['text']); ?> <?php if(isset($item['cont'])&&$item['cont']>0): ?><span class="badge pull-right"><?php echo e($item['cont']); ?></span><?php endif; ?> </a>
				</li>
			<?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
			</ul>
		</div><!--/.nav-collapse -->
	</div>
</div>