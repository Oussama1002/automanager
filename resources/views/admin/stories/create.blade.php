@extends('admin.layouts.app')
 
@section('content')
<div class="page-heading">
    <h3>Create New Story</h3>
</div>

<section class="section">
    <div class="card">
        <div class="card-body">
            <form action="{{ route('admin.stories.store') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group mb-3">
                            <label for="media">Upload Media (Image or Video)</label>
                            <input type="file" name="media" id="media"
                                   class="form-control @error('media') is-invalid @enderror">
                            @error('media')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group mb-3">
                            <label for="expires_at">Expires At (Optional)</label>
                            <input type="datetime-local" name="expires_at" id="expires_at" class="form-control">
                            <small class="text-muted">Laisser vide : la story reste affichée jusqu'à sa suppression.</small>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group mb-3">
                            <label for="instagram_link">Lien Instagram (optionnel)</label>
                            <input type="url" name="instagram_link" id="instagram_link"
                                   class="form-control @error('instagram_link') is-invalid @enderror"
                                   value="{{ old('instagram_link') }}"
                                   placeholder="https://www.instagram.com/p/…">
                            @error('instagram_link')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                            <small class="text-muted">Si renseigné, un bouton "Voir sur Instagram" s'affichera sur la story.</small>
                        </div>
                    </div>
                </div>
                
                <div class="mt-3">
                    <button type="submit" class="btn btn-primary">Create Story</button>
                </div>
            </form>
        </div>
    </div>
</section>
@endsection