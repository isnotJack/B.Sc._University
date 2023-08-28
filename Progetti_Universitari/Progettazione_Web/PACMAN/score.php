<!DOCTYPE html>
<html lang="it">
    <head>
    <link rel="stylesheet" href="css/score.css">
    </head>
    <body>
    <?php

require_once('database.php');

$query = "SELECT MAX(punteggio) as punteggio, modalità, id_utente FROM classifica WHERE modalità='classic' GROUP BY id_utente ORDER BY punteggio DESC LIMIT 3";
$query1 = "SELECT MAX(punteggio) as punteggio, modalità, id_utente FROM classifica WHERE modalità='invasion' GROUP BY id_utente ORDER BY punteggio DESC LIMIT 3";
$query2 = "SELECT MAX(punteggio) as punteggio, modalità, id_utente FROM classifica WHERE modalità='insane' GROUP BY id_utente ORDER BY punteggio DESC LIMIT 3";

try {
//Preparazione della query
$stmt = $pdo->prepare($query);
$stmt1 = $pdo->prepare($query1);
$stmt2 = $pdo->prepare($query2);

//Esecuzione della query
$stmt->execute();
$stmt1->execute();
$stmt2->execute();

//Prendiamo i risultati
$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
$results1= $stmt1->fetchAll(PDO::FETCH_ASSOC);
$results2= $stmt2->fetchAll(PDO::FETCH_ASSOC);
echo "  <div class='tabs'>";
echo " <div class='tab-header'>
        <div class='active'>
                <i></i>Classic
            </div>
            <div>
                <i></i>Invasion
            </div>
            <div>
                <i></i>Insane
            </div>
        </div>";
echo "<div class='tab-indicator'></div>";
echo "  <div class='tab-body'>
            <div class='active'>
            <span class='risultati'>";
                
            $images = array('oro.png', 'argento.png', 'bronzo.png');

            foreach ($results as $key => $row) {
                echo "<span class='rank'><span><img src='".$images[$key]."' class='immagini' alt='img'><span class='scritta'>".$row['id_utente']."</span><span id='pun'>".($row['punteggio'])."</span></span></span>";
            }
echo"           
            </span>
            <button id='chiudi' onclick='hideScore()'>close window</button>
            </div>
            <div>
            <span class='risultati'>";
            
            $images = array('oro.png', 'argento.png', 'bronzo.png');

            foreach ($results1 as $key => $row1) {
                echo "<span class='rank'><span><img src='".$images[$key]."' class='immagini'><span class='scritta'>".$row1['id_utente']."</span><span id='pun'>".($row1['punteggio'])."</span></span></span>";
            }
echo"           </span>        
            <button id='chiudi' onclick='hideScore()'>close window</button>
            </div>
            <div>
            <span class='risultati'>";
            
            $images = array('oro.png', 'argento.png', 'bronzo.png');

            foreach ($results2 as $key => $row2) {
                echo "<span class='rank'><span><img src='".$images[$key]."' class='immagini'><span class='scritta'>".$row2['id_utente']."</span><span id='pun'>".($row2['punteggio'])."</span></span></span>";
            }
echo"           </span>    
            <button id='chiudi' onclick='hideScore()'>close window</button>
            </div>
          
        </div>";

} catch (PDOException $e) {
//In caso di errore mostriamo il messaggio di errore
echo "Errore: ".$e->getMessage();
}
?>

</body>


</html>