-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jun 2025 pada 09.56
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `growtrack_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anak`
--

CREATE TABLE `anak` (
  `id_anak` bigint(20) UNSIGNED NOT NULL,
  `nik_anak` varchar(40) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `tempat_lahir` varchar(45) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(45) NOT NULL,
  `berat_badan` double(8,2) NOT NULL,
  `tinggi_badan` int(10) UNSIGNED NOT NULL,
  `alamat` text NOT NULL,
  `nama_ortu` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `anak`
--

INSERT INTO `anak` (`id_anak`, `nik_anak`, `nama`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `berat_badan`, `tinggi_badan`, `alamat`, `nama_ortu`, `status`, `created_at`, `updated_at`) VALUES
(22, '3510090874090002', 'Bima', 'banyuwangi', '2020-02-05', 'L', 100.00, 150, 'muncar kedungrejo', 'Suci Indahyani', 'Sehat', NULL, NULL),
(24, '3510083020421234', 'cinta', 'banyuwangi', '2023-12-18', 'P', 30.00, 100, 'Banyuwangi', 'tri eva', 'Sehat', NULL, NULL),
(25, '3510057813030008', 'yovita nanda', 'banyuwangi', '2022-07-12', 'perempuan', 12.00, 15, 'muncar baru', 'yovita', 'SEHAT', NULL, NULL),
(27, '3210987654320001', 'Rina Ayu', 'Bandung', '2020-05-10', 'Perempuan', 12.50, 90, 'Jl. Melati No. 45, Bandung', 'Siti Aminah', 'aktif', '2025-06-10 03:46:42', '2025-06-10 03:46:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `beritas`
--

CREATE TABLE `beritas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ibu`
--

CREATE TABLE `ibu` (
  `id_ibu` bigint(20) UNSIGNED NOT NULL,
  `nik_ibu` varchar(30) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tempat_lahir` varchar(45) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tinggi_badan` int(10) UNSIGNED NOT NULL,
  `berat_badan` double(8,2) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ibu`
--

INSERT INTO `ibu` (`id_ibu`, `nik_ibu`, `nama`, `password`, `tempat_lahir`, `tanggal_lahir`, `tinggi_badan`, `berat_badan`, `alamat`, `created_at`, `updated_at`) VALUES
(10, '3510057230400017', 'yovita', '$2y$10$4RBY5rS4iNZ7t6dAiQzEf.T5BHAVqdmuSjUiDUAO.ttU9x78HFLaW', 'banyuwangi', '2004-02-03', 170, 60.00, 'muncar', NULL, NULL),
(11, '3510054330400090', 'tri eva', '$2y$10$PYYUu/k/r9zkb.XRQa2ZSOcYQXNOnnX5DE4oi0NAwLeRSYM5nDul6', 'banyuwangi', '2003-03-02', 160, 70.00, 'bwi', NULL, NULL),
(13, '3510045680116023', 'suci indahyani', '$2y$10$VmeFWDymJosYWnTK4uMlBOmVqwA2/M8Jyb3aLRGODiQUQh2nK0JzG', 'banyuwangi', '2023-12-18', 144, 43.00, 'kenjo', NULL, NULL),
(14, '351005725240017', 'tahmidatun', '$2y$10$iBEHPCbS0NCZhTFUXSs8Ku4ia775faA54ued/gkmFgb9vkGxb3mly', 'Banyuwangi', '2000-05-02', 170, 60.00, 'Tembokrejo', NULL, NULL),
(19, '3510090876923004', 'sri wahyuni', '$2y$10$MOrXLWJp.xbUbmpTc1I0GOZhFc1x8FpkhRA2Cii9ECx/a1OcRUhvG', 'banyuwangi', '2024-11-02', 156, 56.00, 'kabat', NULL, NULL),
(20, '3526431111110002', 'maulidah', '$2y$10$c1AwqpoS39mqnlSbYm5B9OXOLq.Qeeha8o.PPHN8B/4MJGFRNBL22', 'batam', '2000-01-09', 48, 156.00, 'muncar', NULL, NULL),
(22, '1111111', 'iurhfu', '$2y$10$vxo.rPaoy4WrALZjtdcEH.T1xIbieEEgoywbKM0wt9WiL/QShNPLu', 'yu43gfyu43', '2024-11-13', 11, 11.00, 'rehjbehj', NULL, NULL),
(23, '3510054327891302', 'lunamaya', '$2y$10$nPFOv8uFWbtc.EzY1P3HbOuPNvz3dftOSZnu.yZ84stQim6EHX6QG', 'banyuwangi', '2024-11-25', 11, 12.00, 'Kaligoro', NULL, NULL),
(26, '1234567890123456', 'Siti Aminah', '$2b$10$U8e.lgDQLJ.wp2FkQKX33uut6b3uLGU89JWSEh9V/1/Ranj4kBSpW', 'Bandung', '1990-01-01', 160, 55.00, 'Jl. Merdeka No. 45', '2025-06-02 03:10:25', '2025-06-02 03:10:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_jadwal` bigint(20) UNSIGNED NOT NULL,
  `tanggal_pelaksana` date NOT NULL,
  `waktu_mulai` time NOT NULL,
  `petugas_pelaksana` varchar(255) NOT NULL,
  `kegiatan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'baru'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan_anak`
--

CREATE TABLE `layanan_anak` (
  `id_layanananak` bigint(20) UNSIGNED NOT NULL,
  `nik_anak` varchar(40) NOT NULL,
  `pemberian_pmt` varchar(45) NOT NULL,
  `tanggal_cekup` date NOT NULL,
  `hasil_posyandu` varchar(45) NOT NULL,
  `imunisasi` varchar(45) NOT NULL,
  `lingkar_kepala` varchar(45) NOT NULL,
  `berat_badan` double(8,2) NOT NULL,
  `tinggi_badan` int(10) UNSIGNED NOT NULL,
  `pemberian_vitamin` varchar(45) NOT NULL,
  `gizi_rutin` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `layanan_anak`
--

INSERT INTO `layanan_anak` (`id_layanananak`, `nik_anak`, `pemberian_pmt`, `tanggal_cekup`, `hasil_posyandu`, `imunisasi`, `lingkar_kepala`, `berat_badan`, `tinggi_badan`, `pemberian_vitamin`, `gizi_rutin`, `created_at`, `updated_at`) VALUES
(13, '3510057813030008', 'buah buahan', '2024-11-01', 'baik', 'Polio', '12', 23.00, 30, 'vitamin A', 'pemberian PMT', NULL, NULL),
(14, '3510090874090002', 'sayur', '2024-11-01', 'baik', 'Varisela', '12', 25.00, 33, 'vitaminA', 'pemberian PMT', NULL, NULL),
(15, '3510057813030008', 'buah buahan', '2024-11-06', 'baik sekali', 'Polio', '12', 34.00, 156, 'vitamin c', 'buah buahan', NULL, NULL),
(16, '3510057813030008', 'pp', '2024-11-07', '11', 'Polio', '11', 111.00, 111, '11', '11', NULL, NULL),
(17, '3510057813030008', '11', '2024-11-13', '11', 'Polio', '11111', 11.00, 11, '11', '11', NULL, NULL),
(19, '3210987654320001', 'PMT Balita Sehat', '2025-05-26', 'Normal', 'DPT, Polio', '45.5', 12.30, 89, 'Vitamin A, C', 'Rutin diberikan setiap bulan', '2025-06-10 03:51:59', '2025-06-10 03:51:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan_ibu`
--

CREATE TABLE `layanan_ibu` (
  `id_layananibu` bigint(20) UNSIGNED NOT NULL,
  `nik_ibu` varchar(40) NOT NULL,
  `lingkar_lengan` int(10) UNSIGNED DEFAULT NULL,
  `saran_bidan` varchar(45) NOT NULL,
  `tanggal_cekup` date NOT NULL,
  `umur_kehamilan` int(10) UNSIGNED DEFAULT NULL,
  `denyutjantung_janin` int(10) UNSIGNED NOT NULL,
  `cek_darah` int(10) UNSIGNED NOT NULL,
  `berat_badan` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `layanan_ibu`
--

INSERT INTO `layanan_ibu` (`id_layananibu`, `nik_ibu`, `lingkar_lengan`, `saran_bidan`, `tanggal_cekup`, `umur_kehamilan`, `denyutjantung_janin`, `cek_darah`, `berat_badan`, `created_at`, `updated_at`) VALUES
(2, '351005725240017', 100, 'Minum air', '2023-12-21', 12, 100, 120, 70.00, NULL, NULL),
(3, '3510045680116023', 22, 'istirahat yang cukup', '2023-12-22', 16, 100, 110, 75.00, NULL, NULL),
(4, '3510057230400017', 22, 'istirahat yang cukup', '2023-12-24', 16, 150, 120, 65.00, NULL, NULL),
(7, '351005725240017', 11, 'baik', '2024-11-02', 11, 11, 11, 11.00, NULL, NULL),
(10, '351005725240017', 12, 'biasakan perbanyak minum air putih', '2024-11-06', 13, 150, 150, 33.00, NULL, NULL),
(11, '351005725240017', 12, 'olahraga', '2024-11-06', 16, 15, 160, 67.00, NULL, NULL),
(12, '351005725240017', 11, '11', '2024-11-13', 11, 11, 11, 11.00, NULL, NULL),
(13, '3510057230400017', 11, '11', '2024-11-25', 11, 11, 11, 11.00, NULL, NULL),
(14, '351005725240017', 25, 'Konsumsi tablet tambah darah update', '2025-05-25', 28, 140, 120, 60.50, '2025-05-29 08:04:34', '2025-05-29 08:10:50'),
(16, '1234567890', 25, 'Konsumsi tablet tambah darah lagi', '2025-05-25', 28, 140, 0, 60.50, '2025-06-02 04:46:46', '2025-06-02 04:46:46'),
(17, '1234567890123456', 25, 'Konsumsi tablet tambah darah lagi', '2025-05-25', 28, 140, 0, 60.50, '2025-06-02 04:48:36', '2025-06-02 04:48:36'),
(18, '1234567890123456', 25, 'Konsumsi tablet tambah darah lagi', '2025-05-25', 28, 140, 0, 60.50, '2025-06-10 04:00:45', '2025-06-10 04:00:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_21_163203_create_ibu_table', 1),
(6, '2024_01_21_163400_create_petugas_table', 1),
(7, '2024_01_21_164206_create_anak_table', 1),
(8, '2024_01_21_165645_create_layanan_ibu_table', 1),
(9, '2024_01_21_165931_create_layanan_anak_table', 1),
(10, '2024_10_04_054818_create_jadwal_table', 1),
(11, '2024_10_07_151113_add_status_to_jadwal_table', 1),
(12, '2024_10_14_033030_create_beritas_table', 1),
(13, '2024_10_14_123646_create_notifications_table', 1),
(14, '2024_11_27_214355_create_obat_masuk_table', 1),
(15, '2024_11_27_221645_create_obat_table', 1),
(16, '2024_11_28_035446_create_obat_keluar_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_obat` varchar(255) NOT NULL,
  `jenis_obat` varchar(255) NOT NULL,
  `satuan` varchar(255) NOT NULL,
  `jumlah_stok` int(11) NOT NULL DEFAULT 0,
  `harga_satuan` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('tersedia','tidak tersedia') NOT NULL DEFAULT 'tersedia',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `jenis_obat`, `satuan`, `jumlah_stok`, `harga_satuan`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Paracetamoll', 'Obat Batuk', 'Pil', 40, 3000.00, 'tersedia', '2024-11-27 18:45:11', '2024-11-27 21:19:47'),
(2, 'Apaun', 'Obat Pilek', 'Pil', 30, 4000.00, 'tersedia', '2024-11-27 18:49:15', '2024-11-27 21:22:49'),
(4, 'Mixagrip', 'Obat sakit kepala', 'Tablet', 150, 5000.00, 'tersedia', '2024-11-27 23:15:00', '2024-11-29 18:15:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat_keluar`
--

CREATE TABLE `obat_keluar` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_obat` varchar(255) NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `jumlah_stok` int(11) NOT NULL DEFAULT 0,
  `alasan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `obat_keluar`
--

INSERT INTO `obat_keluar` (`id`, `nama_obat`, `tanggal_keluar`, `jumlah_stok`, `alasan`, `created_at`, `updated_at`) VALUES
(1, 'Paracetamoll', '2024-11-28', 2, 'Dibeli', '2024-11-27 21:13:05', '2024-11-27 21:13:05'),
(2, 'Paracetamoll', '2024-11-28', 3, 'Dibeli', '2024-11-27 21:19:47', '2024-11-27 21:19:47'),
(3, 'Mixagrip', '2024-11-28', 50, 'keperluan posyandu', '2024-11-27 23:17:03', '2024-11-27 23:17:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat_masuk`
--

CREATE TABLE `obat_masuk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_obat` varchar(255) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `jumlah_stok` int(11) NOT NULL,
  `tanggal_kadaluarsa` date NOT NULL,
  `lokasi_penyimpanan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `obat_masuk`
--

INSERT INTO `obat_masuk` (`id`, `nama_obat`, `tanggal_masuk`, `jumlah_stok`, `tanggal_kadaluarsa`, `lokasi_penyimpanan`, `created_at`, `updated_at`) VALUES
(1, 'Paracetamoll', '2024-11-27', 5, '2025-10-21', 'Gudang', '2024-11-27 20:09:17', '2024-11-27 20:09:17'),
(2, 'Paracetamoll', '2024-11-28', 10, '2026-10-28', 'Gudang', '2024-11-27 20:10:05', '2024-11-27 20:10:05'),
(3, 'Paracetamoll', '2024-11-27', 5, '2025-10-21', 'Gudang', '2024-11-27 20:13:23', '2024-11-27 20:13:23'),
(4, 'Apaun', '2024-11-21', 20, '2024-11-28', 'Gudang', '2024-11-27 21:22:49', '2024-11-27 21:22:49'),
(5, 'Mixagrip', '2024-11-28', 100, '2024-11-30', 'gudang', '2024-11-27 23:15:59', '2024-11-27 23:15:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` bigint(20) UNSIGNED NOT NULL,
  `nik_petugas` varchar(40) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nik_petugas`, `nama`, `password`, `status`, `created_at`, `updated_at`) VALUES
(129, '3510045672020009', 'ahya', '$2y$10$sC4FlQBJQZpa4LL.g91uO.v1doqdWja9R7fdzfdQEg81Kv13qLPSS', 'Bidan', NULL, NULL),
(132, '3510048912030005', 'yovita', '$2y$10$kxlydL5Sq9.eAC8XFrgcmeBhLBr99hJnxEL6Q0MYUvevQt.L1gWvu', 'kader', NULL, NULL),
(133, '3511098712340003', 'yulia', '$2y$10$6UXb/xVGHrazO3tyv8peg.pX8kMzV3emHkwL4NXLq4uOXYHKJoSry', 'kader', NULL, NULL),
(134, '9876543210', 'Siti Aminah Update', '$2b$10$BV4qyRXjbdPsGaKr1Y7Xr.bTUluiunSLdmVPj7n.x4Y7aM/b.vIrW', 'nonaktif', '2025-05-26 02:17:02', '2025-05-26 02:44:17'),
(135, '1234567890', 'Siti Aminah', '$2b$10$b1Kr1PiG2Ci4by92uGWNx.5l1P4513RqRef3SFHBemzEzLbYOb9zW', 'kader', '2025-06-02 03:15:45', '2025-06-02 03:15:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anak`
--
ALTER TABLE `anak`
  ADD PRIMARY KEY (`id_anak`),
  ADD UNIQUE KEY `anak_nik_anak_unique` (`nik_anak`);

--
-- Indeks untuk tabel `beritas`
--
ALTER TABLE `beritas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `ibu`
--
ALTER TABLE `ibu`
  ADD PRIMARY KEY (`id_ibu`),
  ADD UNIQUE KEY `ibu_nik_ibu_unique` (`nik_ibu`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `layanan_anak`
--
ALTER TABLE `layanan_anak`
  ADD PRIMARY KEY (`id_layanananak`);

--
-- Indeks untuk tabel `layanan_ibu`
--
ALTER TABLE `layanan_ibu`
  ADD PRIMARY KEY (`id_layananibu`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `obat_keluar`
--
ALTER TABLE `obat_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `obat_masuk`
--
ALTER TABLE `obat_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`),
  ADD UNIQUE KEY `petugas_nik_petugas_unique` (`nik_petugas`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anak`
--
ALTER TABLE `anak`
  MODIFY `id_anak` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `beritas`
--
ALTER TABLE `beritas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ibu`
--
ALTER TABLE `ibu`
  MODIFY `id_ibu` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `layanan_anak`
--
ALTER TABLE `layanan_anak`
  MODIFY `id_layanananak` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `layanan_ibu`
--
ALTER TABLE `layanan_ibu`
  MODIFY `id_layananibu` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `obat_keluar`
--
ALTER TABLE `obat_keluar`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `obat_masuk`
--
ALTER TABLE `obat_masuk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
