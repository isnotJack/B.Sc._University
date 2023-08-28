<?php session_start();?>
<!DOCTYPE html>
<html lang="it">
    <head>
      <title>Home</title>
      <link href="https://fonts.googleapis.com/css?family=Press+Start+2P&ampdisplay=swap" rel="stylesheet">

      <link rel="stylesheet" href="css/index_cards.css">
      <link rel="stylesheet" href="css/index_button.css">
      <link rel="stylesheet" href="css/index_navbar.css">
      <link rel="stylesheet" href="css/index_parallax.css">
      <link rel="stylesheet" href="css/index_notification.css">
      <link rel="stylesheet" href="css/index_score.css">

      <link rel="icon" href="favicon.ico" type="image/x-icon">

    </head>

    <body>
    <header>
            <div class="logo">
               <img src="img/logo.png" alt="">
            </div>
            <div class="hamburger">
              <div class="line"></div>
              <div class="line"></div>
              <div class="line"></div>
            </div>
            <nav class="nav-bar">
                <ul>
                    <li>
                        <a href="#" class="active">Home</a>
                    </li>
                    <li>
                        <a href="#controls">Controls</a>
                    </li>
                    <li>
                        <a href="#cards" >Play</a>
                    </li>
                    <li>
                        <a href="#" onclick="showScore()">Score</a>
                    </li>
                    <?php 
                    if (isset($_SESSION['session_id'])) { 
                      $session_user = htmlspecialchars($_SESSION['session_user'], ENT_QUOTES, 'UTF-8'); 
                    
                    echo "<li><a href='logout.php'>Logout</a></li>";   
                    echo "<li><img src='img/line.png' class='img_login' alt='img_login'></li>"; 
                    echo "<li><a href='' class='usr_login'>" . $session_user . "</a></li>"; 
                    echo "<li><img src='img/user.png' class='img_login' alt='img_login'></li>"; 
                     
                    }else{
                      echo "<li><a href='login.php'>Login</a></li>";  
                      echo "<li><img src='img/line.png' class='img_login' alt='img_login'></li>"; 
                      echo "<li><a href='sign_up.php'>Sign</a></li>";  
                      echo "<li><img src='img/import.png' class='img_login' alt='img_login'></li>";  

                    }
                    ?>
                </ul>
              </nav>
    </header>
              <div id="score-modal">
                  <div class="score-content">
                    
                  </div>
              </div>

        <main class="container">
       <?php 
       if (isset($_SESSION['session_id'])) { 
         if (!isset($_SESSION['first_login_' . $_SESSION['session_id']])) {
           $_SESSION['first_login_' . $_SESSION['session_id']] = true; 
           echo '<div class="notification"> <p>Welcome, '.$_SESSION['session_user'].' 👋</p> <span class="notification_progress"></span> </div>'; 
         } else { 
           echo '<div class="notification"> <p>Welcome Back, '.$_SESSION['session_user'].' 👋</p> <span class="notification_progress"></span> </div>'; 
         } 
       } 
       ?>
          <div class="parallax">
            <img src="img/img_parallax/fantasma_heavenly.png" id="fh" alt="fantasma_celeste">
            <img src="img/img_parallax/fantasma_yellow.png" id="fy" alt="fantasma_giallo">
            <img src="img/img_parallax/fantasma_red.png" id="fr" alt="fantasma_rosso">
            <img src="img/img_parallax/pacman_omino.png" id="po" alt="omino_pacman">
            <img src="img/img_parallax/cibo_new_2.png" id="cb" alt="cibo">

      </div>
          <hr class="divisorio">
          <div class="controls" id="controls"> 
          <img src="img/img_controls/controls_omino.png" class="omino" id="om" alt="pacman_grande">
          <label id="lb1">Usa le frecce o WASD per muoverti e raccogliere i punti.</label>
          <div class="controls2">
          <div class="control-box up">
              <div class="icon">&#8593;</div> 
                <div class="label">Muoviti in alto</div> 
          </div> 
            
          <div class="control-box right"> 
              <div class="icon">&#8594;</div> 
                <div class="label">Muoviti a destra</div> 
          </div>
          
          <div class="control-box down"> 
              <div class="icon">&#8595;</div> 
                <div class="label">Muoviti in basso</div> 
          </div>
          
          <div class="control-box left"> 
              <div class="icon">&#8592;</div> 
                <div class="label">Muoviti a sinistra</div> 
          </div>
          </div>
          <label id="lb2">Ogni 5sec appaiono i fantasmini che cercheranno di catturarti.</label>
            <div>        
            <img src="img/img_controls/ghost_red.png" class="gr" alt="fantasma_rosso">
            <img src="img/img_controls/ghost_orange.png"  class="gr" alt="fantasma_arancione">
            <img src="img/img_controls/ghost_viola.png"  class="gr" alt="fantasma_viola">
            <img src="img/img_controls/ghost_celeste.png"  class="gr" alt="fantasma_celeste">
            </div>
                
            <label id="bl">Blinky</label>
            <label id="cl">Clyde</label>
            <label id="pi">Pinky</label>
            <label id="in">Inky</label>
            
            <label id="lb3">Quando mangi una pallina rotonda,</label> 
            <label id="lb4"> i fantasmini diventano blu e scapperanno da te.</label>
            <label id="lb5">Mangiarli ti farà guadagnare 10 pt.</label>
            <img src="img/img_controls/ghost_scared.png" id="gs" alt="fantasma_spaventato">
            <img src="img/img_controls/main.png" id="pc" alt="pacman">
          </div>

          <hr class="divisorio">
          <div class="bck">
            <br>
          <?php
          if (!isset($_SESSION['session_id'])) {
            printf("<h6>Effettua il login per iniziare a giocare</h6>");
            echo "<br>";
            
          }else{
            printf("<h6>Seleziona una modalità di gioco</h6>");
            echo "<br>";
          }
          ?>
          <div class="cards" id="cards">
          
            <div class="card classic">
              <h2 class="card-title-large">Classic</h2>
              <h3 class="card-title-small">Description</h3>
              <p class="card-description">Questo &#232; il livello originale di Pacman, dove il protagonista deve mangiare tutti i punti sul labirinto, evitando i fantasmini. I fantasmini in questo livello sono 4, ciascuno con una strategia di caccia unica. Riuscirai a completare il livello e battere il tuo punteggio migliore?
              </p>
              <button id="btn"  onclick="gioca()">Play Now</button>
            </div>
            
            <div class="card invasion">
              <h2 class="card-title-large">Invasion</h2>
              <h3 class="card-title-small">Description</h3>
              <p class="card-description">Preparati a un'esperienza pi&#249; frenetica, perch&#233; in questo livello ci sono pi&#249; fantasmini che ti vogliono catturare a tutti i costi. Devi essere ancora pi&#249; astuto per evitare di finire tra le loro grinfie! Una volta usciti tutti e 4 i fantasmini mangiarli ti aiuterà a fermarne la generazine.</p>
              
              <button id="btn1" onclick="gioca()">Play Now</button>
            </div>

            <div class="card insane">
              <h2 class="card-title-large">Insane</h2>
              <h3 class="card-title-small">Description</h3>
              <p class="card-description"> Se ti senti molto sicuro delle tue abilit&#224;, prova a completare questo livello. Questa volta, i fantasmini correranno pi&#249; veloci che mai e saranno ancora pi&#249; agguerriti! Se riesci a superare questo livello, dimostri di essere un vero campione. Cosa ne dici, vuoi correre questo rischio?</p>
         
              <button id="btn2" onclick="gioca()">Play Now</button>
            </div>
        
          </div>
        </div>
        </main>
        <script src="js/index.js"></script>
        <script>
        let gioca = () =>{
          let btn = document.getElementById("btn");
          let btn1 = document.getElementById("btn1");
          let btn2 = document.getElementById("btn2");
          
          <?php 
            if (isset($_SESSION['session_id'])) { ?>
              btn.addEventListener("click", function() {
                window.location.href='pacman.php?modalita=classic';
              });
              btn1.addEventListener("click", function() {
                window.location.href='pacman.php?modalita=invasion';
              });
              btn2.addEventListener("click", function() {
                window.location.href='pacman.php?modalita=insane';
              });                  
        <?php }else{?>
              window.alert("Hey! Non correre troppo. Ricordati di effettuare il login prima di iniziare a giocare!");
        <?php  }?>
        }
        </script>
    </body>
</html>