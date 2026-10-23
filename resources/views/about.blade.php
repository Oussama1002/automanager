@extends('layouts.app')

@section('title', "L'Univers AUTOMANAGER — À Propos")

@section('link')
<script src="https://unpkg.com/lucide@latest"></script>
<style>
/* ============================================================
   À PROPOS / L'UNIVERS AUTOMANAGER
   #0E0F12 blue · #C8A24B yellow · #0F172A dark
============================================================ */
:root {
    --ap-blue   : #0E0F12;
    --ap-yellow : #C8A24B;
    --ap-dark   : #0F172A;
    --ap-bg     : #fcfcfd;
    --ap-slate  : #0f172a;
    --ap-muted  : #64748b;
    --ap-muted2 : #94a3b8;
    --ap-border : #e2e8f0;
    --ap-border2: #f1f5f9;
    --ap-white  : #ffffff;
    --ap-slate50: #f8fafc;
}

.ap-page { font-family: 'Inter', -apple-system, sans-serif; background: var(--ap-bg); min-height: 100vh; color: var(--ap-slate); overflow-x: hidden; font-size: 18px; }
.ap-page *, .ap-page *::before, .ap-page *::after { box-sizing: border-box; }
::selection { background: var(--ap-yellow); color: var(--ap-slate); }

/* ── WIDTH UTIL ── */
.ap-wrap { max-width: 1280px; margin: 0 auto; padding: 0 24px; }

/* ── SECTION SPACING ── */
.ap-section { padding: 96px 0; }

/* ═══════════════════════════════════════════════════════════
   1. HERO
═══════════════════════════════════════════════════════════ */
.ap-hero {
    position: relative;
    height: 80vh; min-height: 560px;
    display: flex; align-items: center; justify-content: center;
    overflow: hidden;
    background: var(--ap-white);
}
.ap-hero-slab {
    position: absolute; top: 0; right: 0;
    width: 33%; height: 100%;
    background: rgba(20, 89, 221, 0.05);
    transform: skewX(-15deg) translateX(8rem);
    pointer-events: none;
}
.ap-hero-grid {
    width: 100%; position: relative; z-index: 10;
    display: grid; grid-template-columns: 1fr;
    gap: 48px; align-items: center;
}
@media (min-width: 1024px) { .ap-hero-grid { grid-template-columns: 1fr 1fr; } }

.ap-hero-eyebrow {
    display: inline-flex; align-items: center; gap: 8px;
    padding: 6px 14px; background: #FAF6EC; color: var(--ap-blue);
    border-radius: 9999px; margin-bottom: 24px;
    font-size: 10px; font-weight: 900; text-transform: uppercase; letter-spacing: .12em;
}
.ap-hero-eyebrow .pulse-dot {
    width: 8px; height: 8px; border-radius: 50%; background: var(--ap-blue);
    animation: apPulse 1.5s ease-in-out infinite;
}
@keyframes apPulse { 0%,100% { opacity:1; transform:scale(1); } 50% { opacity:.5; transform:scale(.8); } }

.ap-h1 {
    font-size: clamp(3rem, 8vw, 6.5rem);
    font-weight: 900; text-transform: uppercase;
    letter-spacing: -.04em; line-height: .88;
    margin-bottom: 32px;
}
.ap-h1-accent { color: var(--ap-blue); display: block; }

.ap-hero-lead {
    font-size: 1.35rem; color: var(--ap-muted); font-weight: 500;
    max-width: 520px; line-height: 1.7;
    margin-bottom: 0;
    border-left: 4px solid var(--ap-yellow);
    padding-left: 24px;
}

/* Phone mock */
.ap-phone-col { display: none; justify-content: center; }
@media (min-width: 1024px) { .ap-phone-col { display: flex; } }

.ap-phone {
    position: relative;
    width: 300px; aspect-ratio: 9/16;
    background: #e2e8f0; border-radius: 3rem; overflow: hidden;
    box-shadow: 0 25px 50px -12px rgba(0,0,0,.25);
    border: 8px solid white;
    transform: rotate(3deg);
    transition: transform .4s ease;
}
.ap-phone:hover { transform: rotate(0deg) scale(1.02); }
.ap-phone img { width: 100%; height: 100%; object-fit: cover; display: block; }
.ap-phone-overlay {
    position: absolute; inset: 0;
    background: rgba(0,0,0,.2);
    display: flex; align-items: center; justify-content: center;
}

/* ═══════════════════════════════════════════════════════════
   2. HISTOIRE
═══════════════════════════════════════════════════════════ */
.ap-histoire {
    padding: 96px 0; background: var(--ap-white);
    border-top: 1px solid var(--ap-border2);
}
.ap-hist-grid {
    display: grid; grid-template-columns: 1fr;
    gap: 64px; align-items: center;
}
@media (min-width: 1024px) { .ap-hist-grid { grid-template-columns: 5fr 7fr; } }

.ap-hist-eyebrow {
    display: block; font-size: 10px; font-weight: 900;
    text-transform: uppercase; letter-spacing: .5em;
    color: var(--ap-blue); margin-bottom: 16px;
}
.ap-hist-h2 {
    font-size: 2.5rem; font-weight: 900; text-transform: uppercase;
    letter-spacing: -.04em; line-height: 1; margin-bottom: 48px;
}
.ap-milestones { display: flex; flex-direction: column; gap: 36px; }
.ap-milestone { display: flex; gap: 24px; }
.ap-ms-year {
    font-size: 1.5rem; font-weight: 900; color: var(--ap-blue);
    opacity: .2; transition: opacity .3s; flex-shrink: 0; min-width: 60px;
    padding-top: 4px;
}
.ap-milestone:hover .ap-ms-year { opacity: 1; }
.ap-ms-title { font-size: 1.3rem; font-weight: 900; text-transform: uppercase; margin-bottom: 8px; }
.ap-ms-desc  { font-size: 1.05rem; color: var(--ap-muted); line-height: 1.7; }

.ap-hist-media {
    aspect-ratio: 16/9; background: #e2e8f0;
    border-radius: 3rem; overflow: hidden;
    position: relative; box-shadow: 0 20px 40px -8px rgba(0,0,0,.12);
}
.ap-hist-media img {
    width: 100%; height: 100%; object-fit: cover; display: block;
    filter: grayscale(1);
}
.ap-hist-media-overlay {
    position: absolute; inset: 0;
    background: linear-gradient(to top, rgba(15,23,42,.6) 0%, transparent 100%);
}

/* ═══════════════════════════════════════════════════════════
   3. ÉCOSYSTÈME
═══════════════════════════════════════════════════════════ */
.ap-eco { padding: 96px 0; background: var(--ap-slate50); }
.ap-eco-h2 {
    font-size: 2.5rem; font-weight: 900; text-transform: uppercase;
    letter-spacing: -.04em; text-align: center; margin-bottom: 64px;
}
.ap-eco-h2 span { color: var(--ap-blue); }

.ap-eco-grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 24px;
}
@media (min-width: 768px)  { .ap-eco-grid { grid-template-columns: repeat(2, 1fr); } }
@media (min-width: 1024px) { .ap-eco-grid { grid-template-columns: repeat(3, 1fr); } }

.ap-svc-card {
    background: var(--ap-white); padding: 40px; border-radius: 2.5rem;
    border: 1px solid var(--ap-border2);
    transition: border-color .3s, box-shadow .3s, transform .3s;
    text-align: left; cursor: default;
}
.ap-svc-card:hover { border-color: var(--ap-blue); box-shadow: 0 20px 40px -8px rgba(20,89,221,.1); }

.ap-svc-icon {
    width: 56px; height: 56px;
    background: #FAF6EC; color: var(--ap-blue);
    border-radius: 1rem; display: flex; align-items: center; justify-content: center;
    margin-bottom: 32px;
    transition: background .3s, color .3s;
}
.ap-svc-card:hover .ap-svc-icon { background: var(--ap-blue); color: white; }

.ap-svc-title { font-size: 1.35rem; font-weight: 900; text-transform: uppercase; letter-spacing: -.01em; margin-bottom: 14px; }
.ap-svc-desc  { font-size: 1.05rem; color: var(--ap-muted); line-height: 1.7; }

/* ═══════════════════════════════════════════════════════════
   4. EXPERTISE BENTO
═══════════════════════════════════════════════════════════ */
.ap-expertise { padding: 96px 0; background: var(--ap-white); }
.ap-exp-h2 {
    font-size: 2.5rem; font-weight: 900; text-transform: uppercase;
    letter-spacing: -.04em; line-height: 1.05; margin-bottom: 64px;
}
.ap-bento-grid {
    display: grid; grid-template-columns: 1fr;
    gap: 24px;
}
@media (min-width: 768px)  { .ap-bento-grid { grid-template-columns: repeat(2, 1fr); } }
@media (min-width: 1024px) { .ap-bento-grid { grid-template-columns: repeat(4, 1fr); } }

.ap-bento-card {
    background: var(--ap-slate50); padding: 40px; border-radius: 2.5rem;
    border: 1px solid var(--ap-border2);
    transition: border-color .3s;
}
.ap-bento-card:hover { border-color: var(--ap-blue); }

.ap-bento-icon {
    width: 56px; height: 56px;
    background: var(--ap-white); color: var(--ap-blue);
    border-radius: 1rem; display: flex; align-items: center; justify-content: center;
    margin-bottom: 32px;
    box-shadow: 0 2px 8px rgba(0,0,0,.06);
}
.ap-bento-title { font-size: 1.2rem; font-weight: 900; text-transform: uppercase; margin-bottom: 12px; }
.ap-bento-desc  { font-size: 0.95rem; font-weight: 500; color: var(--ap-muted2); line-height: 1.65; }

/* ═══════════════════════════════════════════════════════════
   5. MUR SOCIAL
═══════════════════════════════════════════════════════════ */
.ap-social { padding: 96px 0; background: var(--ap-white); border-top: 1px solid var(--ap-border2); }

.ap-social-header {
    display: flex; flex-direction: column; gap: 32px;
    margin-bottom: 64px;
}
@media (min-width: 768px) { .ap-social-header { flex-direction: row; align-items: flex-end; justify-content: space-between; } }

.ap-social-h2 {
    font-size: 2.5rem; font-weight: 900; text-transform: uppercase;
    letter-spacing: -.04em;
}
.ap-social-h2 span { color: var(--ap-blue); }

.ap-filter-bar {
    display: flex; background: white; padding: 4px;
    border-radius: 1rem; border: 1px solid var(--ap-border);
}
.ap-filter-btn {
    padding: 10px 24px; border-radius: .75rem; border: none;
    font-size: 10px; font-weight: 900; text-transform: uppercase; letter-spacing: .12em;
    cursor: pointer; background: transparent; color: var(--ap-muted2);
    transition: background .2s, color .2s;
    font-family: 'Inter', sans-serif;
}
.ap-filter-btn.active { background: var(--ap-blue); color: white; }

.ap-social-grid {
    display: grid; grid-template-columns: 1fr;
    gap: 32px;
}
@media (min-width: 640px)  { .ap-social-grid { grid-template-columns: repeat(2, 1fr); } }
@media (min-width: 1024px) { .ap-social-grid { grid-template-columns: repeat(3, 1fr); } }

.ap-social-card {
    background: var(--ap-white); border-radius: 2.5rem; overflow: hidden;
    border: 1px solid var(--ap-border); transition: box-shadow .3s;
    text-align: left;
}
.ap-social-card:hover { box-shadow: 0 25px 50px -12px rgba(0,0,0,.12); }

.ap-sc-thumb { position: relative; aspect-ratio: 9/16; overflow: hidden; }
.ap-sc-thumb img { width: 100%; height: 100%; object-fit: cover; display: block; transition: transform .6s; }
.ap-social-card:hover .ap-sc-thumb img { transform: scale(1.05); }
.ap-sc-play {
    position: absolute; inset: 0;
    background: rgba(0,0,0,.2);
    display: flex; align-items: center; justify-content: center;
    opacity: 0; transition: opacity .3s;
}
.ap-social-card:hover .ap-sc-play { opacity: 1; }
.ap-sc-play i { color: white; }

.ap-sc-body { padding: 32px; }
.ap-sc-meta  { display: block; font-size: 11px; font-weight: 900; text-transform: uppercase; letter-spacing: .15em; color: var(--ap-blue); margin-bottom: 10px; }
.ap-sc-title { font-size: 1.3rem; font-weight: 900; text-transform: uppercase; letter-spacing: -.01em; line-height: 1.35; }

/* ═══════════════════════════════════════════════════════════
   6. TÉMOIGNAGES (dark)
═══════════════════════════════════════════════════════════ */
.ap-temoignages { padding: 96px 0; background: var(--ap-dark); color: white; }

.ap-tem-eyebrow {
    display: block; text-align: center;
    font-size: 10px; font-weight: 900; text-transform: uppercase; letter-spacing: .5em;
    color: var(--ap-yellow); margin-bottom: 16px;
}
.ap-tem-h2 {
    font-size: 2.5rem; font-weight: 900; text-transform: uppercase;
    letter-spacing: -.04em; text-align: center; margin-bottom: 64px;
}
.ap-tem-h2 span { color: var(--ap-blue); }

.ap-tem-grid {
    display: grid; grid-template-columns: 1fr;
    gap: 32px;
}
@media (min-width: 768px) { .ap-tem-grid { grid-template-columns: repeat(2, 1fr); } }

.ap-tem-card {
    background: rgba(255,255,255,.05); backdrop-filter: blur(12px);
    padding: 48px; border-radius: 3.5rem;
    border: 1px solid rgba(255,255,255,.1);
    position: relative; overflow: hidden;
}
.ap-tem-quote-deco {
    position: absolute; top: 32px; right: 48px;
    color: var(--ap-blue); opacity: .2;
}
.ap-tem-stars { display: flex; gap: 4px; color: var(--ap-yellow); margin-bottom: 32px; }
.ap-tem-text { font-size: 1.2rem; font-weight: 500; font-style: italic; line-height: 1.75; margin-bottom: 32px; }
.ap-tem-name { font-size: 1rem; font-weight: 900; text-transform: uppercase; margin-bottom: 6px; }
.ap-tem-role { font-size: 11px; font-weight: 700; text-transform: uppercase; color: var(--ap-blue); }

/* ═══════════════════════════════════════════════════════════
   7. FOOTER CTA
═══════════════════════════════════════════════════════════ */
.ap-footer-cta { padding: 96px 0; background: var(--ap-white); text-align: center; }
.ap-footer-h2 {
    font-size: clamp(2.5rem, 6vw, 4rem);
    font-weight: 900; text-transform: uppercase;
    letter-spacing: -.04em; margin-bottom: 48px;
}
.ap-footer-h2 span { color: var(--ap-blue); }

.ap-footer-btns { display: flex; justify-content: center; gap: 24px; flex-wrap: wrap; }
.ap-btn-primary {
    padding: 20px 48px;
    background: var(--ap-blue); color: white;
    border: none; border-radius: 1rem;
    font-size: 11px; font-weight: 900; text-transform: uppercase; letter-spacing: .2em;
    cursor: pointer; box-shadow: 0 20px 40px -8px rgba(20,89,221,.3);
    transition: background .2s; text-decoration: none; display: inline-flex; align-items: center; gap: 10px;
}
.ap-btn-primary:hover { background: #0f46b1; color: white; }
.ap-btn-secondary {
    padding: 20px 48px;
    background: transparent; color: var(--ap-muted2);
    border: 1px solid var(--ap-border); border-radius: 1rem;
    font-size: 11px; font-weight: 900; text-transform: uppercase; letter-spacing: .2em;
    cursor: pointer; transition: border-color .2s, color .2s; text-decoration: none; display: inline-flex; align-items: center; gap: 10px;
}
.ap-btn-secondary:hover { border-color: var(--ap-slate); color: var(--ap-slate); }
</style>
@endsection

@section('content')
<div class="ap-page">

    {{-- ════════════════════════════════════════════
         1. HERO
    ════════════════════════════════════════════ --}}
    <section class="ap-hero">
        <div class="ap-hero-slab"></div>

        <div class="ap-wrap ap-hero-grid">

            {{-- Left: text --}}
            <div>
                <div class="ap-hero-eyebrow">
                    <span class="pulse-dot"></span>
                    L'UNIVERS AUTOMANAGER EN DIRECT
                </div>

                <h1 class="ap-h1">
                    L'Auto<br>
                    <span class="ap-h1-accent">SANS FILTRES.</span>
                </h1>

                <p class="ap-hero-lead">
                    Depuis plus de 20 ans, AUTOMANAGER accompagne les Marocains dans
                    chaque étape de leur vie automobile — achat, vente, financement,
                    expertise. Une seule adresse de confiance.
                </p>
            </div>

            {{-- Right: phone mock --}}
            <div class="ap-phone-col">
                <div class="ap-phone">
                    <img src="https://images.unsplash.com/photo-1544636331-e26879cd4d9b?w=800&q=80"
                         alt="AUTOMANAGER — L'auto sans filtres" loading="lazy">
                    <div class="ap-phone-overlay">
                        <i data-lucide="play" style="width:40px;height:40px;fill:white;color:white;"></i>
                    </div>
                </div>
            </div>

        </div>
    </section>

    {{-- ════════════════════════════════════════════
         2. NOTRE HÉRITAGE — timeline + image
    ════════════════════════════════════════════ --}}
    <section class="ap-histoire">
        <div class="ap-wrap">
            <div class="ap-hist-grid">

                {{-- Left: milestones --}}
                <div>
                    <span class="ap-hist-eyebrow">Notre Héritage</span>
                    <h2 class="ap-hist-h2">Depuis 2005.</h2>

                    <div class="ap-milestones">
                        <div class="ap-milestone">
                            <div class="ap-ms-year">2005</div>
                            <div>
                                <div class="ap-ms-title">La Fondation</div>
                                <div class="ap-ms-desc">Ouverture du premier showroom AUTOMANAGER à Casablanca. Une vision simple : rendre le marché automobile marocain plus transparent et plus sûr.</div>
                            </div>
                        </div>
                        <div class="ap-milestone">
                            <div class="ap-ms-year">2012</div>
                            <div>
                                <div class="ap-ms-title">L'Expansion</div>
                                <div class="ap-ms-desc">Lancement de la plateforme digitale AUTOMANAGER.ma et des enchères auto en ligne. Des milliers d'acheteurs et vendeurs connectés à l'échelle nationale.</div>
                            </div>
                        </div>
                        <div class="ap-milestone">
                            <div class="ap-ms-year">2025</div>
                            <div>
                                <div class="ap-ms-title">L'Écosystème</div>
                                <div class="ap-ms-desc">AUTOMANAGER devient un écosystème complet : achat, vente, reprise, financement, expertise et enchères — tout sous une seule marque de confiance.</div>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- Right: wide image --}}
                <div>
                    <div class="ap-hist-media">
                        <img src="https://images.unsplash.com/photo-1567016432779-094069958ea5?w=1200&q=80"
                             alt="Showroom AUTOMANAGER" loading="lazy">
                        <div class="ap-hist-media-overlay"></div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    {{-- ════════════════════════════════════════════
         3. L'ÉCOSYSTÈME AUTOMANAGER — 6 services
    ════════════════════════════════════════════ --}}
    <section class="ap-eco">
        <div class="ap-wrap">
            <h2 class="ap-eco-h2">L'Écosystème <span>AUTOMANAGER.</span></h2>

            <div class="ap-eco-grid">

                <div class="ap-svc-card">
                    <div class="ap-svc-icon">
                        <i data-lucide="car-front" style="width:28px;height:28px;"></i>
                    </div>
                    <h3 class="ap-svc-title">AUTOMANAGER Achat</h3>
                    <p class="ap-svc-desc">Trouvez le véhicule idéal parmi des centaines d'annonces certifiées. Chaque voiture est inspectée et garantie par nos experts.</p>
                </div>

                <div class="ap-svc-card">
                    <div class="ap-svc-icon">
                        <i data-lucide="tags" style="width:28px;height:28px;"></i>
                    </div>
                    <h3 class="ap-svc-title">AUTOMANAGER Vente</h3>
                    <p class="ap-svc-desc">Vendez votre voiture rapidement et au meilleur prix. Diffusion premium, gestion des contacts, transaction 100 % sécurisée.</p>
                </div>

                <div class="ap-svc-card">
                    <div class="ap-svc-icon">
                        <i data-lucide="hand-coins" style="width:28px;height:28px;"></i>
                    </div>
                    <h3 class="ap-svc-title">AUTOMANAGER Reprise</h3>
                    <p class="ap-svc-desc">Échangez votre ancien véhicule contre un crédit sur votre prochain achat. Estimation immédiate, aucune contrainte.</p>
                </div>

                <div class="ap-svc-card">
                    <div class="ap-svc-icon">
                        <i data-lucide="gavel" style="width:28px;height:28px;"></i>
                    </div>
                    <h3 class="ap-svc-title">Auto Enchère</h3>
                    <p class="ap-svc-desc">Participez à nos enchères automobiles en ligne ou en salle. Acheteurs vérifiés, transparence totale, meilleures opportunités.</p>
                </div>

                <div class="ap-svc-card">
                    <div class="ap-svc-icon">
                        <i data-lucide="landmark" style="width:28px;height:28px;"></i>
                    </div>
                    <h3 class="ap-svc-title">AUTOMANAGER Finance</h3>
                    <p class="ap-svc-desc">Simulez et obtenez votre crédit auto en quelques clics. Partenariats bancaires exclusifs, taux compétitifs, réponse rapide.</p>
                </div>

                <div class="ap-svc-card">
                    <div class="ap-svc-icon">
                        <i data-lucide="shield-check" style="width:28px;height:28px;"></i>
                    </div>
                    <h3 class="ap-svc-title">AUTOMANAGER Expert</h3>
                    <p class="ap-svc-desc">Inspection complète de 110 points par nos techniciens certifiés. Rapport d'expertise détaillé et badge de garantie inclus.</p>
                </div>

            </div>
        </div>
    </section>

    {{-- ════════════════════════════════════════════
         4. L'EXPERTISE EN 30 MINUTES — bento
    ════════════════════════════════════════════ --}}
    <section class="ap-expertise">
        <div class="ap-wrap">
            <h2 class="ap-exp-h2">L'Expertise<br>en 30 minutes.</h2>

            <div class="ap-bento-grid">

                <div class="ap-bento-card">
                    <div class="ap-bento-icon">
                        <i data-lucide="settings-2" style="width:32px;height:32px;"></i>
                    </div>
                    <h3 class="ap-bento-title">Diagnostic Complet</h3>
                    <p class="ap-bento-desc">110 points de contrôle sur la mécanique, la carrosserie, l'électronique et la structure. Résultats en moins de 30 minutes.</p>
                </div>

                <div class="ap-bento-card">
                    <div class="ap-bento-icon">
                        <i data-lucide="sparkles" style="width:32px;height:32px;"></i>
                    </div>
                    <h3 class="ap-bento-title">Mise en Valeur</h3>
                    <p class="ap-bento-desc">Photos professionnelles, vidéo YouTube et présentation premium pour maximiser l'attractivité de votre annonce.</p>
                </div>

                <div class="ap-bento-card">
                    <div class="ap-bento-icon">
                        <i data-lucide="history" style="width:32px;height:32px;"></i>
                    </div>
                    <h3 class="ap-bento-title">Historique Vérifié</h3>
                    <p class="ap-bento-desc">Vérification complète du carnet d'entretien, des antécédents d'accident et de l'historique administratif du véhicule.</p>
                </div>

                <div class="ap-bento-card">
                    <div class="ap-bento-icon">
                        <i data-lucide="shield-check" style="width:32px;height:32px;"></i>
                    </div>
                    <h3 class="ap-bento-title">Garantie AUTOMANAGER</h3>
                    <p class="ap-bento-desc">Chaque véhicule certifié reçoit le badge Garantie AUTOMANAGER Sérénité. Couverture pièces et main d'œuvre, tranquillité assurée.</p>
                </div>

            </div>
        </div>
    </section>

    {{-- ════════════════════════════════════════════
         5. LE MUR SOCIAL — filter + cards
    ════════════════════════════════════════════ --}}
    <section class="ap-social" id="mur-social">
        <div class="ap-wrap">

            <div class="ap-social-header">
                <h2 class="ap-social-h2">Le Mur <span>Social.</span></h2>
            </div>

            <div class="ap-social-grid" id="ap-social-grid">
                @forelse($stories ?? [] as $story)
                    @php
                        $src = asset('storage/' . ltrim($story->media_path, '/'));
                        $label = $story->media_type === 'video' ? 'Story · Vidéo' : 'Story · Photo';
                        $title = 'Story AUTOMANAGER';
                    @endphp
                    <a href="{{ $src }}" target="_blank" rel="noopener"
                       class="ap-social-card" style="text-decoration:none;color:inherit;">
                        <div class="ap-sc-thumb">
                            @if(($story->media_type ?? 'image') === 'video')
                                <img src="https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=600&q=80"
                                     alt="{{ $title }}" loading="lazy">
                            @else
                                <img src="{{ $src }}" alt="{{ $title }}" loading="lazy">
                            @endif
                            <div class="ap-sc-play">
                                <i data-lucide="play" style="width:40px;height:40px;fill:white;color:white;"></i>
                            </div>
                        </div>
                        <div class="ap-sc-body">
                            <span class="ap-sc-meta">{{ $label }}</span>
                            <div class="ap-sc-title">{{ $title }}</div>
                        </div>
                    </a>
                @empty
                    <div style="grid-column:1/-1;text-align:center;padding:48px 24px;color:var(--ap-muted);">
                        <i data-lucide="gallery-vertical-end" style="width:48px;height:48px;color:var(--ap-blue);margin-bottom:16px;"></i>
                        <p style="font-size:1.15rem;font-weight:600;margin:0;">Aucune story pour le moment.</p>
                    </div>
                @endforelse
            </div>
        </div>
    </section>

    {{-- ════════════════════════════════════════════
         6. TÉMOIGNAGES — dark section
    ════════════════════════════════════════════ --}}
    <section class="ap-temoignages">
        <div class="ap-wrap">

            <span class="ap-tem-eyebrow">Avis Clients</span>
            <h2 class="ap-tem-h2">Ils nous font <span>Confiance.</span></h2>

            <div class="ap-tem-grid">

                <div class="ap-tem-card">
                    <div class="ap-tem-quote-deco">
                        <i data-lucide="quote" style="width:60px;height:60px;"></i>
                    </div>
                    <div class="ap-tem-stars">
                        <i data-lucide="star" style="width:16px;height:16px;fill:currentColor;"></i>
                        <i data-lucide="star" style="width:16px;height:16px;fill:currentColor;"></i>
                        <i data-lucide="star" style="width:16px;height:16px;fill:currentColor;"></i>
                        <i data-lucide="star" style="width:16px;height:16px;fill:currentColor;"></i>
                        <i data-lucide="star" style="width:16px;height:16px;fill:currentColor;"></i>
                    </div>
                    <p class="ap-tem-text">
                        "AUTOMANAGER a totalement transformé mon expérience d'achat auto. En moins de 48h, j'avais ma BMW inspectée, certifiée et livrée. Une équipe professionnelle, un processus transparent du début à la fin."
                    </p>
                    <div class="ap-tem-name">Karim El Mansouri</div>
                    <div class="ap-tem-role">Acheteur — Casablanca</div>
                </div>

                <div class="ap-tem-card">
                    <div class="ap-tem-quote-deco">
                        <i data-lucide="quote" style="width:60px;height:60px;"></i>
                    </div>
                    <div class="ap-tem-stars">
                        <i data-lucide="star" style="width:16px;height:16px;fill:currentColor;"></i>
                        <i data-lucide="star" style="width:16px;height:16px;fill:currentColor;"></i>
                        <i data-lucide="star" style="width:16px;height:16px;fill:currentColor;"></i>
                        <i data-lucide="star" style="width:16px;height:16px;fill:currentColor;"></i>
                        <i data-lucide="star" style="width:16px;height:16px;fill:currentColor;"></i>
                    </div>
                    <p class="ap-tem-text">
                        "J'ai vendu ma Mercedes en 10 jours grâce à AUTOMANAGER. Le Pack Showroom est exceptionnel — photos pro, vidéo YouTube, badge certifié. Le prix obtenu a dépassé mes attentes. Je recommande à 100%."
                    </p>
                    <div class="ap-tem-name">Samira Benali</div>
                    <div class="ap-tem-role">Vendeuse Particulier — Rabat</div>
                </div>

            </div>
        </div>
    </section>

    {{-- ════════════════════════════════════════════
         7. FOOTER CTA
    ════════════════════════════════════════════ --}}
    <footer class="ap-footer-cta">
        <div class="ap-wrap">
            <h2 class="ap-footer-h2">Rejoignez <span>la Famille.</span></h2>
            <div class="ap-footer-btns">
                <a href="{{ route('annonces.index') }}" class="ap-btn-primary">
                    <i data-lucide="search" style="width:16px;height:16px;"></i>
                    Explorer le stock
                </a>
                <a href="{{ route('index') }}" class="ap-btn-secondary">
                    <i data-lucide="arrow-left" style="width:16px;height:16px;"></i>
                    Retour à l'accueil
                </a>
            </div>
        </div>
    </footer>

</div>{{-- .ap-page --}}
@endsection

@section('script')
<script>
document.addEventListener('DOMContentLoaded', function () {
    if (typeof lucide !== 'undefined') lucide.createIcons();
});

// Mur Social is driven by Stories now.
</script>
@endsection
