<?php
session_start();
require_once('database.php');

if (isset($_SESSION['session_id'])) {
    header('Location: index.php');
    exit;
}

if (isset($_POST['login'])) {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';
    
    if (empty($username) || empty($password)) {
        $msg = 'Inserisci username e password';
    } else {
        $query = "
            SELECT username, password
            FROM utenti
            WHERE username = :username
        ";
        
        $check = $pdo->prepare($query);
        $check->bindParam(':username', $username, PDO::PARAM_STR);
        $check->execute();
        
        $user = $check->fetch(PDO::FETCH_ASSOC);
        
        if (!$user || password_verify($password, $user['password']) === false) {
            $msg = 'Credenziali utente errate';
        } else {
            session_regenerate_id();
            $_SESSION['session_id'] = session_id();
            $_SESSION['session_user'] = $user['username'];
            $_SESSION['first_login'] = false; 
            header('Location: index.php');
            exit;
        }
    }
    
    printf('<div id="message">'.$msg.'</div>');
}
?>
<!DOCTYPE html>
<html lang="it">
<head>
    <title>Login</title>
 
    <link href="https://fonts.googleapis.com/css?family=Press+Start+2P&ampdisplay=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/login_body.css">
    <link rel="stylesheet" href="css/login_shape.css">
    <link rel="stylesheet" href="css/login_form.css">
    <link rel="stylesheet" href="css/login_navbar.css">

    <link rel="icon" href="favicon.ico" type="image/x-icon">

</head>

<body>
<header>
            <div class="logo">
               <img src="img/Logo.png" alt="">
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
                    
                    <li><a href="sign_up.php">Sign Up</a></li>
                    <li><img src="img/import.png" class="img_login" alt="immagine_di_login"></li>
                </ul>
              </nav>
    </header>

    <div class="background">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    <form method="post" action="login.php">
        <h3>Login </h3>
        <br><br><br><br>
        <div class="form-control">
        
        <input type="text" id="username"  name="username" required>
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
        <button type="submit" name="login" id="login">Login</button>
        </form>
        <script src="js/login.js"></script>
</body>


</html>
