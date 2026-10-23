<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Discussion extends Model
{
    protected $fillable = [
        'annonce_id',
        'client_id',
        'status',
        'last_message_at',
    ];

    protected $casts = [
        'client_id'       => 'integer',
        'annonce_id'      => 'integer',
        'last_message_at' => 'datetime',
    ];

    public function annonce()
    {
        return $this->belongsTo(Annonces::class, 'annonce_id');
    }

    public function client()
    {
        return $this->belongsTo(Client::class, 'client_id');
    }

    /**
     * Phones are stored in different formats (0637996134, +212637996134,
     * 06 37 99 61 34…): compare on the last 9 digits.
     */
    public static function phoneKey(?string $phone): ?string
    {
        $digits = preg_replace('/\D/', '', (string) $phone);
        return strlen($digits) >= 9 ? substr($digits, -9) : null;
    }

    /**
     * The client who published the annonce (annonces are linked to clients by phone),
     * when this discussion is theirs to answer. Null for NADO's own annonces
     * (certifié, created by the admin), which the admin answers.
     */
    public function sellerClient(): ?Client
    {
        $annonce = $this->annonce;
        if (!$annonce || (int) $annonce->certifie === 1) {
            return null;
        }

        $key = self::phoneKey($annonce->phone);
        if (!$key) {
            return null;
        }

        return Client::whereRaw(self::PHONE_SQL . ' LIKE ?', ['%' . $key])->get()
            ->first(fn ($c) => self::phoneKey($c->phone) === $key);
    }

    /** SQL expression: `phone` without spaces, dashes, dots and + */
    public const PHONE_SQL = "REPLACE(REPLACE(REPLACE(REPLACE(phone, ' ', ''), '-', ''), '.', ''), '+', '')";

    /** True when the seller (not NADO) answers this discussion. */
    public function isSellerManaged(): bool
    {
        return $this->sellerClient() !== null;
    }

    public function messages()
    {
        return $this->hasMany(DiscussionMessage::class)->orderBy('created_at', 'asc');
    }

    public function lastMessage()
    {
        return $this->hasOne(DiscussionMessage::class)->latestOfMany();
    }

    public function unreadByAdmin()
    {
        return $this->hasMany(DiscussionMessage::class)
            ->where('sender_type', 'client')
            ->whereNull('read_at');
    }

    public function unreadByClient()
    {
        return $this->hasMany(DiscussionMessage::class)
            ->where('sender_type', 'admin')
            ->whereNull('read_at');
    }
}
