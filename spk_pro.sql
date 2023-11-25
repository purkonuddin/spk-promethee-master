-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Nov 2023 pada 08.43
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spk_pro`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `calon`
--

CREATE TABLE `calon` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `submit_by` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `calon`
--

INSERT INTO `calon` (`id`, `nama`, `submit_by`) VALUES
(130, 'Juna', 1),
(131, 'Meysila', 1),
(132, 'Sifa', 1),
(133, 'Ayatul', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `calon_subkriteria`
--

CREATE TABLE `calon_subkriteria` (
  `id` int(11) NOT NULL,
  `calon_id` int(11) DEFAULT NULL,
  `subkriteria_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `calon_subkriteria`
--

INSERT INTO `calon_subkriteria` (`id`, `calon_id`, `subkriteria_id`, `value`) VALUES
(935, 130, 26, 0),
(936, 130, 29, 0),
(937, 130, 33, 0),
(938, 131, 27, 0),
(939, 131, 30, 0),
(940, 131, 32, 0),
(941, 132, 27, 0),
(942, 132, 29, 0),
(943, 132, 33, 0),
(944, 133, 28, 0),
(945, 133, 31, 0),
(946, 133, 34, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil_seleksi`
--

CREATE TABLE `hasil_seleksi` (
  `id` int(11) NOT NULL,
  `nilai` int(11) NOT NULL,
  `program_bantuan_id` int(11) NOT NULL,
  `calon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bobot` double NOT NULL,
  `jenis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id`, `nama`, `bobot`, `jenis`) VALUES
(12, 'Penghasilan Orang Tua', 1, 'Benefit'),
(13, 'Jumlah Tanggungan Orang Tua', 1, 'Cost'),
(14, 'Kelas', 1, 'Cost');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `email`, `username`, `password`, `level`) VALUES
(1, 'Administrator', 'admin@gmail.com', 'admin', '0192023a7bbd73250516f069df18b500', 'superadmin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `program_bantuan`
--

CREATE TABLE `program_bantuan` (
  `id` int(11) NOT NULL,
  `jenis_program` varchar(255) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `subkriteria`
--

CREATE TABLE `subkriteria` (
  `id` int(11) NOT NULL,
  `kriteria_id` int(11) DEFAULT 0,
  `nama` varchar(50) DEFAULT '0',
  `bobot` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `subkriteria`
--

INSERT INTO `subkriteria` (`id`, `kriteria_id`, `nama`, `bobot`) VALUES
(26, 12, '< 1 Jt', 3),
(27, 12, '1 - 3 Jt', 2),
(28, 12, '> 3 Jt', 1),
(29, 13, '>= 4 Orang', 3),
(30, 13, '3 Orang', 2),
(31, 13, '<= 2 Orang', 1),
(32, 14, '1 & 2', 3),
(33, 14, '3 & 4', 2),
(34, 14, '5 & 6', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `calon`
--
ALTER TABLE `calon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submit_by` (`submit_by`);

--
-- Indeks untuk tabel `calon_subkriteria`
--
ALTER TABLE `calon_subkriteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calon_id` (`calon_id`),
  ADD KEY `subkriteria_id` (`subkriteria_id`);

--
-- Indeks untuk tabel `hasil_seleksi`
--
ALTER TABLE `hasil_seleksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_bantuan_id` (`program_bantuan_id`),
  ADD KEY `calon_id` (`calon_id`);

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `program_bantuan`
--
ALTER TABLE `program_bantuan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `subkriteria`
--
ALTER TABLE `subkriteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kriteria_id` (`kriteria_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `calon`
--
ALTER TABLE `calon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT untuk tabel `calon_subkriteria`
--
ALTER TABLE `calon_subkriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=947;

--
-- AUTO_INCREMENT untuk tabel `hasil_seleksi`
--
ALTER TABLE `hasil_seleksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `program_bantuan`
--
ALTER TABLE `program_bantuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `subkriteria`
--
ALTER TABLE `subkriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `calon`
--
ALTER TABLE `calon`
  ADD CONSTRAINT `calon_ibfk_1` FOREIGN KEY (`submit_by`) REFERENCES `pengguna` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `calon_subkriteria`
--
ALTER TABLE `calon_subkriteria`
  ADD CONSTRAINT `FK__calon` FOREIGN KEY (`calon_id`) REFERENCES `calon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__subkriteria` FOREIGN KEY (`subkriteria_id`) REFERENCES `subkriteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `hasil_seleksi`
--
ALTER TABLE `hasil_seleksi`
  ADD CONSTRAINT `hasil_seleksi_ibfk_1` FOREIGN KEY (`program_bantuan_id`) REFERENCES `program_bantuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasil_seleksi_ibfk_2` FOREIGN KEY (`calon_id`) REFERENCES `calon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `subkriteria`
--
ALTER TABLE `subkriteria`
  ADD CONSTRAINT `FK_subkriteria_kriteria` FOREIGN KEY (`kriteria_id`) REFERENCES `kriteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
