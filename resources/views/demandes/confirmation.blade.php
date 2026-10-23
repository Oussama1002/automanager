@extends('layouts.app')

@section('title', 'Demande envoyée')

@section('content')
<div class="container" style="max-width:560px;margin:60px auto;padding:0 16px;text-align:center;">
    <svg width="64" height="64" viewBox="0 0 24 24" fill="none" stroke="#16a34a" stroke-width="2"
         style="margin:0 auto 12px;display:block;">
        <circle cx="12" cy="12" r="10"/><path d="M8 12l3 3 5-6"/>
    </svg>

    <h1 style="font-size:22px;margin:0 0 8px;">Merci {{ $demande->nom }} !</h1>
    <p style="color:#475569;">
        Votre demande a bien été enregistrée. Un administrateur va la vérifier et vous
        contactera au <strong>{{ $demande->telephone }}</strong>.<br>
        Elle sera ensuite publiée sur le forum public des demandes.
    </p>

    <div style="margin-top:20px;display:flex;gap:10px;justify-content:center;flex-wrap:wrap;">
        <a href="{{ route('demandes.index') }}"
           style="padding:10px 18px;background:#0d6efd;color:#fff;border-radius:8px;text-decoration:none;font-weight:600;">
            Voir le forum des demandes
        </a>
        <a href="{{ url('/achat') }}"
           style="padding:10px 18px;border:1px solid #cbd5e1;color:#0f172a;border-radius:8px;text-decoration:none;">
            Continuer la recherche
        </a>
    </div>
</div>
@endsection
