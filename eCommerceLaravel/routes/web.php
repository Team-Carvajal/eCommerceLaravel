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
Route::get('/home', [HomeController::class, 'index']);


Route::get('/perfil', [ProfileController::class, 'index']);



//Login
Route::get('/login', [LoginController::class, 'index']);
Route::post('login', [LoginController::class, 'login'])->name('authentication');

Route::get('/registro', [SignupController::class, 'index']);
Route::post('/registro', [SignupController::class, 'store'])->name('save');






Route::get('/categorias',[CategoryController::class, 'index']);


Route::resource('/productos', ProductController::class);

Route::get('/contactanos', [ContactusController::class, 'index']);


Route::resource('/carrito', ShoppingcarController::class);
