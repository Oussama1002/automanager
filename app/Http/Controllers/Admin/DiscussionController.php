<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Discussion;
use App\Models\DiscussionMessage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class DiscussionController extends Controller
{
    public function index()
    {
        $discussions = Discussion::with(['client', 'annonce.brand', 'annonce.modeleRelation', 'lastMessage'])
            ->withCount(['unreadByAdmin as unread_count'])
            ->orderByDesc('last_message_at')
            ->paginate(20);

        $totalUnread = Discussion::withCount(['unreadByAdmin as unread_count'])
            ->get()
            ->sum('unread_count');

        return view('admin.discussions.index', compact('discussions', 'totalUnread'));
    }

    public function show(Discussion $discussion)
    {
        $discussion->load(['client', 'annonce.brand', 'annonce.modeleRelation', 'messages']);

        // Mark client messages as read — not on seller discussions: read_at is shared
        // and the seller must still see the buyer's messages as unread
        if (!$discussion->isSellerManaged()) {
            $discussion->messages()
                ->where('sender_type', 'client')
                ->whereNull('read_at')
                ->update(['read_at' => now()]);
        }

        // Particulier annonce → the seller answers, the admin only reads
        $sellerManaged = $discussion->isSellerManaged();

        return view('admin.discussions.show', compact('discussion', 'sellerManaged'));
    }

    public function sendMessage(Request $request, Discussion $discussion)
    {
        // Discussions on a particulier's annonce are answered by the seller only;
        // NADO can read them but not reply
        if ($discussion->isSellerManaged()) {
            $error = 'Cette discussion concerne l’annonce d’un particulier : seul le vendeur peut répondre.';
            if ($request->expectsJson()) {
                return response()->json(['error' => $error], 403);
            }
            return back()->with('error', $error);
        }

        if ($request->hasFile('audio')) {
            $request->validate(['audio' => 'required|file|max:10240']);

            $path = $request->file('audio')->store('discussion_audio', 'public');

            $msg = DiscussionMessage::create([
                'discussion_id' => $discussion->id,
                'sender_type'   => 'admin',
                'sender_id'     => Auth::id(),
                'message'       => '[Message vocal]',
                'type'          => 'audio',
                'attachment'    => $path,
            ]);
        } else {
            $request->validate(['message' => 'required|string|max:2000']);

            $msg = DiscussionMessage::create([
                'discussion_id' => $discussion->id,
                'sender_type'   => 'admin',
                'sender_id'     => Auth::id(),
                'message'       => $request->message,
                'type'          => 'text',
            ]);
        }

        $discussion->update(['last_message_at' => now(), 'status' => 'open']);

        if ($request->expectsJson()) {
            return response()->json($this->msgToArray($msg));
        }

        return back();
    }

    public function close(Discussion $discussion)
    {
        $discussion->update(['status' => 'closed']);
        return back()->with('success', 'Discussion clôturée.');
    }

    public function reopen(Discussion $discussion)
    {
        $discussion->update(['status' => 'open']);
        return back()->with('success', 'Discussion réouverte.');
    }

    public function messages(Discussion $discussion)
    {
        $since = request('since');
        // buyer + seller messages (everything the admin didn't write)
        $query = $discussion->messages()->whereIn('sender_type', ['client', 'seller']);

        if ($since) {
            $query->where('id', '>', $since);
        }

        $messages = $query->get()->map(fn($m) => $this->msgToArray($m));

        // Mark as read (not on seller discussions, see show())
        if (!$discussion->isSellerManaged()) {
            $discussion->messages()
                ->where('sender_type', 'client')
                ->whereNull('read_at')
                ->update(['read_at' => now()]);
        }

        return response()->json($messages);
    }

    private function msgToArray(DiscussionMessage $m): array
    {
        return [
            'id'             => $m->id,
            'sender_type'    => $m->sender_type,
            'label'          => \App\Http\Controllers\Client\DiscussionController::senderLabel($m->sender_type),
            'type'           => $m->type ?? 'text',
            'message'        => $m->message,
            'attachment_url' => $m->attachment ? parse_url(Storage::url($m->attachment), PHP_URL_PATH) : null,
            'time'           => $m->created_at->format('H:i'),
        ];
    }
}
