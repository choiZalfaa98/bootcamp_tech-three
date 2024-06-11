<?php
include 'config.php';

// Inisialisasi variabel pesan
$message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $email = $_POST['email'];

    // Validasi sederhana
    if (!empty($username) && !empty($email)) {
        echo "<h1>Profil Pengguna</h1>";
        echo "<p>Username: " . htmlspecialchars($username) . "</p>";
        echo "<p>Email: " . htmlspecialchars($email) . "</p>";
    } else {
        echo "Semua kolom harus diisi.";
    }
} else {
    echo "Invalid request method.";
}
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
        <script src="dashboard.js" defer></script>
    </head>
    <body>
        <header>
            <a id="logo_link" href="dashboard.html">
                <img src="Logo.png" id="logo">
            </a>
            <!--Navigasi halaman lapor keluh kesah dan profile-->
            <nav id="nav_header">
                <!--Navigasi Feedback/Lapor-->
                <a href="#" class="circle-container">
                    <img class="circle-img" src="feedback.png">
                </a>
                <!--Navigasi Halaman Profile-->
                <p id="userProf" onclick="toggleMenu()" class="circle-container">
                    <img class="circle-img" src="user.png">
                </p>
                <!--dropdown menu-->
                <div id="subMenu" class="subMenu-wrap">
                    <div class="subMenu">
                        <div class="user-info">
                            <img src="user.png">
                            <h2>user0767</h2>
                        </div>
                        <hr>
                            <!--link-->
                            <a href="javascript:void(0);" class="sub-menu-link" onclick="navigateTo('dashboardContent', 'dashboard.html')">
                                <img src="dashboardIcon.png">
                                <p>Dashboard</p>
                            </a>
                            <a href="profile.html" class="sub-menu-link">
                                <img src="profileIcon.png">
                                <p>Profile</p>
                            </a>
                            <a href="javascript:void(0);" class="sub-menu-link" onclick="navigateTo('kelasBootcampContent', 'dashboard.html')">
                              <img src="kelasSayaIcon.png">
                              <p>Kelas Bootcamp</p>
                            </a>
                            <a href="javascript:void(0);" class="sub-menu-link" onclick="navigateTo('proyekAkhirContent', 'dashboard.html')">
                              <img src="projectIcon.png">
                              <p>Proyek Akhir</p>
                            </a>
                            <a href="#" class="sub-menu-link">
                              <img src="certificateIcon.png">
                              <p>Sertifikat</p>
                            </a>
                            <a href="feedback.html" class="sub-menu-link">
                              <img src="feedback.png">
                              <p>Feedback</p>
                            </a>
                            <!--log out-->
                            <a href="#" id="logOut" class="sub-menu-link">
                              <img src="logOut.png">
                              <p>Keluar</p>
                            </a>
                    </div>
                </div>
            </nav>
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