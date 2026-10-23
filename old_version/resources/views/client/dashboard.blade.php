@extends('layouts.app')

@section('title', 'Mon Tableau de bord')

@section('content')
<style>
    .sidebar {
        width: 250px;
        background-color: #003b87;
        color: white;
        height: 100vh;
        position: fixed;
        padding: 20px;
    }
    .sidebar .logo {
        font-size: 28px;
        font-weight: bold;
        color: #f0c000;
    }
    .sidebar .user {
        text-align: center;
        margin-top: 30px;
    }
    .sidebar .user img {
        border-radius: 50%;
        width: 80px;
        height: 80px;
    }
    .sidebar .user h4 {
        margin-top: 10px;
        font-size: 16px;
    }
    .sidebar ul {
        list-style: none;
        padding: 0;
        margin-top: 30px;
    }
    .sidebar ul li {
        margin: 15px 0;
        font-size: 15px;
    }
    .sidebar ul li i {
        margin-right: 8px;
    }
    .dashboard-content {
        margin-left: 270px;
        padding: 30px;
    }
    .card {
        background-color: #fff7f3;
        padding: 20px;
        border-radius: 10px;
        text-align: center;
        font-size: 18px;
        color: #333;
        font-weight: bold;
    }
    .filter-bar input,
    .filter-bar select {
        padding: 10px;
        margin-right: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }
    .car-info {
        display: flex;
        gap: 20px;
        padding: 20px;
        margin-bottom: 30px;
        border: 1px solid #ddd;
        border-radius: 10px;
        background: #fff;
        box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        align-items: flex-start;
    }
    .car-info img {
        width: 300px;
        height: 200px;
        object-fit: cover;
        border-radius: 8px;
        border: 1px solid #ccc;
    }
    .car-details { flex: 1; }
    .car-details h2 { color: #1f519b; margin: 5px 0 10px; }
    .car-details p { color: #555; font-size: 14px; margin-bottom: 5px; }
    .car-gallery { display: flex; gap: 5px; margin-top: 10px; }
    .car-gallery img { width: 50px; height: auto; border-radius: 5px; border: 1px solid #ccc; }

    /* ✅ Responsive */
    @media (max-width: 768px) {
        .sidebar { width: 100%; height: auto; position: relative; }
        .dashboard-content { margin-left: 0; padding: 15px; }
        .sidebar ul { display: flex; flex-wrap: wrap; justify-content: center; }
        .sidebar ul li { margin: 10px; font-size: 14px; }
        .car-info { flex-direction: column; text-align: center; }
        .car-info img { width: 100%; height: auto; }
        .car-gallery { justify-content: center; flex-wrap: wrap; }
        .car-gallery img { width: 100px; height: 70px; object-fit: cover; }
    }
</style>

@php
    $isFlotte = Auth::guard('client')->user()->type === 'flotte&enchere';
@endphp

<div class="sidebar">
    <div class="logo">NADO</div>
   <div class="user">
    @php
        $logo = Auth::guard('client')->user()->logo ?? null;
        // Si logo stocké sous forme de tableau JSON ["xxx.png"]
        if (is_string($logo) && str_starts_with($logo, '[')) {
            $decoded = json_decode($logo, true);
            $logo = $decoded[0] ?? null;
        }
    @endphp

    @if($logo)
        <img src="{{ asset('storage/nadoautoenchere/logo/' . $logo) }}" alt="Logo" style="object-fit:cover; border-radius:50%; width:80px; height:80px;">
    @else
        <img src="{{ asset('assets/images/user.png') }}" alt="Avatar" style="border-radius:50%; width:80px; height:80px;">
    @endif

    <h4 style="color:white !important;">{{ Auth::guard('client')->user()->name }}</h4>
</div>

    <ul>


        @if($isFlotte)
            <li><a href="{{ route('client.nadoautoencheres.index') }}" style="color:white;"><i class="fa fa-car"></i> Mes Véhicules</a></li>
<li><a href="{{ route('client.nadoautoencheresbid.mybids') }}"><i class="fa fa-gavel"></i> Mes Offres</a></li>
                        <li><a href="{{ route('client.nadoautoencheresbid.index') }}" style="color:white;"><i class="fa fa-car"></i> Les Offres sur mes Vehicules</a></li>

            <li><a href="{{ route('client.equipe.index') }}" style="color:white;"><i class="fa fa-user"></i> Mon Equipe</a></li>

        @else
                <li><a href="{{ route('client.annonces.create') }}" style="color:white;"><i class="fa fa-plus-circle"></i> Ajouter une annonce</a></li>
   
        <li><a href="{{ route('client.annonces.index') }}" style="color:white;"><i class="fa fa-car"></i> Mes Annonces</a></li>
        @endif
        <li>
                            <li><a href="{{ route('client.profile.edit') }}" style="color:white;"><i class="fa fa-user"></i> Mon Profil</a></li>
        <li><a href="{{ route('client.favorites') }}"><i class="fa fa-heart"></i> Mes favoris</a></li>

            <form method="POST" action="{{ route('logout') }}">
                @csrf
                <button type="submit" style="background:none; border:none; color:white; padding:0;">
                    <i class="fa fa-sign-out"></i> Déconnexion
                </button>
            </form>
        </li>
    </ul>
</div>

<div class="dashboard-content">
    <h2>Tableau de bord</h2>

    <div style="display: flex; gap: 20px; margin-top: 20px;">
        <div class="card">{{ $isFlotte ? 'Véhicules publiés' : 'Annonces publiées' }}<br><span style="font-size: 24px;">{{ $publiees }}</span></div>
        <div class="card">En attente<br><span style="font-size: 24px;">{{ $enAttente }}</span></div>
        <div class="card">Mes favoris<br><span style="font-size: 24px;">{{ count($favoris) }}</span></div>
    </div>

    <div style="margin-top: 40px;">
        <h3>{{ $isFlotte ? 'Mes Véhicules' : 'Mes Annonces' }}</h3>

        <div class="filter-bar" style="margin-bottom: 20px;">
            <input type="text" placeholder="Recherche...">
            <select><option>À partir de la date</option></select>
            <select><option>À ce jour</option></select>
            <select><option>Status</option></select>
        </div>

        @if(($isFlotte ? $vehicules : $annonces)->isEmpty())
            <p>Aucun enregistrement trouvé.</p>
        @else
            <table style="width:100%; border-collapse: collapse;">
                <thead>
                    <tr style="background-color: #f0f0f0;">
                        <th style="padding:10px;">Titre</th>
                        <th style="padding:10px;">Date</th>
                        <th style="padding:10px;">Status</th>
                        <th style="padding:10px;">Vues</th>
                        <th style="padding:10px;">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($isFlotte ? $vehicules : $annonces as $item)
                        <tr style="border-bottom: 1px solid #ddd;">
                            <td style="padding:10px;">{{ $item->titre }}</td>
                            <td style="padding:10px;">{{ $item->created_at->format('d/m/Y') }}</td>
                            <td style="padding:10px;">{{ $item->status ?? 'En attente' }}</td>
                            <td style="padding:10px;">{{ $item->views ?? 0 }}</td>
                            <td style="padding:10px;">
                                <a href="{{ $isFlotte ? route('client.nadoautoencheres.edit', $item->id) : route('client.annonces.edit', $item->id) }}" class="btn btn-sm btn-primary">Modifier</a>
                                <form action="{{ $isFlotte ? route('client.nadoautoencheres.destroy', $item->id) : route('client.annonces.destroy', $item->id) }}" method="POST" style="display:inline-block;" onsubmit="return confirm('Supprimer ?');">
                                    @csrf @method('DELETE')
                                    <button type="submit" class="btn btn-sm btn-danger">Supprimer</button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        @endif
    </div>

    <div style="margin-top: 40px;">
        <h3>Mes favoris</h3>
        @if($favoris->isEmpty())
            <p>Vous n'avez aucun favori.</p>
        @else
            <table style="width:100%; border-collapse: collapse;">
                <thead>
                    <tr style="background-color: #f0f0f0;">
                        <th style="padding:10px;">Titre</th>
                        <th style="padding:10px;">Date</th>
                        <th style="padding:10px;">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($favoris as $fav)
                        <tr style="border-bottom: 1px solid #ddd;">
                            <td style="padding:10px;">{{ $fav->titre ?? 'N/A' }}</td>
                            <td style="padding:10px;">{{ optional($fav->pivot->created_at)->format('d/m/Y') ?? '-' }}</td>
                            <td style="padding:10px;">
                                <a href="{{ route('achat.detail', ['marque' => str_replace(' ', '', $fav->mark), 'modele' => str_replace(' ', '', $fav->modele), 'id' => $fav['id']]) }}">Voir</a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        @endif
    </div>
@if($isFlotte)
<div style="margin-top: 40px;">
    <h3>📈 Offres par Véhicule</h3>
    <canvas id="offersChart" width="600" height="200"></canvas>
</div>
@endif

<div style="margin-top: 40px;">
    <h3>📊 Vues par Véhicule</h3>
    <canvas id="viewsChart" width="600" height="200"></canvas>
</div>


@foreach($isFlotte ? $vehicules : $annonces as $item)
    @php
        // Decode images JSON if needed
        $images = is_string($item->images) ? json_decode($item->images, true) : $item->images;
        $images = is_array($images) ? $images : []; // ensure it's an array
        $firstImage = $images[0] ?? 'default.png'; // fallback image
    @endphp

    <div class="car-info">
        <img src="{{ $isFlotte 
            ? Storage::url('nadoautoenchere/' . $firstImage)
            :Storage::url('ads/' . $firstImage)}}" 
            alt="{{ optional($item->brand)->name }} {{ optional($item->modeleRelation)->name }}">

        <div class="car-details">
            <p>Réf: # VC{{ $item->id }}</p>

            <h2>
                {{ strtoupper(optional($item->brand)->name ?? '') }}
                {{ strtoupper(optional($item->modeleRelation)->name ?? '') }}
            </h2>

            {{-- Optional gallery --}}
            @if(count($images) > 1)
                <div class="car-gallery">
                    @foreach($images as $img)
                        <img src="{{ $isFlotte 
                            ? asset('storage/nadoautoenchere/' . $img) 
                            : asset('storage/ads/' . $img) }}" 
                            alt="{{ $item->titre }}">
                    @endforeach
                </div>
            @endif
        </div>
    </div>
@endforeach


</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const offersCtx = document.getElementById('offersChart')?.getContext('2d');
    if (offersCtx) {
        const offerLabels = @json($offersLabels);
        const offerData = @json($offersData);

        new Chart(offersCtx, {
            type: 'bar',
            data: {
                labels: offerLabels,
                datasets: [{
                    label: 'Nombre d’offres',
                    data: offerData,
                    borderColor: '#ff9800',
                    backgroundColor: 'rgba(255, 152, 0, 0.3)',
                }]
            },
            options: {
                plugins: {
                    legend: { labels: { color: '#000' }},
                    tooltip: {
                        callbacks: { label: ctx => `${ctx.parsed.y} offres` }
                    }
                },
                scales: {
                    x: {
                        ticks: { color: '#000' },
                        title: { display: true, text: 'Véhicule', color: '#333' }
                    },
                    y: {
                        beginAtZero: true,
                        ticks: {
                            color: '#000',
                            stepSize: 1,
                            callback: function(value) {
                                return Number.isInteger(value) ? value : null;
                            }
                        },
                        title: { display: true, text: 'Offres', color: '#333' }
                    }
                }
            }
        });
    }
</script>

<script>
    const ctx = document.getElementById('viewsChart').getContext('2d');
    const labels = @json($viewsLabels);
    const dataPoints = @json($viewsData);

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Vues',
                data: dataPoints,
                borderColor: '#17cfd4',
                backgroundColor: 'rgba(23, 207, 212, 0.3)',
                fill: true,
                tension: 0.4
            }]
        },
        options: {
            plugins: {
                legend: { labels: { color: '#000' }},
                tooltip: {
                    callbacks: { label: ctx => `${ctx.parsed.y} vues` }
                }
            },
            scales: {
    x: {
        ticks: { color: '#000' },
        title: { display: true, text: 'Titre', color: '#333' }
    },
    y: {
        beginAtZero: true,
        ticks: {
            color: '#000',
            stepSize: 1, // 👈 force only integer steps
            callback: function(value) {
                return Number.isInteger(value) ? value : null; // show only whole numbers
            }
        },
        title: { display: true, text: 'Vues', color: '#333' }
    }
}

        }
    });
</script>
@endsection
