<?php
try {
    $mysqli = new mysqli("localhost", "root", "", "mydb");
       
} catch (mysqli_sql_exception $e) {
    echo "Error:". $e->getMessage();
}