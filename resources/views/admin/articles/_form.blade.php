{{-- Shared fields for create / edit --}}
<div class="row g-3">
    <div class="col-md-8">
        <label class="form-label fw-bold">Titre *</label>
        <input type="text" name="title" class="form-control"
               value="{{ old('title', $article->title ?? '') }}" required>
    </div>

    <div class="col-md-4 d-flex align-items-end gap-3">
        <div class="form-check">
            <input type="checkbox" name="is_active" value="1" id="is_active" class="form-check-input"
                   {{ old('is_active', $article->is_active ?? 1) ? 'checked' : '' }}>
            <label class="form-check-label" for="is_active">Publier (actif)</label>
        </div>
        <div class="form-check">
            <input type="checkbox" name="is_premium" value="1" id="is_premium" class="form-check-input"
                   {{ old('is_premium', $article->is_premium ?? 0) ? 'checked' : '' }}>
            <label class="form-check-label" for="is_premium">Premium</label>
        </div>
    </div>

    <div class="col-12">
        <label class="form-label fw-bold">Image de couverture</label>
        @if(!empty($article) && $article->image)
            <div class="mb-2">
                <img src="{{ asset('storage/' . $article->image) }}"
                     alt="Image actuelle"
                     style="max-width: 300px; height: auto; border-radius: 8px; display: block;">
                <small class="text-muted">Image actuelle. Choisissez un nouveau fichier pour la remplacer.</small>
            </div>
        @endif
        <input type="file" name="image" accept="image/*" class="form-control">
        <small class="text-muted">JPG, PNG ou WebP — 4 Mo max.</small>
    </div>

    <div class="col-12">
        <label class="form-label fw-bold">Extrait (résumé court)</label>
        <textarea name="excerpt" rows="2" class="form-control"
                  maxlength="500">{{ old('excerpt', $article->excerpt ?? '') }}</textarea>
    </div>

    <div class="col-12">
        <label class="form-label fw-bold">Contenu *</label>
        <textarea name="content" id="article-content" rows="15" class="form-control"
                  required>{{ old('content', $article->content ?? '') }}</textarea>
        <small class="text-muted">HTML autorisé.</small>
    </div>

    <div class="col-md-6">
        <label class="form-label">Meta title (SEO)</label>
        <input type="text" name="meta_title" class="form-control"
               value="{{ old('meta_title', $article->meta_title ?? '') }}">
    </div>

    <div class="col-md-6">
        <label class="form-label">Meta description (SEO)</label>
        <input type="text" name="meta_description" class="form-control"
               value="{{ old('meta_description', $article->meta_description ?? '') }}">
    </div>
</div>
