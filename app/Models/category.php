<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\home;

class category extends Model
{
    use HasFactory;
    // protected $table = "categories"; /* usa la tabla categories*/

    // public function products()
    // {
    //     return $this->belongsToMany(home::class, 'products_categories', 'products_id', 'categories_id')->as('prodcategories');
    // }
}
