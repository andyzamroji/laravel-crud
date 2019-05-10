-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2019 at 08:32 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-crud`
--

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id`, `nama`, `telp`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 'Sujadi', '098771991910', 'Jalan Raya Bandung', '2019-05-09 03:00:43', '0000-00-00 00:00:00'),
(2, 'Manisa', '086778272822', 'jalan duka', '2019-05-09 03:00:43', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id` int(11) NOT NULL,
  `kode` varchar(191) NOT NULL,
  `nama` varchar(191) NOT NULL,
  `semester` varchar(45) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id`, `kode`, `nama`, `semester`, `guru_id`, `created_at`, `updated_at`) VALUES
(1, 'M-001', 'Matematika', 'ganjil', 1, '2019-05-08 04:45:47', '0000-00-00 00:00:00'),
(2, 'B-001', 'Bahasa Indonesia', 'ganjil', 1, '2019-05-08 04:45:47', '0000-00-00 00:00:00'),
(3, 'M-003', 'Agama', 'ganjil', 2, '2019-05-09 01:19:34', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `mapel_siswa`
--

CREATE TABLE `mapel_siswa` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `nilai` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapel_siswa`
--

INSERT INTO `mapel_siswa` (`id`, `siswa_id`, `mapel_id`, `nilai`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 75, '2019-05-08 04:46:45', '0000-00-00 00:00:00'),
(2, 2, 2, 60, '2019-05-08 06:01:06', '0000-00-00 00:00:00'),
(3, 4, 2, 57, '2019-05-08 06:08:00', '0000-00-00 00:00:00'),
(5, 5, 2, 10, '2019-05-08 17:38:42', '2019-05-09 00:38:42'),
(6, 5, 1, 23, '2019-05-08 17:38:52', '2019-05-09 00:38:52'),
(8, 9, 1, 50, '2019-05-08 17:49:46', '2019-05-09 00:49:46'),
(9, 2, 3, 50, '2019-05-08 18:30:51', '2019-05-09 01:30:51'),
(10, 5, 3, 20, '2019-05-09 01:41:14', '0000-00-00 00:00:00'),
(11, 6, 1, 100, '2019-05-09 02:32:58', '2019-05-09 02:32:58'),
(13, 7, 1, 50, '2019-05-08 19:42:59', '2019-05-09 02:42:59'),
(15, 1, 1, 80, '2019-05-08 20:46:02', '2019-05-09 03:46:02'),
(16, 1, 2, 65, '2019-05-08 20:46:09', '2019-05-09 03:46:09'),
(17, 1, 3, 70, '2019-05-08 20:46:14', '2019-05-09 03:46:14'),
(18, 3, 1, 75, '2019-05-08 20:47:23', '2019-05-09 03:47:23'),
(19, 3, 2, 80, '2019-05-08 20:47:28', '2019-05-09 03:47:28'),
(20, 3, 3, 70, '2019-05-08 20:47:35', '2019-05-09 03:47:35'),
(21, 4, 1, 80, '2019-05-08 20:47:51', '2019-05-09 03:47:51'),
(22, 4, 3, 78, '2019-05-08 20:47:57', '2019-05-09 03:47:57'),
(23, 6, 2, 80, '2019-05-08 20:48:17', '2019-05-09 03:48:17'),
(24, 6, 3, 74, '2019-05-08 20:48:23', '2019-05-09 03:48:23'),
(25, 7, 2, 77, '2019-05-08 20:48:32', '2019-05-09 03:48:32'),
(26, 7, 3, 84, '2019-05-08 20:48:37', '2019-05-09 03:48:37'),
(27, 8, 1, 50, '2019-05-08 20:48:49', '2019-05-09 03:48:49'),
(28, 8, 2, 61, '2019-05-08 20:48:54', '2019-05-09 03:48:54'),
(29, 8, 3, 87, '2019-05-08 20:48:59', '2019-05-09 03:48:59'),
(30, 9, 2, 74, '2019-05-08 20:49:08', '2019-05-09 03:49:08'),
(31, 9, 3, 88, '2019-05-08 20:49:13', '2019-05-09 03:49:13'),
(32, 10, 1, 80, '2019-05-08 20:49:29', '2019-05-09 03:49:29'),
(33, 10, 2, 54, '2019-05-08 20:49:35', '2019-05-09 03:49:35'),
(34, 10, 3, 55, '2019-05-08 20:49:41', '2019-05-09 03:49:41'),
(35, 26, 1, 80, '2019-05-08 21:00:34', '2019-05-09 04:00:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_05_07_061153_create_siswa_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_depan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_belakang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `user_id`, `nama_depan`, `nama_belakang`, `jenis_kelamin`, `agama`, `alamat`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 0, 'Malah', 'Hidayanto', 'L', 'Katolik', 'Jln. Nakula No. 769, Cirebon 97638, SulUt', 'abc.jpg', NULL, '2019-05-07 20:09:51'),
(2, 0, 'Harsanto', 'Hasanah', 'L', 'Budha', 'Ds. Taman No. 984, Yogyakarta 48318, MalUt', NULL, NULL, NULL),
(3, 0, 'Padmi', 'Wibowo', 'L', 'Budha', 'Ds. Juanda No. 909, Bontang 32014, KalTeng', NULL, NULL, NULL),
(4, 0, 'Hasta', 'Latupono', 'L', 'Budha', 'Dk. Moch. Ramdan No. 54, Padangpanjang 55696, PapBar', NULL, NULL, NULL),
(5, 0, 'Samiah', 'Prastuti', 'L', 'Budha', 'Psr. Bambu No. 616, Bandung 98583, SulTeng', NULL, NULL, NULL),
(6, 0, 'Salimah', 'Ardianto', 'L', 'Budha', 'Dk. Ronggowarsito No. 25, Pangkal Pinang 70367, Riau', NULL, NULL, NULL),
(7, 0, 'Ade', 'Sinaga', 'L', 'Budha', 'Dk. Abdullah No. 847, Medan 47019, SumSel', NULL, NULL, NULL),
(8, 0, 'Jessica', 'Mardhiyah', 'L', 'Budha', 'Psr. Sudiarto No. 48, Bitung 74295, DKI', NULL, NULL, NULL),
(9, 0, 'Clara', 'Pertiwi', 'L', 'Budha', 'Ds. Suprapto No. 108, Bandar Lampung 11603, Banten', NULL, NULL, NULL),
(10, 0, 'Jessica', 'Mulyani', 'L', 'Budha', 'Gg. Flores No. 577, Tebing Tinggi 96742, JaTim', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Andy', 'andy@gmail.com', '0000-00-00 00:00:00', '$2y$10$QYfRSC0DuF6GZbr7mdyseOpVLgXMWQb2639yblKrZuy00swVvD742', 'JxPL6nTFgRPMyc6KYoW7KDmZrBFVH4KKfoTwazdjPJ7IDNZSRMVCroyUXZPz', '2019-05-07 18:45:43', '2019-05-07 18:45:43'),
(4, 'siswa', 'zam', 'zam@gmail.com', NULL, '$2y$10$Efcutgdij.G6vkU8XsIL4.PY9DQbqLbmW2n0fzuh3ovhLLQ/lOZCO', 'Wh1blRf7bihXCg9EJtaUnVneqPqo4rRGj9mFrWF7TBb9MfkvtnwLCt7Ipgr8', '2019-05-07 20:51:19', '2019-05-07 20:51:19'),
(5, 'siswa', 'aweas', 'a@gmail.com', NULL, '$2y$10$UaS.1s7hvHpe5OkT2X/Uh.8P1wgM5yA89CE2TCphtsa.KdWlarNiq', 'O8Kba0CZEJTXbnUe6gnfkZRrQiyE0bCctPaM0InIppA7inEkzRhGs59T3Lk8', '2019-05-07 23:57:15', '2019-05-07 23:57:15'),
(6, 'siswa', 'Suwarna', 'af@gmail.com', NULL, '$2y$10$WMg50wL8QiQaWzeUMIOjbunkEyRFouqmu7fZ2vLIS4fiz5z9zNZSu', 'unVncCunbWOBr6UX9Ba1gKF0wK7XmcYQpzOjOUQlO8b0E0QYfkiK60fTqCno', '2019-05-07 23:58:03', '2019-05-07 23:58:03'),
(8, 'siswa', 'Bagas', 'df@gmail.com', NULL, '$2y$10$B92Qbyp36p09vW.a3eNFmuueRcP/U2CSIzTl63DE/Q3GMbMHfFNJO', '2W4q0d6kXRfLUXnVeEHq7uoTYeHJksOdXjRt5rCEizgNnxvwY5D0LLJ6h0JH', '2019-05-08 00:09:08', '2019-05-08 00:09:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel_siswa`
--
ALTER TABLE `mapel_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mapel_siswa`
--
ALTER TABLE `mapel_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
