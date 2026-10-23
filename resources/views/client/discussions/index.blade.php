@extends('layouts.client')

@section('title', 'Mes Discussions | NADO')

@section('client_title', 'Mes Discussions')
@section('client_subtitle', 'Vos conversations avec NADO et avec les acheteurs intéressés par vos annonces.')
@section('client_content')
<style>
    .disc-card {
        background: #fff;
        border: 1px solid #e2e8f0;
        border-radius: 14px;
        padding: 1.25rem 1.5rem;
        margin-bottom: 1rem;
        display: flex;
        align-items: center;
        gap: 1.25rem;
        cursor: pointer;
        transition: box-shadow 0.2s;
        text-decoration: none;
        color: inherit;
    }
    .disc-card:hover { box-shadow: 0 4px 20px rgba(20,89,221,0.12); border-color: #1459DD; }
    .disc-avatar {
        width: 46px; height: 46px;
        border-radius: 50%;
        background: #1459DD;
        color: #fff;
        display: flex; align-items: center; justify-content: center;
        font-weight: 900; font-size: 18px; flex-shrink: 0;
    }
    .disc-title { font-weight: 800; font-size: 1.05rem; color: #0f172a; margin-bottom: 4px; }
    .disc-snippet { font-size: 0.95rem; color: #64748b; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 520px; }
    .disc-meta { margin-left: auto; text-align: right; flex-shrink: 0; }
    .disc-time { font-size: 11px; color: #94a3b8; }
    .role-badge { display: inline-block; font-size: 11px; font-weight: 800; padding: 2px 8px; border-radius: 99px; margin-left: 6px; vertical-align: middle; }
    .role-badge.seller { background: #fef9c3; color: #854d0e; }
    .role-badge.buyer  { background: #dbeafe; color: #1459DD; }
    .unread-badge { background: #1459DD; color: #fff; border-radius: 99px; font-size: 11px; font-weight: 700; padding: 2px 8px; display: inline-block; margin-top: 4px; }
</style>
<div>

    @if($discussions->isEmpty())
        <div style="text-align:center; color:#94a3b8; padding:4rem 0;">
            <i class="fa fa-comments" style="font-size:3rem; margin-bottom:1rem; display:block;"></i>
            <p>Aucune discussion pour le moment.</p>
            <a href="{{ route('achat.index') }}" style="color:#1459DD;">Parcourir les annonces →</a>
        </div>
    @else
        @foreach($discussions as $d)
        <a href="{{ route('client.discussions.show', $d->id) }}" class="disc-card">
            <div class="disc-avatar">
                <i class="fa fa-comments" style="font-size:18px;"></i>
            </div>
            <div style="flex:1; min-width:0;">
                <div class="disc-title">
                    @if($d->annonce)
                        @php
                            $annonceBrand  = $d->annonce->brand->name ?? $d->annonce->mark;
                            $annonceModele = $d->annonce->modeleRelation->name ?? $d->annonce->modele;
                        @endphp
                        {{ $annonceBrand }} {{ $annonceModele }} ({{ $d->annonce->year }})
                    @else
                        Discussion #{{ $d->id }}
                    @endif
                    @if($d->viewer_role === 'seller')
                        <span class="role-badge seller">Votre annonce · {{ $d->client->name ?? 'Acheteur' }}</span>
                    @else
                        <span class="role-badge buyer">Vous êtes acheteur</span>
                    @endif
                </div>
                <div class="disc-snippet">
                    @if($d->lastMessage)
                        @php $ownType = $d->viewer_role === 'seller' ? 'seller' : 'client'; @endphp
                        {{ $d->lastMessage->sender_type === $ownType
                            ? 'Vous : '
                            : \App\Http\Controllers\Client\DiscussionController::senderLabel($d->lastMessage->sender_type).' : ' }}{{ $d->lastMessage->message }}
                    @else
                        Démarrez la conversation...
                    @endif
                </div>
            </div>
            <div class="disc-meta">
                <div class="disc-time">{{ $d->last_message_at?->diffForHumans() ?? $d->created_at->diffForHumans() }}</div>
                @if($d->unread_count > 0)
                    <span class="unread-badge">{{ $d->unread_count }}</span>
                @endif
                <div style="margin-top:4px;">
                    <span style="font-size:11px; color:{{ $d->status === 'open' ? '#22c55e' : '#94a3b8' }};">
                        ● {{ $d->status === 'open' ? 'Ouvert' : 'Clôturé' }}
                    </span>
                </div>
            </div>
        </a>
        @endforeach

        <div class="mt-3">{{ $discussions->links() }}</div>
    @endif
</div>
@endsection
