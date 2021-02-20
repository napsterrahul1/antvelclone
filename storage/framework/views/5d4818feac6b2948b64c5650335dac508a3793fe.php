<?php

/**
 * Contains the notify plugin style
 *
 * @var string
 */
$class = Session::get('messageClass') ? Session::get('messageClass') : 'alert alert-danger';
$class = is_array($class) ? implode('', $class) : $class;

/**
 * Contains the notify plugin message.
 *
 * @var string / array
 */
$m = Session::get('message');
$m = $m ? (is_array($m) ? Html::ul($m) : '<p>'.$m.'</p>') : '';
$m = $m ? (is_array($m) ? Html::ul($m) : '<p>'.$m.'</p>') : '';

/**
 * Laravel errors message controller
 *
 * @var array
 */
$e = $errors->any() ? Html::ul($errors->all()) : '';

//forgetting flash data to control app notify messages.
Session::forget('message');
Session::forget('messageClass');
Session::save();

?>
<?php if($m!='' || $e!=''): ?>
    <div ng-controller="MessageController"></div>
    <?php $__env->startSection('scripts'); ?>
    @parent
        <script>
            (function(app){
                app.controller('MessageController',['notify',function(notify) {
                  <?php if($m!=''): ?>
                    notify({duration:50000,messageTemplate:'<?php echo $m; ?>',classes:'<?php echo e($class); ?>'});
                  <?php endif; ?>
                  <?php if($e!=''): ?>
                    notify({duration:50000,messageTemplate:'<?php echo $e; ?>',classes:'alert alert-danger'});
                  <?php endif; ?>
                }]);
            })(angular.module("AntVel"));
        </script>
    <?php $__env->stopSection(); ?>
<?php endif; ?>