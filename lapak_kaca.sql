-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2024 at 03:03 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lapak_kaca`
--

-- --------------------------------------------------------

--
-- Table structure for table `alamat`
--

CREATE TABLE `alamat` (
  `id_alamat` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `nama_penerima` varchar(100) NOT NULL,
  `nomor_telpon` varchar(15) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `kota` varchar(100) NOT NULL,
  `provinsi` varchar(100) NOT NULL,
  `kode_pos` varchar(10) NOT NULL,
  `nama_jalan` text NOT NULL,
  `patokan` text DEFAULT NULL,
  `status_alamat` enum('Rumah','Kantor') NOT NULL DEFAULT 'Rumah'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id_cart` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id_chat` int(11) NOT NULL,
  `id_sender` int(11) NOT NULL,
  `id_receiver` int(11) NOT NULL,
  `pesan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status_baca` enum('unread','read') DEFAULT 'unread',
  `is_deleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_alamat` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `total_pembayaran` int(11) NOT NULL,
  `metode_pembayaran` enum('cod','dana') NOT NULL,
  `status_pembelian` enum('Pesanan sedang di proses.','Barang dalam tahap pembuatan.','Proses pembuatan telah selesai.','Pesanan Anda dalam perjalanan menuju lokasi.','Pesanan tiba di alamat tujuan','Pengiriman ditunda. Pengiriman ulang akan dilakukan besok.','Pengiriman dibatalkan.') DEFAULT 'Pesanan sedang di proses.',
  `waktu_pembelian` timestamp NOT NULL DEFAULT current_timestamp(),
  `waktu_selesai` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id_product`, `name`, `price`, `image`) VALUES
(1000, 'Etalase Persegi 2 x 4 Meter', 2900000, 'etalaseDatar.png'),
(1001, 'Etalase Persegi 4 x 2 Meter\n', 3200000, 'etalaseTinggi.png'),
(1002, 'Etalase Usaha Kuliner', 3500000, 'grobakUsaha.png'),
(1003, 'Grobak Etalase ', 4000000, 'etalaseKastem.png');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id_review` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `komentar` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `spek_produk`
--

CREATE TABLE `spek_produk` (
  `id_spek` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `ukuran` text DEFAULT NULL,
  `jenis_kaca` text DEFAULT NULL,
  `bahan_rangka` text DEFAULT NULL,
  `rak` text DEFAULT NULL,
  `pintu` text DEFAULT NULL,
  `warna` text DEFAULT NULL,
  `berat` text DEFAULT NULL,
  `garansi` text DEFAULT NULL,
  `roda` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spek_produk`
--

INSERT INTO `spek_produk` (`id_spek`, `id_product`, `deskripsi`, `ukuran`, `jenis_kaca`, `bahan_rangka`, `rak`, `pintu`, `warna`, `berat`, `garansi`, `roda`) VALUES
(10001, 1000, 'Etalase kaca premium ini dirancang dengan material kaca tempered berkualitas tinggi yang tahan lama dan aman, didukung rangka aluminium kuat dan ringan, atau bisa juga dengan rangka besi yang lebih kokoh untuk ketahanan ekstra. Dilengkapi rak bertingkat yang fleksibel dalam penataan dan pintu geser dengan kunci pengaman, etalase ini juga dilengkapi roda pada bagian bawah, memudahkan pemindahan sesuai keinginan. Desain minimalis dan modernnya membuat etalase ini cocok untuk beragam konsep toko, mulai dari elektronik hingga fashion, dengan kaca yang elegan sehingga mampu menarik perhatian pelanggan dan memperindah tampilan toko. Keunggulannya meliputi ketahanan kaca tempered yang mampu menahan benturan, keamanan yang lebih tinggi untuk menyimpan barang berharga, serta tampilan profesional yang meningkatkan estetika toko. Etalase ini tersedia dalam warna finishing aluminium silver dan hitam matte yang netral, cocok untuk berbagai konsep dekorasi, dengan opsi warna lain sesuai permintaan. Produk ini dikirim dalam kondisi siap pakai dan tidak memerlukan perakitan, serta tersedia layanan pengiriman dan pemasangan khusus untuk area tertentu, memastikan kenyamanan dan kepuasan pelanggan.', 'Tinggi 2m x Panjang 4m', 'Kaca tempered 8mm', 'Aluminium silver', '4 rak, dapat disesuaikan posisinya', 'Sliding, dilengkapi kunci', 'Rangka silver, kaca transparan', '50 kg', 'Kerusakan saat pengiriman', '6 Roda'),
(10002, 1001, 'Etalase kaca premium ini dirancang dengan material kaca tempered berkualitas tinggi yang tahan lama dan aman, didukung rangka aluminium kuat dan ringan, atau bisa juga dengan rangka besi yang lebih kokoh untuk ketahanan ekstra. Dilengkapi rak bertingkat yang fleksibel dalam penataan dan pintu geser dengan kunci pengaman, etalase ini juga dilengkapi roda pada bagian bawah, memudahkan pemindahan sesuai keinginan. Desain minimalis dan modernnya membuat etalase ini cocok untuk beragam konsep toko, mulai dari elektronik hingga fashion, dengan kaca yang elegan sehingga mampu menarik perhatian pelanggan dan memperindah tampilan toko. Keunggulannya meliputi ketahanan kaca tempered yang mampu menahan benturan, keamanan yang lebih tinggi untuk menyimpan barang berharga, serta tampilan profesional yang meningkatkan estetika toko. Etalase ini tersedia dalam warna finishing aluminium silver dan hitam matte yang netral, cocok untuk berbagai konsep dekorasi, dengan opsi warna lain sesuai permintaan. Produk ini dikirim dalam kondisi siap pakai dan tidak memerlukan perakitan, serta tersedia layanan pengiriman dan pemasangan khusus untuk area tertentu, memastikan kenyamanan dan kepuasan pelanggan.', 'Tinggi 4m x Lebar 2m', 'Kaca tempered 8mm', 'Aluminium silver', '7 rak, dapat disesuaikan posisinya', 'Sliding, dilengkapi kunci', 'Rangka silver, kaca transparan', '55 kg', 'Kerusakan saat pengiriman', '4 Roda'),
(10003, 1002, 'Etalase kaca premium ini dirancang dengan material kaca tempered berkualitas tinggi yang tahan lama dan aman, didukung rangka aluminium kuat dan ringan, atau bisa juga dengan rangka besi yang lebih kokoh untuk ketahanan ekstra. Dilengkapi rak bertingkat yang fleksibel dalam penataan dan pintu geser dengan kunci pengaman, etalase ini juga dilengkapi roda pada bagian bawah, memudahkan pemindahan sesuai keinginan. Desain minimalis dan modernnya membuat etalase ini cocok untuk beragam konsep toko, mulai dari elektronik hingga fashion, dengan kaca yang elegan sehingga mampu menarik perhatian pelanggan dan memperindah tampilan toko. Keunggulannya meliputi ketahanan kaca tempered yang mampu menahan benturan, keamanan yang lebih tinggi untuk menyimpan barang berharga, serta tampilan profesional yang meningkatkan estetika toko. Etalase ini tersedia dalam warna finishing aluminium silver dan hitam matte yang netral, cocok untuk berbagai konsep dekorasi, dengan opsi warna lain sesuai permintaan. Produk ini dikirim dalam kondisi siap pakai dan tidak memerlukan perakitan, serta tersedia layanan pengiriman dan pemasangan khusus untuk area tertentu, memastikan kenyamanan dan kepuasan pelanggan.', 'Tinggi 3m x Lebar 5m', 'Kaca tempered 8mm', 'Aluminium silver', '5 rak tersedia ruang pemyimpanan, dapat disesuaikan posisinya', 'Sliding, dilengkapi kunci', 'Rangka silver, kaca transparan. ', '40 kg sampai 70 kg', 'Kerusakan saat pengiriman', 'Menyesuaikan 4 sampai 8 roda'),
(10004, 1003, 'Etalase kaca premium ini dirancang dengan material kaca tempered berkualitas tinggi yang tahan lama dan aman, didukung rangka aluminium kuat dan ringan, atau bisa juga dengan rangka besi yang lebih kokoh untuk ketahanan ekstra. Dilengkapi rak bertingkat yang fleksibel dalam penataan dan pintu geser dengan kunci pengaman, etalase ini juga dilengkapi roda pada bagian bawah, memudahkan pemindahan sesuai keinginan. Desain minimalis dan modernnya membuat etalase ini cocok untuk beragam konsep toko, mulai dari elektronik hingga fashion, dengan kaca yang elegan sehingga mampu menarik perhatian pelanggan dan memperindah tampilan toko. Keunggulannya meliputi ketahanan kaca tempered yang mampu menahan benturan, keamanan yang lebih tinggi untuk menyimpan barang berharga, serta tampilan profesional yang meningkatkan estetika toko. Etalase ini tersedia dalam warna finishing aluminium silver dan hitam matte yang netral, cocok untuk berbagai konsep dekorasi, dengan opsi warna lain sesuai permintaan. Produk ini dikirim dalam kondisi siap pakai dan tidak memerlukan perakitan, serta tersedia layanan pengiriman dan pemasangan khusus untuk area tertentu, memastikan kenyamanan dan kepuasan pelanggan.', 'Menyesuaikan (Tinggi: 2 - 4m, Lebar 3 - 7m)', 'Kaca tempered 8mm', 'Aluminium silver', 'Bisa tambah rak dan dapat disesuaikan posisinya', 'Sliding, dilengkapi kunci', 'Rangka silver, kaca transparan. Bisa tambah dengan stiker cocok untuk usaha kuliner', '70kg', 'Kerusakan saat pengiriman', '4 - 8 roda');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nomor_telpon` varchar(18) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `long_name` varchar(255) DEFAULT NULL,
  `gender` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `pekerjaan` varchar(50) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `email`, `nomor_telpon`, `password`, `username`, `long_name`, `gender`, `pekerjaan`, `umur`, `profile_picture`, `role`) VALUES
(19, 'rofiq@gmail.com', '083120791133', '$2y$10$1qfeJAruF6KiVv5vpkOk9uRsWKGi.uHPGhvmeVrCnFO7vWZtwHjBC', 'rofiqkholid', 'Rofiq Kholid', 'Laki-laki', 'Data Entry', 19, '19.jpg', 'user'),
(20, 'ro1002@gmail.com', '083120791133', '$2y$10$asbBtg6tw0JX7Qc/C/uv1OyYcybUtEwfujo6cNOBqrC6MnC38ADW.', 'rofiq2', 'Rofiq 2', 'Laki-laki', 'Data Entry', 19, '7309681.jpg', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alamat`
--
ALTER TABLE `alamat`
  ADD PRIMARY KEY (`id_alamat`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id_chat`),
  ADD KEY `id_sender` (`id_sender`),
  ADD KEY `id_receiver` (`id_receiver`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_alamat` (`id_alamat`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id_review`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `spek_produk`
--
ALTER TABLE `spek_produk`
  ADD PRIMARY KEY (`id_spek`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alamat`
--
ALTER TABLE `alamat`
  MODIFY `id_alamat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id_chat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1007;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id_review` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `spek_produk`
--
ALTER TABLE `spek_produk`
  MODIFY `id_spek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10013;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alamat`
--
ALTER TABLE `alamat`
  ADD CONSTRAINT `alamat_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`id_sender`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`id_receiver`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `fk_id_alamat` FOREIGN KEY (`id_alamat`) REFERENCES `alamat` (`id_alamat`) ON DELETE SET NULL,
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `spek_produk`
--
ALTER TABLE `spek_produk`
  ADD CONSTRAINT `spek_produk_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
