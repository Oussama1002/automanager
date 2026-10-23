<!DOCTYPE html>
<html>
<head>
    <title>nado.ma</title>
</head>
<body>
    <h1>Subject: {{ $data['subject'] }}</h1>
    <p>Nom: {{ $data['name'] }}</p>
    <p>Phone: {{ $data['phone'] }}</p>
    <p>Email: {{ $data['email'] }}</p>

    <p>{{ $data['message'] }}</p>

    <p>Thank you</p>
</body>
</html>
