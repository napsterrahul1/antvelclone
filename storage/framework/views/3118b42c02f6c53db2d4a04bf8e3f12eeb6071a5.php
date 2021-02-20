<?php $__env->startSection('title'); ?>@parent  - <?php echo e(trans('globals.home')); ?> <?php $__env->stopSection(); ?>

<?php echo $__env->make('partial.message', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

<?php $__env->startSection('content'); ?>

    <section class="products_view">

        <div class="container" id="home_content" style="padding: 0px;">



            
            
            
            <div class="home-info-bar clearfix">
                <div class="col-xs-2 col-md-2"></div>
                <div class="col-xs-8 col-md-8">
                    <div class="col-md-1"></div>
                    <div class="col-md-2 home-info-bar-text" style="padding: 8px;border-right: 2px solid grey;">Go quickly to &nbsp;<i class="fa fa-arrow-right" aria-hidden="true"></i></div>
                    
                    <a href="<?php echo url('home'); ?>" style="text-align: center">
                        <div class="col-md-2 home-info-bar-text hovergreen" style="border-right: 2px solid grey;text-align: center"> <div class="glyphicon glyphicon-erase"></div>&nbsp; Electronics</div></a>
                    <a href="<?php echo url('home/2'); ?>">
                        <div class="col-md-2 home-info-bar-text hovergreen" style="border-right: 2px solid grey;text-align: center"><div class="glyphicon glyphicon-cutlery"></div>&nbsp; Food</div></a>
                    <a href="<?php echo url('home/3'); ?>">
                        <div class="col-md-2 home-info-bar-text hovergreen" style="border-right: 2px solid grey;text-align: center"><div class="glyphicon glyphicon-print"></div>&nbsp; Printing</div></a>
                </div>
            </div>
<?php if(\Illuminate\Support\Facades\Auth::check()): ?>
                <div class="home-carousel-box" style="width: 100%">

                    <div id="store-home-carousel" class="carousel slide" data-ride="carousel">

                        
                        <ol class="carousel-indicators">
                            <?php for($s=0; $s<count($suggestion['carousel']); $s++): ?>
                                <li data-target="#store-home-carousel" data-slide-to="<?php echo e($s); ?>" <?php if($s==0): ?> class="active" <?php endif; ?> ></li>
                            <?php endfor; ?>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <?php $pos = 0; ?>
                            <?php $__currentLoopData = $suggestion['carousel']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>

                                
                                <div class="item <?php if($i++==0): ?> active <?php endif; ?>">
                                    <?php if(isset($banner[$pos])): ?>
                                        <img src="<?php echo e(url($banner[$pos++])); ?>" alt="<?php echo e($product['name']); ?>">
                                    <?php else: ?>
                                        <img src="<?php echo asset('/').'img/no-image.jpg'; ?>" alt="<?php echo e($product['name']); ?>">
                                    <?php endif; ?>
                                    
                                    <div class="jumbotron <?php echo e($jumbotronClasses[mt_rand(0,1)]); ?> ">

                                        <h5><?php echo e(str_limit($product['name'], 200,'...')); ?></h5>

                                        <p class = "description"><?php echo e(str_limit($product['description'], 200,'...')); ?></p>

                                        <?php if($product['price'] > 0): ?>
                                            <p class = "price">
                                                <strong><?php echo \Utility::showPrice($product['price']); ?></strong>
                                            </p>
                                        <?php endif; ?>

                                        <hr>

                                        <div class="btn-group" role="group" aria-label="...">

                                            <a href="<?php echo e(route('products.show',[$product['id']])); ?>" class="btn btn-default btn-sm" style="width: 33%;">
                                                <div class = "glyphicon glyphicon-shopping-cart"></div>&nbsp;<?php echo e(trans('store.add_to_cart')); ?>

                                            </a>

                                            <?php if(Auth::user()): ?>

                                                <a href="<?php echo e(route('orders.add_to_order',['wishlist', $product[($product['type']=='freeproduct')?'parent_id':'id']])); ?>" class="btn btn-default btn-sm" style="width: 33%;">
                                                    <div class = "glyphicon glyphicon-heart"></div>&nbsp;<?php echo e(trans('store.add_to_wish_list')); ?>

                                                </a>

                                            <?php else: ?>

                                                <a href="<?php echo url('/'); ?>" class="btn btn-default btn-sm" style="width: 33%;">
                                                    <div class = "glyphicon glyphicon-heart"></div>&nbsp;<?php echo e(trans('store.add_to_wish_list')); ?>

                                                </a>

                                            <?php endif; ?>

                                            <a href="<?php echo e(route('products.show',[$product['id']])); ?>" class="btn btn-default btn-sm" style="width: 33%;">

                                                <div class = "glyphicon glyphicon-eye-open"></div>&nbsp;<?php echo e(trans('store.viewDetails')); ?>


                                            </a>

                                        </div>

                                    </div>

                                </div> 

                            <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>

                        </div> 


                    </div>

                </div> 

            <?php else: ?>
            <div class="home-carousel-box" style="width: 100%">

                <div id="store-home-carousel" class="carousel slide" data-ride="carousel">

                    
                    <ol class="carousel-indicators">
                        <?php for($s=0; $s<count($suggestion['carousel']); $s++): ?>
                            <li data-target="#store-home-carousel" data-slide-to="<?php echo e($s); ?>" <?php if($s==0): ?> class="active" <?php endif; ?> ></li>
                        <?php endfor; ?>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                    <?php $pos = 0; ?>

                    <?php $__currentLoopData = $suggestion['carousel']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>

                        
                        <div class="item <?php if($i++==0): ?> active <?php endif; ?>">
                            <?php if(isset($banner[$pos])): ?>
                                <img src="<?php echo e(url($banner[$pos++])); ?>" alt="<?php echo e($product['name']); ?>">
                            <?php else: ?>
                                <img src="<?php echo asset('/').'img/no-image.jpg'; ?>" alt="<?php echo e($product['name']); ?>">
                            <?php endif; ?>
                            
                            <div class="jumbotron jumbotron-box-left">

                                <h5><?php echo e(str_limit($product['name'], 200,'...')); ?></h5>

                                <p class = "description"><?php echo e(str_limit($product['description'], 200,'...')); ?></p>

                                <?php if($product['price'] > 0): ?>
                                    <p class = "price">
                                        <strong><?php echo \Utility::showPrice($product['price']); ?></strong>
                                    </p>
                                <?php endif; ?>

                                <hr>

                                <div class="btn-group" role="group" aria-label="...">

                                    <a href="<?php echo e(route('products.show',[$product['id']])); ?>" class="btn btn-default btn-sm" style="width: 33%;">
                                         <div class = "glyphicon glyphicon-shopping-cart"></div>&nbsp;<?php echo e(trans('store.add_to_cart')); ?>

                                    </a>

                                    <?php if(Auth::user()): ?>

                                        <a href="<?php echo e(route('orders.add_to_order',['wishlist', $product[($product['type']=='freeproduct')?'parent_id':'id']])); ?>" class="btn btn-default btn-sm" style="width: 33%;">
                                            <div class = "glyphicon glyphicon-heart"></div>&nbsp;<?php echo e(trans('store.add_to_wish_list')); ?>

                                        </a>

                                    <?php else: ?>

                                        <a href="<?php echo url('/'); ?>" class="btn btn-default btn-sm" style="width: 33%;">
                                            <div class = "glyphicon glyphicon-heart"></div>&nbsp;<?php echo e(trans('store.add_to_wish_list')); ?>

                                        </a>

                                    <?php endif; ?>

                                    <a href="<?php echo e(route('products.show',[$product['id']])); ?>" class="btn btn-default btn-sm" style="width: 33%;">

                                        <div class = "glyphicon glyphicon-eye-open"></div>&nbsp;<?php echo e(trans('store.viewDetails')); ?>


                                    </a>

                                </div>

                            </div>

                                <div class="jumbotron jumbotron-box-right1">
                                    <div class="" ng-controller="LoginController">
                                        <div class="col-md-12">

                                            <?php echo Form::open(['url'=>'login','name'=>'loginForm', 'class'=>'form-horizontal','role'=>"form",'method'=>"POST"]); ?>


                                            <?php echo e(csrf_field()); ?>


                                            <div class="form-group"  style="margin-bottom: 0px;">
                                                <h6 class="black_color"><?php echo e(trans('user.email_address')); ?></h6>
                                                <div class="input-group">
                                                    <div class="input-group-addon"><span class="fa fa-envelope-o"></span></div>
                                                    <input type="email" class="form-control" name="email" value="<?php echo e(old('email')); ?>" required>
                                                </div>
                                            </div>

                                            <div class="form-group"  style="margin-bottom: 0px;">
                                                <h6 class="black_color"><?php echo e(trans('user.password_message.password')); ?></h6>
                                                <div class="input-group">
                                                    <div class="input-group-addon"><span class="fa fa-lock"></span></div>
                                                    <input ng-disabled="!havePassword" type="password" class="form-control" name="password">
                                                </div>
                                            </div>
                                            <div class="form-group" style="margin-bottom: 0px;">
                                                <label style="line-height: 1.5">
                                                    <a style="" href="<?php echo e(url('/password/reset')); ?>">
                                                        <?php echo e(trans('user.forgot_your_password')); ?>?
                                                    </a>
                                                </label>
                                                <br>
                                                <label style="line-height: 1.5">
                                                    <a href="<?php echo url('register'); ?>"><?php echo e(trans('user.password_message.not_a_member')); ?></a>
                                                </label>
                                            </div>
                                            <div class="form-group" style="text-align: center">

                                                <hr style="margin-bottom: 0px; margin-top: 0px;">
                                                <button type="submit" class="btn btn-primary" style="width: 100%;">
                                                    <?php echo e(trans('user.login')); ?>

                                                </button>
                                            </div>

                                            <?php echo Form::close(); ?>


                                        </div> 

                                    </div> 

                                </div>

                        </div> 

                    <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>

                    </div> 

                </div>

            </div> 
            
<?php endif; ?>

            
            
            
            



            

            
            
            

            @parent

            <?php $__env->startSection('center_content'); ?>

                
                <div class="clearfix home-products-wrapper">

                    <div class="col-lg-12">
                        <?php if(Auth::check()): ?>
                            <h4 class="home-title-section"><?php echo e(trans('store.suggestions.viewed')); ?></h4>
                        <?php else: ?>
                            <h4 class="home-title-section"><?php echo e(trans('store.suggestions.viewed_unlogged')); ?></h4>
                        <?php endif; ?>
                    </div>
                    <div class="container-fluid marketing">
                        <div class="row">
                            <?php $__currentLoopData = $suggestion['viewed']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                                <?php echo $__env->make('products.partial.productBox', $product, array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                        </div>
                    </div>

                </div>

                
                <div class="clearfix home-products-wrapper">

                    <div class="col-lg-12">
                        <h4 class="home-title-section"><?php echo e(trans('store.suggestions.categories')); ?></h4>
                    </div>

                    <div class="container-fluid marketing">
                        <div class="row">
                            <?php $__currentLoopData = $suggestion['categories']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                                <?php echo $__env->make('products.partial.productBox', $product, array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                        </div>
                    </div>

                </div>

                
                <div class="clearfix home-products-wrapper">

                    <div class="col-lg-12">
                        <?php if(Auth::check()): ?>
                            <h4 class="home-title-section"><?php echo e(trans('store.suggestions.trends')); ?></h4>
                        <?php else: ?>
                            <h4 class="home-title-section"><?php echo e(trans('store.suggestions.trends_unlogged')); ?></h4>
                        <?php endif; ?>
                    </div>

                    <div class="container-fluid marketing">
                        <div class="row">
                            <?php $__currentLoopData = $suggestion['purchased']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                                <?php echo $__env->make('products.partial.productBox', $product, array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                        </div>
                    </div>

                </div>

            <?php $__env->stopSection(); ?> 


            
            
            

            

                

                    
                    
                        
                            
                                
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                        
                    

                    

                    

                        

                            

                                

                                    
                                        
                                    

                                    

                                       

                                    

                                    
                                        
                                        
                                        
                                        
                                        
                                            
                                                
                                                    
                                                
                                            
                                        
                                        
                                        
                                            
                                            
                                            
                                                
                                                    
                                                        
                                                    
                                                
                                            
                                        
                                    

                                

                            

                        

                    

                

            


            

            <?php $__env->startSection('panel_left_content'); ?>
                <div  class="vertical-nav">

                    <div class="navbar navbar-default" role="navigation">

                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
                                <span class="sr-only"><?php echo e(trans('globals.refine')); ?></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <span class="visible-xs-block navbar-brand"><?php echo e(trans('globals.refine')); ?></span>
                        </div>

                        <div id="menu-left-category" class="navbar-collapse collapse sidebar-navbar-collapse" ng-cloak style="padding: 10px">

                            <div class="filters-applied ng-cloak visible-xs" ng-show="filters" >
                        <span ng-repeat="filter in filters">
                            <button type="button" class="text-capitalize btn btn-warning btn-xs"  ng-click="removeFilter(filter)">
                                <span ng-bind-html="(filter.value.name)? filter.value.name:filter.value"></span>
                                <span data-role="remove" class="glyphicon glyphicon-remove"></span>
                            </button>
                        </span>
                            </div>

                            <?php $__currentLoopData = $filters; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $filter): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                                
                                <ul class="nav navbar-nav <?php echo e($key); ?>" >
                                    <h4 class="small breadcrumb <?php if($key=='categories'): ?> no_margin_top <?php endif; ?>"><?php echo e(trans('globals.filters.'.$key)); ?></h4>
                                    <?php $i=0; ?>
                                    <?php if($key=='category'): ?>
                                        <?php $__currentLoopData = $filter; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $id => $item): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                                            <?php if (5<$i++){ break; } ?>
                                            <li>
                                                <a href="<?php echo e(url('/products?').\Utility::getUrlQueryString($refine, 'category', urlencode($item['id'].'|'.$item['name']))); ?>">
                                                    <?php echo e(ucfirst($item['name'])); ?> <small><span class="badge" style="float: right;"><?php echo e($item['qty']); ?></span></small>
                                                </a>
                                            </li>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>

                                    <?php else: ?>

                                        <?php $__currentLoopData = $filter; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item => $count): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                                            <?php if (5<$i++){ break; } ?>
                                            <li>
                                                <a href="<?php echo e(url('/products?').\Utility::getUrlQueryString($refine, $key, urlencode($item))); ?>">
                                                    <?php echo e(ucfirst($item)); ?> <span class="badge" style="float: right;"><?php echo e($count); ?></span>
                                                </a>
                                            </li>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                                    <?php endif; ?>
                                </ul>
                                

                                
                                <script type='text/ng-template' id="<?php echo e($key); ?>-snippet" class="panel">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button ng-click="$close(false)" type="button" class="close"><span aria-hidden="true">&times;</span></button>
                                            <?php echo e(trans('globals.filters.'.$key)); ?>

                                        </div>
                                        <div class="modal-body">
                                            <div class="container-fluid">
                                                <ul class="list-inline">
                                                    <?php if($key=='category'): ?>
                                                        <?php $__currentLoopData = $filter; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $id => $item): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                                                            <li class="text-capitalize  col-xs-12 col-sm-4 col-md-4">
                                                                <a href="<?php echo e(url('/products?').\Utility::getUrlQueryString($refine, 'category', urlencode($item['id'].'|'.$item['name']))); ?>" >
                                                                    <?php echo e($item['name']); ?> <span class="badge" style="float: right;"><?php echo e($item['qty']); ?></span>
                                                                </a>
                                                            </li>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                                                    <?php else: ?>
                                                        <?php $__currentLoopData = $filter; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item => $count): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                                                            <li class="text-capitalize  col-xs-12 col-sm-4 col-md-4">
                                                                <a href="<?php echo e(url('/products?').\Utility::getUrlQueryString($refine, $key, urlencode($item))); ?>" >
                                                                    <?php echo e($item); ?> <span class="badge" style="float: right;"><?php echo e($count); ?></span>
                                                                </a>
                                                            </li>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                                                    <?php endif; ?>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="modal-footer clearfix">
                                            <button ng-click="$close(false)" class="btn btn-info btn-sm pull-left">
                                                <?php echo e(trans('globals.close_label')); ?>

                                            </button>
                                        </div>
                                    </div>
                                </script>

                                
                                <?php if($i > 6): ?>
                                    <small ng-controller="ModalCtrl" ng-click="modalOpen({templateUrl:'<?php echo e($key); ?>-snippet', size: 'md'})" >
                                        <a href="javascript:void(0)">
                                            <span class="glyphicon glyphicon-zoom-in"></span>&nbsp;
                                            <?php echo e(trans('globals.see_more')); ?>

                                        </a>
                                    </small>
                                <?php elseif($i == 0): ?>
                                    <ul class="nav navbar-nav" >
                                        <li><a href="javascript:window.history.back()"><span class="glyphicon glyphicon-menu-left"></span>&nbsp;<?php echo e(trans('globals.go_back_label')); ?></a></li>
                                        <?php if(isset($filterSelected[$key]) && count($filterSelected) > 0): ?>
                                            <li>
                                                <a href="<?php echo e(ucwords($filterSelected[$key]['url'])); ?>">
                                                    <span class="glyphicon glyphicon-remove"></span>&nbsp;
                                                    <?php echo e(ucwords($filterSelected[$key]['label'])); ?>

                                                </a>
                                            </li>
                                        <?php endif; ?>
                                    </ul>
                                <?php endif; ?>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>

                            <ul class="nav navbar-nav list-group price-range">
                                <h4 class="small breadcrumb"><?php echo e(trans('globals.filters.price_range')); ?></h4>
                                <li>
                                    <div class="row">
                                        <div class="col-md-10">
                                            <form method="GET" action="<?php echo url('products'); ?>" name="rangepriceForm" novalidate>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-addon input-sm"><i class="fa fa-inr" aria-hidden="true"></i></div>
                                                        <input class="form-control input-sm" type="number" value="<?php echo e(isset($refine['min']) ? $refine['min'] : ''); ?>" name="min" id="min" placeholder="<?php echo e(trans('globals.min_label')); ?>">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group">
                                                            <div class="input-group-addon input-sm"><i class="fa fa-inr" aria-hidden="true"></i></div>
                                                            <input class="form-control input-sm" type="number" value="<?php echo e(isset($refine['max']) ? $refine['max'] : ''); ?>" name="max" id="max" placeholder="<?php echo e(trans('globals.max_label')); ?>">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-success btn-sm" style="width: 100%;">
                                                        <span class="glyphicon glyphicon-filter"></span>&nbsp;
                                                        <?php echo e(trans('globals.go_label')); ?>

                                                    </button>
                                                </div>
                                                <?php $__currentLoopData = $refine; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getFirstLoop(); ?>
                                                    <?php if(trim($value)!='' && $key != 'category_name' && $key != 'min' && $key != 'max'): ?>
                                                        <?php $value = $key == 'category' ? $value.'|'.urlencode($refine['category_name']) : $value; ?>
                                                        <input type="hidden" name="<?php echo e($key); ?>" id="<?php echo e($key); ?>" value="<?php echo e($value); ?>">
                                                    <?php endif; ?>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getFirstLoop(); ?>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-md-2">&nbsp;</div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            <?php $__env->stopSection(); ?>
            
        </div> 

    </section> 
    <script>
        $(function(){
//                $('#store-home-carousel.slide').carousel({
//                    interval: 5000,
//                    pause: "hover"
//                });
        $('input').focus(function(){
                $("#store-home-carousel").carousel('pause');
            }).blur(function() {
                $("#store-home-carousel").carousel('pause');
            });
        });
    </script>

<?php $__env->stopSection(); ?> 

<?php echo $__env->make('layouts.master', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>