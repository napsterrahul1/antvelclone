<?php $__env->startSection('title'); ?>@parent- <?php echo e(trans('company.store_config')); ?> <?php $__env->stopSection(); ?>
<?php $__env->startSection('panel_left_content'); ?>
@parent
<?php $__env->stopSection(); ?>
<?php $__env->startSection('center_content'); ?>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.4/holder.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.4/holder.min.js"></script>
    
<script>
    Holder.addTheme("dark", {
        background: "#000",
        foreground: "#aaa",
        size: 11,
        font: "Monaco",
        fontweight: "normal"
    });
</script>
    <h1>Dashboard</h1>

    <div class="row placeholders">
        <div class="col-xs-6 col-sm-3 placeholder">
            <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail"/>
            <h4>Label</h4>
            <span class="text-muted">Something else</span>
        </div>
        <div class="col-xs-6 col-sm-3 placeholder">
            <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail"/>
            <h4>Label</h4>
            <span class="text-muted">Something else</span>
        </div>
        <div class="col-xs-6 col-sm-3 placeholder">
            <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail"/>
            <h4>Label</h4>
            <span class="text-muted">Something else</span>
        </div>
        <div class="col-xs-6 col-sm-3 placeholder">
            <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail"/>
            <h4>Label</h4>
            <span class="text-muted">Something else</span>
        </div>
    </div>
   
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>
    @parent
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.wpanel', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>