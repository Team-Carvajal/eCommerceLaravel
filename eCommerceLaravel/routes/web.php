<?php

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

Route::get('/', function () {
    // return view('welcome');
    return view('home');
});
Route::get('/ping/home', function () {
    // return view('welcome');
    return view('home');
});
Route::get('/ping/perfil', function () {
    // return view('welcome');
    return view('profile');
});
Route::get('/ping/contactanos', function () {
    // return view('welcome');
    return view('contactanos');
});
Route::get('/ping/categorias', function () {
    // return view('welcome');
    return view('categorias');
});
Route::get('/ping/carrito', function () {
    // return view('welcome');
    return view('carrito');
});
Route::get('/inicio-de-sesion', function () {
    // return view('welcome');
    return view('login');
});
Route::get('/ping/registro', function () {
    // return view('welcome');
    return view('registro');
});
Route::get('/ping/sobre-nosotros', function () {
    // return view('welcome');
    return view('about');
});
Route::get('/pong', function () {
    // return view('welcome');
    return view('dashboard/dashboard');
});
Route::get('/pong/dashboard', function () {
    // return view('welcome');
    return view('dashboard/dashboard');
});
