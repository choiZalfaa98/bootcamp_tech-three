<?php
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

session_start();

// Memastikan pengguna sudah login dan memiliki sesi aktif
if (!isset($_SESSION['user_id'])) {
    die("Anda harus login untuk mengakses halaman ini.");
}

$user_id = $_SESSION['user_id'];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $pnumber = $_POST['pnumber'];
    $email = $_POST['email'];
    $pwd = $_POST['pwd'];
    $cpwd = $_POST['cpwd'];

    if ($pwd != $cpwd) {
        die("Kata sandi dan konfirmasi kata sandi tidak cocok.");
    }

    // Update query untuk memperbarui data profil pengguna
    $update_query = "UPDATE users SET name = '$name', pnumber = '$pnumber', email = '$email'";

    if (!empty($pwd)) {
        $hashed_pwd = password_hash($pwd, PASSWORD_DEFAULT);
        $update_query .= ", password = '$hashed_pwd'";
    }

    $update_query .= " WHERE id = $user_id";

    if ($conn->query($update_query) === TRUE) {
        echo "Profil berhasil diperbarui";
    } else {
        echo "Terjadi kesalahan: " . $conn->error;
    }
}

// Mengambil data pengguna untuk ditampilkan
$user_query = "SELECT name, email, pnumber FROM users WHERE id = $user_id";
$user_result = $conn->query($user_query);

if ($user_result->num_rows > 0) {
    $user_data = $user_result->fetch_assoc();
} else {
    die("Pengguna tidak ditemukan.");
}

$conn->close();
?>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Profile</title>
        <link rel="stylesheet" href="techthree.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <a id="logo_link" href="landingPage.html">
                <img src="Logo.png" id="logo">
            </a>
        </header>
        <h1 id="h1-p"><b>Edit Profile</b></h1>
        <div class="container-profile">
            <div class="row">
                <div class="col" id="my-profile">
                    <img src="user.png" alt="Ava Image">
                    <h3 class="h-p"><b>Nama Lengkap</b></h4>
                    <h5 class="h-p">myemail@gmail.com</h5>
                    <h6 class="h-p">081x-xxxx-xxxx</h6>
                </div>
                <div class="col">
                    <form id="edit-profile">
                        <label for="name">Nama Lengkap</label>
                        <input type="text" id="name" name="name" placeholder="Masukkan nama lengkap"><br>
                        <label for="pnumber">No. Handphone</label>
                        <input type="tel" id="pnumber" name="pnumber" placeholder="Masukkan No. Handphone baru"><br>           
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="Masukkan email aktif baru"><br>
                        <div class="row" id="sandi-profile">
                            <div class="col">
                                <label for="pwd">Kata Sandi</label>
                                <input type="password" id="pwd" name="pwd" placeholder="Masukkan kata sandi baru"><br>
                            </div>
                            <div class="col">
                                <label for="cpwd">Ulangi Kata Sandi</label>
                                <input type="password" id="cpwd" name="cpwd" placeholder="Ulangi kata sandi baru"><br>
                            </div>
                        </div><br>
                        <button class="button-regist" type="submit">Edit</button>
                    </form>
                </div>                    
            </div>
        </div>
    </body>
</html>