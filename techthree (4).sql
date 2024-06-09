-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Waktu pembuatan: 09 Jun 2024 pada 12.41
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 7.4.30

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
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `Id_Admin` varchar(20) NOT NULL,
  `Nama_Admin` varchar(50) NOT NULL,
  `Password_Admin` varchar(20) NOT NULL,
  `No_Telp_Admin` varchar(20) NOT NULL,
  `Tanggal_Lahir_Admin` date DEFAULT NULL,
  `Tanggal_Lahir_Temp` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`Id_Admin`, `Nama_Admin`, `Password_Admin`, `No_Telp_Admin`, `Tanggal_Lahir_Admin`, `Tanggal_Lahir_Temp`) VALUES
('Ad01', 'Salwa Nafisa', 'S4lw4!@', '085987654344', '2002-02-22', NULL),
('Ad02', 'Ika Kusuma Wardani', 'Ik4kus@$', '085354356772', '2002-05-15', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `Id_Kelas` varchar(20) NOT NULL,
  `Nama_Kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`Id_Kelas`, `Nama_Kelas`) VALUES
('Kls02', 'Fotografi'),
('Kls01', 'UI/UX'),
('Kls03', 'Web Development');

-- --------------------------------------------------------

--
-- Struktur dari tabel `materi`
--

CREATE TABLE `materi` (
  `Id_Materi` varchar(20) NOT NULL,
  `Nama_Materi` varchar(50) NOT NULL,
  `Durasi_Materi` varchar(20) NOT NULL,
  `video_link` varchar(255) DEFAULT NULL,
  `Id_Kelas` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `materi`
--

INSERT INTO `materi` (`Id_Materi`, `Nama_Materi`, `Durasi_Materi`, `video_link`, `Id_Kelas`) VALUES
('mf01', 'Teknik Komposisi', '5:01', 'https://youtu.be/O6rby36Me_4?si=-urQwkebL-5PFM7K', 'Kls02'),
('mf02', 'Teknik Komposisi', '1:21', 'https://youtu.be/jcAZgQXpZGo?si=HCzbF_tVggh82DSz', 'Kls02'),
('mf03', 'Teknik Komposisi', '5:31', 'https://youtu.be/nKM3jkEOpuE?si=AUkg8XNmaHaY3uex', 'Kls02'),
('mf04', 'Teknik Komposisi', '8:02', 'https://youtu.be/NAexy836ff8?si=F-adVOxB9bnSe-H6', 'Kls02'),
('mf05', 'Teknik Komposisi', '5:33', 'https://youtu.be/66Z29z7Isik?si=U-dvAHyTHCA_flI7', 'Kls02'),
('mu01', 'Pengenalan UI/UX', '18:30', 'https://youtu.be/_PQavIv_fbY?si=dzr4AS2L_dQeIAjU', 'Kls01'),
('mu02', 'Pengenalan UI/UX', '13:20', 'https://youtu.be/9ougG5fvA1I?si=eKhRRnGofdhZMpjJ', 'Kls01'),
('mw01', 'Pengenalan Pemrograman Web', '11:08', 'https://youtu.be/LooycZiMn6s?si=_aUf-xQIcVrvca6I', 'Kls03'),
('mw02', 'Pengenalan Pemrograman Web', '9:38', 'https://youtu.be/ydg-uFtsfI4?si=KmLwDLXzfsRnY3JL', 'Kls03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tugas`
--

CREATE TABLE `tugas` (
  `Id_Tugas` varchar(20) NOT NULL,
  `Nama_Tugas` varchar(50) NOT NULL,
  `Nilai_Tugas` int(11) NOT NULL,
  `id_tutor` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tugas`
--

INSERT INTO `tugas` (`Id_Tugas`, `Nama_Tugas`, `Nilai_Tugas`, `id_tutor`) VALUES
('Tgf01', 'Kuis 1 Fotografi', 80, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tutor`
--

CREATE TABLE `tutor` (
  `Id_Tutor` varchar(20) NOT NULL,
  `Nama_Tutor` varchar(50) NOT NULL,
  `Password_Tutor` varchar(20) NOT NULL,
  `Nama_Kelas` varchar(50) NOT NULL,
  `Tanggal_Lahir_Tutor` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tutor`
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
-- Struktur dari tabel `user`
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
  `id_tugas` varchar(20) DEFAULT NULL,
  `nilai_tugas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`Id_User`, `Nama_User`, `Password_User`, `No_Telp_User`, `Nama_Kelas`, `Tanggal_Lahir_User`, `email`, `Id_Admin`, `id_tugas`, `nilai_tugas`) VALUES
('User001', 'Mario Atmaja', 'Atm4j@!!', '085675235233', 'Fotografi', '1998-06-06', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_kelas`
--

CREATE TABLE `user_kelas` (
  `Id_User` varchar(20) NOT NULL,
  `Id_Kelas` varchar(20) NOT NULL,
  `Tanggal_Mulai` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_kelas`
--

INSERT INTO `user_kelas` (`Id_User`, `Id_Kelas`, `Tanggal_Mulai`) VALUES
('User001', 'Kls02', '2024-05-25');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id_Admin`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`Id_Kelas`),
  ADD UNIQUE KEY `Nama_Kelas` (`Nama_Kelas`),
  ADD KEY `Nama_Kelas_2` (`Nama_Kelas`);

--
-- Indeks untuk tabel `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`Id_Materi`),
  ADD KEY `fk_id_kelas` (`Id_Kelas`);

--
-- Indeks untuk tabel `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`Id_Tugas`),
  ADD KEY `fk_tugas_tutor` (`id_tutor`);

--
-- Indeks untuk tabel `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`Id_Tutor`),
  ADD KEY `fk_Nama_Kelas` (`Nama_Kelas`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id_User`),
  ADD KEY `fk_admin_user` (`Id_Admin`),
  ADD KEY `fk_user_tugas` (`id_tugas`);

--
-- Indeks untuk tabel `user_kelas`
--
ALTER TABLE `user_kelas`
  ADD KEY `Id_User` (`Id_User`),
  ADD KEY `Id_Kelas` (`Id_Kelas`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `materi`
--
ALTER TABLE `materi`
  ADD CONSTRAINT `fk_id_kelas` FOREIGN KEY (`Id_Kelas`) REFERENCES `kelas` (`Id_Kelas`);

--
-- Ketidakleluasaan untuk tabel `tugas`
--
ALTER TABLE `tugas`
  ADD CONSTRAINT `fk_tugas_tutor` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`Id_Tutor`);

--
-- Ketidakleluasaan untuk tabel `tutor`
--
ALTER TABLE `tutor`
  ADD CONSTRAINT `fk_Nama_Kelas` FOREIGN KEY (`Nama_Kelas`) REFERENCES `kelas` (`Nama_Kelas`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_admin_user` FOREIGN KEY (`Id_Admin`) REFERENCES `admin` (`Id_Admin`),
  ADD CONSTRAINT `fk_user_tugas` FOREIGN KEY (`id_tugas`) REFERENCES `tugas` (`Id_Tugas`);

--
-- Ketidakleluasaan untuk tabel `user_kelas`
--
ALTER TABLE `user_kelas`
  ADD CONSTRAINT `user_kelas_ibfk_1` FOREIGN KEY (`Id_User`) REFERENCES `user` (`Id_User`),
  ADD CONSTRAINT `user_kelas_ibfk_2` FOREIGN KEY (`Id_Kelas`) REFERENCES `kelas` (`Id_Kelas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
