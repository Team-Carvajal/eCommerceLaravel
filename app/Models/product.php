<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\category;
use App\Models\shirtcolors;
use Illuminate\Support\Facades\DB;


class Product extends Model
{
    use HasFactory;

    public function categories (){
        return $this->belongsToMany(Category::class, "products_categories", "product_id", "category_id");
    }

    public function colors (){
        return $this->belongsToMany(Shirtcolor::class, "products_shirtcolors", "product_id", "shirtcolor_id")
        ->as("product_color")
            ->withPivot("image");
    }
}
