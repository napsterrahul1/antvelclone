<div class="form-group">
	<div class="col-md-4 col-lg-4 ">
		<?php echo Form::label('first_name',trans('user.facebook')); ?>:
		<div class="input-group">
			<span class="input-group-addon fui-facebook input-sm" id="basic-addon1"></span>
			<?php echo Form::text('facebook', null, ['ng-disabled'=>'disabled','class'=>'form-control input-sm']); ?>

		</div>
	</div>
</div>

<div class="form-group">
	<div class="col-md-4 col-lg-4 ">
		<?php echo Form::label('first_name',trans('user.twitter')); ?>:
		<div class="input-group">
			<span class="input-group-addon fui-twitter input-sm" id="basic-addon1"></span>
			<?php echo Form::text('twitter', null, ['ng-disabled'=>'disabled','class'=>'form-control input-sm']); ?>

		</div>
	</div>
</div>

<div class="form-group">
	<div class="col-md-4 col-lg-4 ">
		<?php echo Form::label('first_name',trans('user.website')); ?>:
		<div class="input-group">
			<span class="input-group-addon input-sm" id="basic-addon1">http://</span>
			<?php echo Form::text('website', null, ['ng-disabled'=>'disabled','class'=>'form-control input-sm']); ?>

		</div>
	</div>
</div>