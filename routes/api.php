<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\loginController;
use App\Http\Controllers\API\usersController;
use App\Http\Controllers\API\categoryController;

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
Auth::routes(['verify' => true]);
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('login', [loginController::class, 'login']);
Route::post('adduser', [loginController::class, 'adduser']);
Route::post('Usersinfo', [usersController::class, 'UsersInfo']);
Route::post('deleteuser', [usersController::class, 'UsersDelete']);
Route::post('addcategory', [categoryController::class, 'addcategory']);
Route::post('categoryinfo', [categoryController::class, 'categoryinfo']);