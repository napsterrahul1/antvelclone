<div class="navbar-wrapper">
    <nav class="navbar">
        <div class="container">
            <div class="navbar-header">
                <div class="navbar-brand">
                    <a href="<?php echo url('home'); ?>" class="navbar-brand">
                        <?php echo e($main_company['name']); ?>

                        <br>
                        
                    </a>
                </div>
            </div>
            <?php echo $__env->make('partial.navigation_help', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
        </div>
    </nav>
</div>