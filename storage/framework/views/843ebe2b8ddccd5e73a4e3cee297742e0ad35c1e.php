<div ng-controller="<?php echo e($angularController); ?>">

		<angucomplete-alt
		id="<?php echo e($idSearch); ?>"
          input-name="<?php echo e($idSearch); ?>"
          initial-value="<?php echo e(isset($search) && $search ? $search : ''); ?>"
          placeholder="<?php echo e(trans('globals.search').'...'); ?>"
          pause="100"
          selected-object="selectedItem"
          match-class="highlight"
          remote-url="<?php echo e(url('search')); ?>?group=<?php echo e(isset($group) ? $group : 0); ?>&suggest=<?php echo e(!isset($suggest) ? 1 : 0); ?>&crit="
          auto-match="true"
          image-field="image"
          remote-url-data-field="products"
          search-fields="name"
          title-field="name"
          description-field="description"
          text-searching="<?php echo e(trans('globals.searching')); ?>"
          text-no-results="<?php echo e(trans('globals.no_results')); ?>"
          minlength="3"
          input-class="form-control"/>
          
</div>