<?php
// Connexió a la base de dades
$db = new PDO('sqlite:database/springfield.db');

// Recollim els paràmetres de la URL
$visibility = $_GET['visibility'] ?? null;
$date = $_GET['date'] ?? null;

// Construïm la consulta base
$sql = "SELECT art_id, art_titol, art_contingut, art_data_publicacio, art_visibilitat FROM articles WHERE 1=1";

// Afegim condicions segons els paràmetres rebuts
if ($visibility) {
    if ($visibility == 'free') {
        $sql .= " AND art_visibilitat = 'public'";
    } elseif ($visibility == 'premium') {
        $sql .= " AND art_visibilitat = 'subscriber'";
    }
}

if ($date) {
    $sql .= " AND art_data_publicacio >= :date";
}

// Preparem la consulta
$stmt = $db->prepare($sql);

// Si hi ha data, l'enllacem
if ($date) {
    $stmt->bindParam(':date', $date);
}

// Executem
$stmt->execute();

// Recollim resultats
$articles = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Capçalera per indicar que és JSON
header('Content-Type: application/json');

// Mostrem el resultat
echo json_encode($articles, JSON_PRETTY_PRINT);
?>
