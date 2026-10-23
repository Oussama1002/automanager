<?php



// app/Models/CarTarifier.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CarTarifier extends Model
{
    protected $fillable = [
        'brand',
        'model',
        'year',
        'fuel',
        'engine',
        'base_price',
    ];
}

