<?php


namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Article extends Model
{
    protected $fillable = [
        'title',
        'slug',
        'image',
        'excerpt',
        'content',
        'is_premium',
        'is_active',
        'meta_title',
        'meta_description',
    ];

    protected $casts = [
        'is_premium' => 'boolean',
        'is_active'  => 'boolean',
    ];

    // Auto-generate slug
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($article) {
            if (empty($article->slug)) {
                $article->slug = Str::slug($article->title);
            }
        });
    }
}
