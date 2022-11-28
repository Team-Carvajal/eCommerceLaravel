<?php

namespace App\Http\Controllers;

use App\Models\product;
use App\Models\category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    }

    public function byCategory($name)
    {
        category::where('name', $name)->firstOrFail();

        $category = Category::select('id')->where('name', $name)->first();


        $data = DB::select("SELECT

                categories.id as category_id,
                categories.name as category_name,
                categories.image as category_image,

                products.id as product_id,
                products.name as product_name,
                products.description as product_description,
                products_shirtcolors.image as product_image,
                products.price as price,
                products.garanty as product_garanty,
                products.quantity as product_quantity,

                shirtcolors.id as color_id,
                shirtcolors.name as color_name,
                shirtcolors.color as color_code

                FROM `products_categories`

                    JOIN products ON product_id = products.id

                    JOIN categories ON category_id = categories.id

                    JOIN products_shirtcolors ON products_shirtcolors.product_id = products.id
                    JOIN shirtcolors ON products_shirtcolors.shirtcolor_id = shirtcolors.id

                    WHERE categories.name = '{$name}'

                ");
        return view('user.products.index', compact('data', 'name'));
    // return view('errors.404');


    }
    /**
     * Display the specified resource.
     *
     * @param  \App\Models\product  $product
     * @return \Illuminate\Http\Response
     */

}

        // $ShirtColors = DB::select("SELECT * FROM `shirtcolors`");

        // $ProductShirtColor = [];
        // foreach($data as $datas){
        //     $ProductShirtColors = DB::select("SELECT * FROM `products_shirtcolors` where {$datas->product_id} = product_id");
        //     $ProductShirtColor[] = $ProductShirtColors;
        // }

        // dd($ShirtColors, $ProductShirtColor, $data, $ProductShirtColors);
        // $data = Product::where('category_idCategory', $category->id)->get();
