<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\product;
use App\Models\category;
use Illuminate\Support\Facades\DB;

class DetailProductController extends Controller
{
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
    public function show($categoryname, $product)
    {

    product::where('name', str_replace('-' , ' ', (strtolower($product))))->firstOrFail();
    category::where('name', $categoryname)->firstOrFail();

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
    // dd($size, $productsize);

    $shirttypes = DB::select('select * from products_shirttypes where product_id =' . $products->id);

    // dd($shirttypes);
    // dd($products, $categoryproduct, $color, $size, $productsize, $productcolor);

    return view('user.products.detail', compact('product', 'products', 'color', 'size', 'productsize', 'productcolor', 'categoryname', 'category'));


    }

}

