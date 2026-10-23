<div x-data="{ open: false }">
    <button @click="open = true" class="bg-blue-500 text-white px-4 py-2 rounded">Se connecter</button>

    <div x-show="open" class="fixed inset-0 z-50 bg-black bg-opacity-50 flex items-center justify-center">
        <div class="bg-white w-full max-w-md p-6 rounded shadow-lg relative">
            <button @click="open = false" class="absolute top-2 right-2 text-gray-500 hover:text-black">✖</button>
            <h2 class="text-xl font-bold mb-4">Connexion</h2>
            <form method="POST" action="{{ route('client.login') }}">
                @csrf
                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium">Email</label>
                    <input type="email" name="email" id="email" required class="w-full border px-3 py-2 rounded">
                </div>
                <div class="mb-4">
                    <label for="password" class="block text-sm font-medium">Mot de passe</label>
                    <input type="password" name="password" id="password" required class="w-full border px-3 py-2 rounded">
                </div>
                <button type="submit" class="bg-green-600 text-white px-4 py-2 rounded">Connexion</button>
            </form>
        </div>
    </div>
</div>
