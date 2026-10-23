@extends('admin.layouts.app')

@section('title', 'Discussions | Admin NADO')

@section('content')
<div class="page-heading">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-8 order-md-1 order-last">
                <h3>Discussions clients</h3>
                <p class="text-subtitle text-muted">Toutes les conversations avec vos clients.</p>
            </div>
        </div>
    </div>

    <section class="section">
        <div class="card">
            <div class="card-header d-flex align-items-center justify-content-between">
                <h4 class="card-title mb-0">
                    Discussions
                    @if($totalUnread > 0)
                        <span class="badge bg-danger ms-2">{{ $totalUnread }} non lu(s)</span>
                    @endif
                </h4>
            </div>
            <div class="card-body">
                @if($discussions->isEmpty())
                    <div class="text-center py-5 text-muted">
                        <i class="bi bi-chat-dots" style="font-size:3rem;"></i>
                        <p class="mt-3">Aucune discussion pour le moment.</p>
                    </div>
                @else
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Client</th>
                                <th>Annonce</th>
                                <th>Dernier message</th>
                                <th>Statut</th>
                                <th>Date</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($discussions as $d)
                            <tr class="{{ $d->unread_count > 0 ? 'table-warning fw-bold' : '' }}">
                                <td>{{ $d->id }}</td>
                                <td>
                                    <div class="d-flex align-items-center gap-2">
                                        <div class="avatar avatar-sm bg-primary text-white rounded-circle d-flex align-items-center justify-content-center" style="width:36px;height:36px;font-size:14px;font-weight:700;">
                                            {{ strtoupper(substr($d->client->name ?? 'C', 0, 1)) }}
                                        </div>
                                        <div>
                                            <div>{{ $d->client->name ?? '—' }}</div>
                                            <small class="text-muted">{{ $d->client->phone ?? '' }}</small>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    @if($d->annonce)
                                        @php
                                            $annonceBrand  = $d->annonce->brand->name  ?? $d->annonce->mark;
                                            $annonceModele = $d->annonce->modeleRelation->name ?? $d->annonce->modele;
                                        @endphp
                                        <a href="{{ route('achat.detail', ['marque' => str_replace(' ','',$annonceBrand), 'modele' => str_replace(' ','',$annonceModele), 'id' => $d->annonce->id]) }}" target="_blank" class="text-decoration-none">
                                            {{ $annonceBrand }} {{ $annonceModele }}
                                            <i class="bi bi-box-arrow-up-right ms-1" style="font-size:11px;"></i>
                                        </a>
                                    @else
                                        <span class="text-muted">—</span>
                                    @endif
                                </td>
                                <td>
                                    @if($d->lastMessage)
                                        <span class="text-truncate d-inline-block" style="max-width:200px;">
                                            {{ $d->lastMessage->sender_type === 'admin' ? '→ ' : '' }}{{ $d->lastMessage->message }}
                                        </span>
                                    @else
                                        <span class="text-muted">—</span>
                                    @endif
                                    @if($d->unread_count > 0)
                                        <span class="badge bg-danger ms-1">{{ $d->unread_count }}</span>
                                    @endif
                                </td>
                                <td>
                                    <span class="badge {{ $d->status === 'open' ? 'bg-success' : 'bg-secondary' }}">
                                        {{ $d->status === 'open' ? 'Ouvert' : 'Clôturé' }}
                                    </span>
                                </td>
                                <td>
                                    <small class="text-muted">{{ $d->last_message_at?->diffForHumans() ?? $d->created_at->diffForHumans() }}</small>
                                </td>
                                <td>
                                    <a href="{{ route('admin.discussions.show', $d->id) }}" class="btn btn-sm btn-primary">
                                        <i class="bi bi-chat-text"></i> Ouvrir
                                    </a>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <div class="mt-3">{{ $discussions->links() }}</div>
                @endif
            </div>
        </div>
    </section>
</div>
@endsection
