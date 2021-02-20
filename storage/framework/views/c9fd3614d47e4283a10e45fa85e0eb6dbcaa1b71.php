<ul class="nav navbar-nav navbar-right">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
            <span class="fui fui-question-circle"></span>
            <?php echo e(trans('globals.help')); ?><span class="caret"></span>
        </a>
        <ul class="dropdown-menu" role="menu">
            <?php $menu=\Menu::help(true);?>
            <?php $__currentLoopData = $menu; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
            <li class="<?php echo e(isset($item['class'])?$item['class']:''); ?> <?php echo e(Utility::active($item['route'])); ?>" >
                <a href='<?php echo e(url($item['route'])); ?>'>
                    <?php if(isset($item['icon'])): ?>
                        <span class="<?php echo e($item['icon']); ?>">

                        </span>
                    <?php endif; ?>
                        <?php echo e($item['text']); ?>

                        <?php if(isset($item['cont'])&&$item['cont']>0): ?>
                            <span class="badge pull-right"><?php echo e($item['cont']); ?></span>
                        <?php endif; ?>
                </a>
            </li>
            <?php if(isset($item['divider'])): ?><li class="divider"></li><?php endif; ?>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
        </ul>
    </li>
</ul>