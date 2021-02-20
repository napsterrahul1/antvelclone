<div class="container">
    <div class="row">
        <div class="col-xs-4 col-sm-4 col-md-4 menu">
            <?php $menu=\Menu::help(true); ?>
            <h3><?php echo e(trans('globals.company_label')); ?></h3>
            <ul>
                <?php $__currentLoopData = $menu; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                    <li><a href = '<?php echo e(url('/').$item['route']); ?>' target="<?php echo $item['target']; ?>"><?php echo e($item['text']); ?></a></li>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
            </ul>
        </div>

        <div class="col-xs-4 col-sm-4 col-md-4 menu">
            <?php $menu=\Menu::help(true); ?>
            <h3> Contact </h3>
            <ul>
                    <li><a href = '<?php echo e(url('contact')); ?>'>Repair My Pc</a></li>
                    <li>
                        <a style="font-size: 0.8em;">
                            <span class="glyphicon glyphicon-phone-alt"></span>
                            <span class="home-info-bar-text"><?php echo e($main_company['phone_number']); ?></span>
                        </a>
                    </li>
                    <li>
                        <a href="mailto:<?php echo e($main_company['sales_email']); ?>">
                            <span class="glyphicon glyphicon-envelope"></span>
                            <span><?php echo e($main_company['sales_email']); ?></span>
                        </a>

                    </li>
            </ul>
        </div>

        <div class="col-xs-4 col-sm-4 col-md-4 menu">
            <h3><?php echo e(trans('globals.social_label')); ?></h3>
            <ul>
                <li><a href="https://www.facebook.com/<?php echo e($main_company['facebook']); ?>" target="_blank"><?php echo e(trans('globals.facebook_label')); ?></a></li>
                <li><a href="https://twitter.com/<?php echo e($main_company['twitter']); ?>" target="_blank"><?php echo e(trans('globals.twitter_label')); ?></a></li>
                <li><a href="https://plus.google.com/u/0/<?php echo e($main_company['google_plus']); ?>" target="_blank"><?php echo e(trans('globals.google_label')); ?></a></li>
            </ul>
        </div>

        


                
            
                
                    
                    
                        
                        
                    
                

            

        
        <?php if(\Auth::user()): ?>
        <?php if((\Auth::user()->role == 'admin') || (\Auth::user()->role == 'subadmin')): ?>
        <div class="row" style="float: right">
            <?php $count = \App\Configuration::getvisitor()?>
            <div class="incremental-counter" data-value="<?php echo $count; ?>" style="padding-right: 20px;"></div>
        </div>
        <?php endif; ?>
        <?php endif; ?>
    </div>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="<?php echo asset('js/jquery.incremental-counter.js'); ?>"></script>
    <link href="<?php echo asset('js/jquery.incremental-counter.css'); ?>" rel="stylesheet" type="text/css">
    <script>
        $(".incremental-counter").incrementalCounter({
            "digits": 6
        });
    </script>


    <div class="row credits">
        <div class="col-md-12">
            <?php echo e(trans('globals.power_by_label')); ?>&nbsp;<a href="http://talegaon.co.in">E-commerce</a>
        </div>
    </div>

</div>

<?php $__env->startSection('scripts'); ?>
    @parent
    <script>
        (function(app){
            app.controller('NewslettersCtrl', function($scope, $window, notify)
            {
                $scope.newsEmail = '';
                $scope.save = function()
                {
                    if ($scope.newsEmail.trim() != '') {
                        $window.location.href = base_url + '/register?email='+$scope.newsEmail;
                    } else {
                        notify({ duration:5000, messageTemplate: '<strong><?php echo e(trans('globals.validation_error_label')); ?></strong><br><br><p><?php echo e(trans('globals.newsletter_email_error')); ?></p>', classes: 'alert alert-danger' });
                    }
                };
            });
        })(angular.module("AntVel"));
    </script>
<?php $__env->stopSection(); ?>