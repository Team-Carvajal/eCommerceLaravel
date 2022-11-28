<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ContactusController;
use App\Http\Controllers\DetailProductController;
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

Route::get('/', [HomeController::class, 'show']);
Route::get('/home', [HomeController::class, 'show']);

// Route::get('/home', [HomeController::class, 'joinproduct']);
// Route::resource('/perfil',ProfileController::class);
Route::get('/perfil/{profile}', [ProfileController::class, 'edit'])->middleware('auth');
Route::put('perfil/{profile}', [ProfileController::class, 'update'])->name('profile.update');

//Login
Route::get('/login', [LoginController::class, 'index']);
Route::post('login', [LoginController::class, 'login'])->name('authentication');

Route::get('/registro', [SignupController::class, 'index']);
Route::post('/registro', [SignupController::class, 'store'])->name('save');

Route::get('/logout', [LoginController::class, 'logout'])->name('logout');

Route::get('/reset-password', [LoginController::class, 'index']);

Route::resource('/categorias', CategoryController::class);
Route::get('/{categoria}', [ProductController::class, 'bycategory']);

Route::get('/{categoria}/{producto}', [DetailProductController::class, 'show']);

Route::resource('/contactanos', ContactusController::class);

Route::resource('/carrito', ShoppingcarController::class);
