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
        $productbanner = category::all();
        $product = product::all();
        $joincolor = DB::table('products_shirtcolors')->select('*')->inRandomOrder()->get();


        // dd($joincolor);
        return view('user.home.index', compact('product', 'productbanner', 'joincolor'));
    }

}

                // $data = category::all();

        // $product = DB::table('products')
        // ->join('products_categories', 'products.id', '=', 'products_id')
        // ->join('categories', 'categories.id', '=', 'categories_id')
        // ->select(
        //     'products_id as product_id',
        //     'products.name as product',
        //     'products.image as image',
        //     'products.price as price',
        //     'categories.name as category',
        //     'categories.id as category_id'
        //     )
        // ->get();


        // foreach($product as $pro)
        // {
        //     foreach($pro->JoinCategories as $ca)
        //     {
        //         // dd($ca->toArray());
        //         echo ("<br>".$ca->id );
        //         echo ($pro->name);
        //         echo ($ca->name);

        //     }
        // }
