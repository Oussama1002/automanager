<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class favoris extends Model
{
    protected $table = 'favoris';
    public $timestamps = false; // facultatif, à garder si ta table n'a pas created_at / updated_at

    protected $fillable = [
        'phone',
        'annonce_id',
    ];

    public function annonce()
    {
        return $this->belongsTo(Annonces::class, 'annonce_id');
    }
}
