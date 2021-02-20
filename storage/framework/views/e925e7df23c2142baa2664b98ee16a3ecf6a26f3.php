<li class="dropdown">
		<a href="#" class="dropdown-toggle colorwhite" data-toggle="dropdown" role="button" aria-expanded="false" style="padding-right: 0px;">
			<span class="glyphicon glyphicon-user
			<?php if(Auth::check()): ?><?php echo e('user-photo'); ?><?php endif; ?>"
				  style="<?php if(Auth::check()): ?> <?php echo e("background-image:url('".(\Auth::user()->pic_url ? \App\Helpers\Utility::getStoragePath() . \Auth::user()->pic_url : 'img/no-avatar.png')."');"); ?> <?php endif; ?>"></span>
			<?php if(Auth::check()): ?> Hello, <?php echo e(\Auth::user()->nickname); ?> <?php else: ?> <?php echo e(trans('user.your_account')); ?> <?php endif; ?> <span class="caret colorwhitecaret"></span>
		</a>
	<ul class="dropdown-menu colorwhite" role="menu" >
		<?php $menu=\Menu::top(true);?>
		<?php $__currentLoopData = $menu; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
		    <li class="<?php echo e(isset($item['class'])?$item['class']:''); ?> <?php echo e(Utility::active($item['route'])); ?>" >
				<a href='<?php echo e(url($item['route'])); ?>'>
					<?php if(isset($item['icon'])): ?>
						<span class="<?php echo e($item['icon']); ?>"></span>
					<?php endif; ?>
					<?php echo e($item['text']); ?>

					<?php if(isset($item['cont'])&&$item['cont']>0): ?>
					 <span class="badge"><?php echo e($item['cont']); ?></span>
					<?php endif; ?>
				</a>
			</li>
				<li class="divider"></li>

		<?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>

		<?php if(auth()->check()): ?>
			<li class="divider"></li>
			<li>
				<form action="<?php echo url('logout'); ?>" method="POST">
					<?php echo e(csrf_field()); ?>

					<button type="submit" class="btn btn-success btn-block">
						
						<?php echo e(trans('user.logout')); ?>

					</button>
				</form>
			</li>
		<?php endif; ?>
	</ul>
</li>