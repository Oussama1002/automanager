<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pack extends Model
{
    protected $fillable = ['name', 'description', 'price', 'duration_days'];

    public function annonces()
    {
        return $this->hasMany(Annonces::class);
    }
}

