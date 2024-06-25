<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "techthree";

// Membuat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $pwd = $_POST['pwd'];

    // Mencegah SQL Injection
    $email = $conn->real_escape_string($email);
    $pwd = $conn->real_escape_string($pwd);

    // Query untuk memeriksa kredensial pengguna
    $sql = "SELECT id, name, password FROM users WHERE email = '$email'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        if (password_verify($pwd, $user['password'])) {
            // Menyimpan data pengguna ke sesi
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['user_name'] = $user['name'];
            header("Location: profile.php"); // Ganti dengan halaman tujuan setelah login
            exit();
        } else {
            echo "Kata sandi salah.";
        }
    } else {
        echo "Email tidak ditemukan.";
    }
}

$conn->close();
?>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>
        <link rel="stylesheet" href="techthree.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <!-- LOGIN -->
        <header>
            <header>
                <a id="logo_link" href="index.php">
                    <img src="Logo.png" id="logo">
                </a>
            </header>
        </header>
        <div class="container-login">
            <div class="row">
                <div class="col">
                    <img class="img-regist" src="login.png" alt="Login Image">
                </div>
                <div class="col">
                    <form class="form-login">
                        <h1 style="text-align: center;"><b>MASUK</b></h1><br>
                        <label for="email">User ID/Email</label>
                        <input type="email" id="email" name="email" placeholder="Masukkan User ID/email terdaftar" required><br>
                        <label for="pwd">Kata Sandi</label>
                        <input type="password" id="pwd" name="pwd" placeholder="Masukkan min 8 karakter" required><br>
                        <button class="button-login" type="submit">Submit</button>
                        <a style="color: #811700;" href="registrasi.html">Belum punya akun?</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>