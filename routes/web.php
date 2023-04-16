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
