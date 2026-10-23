{{-- AUTOMANAGER-DEMANDE-INDEX-V2 - 2026-10-17 --}}
@extends('layouts.app')

@section('title', 'Forum des demandes — AUTOMANAGER')

@section('content')
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<style>
    .dmd-wrap { max-width:1180px; margin:40px auto 60px; padding:0 20px; font-family:'Inter',sans-serif; color:#0f172a; }
    .dmd-hero { display:flex; justify-content:space-between; align-items:center; gap:20px; flex-wrap:wrap; margin-bottom:28px; }
    .dmd-hero h1 { font-size:30px; font-weight:800; margin:0; letter-spacing:-0.02em; }
    .dmd-hero p  { margin:6px 0 0; color:#64748b; font-size:15px; }
    .dmd-cta { display:inline-flex; align-items:center; gap:8px; padding:12px 20px; background:#0E0F12; color:#fff; border-radius:12px; text-decoration:none; font-weight:700; font-size:14px; box-shadow:0 6px 18px rgba(20,89,221,.25); transition:transform .15s, box-shadow .15s; }
    .dmd-cta:hover { transform:translateY(-1px); box-shadow:0 10px 24px rgba(20,89,221,.35); color:#fff; text-decoration:none; }

    .dmd-filters { display:grid; grid-template-columns:repeat(auto-fit,minmax(170px,1fr)); gap:10px; background:#f8fafc; border:1px solid #e2e8f0; padding:14px; border-radius:14px; margin-bottom:24px; }
    .dmd-filters select, .dmd-filters input {
        padding:10px 12px; border:1px solid #e2e8f0; border-radius:10px; font-size:14px; background:#fff; outline:none; font-family:inherit;
    }
    .dmd-filters select:focus, .dmd-filters input:focus { border-color:#0E0F12; box-shadow:0 0 0 3px rgba(20,89,221,.1); }
    .dmd-filters button { padding:10px 18px; background:#0f172a; color:#fff; border:0; border-radius:10px; font-weight:700; cursor:pointer; font-family:inherit; }
    .dmd-filters button:hover { background:#0E0F12; }

    .dmd-grid { display:grid; grid-template-columns:repeat(auto-fill,minmax(320px,1fr)); gap:16px; }
    .dmd-card {
        background:#fff; border:1px solid #e2e8f0; border-radius:16px; padding:20px;
        display:flex; flex-direction:column; gap:12px; transition:transform .15s, box-shadow .15s, border-color .15s;
    }
    .dmd-card:hover { transform:translateY(-2px); box-shadow:0 12px 30px -8px rgba(15,23,42,.12); border-color:#cbd5e1; }

    .dmd-card-head { display:flex; justify-content:space-between; align-items:flex-start; gap:10px; }
    .dmd-badge { display:inline-flex; align-items:center; gap:4px; font-size:11px; font-weight:700; padding:4px 10px; border-radius:999px; background:#F2E9D2; color:#0E0F12; text-transform:uppercase; letter-spacing:.03em; }
    .dmd-date { font-size:12px; color:#94a3b8; }

    .dmd-title { font-size:17px; font-weight:700; color:#0f172a; margin:0; line-height:1.3; text-decoration:none; }
    .dmd-title:hover { color:#0E0F12; }
    .dmd-by { font-size:12px; color:#64748b; display:inline-flex; align-items:center; gap:5px; margin-top:2px; }
    .dmd-by strong { color:#0f172a; font-weight:700; }

    .dmd-meta { display:flex; flex-wrap:wrap; gap:8px; margin-top:4px; }
    .dmd-meta span {
        font-size:12px; color:#475569; background:#f1f5f9; padding:4px 10px; border-radius:8px; font-weight:500;
    }

    .dmd-comment { font-size:13px; color:#475569; margin:0; line-height:1.5; }

    .dmd-contact { margin-top:auto; padding-top:12px; border-top:1px dashed #e2e8f0; display:flex; justify-content:space-between; align-items:center; gap:10px; flex-wrap:wrap; }
    .dmd-user { display:flex; align-items:center; gap:10px; min-width:0; }
    .dmd-avatar { width:36px; height:36px; border-radius:50%; background:linear-gradient(135deg,#0E0F12,#C8A24B); color:#fff; display:flex; align-items:center; justify-content:center; font-weight:700; font-size:14px; flex-shrink:0; }
    .dmd-name { font-size:13px; font-weight:600; color:#0f172a; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; }
    .dmd-phone { font-size:12px; color:#64748b; font-variant-numeric:tabular-nums; letter-spacing:.03em; }

    .dmd-stats { display:flex; gap:12px; font-size:12px; color:#64748b; }
    .dmd-stats span { display:inline-flex; align-items:center; gap:4px; }

    .dmd-empty { text-align:center; padding:60px 20px; color:#64748b; background:#f8fafc; border:1px dashed #cbd5e1; border-radius:16px; }
    .dmd-empty h3 { margin:0 0 6px; color:#0f172a; font-weight:700; }

    .dmd-pagination { margin-top:24px; display:flex; justify-content:center; }

    @media (max-width:640px) {
        .dmd-hero h1 { font-size:24px; }
        .dmd-grid { grid-template-columns:1fr; }
    }
</style>

<div class="dmd-wrap">
    <div class="dmd-hero">
        <div>
            <h1>Forum des demandes</h1>
            <p>Des acheteurs recherchent une voiture. Si vous l’avez, répondez-leur.</p>
        </div>
        <a href="{{ route('demandes.create') }}" class="dmd-cta">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M12 5v14M5 12h14"/></svg>
            Publier ma demande
        </a>
    </div>

    <form method="GET" class="dmd-filters">
        <select name="brand_id">
            <option value="">Marque</option>
            @foreach($brands as $b)
                <option value="{{ $b->id }}" @selected(($filters['brand_id'] ?? null) == $b->id)>{{ $b->name }}</option>
            @endforeach
        </select>
        <select name="ville_id">
            <option value="">Ville</option>
            @foreach($villes as $v)
                <option value="{{ $v->id }}" @selected(($filters['ville_id'] ?? null) == $v->id)>{{ $v->name }}</option>
            @endforeach
        </select>
        <input type="number" name="price_min" placeholder="Prix min (DH)" value="{{ $filters['price_min'] ?? '' }}">
        <input type="number" name="price_max" placeholder="Prix max (DH)" value="{{ $filters['price_max'] ?? '' }}">
        <button type="submit">Filtrer</button>
    </form>

    @if($demandes->count())
        <div class="dmd-grid">
            @foreach($demandes as $d)
                @php
                    $initials = mb_strtoupper(mb_substr(trim($d->nom), 0, 1));
                    $digits = preg_replace('/\D+/', '', (string) $d->telephone);
                    $maskedPhone = strlen($digits) >= 6
                        ? substr($digits, 0, 2) . ' •• •• ' . substr($digits, -2)
                        : '•• •• •• ••';
                @endphp
                <div class="dmd-card">
                    <div class="dmd-card-head">
                        <span class="dmd-badge">
                            <svg width="10" height="10" viewBox="0 0 24 24" fill="currentColor"><circle cx="12" cy="12" r="4"/></svg>
                            Recherche
                        </span>
                        <span class="dmd-date">{{ $d->created_at->locale('fr')->diffForHumans() }}</span>
                    </div>

                    <a href="{{ route('demandes.show', $d->id) }}" class="dmd-title">
                        {{ $d->brand?->name ?? 'Toute marque' }} {{ $d->modele?->name }}
                        @if($d->ville) · {{ $d->ville->name }} @endif
                    </a>
                    <div class="dmd-by">
                        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" style="vertical-align:-2px;">
                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/>
                        </svg>
                        Par <strong>{{ $d->nom }}</strong>
                    </div>

                    @php
                        if ($d->price_min && $d->price_max) {
                            $priceLabel = number_format($d->price_min, 0, ',', ' ') . ' – ' . number_format($d->price_max, 0, ',', ' ') . ' DH';
                        } elseif ($d->price_max) {
                            $priceLabel = 'Jusqu’à ' . number_format($d->price_max, 0, ',', ' ') . ' DH';
                        } elseif ($d->price_min) {
                            $priceLabel = 'À partir de ' . number_format($d->price_min, 0, ',', ' ') . ' DH';
                        } else {
                            $priceLabel = 'Non précisé';
                        }

                        if ($d->year_min && $d->year_max) {
                            $yearLabel = $d->year_min . ' – ' . $d->year_max;
                        } elseif ($d->year_max) {
                            $yearLabel = 'Jusqu’à ' . $d->year_max;
                        } elseif ($d->year_min) {
                            $yearLabel = 'À partir de ' . $d->year_min;
                        } else {
                            $yearLabel = 'Toutes années';
                        }

                        $kmLabel = $d->km_max
                            ? '≤ ' . number_format($d->km_max, 0, ',', ' ') . ' km'
                            : 'Non précisé';

                        $boiteMap = ['auto' => 'Automatique', 'manuelle' => 'Manuelle'];
                        $boiteKey = strtolower(trim((string) $d->boite));
                        if ($boiteKey === '' || $boiteKey === 'any' || $boiteKey === 'toutes') {
                            $boiteLabel = 'Toutes';
                        } else {
                            $boiteLabel = $boiteMap[$boiteKey] ?? ucfirst($boiteKey);
                        }

                        $carburantLabel = $d->carburant ?: 'Non précisé';
                    @endphp

                    <div class="dmd-meta">
                        <span>💰 {{ $priceLabel }}</span>
                        <span>📅 {{ $yearLabel }}</span>
                        <span>🛣 {{ $kmLabel }}</span>
                        <span>⚙ {{ $boiteLabel }}</span>
                        <span>⛽ {{ $carburantLabel }}</span>
                    </div>

                    @if($d->comment)
                        <p class="dmd-comment">{{ \Illuminate\Support\Str::limit($d->comment, 120) }}</p>
                    @endif

                    <div class="dmd-contact">
                        <div class="dmd-user">
                            <div class="dmd-avatar">{{ $initials ?: '?' }}</div>
                            <div style="min-width:0;">
                                <div class="dmd-name">{{ $d->nom }}</div>
                                <div class="dmd-phone">📞 {{ $maskedPhone }}</div>
                            </div>
                        </div>
                        <div class="dmd-stats">
                            <span>👁 {{ $d->views_count }}</span>
                            <span>💬 {{ $d->replies_count }}</span>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>

        <div class="dmd-pagination">{{ $demandes->links() }}</div>
    @else
        <div class="dmd-empty">
            <h3>Aucune demande publiée pour le moment.</h3>
            <p>Soyez le premier à publier votre recherche.</p>
            <a href="{{ route('demandes.create') }}" class="dmd-cta" style="margin-top:14px;">Publier ma demande</a>
        </div>
    @endif
</div>
@endsection
