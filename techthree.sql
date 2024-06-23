-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2024 at 10:14 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techthree`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Id_Admin` varchar(20) NOT NULL,
  `Nama_Admin` varchar(50) NOT NULL,
  `Password_Admin` varchar(20) NOT NULL,
  `No_Telp_Admin` varchar(20) NOT NULL,
  `Tanggal_Lahir_Admin` date DEFAULT NULL,
  `Tanggal_Lahir_Temp` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Id_Admin`, `Nama_Admin`, `Password_Admin`, `No_Telp_Admin`, `Tanggal_Lahir_Admin`, `Tanggal_Lahir_Temp`) VALUES
('Ad01', 'Salwa Nafisa', 'S4lw4!@', '085987654344', '2002-02-22', NULL),
('Ad02', 'Ika Kusuma Wardani', 'Ik4kus@$', '085354356772', '2002-05-15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `Id_Kelas` varchar(20) NOT NULL,
  `Nama_Kelas` varchar(50) NOT NULL,
  `Link_Sertifikat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`Id_Kelas`, `Nama_Kelas`, `Link_Sertifikat`) VALUES
('Kls01', 'UI/UX', NULL),
('Kls02', 'Fotografi', NULL),
('Kls03', 'Web Development', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `Id_Materi` varchar(20) NOT NULL,
  `Nama_Materi` varchar(50) NOT NULL,
  `Durasi_Materi` varchar(20) NOT NULL,
  `video_link` varchar(255) DEFAULT NULL,
  `Id_Kelas` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`Id_Materi`, `Nama_Materi`, `Durasi_Materi`, `video_link`, `Id_Kelas`) VALUES
('mf01', 'Photography Introduction', '20:15', 'https://www.youtube.com/embed/ujaCbzLwuB8', 'Kls02'),
('mf02', 'Photography Basics', '15:40', 'https://www.youtube.com/embed/5vu8ZVlSSqs', 'Kls02'),
('mf03', '#3 Camera Angles', '18:05', 'https://www.youtube.com/embed/7fUi9sIu7rs', 'Kls02'),
('mf04', 'Composition', '12:30', 'https://www.youtube.com/embed/O6rby36Me_4', 'Kls02'),
('mf05', 'Exposure Triangle', '14:55', 'https://www.youtube.com/embed/n0_EF9Empn4', 'Kls02'),
('mu01', '#1 UI/UX for Beginners', '10:00', 'https://www.youtube.com/embed/HmKwiEmJIdM', 'Kls01'),
('mu02', '#2 Tools UI/UX', '12:30', 'https://www.youtube.com/embed/0A1QIKtvw6c', 'Kls01'),
('mu03', '#3 UI Design Principles', '15:20', 'https://www.youtube.com/embed/UR8I3SETvEQ', 'Kls01'),
('mu04', '#4 UX Design Thinking', '8:45', 'https://www.youtube.com/embed/z6ElLJ8usLU', 'Kls01'),
('mu05', '#5 Komponen UI/UX', '11:05', 'https://www.youtube.com/embed/LyZoeQ1o1fo', 'Kls01'),
('mw01', '#1 Web Development Introduction', '25:30', 'https://www.youtube.com/embed/ysEN5RaKOlA', 'Kls03'),
('mw02', 'Web Development Tools', '18:10', 'https://www.youtube.com/embed/RAAd1TelBls', 'Kls03'),
('mw03', 'HTML Basics', '12:45', 'https://www.youtube.com/embed/kUMe1FH4CHE', 'Kls03'),
('mw04', 'CSS Basics', '15:20', 'https://www.youtube.com/embed/PKaA3xKiYF0', 'Kls03'),
('mw05', 'Responsive Website with Bootstrap', '20:05', 'https://www.youtube.com/embed/eow125xV5-c', 'Kls03');

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE `progress` (
  `Id_Progress` varchar(20) NOT NULL,
  `Id_User` varchar(20) DEFAULT NULL,
  `Id_Materi` varchar(20) DEFAULT NULL,
  `Id_Kelas` varchar(20) DEFAULT NULL,
  `percentage` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `progress`
--

INSERT INTO `progress` (`Id_Progress`, `Id_User`, `Id_Materi`, `Id_Kelas`, `percentage`, `created_at`, `updated_at`) VALUES
('5244c718-300a-11ef-9', 'User001', 'mu01', 'Kls01', 40, '2024-06-21 20:10:35', '2024-06-21 20:10:38');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `Id_Projects` varchar(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `overview` text DEFAULT NULL,
  `results` text DEFAULT NULL,
  `Id_Kelas` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`Id_Projects`, `title`, `description`, `overview`, `results`, `Id_Kelas`) VALUES
('PR01', 'Design Aplikasi Mobile E-Commerce Niche untuk Fashion Sustainable', 'Di dunia e-commerce, niche atau ceruk pasar merujuk pada segmen khusus dalam pasar yang lebih luas. Ini melayani audiens tertentu dengan kebutuhan dan preferensi yang unik. Bisnis e-commerce niche berfokus menawarkan produk yang lebih spesifik dibandingkan dengan retailer online yang umum. E-commerce Niche berfokus pada target audiens tertentu dengan minat atau kebutuhan khusus. Misalnya, berspesialisasi dalam industri pakaian berkelanjutan. Aplikasi mobile e-commerce niche yang berfokus pada penjualan produk fashion berkelanjutan, dapat membantu konsumen yang peduli lingkungan untuk menemukan dan membeli pakaian, aksesoris, dan produk fashion lainnya yang ramah lingkungan dan etis. Aplikasi ini akan menampilkan berbagai merk dan desainer yang memprioritaskan praktik berkelanjutan dalam produksi dan bahan mereka.\r\n', 'Fitur Utama:\r\n- Pencarian dan browsing produk berdasarkan kategori, merek, bahan, dan kriteria keberlanjutan lainnya.\r\n- Rekomendasi produk yang dipersonalisasi berdasarkan preferensi dan gaya pengguna.\r\n- Informasi detail produk yang mencakup deskripsi, bahan, praktik keberlanjutan, dan ulasan pelanggan.\r\n- Keranjang belanja dan proses checkout yang mudah digunakan.\r\n- Pelacakan pesanan dan pemberitahuan pengiriman.\r\n- Blog dan konten edukasi tentang fashion berkelanjutan.\r\n\r\nDesain:\r\nAntarmuka yang intuitif dan ramah pengguna dengan estetika modern dan minimalis. Penggunaan warna dan gambar yang mencerminkan nilai-nilai keberlanjutan serta tata letak yang jelas dan mudah dinavigasi.\r\n\r\nTujuan Proyek:\r\n- Meningkatkan kesadaran tentang fashion berkelanjutan\r\n- Menyediakan platform yang mudah digunakan dan nyaman bagi konsumen untuk menemukan dan membeli produk fashion berkelanjutan.\r\n', 'Hasil akhir proyek yang diharapkan berupa: \r\nLaporan proyek akhir yang mencakup proses pengembangan desain menggunakan metode Design Thinking\r\nTautan Desain Figma\r\nVideo demo prototype desain\r\n', 'Kls01'),
('PR02', 'Portraiture through Cultural Lens', 'Peserta akan mengembangkan kemampuan fotografi potret mereka dengan fokus pada lensa budaya. Mereka akan diminta untuk menangkap esensi kehidupan sehari-hari, ekspresi wajah, dan cerita melalui fotografi potret yang menggambarkan keanekaragaman budaya di sekitar \r\nmereka. Tugas ini menggabungkan teknik fotografi potret, penggunaan cahaya, komposisi, serta kemampuan untuk membangun hubungan dengan subjek foto.\r\n', 'Fitur Utama:\r\n- Fokus pada budaya\r\n- Narasi visual yang kuat dalam menghubungkan tiap foto\r\n\r\nTujuan Proyek:\r\n- Memberikan pengalaman mendalam dalam fotografi potret dengan sudut pandang budaya yang kuat\r\n- Memahami bagaimana latar belakang budaya seseorang dapat mempengaruhi ekspresi dan identitas\r\n- Belajar menceritakan cerita melalui foto\r\n- Mengasah keterampilan dalam berinteraksi dengan subjek foto dari latar belakang budaya yang berbeda\r\n', 'Hasil akhir proyek yang diharapkan berupa: \r\n- Portofolio digital\r\n- Video presentasi\r\n', 'Kls02'),
('PR03', 'Sistem Manajemen Toko Online', 'Sistem ini memungkinkan pemilik toko dapat menjalankan toko online secara efisien seperti dalam hal mengelola produk, inventaris, pesanan, dan pelanggan mereka secara terpusat melalui antarmuka web yang responsif dan mudah digunakan. Pada web diharapkan terdapat beberapa fitur seperti untuk manajemen produk, pesanan, pelanggan, pencarian dan dilter serta checkout dan pembayaran.\r\n', 'Fitur Utama:\r\n- Tambah, edit, dan hapus produk dengan deskripsi, gambar, harga, dan kategori.\r\n- Kelola stok produk dan status ketersediaan.\r\n- Lihat dan kelola pesanan yang masuk dari pelanggan.\r\n- Konfirmasi, proses, dan hapus pesanan.\r\n- Daftar dan kelola informasi pelanggan.\r\n- Lihat riwayat pembelian pelanggan dan status akun.\r\n- Pencarian produk berdasarkan nama, kategori, atau harga.\r\n- Filter produk untuk mempermudah navigasi pelanggan.\r\n- Integrasi dengan sistem pembayaran online (opsional).\r\n- Proses checkout yang aman dan mudah bagi pengguna.\r\n\r\nDesain:\r\nAntarmuka yang intuitif dan ramah pengguna dengan estetika modern dan minimalis. Penggunaan warna dan gambar yang mencerminkan nilai-nilai keberlanjutan serta tata letak yang jelas dan mudah dinavigasi.\r\n\r\nTujuan Proyek:\r\nMembuat platform e-commerce yang fungsional dan dapat diimplementasikan, mencakup aspek manajemen produk, pesanan, dan pelanggan secara efisien.', 'Hasil akhir proyek yang diharapkan berupa:\r\n- Kode Sumber (HTML, CSS, JavaScript, dan backend (PHP, Python))\r\n- Dokumentasi lengkap seperti cara instalasi, konfigurasi, dan manual user\r\n- Presentasi atau laporan yang berisi ringkasan fitur - fitur\r\n- Video demo web\r\n', 'Kls03');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `Id_Quiz` varchar(11) NOT NULL,
  `question_text` text NOT NULL,
  `option_a` text NOT NULL,
  `option_b` text NOT NULL,
  `option_c` text NOT NULL,
  `option_d` text NOT NULL,
  `correct_answer` char(1) NOT NULL,
  `category` varchar(100) NOT NULL,
  `Id_Kelas` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`Id_Quiz`, `question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`, `category`, `Id_Kelas`) VALUES
('FQ01', 'Memengaruhi tampilan, nuansa, dan warna sehingga foto atau video yang dibuat dapat menyampaikan pesannya dengan baik adalah fungsi dari ...', 'Komposisi', 'Exposure', 'Camera angle', 'Aperture', 'C', 'Fotografi', 'Kls02'),
('FQ02', 'Berikut merupakan elemen dasar yang termasuk ke dalam exposure triangle, kecuali ...', 'ISO', 'Exposure', 'Aperture', 'Shutter Speed', 'B', 'Fotografi', 'Kls02'),
('FQ03', 'Konsep paling umum dalam hal tata letak yakni ...', 'Rule of First', 'Rule of Second', 'Rule of Third', 'Rule of Fourth', 'C', 'Fotografi', 'Kls02'),
('FQ04', 'Agar prototype yang ada di Figma dapat langsung terlihat pada smartphone, smartphone perlu menginstall aplikasi ...', 'Wide shot', 'Knee shot', 'Low camera angle', 'Close Up', 'A', 'Fotografi', 'Kls02'),
('FQ05', 'Pengambilan gambar yang memperlihatkan bagian kepala hingga bahu subjek merupakan jenis pengambilan gambar ...', 'Wide shot', 'Knee shot', 'Low camera angle', 'Close Up', 'D', 'Fotografi', 'Kls02'),
('UQ01', 'Sebagai seorang desainer, penting untuk memilih tools yang dapat meningkatkan...', 'Kreativitas dan Estetika', 'Produktivitas dan Kreativitas', 'Produktivitas dan Estetika', 'Usabilitas dan Estetika', 'B', 'Desain UI/UX', 'Kls01'),
('UQ02', 'Tools apa yang akan kita gunakan pada kelas ini dalam membuat desain UI/UX?', 'Capcut', 'Procreate', 'Adobe Photoshop', 'Figma', 'D', 'Desain UI/UX', 'Kls01'),
('UQ03', 'Plugin apa yang dapat digunakan dalam membuat animasi yang ringan untuk desain UI/UX?', 'AEUX', 'Jetpack', 'Instagram Feed', 'Yoast SEO', 'A', 'Desain UI/UX', 'Kls01'),
('UQ04', 'Agar prototype yang ada di Figma dapat langsung terlihat pada smartphone, smartphone perlu menginstall aplikasi ...', 'Adobe Photoshop', 'Canva', 'Medium', 'Figma Mirror App', 'D', 'Desain UI/UX', 'Kls01'),
('UQ05', 'Website untuk melakukan testing prototype yang dapat dibuat adalah, kecuali ...', 'Canva', 'Maze', 'Sketch', 'Marvel', 'A', 'Desain UI/UX', 'Kls01'),
('WQ01', 'Berikut ini merupakan jenis - jenis IDE, kecuali ...', 'VS Code', 'Vim', 'Atom', 'Maze', 'D', 'Web Development', 'Kls03'),
('WQ02', 'Berikut merupakan bahasa programming yang popular digunakan pada pengembangan web, kecuali ...', 'Assembly', 'PHP', 'Python', 'Node.JS', 'A', 'Web Development', 'Kls03'),
('WQ03', 'Bertujuan untuk menata layout dan halaman web, seperti warna font, ukuran frame, dan komponen lain dengan tujuan untuk membuat halaman web lebih menarik adalah fungsi bahasa ...', 'Marvel', 'JavaScript', 'CSS', 'HTML', 'C', 'Web Development', 'Kls03'),
('WQ04', 'Untuk memberikan warna merah pada suatu kata atau kalimat, dapat menggunakan style ...', 'color: red;', 'font-color: red;', 'color=red;', 'color-font: red;', 'A', 'Web Development', 'Kls03'),
('WQ05', 'Judul halaman web biasanya diletakkan pada section ...', 'lefter', 'head', 'footer', 'body', 'B', 'Web Development', 'Kls03');

-- --------------------------------------------------------

--
-- Table structure for table `sertifikat`
--

CREATE TABLE `sertifikat` (
  `Id_Sertifikat` varchar(20) NOT NULL,
  `Id_User` varchar(20) NOT NULL,
  `Id_Kelas` varchar(20) NOT NULL,
  `Tanggal_Diterbitkan` date NOT NULL,
  `Id_Tugas` varchar(20) DEFAULT NULL,
  `Status` varchar(20) NOT NULL,
  `Link_Sertifikat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `submission`
--

CREATE TABLE `submission` (
  `Id_Submission` varchar(20) NOT NULL,
  `link_google_drive` varchar(255) NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Id_User` varchar(20) DEFAULT NULL,
  `Id_Kelas` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `submission`
--

INSERT INTO `submission` (`Id_Submission`, `link_google_drive`, `submitted_at`, `Id_User`, `Id_Kelas`) VALUES
('SUB6675dddd64cc1', 'https://drive.google.com/file/d/1tRu1FAJKcn5_B_3gu4I-1ATs98gi7RD7/view?usp=drive_link', '2024-06-21 20:09:01', 'User001', 'Kls01');

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `Id_Tugas` varchar(20) NOT NULL,
  `Nama_Tugas` varchar(50) NOT NULL,
  `Nilai_Tugas` int(11) NOT NULL,
  `Id_Admin` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tugas`
--

INSERT INTO `tugas` (`Id_Tugas`, `Nama_Tugas`, `Nilai_Tugas`, `Id_Admin`) VALUES
('Tgf01', 'Kuis 1 Fotografi', 80, 'Ad01');

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE `tutor` (
  `Id_Tutor` varchar(20) NOT NULL,
  `Nama_Tutor` varchar(50) NOT NULL,
  `Password_Tutor` varchar(20) NOT NULL,
  `Nama_Kelas` varchar(50) NOT NULL,
  `Tanggal_Lahir_Tutor` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tutor`
--

INSERT INTO `tutor` (`Id_Tutor`, `Nama_Tutor`, `Password_Tutor`, `Nama_Kelas`, `Tanggal_Lahir_Tutor`) VALUES
('Tr001', 'Leli Sawitri', 'L33li!@', 'UI/UX', '2002-02-09'),
('Tr002', 'Choirunnisa Zalfaa Nabilah', 'CH01!Nisa', 'Fotografi', '2001-08-22'),
('Tr003', 'Inayah Puteri Salsabila', '1N4y!@h', 'Web Development', '2002-04-12'),
('Tr004', 'Leonardo Edwin', 'E6W!n', 'UI/UX', '2000-05-13'),
('Tr005', 'Dillond Willend', 'W!l13n', 'Fotografi', '1998-04-24'),
('Tr006', 'Joya Isarua', 'Is4ru@!', 'Web Development', '2000-09-28');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Id_User` varchar(20) NOT NULL,
  `Nama_User` varchar(50) NOT NULL,
  `Password_User` varchar(20) NOT NULL,
  `No_Telp_User` varchar(20) NOT NULL,
  `Nama_Kelas` varchar(50) DEFAULT NULL,
  `Tanggal_Lahir_User` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `Id_Admin` varchar(20) DEFAULT NULL,
  `Id_Tugas` varchar(20) DEFAULT NULL,
  `Nilai_Tugas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id_User`, `Nama_User`, `Password_User`, `No_Telp_User`, `Nama_Kelas`, `Tanggal_Lahir_User`, `email`, `Id_Admin`, `Id_Tugas`, `Nilai_Tugas`) VALUES
('User001', 'Mario Atmaja', 'Atm4j@!!', '085675235235', 'Fotografi', '1998-06-06', 'marioatma@gmail.com', NULL, NULL, NULL),
('User003', 'maucoba', 'maucobacoba', '085643764573', NULL, '2004-08-20', 'maucoba@gmail.com', NULL, NULL, NULL),
('User004', 'cobalagidonggg', 'cobalagiii', '087654263546', NULL, '2005-04-21', 'cobalagidonggg@gmail.com', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_kelas`
--

CREATE TABLE `user_kelas` (
  `Id_User` varchar(20) NOT NULL,
  `Id_Kelas` varchar(20) NOT NULL,
  `Tanggal_Mulai` date NOT NULL,
  `Tanggal_Selesai` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_kelas`
--

INSERT INTO `user_kelas` (`Id_User`, `Id_Kelas`, `Tanggal_Mulai`, `Tanggal_Selesai`) VALUES
('User001', 'Kls02', '2024-05-25', '2024-06-10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id_Admin`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`Id_Kelas`),
  ADD UNIQUE KEY `Nama_Kelas` (`Nama_Kelas`),
  ADD KEY `Nama_Kelas_2` (`Nama_Kelas`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`Id_Materi`),
  ADD KEY `fk_id_kelas` (`Id_Kelas`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`Id_Progress`),
  ADD KEY `Id_User` (`Id_User`),
  ADD KEY `Id_Kelas` (`Id_Kelas`),
  ADD KEY `Id_Materi` (`Id_Materi`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`Id_Projects`),
  ADD KEY `fk_projects_kelas` (`Id_Kelas`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`Id_Quiz`),
  ADD KEY `fk_quiz_kelas` (`Id_Kelas`);

--
-- Indexes for table `sertifikat`
--
ALTER TABLE `sertifikat`
  ADD PRIMARY KEY (`Id_Sertifikat`),
  ADD KEY `Id_User` (`Id_User`),
  ADD KEY `Id_Kelas` (`Id_Kelas`),
  ADD KEY `Id_Tugas` (`Id_Tugas`);

--
-- Indexes for table `submission`
--
ALTER TABLE `submission`
  ADD PRIMARY KEY (`Id_Submission`),
  ADD KEY `fk_submission_kelas` (`Id_Kelas`),
  ADD KEY `fk_submission_user` (`Id_User`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`Id_Tugas`),
  ADD KEY `fk_tugas_admin` (`Id_Admin`);

--
-- Indexes for table `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`Id_Tutor`),
  ADD KEY `fk_Nama_Kelas` (`Nama_Kelas`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id_User`),
  ADD KEY `fk_admin_user` (`Id_Admin`),
  ADD KEY `fk_user_tugas` (`Id_Tugas`);

--
-- Indexes for table `user_kelas`
--
ALTER TABLE `user_kelas`
  ADD KEY `Id_User` (`Id_User`),
  ADD KEY `Id_Kelas` (`Id_Kelas`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `materi`
--
ALTER TABLE `materi`
  ADD CONSTRAINT `fk_id_kelas` FOREIGN KEY (`Id_Kelas`) REFERENCES `kelas` (`Id_Kelas`);

--
-- Constraints for table `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`Id_User`) REFERENCES `user` (`Id_User`),
  ADD CONSTRAINT `progress_ibfk_2` FOREIGN KEY (`Id_Kelas`) REFERENCES `kelas` (`Id_Kelas`),
  ADD CONSTRAINT `progress_ibfk_3` FOREIGN KEY (`Id_Materi`) REFERENCES `materi` (`Id_Materi`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `fk_projects_kelas` FOREIGN KEY (`Id_Kelas`) REFERENCES `kelas` (`Id_Kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `fk_quiz_kelas` FOREIGN KEY (`Id_Kelas`) REFERENCES `kelas` (`Id_Kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sertifikat`
--
ALTER TABLE `sertifikat`
  ADD CONSTRAINT `sertifikat_ibfk_1` FOREIGN KEY (`Id_User`) REFERENCES `user` (`Id_User`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sertifikat_ibfk_2` FOREIGN KEY (`Id_Kelas`) REFERENCES `kelas` (`Id_Kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sertifikat_ibfk_3` FOREIGN KEY (`Id_Tugas`) REFERENCES `tugas` (`Id_Tugas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `submission`
--
ALTER TABLE `submission`
  ADD CONSTRAINT `fk_submission_kelas` FOREIGN KEY (`Id_Kelas`) REFERENCES `kelas` (`Id_Kelas`),
  ADD CONSTRAINT `fk_submission_user` FOREIGN KEY (`Id_User`) REFERENCES `user` (`Id_User`);

--
-- Constraints for table `tugas`
--
ALTER TABLE `tugas`
  ADD CONSTRAINT `fk_tugas_admin` FOREIGN KEY (`Id_Admin`) REFERENCES `admin` (`Id_Admin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tutor`
--
ALTER TABLE `tutor`
  ADD CONSTRAINT `fk_Nama_Kelas` FOREIGN KEY (`Nama_Kelas`) REFERENCES `kelas` (`Nama_Kelas`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_admin_user` FOREIGN KEY (`Id_Admin`) REFERENCES `admin` (`Id_Admin`),
  ADD CONSTRAINT `fk_user_tugas` FOREIGN KEY (`id_tugas`) REFERENCES `tugas` (`Id_Tugas`);

--
-- Constraints for table `user_kelas`
--
ALTER TABLE `user_kelas`
  ADD CONSTRAINT `user_kelas_ibfk_1` FOREIGN KEY (`Id_User`) REFERENCES `user` (`Id_User`),
  ADD CONSTRAINT `user_kelas_ibfk_2` FOREIGN KEY (`Id_Kelas`) REFERENCES `kelas` (`Id_Kelas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
