<?php $__env->startSection('page_class'); ?>user-profile <?php $__env->stopSection(); ?>

<?php $__env->startSection('navigation'); ?> @parent  <?php $__env->stopSection(); ?>

<?php echo $__env->make('partial.message', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

<?php $__env->startSection('content'); ?>
	@parent
	<?php $__env->startSection('panel_left_content'); ?>
		<?php echo $__env->make('user.partial.menu_dashboard', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
	<?php $__env->stopSection(); ?>
	<?php $__env->startSection('center_content'); ?>

		<div class="page-header">
			<h5><?php echo e(trans('user.user_account_settings')); ?></h5>
		</div>

		<?php echo Form::model($user, ['url'=>'user/profile/save', 'class'=>'form-horizontal', 'role'=>'form']); ?>

		<div ng-controller="ProfileController" ng-cloak>

			<div ng-show="disabled" class="alert alert-danger" role="alert">
				<p><?php echo e(trans('user.disabled_at')); ?>: [[ disabled | date:'medium' ]]</p>
				<small><?php echo e(trans('user.account_disabled_description')); ?></small>
			</div>

			<div class="row">
				<div class="col-lg-12">
						<tabset>
							
							<tab heading="<?php echo e(trans('user.my_profile')); ?>">
								<div class="row">&nbsp;</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="pull-left" ng-controller="uploadCtrl">
											<div class="progress ng-cloak" ng-show="progress">
											  <div class="progress-bar"  role="progressbar" aria-valuenow="[[progress]]" aria-valuemin="0" aria-valuemax="100" style="width: [[progress]]%">
											    [[progress]]%
											  </div>
											</div>
											<div class="user-photo">
												<img src="<?php echo \App\Helpers\Utility::getStoragePath() . '[[picture]]'; ?>" class="thumbnail" style="width:80px;"  alt="Photo" ng-file-select ng-model="files" ngf-accept="'image/*'" accept="image/*">
												<input type="hidden" value="[[file!=''?file:picture]]" name="pic_url">
											</div>
										</div>
										<h5>

											 	<?php echo e(ucwords($user['first_name'].' '.$user['last_name'])); ?>

											

											
										</h5>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<?php echo $__env->make('user.partial.user_inputs', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
									</div>
								</div>
							</tab>

							
							<tab heading="<?php echo e(trans('user.social_information')); ?>">
								<div class="row">&nbsp;</div>
								<div class="row">
									<div class="col-lg-12">
										<?php echo $__env->make('user.partial.optional_inputs', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
									</div>
								</div>
							</tab>

							
							<tab heading="<?php echo e(trans('user.pass_account')); ?>">
								<div class="row">&nbsp;</div>
								<div class="row">
									<div class="col-lg-12">
										<?php echo $__env->make('user.partial.security_inputs', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
										<div ng-hide="disabled">
											
											
												
												    
												    
												    
												    	
														
														
												    
												
											
										</div>

										<div ng-show="disabled">
											<div class="panel panel-danger">
												<label><?php echo e(trans('user.enable_account')); ?>:</label>
												<div class="panel-body">
												    <p><?php echo e(trans('user.enable_account_description')); ?></p>
												    <button type="button" ng-click="enableAccount()" class="btn btn-xs btn-primary"><?php echo e(trans('user.enable_account')); ?></button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</tab>
						</tabset>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<hr>
				</div>
			</div>
			<div class="row">
				
				<div class="col-lg-12">
					<button ng-hide="wantDelete" type="submit" class="btn btn-sm btn-success">
						<span class="glyphicon glyphicon-floppy-disk"></span>&nbsp;
						<?php echo e(trans('user.update_profile')); ?>

					</button>
				</div>
			</div>

		</div>

		<?php echo Form::close(); ?>

	<?php $__env->stopSection(); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('footer'); ?>
	@parent
<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
	@parent
	<?php echo Html::script('/js/vendor/file-upload/angular-file-upload-shim.min.js'); ?>

    <?php echo Html::script('/js/vendor/file-upload/angular-file-upload.min.js'); ?>

    <script>
        (function(app){
        	//Control del profile de usuario
			app.controller('ProfileController',['$scope','$http','notify',function($scope, $http,notify){
				$scope.wantDelete = false;
				$scope.disabled = false;
				var disabled = '<?php echo e($user['disabled_at']); ?>';
				if (disabled !== '') $scope.disabled = new Date(disabled);

				$scope.disableAccount = function(){
					$http.post('/user/profile/disable').
						success(function(data, status) {
							if (data.success) {
								$scope.disabled = new Date(data.date);
								$scope.wantDelete = false;
								notify({message:data.message,classes:'alert-danger'});
							}else{
								console.log(data); //mensajes de error en validacion de form
							}
						}).
						error(function(data, status, headers, config) {
							notify({duration:2000,message:data.message,classes:'alert-error'});
						});
				};

				$scope.enableAccount = function(){
					$http.post('/user/profile/enable').
						success(function(data, status) {
							if (data.success) {
								$scope.wantDelete = false;
								$scope.disabled = false;
								notify({message:data.message,classes:'alert-success'});
							}else{
								console.log(data); //mensajes de error en validacion de form
							}
						}).
						error(function(data, status, headers, config) {
							notify({duration:2000,message:data.message,classes:'alert-error'});
						});
				};

				$scope.checkDisable = function(){
					$http.post('/user/profile/disable').
						success(function(data, status) {
							if (data.success) {
								$scope.disabled = true;
								notify({message:data.message,classes:'alert-success'});
							}else{
								console.log(data); //mensajes de error en validacion de form
							}
						}).
						error(function(data, status, headers, config) {
							notify({duration:2000,message:data.message,classes:'alert-error'});
						});
				};
			}]);

			//Upload
            app.controller('uploadCtrl', ['$scope', '$upload', '$timeout','notify', function ($scope, $upload, $timeout,notify) {
            	$scope.usingFlash = FileAPI && FileAPI.upload != null;
				$scope.fileReaderSupported = window.FileReader != null && (window.FileAPI == null || FileAPI.html5 != false);
				$scope.picture = '<?php echo e($user['pic_url']); ?>';

            	$scope.$watch('files', function () {
                    upload($scope.files);
                });
                $scope.file='';
                $scope.progress='';

                function upload(files) {
                    if (files && files.length) {
                        for (var i = 0; i < files.length; i++) {
                            var file = files[i];
                            var url=base_url+'/user/upload';
                            $upload.upload({
                                url: url,
                                fields: {"_token":'<?php echo e(csrf_token()); ?>',"_method":"POST"},
                                file: file
                            }).progress(function (evt) {
                                var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
                                $scope.progress= progressPercentage + '% ';
                            }).success(function (data, status, headers, config) {

                                if(data.indexOf("Error:")> -1){

                                    $scope.progress='';
                                    notify({duration:4000,message:data,classes:'alert alert-danger'});

                                }else{
									generateThumb(file);
                                    $scope.file=data;
                                    $scope.picture = data;
                                    $timeout(function(){
                                        $scope.progress= '';
                                    }, 1000);
                                }

                            });
                        }
                    }
                }


                function generateThumb(file) {
					if (file !== null) {
						if ($scope.fileReaderSupported && file.type.indexOf('image') > -1) {
							$timeout(function() {
								var fileReader = new FileReader();
								fileReader.readAsDataURL(file);
								fileReader.onload = function(e) {
									$timeout(function() {
										console.log(e.target.result);
										file.dataUrl = e.target.result;
									});
								};
							});
						}
					}
				}
            }]);

        })(angular.module("AntVel"))
    </script>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('before.angular'); ?> ngModules.push('angularFileUpload'); <?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts/master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>