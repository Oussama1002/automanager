@extends('layouts.app')

@section('content')
<section class="articles-section">
    <div class="container">

        <h2 class="section-title">
            Tous les articles du blog
            <span></span>
        </h2>

        <div class="articles-wrapper">
            @if(isset($articles) && $articles->count() > 0)
                @foreach($articles as $article)
                    @php
                        $label = Str::contains(Str::lower($article->title), 'vin') ? 'VIN' : 'Loan';
                        $labelClass = $label === 'VIN' ? 'vin' : 'loan';
                        $tag = $label === 'VIN' ? 'Transparence & Sécurité' : 'Financement & Crédit';
                    @endphp

                    <div class="article-card {{ $article->is_premium ? 'premium' : '' }}">
                        <div class="article-label {{ $labelClass }}">
                            {{ $label }}
                        </div>

                        <div class="article-content">
                            @if($article->is_premium)
                                <div class="premium-badge">👑 Premium</div>
                            @endif
                            <small class="article-tag {{ $labelClass }}">{{ $tag }}</small>
                            <h4>{{ $article->title }}</h4>
                            <div class="article-meta">
                                Publié le {{ \Carbon\Carbon::parse($article->created_at)->format('d/m/Y') }}
                            </div>
                            <p>{{ Str::limit(strip_tags($article->excerpt ?? $article->content), 150) }}</p>
                            <a href="{{ route('articles.show', $article->slug) }}" class="btn-read-article">
                                Lire l'article
                            </a>
                        </div>
                    </div>
                @endforeach
            @else
                <p>Aucun article trouvé.</p>
            @endif
        </div>

        <div class="text-center mt-4">
            <a href="{{ route('articles.index') }}" class="btn-all-articles">
                Voir tous les articles
            </a>
        </div>

    </div>
</section>

<style>
.articles-section { background: #f7f9fc; padding: 60px 0; }
.section-title { font-size: 28px; font-weight: 800; margin-bottom: 40px; position: relative; }
.section-title span { display: block; width: 50px; height: 4px; background: #22c55e; margin-top: 6px; }

.articles-wrapper { display: flex; flex-wrap: wrap; gap: 20px; }

.article-card {
    display: flex; flex: 1 1 48%; min-width: 300px;
    align-items: stretch; background: #fff; border-radius: 18px;
    overflow: hidden; box-shadow: 0 15px 40px rgba(0,0,0,.12);
    position: relative; transition: transform 0.3s ease;
}
.article-card:hover { transform: translateY(-5px); }

.article-label { min-width: 140px; display: flex; align-items: center; justify-content: center; font-size: 42px; font-weight: 900; color: #fff; }
.article-label.vin { background: #00b894; }
.article-label.loan { background: #0b84e3; }

.article-content { padding: 24px; display: flex; flex-direction: column; justify-content: center; position: relative; }
.article-content h4 { font-weight: 700; margin-bottom: 10px; }
.article-content p { color: #555; font-size: 14px; line-height: 1.6; margin-bottom: 15px; }
.article-tag { font-size: 12px; font-weight: 600; margin-bottom: 6px; }
.article-tag.vin { color: #00b894; }
.article-tag.loan { color: #0b84e3; }
.article-meta { font-size: 12px; color: #999; margin-bottom: 10px; }

.btn-read-article {
    display: inline-block; background: #A17E31; color: #fff;
    padding: 8px 20px; border-radius: 8px; text-decoration: none;
    font-weight: 700; font-size: 13px; align-self: start; transition: .3s;
}
.btn-read-article:hover { background: #1e3a8a; }

.btn-all-articles {
    display: inline-block; background: #A17E31; color: #fff;
    padding: 14px 32px; border-radius: 10px; font-weight: 700;
    text-decoration: none; transition: .3s; margin-top: 15px;
}
.btn-all-articles:hover { background: #1e3a8a; }

.premium-badge {
    position: absolute; top: 12px; right: 12px;
    background: linear-gradient(45deg,#facc15,#f59e0b);
    color: #000; font-weight: 800; padding: 6px 14px; border-radius: 30px;
    font-size: 13px; box-shadow: 0 6px 15px rgba(0,0,0,.3);
}

/* RESPONSIVE */
@media (max-width: 768px) {
    .articles-wrapper { flex-direction: column; }
    .article-card { flex: 1 1 100%; }
    .article-label { font-size: 36px; min-width: 120px; }
}
</style>

<script>
document.addEventListener('DOMContentLoaded', () => {
    // Premium unlock demo (optional)
    const UNLOCK_DELAY = 60 * 60 * 1000; // 1 hour
    const key = 'articles_unlocked_at';
    const now = Date.now();
    let unlockTime = localStorage.getItem(key);
    if (!unlockTime) { localStorage.setItem(key, now); unlockTime = now; }
    if (now - unlockTime >= UNLOCK_DELAY) {
        document.querySelectorAll('.premium').forEach(card => card.classList.remove('premium'));
    }
});
</script>
@endsection
