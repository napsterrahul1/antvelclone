@extends('layouts/master')
@section('page_class')user-profile @stop

@section('navigation') @parent @stop

@include('partial.message')

@section('content')
	@parent
	@section('panel_left_content')
		@include('user.partial.menu_dashboard')
	@stop
	@section('center_content')

		<div class="page-header">
			<h5>{{ trans('user.track_order') }}</h5>
		</div>
		<form method="post" action="{!! url('trackorder') !!}">
			<input type="hidden" name="_token" value="{!! csrf_token() !!}">
			<div class="col-md-12">
					<span>Enter Order Number:</span><input name="orderid" style="display: inline-block; width: 50%;" type="text" class="form-control">
				<input type="submit" value="Search" class="btn btn-success">
				</div>
		</form>

	@stop

@endsection
{{-- Pie de pagina --}}
@section('footer')
	@parent
@stop
{{-- Javascript --}}
@section('scripts')
	@parent
	{!! Html::script('/js/vendor/file-upload/angular-file-upload-shim.min.js') !!}
    {!! Html::script('/js/vendor/file-upload/angular-file-upload.min.js') !!}
    <script>
        (function(app){
        	//Control del profile de usuario
			app.controller('ProfileController',['$scope','$http','notify',function($scope, $http,notify){
				$scope.wantDelete = false;
				$scope.disabled = false;
				var disabled = '{{ $user['disabled_at'] }}';
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
				$scope.picture = '{{ $user['pic_url'] }}';

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
                                fields: {"_token":'{{ csrf_token() }}',"_method":"POST"},
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
@stop
@section('before.angular') ngModules.push('angularFileUpload'); @stop
