<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index');

/* 参考 http://9iphp.com/web/laravel/larevel-5-middleware.html*/
Route::get('address', ['middleware' => 'auth', function(){
    Route::resource('address', 'AddressController');
}]);

/* 这是模仿的对象，但模仿失败
Route::group(['middleware' => 'auth', 'namespace' => 'Admin', 'prefix' => 'admin'], function() {
    Route::get('/', 'HomeController@index');
});
*/