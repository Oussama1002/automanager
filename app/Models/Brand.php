<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;
use Spatie\Permission\Traits\HasRoles;

class Brand extends Model
{
    use HasFactory, HasRoles, SoftDeletes;

    protected $fillable = [
        'name',
        'logo',
        'ip',
        'user_agent',
        'user_id',
    ];

    // Relation vers les modèles (si ton modèle s'appelle Modele et la table modeles)
    public function modeles()
    {
        return $this->hasMany(Modele::class, 'brand_id');
    }

    // Si tu veux un slug basé sur le nom (pas title)
    public function getSlug(): string
    {
        return Str::slug($this->name);
    }
}
