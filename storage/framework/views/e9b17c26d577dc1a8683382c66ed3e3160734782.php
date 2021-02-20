<?php if(isset($elements)&&count($elements)): ?>
<?php $__empty_1 = true; $__currentLoopData = $elements; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $cat): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); $__empty_1 = false; ?>
    <li class="list-group-item" ng-show="(!search||(('<?php echo e(strtolower($cat->name)); ?>').indexOf(search.toLowerCase())>=0))">
        <div class="row">
            <div class="col-md-1"><span class="label label-default visible-xs-inline">#ID:</span> <?php echo e($cat->id); ?></div>
            <div class="col-md-3"><span class="label label-default visible-xs-inline"><?php echo e(trans('product.inputs_view.name')); ?>:</span>  <a href="<?php echo url('wpanel/category/'.$cat->id); ?>"><?php echo e($cat->name); ?></a></div>
            <div class="col-md-2">
                <span class="label label-default visible-xs-inline"><?php echo e(trans('globals.status')); ?>:</span>
                <?php if($cat->status==1): ?>
                    <span class="label label-success"><?php echo e($cat->status==1?trans('globals.active'):''); ?></span>
                <?php else: ?>
                    <span class="label label-danger"><?php echo e(trans('globals.inactive')); ?></span>
                <?php endif; ?>
            </div>
            <div class="col-md-2"><span class="label label-default visible-xs-inline"><?php echo e(trans('store.father')); ?>:</span>
                <?php if($cat->hasParent()): ?>
                    <a href="<?php echo url('wpanel/category/'.$cat->id); ?>"><?php echo e($cat->parent ? $cat->parent->name : ''); ?></a>
                <?php endif; ?>
             </div>
            <div class="col-md-2"><span class="label label-default visible-xs-inline"><?php echo e(trans('globals.type')); ?>:</span> <?php echo e($cat->type); ?></div>
            <div class="col-md-2"><a href="<?php echo e(url('wpanel/category/'.$cat->id.'/edit')); ?>">Edit</a></div>
        </div>
    </li>
    <?php if($cat->hasChildren()): ?>
        <?php echo $__env->make('categories.list_childs', ['elements' => $cat->children], array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
    <?php endif; ?>
<?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); if ($__empty_1): ?>
    <li class="list-group-item">No items</li>
<?php endif; ?>
<?php elseif(isset($categories)): ?>
    <?php if(isset($title)): ?>
        <h1><?php echo e($title); ?></h1>
    <?php endif; ?>
    <ul class="list-group">
        <li class="list-group-item list-group-item-info hidden-xs">
            <div class="row">
                <div class="col-md-1">#ID</div>
                <div class="col-md-3"><?php echo e(trans('product.inputs_view.name')); ?></div>
                <div class="col-md-2"><?php echo e(trans('globals.status')); ?></div>
                <div class="col-md-2"><?php echo e(trans('store.father')); ?></div>
                <div class="col-md-2"><?php echo e(trans('globals.type')); ?></div>
                <div class="col-md-2"><?php echo e(trans('globals.action')); ?></div>
            </div>
        </li>
        <?php echo $__env->make('categories.list_childs', ['elements' => $categories], array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
        <?php echo e($elements=NULL); ?>

    </ul>
<?php endif; ?>
