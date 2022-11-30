<?php

namespace App\Http\Controllers;

use App\Models\product;
use App\Models\category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class ProductController extends Controller
{

        /**
     * Display the specified resource.
     *
     * @param  \App\Models\product  $product
     * @return \Illuminate\Http\Response
     */
    public function byCategory($name)
    {
        //
        $category = Category::select('id')->where('name', $name)->firstOrFail();
        // $category = Category::select('id')->where('name', $name)->first();
        $data = Product::select('products.*')
        ->join('products_categories', 'products.id', '=', 'products_categories.product_id')
        ->where('products_categories.category_id', $category->id)
        ->get();

     //     select a.name,a.price,a.description from  products a
     //    inner join products_categories b on a.id = b.product_id where  b.category_id=5;

        return view ('user.products.index', compact('data', 'name'));

    }



}
