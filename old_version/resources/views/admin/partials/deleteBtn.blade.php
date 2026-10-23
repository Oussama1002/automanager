@php
    $btn_text  ??= 'Delete';
    $class ??= null;
    $url ??= '/';
@endphp

<a @class(['btn-del-row btn btn-danger', $class ])  data-bs-toggle="modal" data-bs-target="#md-del-row" data-url="{{ $url }}">
    {{ $btn_text }}
</a>
