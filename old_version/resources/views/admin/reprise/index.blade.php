@extends('admin.layouts.app')

@section('title' , 'Reprise | nado.ma')


@section('content')
<div id="main-content">
<div class="page-heading">
    <h3>Reprise</h3>
</div>
<div class="page-content">
    <section class="row">
      <div class="row" id="table-striped">
          <div class="col-12">
              <div class="card">
                  <div class="card-header d-flex justify-content-between">
                      <h4 class="card-title">List Reprise</h4>
                  </div>
                  <div class="card-content">
                      <div class="card-body">
                      <div class="table-responsive mx-4 my-2">
                          <table class="table table-striped mb-0 display" id="example">
                              <thead>
                                  <tr>
                                      <th>#</th>
                                      <th>Name</th>
                                      <th>ville</th>
                                      <th>Mark</th>
                                      <th>Modele</th>
                                      <th>Année</th>
                                      <th>Phone</th>
                                      <th>Email</th>
                                      <th>Contacte</th>
                                      <th>Rende-zvous</th>
                                      <th class="d-flex justify-content-end">Action</th>
                                  </tr>
                              </thead>
                              <tbody>
                                @foreach ($reprises as $reprise)
                                  <tr>
                                      <td>{{ $reprise->id }}</td>
                                      <td>{{ $reprise->name }}</td>
                                      <td>{{ $reprise->city }}</td>
                                      <td>{{ $reprise->mark }}</td>
                                      <td>{{ $reprise->modele }}</td>
                                      <td>{{ $reprise->year }}</td>
                                      <td>{{ $reprise->phone }}</td>
                                      <td>{{ $reprise->email }}</td>
                                      <td>{{ $reprise->contacte }}</td>
                                      <td>{{ $reprise->rendezvous }}</td>
                                      <td>
                                        <div class="d-flex gap-2 w-100 justify-content-end">
                                          @include('admin.partials.deleteBtn', ["url" =>  route('reprises.destroy' , $reprise) ])
                                        </div>
                                      </td>
                                  </tr>
                                @endforeach
                              </tbody>

                            <tfoot>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>ville</th>
                                    <th>Mark</th>
                                    <th>Modele</th>
                                    <th>Année</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Contacte</th>
                                    <th>Rende-zvous</th>
                                </tr>
                            </tfoot>
                          </table>
                      </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
</section>
</div>
</div>


@endsection

