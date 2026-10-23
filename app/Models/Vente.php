<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Vente extends Model
{
    use HasFactory, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['phone', 'name', 'city', 'mark', 'modele', 'year', 'km', 'carburant', 'box', 'etat', 'origine', 'type', 'img_avant', 'img_derriere', 'img_cartegrise', 'jeveux', 'mode', 'rendezvous'];
}
