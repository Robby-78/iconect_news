<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="robots" content="noindex">
    <title>An error occurred!</title>
    <style type="text/css">
        <?= preg_replace('#[\r\n\t ]+#', ' ', file_get_contents(__DIR__ . DIRECTORY_SEPARATOR . 'debug.css')) ?>
    </style>
</head>
<body>
<div class="container text-center">
    <h1 class="headline">An error occurred!</h1>
    <p class="lead">Please try again later...</p>
    <small>If you are the site owner, you can see the error by changing the <b style="font-weight: bold">environment</b> mode to <b style="font-weight: bold">"development"</b> from the <b style="font-weight: bold">.env</b> file.</small>
</div>
</body>
</html>