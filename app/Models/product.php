<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\category;
use App\Models\shirtcolors;
use Illuminate\Support\Facades\DB;


class product extends Model
{
    use HasFactory;

    public function categories(){
        return $this->belongsToMany(category::class, 'products_categories', 'product_id', 'category_id');
    }

}

// DB::table('products_shirtcolors')
