<!DOCTYPE html>

<html lang="<?php echo e(App::getLocale()); ?>" ng-app="AntVel">

<head>
	<meta charset="utf-8">
	<title><?php $__env->startSection('title'); ?><?php echo e($main_company['website_name']); ?> <?php echo $__env->yieldSection(); ?></title>

	<?php echo Html::style('/css/vendor/bootstrap.css'); ?>

	
	<?php $__env->startSection('css'); ?>
		<?php echo Html::style('/css/app.css'); ?>

	<?php echo $__env->yieldSection(); ?>
</head>

<body>
	<div class="container">
		<div class="panel panel-default <?php $__env->startSection('classPanel'); ?> <?php echo $__env->yieldSection(); ?>">
			<?php $__env->startSection('content'); ?>

			<?php echo $__env->yieldSection(); ?>
			<p>
				<a class="btn btn-primary" href="<?php echo url('/'); ?>" role="button"> <?php $__env->startSection('btn-back'); ?> <?php echo $__env->yieldSection(); ?></a>
			</p>
		</div>
	</div>
</body>
</html>