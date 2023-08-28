<?php
require_once('database.php');

if (isset($_POST['register'])) {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';
    $isUsernameValid = filter_var(
        $username,
        FILTER_VALIDATE_REGEXP, [
            "options" => [
                "regexp" => "/^[a-z\d_]{3,20}$/i"
            ]
        ]
    );
    $pwdLenght = mb_strlen($password);
    
    if (empty($username) || empty($password)) {
        $msg = 'Compila tutti i campi';
    } elseif (false === $isUsernameValid) {
        $msg = 'username non è valido. Sono ammessi solamente caratteri 
                alfanumerici e l\'underscore. Lunghezza minina 3 caratteri.
                Lunghezza massima 20 caratteri';
    } elseif ($pwdLenght < 8 || $pwdLenght > 20) {
        $msg = 'Lunghezza minima password 8 caratteri.
                Lunghezza massima 20 caratteri';
    } else {
        $password_hash = password_hash($password, PASSWORD_BCRYPT);

        $query = "
            SELECT username
            FROM utenti
            WHERE username = :username
        ";
        
        $check = $pdo->prepare($query);
        $check->bindParam(':username', $username, PDO::PARAM_STR);
        $check->execute();
        
        $user = $check->fetchAll(PDO::FETCH_ASSOC);
        
        if (count($user) > 0) {
            $msg = 'Username già in uso';
        } else {
            $query = "
                INSERT INTO utenti
                VALUES (:username, :password)
            ";
        
            $check = $pdo->prepare($query);
            $check->bindParam(':username', $username, PDO::PARAM_STR);
            $check->bindParam(':password', $password_hash, PDO::PARAM_STR);
            $check->execute();
            
            if ($check->rowCount() > 0) {
                $msg = 'Registrazione eseguita con successo';
            } else {
                $msg = 'Problemi con l\'inserimento dei dati';
            }
        }
    }
    
    printf('<div id="message">'.$msg.'</div>');
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <title>Sign Up</title>
 
    <link href="https://fonts.googleapis.com/css?family=Press+Start+2P&ampdisplay=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/sign_body.css">
    <link rel="stylesheet" href="css/sign_shape.css">
    <link rel="stylesheet" href="css/sign_form.css">
    <link rel="stylesheet" href="css/sign_navbar.css">

    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <style media="screen">
    </style>
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
                        <a href="index.php">Home</a>
                    </li>
                    <li>
                        <a href="index.php#controls">Controls</a>
                    </li>
                    <li>
                        <a href="index.php#cards" >Play</a>
                    </li>
                    <li><a href="login.php" >Login</a></li>
                    
                    <li><img src="img/import.png" class="img_login" alt="immagine_sing"></li>
                </ul>
              </nav>
    </header>
    <div class="background">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    <form method="post" action="sign_up.php">
        <h3>Sign Up</h3>

        <br><br><br><br>
        <div class="form-control">
        
            <input type="text" id="username" name="username" maxlength="50" required>
            <label>
                <span style="transition-delay:0ms">U</span><span style="transition-delay:50ms">s</span><span style="transition-delay:100ms">e</span><span style="transition-delay:150ms">r</span><span style="transition-delay:200ms">n</span><span style="transition-delay:250ms">a</span><span style="transition-delay:300ms">m</span><span style="transition-delay:350ms">e</span>
            </label>
        </div>
        <br><br><br><br>
        <div class="form-control">
        <input type="password" id="password" name="password" required>
            <label>
                <span style="transition-delay:0ms">P</span><span style="transition-delay:50ms">a</span><span style="transition-delay:100ms">s</span><span style="transition-delay:150ms">s</span><span style="transition-delay:200ms">w</span><span style="transition-delay:250ms">o</span><span style="transition-delay:300ms">r</span><span style="transition-delay:350ms">d</span>
            </label>
            
        </div>
        <button type="submit" name="register" id="sign">Sign Up</button>
    </form>
    <script src="js/sign.js"></script>
</body>


</html>
