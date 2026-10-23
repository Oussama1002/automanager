@extends('admin.layouts.app')

@section('title', ($post->exists ? 'Modifier' : 'Nouvelle') . ' publication sociale | nado.ma')

@section('content')
<div id="main-content">
    <div class="page-heading">
        <h3>{{ $post->exists ? 'Modifier' : 'Nouvelle' }} publication sociale</h3>
    </div>

    <div class="page-content">
        <section class="row">
            <div class="col-12 col-lg-8">
                <div class="card">
                    <div class="card-body">

                        @if($errors->any())
                            <div class="alert alert-danger">
                                <ul class="mb-0">
                                    @foreach($errors->all() as $err)
                                        <li>{{ $err }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                        <form action="{{ $post->exists
                                    ? route('admin.social-posts.update', $post)
                                    : route('admin.social-posts.store') }}"
                              method="POST" enctype="multipart/form-data">
                            @csrf
                            @if($post->exists) @method('PUT') @endif

                            <div class="mb-3">
                                <label class="form-label">Plateforme</label>
                                <select name="platform" class="form-control" required>
                                    <option value="tiktok"    @selected(old('platform', $post->platform) === 'tiktok')>TikTok</option>
                                    <option value="instagram" @selected(old('platform', $post->platform) === 'instagram')>Instagram</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Lien de la publication / story</label>
                                <input type="url" name="url" class="form-control"
                                       value="{{ old('url', $post->url) }}"
                                       placeholder="https://www.tiktok.com/@nado.ma/video/..."
                                       required>
                                <small class="text-muted">Collez ici l'URL complète du post (TikTok, Reel Instagram, story publique, etc.).</small>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Titre / légende courte</label>
                                <input type="text" name="title" class="form-control"
                                       value="{{ old('title', $post->title) }}"
                                       placeholder="Ex : Top 5 voitures moins de 200K DH"
                                       required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Nom du compte (optionnel)</label>
                                <input type="text" name="handle" class="form-control"
                                       value="{{ old('handle', $post->handle) }}"
                                       placeholder="Ex : @nado.ma">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Vignette (image d'aperçu)</label>
                                <input type="file" name="thumbnail" class="form-control" accept="image/*">
                                @if($post->thumbnail_url)
                                    <div class="mt-2">
                                        <img src="{{ $post->thumbnail_url }}" alt="Aperçu" style="max-width:160px;border-radius:8px;">
                                    </div>
                                @endif
                                <small class="text-muted">Recommandé : format portrait 9/16 (min. 600×1000).</small>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Position (ordre d'affichage)</label>
                                <input type="number" name="position" class="form-control" min="0"
                                       value="{{ old('position', $post->position ?? 0) }}">
                                <small class="text-muted">Plus petit = affiché en premier.</small>
                            </div>

                            <div class="form-check mb-4">
                                <input class="form-check-input" type="checkbox" name="is_active"
                                       id="is_active" value="1"
                                       @checked(old('is_active', $post->exists ? $post->is_active : true))>
                                <label class="form-check-label" for="is_active">
                                    Afficher sur la page « À propos »
                                </label>
                            </div>

                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-primary">
                                    {{ $post->exists ? 'Mettre à jour' : 'Créer' }}
                                </button>
                                <a href="{{ route('admin.social-posts.index') }}" class="btn btn-secondary">Annuler</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
@endsection
