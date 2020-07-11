-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2020 at 04:07 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_optik`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `gambar` varchar(255) NOT NULL DEFAULT 'default.png',
  `theme` varchar(20) NOT NULL DEFAULT 'sb_admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `nama`, `status`, `gambar`, `theme`) VALUES
(2, 'admin@admin.com', 'admin', 'admin', 1, 'default.png', 'sb_admin');

-- --------------------------------------------------------

--
-- Table structure for table `data_proses`
--

CREATE TABLE `data_proses` (
  `id` int(3) NOT NULL,
  `tanggal` datetime NOT NULL,
  `judul` varchar(100) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(2) NOT NULL,
  `kode_kacamata` varchar(2) NOT NULL,
  `merk_kacamata` varchar(255) NOT NULL,
  `harga` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `kode_kacamata`, `merk_kacamata`, `harga`) VALUES
(1, 'A', 'CALVIN KLEIN', 475000),
(2, 'B', 'CHANNEL', 450000),
(3, 'C', 'EISH OMBRE HITAM', 575000),
(4, 'D', 'EMPORIO ARMANI', 450000),
(5, 'E', 'ESPIRIT HITAM', 670000),
(6, 'F', 'FOSSIL HITAM', 450000),
(7, 'G', 'GABBANA', 450000),
(8, 'H', 'GEOFF MAXX', 450000),
(9, 'I', 'GINOS OVAL HITAM', 450000),
(10, 'J', 'GIORDANO', 500000),
(11, 'K', 'GUCCI BLACK GOLD', 350000),
(12, 'L', 'GUESS HITAM', 475000),
(13, 'M', 'H&M HITAM', 375000),
(14, 'N', 'LEECOPER OMBRE MERAH', 675000),
(15, 'O', 'LEVI\'S HITAM NAVY', 450000),
(16, 'P', 'MARC SILVER GOLD GLAZING', 525000),
(17, 'Q', 'NIKE HITAM LIS MERAH', 300000),
(18, 'R', 'OAKLEY HITAM', 675000),
(19, 'S', 'POLICE HITAM', 675000),
(20, 'T', 'PRAIRIE', 600000),
(21, 'U', 'PUMA GREY', 400000),
(22, 'V', 'QUICSILVER HITAM', 450000),
(23, 'W', 'RALTO BROWN', 375000),
(24, 'X', 'RAYBAN', 525000),
(25, 'Y', 'RODDENSTOCK', 650000),
(26, 'Z', 'VERSACE HITAM', 375000);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id` int(3) NOT NULL,
  `code` enum('R','F','M') NOT NULL,
  `batas_awal` int(9) NOT NULL,
  `batas_akhir` int(9) NOT NULL,
  `bobot` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id`, `code`, `batas_awal`, `batas_akhir`, `bobot`) VALUES
(1, 'R', 1, 43, 5),
(2, 'R', 44, 87, 4),
(3, 'R', 88, 130, 3),
(4, 'R', 131, 174, 2),
(5, 'R', 175, 1000, 1),
(6, 'F', 1, 5, 1),
(7, 'F', 6, 11, 2),
(8, 'F', 12, 17, 3),
(9, 'F', 18, 23, 4),
(10, 'F', 24, 1000, 5),
(11, 'M', 1, 5000000, 1),
(12, 'M', 5000001, 10000000, 2),
(13, 'M', 10000001, 15000000, 3),
(14, 'M', 15000001, 20000000, 4),
(15, 'M', 20000001, 100000000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(5) NOT NULL,
  `no_member` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `usia` varchar(2) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(4) NOT NULL,
  `id_member` int(3) NOT NULL,
  `id_kode` int(1) NOT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `jumlah` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tjm_menu`
--

CREATE TABLE `tjm_menu` (
  `id` int(11) NOT NULL,
  `parent_menu` int(11) NOT NULL DEFAULT '1',
  `nama_menu` varchar(50) NOT NULL,
  `url_menu` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `urutan` tinyint(3) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `type` enum('Admin') NOT NULL DEFAULT 'Admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tjm_menu`
--

INSERT INTO `tjm_menu` (`id`, `parent_menu`, `nama_menu`, `url_menu`, `icon`, `urutan`, `status`, `type`) VALUES
(1, 1, 'root', '/', '', 0, 0, 'Admin'),
(2, 1, 'dashboard', 'admin/dashboard', 'fa fa-fw fa-dashboard', 1, 1, 'Admin'),
(3, 1, 'User Admin', 'admin/useradmin', 'fa fa-users', 99, 1, 'Admin'),
(4, 1, 'Menu', 'admin/menu', 'fa fa-gear', 100, 1, 'Admin'),
(30, 1, 'Kriteria', 'admin/kriteria', 'fa fa-gear', 2, 1, 'Admin'),
(31, 1, 'kategori kacamata', 'admin/kategori', '', 3, 1, 'Admin'),
(32, 1, 'Member', 'admin/member', '', 4, 1, 'Admin'),
(33, 1, 'Penjualan', 'admin/penjualan', '', 5, 1, 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_proses`
--
ALTER TABLE `data_proses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tjm_menu`
--
ALTER TABLE `tjm_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_proses`
--
ALTER TABLE `data_proses`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tjm_menu`
--
ALTER TABLE `tjm_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
