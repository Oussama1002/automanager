@extends('admin.layouts.app')

@section('content')
<div class="container">
    <h1>Publications</h1>
    <a href="{{ route('admin.publications.create') }}" class="btn btn-primary mb-3">Nouvelle publication</a>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <ul id="publication-list" class="list-group">
        @foreach($publications as $pub)
            <li class="list-group-item d-flex justify-content-between align-items-center" data-id="{{ $pub->id }}">
                <span>{{ $pub->title }}</span>
                <span>
                    <a href="{{ route('admin.publications.edit', $pub) }}" class="btn btn-sm btn-warning">Modifier</a>
                    <form action="{{ route('admin.publications.destroy', $pub) }}" method="POST" class="d-inline">
                        @csrf @method('DELETE')
                        <button class="btn btn-sm btn-danger">Supprimer</button>
                    </form>
                </span>
            </li>
        @endforeach
    </ul>
</div>

<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
<script>
    $(function() {
        $('#publication-list').sortable({
            update: function(event, ui) {
                let positions = $(this).sortable('toArray', {attribute: 'data-id'});
                $.post('{{ route('admin.publications.reorder') }}', {
                    positions: positions,
                    _token: '{{ csrf_token() }}'
                });
            }
        });
    });
</script>
@endsection
