<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Color extends Model
{
    use SoftDeletes; // if your migration has softDeletes()

    protected $table = 'colors'; // optional if Laravel default
    protected $fillable = ['name'];
}
