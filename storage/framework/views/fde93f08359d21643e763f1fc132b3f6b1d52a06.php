<!DOCTYPE html>
<html lang="<?php echo e(App::getLocale()); ?>" ng-app="AntVel">
<head>
	<?php $__env->startSection('metaLabels'); ?>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<base href="/">
		<meta name="description" content="">
		<meta name="author" content="">
	<?php echo $__env->yieldSection(); ?>

	<link rel="icon" href="favicon.ico">
	<title><?php $__env->startSection('title'); ?><?php echo e($main_company['website_name']); ?> <?php echo $__env->yieldSection(); ?></title>

	<script type="text/javascript">
	FileAPI = {
		debug: true
	};
	</script>

	
	<?php echo Html::style('/antvel-bower/bootstrap/dist/css/bootstrap.css'); ?>

	<?php $__env->startSection('css'); ?>
		<?php echo Html::style('/antvel-bower/angular-notify/dist/angular-notify.min.css'); ?>

		<?php echo Html::style('/antvel-bower/font-awesome/css/font-awesome.min.css'); ?>

		<?php echo Html::style('/css/carousel.css'); ?>

		<?php echo Html::style('/css/angucomplete-alt.css'); ?>

		<?php echo Html::style('/css/app.css'); ?>


		<?php echo Html::style('/css/dataTables.bootstrap.min.css'); ?>

	<?php echo $__env->yieldSection(); ?>

	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body>

<section class = "<?php echo $__env->yieldContent('page_class', 'home'); ?>">

	
	<?php $__env->startSection('navigation'); ?>
		<?php echo $__env->make('partial.navigation', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
	<?php echo $__env->yieldSection(); ?>

	
	<div class="container" style="padding-left: 0px;padding-right: 0px;">
		<?php $__env->startSection('breadcrumbs'); ?>
			
		<?php echo $__env->yieldSection(); ?>
	</div>

	
	<?php $__env->startSection('content'); ?>
		<?php $__env->startSection('panels'); ?>
<input type="hidden" id="baseurl" value="<?php echo url('/'); ?>">
			<div class="container">
				<div class="row">&nbsp;</div>
				<div class="row global-panels">

					
					<?php if(isset($panel['left'])): ?>
						
						<div class="col-sm-<?php echo e(isset($panel['left']['width']) ? $panel['left']['width'] : '2'); ?> col-md-<?php echo e(isset($panel['left']['width']) ? $panel['left']['width'] : '2'); ?> <?php echo e(isset($panel['left']['class']) ? $panel['left']['class'] : ''); ?>">
							<?php $__env->startSection('panel_left_content'); ?>
								Left content
							<?php echo $__env->yieldSection(); ?>
						</div>
					<?php endif; ?>

					
					<div class="col-xs-12 col-sm-<?php echo e(isset($panel['center']['width']) ? $panel['center']['width'] : '10'); ?> col-md-<?php echo e(isset($panel['center']['width']) ? $panel['center']['width'] : '10'); ?>">
						<?php $__env->startSection('center_content'); ?>
							Center content
						<?php echo $__env->yieldSection(); ?>
					</div>

					
					<?php if(isset($panel['right'])): ?>
						<div class="hidden-xs col-sm-<?php echo e(isset($panel['right']['width']) ? $panel['right']['width'] : '2'); ?> col-md-<?php echo e(isset($panel['right']['width']) ? $panel['right']['width'] : '2'); ?> <?php echo e(isset($panel['right']['class']) ? $panel['right']['class'] : ''); ?>">
							<?php $__env->startSection('panel_right_content'); ?>
								Right content
							<?php echo $__env->yieldSection(); ?>
						</div>
					<?php endif; ?>

				</div> 
			</div> 

		<?php echo $__env->yieldSection(); ?>
	<?php echo $__env->yieldSection(); ?>

</section>

<?php $__env->startSection('footer'); ?>
	<footer>
		<?php echo $__env->make('partial.footer', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
	</footer>
<?php echo $__env->yieldSection(); ?>


<?php echo Html::script('/antvel-bower/jquery/dist/jquery.min.js'); ?>

<?php echo Html::script('/antvel-bower/angular/angular.min.js'); ?>

<?php echo Html::script('/antvel-bower/angular-route/angular-route.min.js'); ?>

<?php echo Html::script('/antvel-bower/angular-sanitize/angular-sanitize.min.js'); ?>

<?php echo Html::script('/antvel-bower/angular-bootstrap/ui-bootstrap-tpls.min.js'); ?>

<?php echo Html::script('/antvel-bower/angular-animate/angular-animate.min.js'); ?>

<?php echo Html::script('/antvel-bower/angular-loading-bar/build/loading-bar.min.js'); ?>

<?php echo Html::script('/antvel-bower/angular-mocks/angular-mocks.js'); ?>

<?php echo Html::script('/antvel-bower/angular-touch/angular-touch.min.js'); ?>

<?php echo Html::script('/antvel-bower/bootstrap/dist/js/bootstrap.min.js'); ?>


<?php echo Html::script('/js/vendor/xtForms/xtForm.js'); ?>

<?php echo Html::script('/js/vendor/xtForms/xtForm.tpl.min.js'); ?>



<?php echo Html::script('/js/jquery-1.12.4.js'); ?>

<?php echo Html::script('/js/jquery.dataTables.min.js'); ?>

<?php echo Html::script('/js/dataTables.bootstrap.min.js'); ?>

  






<script>
 base_url =  $('#baseurl').val();
 $(document).ready(function() {
	 $('.datatable').DataTable();
 } );

 var ngModules = [
		'ngRoute', 'ngSanitize', 'LocalStorageModule',
		'ui.bootstrap', 'chieffancypants.loadingBar', 'xtForm',
		'cgNotify', 'ngTouch', 'angucomplete-alt'
	];

	<?php $__env->startSection('before.angular'); ?> <?php echo $__env->yieldSection(); ?>

	(function(){
		angular.module('AntVel',ngModules,
		function($interpolateProvider){
			$interpolateProvider.startSymbol('[[');
			$interpolateProvider.endSymbol(']]');
		}).config(function(localStorageServiceProvider, cfpLoadingBarProvider,$locationProvider){
			cfpLoadingBarProvider.includeSpinner = false;
			localStorageServiceProvider.setPrefix('tb');
			$locationProvider.html5Mode({enabled:true,rewriteLinks:false});
		});
	})();

</script>



<?php echo Html::script('/js/app.js'); ?>


<?php $__env->startSection('scripts'); ?>
	
	<?php echo Html::script('/js/vendor/angucomplete-alt.js'); ?>


	
	<?php echo Html::script('/antvel-bower/angular-notify/dist/angular-notify.min.js'); ?>

	<?php echo Html::script('/antvel-bower/angular-local-storage/dist/angular-local-storage.min.js'); ?>

<?php echo $__env->yieldSection(); ?>

</body>
</html>
