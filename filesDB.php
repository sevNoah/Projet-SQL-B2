<?php

require_once __DIR__ . '/vendor/autoload.php';


$faker = Faker\Factory::create('fr_FR');

require 'connectionDB.php';

$adresse = [];
$cart = [];
$invoice = [];
$command = [];
$payment = [];
$price = [];
$product = [];
$productincart = [];
$users = [];


$pdo -> exec("SET FOREIGN_KEY_CHECKS = 0");
$pdo -> exec("TRUNCATE TABLE adresse");
$pdo -> exec("TRUNCATE TABLE cart");
$pdo -> exec("TRUNCATE TABLE command");
$pdo -> exec("TRUNCATE TABLE invoice");
$pdo -> exec("TRUNCATE TABLE payment");
$pdo -> exec("TRUNCATE TABLE price");
$pdo -> exec("TRUNCATE TABLE product");
$pdo -> exec("TRUNCATE TABLE productincart");
$pdo -> exec("TRUNCATE TABLE users");
$pdo -> exec("SET FOREIGN_KEY_CHECKS = 1");


//create user

for ($i = 0; $i < 10 ; $i++) {
    $pdo ->exec("INSERT INTO users
                 SET name='{$faker -> userName}',
                     last_name ='{$faker -> userName}',
                     email='{$faker -> email}',
                     phone ='{$faker -> e164PhoneNumber}'");
    $users[] = $pdo ->lastInsertId();
}

echo ' USERS done  ';
//create adress

for ($i = 0; $i < 10 ; $i++) {
    $pdo ->exec("INSERT INTO adresse
                 SET city ='{$faker -> city}',
                     apartmentNumber ='{$faker -> buildingNumber}',
                     zipCode='{$faker -> postcode}'");
    $adress[] = $pdo ->lastInsertId();
}

echo ' ADRESS done  ';

//create cart 

for ($i = 0; $i < 10 ; $i++) {
    $pdo ->exec("INSERT INTO cart
                 SET id_users ='{$faker -> randomElement($users)}'");
    $cart[] = $pdo ->lastInsertId();
}

echo ' CART done  ';

// create command

for ($i = 0; $i < 10 ; $i++) {
    $pdo ->exec("INSERT INTO command
                 SET id_cart ='{$faker -> randomElement($cart)}'");
    $order[] = $pdo ->lastInsertId();
}

echo ' COMMAND done  ';

//create payment

for ($i = 0; $i < 10 ; $i++) {
    $pdo ->exec("INSERT INTO payment
                 SET paymentType ='{$faker -> creditCardType}'");
    $payment[] = $pdo ->lastInsertId();
}

echo ' Payment done  ';

// Create Product 

for ($i = 0; $i < 10; $i++) {
    $pdo -> exec("INSERT INTO product
                  SET laptop ='{$faker->randomElement(['Dell', 'HP', 'Asus', 'Lenovo', 'MacBook'])}',
                      computer ='{$faker->randomElement(['Dell', 'HP', 'Asus', 'Lenovo', 'MacBook'])}',
                      screen ='{$faker->randomElement(['LG', 'Acer', 'Asus', 'Lenovo', 'Dell', 'Samsung'])}',
                      mouse ='{$faker->randomElement(['Logitech', 'HP', 'Asus', 'razer', 'corsair', 'apple'])}',
                      keyboard ='{$faker->randomElement(['Logitech', 'HP', 'Asus', 'razer', 'corsair', 'apple'])}'");                 
    $product[] = $pdo ->lastInsertId();
}

echo "PRODUCTS done!   ";

// Create price 

for ($i = 0; $i < 10; $i++) {
    $pdo -> exec("INSERT INTO price
                  SET id_product ='{$faker -> randomElement($product)}'");                 
    $price[] = $pdo ->lastInsertId();
}

echo "PRICE done!   ";


//create invoice 

for ($i = 0; $i < 10 ; $i++) {
    $pdo ->exec("INSERT INTO invoice
                 SET id_command ='{$faker -> randomElement($users)}',
                     id_adresse ='{$faker -> randomElement($cart)}',
                     id_payment ='{$faker -> randomElement($payment)}',
                     total ='{$faker -> randomFloat(2, 1000, 10000)}'");
    $invoice[] = $pdo ->lastInsertId();
}

echo ' INVOICE done  ';

echo "PRODUCTS done!   ";

// Create Product in cart 

for ($i = 0; $i < 1; $i++) {
    $pdo->exec("INSERT INTO productincart 
                SET id_product = '4',
                    id_cart = '6',
                    id_price = '9',
                    quantity = '2'");      
    $productInCart[] = $pdo->lastInsertId();
}

echo "Product in Cart done!   ";











