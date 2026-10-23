<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class AdminProposerPrixMail extends Mailable
{
    use Queueable, SerializesModels;

    public $client;
    public $enchere;
    public $montant;

    public function __construct($client, $enchere, $montant)
    {
        $this->client = $client;
        $this->enchere = $enchere;
        $this->montant = $montant;
    }

    public function build()
    {
        return $this->subject('Nouvelle offre sur AUTO ENCHERE')
                    ->view('mail.admin_proposer_prix');
    }
}
