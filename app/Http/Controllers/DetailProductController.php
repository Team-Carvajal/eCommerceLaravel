<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\product;
use App\Models\category;
use Illuminate\Support\Facades\DB;

class DetailProductController extends Controller
{

    public function show($categoryname, $product)
    {


    $category = Category::select('*')->where('name', $categoryname)->first();
    $categoryproduct = DB::select('select * from products_categories where category_id = ' . $category->id);

    $producto = str_replace('-' , ' ', (strtolower($product)));
    $producto = ("'" .$producto . "'" );

    $products = DB::select('select * from products where name = '. $producto); /* */
    $products = current(array_filter($products));

    $productcolor = DB::select('select * from products_shirtcolors where product_id = ' . $products->id); /* */
    $color = DB::select('select * from shirtcolors'); /* */

    $productsize = DB::select('select * from products_shirtsizes where product_id =' . $products->id); /* */
    $size = DB::select('select * from shirtsizes'); /* */

    $shirttypes = DB::select('select * from products_shirttypes where product_id =' . $products->id);

    // dd($products, $categoryproduct, $color, $size, $productsize, $productcolor);

    return view('user.products.detail', compact('product', 'products', 'color', 'size', 'productsize', 'productcolor', 'categoryname', 'category'));


    }

}

