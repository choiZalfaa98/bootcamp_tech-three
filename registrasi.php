<?php
include 'config.php';

// Inisialisasi variabel pesan
$message = "";

//Memasukan Form Ke Database
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $fullName = $_POST['fullName'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    $sql = "INSERT INTO users (fullName, email, password) VALUES ('$fullName', '$email', '$password')";

    if ($conn->query($sql) === TRUE) {
        // Atur pesan berhasil
        $message = "Registrasi berhasil";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registrasi</title>
        <link rel="stylesheet" href="techthree.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <!-- REGISTRATION -->
        <header>
            <a id="logo_link" href="landingPage.html">
                <img src="Logo.png" id="logo">
            </a>
        </header>
        <div class="container-regist">
            <div class="row">
                <div class="col">
                    <form class="form-registration">
                        <h1 style="text-align: center;"><b>DAFTAR</b></h1><br>
                        <label for="name">Nama Lengkap</label>
                        <input type="text" id="name" name="name" placeholder="Masukkan nama lengkap" required><br>
                        <label for="date">Tanggal Lahir</label>
                        <div class="row">
                            <div class="col">
                                <input type="number" id="tanggal" name="tanggal" min="1" max="31" placeholder="Tanggal" required>
                            </div>
                            <div class="col">
                                <input type="number" id="bulan" name="bulan" min="1" max="12" placeholder="Bulan" required>
                            </div>
                            <div class="col">
                                <input type="number" id="tahun" name="tahun" min="1900" max="2099" placeholder="Tahun" required><br>
                            </div>
                        </div><br>
                        <label for="pnumber">No. Handphone</label>
                        <input type="tel" id="pnumber" name="pnumber" placeholder="Masukkan No. Handphone" required><br>           
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="Masukkan email aktif" required><br>
                        <label for="pwd">Kata Sandi</label>
                        <input type="password" id="pwd" name="pwd" placeholder="Masukkan min 8 karakter" required><br>
                        <label for="cpwd">Ulangi Kata Sandi</label>
                        <input type="password" id="cpwd" name="cpwd" placeholder="Masukkan min 8 karakter" required><br>
                        <button class="button-regist" type="submit">Kirim</button>
                        <a style="color: #811700;" href="login.html">Sudah punya akun?</a>
                    </form>
                </div>
                <div class="col">
                    <img id="img-regist" src="registrasi.png" alt="Registrasi Image">
                </div>
            </div>
        </div>
    </body>
</html>