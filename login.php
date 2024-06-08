<?php
include 'config.php';

// Inisialisasi pesan notifikasi
$notification = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];
    
    // Query untuk memeriksa keberadaan email dan password dalam database
    $sql = "SELECT * FROM users WHERE  email='$email' AND password='$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Jika ditemukan, alihkan ke halaman index.php
        header("Location: index.php");
        exit();
    } else {
        // Jika tidak ditemukan, atur pesan notifikasi
        $notification = "Email atau password salah";
    }
}
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
                <a id="logo_link" href="landingPage.html">
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