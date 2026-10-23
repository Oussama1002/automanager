@isset($breadcrumbItems)
    <div class="row">
        <div class="col-12 mx-3">
            <nav aria-label="breadcrumb" class="breadcrumb-header">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href=" {{route('dashboard')}} ">Dashboard</a></li>
                    @foreach ($breadcrumbItems as $k => $link)
                        @if ($link !== "")
                            <li class="breadcrumb-item"><a href=" {{ $link }}" >{{$k}}</a></li>
                        @else
                            <li class="breadcrumb-item active">{{$k}}</li>
                        @endif                        
                    @endforeach
                </ol>
            </nav>
        </div>
    </div>    
@endisset