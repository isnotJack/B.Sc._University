<!DOCTYPE html>
<html lang="it">
<?php session_start();?>

<head>
    <title>Pacman</title>
    <link href="https://fonts.googleapis.com/css?family=Press+Start+2P&ampdisplay=swap" rel="stylesheet">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/pacman.css">
</head>

<body>
<header>
            <div class="logo">
              <p>Pacman</p>
            <div class="loader-wrapper">
                    <div class="packman"></div>
                    <div class="dots">
                      <div class="dot"></div>
                      <div class="dot"></div>
                      <div class="dot"></div>
                      <div class="dot"></div>
                    </div>
                  </div>
                  
            </div>
            <div class="hamburger">
              <div class="line"></div>
              <div class="line"></div>
              <div class="line"></div>
            </div>
            <nav class="nav-bar">
                <ul>
                    <li>
                        <a href="index.php" >Home</a>
                    </li>
                    <li>
                        <a href="index.php#controls">Controls</a>
                    </li>
                    <li>
                        <a href="index.php#cards" class="active">Play</a>
                    </li>
                    <li>
                        <a href="#" onclick="showScore()">Score</a>
                    </li>
                    <?php 
                    if (isset($_SESSION['session_id'])) { 
                      $session_user = htmlspecialchars($_SESSION['session_user'], ENT_QUOTES, 'UTF-8'); 
                    //$session_id = htmlspecialchars($_SESSION['session_id']); 
                    echo "<li><a href='logout.php'>Logout</a></li>";   
                    echo "<li><a href='' class='usr_login'>" . $session_user . "</a></li>"; 
                    echo "<li><img src='img/user.png' class='img_login' alt='user'></li>"; 
                     
                    }else{
                      echo "<li><a href='login.php'>Login</a></li>";  
                      echo "<li><a href='sign_up.php'>Sign Up</a></li>";  
                      echo "<li><img src='img/import.png' class='img_login'alt='user'></li>";  

                    }
                    ?>
                </ul>
              </nav>
    </header>
    <div id="score-modal">
                  <div class="score-content">
                      <!-- Qui verranno visualizzate le tabelle del codice PHP -->
                  </div>
              </div>
    <canvas id="canvas" width="500" height="500"></canvas>
    <div class="winner">
        Winner
    </div>

    <div class="loader"></div>
    <div class="loader2">
      <span>READY</span>
      <span>READY</span>
    </div>

    <div class="gameover">
        <span>G</span>
        <span>A</span>
        <span>M</span>
        <span>E</span>
        <span>O</span>
        <span>V</span>
        <span>E</span>
        <span>R</span>
        <?php // Ottieni il valore del parametro "modalita" dall'URL 
          $modalita = $_GET['modalita']; 
          // Verifica il valore di "modalita" e aggiungi l'href corrispondente 
          if ($modalita == "classic") {
            $href = "pacman.php?modalita=classic"; 
          } else if ($modalita == "invasion") { 
            $href = "pacman.php?modalita=invasion";
          } else if ($modalita == "insane") { 
            $href = "pacman.php?modalita=insane";
          }
          // Stampa il link con l'href appropriato 
          echo '<a href="' . $href . '" id="riprova">Try Again</a>' ?>
      </div>
    <div style="display:none;">
        <img id="animation" src="img/img_pacman/animations.gif" width="140" height="20" alt="animazioni">
        <img id="ghosts" src="img/img_pacman/ghost.png" width="140" height="20" alt="quattro_fantasmi">
        <img id="ghosts_blue" src="img/img_pacman/ghost_blue.png" width="140" height="20" alt="quattro_fantasmi_blu">

    </div>
    <script> let session_user = '<?php echo $_SESSION['session_user']; ?>';</script>
    <script> let get_mod = '<?php echo $_GET['modalita']; ?>'; </script>
  

    <script src="js/ghost.js"></script>
    <script src="js/pacman.js"></script>
    <script src="js/game.js"></script>
    <script src="js/home_pacman.js"></script>

</body>

</html>