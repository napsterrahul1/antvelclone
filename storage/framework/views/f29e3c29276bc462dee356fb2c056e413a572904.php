
<?php if(!isset($user) || \Auth::user()->hasRole(['person','admin','business'])): ?>

	<div class="form-group" ng-show="role != 'business' || role != 'nonprofit'">

		<div class="col-md-4 col-lg-4 ">
			<?php echo Form::label('first_name',trans('user.first_name')); ?>:
			<div class="input-group">
      			<div class="input-group-addon input-sm"><span class="fa fa-align-justify"></span></div>
				<?php echo Form::text('first_name', null, ['ng-disabled'=>'disabled','class'=>'form-control input-sm']); ?>

			</div>
		</div>

		<div class="col-md-4 col-lg-4 ">
			<?php echo Form::label('last_name',trans('user.last_name')); ?>:
			<div class="input-group">
      			<div class="input-group-addon input-sm"><span class="fa fa-align-justify"></span></div>
				<?php echo Form::text('last_name', null, ['ng-disabled'=>'disabled','class'=>'form-control input-sm']); ?>

			</div>
		</div>

	</div>

	<div class="form-group">
		<div class="col-md-4">
			<?php echo Form::label('birthday',trans('user.birth_date')); ?>:
			<div class="input-group">
      			<div class="input-group-addon input-sm"><span class="glyphicon glyphicon-calendar"></span></div>
				<?php echo Form::date('birthday', null, ['ng-disabled'=>'disabled','class'=>'input-sm form-control']); ?>

			</div>
		</div>
		<div class="col-md-4">
			<?php echo Form::label('sex',trans('user.gender')); ?>:
			<?php echo Form::select('sex', trans('globals.person_sex'), null, ['ng-disabled'=>'disabled','class'=>'input-sm form-control']); ?>

		</div>
	</div>


<?php else: ?>

	<div class="form-group">
		<div class="col-md-4">
			<?php echo Form::label('business_name',trans('user.business_name')); ?>:
			<div class="input-group">
      			<div class="input-group-addon input-sm"><span class="glyphicon glyphicon-user"></span></div>
				<?php echo Form::text('business_name', null, ['ng-disabled'=>'disabled','class'=>'form-control input-sm']); ?>

			</div>
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-4">
			<?php echo Form::label('work_phone',trans('user.company_phone')); ?>:
			<div class="input-group">
      			<div class="input-group-addon input-sm"><span class="glyphicon glyphicon-phone-alt"></span></div>
				<?php echo Form::text('work_phone',null, ['ng-disabled'=>'disabled','class'=>'form-control input-sm']); ?>

			</div>
		</div>
	</div>

<?php endif; ?>


<div class="form-group">
	<div class="col-md-4 col-lg-4">
		<?php echo Form::label('nickname',trans('user.nickname')); ?>:
		<div class="input-group">
      		<div class="input-group-addon input-sm"><span class="fa fa-user-secret"></span></div>
			<?php echo Form::text('nickname', null, ['ng-disabled'=>'disabled','class'=>'form-control input-sm']); ?>

		</div>
	</div>
</div>

<div class="form-group">
	<div class="col-md-4 col-lg-4">
		<?php echo Form::label('email',trans('user.email')); ?>:
		<div class="input-group">
      		<div class="input-group-addon input-sm"><span class="fa fa-envelope"></span></div>
			<?php echo Form::email('email', (isset($email))?$email:null, ['ng-disabled'=>'disabled','class'=>'form-control input-sm']); ?>

		</div>
	</div>
</div>

<?php if(!\Auth::check()): ?>
	<div class="row">&nbsp;</div>
	<h5><?php echo e(trans('user.password_confirmation')); ?></h5>
	<?php echo $__env->make('user.partial.security_inputs', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
<?php endif; ?>
