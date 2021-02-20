<hr class="hidden-lg">
<?php echo $__env->make('partial.message', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
<?php echo Form::open(array('route' => 'contact_store', 'class' => 'form-horizontal', 'id' => 'contact_store')); ?>

<fieldset>

    

      
        
      
      
      
        
      
      
      
    

   <div class="form-group col-lg-12">
       <div class="col-lg-3">
           <?php echo Form::label(trans('about.name')); ?>:
       </div>
       <div class="col-lg-9">
    <?php echo Form::text('name', null,['required','class'=>'form-control ','placeholder'=>trans('about.name_placeholder')]); ?>

  </div>
  </div>
  <div class="form-group col-md-12">
      <div class="col-lg-3">
    <?php echo Form::label(trans('about.email')); ?>:
          </div>
      <div class="col-lg-9">
    <?php echo Form::text('email', null,['required','class'=>'form-control','placeholder'=>trans('about.email_placeholder')]); ?>

  </div>
  </div>
    <div class="form-group col-md-12">
        <div class="col-lg-3">
        <?php echo Form::label('Number'); ?>:
            </div><div class="col-lg-9">
        <?php echo Form::text('number', null,['required','class'=>'form-control','placeholder'=>'We need your mobile to be in touch']); ?>

    </div>
    </div>
    <div class="form-group col-md-12">
        <div class="col-lg-3">
        <?php echo Form::label('company/'); ?> <?php echo Form::label('Address'); ?>:
            </div>
        <div class="col-lg-9">
        <?php echo Form::textarea('company', null, ['required','class'=>'form-control','rows'=>'3','placeholder'=>trans('about.company_placeholder')]); ?>

    </div>
    </div>
  <div class="form-group col-md-12">
      <div class="col-lg-3">
    <?php echo Form::label(trans('about.message')); ?>:
          </div>
      <div class="col-lg-9">
    <?php echo Form::textarea('message', null, ['required','class'=>'form-control','rows'=>'3','placeholder'=>trans('about.message_placeholder')]); ?>

  </div>
  </div>
  <div class="form-group col-md-12">
    <?php echo Form::submit(trans('about.contact_us'),['class'=>'btn btn-primary pull-right','style'=>'width: 67%;margin-right: 12px;']); ?>

  </div>
</fieldset>
</from>