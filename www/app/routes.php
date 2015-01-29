<?php
#https://github.com/laravel/laravel/tree/master/public
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/



Route::get('/', function()
{
    return View::make('public.layouts.app');
});

Route::get('/contact', 'AppController@contactForm');
Route::post('/processForm', 'AppController@processForm');

Route::group(array('prefix' => 'api/v1/'), function(){
    Route::resource('appointment', 'AppointmentController');
    Route::resource('users', 'UsersController');
    Route::resource('todos', 'TodosController');
});