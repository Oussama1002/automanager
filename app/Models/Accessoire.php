<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Accessoire extends Model
{
    use HasFactory;
    protected $fillable = ['titre', 'prix', 'description', 'status', 'images'];

    // If images are stored as JSON array, cast it:
    protected $casts = [
        'images' => 'array',
    ];
}
