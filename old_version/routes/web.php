<?php

use App\Http\Controllers\Client\Auth\RegisterController;
use App\Http\Controllers\Client\Auth\LoginController as ClientAuthController;
use App\Http\Controllers\Client\Auth\LogoutController;
use App\Http\Controllers\Client\ClientDashboardController;
use App\Http\Controllers\Client\ClientAnnonceController;
use App\Http\Controllers\Client\EquipeController;
use App\Http\Controllers\Admin\Auth\AuthenticatedSessionController;


use App\Http\Controllers\ProfileController;
use App\Http\Controllers\FrontController;
use App\Http\Controllers\Admin\StoriesController;

use App\Http\Controllers\AccessoiresController;

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{
    PlanController,
    SellController,
    FavoriteController,
    ContactController,
    ServicesController,
    FinancementController,
    RepriseController,
    VenteController,
    BuyController,
    NadoAutoEnchereController,
    ComparisonController,
    Admin\AnnoncesController,
    Admin\PublicationController,
    Admin\AdminNadoAutoEnchereController,

    Admin\EntretienController,

    Admin\AvisTextController,
    Admin\FinancementSettingsController,
    Admin\AvisVdController,
    Admin\BrandsController,
    Admin\ColorController,
    Admin\ClientController,

    Admin\FinanceController,
    Admin\ImgSlideController,
    Admin\ModelsController,
    Admin\OffreController,
    Admin\RepriseVenteController,
    Admin\UserController,
    Admin\VenteAdminController,
    Admin\VideoAdsController,
    Admin\VilleController,
    Admin\AutoEnchereController,
    Admin\NadoAutoEnchereBidController
};
use Illuminate\Support\Facades\Auth;

// At the bottom of web.php or where routes are defined

// Public Routes


Route::get('/admin/annonces/approval', [AnnoncesController::class, 'approval'])->name('admin.annonces.approval');
Route::get('/admin/annonces/showAnnonce/{id}', [AnnoncesController::class, 'showAnnonce'])->name('admin.annonces.showAnnonce');
Route::get('/', [FrontController::class, 'index']);
Route::get('/articles/{slug}', [FrontController::class, 'articleShow'])
    ->name('articles.show');
Route::get('/articles', [FrontController::class, 'articlesList'])
    ->name('articles.index');

Route::post('/estimate-value', [App\Http\Controllers\FrontController::class, 'estimate'])
    ->name('estimate.value');

// Client Auth Routes
Route::get('/client/login', [ClientAuthController::class, 'showLoginForm'])->name('client.login');
Route::post('/client/login', [ClientAuthController::class, 'login'])->name('client.login.submit');

Route::get('/client/register', [RegisterController::class, 'showRegistrationForm'])->name('client.register');
Route::post('/client/register', [RegisterController::class, 'register'])->name('client.register.submit');
// Inside auth:client group
Route::middleware(['auth:client'])->prefix('client')->name('client.')->group(function () {
    Route::get('/dashboard', [ClientDashboardController::class, 'index'])->name('dashboard');
    Route::resource('annonces', ClientAnnonceController::class); // <-- this should exist
    Route::get('/profile/edit', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::get('/favorites', [FavoriteController::class, 'index'])->name('favorites');
    Route::resource('equipe', \App\Http\Controllers\Client\EquipeController::class);
    Route::resource('nadoautoencheresbid', \App\Http\Controllers\Client\ClientNadoAutoEncheresBidController::class);

    Route::put('/profile/update', [ProfileController::class, 'update'])->name('profile.update');
    Route::get('/', [FrontController::class, 'index'])->name('home');
    // Bids routes
    Route::get('/nadoautoencheres/bids', [ClientNadoAutoEncheresBidController::class, 'index'])
        ->name('nadoautoencheresbid.index');
    // Recherche entreprises (AJAX)
    Route::get('search-companies', [\App\Http\Controllers\NadoAutoEnchereController::class, 'searchCompanies'])
        ->name('companies.search');

    Route::get('/export', [ClientNadoAutoEncheresBidController::class, 'export'])
        ->name('nadoautoencheresbid.export');

    Route::delete('/nadoautoencheres/bids/{id}', [ClientNadoAutoEncheresBidController::class, 'destroy'])
        ->name('nadoautoencheresbid.destroy');
});

// Route::prefix('admin')->group(function () {
//     Route::get('nadoautoenchere/create', [NadoAutoEnchereController::class, 'create'])->name('admin.nadoautoenchere.create');
//     Route::post('nadoautoenchere', [NadoAutoEnchereController::class, 'store'])->name('admin.nadoautoenchere.store');
//     Route::get('nadoautoenchere/{id}/edit', [NadoAutoEnchereController::class, 'edit'])->name('admin.nadoautoenchere.edit');
//     Route::put('nadoautoenchere/{id}', [NadoAutoEnchereController::class, 'update'])->name('admin.nadoautoenchere.update');
//     Route::delete('nadoautoenchere/{id}', [NadoAutoEnchereController::class, 'destroy'])->name('admin.nadoautoenchere.destroy');

//    });
// Public route (no auth)
Route::get('/nadoautoenchere/prelogin', [NadoAutoEnchereController::class, 'prelogin'])
    ->name('nadoautoenchere.prelogin');

// ✅ Use controller with middleware
Route::middleware(['flotte.enchere'])->group(function () {
    Route::get('/nadoautoenchere/categories', [NadoAutoEnchereController::class, 'categories'])->name('nadoautoenchere.categories');
    Route::get('/client/filter-categories', [App\Http\Controllers\NadoAutoEnchereController::class, 'filterCategories'])
        ->name('nadoautoenchere.filterCategories');

    Route::get('/nadoautoenchere', [NadoAutoEnchereController::class, 'index'])->name('nadoautoenchere.index');
    Route::get('/nadoautoenchere/{id}', [NadoAutoEnchereController::class, 'show'])->name('nadoautoenchere.show');
    Route::post('/nadoautoenchere/{id}/proposer-prix', [NadoAutoEnchereController::class, 'proposerPrix'])
        ->name('nadoautoenchere.proposerPrix');
    // Add a prefix to the PDF route
    Route::get('/nadoautoenchere/pdf/{pdf}', [NadoAutoEnchereController::class, 'showPdf'])
        ->name('nadoautoenchere.pdf');
});

Route::get('/', [FrontController::class, 'index'])->name('index');
Route::resource('/vendre', SellController::class);
Route::resource('/contactez-nous', ContactController::class);
Route::get('/plans', [PlanController::class, 'index'])->name('plans.index');
// Show index.blade.php (with the two boxes and button)
// Page d’intro (juste le bouton)
Route::get('/reprise', [App\Http\Controllers\RepriseController::class, 'index'])->name('reprise.index');
Route::get('/reprise/{id}', [App\Http\Controllers\RepriseController::class, 'destroy'])->name('reprise.destroy');

Route::get('/reprise/store', [App\Http\Controllers\RepriseController::class, 'store'])->name('reprise.reprise');

Route::get('/get-models', [App\Http\Controllers\RepriseController::class, 'getModels'])->name('get.models');

// Public
Route::get('/nadoautoenchere', [NadoAutoEnchereController::class, 'publicIndex'])->name('nadoautoenchere.index');
// Route::get('/nadoautoenchere/{id}', [NadoAutoEnchereController::class, 'show'])->name('nadoautoenchere.show');

// Page du formulaire (avec les données)
//  Route::get('/reprise/formulaire', [App\Http\Controllers\RepriseController::class, 'form'])->name('reprise.form'); 
Route::get('/reprises/formulaire', [App\Http\Controllers\RepriseController::class, 'form'])->name('reprise.form');




Route::get('/vente', [VenteController::class, 'index'])->name('vente.index');
Route::get('/vente/formulaire', [VenteController::class, 'form'])->name('vente.form');
Route::get('/get-models', [App\Http\Controllers\VenteController::class, 'getModels'])->name('get.models');
Route::post('/vente/store', [VenteController::class, 'store'])->name('vente.store');

Route::get('/accessoires', [AccessoiresController::class, 'index'])->name('accessoires.index');
Route::get('/annonces/{id}', [AnnoncesController::class, 'show'])->name('annonces.show');

Route::resource('/services', ServicesController::class);
Route::resource('/financement', FinancementController::class);
Route::resource('/reprise', RepriseController::class);
Route::resource('/nadoautoenchere', NadoAutoEnchereController::class);

Route::resource('/vente', VenteController::class);

Route::resource('/comparison', ComparisonController::class);
Route::resource('annonce', SellController::class)->middleware('auth');

Route::get('/achat/voiture/{marque}_{modele}_{id}.html', [BuyController::class, 'show'])->name('achat.detail');
//Route::get('/achat/incrementviews/{id}', [AchatController::class, 'incrementViews'])->name('achat.incrementviews');

Route::post('/logout', [LogoutController::class, 'logout'])->name('logout');

Route::post('/annonces/{id}/proposer-prix', [AnnoncesController::class, 'proposerPrix'])->name('annonces.proposerPrix')->middleware('auth:client');;
Route::post('/nadoautoenchere/{id}/proposer-prix', [NadoAutoEnchereController::class, 'proposerPrix'])->name('nadoautoenchere.proposerPrix');


Route::middleware(['auth'])->group(function () {
    Route::get('/client/profile', [ProfileController::class, 'index'])->name('client.profile');
});
// User Profile
Route::middleware(['auth'])->group(function () {
    Route::get('/profil', [ProfileController::class, 'index'])->name('profile');
});
Route::middleware('auth:client')->group(function () {
    Route::post('/annonce/{id}/favorite', [FavoriteController::class, 'toggle'])->name('favorite.toggle');
});

Route::middleware('auth')->get('/annonce', function () {
    return redirect()->route('annonces.index');
})->name('dashboard');
Route::get('/admin/autoenchere/nav', function () {
    return view('admin.layouts.autoenchere_navigation');
})->name('admin.autoenchere.nav');

Route::middleware(['auth', 'admin'])->group(function () {
    Route::get('/admin/clients/approval', [ClientApprovalController::class, 'index'])->name('admin.clients.approval');
    Route::patch('/admin/clients/{id}/update-type', [ClientController::class, 'updateType'])
        ->name('admin.clients.updateType');

    Route::post('/admin/clients/approve/{id}', [ClientApprovalController::class, 'approve'])->name('admin.clients.approve');
});



Route::get('clients', [ClientController::class, 'index'])->name('clients.index');

// Admin Routes
// 🟢 Admin Auth Routes
Route::prefix('admin')->name('admin.')->middleware('guest:admin')->group(function () {
    Route::get('/login', [AuthenticatedSessionController::class, 'create'])->name('login');
    Route::post('/login', [AuthenticatedSessionController::class, 'store']);
});
Route::middleware(['auth:admin', 'role:admin'])->group(function () {
    Route::get('/admin/users', [App\Http\Controllers\Admin\UserController::class, 'index'])->name('users.index');
    Route::get('/ventes', [VenteController::class, 'index'])->name('ventes.index');
    Route::get('/reprises', [RepriseVenteController::class, 'index'])->name('reprises.index');
    Route::get('/finances', [FinanceController::class, 'index'])->name('finances.index');
    Route::get('/FinancementSettings/edit', [FinancementSettingsController::class, 'edit'])->name('FinancementSettings.edit');
    Route::put('/FinancementSettings', [FinancementSettingsController::class, 'update'])->name('FinancementSettings.update');
    Route::get('/FinancementSettings', [FinancementSettingsController::class, 'index'])->name('FinancementSettings.index');
    Route::delete('/reprises/{id}', [RepriseVenteController::class, 'destroy'])->name('reprises.destroy');

    Route::get('/offres', [OffreController::class, 'index'])->name('offres.index');
    Route::get('/colors', [ColorController::class, 'index'])->name('colors.index');
    Route::get('/villes', [VilleController::class, 'index'])->name('villes.index');
    Route::get('/brands', [BrandsController::class, 'index'])->name('brands.index');
    Route::get('/annonces', [AnnoncesController::class, 'index'])->name('annonces.index');
    Route::get('/models', [ModelsController::class, 'index'])->name('models.index');
    Route::get('/autoenchere', [AutoEnchereController::class, 'index'])->name('autoenchere.index');
    Route::get('/nadoautoencherebid', [AutoEnchereController::class, 'index'])->name('nadoautoencherebid.index');
    Route::get('/admin/nadoautoencherebid/export', [NadoAutoEnchereBidController::class, 'export'])
        ->name('admin.nadoautoencherebid.export');


    Route::get('clients', [ClientController::class, 'index'])->name('clients.index');
    Route::get('clients/approval', [ClientController::class, 'approval'])->name('clients.approval');
    Route::post('clients/{id}/approve', [ClientController::class, 'approve'])->name('clients.approve');
    Route::delete('clients/{id}', [ClientController::class, 'destroy'])->name('clients.destroy');
    Route::get('entretiens', [EntretienController::class, 'index'])->name('entretiens.index');
    Route::get('entretiens/create/{annonce}', [EntretienController::class, 'create'])->name('entretiens.create');

    Route::post('entretiens/create/{annonce}', [\App\Http\Controllers\Admin\EntretienController::class, 'create'])->name('entretiens.create');
});
Route::post('/admin/annonces/toggle-homepage', [App\Http\Controllers\Admin\AnnoncesController::class, 'toggleHomepage'])
    ->name('admin.annonces.toggleHomepage');
// ⬇️ place this before the resource
Route::get('/achat/models-by-brand/{brandId}', [BuyController::class, 'getModelsByBrand'])
    ->name('achat.models.by.brand');

// then the resource route
Route::resource('/achat', BuyController::class);

// 🟢 Admin Protected Routes
Route::prefix('admin')->name('admin.')->middleware('auth:admin')->group(function () {
    Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])->name('logout');
    Route::resource('annonces', AnnoncesController::class);
    Route::resource('ville', VilleController::class); // <-- this line
    Route::resource('entretiens', EntretienController::class); // <-- this line
    Route::get('/FinancementSettings', [FinancementSettingsController::class, 'index'])->name('FinancementSettings.index');
    Route::put('/FinancementSettings', [FinancementSettingsController::class, 'update'])->name('FinancementSettings.update');
    Route::resource('nadoautoenchere', \App\Http\Controllers\Admin\AdminNadoAutoEnchereController::class);

    Route::resource('videoads', VideoAdsController::class); // <-- this line
    Route::resource('imgslider', ImgSlideController::class); // <-- this line
    Route::resource('models', ModelsController::class); // <-- this line
    Route::resource('avistext', AvisTextController::class); // <-- this line
    Route::resource('avis-vd', AvisVdController::class); // <-- this line
    Route::resource('offres', OffreController::class); // <-- this line
    Route::get('admin/autoenchere/{id}', [AutoEnchereController::class, 'show'])->name('admin.autoenchere.show');
    Route::get('publications/', [PublicationController::class, 'index'])->name('publications.index');
    Route::get('publications/create', [PublicationController::class, 'create'])->name('publications.create');
    Route::post('publications/', [PublicationController::class, 'store'])->name('publications.store');
    Route::get('publications/{publication}/edit', [PublicationController::class, 'edit'])->name('publications.edit');

    Route::get('colors/edit', [ColorController::class, 'edit'])->name('colors.edit');
    Route::put('publications/{publication}', [PublicationController::class, 'update'])->name('publications.update');
    Route::delete('publications/{publication}', [PublicationController::class, 'destroy'])->name('publications.destroy');
    Route::post('publications/reorder', [PublicationController::class, 'reorder'])->name('publications.reorder');
    Route::resource('autoenchere', AutoEnchereController::class);
    Route::resource('nadoautoencherebid', NadoAutoEnchereBidController::class);

    Route::get('clients', [ClientController::class, 'index'])->name('clients.index');
    Route::get('clients/create', [ClientController::class, 'create'])->name('clients.create');
    Route::get('clients/store', [ClientController::class, 'store'])->name('clients.store');
    Route::resource('clients', \App\Http\Controllers\Admin\ClientController::class)->except(['edit', 'update']);

    Route::get('entretiens/create/{annonce}', [EntretienController::class, 'create'])->name('entretiens.create');
    Route::get('entretiens', [\App\Http\Controllers\Admin\EntretienController::class, 'index'])->name('entretiens.index');
    Route::get('/clients/{id}', [ClientController::class, 'show'])->name('clients.show');
    Route::get('annonces/approval', [AnnoncesController::class, 'approval'])->name('annonces.approval');
    Route::patch('annonces/{id}/approve', [AnnoncesController::class, 'approve'])->name('annonces.approve');
    Route::get('clients/approval', [ClientController::class, 'approval'])->name('clients.approval');
    Route::post('clients/{id}/approve', [ClientController::class, 'approve'])->name('clients.approve');
    Route::delete('clients/{id}', [ClientController::class, 'destroy'])->name('clients.destroy');

    Route::get('/clients/{id}/verify', [ClientController::class, 'verify'])
        ->name('clients.verify');


    Route::patch('/clients/{client}/verify', [ClientController::class, 'toggleVerification'])
        ->name('admin.clients.toggleVerification');




    Route::get('/dashboard', function () {
        return view('admin.dashboard');
    })->name('dashboard');

    // all your admin resources go here:
    Route::post('/annonces/{id}/verify', [AnnoncesController::class, 'verify'])->name('annonces.verify');
    Route::resource('annonces', AnnoncesController::class);
    Route::resource('avis-text', AvisTextController::class);
    Route::resource('avis-vd', AvisVdController::class);
    Route::resource('brands', BrandsController::class);
    Route::resource('stories', StoriesController::class);
    Route::resource('colors', ColorController::class);
    Route::resource('finances', FinanceController::class);
    // Route::resource('FinancementSettings', FinancementSettingsController::class);

    Route::resource('img-slides', ImgSlideController::class);
    Route::resource('models', ModelsController::class);
    Route::resource('offres', OffreController::class);
    Route::resource('reprises', RepriseVenteController::class);
    Route::resource('users', UserController::class);
    Route::resource('ventes', VenteAdminController::class);
    Route::resource('video-ads', VideoAdsController::class);
    Route::resource('villes', VilleController::class);
    Route::get('/admin/users', [UserController::class, 'index'])->name('users.index');

    Route::get('/clients/{id}/verify', [ClientController::class, 'verify'])
        ->name('clients.verify');
    Route::get('client-approvals', [ClientApprovalController::class, 'index'])->name('client.approvals');
    Route::post('client-approve/{id}', [ClientApprovalController::class, 'approve'])->name('client.approve');
});
Route::get('/fix-symlink', function () {
    // 1. The source of the images
    $target = storage_path('app/public');

    // 2. The destination (Your public_html folder)
    $link = base_path('public_html/storage');

    // Check if a wrong folder already exists there
    if (file_exists($link)) {
        return "Error: A 'storage' folder already exists in public_html. <br>Please Go to FTP > public_html and DELETE the 'storage' folder, then refresh this page.";
    }

    // Create the link
    try {
        symlink($target, $link);
        return "✅ Success! Symlink created inside public_html.";
    } catch (\Exception $e) {
        return "Error: " . $e->getMessage();
    }
});
