<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ContactusController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ShoppingcarController;
use App\Http\Controllers\SignupController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::resource('/',HomeController::class);
Route::resource('/home',HomeController::class);
Route::resource('/perfil',ProfileController::class);
Route::resource('/login',LoginController::class);
Route::resource('/registro',SignupController::class);
Route::resource('/categorias',CategoryController::class);
Route::resource('/productos', ProductController::class);
Route::resource('/contactanos', ContactusController::class);
Route::resource('/carrito', ShoppingcarController::class);
