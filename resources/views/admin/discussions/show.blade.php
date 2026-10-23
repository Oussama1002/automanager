@extends('admin.layouts.app')

@section('title', 'Discussion #' . $discussion->id . ' | Admin NADO')

@section('content')
<style>
    .mic-btn {
        width: 38px; height: 38px;
        border-radius: 50%;
        border: none;
        background: #e2e8f0;
        color: #475569;
        display: flex; align-items: center; justify-content: center;
        cursor: pointer;
        flex-shrink: 0;
        transition: background .2s, color .2s;
    }
    .mic-btn:hover { background: #cbd5e1; }
    .mic-btn.recording { background: #ef4444; color: #fff; animation: pulse-mic .8s infinite; }
    @keyframes pulse-mic {
        0%,100% { box-shadow: 0 0 0 0 rgba(239,68,68,.4); }
        50%      { box-shadow: 0 0 0 8px rgba(239,68,68,0); }
    }
    audio { max-width: 220px; height: 36px; border-radius: 99px; }
</style>

<div class="page-heading">
    <div class="page-title">
        <div class="row align-items-center">
            <div class="col">
                <a href="{{ route('admin.discussions.index') }}" class="btn btn-sm btn-outline-secondary mb-2">
                    <i class="bi bi-arrow-left"></i> Retour
                </a>
                <h3 class="mb-0">
                    Discussion avec {{ $discussion->client->name ?? '—' }}
                    <span class="badge {{ $discussion->status === 'open' ? 'bg-success' : 'bg-secondary' }} ms-2" style="font-size:0.7rem;">
                        {{ $discussion->status === 'open' ? 'Ouvert' : 'Clôturé' }}
                    </span>
                </h3>
                @if($discussion->annonce)
                    @php
                        $annonceBrand  = $discussion->annonce->brand->name  ?? $discussion->annonce->mark;
                        $annonceModele = $discussion->annonce->modeleRelation->name ?? $discussion->annonce->modele;
                    @endphp
                    <p class="text-muted mb-0 mt-1">
                        <i class="bi bi-car-front"></i>
                        Annonce :
                        <a href="{{ route('achat.detail', ['marque' => str_replace(' ','',$annonceBrand), 'modele' => str_replace(' ','',$annonceModele), 'id' => $discussion->annonce->id]) }}" target="_blank">
                            {{ $annonceBrand }} {{ $annonceModele }} ({{ $discussion->annonce->year }})
                        </a>
                    </p>
                @endif
            </div>
            <div class="col-auto d-flex gap-2">
                @if($discussion->status === 'open')
                    <form method="POST" action="{{ route('admin.discussions.close', $discussion->id) }}">
                        @csrf @method('PATCH')
                        <button class="btn btn-sm btn-outline-danger">
                            <i class="bi bi-x-circle"></i> Clôturer
                        </button>
                    </form>
                @else
                    <form method="POST" action="{{ route('admin.discussions.reopen', $discussion->id) }}">
                        @csrf @method('PATCH')
                        <button class="btn btn-sm btn-outline-success">
                            <i class="bi bi-arrow-repeat"></i> Réouvrir
                        </button>
                    </form>
                @endif
            </div>
        </div>
    </div>

    <section class="section">
        <div class="card" style="max-width:800px; margin:0 auto;">
            <div class="card-body p-0">

                {{-- Chat Window --}}
                <div id="chatBox" style="height:480px; overflow-y:auto; padding:1.5rem; display:flex; flex-direction:column; gap:0.75rem; background:#f8fafc;">

                    @foreach($discussion->messages as $msg)
                        @php $isAdmin = $msg->sender_type === 'admin'; @endphp
                        <div class="d-flex {{ $isAdmin ? 'justify-content-end' : 'justify-content-start' }}" data-msg-id="{{ $msg->id }}">
                            <div style="max-width:70%;">
                                <div style="{{ $isAdmin
                                    ? 'background:#1459DD;color:#fff;padding:.75rem 1rem;border-radius:18px 18px 4px 18px;'
                                    : 'background:#fff;border:1px solid #e2e8f0;color:#0f172a;padding:.75rem 1rem;border-radius:18px 18px 18px 4px;' }}font-size:.9rem;line-height:1.5;">
                                    @if(($msg->type ?? 'text') === 'audio' && $msg->attachment)
                                        <audio controls preload="metadata" src="{{ parse_url(Storage::url($msg->attachment), PHP_URL_PATH) }}"></audio>
                                    @else
                                        {{ $msg->message }}
                                    @endif
                                </div>
                                <div class="{{ $isAdmin ? 'text-end' : '' }} mt-1" style="font-size:11px; color:#94a3b8;">
                                    {{ $isAdmin ? 'Admin' : ($discussion->client->name ?? 'Client') }} · {{ $msg->created_at->format('H:i') }}
                                </div>
                            </div>
                        </div>
                    @endforeach

                    @if($discussion->messages->isEmpty())
                        <div class="text-center text-muted py-5" id="emptyState">
                            <i class="bi bi-chat-dots" style="font-size:2.5rem;"></i>
                            <p class="mt-2">Aucun message. Démarrez la conversation.</p>
                        </div>
                    @endif
                </div>

                {{-- Input --}}
                @if($discussion->status === 'open')
                <div style="border-top:1px solid #e2e8f0; padding:1rem;">
                    <form id="sendForm" class="d-flex gap-2 align-items-center">
                        @csrf
                        <input type="text" id="msgInput" class="form-control" placeholder="Écrire un message…" autocomplete="off" />
                        <button type="button" id="micBtn" class="mic-btn" title="Message vocal">
                            <i class="bi bi-mic-fill"></i>
                        </button>
                        <button type="submit" class="btn btn-primary px-4">
                            <i class="bi bi-send"></i>
                        </button>
                    </form>
                    <div id="recTimer" style="display:none; font-size:12px; color:#ef4444; margin-top:4px;">
                        <i class="bi bi-record-circle"></i> Enregistrement… <span id="recSec">0</span>s — cliquez à nouveau pour envoyer
                    </div>
                </div>
                @else
                <div class="text-center text-muted py-3" style="border-top:1px solid #e2e8f0;">
                    <i class="bi bi-lock"></i> Cette discussion est clôturée.
                </div>
                @endif

            </div>
        </div>
    </section>
</div>

<script>
(function(){
    var chatBox   = document.getElementById('chatBox');
    var sendForm  = document.getElementById('sendForm');
    var msgInput  = document.getElementById('msgInput');
    var micBtn    = document.getElementById('micBtn');
    var recTimer  = document.getElementById('recTimer');
    var recSec    = document.getElementById('recSec');
    var lastId    = {{ $discussion->messages->last()?->id ?? 0 }};
    var pollUrl   = '{{ route('admin.discussions.messages', $discussion->id) }}';
    var sendUrl   = '{{ route('admin.discussions.send', $discussion->id) }}';
    var csrfToken = document.querySelector('meta[name="csrf-token"]')?.content || '{{ csrf_token() }}';
    var clientName = '{{ $discussion->client->name ?? "Client" }}';

    // ── Fix WebM audio duration (Chrome/Edge browser bug with MediaRecorder blobs) ──
    function fixAudioDuration(audio) {
        function needsFix() { return audio.duration === Infinity || isNaN(audio.duration); }
        function tryFix() {
            try {
                audio.currentTime = 1e101;
            } catch (e) { return; }
            var done = false;
            function onUpdate() {
                if (done) return;
                done = true;
                audio.removeEventListener('timeupdate', onUpdate);
                try { audio.currentTime = 0; } catch (e) {}
            }
            audio.addEventListener('timeupdate', onUpdate);
            setTimeout(function () { onUpdate(); }, 2000);
        }
        audio.addEventListener('loadedmetadata', function () {
            if (needsFix()) tryFix();
        });
        audio.addEventListener('play', function () {
            if (needsFix()) { audio.pause(); tryFix(); }
        });
        if (audio.readyState >= 1) tryFix();
    }
    document.querySelectorAll('#chatBox audio').forEach(fixAudioDuration);

    // ── Audio playback beep for incoming messages ──
    function beep() {
        try {
            var ctx = new (window.AudioContext || window.webkitAudioContext)();
            var osc = ctx.createOscillator(); var g = ctx.createGain();
            osc.connect(g); g.connect(ctx.destination);
            osc.type = 'sine'; osc.frequency.value = 880;
            g.gain.setValueAtTime(0.2, ctx.currentTime);
            g.gain.exponentialRampToValueAtTime(0.001, ctx.currentTime + 0.4);
            osc.start(); osc.stop(ctx.currentTime + 0.4);
        } catch(e){}
    }

    // ── Bubble builder ──
    function makeBubble(msg) {
        var isAdmin = msg.sender_type === 'admin';
        var wrapper = document.createElement('div');
        wrapper.className = 'd-flex ' + (isAdmin ? 'justify-content-end' : 'justify-content-start');
        wrapper.setAttribute('data-msg-id', msg.id);

        var inner = document.createElement('div');
        inner.style.maxWidth = '70%';

        var bubble = document.createElement('div');
        bubble.style.cssText = (isAdmin
            ? 'background:#1459DD;color:#fff;padding:.75rem 1rem;border-radius:18px 18px 4px 18px;'
            : 'background:#fff;border:1px solid #e2e8f0;color:#0f172a;padding:.75rem 1rem;border-radius:18px 18px 18px 4px;')
            + 'font-size:.9rem;line-height:1.5;';

        if (msg.type === 'audio' && msg.attachment_url) {
            var audio = document.createElement('audio');
            audio.controls = true; audio.preload = 'metadata';
            audio.src = msg.attachment_url;
            fixAudioDuration(audio);
            bubble.appendChild(audio);
        } else {
            bubble.textContent = msg.message;
        }

        var meta = document.createElement('div');
        meta.style.cssText = 'font-size:11px;color:#94a3b8;margin-top:4px;' + (isAdmin ? 'text-align:right;' : '');
        meta.textContent = (isAdmin ? 'Admin' : clientName) + ' · ' + msg.time;

        inner.appendChild(bubble); inner.appendChild(meta);
        wrapper.appendChild(inner);
        return wrapper;
    }

    function appendBubble(msg, sound) {
        var empty = document.getElementById('emptyState');
        if (empty) empty.remove();
        chatBox.appendChild(makeBubble(msg));
        chatBox.scrollTop = chatBox.scrollHeight;
        if (sound) beep();
    }

    // ── Shared safe-fetch helper ──
    function safeFetch(url, options, onSuccess) {
        fetch(url, options)
            .then(function(r) {
                if (r.status === 419) { alert('Session expirée. Rechargez la page (F5).'); return null; }
                if (!r.ok) { return r.text().then(function(t) { console.error('Erreur serveur:', r.status, t); alert('Erreur serveur ' + r.status + '. Voir console pour détails.'); return null; }); }
                return r.json();
            })
            .then(function(data) { if (data) onSuccess(data); })
            .catch(function(err) { console.error('Erreur réseau:', err); alert('Erreur réseau : ' + err.message); });
    }

    // ── Send text ──
    if (sendForm) {
        sendForm.addEventListener('submit', function(e) {
            e.preventDefault();
            var text = msgInput.value.trim();
            if (!text) return;
            msgInput.value = ''; msgInput.disabled = true;

            safeFetch(sendUrl, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json', 'X-CSRF-TOKEN': csrfToken, 'Accept': 'application/json' },
                body: JSON.stringify({ message: text })
            }, function(data) {
                appendBubble(data, false);
                lastId = Math.max(lastId, data.id);
                msgInput.disabled = false; msgInput.focus();
            });
        });
    }

    // ── Voice recorder ──
    var mediaRec = null, audioChunks = [], recInterval = null, recSeconds = 0;

    if (micBtn) {
        micBtn.addEventListener('click', function() {
            if (mediaRec && mediaRec.state === 'recording') {
                mediaRec.stop();
                return;
            }

            if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia) {
                alert('Votre navigateur ne supporte pas l\'enregistrement audio. Essayez Chrome ou Firefox.');
                return;
            }

            navigator.mediaDevices.getUserMedia({ audio: true }).then(function(stream) {
                audioChunks = []; recSeconds = 0;

                var mime = '', ext = 'webm';
                var candidates = [
                    ['audio/webm;codecs=opus', 'webm'],
                    ['audio/webm', 'webm'],
                    ['audio/ogg;codecs=opus', 'ogg'],
                    ['audio/mp4', 'mp4']
                ];
                for (var i = 0; i < candidates.length; i++) {
                    if (MediaRecorder.isTypeSupported(candidates[i][0])) {
                        mime = candidates[i][0]; ext = candidates[i][1]; break;
                    }
                }

                mediaRec = mime ? new MediaRecorder(stream, { mimeType: mime }) : new MediaRecorder(stream);
                mediaRec.ondataavailable = function(e) { if (e.data && e.data.size > 0) audioChunks.push(e.data); };

                mediaRec.onstop = function() {
                    micBtn.classList.remove('recording');
                    recTimer.style.display = 'none';
                    clearInterval(recInterval);
                    stream.getTracks().forEach(function(t) { t.stop(); });

                    if (!audioChunks.length) { alert('Aucun son capturé. Vérifiez que le micro est actif.'); return; }
                    var blob = new Blob(audioChunks, { type: mime || 'audio/webm' });
                    if (blob.size < 100) { alert('Enregistrement trop court ou vide.'); return; }

                    var fd = new FormData();
                    fd.append('audio', blob, 'voice.' + ext);

                    micBtn.disabled = true;
                    safeFetch(sendUrl, {
                        method: 'POST',
                        headers: { 'X-CSRF-TOKEN': csrfToken, 'Accept': 'application/json' },
                        body: fd
                    }, function(data) {
                        appendBubble(data, false);
                        lastId = Math.max(lastId, data.id);
                        micBtn.disabled = false;
                    });
                };

                mediaRec.start(250);
                micBtn.classList.add('recording');
                recTimer.style.display = 'block';
                recInterval = setInterval(function() { recSec.textContent = ++recSeconds; }, 1000);

            }).catch(function(err) {
                alert('Microphone non accessible : ' + (err.message || err.name) + '\nActivez la permission micro dans votre navigateur.');
            });
        });
    }

    // ── Poll for new client messages ──
    function poll() {
        fetch(pollUrl + '?since=' + lastId, { headers: { 'Accept': 'application/json' } })
        .then(r => r.json())
        .then(msgs => {
            msgs.forEach(function(m) {
                if (!document.querySelector('[data-msg-id="' + m.id + '"]')) {
                    appendBubble(m, true);
                    lastId = Math.max(lastId, m.id);
                }
            });
        });
    }

    chatBox.scrollTop = chatBox.scrollHeight;
    setInterval(poll, 4000);
})();
</script>
@endsection
