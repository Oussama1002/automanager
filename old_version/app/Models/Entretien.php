<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Entretien extends Model
{
    use HasFactory;

    protected $fillable = [
        'annonce_id',
        'date',
        'revision',
        'entretien',
        'reparation',
        'carrosserie',
        'professionnels'
    ];

    public function annonce()
    {
        return $this->belongsTo(Annonces::class);
    }
}
