<?php
$config = [
    'db_engine' => 'mysql',
    'db_host' => '127.0.0.1:3307',      //ricorda di cambiare la porta se necessario
    'db_name' => 'maldarella_616374',
    'db_user' => 'root',
    'db_password' => 'root',
];

$db_config = $config['db_engine'] . ":host=".$config['db_host'] . ";dbname=" . $config['db_name'];

try {
    $pdo = new PDO($db_config, $config['db_user'], $config['db_password'], [
        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"
    ]);
        
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
} catch (PDOException $e) {
    exit("Impossibile connettersi al database: " . $e->getMessage());
}
?>