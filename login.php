<?php 
    $host = "oscar.sewanee.edu";
    $data = "needAHand";
    $user = "guest";
    $pass = "icecream";
    $attr = "mysql:host=$host;dbname=$data";
    try
    {   
        $pdo = new PDO("mysql:host=$host;dbname=$data", $user, $pass);
    }
    catch (PDOException $e)
    {   
        throw new PDOException($e->getMessage(), (int)$e->getCode());
    }
?>