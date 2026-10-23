<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Financement extends Model
{
    use HasFactory, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['phone', 'name', 'city', 'mark', 'modele', 'year', 'situationprof', 'creditsencours', 'duree', 'prixcar', 'montant', 'creditsdh', 'email', 'rendezvous', 'cin'];
}
