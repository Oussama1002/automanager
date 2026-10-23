@extends('admin.layouts.app')

@section('content')
<div class="container">
    <h1 class="mb-4">Modifier l'article</h1>

    @if ($errors->any())
        <div class="alert alert-danger">
            <ul class="mb-0">
                @foreach ($errors->all() as $error)<li>{{ $error }}</li>@endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('admin.articles.update', $article->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        @include('admin.articles._form', ['article' => $article])

        <div class="mt-4">
            <button type="submit" class="btn btn-primary">Mettre à jour</button>
            <a href="{{ route('admin.articles.index') }}" class="btn btn-light">Annuler</a>
        </div>
    </form>
</div>
@endsection
