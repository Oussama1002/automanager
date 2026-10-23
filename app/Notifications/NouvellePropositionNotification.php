<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class NouvellePropositionNotification extends Notification
{
    use Queueable;

    /**
     * @param array $data Plain scalars only - this notification is dispatched from an
     *                    afterResponse() closure, so we avoid carrying Eloquent models.
     */
    public function __construct(public array $data)
    {
    }

    public function via($notifiable): array
    {
        return ['mail'];
    }

    public function toMail($notifiable): MailMessage
    {
        $d = $this->data;

        $fmt = fn ($n) => number_format((float) $n, 0, ',', ' ') . ' MAD';

        // Libellés par défaut (flux annonce). Chaque flux peut passer les siens
        // via la payload : le flux enchère utilise "enchère" partout.
        $title  = $d['title']  ?? 'Nouvelle proposition de prix';
        $intro  = $d['intro']  ?? 'Un client vient de proposer un prix pour une annonce.';
        $action = $d['action_text'] ?? 'Voir l\'annonce';

        $mail = (new MailMessage)
            ->subject($title . ' - ' . $d['vehicule'] . ' (Ref: ' . $d['reference'] . ')')
            ->greeting($title)
            ->line($intro);

        // --- Vehicle ---
        $mail->line('**VEHICULE**')
            ->line('Vehicule : ' . $d['vehicule'])
            ->line('Reference : ' . $d['reference']);

        if (!empty($d['annee'])) {
            $mail->line('Annee : ' . $d['annee']);
        }
        if (isset($d['km']) && $d['km'] !== null) {
            $mail->line('Kilometrage : ' . number_format((float) $d['km'], 0, ',', ' ') . ' km');
        }
        if (!empty($d['carburant'])) {
            $mail->line('Carburant : ' . $d['carburant']);
        }
        if (!empty($d['boite'])) {
            $mail->line('Boite : ' . $d['boite']);
        }
        if (!empty($d['ville'])) {
            $mail->line('Ville : ' . $d['ville']);
        }

        // --- Offer ---
        $mail->line('**PROPOSITION**')
            ->line('Prix affiche : ' . $fmt($d['prix_affiche']))
            ->line('Prix propose : ' . $fmt($d['proposition']));

        $ecart = (float) $d['prix_affiche'] - (float) $d['proposition'];
        if ($ecart > 0) {
            $pct = (float) $d['prix_affiche'] > 0
                ? round($ecart / (float) $d['prix_affiche'] * 100, 1)
                : 0;
            $mail->line('Ecart : -' . $fmt($ecart) . ' (-' . $pct . '%)');
        } elseif ($ecart < 0) {
            $mail->line('Ecart : +' . $fmt(abs($ecart)) . ' (au-dessus du prix affiche)');
        } else {
            $mail->line('Ecart : aucun (prix affiche)');
        }

        // --- Client ---
        $mail->line('**CLIENT**')
            ->line('Nom : ' . ($d['client_nom'] ?: 'Non renseigne'))
            ->line('Email : ' . ($d['client_email'] ?: 'Non renseigne'))
            ->line('Telephone : ' . ($d['client_tel'] ?: 'Non renseigne'))
            ->line('Date : ' . $d['date']);

        if (!empty($d['url'])) {
            $mail->action($action, $d['url']);
        }

        return $mail
            ->line('Merci de recontacter le client rapidement.')
            ->salutation('L\'equipe NADO');
    }

    public function toArray($notifiable): array
    {
        return $this->data;
    }
}
