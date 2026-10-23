@extends('layouts.app')

@section('title', 'NADO - Vendre ma voiture')

@section('link')
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        /* --- CSS VARIABLES & RESET --- */
        :root {
            --primary: #1459DD;
            --primary-hover: #0f46b1;
            --accent: #FDD817;
            --bg-slate: #f8fafc;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --border-light: #e2e8f0;
            --white: #ffffff;
            --shadow: 0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1);
        }

        .vente-page * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', -apple-system, sans-serif;
        }

        .vente-page {
            background-color: var(--bg-slate);
            color: var(--text-main);
            line-height: 1.5;
            overflow-x: hidden;
            padding-bottom: 60px;
        }

        .vente-page button {
            cursor: pointer;
            border: none;
            background: none;
            transition: all 0.2s ease;
        }

        .vente-page input,
        .vente-page select {
            transition: all 0.2s ease;
        }

        /* --- LAYOUT --- */
        .vente-container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .text-center {
            text-align: center;
        }

        /* --- BREADCRUMBS --- */
        .breadcrumbs {
            background: var(--white);
            border-bottom: 1px solid var(--border-light);
            padding: 12px 0;
            margin-bottom: 50px;
        }

        .breadcrumb-nav {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 10px;
            font-weight: 900;
            text-transform: uppercase;
            color: var(--text-muted);
            letter-spacing: 1px;
        }

        /* --- HEADER --- */
        .badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 6px 14px;
            background: var(--accent);
            border-radius: 50px;
            font-weight: 900;
            font-size: 10px;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 24px;
            color: var(--text-main);
        }

        .main-title {
            font-size: 3.5rem;
            font-weight: 900;
            text-transform: uppercase;
            letter-spacing: -2px;
            line-height: 0.9;
            margin-bottom: 20px;
        }

        .main-title span {
            color: var(--primary);
        }

        .subtitle {
            color: var(--text-muted);
            max-width: 450px;
            margin: 0 auto 50px;
            font-weight: 500;
        }

        /* --- STEPPER --- */
        .stepper {
            display: flex;
            align-items: center;
            justify-content: space-between;
            max-width: 600px;
            margin: 0 auto 50px;
            position: relative;
        }

        .step-node {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 8px;
            z-index: 10;
            flex: 1;
        }

        .step-circle {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--white);
            border: 1px solid var(--border-light);
            color: #cbd5e1;
            transition: 0.5s;
        }

        .step-label {
            font-size: 9px;
            font-weight: 900;
            text-transform: uppercase;
            color: #cbd5e1;
            letter-spacing: 1px;
        }

        .step-line {
            position: absolute;
            top: 20px;
            left: 10%;
            right: 10%;
            background: var(--border-light);
            height: 1px;
            z-index: 1;
        }

        .step-progress {
            position: absolute;
            top: 20px;
            left: 10%;
            width: 0%;
            height: 2px;
            background: var(--primary);
            z-index: 2;
            transition: width 0.5s ease;
        }

        .step-node.active .step-circle {
            background: var(--primary);
            color: var(--white);
            border-color: var(--primary);
            box-shadow: 0 10px 15px -3px rgba(20, 89, 221, 0.3);
        }

        .step-node.active .step-label {
            color: var(--text-main);
        }

        /* --- FORM CARD --- */
        .form-card {
            background: var(--white);
            border-radius: 50px;
            border: 1px solid #f1f5f9;
            padding: 60px;
            box-shadow: 0 25px 50px -12px rgba(20, 89, 221, 0.05);
            margin-bottom: 100px;
        }

        .step-content {
            display: none;
            animation: slideUp 0.5s ease;
        }

        .step-content.active {
            display: block;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 24px;
            margin-bottom: 40px;
        }

        .images-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 40px;
        }

        @media (max-width: 1024px) {
            .images-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 640px) {
            .images-grid {
                grid-template-columns: 1fr;
            }
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
            text-align: left;
        }

        .form-group label {
            font-size: 10px;
            font-weight: 900;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 1.5px;
            margin-left: 15px;
        }

        .input-style {
            background: var(--bg-slate);
            border: 2px solid transparent;
            border-radius: 18px;
            padding: 16px 24px;
            font-weight: 700;
            outline: none;
            width: 100%;
        }

        .input-style:focus {
            border-color: var(--primary);
            background: var(--white);
        }

        .input-style.error {
            border-color: #ef4444;
        }

        /* --- IMAGE UPLOADS --- */
        .upload-box {
            height: 160px;
            background: var(--bg-slate);
            border: 2px dashed #e2e8f0;
            border-radius: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 12px;
            color: var(--text-muted);
            cursor: pointer;
            transition: all 0.2s;
        }

        .upload-box:hover {
            background: #eff6ff;
            border-color: rgba(20, 89, 221, 0.3);
            color: var(--primary);
        }

        .upload-text {
            font-size: 9px;
            font-weight: 900;
            text-transform: uppercase;
        }

        .upload-box.has-file {
            border-color: #22c55e;
            background: #f0fdf4;
            color: #22c55e;
        }

        /* --- PACK CARDS --- */
        .packs-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 24px;
            margin: 40px 0;
        }

        .pack-card {
            border: 2px solid #f1f5f9;
            border-radius: 40px;
            padding: 40px;
            text-align: left;
            position: relative;
            transition: 0.3s;
            cursor: pointer;
            display: flex;
            flex-direction: column;
        }

        .pack-card.selected {
            border-color: var(--primary);
            background: #f0f7ff;
            transform: scale(1.03);
            z-index: 5;
            box-shadow: var(--shadow);
        }

        .pack-card .recommended {
            position: absolute;
            top: -15px;
            left: 50%;
            transform: translateX(-50%);
            background: var(--primary);
            color: white;
            padding: 4px 16px;
            border-radius: 20px;
            font-size: 10px;
            font-weight: 900;
            text-transform: uppercase;
        }

        .pack-title {
            font-size: 20px;
            font-weight: 900;
            text-transform: uppercase;
            margin-bottom: 10px;
        }

        .pack-price {
            font-size: 32px;
            font-weight: 900;
            margin-bottom: 24px;
        }

        .pack-price span {
            font-size: 12px;
            color: var(--text-muted);
        }

        .feature-list {
            list-style: none;
            margin-bottom: 30px;
            flex-grow: 1;
            padding: 0;
        }

        .feature-item {
            display: flex;
            gap: 10px;
            font-size: 12px;
            font-weight: 600;
            color: #475569;
            margin-bottom: 12px;
        }

        .feature-item i {
            color: #22c55e;
            flex-shrink: 0;
        }

        /* --- BUTTONS --- */
        .btn-primary {
            background: var(--primary) !important;
            color: white;
            padding: 18px 40px;
            border-radius: 20px;
            font-weight: 900;
            text-transform: uppercase;
            font-size: 11px;
            letter-spacing: 1.5px;
            box-shadow: 0 10px 20px rgba(20, 89, 221, 0.2);
            display: flex;
            align-items: center;
            gap: 10px;
            justify-content: center;
        }

        .btn-primary:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
        }

        .btn-outline {
            color: var(--text-muted);
            font-weight: 900;
            text-transform: uppercase;
            font-size: 11px;
            letter-spacing: 1.5px;
        }

        .btn-outline:hover {
            color: var(--text-main);
        }

        /* --- SUCCESS MODAL --- */
        .modal-overlay {
            position: fixed;
            inset: 0;
            background: rgba(15, 23, 42, 0.9);
            backdrop-filter: blur(10px);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 1000;
            padding: 20px;
        }

        .modal-card {
            background: var(--white);
            padding: 50px;
            border-radius: 60px;
            max-width: 500px;
            width: 100%;
            text-align: center;
            position: relative;
        }

        .success-icon {
            width: 80px;
            height: 80px;
            background: #f0fdf4;
            color: #22c55e;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 30px;
        }

        /* --- UTILS --- */
        .hidden {
            display: none;
        }

        .flex-between {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* --- ALERT --- */
        .alert-success-custom {
            background: #dcfce7;
            color: #166534;
            padding: 16px 24px;
            border-radius: 18px;
            margin-bottom: 30px;
            font-weight: 600;
        }

        @media (max-width: 768px) {
            .main-title {
                font-size: 2.5rem;
            }

            .form-card {
                padding: 30px;
                border-radius: 30px;
            }
        }
    </style>
@endsection

@section('content')
    <div class="vente-page">
        <div class="breadcrumbs">
            <div class="vente-container">
                <nav class="breadcrumb-nav">
                    <a href="{{ route('index') }}" style="text-decoration: none; color: inherit;">Accueil</a>
                    <i data-lucide="chevron-right" style="width: 10px;"></i>
                    <span style="color: var(--text-main)">Vendre ma voiture</span>
                </nav>
            </div>
        </div>

        <div class="vente-container text-center">
            @if (session('success'))
                <div class="alert-success-custom">{{ session('success') }}</div>
            @endif

            <div class="badge">
                <i data-lucide="zap" style="width: 14px; fill: currentColor;"></i> Vendez au meilleur prix
            </div>
            <h1 class="main-title">Déposez votre <br><span>Annonce</span></h1>
            <p class="subtitle">Plus de 200,000 acheteurs potentiels consultent NADO chaque mois. Profitez de notre
                expertise.</p>

            <div class="stepper">
                <div class="step-line"></div>
                <div id="progress-bar" class="step-progress"></div>

                <div class="step-node active" data-step="1">
                    <div class="step-circle"><i data-lucide="car-front" style="width: 16px;"></i></div>
                    <span class="step-label">Véhicule</span>
                </div>
                <div class="step-node" data-step="2">
                    <div class="step-circle"><i data-lucide="settings-2" style="width: 16px;"></i></div>
                    <span class="step-label">Détails</span>
                </div>
                <div class="step-node" data-step="3">
                    <div class="step-circle"><i data-lucide="user" style="width: 16px;"></i></div>
                    <span class="step-label">Profil</span>
                </div>
                <div class="step-node" data-step="4">
                    <div class="step-circle"><i data-lucide="clock" style="width: 16px;"></i></div>
                    <span class="step-label">RDV</span>
                </div>
            </div>

            <form action="{{ route('vente.store') }}" method="POST" enctype="multipart/form-data" id="vente-form">
                @csrf
                <input type="hidden" name="jeveux" id="jeveux-hidden" value="vendre ma voiture">
                <input type="hidden" name="mode" id="mode-hidden" value="">

                <div class="form-card">

                    <!-- STEP 1: Vehicle Identity -->
                    <div id="step-1" class="step-content active">
                        <h2
                            style="font-size: 24px; font-weight: 900; text-transform: uppercase; margin-bottom: 30px; text-align: left;">
                            1. Identité de votre véhicule</h2>
                        <div class="form-grid">
                            <div class="form-group">
                                <label>Marque</label>
                                <select class="input-style" name="mark" id="mark" required>
                                    <option value="">Choisir</option>
                                    @foreach ($brands as $brand)
                                        <option value="{{ $brand->name }}" data-id="{{ $brand->id }}">
                                            {{ $brand->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Modèle</label>
                                <select class="input-style" name="modele" id="modele" required>
                                    <option value="">Sélectionnez une marque d'abord</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Année</label>
                                <select class="input-style" name="year" id="year" required>
                                    <option value="">Année</option>
                                    @for ($i = date('Y'); $i >= 1992; $i--)
                                        <option value="{{ $i }}">{{ $i }}</option>
                                    @endfor
                                </select>
                            </div>
                        </div>
                        <h3 style="font-size: 16px; font-weight: 800; text-transform: uppercase; margin: 30px 0 20px; color: var(--text-muted);">Photos du véhicule (8 photos)</h3>
                        <div class="images-grid">
                            <!-- Row 1 -->
                            <div class="upload-box" id="upload-avant" onclick="document.getElementById('img_avant').click()">
                                <i data-lucide="camera"></i>
                                <span class="upload-text" id="label-avant">Avant</span>
                                <input type="file" name="img_avant" id="img_avant" style="display:none" onchange="handleFileSelect(this, 'upload-avant', 'label-avant')" required>
                            </div>
                            <div class="upload-box" id="upload-arriere" onclick="document.getElementById('img_derriere').click()">
                                <i data-lucide="camera"></i>
                                <span class="upload-text" id="label-arriere">Arrière</span>
                                <input type="file" name="img_derriere" id="img_derriere" style="display:none" onchange="handleFileSelect(this, 'upload-arriere', 'label-arriere')" required>
                            </div>
                            <div class="upload-box" id="upload-gauche" onclick="document.getElementById('img_gauche').click()">
                                <i data-lucide="camera"></i>
                                <span class="upload-text" id="label-gauche">Côté Gauche</span>
                                <input type="file" name="img_gauche" id="img_gauche" style="display:none" onchange="handleFileSelect(this, 'upload-gauche', 'label-gauche')">
                            </div>
                            <div class="upload-box" id="upload-droite" onclick="document.getElementById('img_droite').click()">
                                <i data-lucide="camera"></i>
                                <span class="upload-text" id="label-droite">Côté Droit</span>
                                <input type="file" name="img_droite" id="img_droite" style="display:none" onchange="handleFileSelect(this, 'upload-droite', 'label-droite')">
                            </div>

                            <!-- Row 2 -->
                            <div class="upload-box" id="upload-interieur" onclick="document.getElementById('img_interieur').click()">
                                <i data-lucide="camera"></i>
                                <span class="upload-text" id="label-interieur">Intérieur</span>
                                <input type="file" name="img_interieur" id="img_interieur" style="display:none" onchange="handleFileSelect(this, 'upload-interieur', 'label-interieur')">
                            </div>
                            <div class="upload-box" id="upload-tableau" onclick="document.getElementById('img_tableau').click()">
                                <i data-lucide="camera"></i>
                                <span class="upload-text" id="label-tableau">Tableau de bord</span>
                                <input type="file" name="img_tableau" id="img_tableau" style="display:none" onchange="handleFileSelect(this, 'upload-tableau', 'label-tableau')">
                            </div>
                            <div class="upload-box" id="upload-moteur" onclick="document.getElementById('img_moteur').click()">
                                <i data-lucide="camera"></i>
                                <span class="upload-text" id="label-moteur">Moteur</span>
                                <input type="file" name="img_moteur" id="img_moteur" style="display:none" onchange="handleFileSelect(this, 'upload-moteur', 'label-moteur')">
                            </div>
                            <div class="upload-box" id="upload-grise" onclick="document.getElementById('img_cartegrise').click()">
                                <i data-lucide="file-text"></i>
                                <span class="upload-text" id="label-grise">Carte Grise</span>
                                <input type="file" name="img_cartegrise" id="img_cartegrise" style="display:none" onchange="handleFileSelect(this, 'upload-grise', 'label-grise')" required>
                            </div>
                        </div>
                    </div>

                    <!-- STEP 2: Technical Details -->
                    <div id="step-2" class="step-content">
                        <h2
                            style="font-size: 24px; font-weight: 900; text-transform: uppercase; margin-bottom: 30px; text-align: left;">
                            2. Fiche technique</h2>
                        <div class="form-grid">
                            <div class="form-group">
                                <label>Kilométrage</label>
                                <input type="number" name="km" id="km" placeholder="Ex: 45000"
                                    class="input-style" required>
                            </div>
                            <div class="form-group">
                                <label>Carburant</label>
                                <select class="input-style" name="carburant" id="carburant" required>
                                    <option value="">Choisir</option>
                                    <option value="essence">Essence</option>
                                    <option value="diesel">Diesel</option>
                                    <option value="electrique">Electrique</option>
                                    <option value="hybride">Hybride</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Boite de vitesses</label>
                                <select class="input-style" name="box" id="box" required>
                                    <option value="">Choisir</option>
                                    <option value="manuelle">Manuelle</option>
                                    <option value="automatique">Automatique</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-grid">
                            <div class="form-group">
                                <label>Etat du véhicule</label>
                                <select class="input-style" name="etat" id="etat" required>
                                    <option value="">Choisir</option>
                                    <option value="excellent">Excellent</option>
                                    <option value="très bon">Très bon</option>
                                    <option value="bon">Bon</option>
                                    <option value="correct">Correct</option>
                                    <option value="endommagé">Endommagé</option>
                                    <option value="neuf">Neuf</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Type</label>
                                <select class="input-style" name="type" id="type" required>
                                    <option value="">Choisir</option>
                                    <option value="occasion">Occasion</option>
                                    <option value="neuf">Neuf</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Origine</label>
                                <select class="input-style" name="origine" id="origine" required>
                                    <option value="">Choisir</option>
                                    <option value="dédouané">Dédouané</option>
                                    <option value="WWW au Maroc">WWW au Maroc</option>
                                    <option value="importé neuf">Importé neuf</option>
                                    <option value="pas encore dédouané">Pas encore dédouané</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- STEP 3: Personal Info -->
                    <div id="step-3" class="step-content">
                        <h2
                            style="font-size: 24px; font-weight: 900; text-transform: uppercase; margin-bottom: 30px; text-align: left;">
                            3. Coordonnées</h2>
                        <div class="form-grid">
                            <div class="form-group">
                                <label>Nom Complet</label>
                                <input type="text" name="name" id="name" placeholder="Votre nom"
                                    class="input-style" required>
                            </div>
                            <div class="form-group">
                                <label>Téléphone</label>
                                <input type="tel" name="phone" id="phone" placeholder="+212..."
                                    class="input-style" required>
                            </div>
                            <div class="form-group">
                                <label>Ville</label>
                                <select class="input-style" name="city" id="city" required>
                                    <option value="">Choisir</option>
                                    @foreach ($city as $c)
                                        <option value="{{ $c->name }}">{{ $c->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- STEP 4: Pack Selection -->
                    <div id="step-4" class="step-content">
                        <h2
                            style="font-size: 24px; font-weight: 900; text-transform: uppercase; margin-bottom: 30px; text-align: center;">
                            4. Choisissez votre offre</h2>
                        <div class="packs-grid" id="packs-list">
                            <!-- Packs rendered via JS -->
                        </div>

                        <div id="appointment-box" class="hidden"
                            style="margin-top: 50px; padding: 40px; background: var(--bg-slate); border-radius: 40px; text-align: left;">
                            <h3 style="font-weight: 900; text-transform: uppercase; margin-bottom: 20px;">Planifiez
                                l'expertise</h3>
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>Date</label>
                                    <input type="date" name="rendezvous" id="apt-date" class="input-style"
                                        min="{{ date('Y-m-d') }}" required>
                                </div>
                                <div class="form-group">
                                    <label>Heure</label>
                                    <select id="apt-time" class="input-style">
                                        <option>09:00</option>
                                        <option>10:00</option>
                                        <option>11:00</option>
                                        <option>14:00</option>
                                        <option>15:00</option>
                                        <option>16:00</option>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn-primary" style="width: 100%; margin-top: 20px;">Confirmer
                                le rendez-vous</button>
                        </div>
                    </div>

                    <div class="flex-between" style="margin-top: 40px; padding-top: 30px; border-top: 1px solid #f1f5f9;">
                        <button type="button" id="prev-btn" onclick="moveStep(-1)"
                            class="btn-outline hidden">Précédent</button>
                        <div style="flex: 1"></div>
                        <button type="button" id="next-btn" onclick="moveStep(1)" class="btn-primary">Suivant <i
                                data-lucide="arrow-right" style="width: 16px;"></i></button>
                    </div>
                </div>
            </form>
        </div>

        <div id="success-modal" class="modal-overlay">
            <div class="modal-card">
                <div class="success-icon"><i data-lucide="sparkles" style="width: 40px;"></i></div>
                <h2 style="font-size: 32px; font-weight: 900; text-transform: uppercase; margin-bottom: 10px;">C'est
                    confirmé !</h2>
                <p style="color: var(--text-muted); margin-bottom: 30px;">Votre rendez-vous d'expertise a été enregistré
                    avec succès.</p>
                <a href="{{ route('index') }}" class="btn-primary" style="width: 100%; text-decoration: none;">Retour à
                    l'accueil</a>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // --- STATE ---
        let currentStep = 1;
        let selectedPack = null;

        const packs = [{
                id: 'Pack Distance',
                title: 'Pack Distance',
                price: '199',
                features: ['Service à distance', 'Diffusion NADO & Avito', 'Assistance base']
            },
            {
                id: 'Pack Showroom',
                title: 'Pack Showroom',
                price: '499',
                recommended: true,
                features: ['Service local', 'Vidéo YouTube Pro', 'Expertise Complète', 'Badge Garantie']
            },
            {
                id: 'Pack Express',
                title: 'Pack Express',
                price: '299',
                features: ['Service mobilité', 'Contrôle général', 'Accompagnement RDV']
            }
        ];

        // --- INIT ---
        $(document).ready(function() {
            lucide.createIcons();
            renderPacks();

            // Brand change -> load models via AJAX
            $('#mark').on('change', function() {
                let brandId = $(this).find(':selected').data('id');
                let $modele = $('#modele');
                $modele.empty().append('<option value="">Chargement...</option>');

                if (brandId) {
                    $.ajax({
                        url: "{{ route('get.models') }}",
                        type: "GET",
                        data: {
                            brand_id: brandId
                        },
                        success: function(data) {
                            $modele.empty().append(
                                '<option value="">Sélectionnez le modèle</option>');
                            $.each(data, function(key, value) {
                                $modele.append('<option value="' + value.name + '">' +
                                    value.name + '</option>');
                            });
                        },
                        error: function() {
                            $modele.empty().append(
                                '<option value="">Erreur de chargement</option>');
                        }
                    });
                } else {
                    $modele.empty().append('<option value="">Sélectionnez une marque d\'abord</option>');
                }
            });
        });

        // --- FILE UPLOAD HANDLER ---
        function handleFileSelect(input, boxId, labelId) {
            if (input.files && input.files[0]) {
                document.getElementById(boxId).classList.add('has-file');
                document.getElementById(labelId).textContent = input.files[0].name.substring(0, 20) + '...';
            }
        }

        // --- STEP NAVIGATION ---
        function moveStep(delta) {
            // Validate current step before moving forward
            if (delta > 0 && !validateStep(currentStep)) {
                return;
            }

            const nextStep = currentStep + delta;
            if (nextStep < 1 || nextStep > 4) return;

            // Hide current, show next
            document.getElementById(`step-${currentStep}`).classList.remove('active');
            currentStep = nextStep;
            document.getElementById(`step-${currentStep}`).classList.add('active');

            updateUI();
        }

        function validateStep(step) {
            let valid = true;
            const container = document.getElementById(`step-${step}`);

            container.querySelectorAll('input[required], select[required]').forEach(el => {
                if (!el.value) {
                    el.classList.add('error');
                    valid = false;
                } else {
                    el.classList.remove('error');
                }
            });

            if (!valid) {
                alert('Veuillez remplir tous les champs obligatoires.');
            }
            return valid;
        }

        function updateUI() {
            // Update Stepper
            document.querySelectorAll('.step-node').forEach(node => {
                const step = parseInt(node.dataset.step);
                node.classList.toggle('active', step <= currentStep);
            });

            // Progress Bar
            const progress = ((currentStep - 1) / 3) * 80;
            document.getElementById('progress-bar').style.width = `${progress}%`;

            // Buttons
            document.getElementById('prev-btn').classList.toggle('hidden', currentStep === 1);
            document.getElementById('next-btn').classList.toggle('hidden', currentStep === 4);

            window.scrollTo({
                top: 200,
                behavior: 'smooth'
            });
        }

        // --- PACKS LOGIC ---
        function renderPacks() {
            const container = document.getElementById('packs-list');
            container.innerHTML = packs.map(p => `
            <div class="pack-card ${selectedPack === p.id ? 'selected' : ''}" onclick="handlePackSelect('${p.id}')">
                ${p.recommended ? '<div class="recommended">Meilleur Choix</div>' : ''}
                <h3 class="pack-title">${p.title}</h3>
                <div class="pack-price">${p.price} <span>DH</span></div>
                <ul class="feature-list">
                    ${p.features.map(f => `<li class="feature-item"><i data-lucide="check-circle-2" style="width: 14px;"></i> ${f}</li>`).join('')}
                </ul>
                <button type="button" class="btn-primary" style="width: 100%; background: ${selectedPack === p.id ? 'var(--primary)' : 'var(--text-main)'}">
                    ${selectedPack === p.id ? 'Sélectionné' : 'Choisir'}
                </button>
            </div>
        `).join('');
            lucide.createIcons();
        }

        function handlePackSelect(id) {
            selectedPack = id;
            document.getElementById('mode-hidden').value = id;
            renderPacks();
            document.getElementById('appointment-box').classList.remove('hidden');
            setTimeout(() => {
                document.getElementById('appointment-box').scrollIntoView({
                    behavior: 'smooth',
                    block: 'center'
                });
            }, 100);
        }
    </script>
@endsection
