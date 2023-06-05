<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\loginController;
use App\Http\Controllers\API\usersController;
use App\Http\Controllers\API\categoryController;
use App\Http\Controllers\API\shopController;
use App\Http\Controllers\API\adsController;
use App\Http\Controllers\API\productsController;
use App\Http\Controllers\API\ordersController;
use App\Http\Controllers\API\cartController;
use App\Http\Controllers\API\wishlistController;
use App\Http\Controllers\API\feedbackController;

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
// ---------------PRODUCTS API ROUTE
Route::post('addproduct', [productsController::class, 'addproduct']);
Route::post('oneproductinfo', [productsController::class, 'oneproductinfo']);
Route::post('AllProductsInfoFormOneShop', [productsController::class, 'AllProductsInfoFormOneShop']);
Route::post('AllProductsRecoSys', [productsController::class, 'AllProductsRecoSys']);
Route::post('AllProductsInfo', [productsController::class, 'AllProductsInfo']);
Route::post('UpdateProduct', [productsController::class, 'UpdateProduct']);
Route::post('DeleteProduct', [productsController::class, 'DeleteProduct']);
Route::post('AllProductsInfoOfSameCategory', [productsController::class, 'AllProductsInfoOfSameCategory']);
Route::post('AllCategoriesForOneShop', [productsController::class, 'AllCategoriesForOneShop']);
Route::post('AllProductsInfoOfSameCategoryOneShop', [productsController::class, 'AllProductsInfoOfSameCategoryOneShop']);
// ---------------ORDERS API ROUTE
Route::post('AddNewOrder', [ordersController::class, 'AddNewOrder']);
Route::post('AddNewProductToOrder', [ordersController::class, 'AddNewProductToOrder']);
Route::post('AllOrdersInfoFromOneCustomer', [ordersController::class, 'AllOrdersInfoFromOneCustomer']);
Route::post('AllProductsFromOneOrder', [ordersController::class, 'AllProductsFromOneOrder']);
Route::post('AllOrdersInfoFromOneShop', [ordersController::class, 'AllOrdersInfoFromOneShop']);
Route::post('AllProductsFromOneOrderOneShop', [ordersController::class, 'AllProductsFromOneOrderOneShop']);
// ---------------CART API ROUTE
Route::post('AddProductToCart', [cartController::class, 'AddProductToCart']);
Route::post('RemoveProductinCart', [cartController::class, 'RemoveProductinCart']);
Route::post('AllProductsInfoInCartToOneCustomer', [cartController::class, 'AllProductsInfoInCartToOneCustomer']);
// ---------------WISHLIST API ROUTE
Route::post('AddProductToWishlist', [wishlistController::class, 'AddProductToWishlist']);
Route::post('RemoveProductinWishlist', [wishlistController::class, 'RemoveProductinWishlist']);
Route::post('AllProductsInfoInWishlistToOneCustomer', [wishlistController::class, 'AllProductsInfoInWishlistToOneCustomer']);
// ---------------FEEDBACK API ROUTE
Route::post('Addshopfeedback', [feedbackController::class, 'Addshopfeedback']);
Route::post('Addproductfeedback', [feedbackController::class, 'Addproductfeedback']);
Route::post('productfeedbackinfo', [feedbackController::class, 'productfeedbackinfo']);
Route::post('shopfeedbackinfo', [feedbackController::class, 'shopfeedbackinfo']);