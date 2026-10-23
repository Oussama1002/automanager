<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Modele extends Model
{
    use HasFactory, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $table = 'models'; // <== CECI EST TRÈS IMPORTANT

    protected $fillable = ['name', 'brand_id', 'ip', 'user_agent', 'user_id'];

    public function brand()
    {
        return $this->belongsTo('App\Models\Brand');
    }
}
