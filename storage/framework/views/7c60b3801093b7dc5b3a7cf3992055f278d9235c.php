<?php $__env->startSection('title'); ?>@parent  - <?php echo e(trans('globals.category')); ?> <?php $__env->stopSection(); ?>
<?php $__env->startSection('page_class'); ?> category-panel <?php $__env->stopSection(); ?>
<?php $__env->startSection('center_content'); ?>
    <?php echo $__env->make('partial.message', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
    <?php echo $__env->make('categories.parents_tree', ['master' => $category->parent_tree], array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>


    <div ng-controller="CategoryController" class="panel panel-default">
        <div class="panel-heading"><h6><span class="glyphicon glyphicon-tasks"></span> <?php echo e(trans('globals.category')); ?></h6></div>
        <div class="panel-body">
            <div class="row form-group">
                <label class="col-md-4 control-label"><?php echo e(trans('globals.name')); ?></label>
                <div class="col-md-6"> <?php echo $category->name; ?></div>
            </div>
            <div class="row form-group">
                <label class="col-md-4 control-label"><?php echo e(trans('globals.description')); ?></label>
                <div class="col-md-6"><?php echo $category->description; ?></div>
            </div>
            <div class="row form-group">
                <label class="col-md-4 control-label"><?php echo e(trans('globals.image')); ?></label>
                <div class="col-md-2">
                    <div class="thumbnail" style="height:120px; background-image:url('<?php echo url( $category->image ? $category->image :  'img/no-image.jpg'); ?>'); background-size: 100%;" ></div>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-md-4 control-label"> Icon </label>
                <div class="col-md-6 demo-icons">
                    <div class="demo-content">
                        <span class="<?php echo $category->icon; ?>"ng-bind="category.icon"></span>
                        <input type="hidden" name="icon" ng-model="icon" value="[[category.icon]]" />
                    </div>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-md-4 control-label"><?php echo e(trans('globals.status')); ?></label>
                <div class="col-md-6" ng-bind="status()">
                </div>
            </div>
            <div class="row form-group">
                <label class="col-md-4 control-label"><?php echo e(trans('globals.type')); ?></label>
                <div class="col-md-6"> <?php echo $category->type; ?></div>
            </div>
            <div class="form-group" ng-if="category.group&&category.group.length">
                <label class="col-md-4 control-label">
                    <?php echo e(trans('categories.parent_category')); ?>

                    (<?php echo e(trans('globals.type_categories.group')); ?>)
                </label>
                <div class="col-md-6" ng-bind="category.parentg"></div>
            </div>
            <div class="form-group" id="parents" ng-if="category.store&&category.store.length">
                <label class="col-md-4 control-label">
                    <?php echo e(trans('categories.parent_category')); ?>

                    (<?php echo e(trans('globals.type_categories.store')); ?>)
                </label>
                <div class="col-md-6" ng-bind="category.parents"></div>
            </div>
            <div class="row form-group">
                <div class="col-md-6">
                    <a href="<?php echo url('wpanel/category/'.$category->id.'/edit/'); ?>" class="btn btn-default">Edit</a>
                </div>
            </div>
        </div>
    </div>
    <?php echo $__env->make('categories.list_childs',['categories'=>$category->childs,'title'=>trans('globals.subcategories')], array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('scripts'); ?>
    @parent
    <script>
        (function(app){
            app.controller('CategoryController', ['$scope', function ($scope) {
                $scope.category=('<?php echo $category->toJson(); ?>');
                
                var status_list={
                        0:'<?php echo e(trans('globals.inactive')); ?>',
                        1:'<?php echo e(trans('globals.active')); ?>'
                    },
                    type_list=('<?php echo json_encode(trans('globals.type_categories')); ?>');
                $scope.status=function(){
                    return status_list[($scope.category.status!==undefined&&$scope.category.status)||1];
                };
                $scope.link=function(){
                    return '<?php echo e(url('wpanel/category/ID/edit/')); ?>'.replace('ID',$scope.category.id);
                };
                $scope.type=function(){
                    return type_list[$scope.category.type];
                };
            }]);
        })(angular.module("AntVel"))
    </script>
<?php $__env->stopSection(); ?>


<?php echo $__env->make('layouts.wpanel', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>