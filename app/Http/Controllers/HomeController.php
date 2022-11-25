<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\home;
use App\Models\product;
use App\Models\category;
use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // return view('home.index');

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\home  $home
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        return view('user.home.index');
    }

}

