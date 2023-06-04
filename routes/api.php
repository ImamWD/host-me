<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\loginController;
use App\Http\Controllers\API\usersController;
use App\Http\Controllers\API\categoryController;
use App\Http\Controllers\API\shopController;
use App\Http\Controllers\API\adsController;
use App\Http\Controllers\API\productsController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
// ---------------AUTHRAIZATION
Auth::routes(['verify' => true]);
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
// ---------------USERS API ROUTE
Route::post('login', [loginController::class, 'login']);
Route::post('adduser', [loginController::class, 'adduser']);
Route::post('Usersinfo', [usersController::class, 'UsersInfo']);
Route::post('deleteuser', [usersController::class, 'UsersDelete']);
// ---------------CATEGORY API ROUTE
Route::post('addcategory', [categoryController::class, 'addcategory']);
Route::post('categoryinfo', [categoryController::class, 'categoryinfo']);
// ---------------SHOP API ROUTE
Route::post('shopsinfo', [shopController::class, 'getallShops']);
Route::post('addShop', [shopController::class, 'addShop']);
Route::post('oneshop', [shopController::class, 'oneshop']);
// ---------------ADS API ROUTE
Route::post('addads', [adsController::class, 'addAds']);
Route::post('alladsinfo', [adsController::class, 'allAdsinfo']);
Route::post('oneshopads', [adsController::class, 'oneshopads']);
Route::post('oneadinfo', [adsController::class, 'oneadinfo']);
Route::post('updateads', [adsController::class, 'updateads']);
Route::post('deleteads', [adsController::class, 'deleteads']);

// ---------------PRODUCTS AND CUSTOMERS PROCESS API ROUTE
Route::post('addproduct', [productsController::class, 'addproduct']);
Route::post('oneproductinfo', [productsController::class, 'oneproductinfo']);
Route::post('AllProductsInfoFormOneShop', [productsController::class, 'AllProductsInfoFormOneShop']);
