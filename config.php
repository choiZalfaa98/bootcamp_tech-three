<?php
$host = "localhost"; 
$username = "root"; 
$password = ""; 
$database = "techthree"; 

// Membuat koneksi
$conn = new mysqli($host, $username, $password, $database);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}
?>