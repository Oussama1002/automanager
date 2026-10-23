@extends('layouts.app')

@section('content')
<div class="container py-5">

    <h1 class="fw-bold mb-3">{{ $article->title }}</h1>

    @if($article->image)
        <img src="{{ asset($article->image) }}" class="img-fluid mb-4" alt="{{ $article->title }}">
    @endif

    <div class="text-muted mb-3">
Publié {{ $article->created_at->diffForHumans() }}
    </div>

    
    <div class="article-content">
        {!! $article->content !!}
    </div>

</div>
@endsection
