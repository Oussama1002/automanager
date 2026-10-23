@extends('layouts.client')

@section('title', 'Discussion | NADO')

@section('client_title', 'Discussion')
@section('client_subtitle', $role === 'seller'
    ? 'Un acheteur est intéressé par votre annonce.'
    : ($sellerManaged ? 'Conversation avec le vendeur.' : 'Conversation avec l’équipe NADO.'))
@section('client_content')
<style>
    /* Sidebar is provided by layouts.client */
    .chat-wrapper {
        max-width: 720px; background: #fff;
        border: 1px solid #e2e8f0; border-radius: 18px;
        overflow: hidden; box-shadow: 0 4px 24px rgba(0,0,0,.07);
    }
    .chat-header {
        background: #003b87; color: white;
        padding: 1.1rem 1.5rem; display: flex; align-items: center; gap: 1rem;
    }
    .chat-header-avatar {
        width: 40px; height: 40px; background: #f0c000;
        border-radius: 50%; display: flex; align-items: center;
        justify-content: center; font-weight: 900; color: #003b87; font-size: 16px;
    }
    .chat-header-info h5 { margin: 0; font-size: 1.15rem; font-weight: 900; letter-spacing: -.01em; }
    .chat-header-info small { opacity: .8; font-size: .95rem; font-weight: 650; }
    #chatBox {
        height: 440px; overflow-y: auto; padding: 1.5rem;
        display: flex; flex-direction: column; gap: .75rem; background: #f8fafc;
    }
    .bubble-wrap-client { display: flex; justify-content: flex-end; }
    .bubble-wrap-admin  { display: flex; justify-content: flex-start; }
    .bubble-client {
        background: #1459DD; color: #fff; padding: .7rem 1rem;
        border-radius: 18px 18px 4px 18px;
        max-width: min(92%, 620px);
        font-size: 1.15rem; line-height: 1.6; word-break: break-word;
    }
    .bubble-admin {
        background: #fff; border: 1px solid #e2e8f0; color: #0f172a;
        padding: .7rem 1rem; border-radius: 18px 18px 18px 4px;
        max-width: min(92%, 620px);
        font-size: 1.15rem; line-height: 1.6; word-break: break-word;
    }
    .bubble-meta { font-size: 13px; color: #94a3b8; margin-top: 8px; font-weight: 650; }
    .chat-input-area {
        border-top: 1px solid #e2e8f0; padding: 1rem 1.5rem;
        display: flex; gap: .75rem; align-items: center; background: #fff;
    }
    .chat-input-area input {
        flex: 1; padding: .75rem 1rem; border: 1px solid #e2e8f0;
        border-radius: 99px; font-size: 1.05rem; outline: none;
    }
    .chat-input-area input:focus { border-color: #1459DD; box-shadow: 0 0 0 3px rgba(20,89,221,.1); }
    .chat-send-btn, .chat-mic-btn {
        border: none; border-radius: 50%; width: 44px; height: 44px;
        display: flex; align-items: center; justify-content: center;
        cursor: pointer; flex-shrink: 0; transition: background .2s;
    }
    .chat-send-btn { background: #1459DD; color: #fff; }
    .chat-send-btn:hover { background: #1248c4; }
    .chat-mic-btn { background: #e2e8f0; color: #475569; }
    .chat-mic-btn:hover { background: #cbd5e1; }
    .chat-mic-btn.recording { background: #ef4444; color: #fff; animation: pulse-mic .8s infinite; }
    @keyframes pulse-mic {
        0%,100% { box-shadow: 0 0 0 0 rgba(239,68,68,.4); }
        50%      { box-shadow: 0 0 0 8px rgba(239,68,68,0); }
    }
    /* Audio should fill the bubble width */
    .bubble-client audio,
    .bubble-admin audio {
        width: 100% !important;
        max-width: 100% !important;
        height: 42px;
        border-radius: 99px;
        display: block;
    }
    /* Some browsers use UA styles for audio controls; force container width too */
    .bubble-client,
    .bubble-admin {
        min-width: 280px;
    }
</style>

<div>
    <a href="{{ route('client.discussions.index') }}" style="color:#003b87; text-decoration:none; font-size:1rem; font-weight:800;">
        ← Retour aux discussions
    </a>

    <div class="chat-wrapper" style="margin-top:1.5rem;">
        <div class="chat-header">
            @php
                // Who the viewer is talking to
                if ($role === 'seller') {
                    $otherName = 'Acheteur · ' . ($discussion->client->name ?? 'Client');
                } elseif ($sellerManaged) {
                    $otherName = 'Vendeur (particulier)';
                } else {
                    $otherName = 'Support NADO';
                }
                $ownType = $role === 'seller' ? 'seller' : 'client';
            @endphp
            <div class="chat-header-avatar">{{ $role === 'seller' ? 'A' : ($sellerManaged ? 'V' : 'N') }}</div>
            <div class="chat-header-info">
                <h5>{{ $otherName }}</h5>
                <small>
                    @if($discussion->annonce)
                        @php
                            $annonceBrand  = $discussion->annonce->brand->name ?? $discussion->annonce->mark;
                            $annonceModele = $discussion->annonce->modeleRelation->name ?? $discussion->annonce->modele;
                        @endphp
                        {{ $annonceBrand }} {{ $annonceModele }} ({{ $discussion->annonce->year }})
                    @else
                        Discussion #{{ $discussion->id }}
                    @endif
                </small>
            </div>
            <div style="margin-left:auto;">
                <span style="font-size:13px; background:{{ $discussion->status === 'open' ? '#22c55e' : '#94a3b8' }}; color:#fff; padding:5px 12px; border-radius:99px; font-weight:900;">
                    {{ $discussion->status === 'open' ? 'Ouvert' : 'Clôturé' }}
                </span>
            </div>
        </div>

        <div id="chatBox">
            @foreach($discussion->messages as $msg)
                @php $isClient = $msg->sender_type === $ownType; /* viewer's own message */ @endphp
                <div class="{{ $isClient ? 'bubble-wrap-client' : 'bubble-wrap-admin' }}" data-msg-id="{{ $msg->id }}">
                    <div>
                        <div class="{{ $isClient ? 'bubble-client' : 'bubble-admin' }}">
                            @if(($msg->type ?? 'text') === 'audio' && $msg->attachment)
                                <audio controls preload="metadata" src="{{ parse_url(Storage::url($msg->attachment), PHP_URL_PATH) }}"></audio>
                            @else
                                {{ $msg->message }}
                            @endif
                        </div>
                        <div class="bubble-meta" style="text-align:{{ $isClient ? 'right' : 'left' }};">
                            {{ $isClient ? '' : \App\Http\Controllers\Client\DiscussionController::senderLabel($msg->sender_type).' · ' }}{{ $msg->created_at->format('H:i') }}
                        </div>
                    </div>
                </div>
            @endforeach

            @if($discussion->messages->isEmpty())
                <div id="emptyState" style="text-align:center; color:#94a3b8; margin:auto;">
                    <i class="fa fa-comments" style="font-size:2.5rem; margin-bottom:.75rem; display:block;"></i>
                    <p>
                        @if($role === 'seller') Aucun message pour le moment.
                        @elseif($sellerManaged) Envoyez votre premier message au vendeur.
                        @else Envoyez votre premier message à l'équipe NADO.
                        @endif
                    </p>
                </div>
            @endif
        </div>

        @if($discussion->status === 'open')
        <div class="chat-input-area">
            <input type="text" id="msgInput" placeholder="Écrire un message…" autocomplete="off" />
            <button class="chat-mic-btn" id="micBtn" title="Message vocal">
                <i class="fa fa-microphone"></i>
            </button>
            <button class="chat-send-btn" id="sendBtn">
                <i class="fa fa-paper-plane"></i>
            </button>
        </div>
        <div id="recTimer" style="display:none; text-align:center; font-size:12px; color:#ef4444; padding:.25rem 1.5rem .5rem;">
            <i class="fa fa-circle" style="animation:pulse-mic .8s infinite;"></i>
            Enregistrement… <span id="recSec">0</span>s — appuyez à nouveau pour envoyer
        </div>
        @else
        <div style="text-align:center; color:#94a3b8; padding:1rem; border-top:1px solid #e2e8f0; font-size:.85rem;">
            <i class="fa fa-lock"></i> Cette discussion est clôturée.
        </div>
        @endif
    </div>
</div>

<script>
(function(){
    var chatBox  = document.getElementById('chatBox');
    var msgInput = document.getElementById('msgInput');
    var sendBtn  = document.getElementById('sendBtn');
    var micBtn   = document.getElementById('micBtn');
    var recTimer = document.getElementById('recTimer');
    var recSec   = document.getElementById('recSec');
    var lastId   = {{ $discussion->messages->last()?->id ?? 0 }};
    var pollUrl  = '{{ route('client.discussions.messages', $discussion->id) }}';
    var sendUrl  = '{{ route('client.discussions.send', $discussion->id) }}';
    var csrf     = '{{ csrf_token() }}';

    // ── Fix WebM audio duration (MediaRecorder omits duration in container) ──
    function fixAudioDuration(audio) {
        audio.preload = 'metadata';
        var seeked = false, fixed = false;

        function needsFix() {
            return audio.duration === Infinity || isNaN(audio.duration) || audio.duration === 0;
        }

        function tryFix() {
            if (seeked || !needsFix()) return;
            seeked = true;
            try { audio.currentTime = 1e101; } catch (e) {}
        }

        audio.addEventListener('loadedmetadata', tryFix);
        audio.addEventListener('durationchange', function () {
            if (fixed) return;
            if (seeked && !needsFix()) {
                fixed = true;
                try { audio.currentTime = 0; } catch (e) {}
            }
        });
        // Never block playback: pausing here while the duration was unknown left
        // freshly sent voice notes unplayable until the page was reloaded.

        if (audio.readyState >= 1) tryFix();
    }

    // Apply fix to any audio elements that were server-rendered
    document.querySelectorAll('#chatBox audio').forEach(fixAudioDuration);

    // ── Notification beep ──
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
    // localUrl: blob URL of a voice note the viewer just recorded — plays instantly,
    // without waiting for the uploaded file to be fetched back from the server
    function appendBubble(msg, sound, localUrl) {
        var empty = document.getElementById('emptyState');
        if (empty) empty.remove();

        // 'mine' comes from the server (buyer = client messages, seller = seller messages)
        var isClient = (typeof msg.mine === 'boolean') ? msg.mine : msg.sender_type === 'client';
        var outer = document.createElement('div');
        outer.className = isClient ? 'bubble-wrap-client' : 'bubble-wrap-admin';
        outer.setAttribute('data-msg-id', msg.id);

        var inner = document.createElement('div');

        var bubble = document.createElement('div');
        bubble.className = isClient ? 'bubble-client' : 'bubble-admin';

        if (msg.type === 'audio' && msg.attachment_url) {
            var audio = document.createElement('audio');
            audio.controls = true; audio.preload = 'metadata';
            audio.src = localUrl || msg.attachment_url;
            fixAudioDuration(audio);
            bubble.appendChild(audio);
        } else {
            bubble.textContent = msg.message;
        }

        var meta = document.createElement('div');
        meta.className = 'bubble-meta';
        meta.style.textAlign = isClient ? 'right' : 'left';
        meta.textContent = (isClient ? '' : (msg.label || 'NADO') + ' · ') + msg.time;

        inner.appendChild(bubble); inner.appendChild(meta);
        outer.appendChild(inner);
        chatBox.appendChild(outer);
        chatBox.scrollTop = chatBox.scrollHeight;
        if (sound) beep();
    }

    // ── Shared safe-fetch helper ──
    function safeFetch(url, options, onSuccess) {
        fetch(url, options)
            .then(function(r) {
                if (r.status === 419) { alert('Session expirée. Rechargez la page (F5) et réessayez.'); return null; }
                if (!r.ok) { return r.text().then(function(t) { console.error('Erreur serveur:', r.status, t); alert('Erreur ' + r.status + '. Voir console pour détails.'); return null; }); }
                return r.json();
            })
            .then(function(data) { if (data) onSuccess(data); })
            .catch(function(err) { console.error('Erreur réseau:', err); alert('Erreur réseau : ' + err.message); });
    }

    // ── Send text ──
    function sendText() {
        if (!msgInput) return;
        var text = msgInput.value.trim();
        if (!text) return;
        msgInput.value = ''; msgInput.disabled = true;
        if (sendBtn) sendBtn.disabled = true;

        safeFetch(sendUrl, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json', 'X-CSRF-TOKEN': csrf, 'Accept': 'application/json' },
            body: JSON.stringify({ message: text })
        }, function(data) {
            appendBubble(data, false);
            lastId = Math.max(lastId, data.id);
            msgInput.disabled = false;
            if (sendBtn) sendBtn.disabled = false;
            msgInput.focus();
        });
    }

    if (sendBtn) sendBtn.addEventListener('click', sendText);
    if (msgInput) msgInput.addEventListener('keydown', function(e) { if (e.key === 'Enter') { e.preventDefault(); sendText(); } });

    // ── Voice recorder ──
    var mediaRec = null, audioChunks = [], recInterval = null, recSeconds = 0;

    if (micBtn) {
        micBtn.addEventListener('click', function() {
            if (mediaRec && mediaRec.state === 'recording') {
                mediaRec.stop();
                return;
            }

            if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia) {
                alert('Enregistrement audio non supporté. Utilisez Chrome ou Firefox récent.');
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
                    // Recorded length: WebM from MediaRecorder carries no duration
                    fd.append('duration', String(recSeconds || 0));

                    micBtn.disabled = true;
                    safeFetch(sendUrl, {
                        method: 'POST',
                        headers: { 'X-CSRF-TOKEN': csrf, 'Accept': 'application/json' },
                        body: fd
                    }, function(data) {
                        appendBubble(data, false, URL.createObjectURL(blob));
                        lastId = Math.max(lastId, data.id);
                        micBtn.disabled = false;
                    });
                };

                mediaRec.start(250);
                micBtn.classList.add('recording');
                recTimer.style.display = 'block';
                recInterval = setInterval(function() { recSec.textContent = ++recSeconds; }, 1000);

            }).catch(function(err) {
                alert('Microphone non accessible : ' + (err.message || err.name) + '\nActivez la permission microphone dans votre navigateur.');
            });
        });
    }

    // ── Poll for admin replies ──
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
    @if($discussion->status === 'open')
    setInterval(poll, 4000);
    @endif
})();
</script>
@endsection
