<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class ClientVerifyEmail extends Notification
{
    use Queueable;

    public string $verifyUrl;

    public function __construct(string $verifyUrl)
    {
        $this->verifyUrl = $verifyUrl;
    }

    public function via($notifiable): array
    {
        return ['mail'];
    }

    public function toMail($notifiable): MailMessage
    {
        return (new MailMessage)
            ->subject('Confirmez votre adresse e-mail - Nado Auto')
            ->greeting('Bonjour ' . ($notifiable->name ?? '') . ',')
            ->line('Merci pour votre inscription sur Nado Auto.')
            ->line('Pour activer votre compte, veuillez confirmer votre adresse e-mail en cliquant sur le bouton ci-dessous.')
            ->action('Confirmer mon adresse e-mail', $this->verifyUrl)
            ->line('Ce lien est valable 60 minutes. Si vous n\'avez pas créé de compte, ignorez simplement cet e-mail.')
            ->salutation('L\'équipe Nado Auto');
    }
}
