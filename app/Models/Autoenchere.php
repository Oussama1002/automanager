<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Autoenchere extends Model
{
    use HasFactory;
    protected $fillable = [
        'annonce_id',
        'client_id',
        'proposition',
    ];
    public function annonce()
{
    return $this->belongsTo(Annonces::class);
}

public function client()
{
    return $this->belongsTo(Client::class, 'client_id');
}

}
