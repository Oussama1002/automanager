<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DiscussionMessage extends Model
{
    protected $fillable = [
        'discussion_id',
        'sender_type',
        'sender_id',
        'message',
        'type',
        'attachment',
        'duration',
        'read_at',
    ];

    protected $casts = [
        'read_at' => 'datetime',
        'duration' => 'integer',
    ];

    public function discussion()
    {
        return $this->belongsTo(Discussion::class);
    }

    public function isFromClient(): bool
    {
        return $this->sender_type === 'client';
    }

    public function isFromAdmin(): bool
    {
        return $this->sender_type === 'admin';
    }
}
