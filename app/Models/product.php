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

    protected $table = 'products'; /* usa la tabla products*/

    public function JoinCategories()
    {
        return $this->belongsToMany(category::class, 'products_categories', 'product_id', 'category_id')->as('prodcategories');
    }

    public function joinShirtColors()
    {
        return $this->belongsToMany(shirtcolors::class, 'products_shirtcolors','product_id', 'shirtcolor_id')->as('prodcolor');
    }

}

// DB::table('products_shirtcolors')
