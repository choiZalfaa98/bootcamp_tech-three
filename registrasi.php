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

// Fungsi untuk memeriksa apakah email sudah terdaftar
function checkUserExists($email, $conn) {
    $sql = "SELECT id FROM users WHERE email='$email'";
    $result = $conn->query($sql);
    return $result->num_rows > 0;
}

// Memproses permintaan POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['check_email'])) {
        // Cek apakah email sudah terdaftar
        $email = $_POST['email'];
        if (checkUserExists($email, $conn)) {
            echo 'exists';
        } else {
            echo 'not exists';
        }
    } else {
        // Proses pendaftaran
        $name = $_POST['name'];
        $tanggal = $_POST['tanggal'];
        $bulan = $_POST['bulan'];
        $tahun = $_POST['tahun'];
        $pnumber = $_POST['pnumber'];
        $email = $_POST['email'];
        $pwd = password_hash($_POST['pwd'], PASSWORD_DEFAULT); // Menggunakan hash untuk kata sandi

        if (!checkUserExists($email, $conn)) {
            $sql = "INSERT INTO users (name, tanggal, bulan, tahun, pnumber, email, password)
                    VALUES ('$name', '$tanggal', '$bulan', '$tahun', '$pnumber', '$email', '$pwd')";
            if ($conn->query($sql) === TRUE) {
                echo "Pendaftaran berhasil";
            } else {
                echo "Terjadi kesalahan: " . $sql . "<br>" . $conn->error;
            }
        } else {
            echo "Email sudah terdaftar.";
        }
    }
}

$conn->close();
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

   <script>
        document.getElementById('registrationForm').onsubmit = function(event) {
            // Mencegah form dari submit langsung
            event.preventDefault();

            // Mengambil nilai dari form
            var email = document.getElementById('email').value;

            // Mengirim data ke server untuk pengecekan
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'check_user.php', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    if (xhr.responseText == 'exists') {
                        alert('User sudah terdaftar. Silakan gunakan email yang berbeda.');
                    } else if (xhr.responseText == 'not exists') {
                        // Jika user tidak ada, submit form
                        document.getElementById('registrationForm').submit();
                    } else {
                        alert('Terjadi kesalahan pada server. Silakan coba lagi.');
                    }
                }
            };
            xhr.send('email=' + encodeURIComponent(email));
        };
    </script>
    </body>
</html>