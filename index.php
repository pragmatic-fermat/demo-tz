<?php
$timezone = date_default_timezone_get();
$now = new DateTimeImmutable('now', new DateTimeZone($timezone));
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Heure courante</title>
</head>
<body>
    <h1>Heure courante</h1>
    <p>Nous sommes le <?= $now->format('d/m/Y') ?> et il est <?= $now->format('H:i:s') ?>.</p>
    <p>Fuseau horaire PHP : <?= $timezone ?> (UTC<?= $now->format('P') ?>).</p>
</body>
</html>
