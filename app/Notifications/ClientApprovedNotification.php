<?php
namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;

class ClientApprovedNotification extends Notification
{
    use Queueable;

    public function via($notifiable)
    {
        return ['mail'];
    }

    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('Votre compte a été approuvé')
            ->greeting('Bonjour ' . $notifiable->name . ',')
            ->line('Nous avons le plaisir de vous informer que votre compte a été approuvé avec succès.')
            ->line('Vous pouvez maintenant accéder à toutes les fonctionnalités de notre plateforme.')
            ->action('Se connecter', url('/login'))
            ->line('Merci pour votre confiance.');
    }
}
