<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SocialPost extends Model
{
    use HasFactory;

    protected $fillable = [
        'platform',
        'url',
        'title',
        'handle',
        'thumbnail',
        'is_active',
        'position',
    ];

    protected $casts = [
        'is_active' => 'boolean',
        'position'  => 'integer',
    ];

    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    public function getPlatformLabelAttribute(): string
    {
        return $this->platform === 'tiktok' ? 'TikTok' : 'Instagram';
    }

    public function getPlatformKeyAttribute(): string
    {
        return $this->platform === 'tiktok' ? 'tiktok' : 'insta';
    }

    public function getThumbnailUrlAttribute(): ?string
    {
        if (!$this->thumbnail) {
            return null;
        }
        if (str_starts_with($this->thumbnail, 'http')) {
            return $this->thumbnail;
        }
        return asset('storage/' . $this->thumbnail);
    }
}
