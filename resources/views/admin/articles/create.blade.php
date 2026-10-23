@extends('admin.layouts.app')

@section('content')
<div class="container">
    <h1 class="mb-4">Nouvel article</h1>

    @if ($errors->any())
        <div class="alert alert-danger">
            <ul class="mb-0">
                @foreach ($errors->all() as $error)<li>{{ $error }}</li>@endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('admin.articles.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        @include('admin.articles._form', ['article' => null])

        <div class="mt-4">
            <button type="submit" class="btn btn-primary">Enregistrer</button>
            <a href="{{ route('admin.articles.index') }}" class="btn btn-light">Annuler</a>
        </div>
    </form>
</div>
@endsection
