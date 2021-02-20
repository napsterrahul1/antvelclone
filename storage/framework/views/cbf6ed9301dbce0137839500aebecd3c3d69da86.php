<?php if(\Auth::check()): ?>
	<div class="form-group">
		<div class="col-md-3 col-lg-3">
			<?php echo Form::label('old_password',trans('user.old_password')); ?>:
			<div class="input-group">
	      		<div class="input-group-addon input-sm"><span class="fa fa-lock"></span></div>
				<?php echo Form::password('old_password', ['class'=>'form-control input-sm']); ?>

			</div>
		</div>
	</div>
<?php endif; ?>

<div class="form-group">
	<div class="col-md-3 col-lg-3">
		<?php echo Form::label('password',trans('user.password')); ?>:
		<div class="input-group">
	      	<div class="input-group-addon input-sm"><span class="fa fa-lock"></span></div>
			<?php echo Form::password('password', ['class'=>'form-control input-sm']); ?>

		</div>
	</div>

	<div class="col-md-3 col-lg-3">
		<?php echo Form::label('password_confirmation',trans('user.password_confirmation')); ?>:
		<div class="input-group">
	      	<div class="input-group-addon input-sm"><span class="fa fa-lock"></span></div>
			<?php echo Form::password('password_confirmation', ['class'=>'form-control input-sm']); ?>

		</div>
	</div>
</div>