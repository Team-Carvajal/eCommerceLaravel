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
        $productbanner = category::all();
        $product = product::all();
        // $joincolor = DB::table('products_shirtcolors')->select('*')->inRandomOrder()->get();
        // $joincolorimage = DB::select('select * from products_shirtcolors order by rand()');
        $joincolor = DB::select('select distinct product_id from products_shirtcolors');
        $joincolorimage = DB::select('select * from products_shirtcolors');
        return view('user.products.index', compact('product', 'joincolor', 'joincolorimage', 'productbanner'));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\product  $product
     * @return \Illuminate\Http\Response
     */
    public function show($categoryname, $shirttype,  $product)
    {
        $category = Category::select('*')->where('name', $categoryname)->first();
        $categoryproduct = DB::select('select * from products_categories where category_id = ' . $category->id);
        $producto = str_replace('-' , ' ', (strtolower($product)));
        $producto = ("'" .$producto . "'" );
        $products = DB::select('select * from products where name = '. $producto); /* */
        $products = current(array_filter($products));
        $productcolor = DB::select('select * from products_shirtcolors where product_id = ' . $products->id); /* */
        $productsize = DB::select('select * from products_shirtsizes where product_id =' . $products->id); /* */
        $color = DB::select('select * from shirtcolors'); /* */
        $size = DB::select('select * from shirtsizes'); /* */
        // dd($products, $categoryproduct, $color, $size, $productsize, $productcolor);
        return view('user.products.detail', compact('product', 'products' , 'shirttype', 'color', 'size', 'productsize', 'productcolor', 'categoryname', 'category'));

    }

}
