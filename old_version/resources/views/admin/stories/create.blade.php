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
                            <input type="file" name="media" id="media" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group mb-3">
                            <label for="expires_at">Expires At (Optional)</label>
                            <input type="datetime-local" name="expires_at" id="expires_at" class="form-control">
                            <small class="text-muted">Leave blank for default (24 hours)</small>
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