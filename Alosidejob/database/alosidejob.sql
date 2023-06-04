-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jun 2023 pada 07.51
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alosidejob`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_nama` varchar(51) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Trigger `admin`
--
DELIMITER $$
CREATE TRIGGER `check_role_admin` BEFORE INSERT ON `admin` FOR EACH ROW BEGIN
		IF (SELECT login_role FROM login WHERE login_id = NEW.admin_id) != 'Admin' THEN 
			SIGNAL SQLSTATE '45000';
		END IF;
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `calon_pekerja`
--

CREATE TABLE `calon_pekerja` (
  `calon_pekerja_id` int(11) NOT NULL,
  `calon_pekerja_nama_lengkap` varchar(51) NOT NULL,
  `calon_pekerja_alamat` varchar(101) DEFAULT NULL,
  `kota_id` int(11) DEFAULT NULL,
  `calon_pekerja_jenis_kelamin` enum('L','P') DEFAULT NULL,
  `calon_pekerja_tempat_lahir` varchar(51) DEFAULT NULL,
  `calon_pekerja_tanggal_lahir` date DEFAULT NULL,
  `calon_pekerja_status_pernikahan` enum('Lajang','Menikah','Janda/Duda') DEFAULT NULL,
  `calon_pekerja_email` varchar(51) NOT NULL,
  `calon_pekerja_telepon` varchar(13) DEFAULT NULL,
  `calon_pekerja_pendidikan_terakhir` enum('SD','SMP','SMA','S1','S2') DEFAULT NULL,
  `calon_pekerja_tempat_pendidikan_terakhir` varchar(51) DEFAULT NULL,
  `calon_pekerja_tempat_bekerja_terakhir` varchar(51) DEFAULT NULL,
  `calon_pekerja_pekerjaan_bekerja_terakhir` varchar(51) DEFAULT NULL,
  `calon_pekerja_file_cv` varchar(101) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `calon_pekerja`
--

INSERT INTO `calon_pekerja` (`calon_pekerja_id`, `calon_pekerja_nama_lengkap`, `calon_pekerja_alamat`, `kota_id`, `calon_pekerja_jenis_kelamin`, `calon_pekerja_tempat_lahir`, `calon_pekerja_tanggal_lahir`, `calon_pekerja_status_pernikahan`, `calon_pekerja_email`, `calon_pekerja_telepon`, `calon_pekerja_pendidikan_terakhir`, `calon_pekerja_tempat_pendidikan_terakhir`, `calon_pekerja_tempat_bekerja_terakhir`, `calon_pekerja_pekerjaan_bekerja_terakhir`, `calon_pekerja_file_cv`) VALUES
(42, 'Revina Au Fir', '', 1, 'L', '', '0000-00-00', 'Lajang', 'Rev@gmail.com', '', 'SD', '', '', '', ''),
(43, 'sisi', '', 1, 'L', '', '0000-00-00', 'Lajang', 'sisi@gmail.com', '', 'SD', '', '', '', '');

--
-- Trigger `calon_pekerja`
--
DELIMITER $$
CREATE TRIGGER `check_role_calon_pekerja` BEFORE INSERT ON `calon_pekerja` FOR EACH ROW BEGIN
		IF (SELECT login_role FROM login WHERE login_id = NEW.calon_pekerja_id) != 'Calon Pekerja' THEN 
			SIGNAL SQLSTATE '45000';
		END IF;
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_nama` varchar(21) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori_nama`) VALUES
(5, 'Administrasi'),
(6, 'Asuransi'),
(7, 'Hotel'),
(8, 'Kecantikan'),
(9, 'Kesehatan'),
(10, 'Kontruksi Dan Banguna'),
(1, 'Marketing'),
(11, 'Pendidikan'),
(12, 'Perbankan'),
(2, 'Perminyakan'),
(3, 'Pertambangan'),
(4, 'Teknologi Informasi'),
(13, 'Transportasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kota`
--

CREATE TABLE `kota` (
  `kota_id` int(11) NOT NULL,
  `kota_nama` varchar(51) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kota`
--

INSERT INTO `kota` (`kota_id`, `kota_nama`) VALUES
(1, 'Aceh'),
(32, 'Ambon'),
(13, 'Bandung'),
(22, 'Banjarmasin'),
(12, 'Banten'),
(7, 'Bengkulu'),
(17, 'Denpasar'),
(11, 'DKI Jakarta'),
(26, 'Golrongtalo'),
(6, 'Jambi'),
(34, 'Jayapura'),
(30, 'Kendari'),
(5, 'Kepulauan Riau'),
(31, 'Kepulauan Tidore'),
(19, 'Kupang'),
(10, 'Lampung'),
(29, 'Makasar'),
(25, 'Manado'),
(33, 'Manokwari'),
(28, 'Manuju'),
(18, 'Mataram'),
(8, 'Palembang'),
(27, 'Palu'),
(9, 'Pangkal Pinang'),
(21, 'Pangkal Raya'),
(20, 'Pontianak'),
(4, 'Riau'),
(23, 'Samarinda'),
(14, 'Semarang'),
(3, 'Sumatra Barat'),
(2, 'Sumatra Utara'),
(16, 'Surabaya'),
(24, 'Tanjung Kelor'),
(15, 'Yogyakarta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lamaran`
--

CREATE TABLE `lamaran` (
  `lamaran_id` int(11) NOT NULL,
  `lowongan_id` int(11) NOT NULL,
  `calon_pekerja_id` int(11) NOT NULL,
  `lamaran_status_lolos` enum('Menunggu','Lolos','Tidak Lolos') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `lamaran`
--

INSERT INTO `lamaran` (`lamaran_id`, `lowongan_id`, `calon_pekerja_id`, `lamaran_status_lolos`) VALUES
(27, 35, 43, 'Lolos'),
(28, 36, 43, 'Lolos');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `login_username` varchar(26) NOT NULL,
  `login_password` varchar(101) NOT NULL,
  `login_role` enum('Admin','Perusahaan','Calon Pekerja') NOT NULL DEFAULT 'Calon Pekerja'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`login_id`, `login_username`, `login_password`, `login_role`) VALUES
(40, 'amikomjogja', 'afe8f002b9c5f8bc07d0080816887ec1', 'Perusahaan'),
(41, 'Dapurkue', 'a8ae104615cb4e966ddb435f3e575a02', 'Perusahaan'),
(42, 'Revina Au FIir', 'a8ae104615cb4e966ddb435f3e575a02', 'Calon Pekerja'),
(43, 'sisi ', 'a8ae104615cb4e966ddb435f3e575a02', 'Calon Pekerja'),
(44, 'Percetakan titi', 'a8ae104615cb4e966ddb435f3e575a02', 'Perusahaan'),
(45, 'kopiko', 'a8ae104615cb4e966ddb435f3e575a02', 'Perusahaan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lowongan`
--

CREATE TABLE `lowongan` (
  `lowongan_id` int(11) NOT NULL,
  `perusahaan_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `lowongan_judul` varchar(51) NOT NULL,
  `lowongan_deskripsi` text NOT NULL,
  `lowongan_tgl_buka` date NOT NULL,
  `lowongan_tgl_tutup` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `lowongan`
--

INSERT INTO `lowongan` (`lowongan_id`, `perusahaan_id`, `kategori_id`, `lowongan_judul`, `lowongan_deskripsi`, `lowongan_tgl_buka`, `lowongan_tgl_tutup`) VALUES
(32, 40, 11, 'Dosen Tetap', '', '2021-09-22', '2021-09-30'),
(33, 41, 1, 'barista', 'Dapur kue', '2023-06-02', '2023-06-10'),
(34, 44, 4, 'Membuka lowongan kerja bagian desain ', 'Percetakan titi :\r\nPercetakan banner\r\nDesain logo\r\nPercetakan foto', '2023-06-03', '2023-06-17'),
(35, 45, 1, 'Open Recrutment Barista di Kopiko Surabaya', 'Toko kopiko yaitu menjual kopi terbaik', '2023-06-03', '2023-06-30'),
(36, 45, 5, 'Lowongan Partime Kasir', 'Kopiko grand opening', '2023-06-04', '2023-06-14'),
(37, 45, 1, 'Koki', 'Kopiko adalah kafe dengan nuansa hutan', '2023-06-04', '2023-06-23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lowongan_jobdesc`
--

CREATE TABLE `lowongan_jobdesc` (
  `lowongan_jobdesc_id` int(11) NOT NULL,
  `lowongan_id` int(11) NOT NULL,
  `lowongan_jobdesc_isi` varchar(101) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `lowongan_jobdesc`
--

INSERT INTO `lowongan_jobdesc` (`lowongan_jobdesc_id`, `lowongan_id`, `lowongan_jobdesc_isi`) VALUES
(32, 32, 'Pendidikan'),
(33, 33, 'Mengoordinasikan penjualan melalui channel online atau offline'),
(34, 33, 'Mengoordinasikan semua media untuk keperluan promosi dan peningkatan penjualan'),
(35, 33, 'Mengembangkan produk atau jasa dari sebuah perusahaan'),
(36, 34, 'Mengecek kinerja dan ketepatan waktu kerja pemeriksa aksara'),
(37, 34, 'pengatur tata letak'),
(38, 34, 'perancang grafis.'),
(39, 35, 'Mengoordinasikan penjualan melalui channel online atau offline'),
(40, 35, 'pengatur tata letak'),
(41, 36, 'Mengoordinasikan penjualan melalui channel online atau offline'),
(42, 36, 'pengatur tata letak'),
(43, 37, 'Bertanggung jawab untuk bahan serta biaya makanan'),
(44, 37, ' Memasak sesuai dengan order atau pesanan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lowongan_syarat`
--

CREATE TABLE `lowongan_syarat` (
  `lowongan_syarat_id` int(11) NOT NULL,
  `lowongan_id` int(11) NOT NULL,
  `lowongan_syarat` varchar(101) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `lowongan_syarat`
--

INSERT INTO `lowongan_syarat` (`lowongan_syarat_id`, `lowongan_id`, `lowongan_syarat`) VALUES
(23, 32, 'S2 Pendidikan'),
(24, 33, 'Pria/Wanita'),
(25, 33, 'Pendidikan Minimal SMA/SMK'),
(26, 33, 'Usia minimal 17 tahun'),
(27, 34, 'Usia minimal 17 tahun'),
(28, 34, 'Pendidikan Minimal SMA/SMK'),
(29, 34, 'Pria/ Wanita'),
(30, 35, 'Pria/Wanita'),
(31, 35, 'Pendidikan Minimal SMA/SMK'),
(32, 35, 'Usia minimal 17 tahun'),
(33, 36, 'Pria/Wanita'),
(34, 36, 'Pendidikan Minimal SMA/SMK'),
(35, 36, 'Usia minimal 17 tahun'),
(36, 37, 'Pria/Wanita'),
(37, 37, 'Pendidikan Minimal SMA/SMK'),
(38, 37, 'Usia minimal 17 tahun');

-- --------------------------------------------------------

--
-- Struktur dari tabel `perusahaan`
--

CREATE TABLE `perusahaan` (
  `perusahaan_id` int(11) NOT NULL,
  `perusahaan_nama` varchar(51) NOT NULL,
  `perusahaan_alamat` varchar(101) DEFAULT NULL,
  `kota_id` int(11) DEFAULT NULL,
  `perusahaan_email` varchar(51) NOT NULL,
  `perusahaan_telepon` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `perusahaan`
--

INSERT INTO `perusahaan` (`perusahaan_id`, `perusahaan_nama`, `perusahaan_alamat`, `kota_id`, `perusahaan_email`, `perusahaan_telepon`) VALUES
(40, 'PT Amikom Jogja', 'Yogyakarta', 15, 'Amikom', '09876577'),
(41, 'Dapur Kue', '', 1, 'dapurkue@gmail.com', ''),
(44, 'Percetakan ', '', 1, 'titi@gmail.com', ''),
(45, 'Toko kopiko', 'Ketintang PTT 5, Surabaya', 16, 'kopiko@gmail.com', '08161');

--
-- Trigger `perusahaan`
--
DELIMITER $$
CREATE TRIGGER `check_role_perusahaan` BEFORE INSERT ON `perusahaan` FOR EACH ROW BEGIN
		IF (SELECT login_role FROM login WHERE login_id = NEW.perusahaan_id) != 'Perusahaan' THEN 
			SIGNAL SQLSTATE '45000';
		END IF;
	END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_nama` (`admin_nama`);

--
-- Indeks untuk tabel `calon_pekerja`
--
ALTER TABLE `calon_pekerja`
  ADD PRIMARY KEY (`calon_pekerja_id`),
  ADD KEY `fk_calon_pekerja_kota` (`kota_id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`),
  ADD UNIQUE KEY `kategori_nama` (`kategori_nama`);

--
-- Indeks untuk tabel `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`kota_id`),
  ADD UNIQUE KEY `kota_nama` (`kota_nama`);

--
-- Indeks untuk tabel `lamaran`
--
ALTER TABLE `lamaran`
  ADD PRIMARY KEY (`lamaran_id`),
  ADD UNIQUE KEY `lowongan_id` (`lowongan_id`,`calon_pekerja_id`),
  ADD KEY `calon_pekerja_id` (`calon_pekerja_id`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`),
  ADD UNIQUE KEY `login_username` (`login_username`);

--
-- Indeks untuk tabel `lowongan`
--
ALTER TABLE `lowongan`
  ADD PRIMARY KEY (`lowongan_id`),
  ADD KEY `fk_lowongan_perusahaan` (`perusahaan_id`),
  ADD KEY `fk_lowongan_kategori` (`kategori_id`);

--
-- Indeks untuk tabel `lowongan_jobdesc`
--
ALTER TABLE `lowongan_jobdesc`
  ADD PRIMARY KEY (`lowongan_jobdesc_id`),
  ADD KEY `fk_jobdesc_lowongan` (`lowongan_id`);

--
-- Indeks untuk tabel `lowongan_syarat`
--
ALTER TABLE `lowongan_syarat`
  ADD PRIMARY KEY (`lowongan_syarat_id`),
  ADD KEY `fk_syarat_lowongan` (`lowongan_id`);

--
-- Indeks untuk tabel `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`perusahaan_id`),
  ADD UNIQUE KEY `perusahaan_nama` (`perusahaan_nama`),
  ADD KEY `fk_perusahaan_kota` (`kota_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `kota`
--
ALTER TABLE `kota`
  MODIFY `kota_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT untuk tabel `lamaran`
--
ALTER TABLE `lamaran`
  MODIFY `lamaran_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `lowongan`
--
ALTER TABLE `lowongan`
  MODIFY `lowongan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `lowongan_jobdesc`
--
ALTER TABLE `lowongan_jobdesc`
  MODIFY `lowongan_jobdesc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `lowongan_syarat`
--
ALTER TABLE `lowongan_syarat`
  MODIFY `lowongan_syarat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_admin_login` FOREIGN KEY (`admin_id`) REFERENCES `login` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `calon_pekerja`
--
ALTER TABLE `calon_pekerja`
  ADD CONSTRAINT `fk_calon_pekerja_kota` FOREIGN KEY (`kota_id`) REFERENCES `kota` (`kota_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_calon_pekerja_login` FOREIGN KEY (`calon_pekerja_id`) REFERENCES `login` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `lamaran`
--
ALTER TABLE `lamaran`
  ADD CONSTRAINT `lamaran_ibfk_1` FOREIGN KEY (`calon_pekerja_id`) REFERENCES `calon_pekerja` (`calon_pekerja_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lamaran_ibfk_2` FOREIGN KEY (`lowongan_id`) REFERENCES `lowongan` (`lowongan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `lowongan`
--
ALTER TABLE `lowongan`
  ADD CONSTRAINT `fk_lowongan_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lowongan_perusahaan` FOREIGN KEY (`perusahaan_id`) REFERENCES `perusahaan` (`perusahaan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `lowongan_jobdesc`
--
ALTER TABLE `lowongan_jobdesc`
  ADD CONSTRAINT `fk_jobdesc_lowongan` FOREIGN KEY (`lowongan_id`) REFERENCES `lowongan` (`lowongan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `lowongan_syarat`
--
ALTER TABLE `lowongan_syarat`
  ADD CONSTRAINT `fk_syarat_lowongan` FOREIGN KEY (`lowongan_id`) REFERENCES `lowongan` (`lowongan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD CONSTRAINT `fk_perusahaan_kota` FOREIGN KEY (`kota_id`) REFERENCES `kota` (`kota_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_perusahaan_login` FOREIGN KEY (`perusahaan_id`) REFERENCES `login` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
