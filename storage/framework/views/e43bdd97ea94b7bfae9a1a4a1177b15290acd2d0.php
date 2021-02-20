<?php if(isset($tree)&&$tree): ?>
	<li><a href="<?php echo url('wpanel/category/'.$tree->id); ?>"><?php echo e($tree->name); ?></a></li>
	<?php if($tree->child): ?>
		<?php echo $__env->make('categories.parents_tree', ['tree' => $tree->child], array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
	<?php endif; ?>
<?php elseif(isset($master)): ?>
<ol class="breadcrumb">
	<?php echo $__env->make('categories.parents_tree', ['tree' => $master], array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
	<?php echo e($tree=NULL); ?>

</ol>
<?php endif; ?>
