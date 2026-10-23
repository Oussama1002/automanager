@extends('layouts.client')


@section('title', 'Mes Annonces')

@section('client_title', '')
@section('client_subtitle', '')
@section('client_actions')
    <a class="btn-new" href="{{ route('vente.form', ['open_modal' => 1]) }}">
        <i class="fa fa-plus"></i> Déposer
    </a>
@endsection
@section('client_content')
<style>
    :root {
        --blue:#0E0F12;
        --slate-50:#f8fafc; --slate-100:#f1f5f9; --slate-200:#e2e8f0;
        --slate-400:#94a3b8; --slate-500:#64748b; --slate-700:#334155; --slate-900:#0f172a;
        --radius:16px;
        --shadow: 0 1px 3px rgba(0,0,0,.06), 0 10px 30px rgba(0,0,0,.08);
    }
    body { background: var(--slate-50); }
    .page-wrap { padding: 0 0 10px; }
    .page-head { display:flex; align-items:flex-end; justify-content:space-between; gap:16px; margin-bottom: 22px; }
    .page-title { font-size: 28px; font-weight: 900; color: var(--slate-900); letter-spacing: -.02em; margin:0; }
    .page-sub { margin: 6px 0 0; color: var(--slate-500); font-size: 15px; font-weight: 600; }
    .btn-new {
        display:inline-flex; align-items:center; gap:10px;
        padding: 12px 18px; border-radius: 14px;
        background: var(--blue); color:#fff; text-decoration:none;
        font-weight: 800; font-size: 13px; letter-spacing: .08em; text-transform: uppercase;
        box-shadow: 0 10px 24px rgba(20,89,221,.22);
    }
    .grid { display:grid; grid-template-columns: repeat(auto-fill, minmax(280px,1fr)); gap: 16px; }
    .cardx {
        background:#fff; border:1px solid var(--slate-200); border-radius: var(--radius);
        overflow:hidden; box-shadow: var(--shadow);
        transition: transform .15s ease, box-shadow .2s ease, border-color .2s ease;
    }
    .cardx:hover { transform: translateY(-2px); border-color: rgba(20,89,221,.35); box-shadow: 0 16px 45px rgba(0,0,0,.12); }
    .cardx-img { width:100%; height: 190px; object-fit: cover; background: var(--slate-100); display:block; }
    .cardx-body { padding: 14px 14px 16px; }
    .cardx-title { font-size: 16px; font-weight: 900; color: var(--slate-900); margin: 0 0 6px; }
    .cardx-meta { font-size: 14px; color: var(--slate-500); font-weight: 650; margin: 0 0 10px; }
    .badge {
        display:inline-flex; align-items:center; gap:6px;
        padding: 6px 10px; border-radius: 99px;
        font-size: 12px; font-weight: 800;
        border: 1px solid var(--slate-200);
        background: var(--slate-50);
        color: var(--slate-700);
    }
    .badge.ok { background:#f0fdf4; border-color:#bbf7d0; color:#15803d; }
    .badge.wait { background:#fefce8; border-color:#fde68a; color:#a16207; }
    .badge.no { background:#fef2f2; border-color:#fecaca; color:#b91c1c; }
    .row2 { display:flex; align-items:center; justify-content:space-between; gap:12px; margin-top: 12px; }
    .price { font-size: 18px; font-weight: 900; color: var(--slate-900); }
    .btns { display:flex; gap:8px; }
    .btnx {
        display:inline-flex; align-items:center; justify-content:center;
        padding: 10px 12px; border-radius: 12px;
        background: var(--slate-100); border:1px solid var(--slate-200);
        color: var(--slate-900); text-decoration:none;
        font-weight: 800; font-size: 13px;
    }
    .btnx:hover { background:#F2E9D2; border-color:#E8D7A9; color: var(--blue); }
    .btnx.danger { background:#fef2f2; border-color:#fecaca; color:#b91c1c; }
    .btnx.danger:hover { background:#fee2e2; border-color:#fecaca; color:#991b1b; }
    .empty {
        background:#fff; border:1px dashed var(--slate-200); border-radius: var(--radius);
        padding: 50px 16px; text-align:center; color: var(--slate-500);
        font-size: 16px; font-weight: 700;
    }
</style>

<div class="page-wrap">
    <div class="container">
        <div class="page-head">
            <div>
                <h2 class="page-title">Mes annonces</h2>
                <p class="page-sub">Gérez vos annonces et modifiez-les rapidement.</p>
            </div>
            {{-- action moved to topbar --}}
        </div>

        @if($annonces->isEmpty())
            <div class="empty">Aucune annonce pour le moment.</div>
        @else
            <div class="grid">
                @foreach($annonces as $annonce)
                    @php
                        // photo_urls / brand_name / modele_name come from ClientAnnonceController::index():
                        // photos live in the images column (+ media rows), and mark / modele hold ids.
                        $img = ($annonce->photo_urls[0] ?? null)
                            ?: ($annonce->image ? asset('storage/ads/' . $annonce->image) : null);
                        $name = trim(($annonce->brand_name ?? '') . ' ' . ($annonce->modele_name ?? '')) ?: ($annonce->titre ?? 'Annonce');

                        // status is always "disponible" — approval is the active flag
                        $isActive = (int) $annonce->active === 1;
                        $badgeClass = $isActive ? 'ok' : 'wait';
                        $badgeText  = $isActive ? 'Publiée' : 'En attente de validation';
                    @endphp
                    <div class="cardx">
                        @if($img)
                            <img class="cardx-img" src="{{ $img }}" alt="{{ $name }}" loading="lazy">
                        @else
                            <div class="cardx-img" style="display:flex;align-items:center;justify-content:center;color:var(--slate-400);font-size:32px;">🚗</div>
                        @endif
                        <div class="cardx-body">
                            <div class="badge {{ $badgeClass }}">● {{ $badgeText }}</div>
                            <h3 class="cardx-title" style="margin-top:10px;">{{ $name }}</h3>
                            <p class="cardx-meta">{{ $annonce->year ?? '—' }} · {{ number_format($annonce->km ?? 0, 0, ',', ' ') }} km · {{ $annonce->city ?? '—' }}</p>
                            <div class="row2">
                                <div class="price">{{ number_format($annonce->prix ?? 0, 0, ',', ' ') }} MAD</div>
                                <div class="btns">
                                    <a class="btnx" href="{{ route('vente.form', ['open_modal' => 1, 'annonce_id' => $annonce->id]) }}">
                                        <i class="fa fa-pencil"></i>
                                    </a>
                                    {{-- The public page only exists once the annonce is approved --}}
                                    @if($isActive)
                                        <a class="btnx" target="_blank" rel="noopener" href="{{ route('achat.detail', [
                                            'marque' => str_replace(' ', '', $annonce->brand_name ?: 'auto'),
                                            'modele' => str_replace(' ', '', $annonce->modele_name ?: 'modele'),
                                            'id'     => $annonce->id,
                                        ]) }}">
                                            <i class="fa fa-eye"></i>
                                        </a>
                                    @endif
                                    <form action="{{ route('client.annonces.destroy', $annonce->id) }}" method="POST" style="display:inline;">
                                        @csrf @method('DELETE')
                                        <button type="submit" class="btnx danger" onclick="return confirm('Supprimer cette annonce ?');">
                                            <i class="fa fa-trash"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        @endif
    </div>
</div>
@endsection