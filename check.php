<?php
$host = "localhost"; 
$username = "root"; 
$password = ""; 
$database = "techthree"; 
$conn = mysqli_connect ($host, $username, $password, $database);

$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
   die("Connection Failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>