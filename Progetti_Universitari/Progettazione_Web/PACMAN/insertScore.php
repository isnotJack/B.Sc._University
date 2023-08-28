<?php
require_once('database.php');

if (isset($_GET['score'])) {
    $punteggio = $_GET['score'] ?? '';
    $modalita = $_GET['modalita']?? '';
    $id_utente = $_GET['id_utente']?? '';
    
    


            $query = "
                INSERT INTO classifica
                VALUES (0,:punteggio, :modalita, :id_utente)
            ";
        
            $check = $pdo->prepare($query);
            $check->bindParam(':punteggio', $punteggio, PDO::PARAM_INT);
            $check->bindParam(':modalita', $modalita, PDO::PARAM_STR);
            $check->bindParam(':id_utente', $id_utente, PDO::PARAM_INT);
            $check->execute();
}
?>