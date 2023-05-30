<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

/*Route::get('/', function () {
    return view('welcome');
});*/
use App\Http\Controllers\login;
use App\Http\Controllers\home;

Route::get('/signup',[login::class,'signup']);
Route::get('/',[login::class,'login']);
Auth::routes();

Auth::routes();

Route::get('/home', [App\Http\Controllers\home::class, 'index'])->name('home');

Route::get('/OwnerEmployeesDashboard', function () {
    return view('cruds.ownercruds.owneremployeescrud');
});

Route::get('/OwnerDashboard', function () {
    return view('cruds.ownercruds.ownercrud');
});
Route::get('/SubscriberDashboard', function () {
    return view('cruds.ownercruds.subscribercrud');
});
Route::get('/SubscriberEmployeeDashboard', function () {
    return view('cruds.ownercruds.subscriberemployeecrud');
});
Route::get('/CustomerDashboard', function () {
    return view('cruds.ownercruds.customercrud');
});

Route::get('/HomeDashboard', function () {
    return view('cruds.homecrud');
});

Route::get('/CategoryDashboard', function () {
    return view('cruds.category.categorycrud');
});
Route::get('/ShopsDashboard', function () {
    return view('cruds.shops.shopscrud');
});

Route::get('/myShop', function () {
    return view('cruds.shops.shophome');
});