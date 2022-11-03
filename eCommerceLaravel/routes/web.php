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
    return view('index');
});
Route::get('/ping/home', function () {
    // return view('welcome');
    return view('home');
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
Route::get('/login', function () {
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
