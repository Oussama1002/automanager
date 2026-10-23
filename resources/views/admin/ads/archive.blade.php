@extends('admin.layouts.app')

@section('title' , 'Archive Annonces | nado.ma')


@section('content')
<div id="main-content">
    <div class="page-heading">
        <h3>Archive des annonces</h3>
    </div>
    <div class="page-content">
    <section class="section">
      @if (session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
      @endif
      <div class="card">
        <div class="card-header d-flex justify-content-between">
            <h4 class="card-title">Annonces supprimées</h4>
            <a href="{{ route('admin.annonces.index') }}" class="btn btn-primary"><i class="bi bi-arrow-left"></i> Retour aux annonces</a>
        </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-striped mb-0 display" id="example">
                  <thead>
                      <tr>
                          <th>#</th>
                          <th>titre</th>
                          <th>mark</th>
                          <th>modele</th>
                          <th>date création</th>
                          <th>supprimée le</th>
                          <th class="d-flex justify-content-end">Action</th>
                      </tr>
                  </thead>
                  <tbody>
                    @foreach($ads as $ad)
                    <tr>
                      <th scope="row">{{ $ad->id }}</th>
                      <td>{{ $ad->titre }}</td>
                      <td>{{ $ad->brand ? $ad->brand->name : '-' }}</td>
                      <td>{{ $ad->modeleRelation ? $ad->modeleRelation->name : '-' }}</td>
                      <td>{{ $ad->created_at }}</td>
                      <td>{{ $ad->deleted_at }}</td>
                      <td>
                        <div class="d-flex gap-2 w-100 justify-content-end">
                          <form action="{{ route('admin.annonces.restore', $ad->id) }}" method="POST">
                            @csrf
                            @method('PATCH')
                            <button type="submit" class="btn btn-success"><i class="bi bi-arrow-counterclockwise"></i> Restaurer</button>
                          </form>
                          <form action="{{ route('admin.annonces.forceDelete', $ad->id) }}" method="POST"
                                onsubmit="return confirm('Supprimer définitivement cette annonce ? Cette action est irréversible.');">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger"><i class="bi bi-trash"></i> Supprimer définitivement</button>
                          </form>
                        </div>
                      </td>
                    </tr>
                    @endforeach
                  </tbody>
              </table>
          </div>
      </div>
  </section>
</div>
</div>
@endsection
