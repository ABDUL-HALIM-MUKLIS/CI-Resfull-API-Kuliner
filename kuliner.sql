-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Des 2021 pada 16.45
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kuliner`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoris`
--

CREATE TABLE `kategoris` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategoris`
--

INSERT INTO `kategoris` (`id`, `nama_kategori`) VALUES
(1, 'Makanan'),
(2, 'Minuman');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, '13412352135235234', 1, 0, 0, '1', 1),
(2, 2, '124321352562356235', 1, 0, 0, '1', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `limits`
--

CREATE TABLE `limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `limits`
--

INSERT INTO `limits` (`id`, `uri`, `count`, `hour_started`, `api_key`) VALUES
(1, 'uri:resep/index:get', 2, 1638544306, '13412352135235234'),
(2, 'api-key:13412352135235234', 2, 1640099531, '13412352135235234');

-- --------------------------------------------------------

--
-- Struktur dari tabel `resep`
--

CREATE TABLE `resep` (
  `id` int(11) NOT NULL,
  `nama_kuliner` varchar(255) NOT NULL,
  `asal` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `durasi` int(11) NOT NULL,
  `porsi` int(11) NOT NULL,
  `bahan` text NOT NULL,
  `resep` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `resep`
--

INSERT INTO `resep` (`id`, `nama_kuliner`, `asal`, `kategori`, `gambar`, `durasi`, `porsi`, `bahan`, `resep`, `created_at`) VALUES
(1, 'Soto Gading Kuah Bening', 'solo', 'Makanan', 'https://akcdn.detik.net.id/community/media/visual/2021/06/20/resep-soto-ayam-gading-kuah-bening_43.jpeg', 60, 5, '1 ekor ayam kampung gemuk, potong 4 bagian\r\n\r\n2 bata...', '1. Didihkan air sekitar 3 liter dalam panci. Kemudian masukkan potongan ayam kampung dan kecilkan api.\r\n2. Masak terus hingga daging ayam empuk lalu angkat daging ayam dan dinginkan. Suwir-suwir daging ayam dan sisihkan.\r\n3. Ukur kaldunya hingga 2 liter, jika perlu tambahkan air panas.\r\n4. Panaskan 4 sdm minyak, tumis bumbu halus hingga wangi.\r\n5. Masukkan daun bawang, daun salam, daun jeruk dan serai, tumis hingga layu. Angkat, masukkan ke dalam kaldu ayam. Rebus hingga mendidih.\r\n6. Tambahkan potongan tomat, kaldu ayam bubuk dan gula pasir. Didihkan kembali.\r\n7. Penyajian: Taruh suun, suwiran daging ayam, tauge dan irisan kentang goreng dalam mangkuk saji. Siram dengan kaldu ayam panas.\r\n8. Taburi dengan bawang goreng dan seledri.', '2021-12-21 10:52:12'),
(2, 'Sate Ayam Madura', 'Madura', 'Makanan', 'https://asset.kompas.com/crops/k63C9iYLE9ArywzMWvYJiLxfRSE=/0x0:1000x667/750x500/data/photo/2020/12/31/5fed9cd7eb798.jpg', 10, 5, '200 gram kacang tanah kulit, disangrai, dihaluskan \r\n3 buah cabai merah keriting, digoreng \r\n4 butir kemiri, digoreng \r\n2 buah cabai merah besar, digoreng \r\n3 sendok makan gula merah sisir \r\n1 sendok teh garam \r\n500 ml air panas \r\n4 buah lontong \r\n2 sendok makan kecap manis \r\n3 buah jeruk limau \r\n2 sendok makan bawang merah goreng untuk taburan', '1. Bikin sambal kacang dahulu. Haluskan kacang tanah, cabai merah keriting, kemiri, cabai merah besar, gula merah, dan garam. Tuang air. Masak sampai matang dan kental.\r\n2. Ambil 150 gram sambal kacang, kecap manis, dan minyak goreng. Aduk rata. Celup ayam di dalamnya. Lumuri sampai rata.\r\n3. Tusukkan ayam di tusuk sate. Bakar sampai setengah matang. Lumuri lagi dengan campuran kacang. Bakar lagi sampai matang. \r\n4. Lanjutkan membuat sambal, blender cabai. Tambahkan garam. Aduk rata.\r\n5. Sajikan sate bersama sambal kacang, pelengkap, dan sambalnya.\r\n', '2021-12-21 15:23:57'),
(3, 'Es Dawet Telasih', 'solo', 'Minuman', 'https://2.bp.blogspot.com/-wz8My9UPcGA/Vr2uuDsLAGI/AAAAAAAAD3Y/kfgmdEYBQnQ/s1600/Resep%2BEs%2BDawet%2BTelasih%2BKhas%2BSolo.jpeg', 15, 6, '1 ½ ons tape ketan hijau siap pakai\r\n2 sendok makan biji selasih kering, diseduh dengan air panas\r\n1 liter santan dari 1 butir kelapa parut\r\n1 sendok teh garam\r\nEs batu secukupnya', '1. Langkah pertama, Anda bisa merebus santan dengan garam sampai mendidih\r\n2. Kedua, buat cendol dengan mencampur tepung hunkwe, tepung beras, garam, air daun suji serta air biasa sebanyak 200 ml. Aduk sampai rata\r\n3. Tambahkan air kapur sirih lalu aduk merata kembali. Sisihkan dulu untuk merebus sisa air sampai mendidih\r\n4. Tuangi adonan tepung sedikit demi sedikit lalu aduk sampai adonan mengental, licin dan matang. Angkat\r\n5. Ambil mangkuk atau wadah yang berisi es batu dan air matang, kemudian letakkan cetakan cendol di atasnya\r\n6. Tuangkan adonan di atas lubang-lubang cetakan lalu tekan sampai keluar dan jatuh dalam air. Lakukan sampai selesai\r\n7. Selanjutnya, Anda dapat membuat bubur sumsum dengan melarutkan tepung beras bersama santan kental\r\n8. Aduk sampai rata lalu sisihkan. Jerang santan encer bersama daun pandan dan garam di atas api sedang sampai mendidih\r\n9. Lalu masukkan larutan tepung beras dan aduk sampai mendidih serta mengental. Angkat\r\n10. Sajikan dengan cara menyiapkan gelas saji, lalu menata semua bahan di dalamnya. Tuangi santan, sirup gula serta es batu\r\n11. Hidangan es dawet telasih khas Solo siap dinikmati', '2021-12-21 15:30:31'),
(6, 'Bebek Goreng', 'Lamongan', 'Makanan', 'https://www.bisnissulawesi.com/wp-content/uploads/2017/08/racik.jpg', 10, 4, '1 ekor bebek ukuran sedang, potong menjadi 4 bagian\r\n2 buah jeruk nipis\r\n1500 ml air\r\n1 ruas ibu jari lengkuas\r\n3 lbr daun jeruk purut\r\n2 batang serai yang sudah dikupas dan dimemarkan, potong menjadi dua bagian\r\n1 cm jahe\r\n1 sdt garam\r\n9 btr bawang merah\r\n3 btr kemiri\r\n½ sdt ketumbar bubuk\r\n4 siung bawang putih', '1. Lumuri daging bebek yang telah dibersihkan dengan perasan jeruk dan remas-remas agar bau tidak sedap dari dalam daging bebek.ternetralisasi oleh jeruk.\r\n2. Haluskan bawang merah, ketumbar, lengkuas, jahe, dan garam. Balurkan bebek pada bumbu yang sudah dihaluskan.\r\n3. Beri air, lalu rebus dengan serai dan daun jeruk sampai air mongering.\r\n4. Goreng daging bebek pada minyak goreng sampai terendam, tunggu sampai satu sisi kering lalu balik. Angkat jika sudah matang, tiriskan.\r\n5. Hidangkan bebek goreng dengan sambal sesuai selera Anda.', '2021-12-21 15:42:35'),
(8, 'Rendang', 'Padang', 'Makanan', 'https://asset.kompas.com/crops/HDe5rLDP0dEOLb6MC_UPvRTwFg8=/0x141:500x474/750x500/data/photo/2021/05/11/609a08809259f.jpg', 120, 0, '2 sdm minyak sayur \r\n2 liter santan kental \r\n1 kg daging sapi untuk rendang \r\n75 gr kacang merah kering, rendam air hingga lunak dan tiriskan \r\n2 sdm garam\r\n\r\nBumbu :\r\n1 sdm bumbu untuk gulai kambing kering, siap pakai \r\n100 gr cabai merah giling \r\n4 sdm bawang merah giling \r\n3 sdm bawang putih giling \r\n2 sdm jahe giling \r\n1,5 sdm lengkuas giling \r\n1 sdm gula merah, sisir \r\nsetengah sdt pala bubuk \r\n2 sdt ketumbar bubuk \r\n2 sdt merica bubuk \r\n3 cm kayu manis batang \r\n2 cm garda mangga, geprek \r\n2 butir cengkih \r\n1 lembar daun kunyit, ikat \r\n1 batang serai, geprek \r\n2 lembar daun jeruk \r\n1 lembar daun salam\r\n', '1. Panaskan minyak, masukkan semua bumbu, aduk rata, tumis hingga harum. \r\n2. Masukkan santan, aduk rata. Didihkan, aduk terus agar santan tidak pecah. Baca\r\n3. Tambahkan daging, aduk rata. Masak hingga daging berubah warna. Masukkan kacang merah dan garam, aduk. \r\n4. Masak terus dengan api sedang sambil aduk agar bagian bawah masakan tidak hangus. \r\n5. Masak terus hingga mengental dan matang, angkat, dan sajikan.', '2021-12-21 15:41:26'),
(9, 'Opor ayam', 'Solo', 'Makanan', 'https://selerasa.com/wp-content/uploads/2015/05/Resep-opor-ayam-padang.jpg', 80, 10, '1 kg atau 1 ekor ayam\r\n2 lembar daun salam\r\n1 batang serai\r\n4 cm kayu manis\r\n1 cm lengkuas\r\n750 cc santan dari satu butir kelapa\r\nMinyak goreng secukupnya\r\n10 butir bawang merah\r\n4 siung bawang putih\r\n1 /2 sendok teh merica bulat\r\n2 cm jahe\r\n2 cm kunyit\r\n1 sendok makan ketumbar\r\n10 butir jintan\r\nGaram secukupnya\r\nGula pasir secukupnya', '1. Pertama-tama bersihkan terlebih dahulu ayam hingga benar-benar bersih\r\n2. Potong ayam menjadi 10 bagian\r\n3. Goreng ayam dalam minyak panas hingga berwarna kekuning-kuningan\r\n4. Setelah berwarna kekuningan, angkat lalu tiriskan\r\n\r\nCara membuat bumbu opor ayam\r\n1. Memarkan serai dan lengkuas yang telah disiapkan\r\n2. Haluskan semua bumbu yang telah disiapkan hingga benar-benar halus\r\n\r\nCara memasak opor ayam\r\n1. Panaskan minyak secukupnya\r\n2. Tumis semua bumbu yang telah dihaluskan. Masukan juga daun salam, kayu manis dan lengkuas. Tumis hingga aromaya tercium\r\n3. Masukan santan dan aduk hingga merata\r\n4. Masukan ayam yang telah digoreng\r\n5. Masak hingga santan mendidih dan ayam menjadi empuk\r\n6. Tambahkan garam dan gulas pasir secukupnya. Aduk hingga merata dan diamkan beberapa saat. Setelah itu angkat dan sajikan', '2021-12-21 15:40:35');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_kategori` (`nama_kategori`);

--
-- Indeks untuk tabel `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `limits`
--
ALTER TABLE `limits`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `limits`
--
ALTER TABLE `limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `resep`
--
ALTER TABLE `resep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
