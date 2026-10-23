<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class NewClientRegistered extends Notification
{
    use Queueable;

    protected $client;

    public function __construct($client)
    {
        $this->client = $client;
    }

    public function via($notifiable)
    {
        return ['mail', 'database'];
    }

    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('Nouveau client en attente de validation')
            ->line('Un nouveau client vient de s’inscrire :')
            ->line('Nom: ' . $this->client->name)
            ->line('Email: ' . $this->client->email)
            ->action('Voir le profil', url('/admin/clients/' . $this->client->id));
    }

    public function toArray(object $notifiable): array
    {
        return [
            'message' => 'Nouveau client: ' . $this->client->name,
            'url' => url('/admin/clients/' . $this->client->id),
        ];
    }
}
