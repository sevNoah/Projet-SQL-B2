<?php


$host = "localhost";
$db = "e-commerce";
$user = "root";
$password = "";
$port = "3308";
$charset = "utf8mb4";
$dsn = "mysql:host=$host;dbname=$db;charset=$charset";

$option =[
    \PDO::ATTR_ERRMODE            => \PDO::ERRMODE_EXCEPTION,
    \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
    \PDO::ATTR_EMULATE_PREPARES   => false,
]; 

try {
    $pdo = new \PDO($dsn, $user, $password, $option);
    echo "connection established\n";
} catch (\PDOException $e) {
    throw new \PDOException($e -> getMessage(),  $e ->getCode());
}
?>