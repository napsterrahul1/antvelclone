<?php
Route::get('emailVerification/{userid}', 'UserController@emailVerification');
Route::get('getcitybypincode', 'HomeController@getcitybypincode');
//Route::get('getvisitorcount', 'HomeController@getvisitorcount');
Route::get('home/{id}', 'HomeController@index');


Route::resource('typepreferences', 'TypePreferencesController');

//points push notifications
Route::get('getPoints', 'UserController@getPoints');

//notices
Route::get('user/notices/check/{id?}', 'NoticesController@check');

Route::get('user/notices/list/{num?}', 'NoticesController@index');

Route::get('user/notices/{type?}', 'NoticesController@push');
Route::get('contactus', ['as' => 'contactus', 'uses' => 'AboutController@contact']);
Route::get('otherPolicies', ['as' => 'otherPolicies', 'uses' => 'AboutController@otherPolicies']);
Route::get('userAgreement', ['as' => 'userAgreement', 'uses' => 'AboutController@userAgreement']);

Route::resource('user/notices', 'NoticesController');

Route::get('trackorder', 'OrdersController@trackOrder');
Route::post('trackorder', 'OrdersController@trackOrderPost');
Route::get('wpanel/category/show/{id}', 'CategoriesController@show');
Route::put('wpanel/category/update/{id}', 'CategoriesController@update');
Route::post('wpanel/category/store', 'CategoriesController@store');

Route::put('wpanel/profile/update/{id}', 'CompanyController@update');
Route::put('wpanel/productsdetails/update/{id}', 'ProductDetailsController@update');
Route::post('wpanel/productsdetails/store', 'ProductDetailsController@store');
//Route::resource('wpanel/profile', 'CompanyController');

Route::get('changeOrderTrackSatus/{orderid}/{ordertrack_statusid}', 'OrdersController@changeOrderTrackSatus');

Route::group(['prefix' => 'user', 'roles' => array_keys(trans('globals.roles')), 'middleware' => ['auth', 'roles']], function () {
    Route::get('buyerList', 'UserController@buyerList');
    Route::get('sellerList', 'UserController@sellerList');
    Route::get('productList', 'UserController@productList');
    Route::get('subadminList', 'UserController@subadminList');

    //payment gateways routes
    Route::get('orders/success', 'OrdersController@success');
    Route::post('orders/success', 'OrdersController@success');
    Route::post('orders/failure', 'OrdersController@failure');
    Route::post('orders/cancelorder', 'OrdersController@cancelorder');

    Route::get('seller/approve/{userid}', 'UserController@sellerApprove');
    Route::get('seller/reject/{userid}', 'UserController@sellerReject');

    Route::get('seller/enable/{userid}', 'UserController@enable');
    Route::get('seller/disable/{userid}', 'UserController@disable');

    Route::get('buyer/enable/{userid}', 'UserController@buyerenable');
    Route::get('buyer/disable/{userid}', 'UserController@buyerdisable');

    Route::get('{id}/edit', 'UserController@edit'); //edit form
    Route::get('create', 'UserController@create'); //edit form
    Route::post('store', 'UserController@store'); //edit form
    Route::post('updateuser', 'UserController@updateuser'); //edit form

    Route::get('product/approve/{productid}', 'UserController@productApprove');
    Route::get('product/reject/{productid}', 'UserController@productReject');
    
    Route::get('dashboard', 'UserController@dashBoard');

    Route::get('/', 'UserController@profile');

    Route::get('profile', 'UserController@profile');


    Route::post('profile/save', 'UserController@saveProfile');

    Route::post('profile/disable', 'UserController@disableProfile');

    Route::post('profile/enable', 'UserController@activeProfile');

    Route::post('upload', 'UserController@upload');

    //Address
    Route::get('address/', 'AddressesController@index'); //list

    Route::post('address/default', 'AddressesController@setDefault'); //set default

    Route::get('address/create', 'AddressesController@create');  //create form

    Route::get('address/{id}/edit', 'AddressesController@edit'); //edit form

    Route::put('address/store', 'AddressesController@store'); //store

    Route::put('address/{id}', 'AddressesController@update'); //update

    Route::post('address/delete', 'AddressesController@destroy'); //delete

    //Store Cart

    Route::get('user/orders/updateQuantity/{orderId}/{orderDetailId}/{newValue}', ['uses' => 'OrdersController@updateQuantity', 'as' => 'orders.update_order_quantity']);

    Route::get('product/save/{product}', ['uses' => 'OrdersController@saveForLater', 'as' => 'orders.save_for_later']);

    Route::get('orders/moveFrom/{origin}/to/{destination}/{productId}', ['uses' => 'OrdersController@moveFromOrder', 'as' => 'orders.move_from_order']);

    Route::get('orders/addToOrder/{orderId}/{productId}', ['uses' => 'OrdersController@addToOrderById', 'as' => 'orders.add_to_order_by_id']);

    Route::get('orders/checkOut/', ['uses' => 'OrdersController@checkOut', 'as' => 'orders.check_out']);

    Route::get('orders/checkOut/address/{addressId}', ['uses' => 'OrdersController@checkOutResume', 'as' => 'orders.check_out_address']);

    Route::get('orders/placeOrder/{type}', ['uses' => 'OrdersController@placeOrder', 'as' => 'orders.place_order']);

    Route::get('orders', ['uses' => 'OrdersController@usersOrders', 'as' => 'orders.show_orders']);

    //filtered by dates
    Route::post('orders', ['uses' => 'OrdersController@usersOrders', 'as' => 'orders.show_orders']);

    Route::get('orders/cancel/{orderId}', ['uses' => 'OrdersController@cancel', 'as' => 'orders.cancel']);

    Route::get('orders/showSeller/{orderId}', ['uses' => 'OrdersController@showSellerOrder', 'as' => 'orders.show_seller_order']);

    Route::get('orders/show/{orderId}', ['uses' => 'OrdersController@showOrder', 'as' => 'orders.show_order']);

    Route::get('orders/rate/{orderId}', ['uses' => 'OrdersController@rateOrder', 'as' => 'orders.rate_order']);

    //Route used to login an user and send it back to the product show

    Route::get('logAndShow/{productId}', ['uses' => 'ProductsController@show', 'as' => 'products.log_and_show']);

    Route::get('orders/close/{order_id}', ['uses' => 'OrdersController@closeOrder', 'as' => 'orders.close']);

    Route::get('modalSeeKeysPurchased', ['uses' => 'VirtualProductOrdersController@modalSeeKeysPurchased', 'as' => 'VirtualProductOrders.modalSeeKeysPurchased']);

    Route::get('showKeyVirtualProductPurchased/{idProduct}/{idOrder}', ['uses' => 'VirtualProductOrdersController@showKeyVirtualProductPurchased', 'as' => 'VirtualProductOrders.showKeyVirtualProductPurchased']);

    Route::get('orders/comment/{order_id}', ['uses' => 'OrdersController@commentOrder', 'as' => 'orders.comment']);

    Route::post('orders/storeComment', ['uses' => 'OrdersController@storeComment', 'as' => 'orders.store_comment']);

    Route::get('orders/delete/{order_id}/{type}', ['uses' => 'OrdersController@destroy', 'as' => 'orders.delete']);

    //Rates
    Route::post('rates/seller', ['uses' => 'OrdersController@rateSeller', 'as' => 'orders.rate_seller']);

    Route::post('rates/product', ['uses' => 'OrdersController@rateProduct', 'as' => 'orders.rate_product']);

    //Freeproducts
    Route::put('freeproducts/subscribe/{id}', ['uses' => 'FreeProductsController@subscribe', 'as' => 'freeproducts.subscribe']);

    Route::get('myFreeProducts', ['uses' => 'FreeProductsController@myFreeProducts', 'as' => 'freeproducts.my_free_products']);
});
