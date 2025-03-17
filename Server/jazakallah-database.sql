-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 11, 2024 at 12:40 PM
-- Server version: 10.11.8-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u997379761_islam`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `_id` varchar(255) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--
-- --------------------------------------------------------

--
-- Table structure for table `azkars`
--

CREATE TABLE `azkars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `_id` varchar(255) NOT NULL,
  `azkarEnglish` text NOT NULL,
  `azkarArabic` text NOT NULL,
  `azkarTurkish` text NOT NULL,
  `azkarUrdu` text NOT NULL,
  `azkarBangla` varchar(255) NOT NULL,
  `azkarHindi` varchar(255) NOT NULL,
  `azkarFrench` varchar(255) NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `azkars`
--

INSERT INTO `azkars` (`id`, `_id`, `azkarEnglish`, `azkarArabic`, `azkarTurkish`, `azkarUrdu`, `azkarBangla`, `azkarHindi`, `azkarFrench`, `category_id`, `timestamp`, `created_at`, `updated_at`) VALUES
(1, '1709035202389', 'sdadsa', 'sdsd', 'dsds', 'sdds', 'N/A', 'N/A', 'N/A', '1709035185020', '1709035202', '2024-02-27 11:00:02', '2024-02-27 11:00:02'),
(4, '1709097703509', 'I seek the protection of Allah from the accursed Shayṭān. Allah, there is no god worthy of worship but He, the Ever Living, The Sustainer of all. Neither drowsiness overtakes Him nor sleep. To Him Alone belongs whatever is in the heavens and whatever is on the earth. Who is it that can intercede with Him except with His permission? He knows what is before them and what will be after them, and they encompass not a thing of His knowledge except for what He wills. His Kursī extends over the heavens and the earth, and their preservation does not tire Him. And He is the Most High, the Magnificent. (2:255)', 'أَعُوْذُ بِاللّٰهِ مِنَ الشَّيْطَانِ الرَّجِيْمِ. اَللّٰهُ لَآ إِلٰهَ إِلَّا هُوَ الْحَىُّ الْقَيُّوْمُ ، لَا تَأْخُذُهُۥ سِنَةٌ وَّلَا نَوْمٌ ، لَهُ مَا فِى السَّمٰـوٰتِ وَمَا فِى الْأَرْضِ ، مَنْ ذَا الَّذِىْ يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِۦ ، يَعْلَمُ مَا بَيْنَ أَيْدِيْهِمْ وَمَا خَلْفَهُمْ ، وَلَا يُحِيْطُوْنَ بِشَىْءٍ مِّنْ عِلْمِهِٓ إِلَّا بِمَا شَآءَ ، وَسِعَ كُرْسِيُّهُ السَّمٰـوٰتِ وَالْأَرْضَ، وَلَا يَئُوْدُهُۥ حِفْظُهُمَا ، وَهُوَ الْعَلِىُّ الْعَظِيْمُ.', 'Kovulmuş Şeytan\'dan Allah\'a sığınırım. O, kendisinden başka ilah olmayan, diri ve ebedi olan Allah\'tır. O\'na ne yıl ne de uyku yetişemez. Göklerde ve yerde ne varsa O\'nundur. O kimdir? O, O\'nun katında şefaat eder. ancak O\'nun izniyle. O, onların önlerinde ve arkalarında olanı bilir ve onlar, O\'nun dilediği dışında O\'nun ilminden hiçbir şeyi kuşatamazlar. Yeryüzü ve onları muhafaza etmek O\'nu yormaz. Harika.', 'میں شیطان مردود سے اللہ کی پناہ مانگتا ہوں۔ اللہ جس کے سوا کوئی معبود نہیں وہ ہمیشہ زندہ رہنے والا ہے اسے نہ سال آسکتا ہے اور نہ نیند اس کا ہے جو کچھ آسمانوں میں ہے اور جو کچھ زمین میں ہے وہ کون ہے وہ اس کے پاس شفاعت کرتا ہے اس کی اجازت کے بغیر، وہ جانتا ہے جو کچھ ان کے آگے ہے اور جو کچھ ان کے پیچھے ہے، اور وہ اس کے علم میں سے کسی چیز کا احاطہ نہیں کرتے مگر جو وہ چاہے، اور زمین اور ان کی حفاظت اسے نہیں تھکتی، اور وہ سب سے بلند و بالا ہے۔ زبردست.', 'N/A', 'N/A', 'N/A', '1709066422382', '1709097703', '2024-02-28 04:21:43', '2024-02-28 04:24:11'),
(5, '1709097943452', 'I seek the protection of Allah from the accursed Shayṭān. Allah, there is no god worthy of worship but He, the Ever Living, The Sustainer of all. Neither drowsiness overtakes Him nor sleep. To Him Alone belongs whatever is in the heavens and whatever is on the earth. Who is it that can intercede with Him except with His permission? He knows what is before them and what will be after them, and they encompass not a thing of His knowledge except for what He wills. His Kursī extends over the heavens and the earth, and their preservation does not tire Him. And He is the Most High, the Magnificent. (2:255)', 'أَعُوْذُ بِاللّٰهِ مِنَ الشَّيْطَانِ الرَّجِيْمِ. اَللّٰهُ لَآ إِلٰهَ إِلَّا هُوَ الْحَىُّ الْقَيُّوْمُ ، لَا تَأْخُذُهُۥ سِنَةٌ وَّلَا نَوْمٌ ، لَهُ مَا فِى السَّمٰـوٰتِ وَمَا فِى الْأَرْضِ ، مَنْ ذَا الَّذِىْ يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِۦ ، يَعْلَمُ مَا بَيْنَ أَيْدِيْهِمْ وَمَا خَلْفَهُمْ ، وَلَا يُحِيْطُوْنَ بِشَىْءٍ مِّنْ عِلْمِهِٓ إِلَّا بِمَا شَآءَ ، وَسِعَ كُرْسِيُّهُ السَّمٰـوٰتِ وَالْأَرْضَ، وَلَا يَئُوْدُهُۥ حِفْظُهُمَا ، وَهُوَ الْعَلِىُّ الْعَظِيْمُ.', 'Kovulmuş Şeytan\'dan Allah\'a sığınırım. O, kendisinden başka ilah olmayan, diri ve ebedi olan Allah\'tır. O\'na ne yıl ne de uyku yetişemez. Göklerde ve yerde ne varsa O\'nundur. O kimdir? O, O\'nun katında şefaat eder. ancak O\'nun izniyle. O, onların önlerinde ve arkalarında olanı bilir ve onlar, O\'nun dilediği dışında O\'nun ilminden hiçbir şeyi kuşatamazlar. Yeryüzü ve onları muhafaza etmek O\'nu yormaz. Harika.', 'میں شیطان مردود سے اللہ کی پناہ مانگتا ہوں۔ اللہ جس کے سوا کوئی معبود نہیں وہ ہمیشہ زندہ رہنے والا ہے اسے نہ سال آسکتا ہے اور نہ نیند اس کا ہے جو کچھ آسمانوں میں ہے اور جو کچھ زمین میں ہے وہ کون ہے وہ اس کے پاس شفاعت کرتا ہے اس کی اجازت کے بغیر، وہ جانتا ہے جو کچھ ان کے آگے ہے اور جو کچھ ان کے پیچھے ہے، اور وہ اس کے علم میں سے کسی چیز کا احاطہ نہیں کرتے مگر جو وہ چاہے، اور زمین اور ان کی حفاظت اسے نہیں تھکتی، اور وہ سب سے بلند و بالا ہے۔ زبردست.', 'N/A', 'N/A', 'N/A', '1709066526731', '1709097943', '2024-02-28 04:25:43', '2024-02-28 04:25:43');

-- --------------------------------------------------------

--
-- Table structure for table `azkar_categories`
--

CREATE TABLE `azkar_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `_id` varchar(255) NOT NULL,
  `categoryArabic` varchar(255) NOT NULL,
  `categoryEnglish` varchar(255) NOT NULL,
  `categoryTurkish` varchar(255) NOT NULL,
  `categoryUrdu` varchar(255) NOT NULL,
  `categoryBangla` varchar(255) NOT NULL,
  `categoryHindi` varchar(255) NOT NULL,
  `categoryFrench` varchar(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `azkar_categories`
--

INSERT INTO `azkar_categories` (`id`, `_id`, `categoryArabic`, `categoryEnglish`, `categoryTurkish`, `categoryUrdu`, `categoryBangla`, `categoryHindi`, `categoryFrench`, `timestamp`, `created_at`, `updated_at`) VALUES
(3, '1709066422382', 'صلاة الفجر', 'Morning Adhkar', 'Sabah namazı', 'صبح کا اذکار', 'N/A', 'N/A', 'N/A', '1709066422', '2024-02-27 19:40:22', '2024-02-27 19:40:22'),
(4, '1709066526731', 'صلاة العشاء', 'Evening Adhkar', 'Akşam namazı', 'شام کا اذکار', 'N/A', 'N/A', 'N/A', '1709066526', '2024-02-27 19:42:06', '2024-02-27 19:42:06'),
(5, '1709066614439', 'قبل النوم', 'Before Sleep', 'Uyumadan önce', 'سونے سے پہلے', 'N/A', 'N/A', 'N/A', '1709066614', '2024-02-27 19:43:34', '2024-02-27 19:43:34'),
(6, '1709066683254', 'صلاح', 'Salah', 'Salah', 'صلہ', 'N/A', 'N/A', 'N/A', '1709066683', '2024-02-27 19:44:43', '2024-02-27 19:44:43'),
(7, '1709066769739', 'بعد الصلاة', 'After Salah', 'Namazdan sonra', 'صلاۃ کے بعد', 'N/A', 'N/A', 'N/A', '1709066769', '2024-02-27 19:46:09', '2024-02-27 19:46:09'),
(8, '1709066845359', 'الرقية والمرض', 'Ruqyah & Illness', 'Ruqyah ve hastalık', 'رقیہ اور بیماری', 'N/A', 'N/A', 'N/A', '1709066845', '2024-02-27 19:47:25', '2024-02-27 19:47:25'),
(9, '1709066907236', 'الحمد لله', 'Praises of Allah', 'Allah\'ın övgüsü', 'اللہ کی حمد', 'N/A', 'N/A', 'N/A', '1709066907', '2024-02-27 19:48:27', '2024-02-27 19:48:27'),
(10, '1709066960203', 'استغفار', 'Istighfar', 'İstiğfar', 'استغفار', 'N/A', 'N/A', 'N/A', '1709066960', '2024-02-27 19:49:20', '2024-02-27 19:49:20');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `totalDonation` double NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `user_id`, `totalDonation`, `timestamp`, `created_at`, `updated_at`) VALUES
(1, '1709035151261', 0, '1709035151', '2024-02-27 10:59:11', '2024-02-27 10:59:11'),
(2, '1709039427790', 0, '1709039427', '2024-02-27 12:10:27', '2024-02-27 12:10:27'),
(3, '1709052333818', 0, '1709052333', '2024-02-27 15:45:33', '2024-02-27 15:45:33'),
(4, '1709065793053', 0, '1709065793', '2024-02-27 19:29:53', '2024-02-27 19:29:53'),
(5, '1709067900981', 0, '1709067900', '2024-02-27 20:05:01', '2024-02-27 20:05:01'),
(6, '1709097978159', 0, '1709097978', '2024-02-28 04:26:18', '2024-02-28 04:26:18'),
(7, '1709098020541', 0, '1709098020', '2024-02-28 04:27:00', '2024-02-28 04:27:00'),
(8, '1709098164449', 0, '1709098164', '2024-02-28 04:29:24', '2024-02-28 04:29:24'),
(9, '1709106806027', 0, '1709106806', '2024-02-28 06:53:26', '2024-02-28 06:53:26'),
(10, '1709112087399', 0, '1709112087', '2024-02-28 08:21:27', '2024-02-28 08:21:27'),
(11, '1709116727603', 0, '1709116727', '2024-02-28 09:38:47', '2024-02-28 09:38:47'),
(12, '1709128643948', 0, '1709128643', '2024-02-28 12:57:24', '2024-02-28 12:57:24'),
(13, '1709146473225', 0, '1709146473', '2024-02-28 17:54:33', '2024-02-28 17:54:33'),
(14, '1709190700903', 0, '1709190700', '2024-02-29 06:11:40', '2024-02-29 06:11:40'),
(15, '1709219276973', 0, '1709219276', '2024-02-29 14:07:57', '2024-02-29 14:07:57'),
(16, '1709302092239', 0, '1709302092', '2024-03-01 13:08:12', '2024-03-01 13:08:12'),
(17, '1709405802935', 0, '1709405802', '2024-03-02 17:56:43', '2024-03-02 17:56:43'),
(18, '1709451800109', 0, '1709451800', '2024-03-03 06:43:20', '2024-03-03 06:43:20'),
(19, '1709468515817', 0, '1709468515', '2024-03-03 11:21:55', '2024-03-03 11:21:55'),
(20, '1709668253096', 0, '1709668253', '2024-03-05 18:50:53', '2024-03-05 18:50:53'),
(21, '1709811870632', 0, '1709811870', '2024-03-07 10:44:30', '2024-03-07 10:44:30'),
(22, '1709981563141', 0, '1709981563', '2024-03-09 09:52:43', '2024-03-09 09:52:43'),
(23, '1709982348047', 0, '1709982348', '2024-03-09 10:05:48', '2024-03-09 10:05:48'),
(24, '1709998459009', 0, '1709998459', '2024-03-09 14:34:19', '2024-03-09 14:34:19'),
(25, '1710072735516', 0, '1710072735', '2024-03-10 11:12:15', '2024-03-10 11:12:15'),
(26, '1710125616930', 0, '1710125616', '2024-03-11 01:53:36', '2024-03-11 01:53:36'),
(27, '1710168296019', 0, '1710168296', '2024-03-11 13:44:56', '2024-03-11 13:44:56'),
(28, '1710171590020', 0, '1710171590', '2024-03-11 14:39:50', '2024-03-11 14:39:50'),
(29, '1710215678881', 0, '1710215678', '2024-03-12 02:54:38', '2024-03-12 02:54:38'),
(30, '1710410035704', 0, '1710410035', '2024-03-14 08:53:55', '2024-03-14 08:53:55'),
(31, '1710420935438', 0, '1710420935', '2024-03-14 11:55:35', '2024-03-14 11:55:35'),
(32, '1710544977336', 0, '1710544977', '2024-03-15 22:22:57', '2024-03-15 22:22:57'),
(33, '1710561989997', 0, '1710561989', '2024-03-16 03:06:30', '2024-03-16 03:06:30'),
(34, '1710617251785', 0, '1710617251', '2024-03-16 18:27:31', '2024-03-16 18:27:31'),
(35, '1710667754767', 0, '1710667754', '2024-03-17 08:29:14', '2024-03-17 08:29:14'),
(36, '1710700659384', 0, '1710700659', '2024-03-17 17:37:39', '2024-03-17 17:37:39'),
(37, '1710863151027', 0, '1710863151', '2024-03-19 14:45:51', '2024-03-19 14:45:51'),
(38, '1711064446651', 0, '1711064446', '2024-03-21 22:40:46', '2024-03-21 22:40:46'),
(39, '1711186809251', 0, '1711186809', '2024-03-23 08:40:09', '2024-03-23 08:40:09'),
(40, '1711219116340', 0, '1711219116', '2024-03-23 17:38:36', '2024-03-23 17:38:36'),
(41, '1711275000041', 0, '1711275000', '2024-03-24 09:10:00', '2024-03-24 09:10:00'),
(42, '1711309228245', 0, '1711309228', '2024-03-24 18:40:28', '2024-03-24 18:40:28'),
(43, '1711331561683', 0, '1711331561', '2024-03-25 00:52:41', '2024-03-25 00:52:41'),
(44, '1711459351608', 0, '1711459351', '2024-03-26 12:22:31', '2024-03-26 12:22:31'),
(45, '1711486893630', 0, '1711486893', '2024-03-26 20:01:33', '2024-03-26 20:01:33'),
(46, '1711597632894', 0, '1711597632', '2024-03-28 02:47:12', '2024-03-28 02:47:12'),
(47, '1711640462774', 0, '1711640462', '2024-03-28 14:41:02', '2024-03-28 14:41:02'),
(48, '1711770009416', 0, '1711770009', '2024-03-30 02:40:09', '2024-03-30 02:40:09'),
(49, '1712011479603', 0, '1712011479', '2024-04-01 20:44:39', '2024-04-01 20:44:39'),
(50, '1712173184592', 0, '1712173184', '2024-04-03 17:39:44', '2024-04-03 17:39:44'),
(51, '1712173589020', 0, '1712173589', '2024-04-03 17:46:29', '2024-04-03 17:46:29'),
(52, '1712192832746', 0, '1712192832', '2024-04-03 23:07:12', '2024-04-03 23:07:12'),
(53, '1712385378864', 0, '1712385378', '2024-04-06 04:36:18', '2024-04-06 04:36:18'),
(54, '1712395602279', 0, '1712395602', '2024-04-06 07:26:42', '2024-04-06 07:26:42'),
(55, '1712422520949', 0, '1712422520', '2024-04-06 14:55:21', '2024-04-06 14:55:21'),
(56, '1712468087621', 0, '1712468087', '2024-04-07 03:34:47', '2024-04-07 03:34:47'),
(57, '1712787001314', 0, '1712787001', '2024-04-10 20:10:01', '2024-04-10 20:10:01'),
(58, '1712804092843', 0, '1712804092', '2024-04-11 00:54:52', '2024-04-11 00:54:52'),
(59, '1712932377687', 0, '1712932377', '2024-04-12 12:32:57', '2024-04-12 12:32:57'),
(60, '1712986230200', 0, '1712986230', '2024-04-13 03:30:30', '2024-04-13 03:30:30'),
(61, '1712987562004', 0, '1712987562', '2024-04-13 03:52:42', '2024-04-13 03:52:42'),
(62, '1713123256508', 0, '1713123256', '2024-04-14 17:34:16', '2024-04-14 17:34:16'),
(63, '1713179565598', 0, '1713179565', '2024-04-15 09:12:45', '2024-04-15 09:12:45'),
(64, '1713189860773', 0, '1713189860', '2024-04-15 12:04:20', '2024-04-15 12:04:20'),
(65, '1713307721082', 0, '1713307721', '2024-04-16 20:48:41', '2024-04-16 20:48:41'),
(66, '1713351446616', 0, '1713351446', '2024-04-17 08:57:26', '2024-04-17 08:57:26'),
(67, '1713438498377', 0, '1713438498', '2024-04-18 09:08:18', '2024-04-18 09:08:18'),
(68, '1713475771460', 0, '1713475771', '2024-04-18 19:29:31', '2024-04-18 19:29:31'),
(69, '1713547111311', 0, '1713547111', '2024-04-19 15:18:31', '2024-04-19 15:18:31'),
(70, '1713856802982', 0, '1713856802', '2024-04-23 05:20:03', '2024-04-23 05:20:03'),
(71, '1713873212576', 0, '1713873212', '2024-04-23 09:53:32', '2024-04-23 09:53:32'),
(72, '1713899771378', 0, '1713899771', '2024-04-23 17:16:11', '2024-04-23 17:16:11'),
(73, '1713906796973', 0, '1713906796', '2024-04-23 19:13:17', '2024-04-23 19:13:17'),
(74, '1713940697395', 0, '1713940697', '2024-04-24 04:38:17', '2024-04-24 04:38:17'),
(75, '1713957593743', 0, '1713957593', '2024-04-24 09:19:53', '2024-04-24 09:19:53'),
(76, '1713961285356', 0, '1713961285', '2024-04-24 10:21:25', '2024-04-24 10:21:25'),
(77, '1714133602289', 0, '1714133602', '2024-04-26 10:13:22', '2024-04-26 10:13:22'),
(78, '1714133637067', 0, '1714133637', '2024-04-26 10:13:57', '2024-04-26 10:13:57'),
(79, '1714551369914', 0, '1714551369', '2024-05-01 06:16:09', '2024-05-01 06:16:09'),
(80, '1714738634242', 0, '1714738634', '2024-05-03 10:17:14', '2024-05-03 10:17:14'),
(81, '1714898832007', 0, '1714898832', '2024-05-05 06:47:12', '2024-05-05 06:47:12'),
(82, '1715335151268', 0, '1715335151', '2024-05-10 07:59:11', '2024-05-10 07:59:11'),
(83, '1715462030353', 0, '1715462030', '2024-05-11 19:13:50', '2024-05-11 19:13:50'),
(84, '1715564331235', 0, '1715564331', '2024-05-12 23:38:51', '2024-05-12 23:38:51'),
(85, '1715697030845', 0, '1715697030', '2024-05-14 12:30:30', '2024-05-14 12:30:30'),
(86, '1715798424883', 0, '1715798424', '2024-05-15 16:40:24', '2024-05-15 16:40:24'),
(87, '1715805958061', 0, '1715805958', '2024-05-15 18:45:58', '2024-05-15 18:45:58'),
(88, '1715937361357', 0, '1715937361', '2024-05-17 07:16:01', '2024-05-17 07:16:01'),
(89, '1716122503917', 124.066258, '1716122503', '2024-05-19 10:41:44', '2024-05-23 08:01:04'),
(90, '1716155519019', 0, '1716155519', '2024-05-19 19:51:59', '2024-05-19 19:51:59'),
(91, '1716351444317', 0, '1716351444', '2024-05-22 02:17:24', '2024-05-22 02:17:24'),
(92, '1716639473929', 0, '1716639473', '2024-05-25 10:17:53', '2024-05-25 10:17:53'),
(93, '1716643539760', 0, '1716643539', '2024-05-25 11:25:39', '2024-05-25 11:25:39'),
(94, '1716972069431', 0, '1716972069', '2024-05-29 06:41:09', '2024-05-29 06:41:09'),
(95, '1717100831929', 0, '1717100831', '2024-05-30 18:27:11', '2024-05-30 18:27:11'),
(96, '1717554011913', 0, '1717554011', '2024-06-05 00:20:11', '2024-06-05 00:20:11'),
(97, '1717713553350', 0, '1717713553', '2024-06-06 20:39:13', '2024-06-06 20:39:13'),
(98, '1717958277142', 0, '1717958277', '2024-06-09 16:37:57', '2024-06-09 16:37:57'),
(99, '1726055324412', 0, '1726055324', '2024-09-11 11:48:44', '2024-09-11 11:48:44'),
(100, '1726055615699', 0, '1726055615', '2024-09-11 11:53:35', '2024-09-11 11:53:35'),
(101, '1726056431128', 0, '1726056431', '2024-09-11 12:07:11', '2024-09-11 12:07:11');

-- --------------------------------------------------------

--
-- Table structure for table `duas`
--

CREATE TABLE `duas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `_id` varchar(255) NOT NULL,
  `duaArabic` text NOT NULL,
  `duaEnglish` text NOT NULL,
  `duaTurkish` text NOT NULL,
  `duaUrdu` text NOT NULL,
  `duaBangla` text NOT NULL,
  `duaHindi` text NOT NULL,
  `duaFrench` text NOT NULL,
  `titleBangla` varchar(255) NOT NULL,
  `titleHindi` varchar(255) NOT NULL,
  `titleFrench` varchar(255) NOT NULL,
  `titleArabic` varchar(255) NOT NULL,
  `titleEnglish` varchar(255) NOT NULL,
  `titleTurkish` varchar(255) NOT NULL,
  `titleUrdu` varchar(255) NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `duas`
--

INSERT INTO `duas` (`id`, `_id`, `duaArabic`, `duaEnglish`, `duaTurkish`, `duaUrdu`, `duaBangla`, `duaHindi`, `duaFrench`, `titleBangla`, `titleHindi`, `titleFrench`, `titleArabic`, `titleEnglish`, `titleTurkish`, `titleUrdu`, `category_id`, `timestamp`, `created_at`, `updated_at`) VALUES
(3, '1709040092540', 'ربنا آتنا في الدنيا حسنة وفي الآخرة حسنة وقنا عذاب النار', 'Our Lord! Grant us the good of this world and the Hereafter, and protect us from the torment of the Fire.', 'Efendimiz! Bize dünya ve ahiret iyiliklerini ver ve bizi ateş azabından koru.\n', 'اے ہمارے رب! ہمیں دنیا اور آخرت کی بھلائی عطا فرما اور ہمیں آگ کے عذاب سے بچا۔\n', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'دعاء النجاح', 'Dua for success', 'Başarı için dua', 'کامیابی کی دعا', '1709039912874', '1709040092', '2024-02-27 12:21:32', '2024-02-27 18:08:46'),
(4, '1709061078931', 'اللهمّ إني أسألك علماً نافعاً، ورزقاً طيباً، وعملاً متقبلاً.\n~ ابن ماجه وغيره', 'Oh Allah, I ask you for knowledge that is of benefit, a good provision, and deeds that will be accepted.\n~ Ibn Majah and others⁣', 'Allah\'ım senden faydalı ilim, güzel rızık ve kabul olunacak amel istiyorum.\n~ İbn Mâce ve diğerleri⁣', 'اے اللہ میں تجھ سے ایسے علم کا سوال کرتا ہوں جو نفع بخش ہو، پاکیزہ رزق اور قبول ہونے والا عمل ہو۔\n~ ابن ماجہ وغیرہ', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'دعاء للعلم', 'Dua for knowledge', 'İlim için dua', 'علم کے لیے دعا', '1709039936680', '1709061078', '2024-02-27 18:11:18', '2024-02-27 18:11:18'),
(5, '1709061189592', 'اللهم اغفر لي ذنبي كله دقه وجله أوله وأخره علانيته وسره', 'Allahumma ighfir li dhanbi kullahu diqqahu wa-jillahu wa-awwalahu wa-akhirahu wa-ʿalaniyatahu wa-sirrahu.', 'Allahümmeğfir li zenbi küllahu dikkahu ve cillahu ve evvelehu ve ahirahu ve `alaniyatehu ve sirrahu.', 'اللّٰہُمَّ اَفْرَ لَذَنَبِی کُلُّوْ دِیْقَہُ وَجَلَّهُ وَاَوْلَہُ وَآخرِہُوْ وَالْعَالَانِیْتُ وَ سَرِیْحُ۔', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'الدعاء لمغفرة جميع الذنوب', 'Dua for forgiveness of all sins', 'Bütün günahların bağışlanması için dua', 'تمام گناہوں کی معافی کی دعا', '1709039796141', '1709061189', '2024-02-27 18:13:09', '2024-02-27 18:13:09'),
(6, '1709061979544', 'الله يكفيني. لا إله إلا هو عليه توكلت وهو رب العرش العظيم. [كرر سبع مرات]\n~ أبو داود', 'Allah is enough for me. There is no true god but Him, in Him I put my trust, an He is the Lord of the Great Throne. [Repeat seven times]\n~ Abu Dawud', 'Allah bana yeter. O\'ndan başka gerçek ilah yoktur, O\'na tevekkül ettim ve O, Büyük Arş\'ın Rabbidir. [Yedi kez tekrarlayın]\n~ Ebu Davud', 'میرے لیے اللہ ہی کافی ہے۔ اس کے سوا کوئی معبود برحق نہیں، اسی پر میرا بھروسہ ہے، اور وہی عرش عظیم کا مالک ہے۔ [سات بار دہرائیں]\n~ ابوداؤد', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'دعاء يزيل الهم', 'Dua that removes anxiety', 'Kaygıyı ortadan kaldıran dua', 'پریشانی دور کرنے والی دعا', '1709039818736', '1709061979', '2024-02-27 18:26:19', '2024-02-27 18:26:19'),
(7, '1709062078595', 'ربنا لا تزغ قلوبنا بعد إذ هديتنا وهب لنا من لدنك رحمة إنك أنت الوهاب', 'Rabbana La tuzigh Qulubana ba`da idh hadaytana wa hab lana min ladunka rahmatan innaka anta al-Wahhab.', 'Rabbana La tuzigh Kulubana ba\'da iz hadaytana ve hab lena min ladunka rahmeten inneke ente el-Vahhab.', 'ربنا لا تجغ قلوبنا بعدا احد ہدایتنا و حب لنا من لدونکا رحمتن انکا انت الوہاب۔', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'دعاء للحفظ', 'Dua for preservation', 'Korunması için dua', 'حفاظت کی دعا', '1709039829693', '1709062078', '2024-02-27 18:27:58', '2024-02-27 18:27:58'),
(8, '1709062150125', 'بسم الله الذي لا يضر مع اسمه شيء في الأرض ولا في السماء وهو السميع العليم. [كرر ثلاث مرات]\n~ أبو داود والترمذي', 'In the Name of Allah, with Whose Name nothing is harmed on earth nor in heaven, and He is the All-Hearing, the All-Knowing. [Repeat three times]\n~ Abu Dawud and al-Tirmidhi', 'İsmiyle yerde ve gökte hiçbir şeye zarar verilmeyen Allah\'ın adıyla O, işitendir, bilendir. [Üç kez tekrarlayın]\n~ Ebu Davud ve el-Tirmizi', 'اللہ کے نام سے جس کے نام سے زمین وآسمان میں کوئی چیز نقصان نہیں پہنچتی اور وہ سب کچھ سننے والا اور جاننے والا ہے۔ [تین بار دہرائیں]\n~ ابوداؤد و ترمذی', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'الدعاء لتجنب الآلام المفاجئة', 'Dua to avoid sudden afflictions', 'Ani felaketlerden korunmak için dua', 'ناگہانی مصیبتوں سے بچنے کی دعا', '1709039842723', '1709062150', '2024-02-27 18:29:10', '2024-02-27 18:29:10'),
(9, '1709062221602', 'بسم الله توكلت على الله . ولا حول ولا قوة إلا بالله.\n~ أبو داود والترمذي والنسائي', 'In the Name of Allah, I place my trust in Allah. There is no might nor power except with Allah.\n~ Abu Dawud, al-Tirmidhi, and al-Nasa’i', 'Allah\'ın adıyla, Allah\'a tevekkül ediyorum. Allah\'tan başka güç ve kuvvet yoktur.\n~ Ebu Davud, el-Tirmizi ve el-Nesa\'i', 'اللہ کے نام سے، میں اللہ پر توکل کرتا ہوں۔ اللہ کے سوا کوئی طاقت اور طاقت نہیں ہے۔\n~ ابوداؤد، الترمذی، اور النسائی', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'دعاء التوجيه والحماية قبل الخروج من المنزل', 'Dua for guidance and protection before leaving the home', 'Evden çıkmadan önce rehberlik ve koruma için dua', 'گھر سے نکلنے سے پہلے ہدایت اور حفاظت کی دعا', '1709039855853', '1709062221', '2024-02-27 18:30:21', '2024-02-27 18:30:21'),
(10, '1709062285316', '‏اللهم رب الناس، أذهب البأس، واشف، أنت الشافي لا شفاء إلا شفاؤك، شفاء لا يغادر سقما', 'Allahumma Rabban-nasi, adhhibil-ba’sa, washfi, antash-Shafi, la shifa’a illa shifa’uka, shifaan la yughadiru saqaman.', 'Allahumme Rabban-nasi, ezhibil-ba\'sa, wasfi, antesh-Shafi, la shifa\'a illa shifa\'uka, shifaan la yughadiru sakaman.', 'اللّٰہُمَّا رَبِّنَ نَصِیْ، اَذَھِیْبِلِبَاسَ، واشفی، انتشافی، لا شفاء الا شیفاؤکا، شفاء لا یغدیرو سقمان۔', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'الدعاء للمرضى', 'Dua for the sick', 'Hastalar için dua', 'بیماروں کے لیے دعا', '1709039865639', '1709062285', '2024-02-27 18:31:25', '2024-02-27 18:31:25'),
(11, '1709062353411', 'يا الله! وهب لي العافية في جسدي. يا الله! وهب لي العافية في سمعي. يا الله! وهب لي العافية في عيني. لا إله حق إلا أنت.\n~ أبو داود', 'Oh Allah! Grant me well-being in my body. Oh Allah! Grant me well-being in my hearing. Oh Allah! Grant me well-being in my sight. There is no true God but You.\n~ Abu Dawud', 'Aman Allahım! Bana bedenimde afiyet ver. Aman Allahım! Kulağıma afiyet ver. Aman Allahım! Bana nezdimde afiyet ver. Senden başka gerçek Tanrı yoktur.\n~ Ebu Davud', 'اے اللہ! مجھے میرے جسم میں عافیت عطا فرما۔ اے اللہ! مجھے میری سماعت میں عافیت عطا فرما۔ اے اللہ! مجھے میری نظر میں عافیت عطا فرما۔ تیرے سوا کوئی حقیقی معبود نہیں۔\n~ ابوداؤد', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'دعاء لصحة الجسم', 'Dua for healthy body', 'Sağlıklı vücut için dua', 'صحت مند جسم کے لیے دعا', '1709039874889', '1709062353', '2024-02-27 18:32:33', '2024-02-27 18:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `dua_categories`
--

CREATE TABLE `dua_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `_id` varchar(255) NOT NULL,
  `categoryArabic` varchar(255) NOT NULL,
  `categoryEnglish` varchar(255) NOT NULL,
  `categoryTurkish` varchar(255) NOT NULL,
  `categoryUrdu` varchar(255) NOT NULL,
  `categoryBangla` varchar(255) NOT NULL,
  `categoryHindi` varchar(255) NOT NULL,
  `categoryFrench` varchar(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dua_categories`
--

INSERT INTO `dua_categories` (`id`, `_id`, `categoryArabic`, `categoryEnglish`, `categoryTurkish`, `categoryUrdu`, `categoryBangla`, `categoryHindi`, `categoryFrench`, `timestamp`, `created_at`, `updated_at`) VALUES
(5, '1709039796141', 'Dua for forgiveness of all sins', 'Dua for forgiveness of all sins', 'Dua for forgiveness of all sins', 'Dua for forgiveness of all sins', 'N/A', 'N/A', 'N/A', '1709039796', '2024-02-27 12:16:36', '2024-02-27 12:16:36'),
(6, '1709039818736', 'Dua that removes anxiety', 'Dua that removes anxiety', 'Dua that removes anxiety', 'Dua that removes anxiety', 'N/A', 'N/A', 'N/A', '1709039818', '2024-02-27 12:16:58', '2024-02-27 12:16:58'),
(7, '1709039829693', 'Dua for preservation', 'Dua for preservation', 'Dua for preservation', 'Dua for preservation', 'N/A', 'N/A', 'N/A', '1709039829', '2024-02-27 12:17:09', '2024-02-27 12:17:09'),
(8, '1709039842723', 'الدعاء لتجنب الآلام المفاجئة', 'Dua to avoid sudden afflictions', 'Ani felaketlerden korunmak için dua', 'ناگہانی مصیبتوں سے بچنے کی دعا', 'N/A', 'N/A', 'N/A', '1709039842', '2024-02-27 12:17:22', '2024-02-27 12:28:32'),
(9, '1709039855853', 'دعاء التوجيه والحماية قبل الخروج من المنزل', 'Dua for guidance and protection before leaving the home', 'Evden çıkmadan önce rehberlik ve koruma için dua', 'گھر سے نکلنے سے پہلے ہدایت اور حفاظت کی دعا', 'N/A', 'N/A', 'N/A', '1709039855', '2024-02-27 12:17:35', '2024-02-27 12:28:05'),
(10, '1709039865639', 'الدعاء للمرضى', 'Dua for the sick', 'Hastalar için dua', 'بیماروں کے لیے دعا', 'N/A', 'N/A', 'N/A', '1709039865', '2024-02-27 12:17:45', '2024-02-27 12:27:41'),
(11, '1709039874889', 'الدعاء لجسم سليم', 'Dua for a healthy body', 'Sağlıklı bir vücut için dua', 'صحت مند جسم کے لیے دعا', 'N/A', 'N/A', 'N/A', '1709039874', '2024-02-27 12:17:54', '2024-02-27 12:24:30'),
(12, '1709039885894', 'دعاء للفرج من الضيق والكسل والديون', 'Dua for relief from distress, laziness, debts', 'Sıkıntıdan, tembellikten, borçlardan kurtulmak için okunacak dua', 'مصیبت، سستی، قرض سے نجات کی دعا', 'N/A', 'N/A', 'N/A', '1709039885', '2024-02-27 12:18:05', '2024-02-27 12:25:01'),
(13, '1709039899290', 'دعاء للعائلة المباركة', 'Dua for blessed family', 'Kutsanmış aile için dua', 'مبارک خاندان کے لیے دعا', 'N/A', 'N/A', 'N/A', '1709039899', '2024-02-27 12:18:19', '2024-02-27 12:27:06'),
(14, '1709039912874', 'دعاء النجاح', 'Dua for success', 'Başarı için dua', 'کامیابی کی دعا', 'N/A', 'N/A', 'N/A', '1709039912', '2024-02-27 12:18:32', '2024-02-27 12:26:42'),
(15, '1709039926336', 'الدعاء للتقوى', ' Dua for taqwa', 'Takva için dua', 'تقویٰ کی دعا', 'N/A', 'N/A', 'N/A', '1709039926', '2024-02-27 12:18:46', '2024-02-27 12:26:18'),
(16, '1709039936680', 'دعاء للعلم', 'Dua for knowledge', 'İlim için dua', 'علم کے لیے دعا', 'N/A', 'N/A', 'N/A', '1709039936', '2024-02-27 12:18:56', '2024-02-27 12:25:46'),
(17, '1709039950471', '5 أدعية النبي محمد (ص)', '5 Duas of Prophet Muhammed (PBUH)', 'Hz.Muhammed (sav)\'in 5 Duası', 'حضرت محمد صلی اللہ علیہ وسلم کی 5 دعائیں', 'N/A', 'N/A', 'N/A', '1709039950', '2024-02-27 12:19:10', '2024-02-27 12:25:22');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `forget_passes`
--

CREATE TABLE `forget_passes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` int(11) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `isVerified` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hadiths`
--

CREATE TABLE `hadiths` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `_id` varchar(255) NOT NULL,
  `narratedBy` varchar(255) NOT NULL,
  `referenceBook` varchar(255) NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `hadithArabic` text NOT NULL,
  `hadithEnglish` text NOT NULL,
  `hadithTurkish` text NOT NULL,
  `hadithUrdu` text NOT NULL,
  `hadithBangla` text NOT NULL,
  `hadithHindi` text NOT NULL,
  `hadithFrench` text NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hadiths`
--

INSERT INTO `hadiths` (`id`, `_id`, `narratedBy`, `referenceBook`, `category_id`, `hadithArabic`, `hadithEnglish`, `hadithTurkish`, `hadithUrdu`, `hadithBangla`, `hadithHindi`, `hadithFrench`, `timestamp`, `created_at`, `updated_at`) VALUES
(1, '1709035061091', 'Updated', 'aaa', '1709035075832', 'sdsdsd fddf', 'dsdssda fddfs', 'dsadsa fddfs', 'dsadsads', 'N/A', 'N/A', 'N/A', '1709035061', '2024-02-27 10:57:41', '2024-02-27 10:58:01'),
(2, '1709037861644', 'Ibn Umar', 'Sahih al-Bukhari', '1709037668143', 'حَدَّثَنَا عُبَيْدُ اللَّهِ بْنُ مُوسَى، قَالَ أَخْبَرَنَا حَنْظَلَةُ بْنُ أَبِي سُفْيَانَ، عَنْ عِكْرِمَةَ بْنِ خَالِدٍ، عَنِ ابْنِ عُمَرَ ـ رضى الله عنهما ـ قَالَ قَالَ رَسُولُ اللَّهِ صلى الله عليه وسلم ‏ \"‏ بُنِيَ الإِسْلاَمُ عَلَى خَمْسٍ شَهَادَةِ أَنْ لاَ إِلَهَ إِلاَّ اللَّهُ وَأَنَّ مُحَمَّدًا رَسُولُ اللَّهِ، وَإِقَامِ الصَّلاَةِ، وَإِيتَاءِ الزَّكَاةِ، وَالْحَجِّ، وَصَوْمِ رَمَضَانَ ‏', 'Allah\'s Messenger (ﷺ) said: Islam is based on (the following) five (principles):\n\n1. To testify that none has the right to be worshipped but Allah and Muhammad is Allah\'s Messenger (ﷺ).\n\n2. To offer the (compulsory congregational) prayers dutifully and perfectly.\n\n3. To pay Zakat (i.e. obligatory charity) .\n\n4. To perform Hajj. (i.e. Pilgrimage to Mecca)\n\n5. To observe fast during the month of Ramadan.', 'Allah Resulü (s.a.v.) şöyle buyurdu: \"İslam beş temel prensip üzerine kurulmuştur:\n\n1. Allah\'tan başka ilah olmadığına ve Muhammed\'in Allah\'ın Resulü olduğuna şehadet etmek.\n\n2. Cemaatle kılınan namazları usulüne uygun ve kusursuz kılmak.\n\n3. Zekat vermek (yani farz olan sadaka).\n\n4. Hac yapmak. (bkz: Mekke\'ye Hac)\n\n5. Ramazan ayında oruç tutmak.', 'ہم سے عبیداللہ بن موسیٰ نے یہ حدیث بیان کی۔ انھوں نے کہا کہ ہمیں اس کی بابت حنظلہ بن ابی سفیان نے خبر دی۔ انھوں نے عکرمہ بن خالد سے روایت کی انھوں نے حضرت عبداللہ بن عمر رضی اللہ عنہما سے روایت کی کہ رسول اللہ صلی اللہ علیہ وسلم نے فرمایا اسلام کی بنیاد پانچ چیزوں پر قائم کی گئی ہے۔ اول گواہی دینا کہ اللہ کے سوا کوئی معبود نہیں اور بیشک حضرت محمد صلی اللہ علیہ وسلم اللہ کے سچے رسول ہیں اور نماز قائم کرنا اور زکوٰۃ ادا کرنا اور حج کرنا اور رمضان کے روزے رکھنا ۔', 'N/A', 'N/A', 'N/A', '1709037861', '2024-02-27 11:44:21', '2024-02-27 11:44:21'),
(3, '1709038908202', 'Abu Huraira', 'Sahih al-Bukhari', '1709038694838', 'حَدَّثَنَا مُحَمَّدُ بْنُ سِنَانٍ، قَالَ حَدَّثَنَا فُلَيْحٌ، ح وَحَدَّثَنِي إِبْرَاهِيمُ بْنُ الْمُنْذِرِ، قَالَ حَدَّثَنَا مُحَمَّدُ بْنُ فُلَيْحٍ، قَالَ حَدَّثَنِي أَبِي قَالَ، حَدَّثَنِي هِلاَلُ بْنُ عَلِيٍّ، عَنْ عَطَاءِ بْنِ يَسَارٍ، عَنْ أَبِي هُرَيْرَةَ، قَالَ بَيْنَمَا النَّبِيُّ صلى الله عليه وسلم فِي مَجْلِسٍ يُحَدِّثُ الْقَوْمَ جَاءَهُ أَعْرَابِيٌّ فَقَالَ مَتَى السَّاعَةُ فَمَضَى رَسُولُ اللَّهِ صلى الله عليه وسلم يُحَدِّثُ، فَقَالَ بَعْضُ الْقَوْمِ سَمِعَ مَا قَالَ، فَكَرِهَ مَا قَالَ، وَقَالَ بَعْضُهُمْ بَلْ لَمْ يَسْمَعْ، حَتَّى إِذَا قَضَى حَدِيثَهُ قَالَ ‏\"‏ أَيْنَ ـ أُرَاهُ ـ السَّائِلُ عَنِ السَّاعَةِ ‏\"‏‏.‏ قَالَ هَا أَنَا يَا رَسُولَ اللَّهِ‏.‏ قَالَ ‏\"‏ فَإِذَا ضُيِّعَتِ الأَمَانَةُ فَانْتَظِرِ السَّاعَةَ ‏\"‏‏.‏ قَالَ كَيْفَ إِضَاعَتُهَا قَالَ ‏\"‏ إِذَا وُسِّدَ الأَمْرُ إِلَى غَيْرِ أَهْلِهِ فَانْتَظِرِ السَّاعَةَ', 'While the Prophet (ﷺ) was saying something in a gathering, a Bedouin came and asked him, \"When would the Hour (Doomsday) take place?\" Allah\'s Messenger (ﷺ) continued his talk, so some people said that Allah\'s Messenger (ﷺ) had heard the question, but did not like what that Bedouin had asked. Some of them said that Allah\'s Messenger (ﷺ) had not heard it. When the Prophet (ﷺ) finished his speech, he said, \"Where is the questioner, who inquired about the Hour (Doomsday)?\" The Bedouin said, \"I am here, O Allah\'s Apostle .\" Then the Prophet (ﷺ) said, \"When honesty is lost, then wait for the Hour (Doomsday).\" The Bedouin said, \"How will that be lost?\" The Prophet (ﷺ) said, \"When the power or authority comes in the hands of unfit persons, then wait for the Hour (Doomsday.)\"', 'Bize Muhammed bin Sinan rivayet etti, bize Falih söyledi (ikinci rivayet zinciri) ve bana İbrahim bin El-Munzir rivayet etti, bana babam (Falih) dedi Hilal bin Ali dedi ki: Ata bin Yesar, Hazret-i Ebu Hureyre\'ye, Peygamber Efendimiz (sav)\'in bir zamanlar halkın arasında oturup onunla konuştuğunu söyledi. Bu sırada bir köylü yanınıza gelerek kıyamet ne zaman gelecek diye sormaya başladı. O (Allah\'ın selamı ve bereketi onun üzerine olsun) sohbetiyle meşguldü. Toplantıda bulunanlardan bir kısmı şöyle dedi: \"Sen (Allah\'ın selamı ve bereketi onun üzerine olsun) köylüyü dinledin ama hoşlanmadın, bazıları da: \"Hayır ama sen onu dinlemedin. Peygamber (s.a.v.) sözlerini bitirince, inanıyorum ki Peygamber Efendimiz (s.a.v.) şöyle buyurdu: Kıyamet gününü soran nereye gitti? Peygamber (Allah\'ın selamı ve selamı onun üzerine olsun), Amanet (dürüstlük) dünyadan kaldırıldığında Kıyamet Günü\'nü bekleyin dedi. Dürüstlüğün anlamı nedir dedi. Peygamber (s.a.v.) şöyle buyurmuştur: \"(Devlet işleri) değersiz kimselere emanet edildiği zaman, kıyamet gününü bekleyin.\"', 'ہم سے محمد بن سنان نے بیان کیا ، کہا ہم سے فلیح نے بیان کیا ( دوسری سند ) اور مجھ سے ابراہیم بن المنذر نے بیان کیا ، کہا مجھ سے میرے باپ ( فلیح ) نے بیان کیا ، کہا ہلال بن علی نے ، انھوں نے عطاء بن یسار سے نقل کیا ، انھوں نے حضرت ابوہریرہ رضی اللہ عنہ سے کہ ایک بار آنحضرت صلی اللہ علیہ وسلم لوگوں میں بیٹھے ہوئے ان سے باتیں کر رہے تھے ۔ اتنے میں ایک دیہاتی آپ کے پاس آیا اور پوچھنے لگا کہ قیامت کب آئے گی ؟ آپ صلی اللہ علیہ وسلم اپنی گفتگو میں مصروف رہے ۔ بعض لوگ ( جو مجلس میں تھے ) کہنے لگے آپ صلی اللہ علیہ وسلم نے دیہاتی کی بات سنی لیکن پسند نہیں کی اور بعض کہنے لگے کہ نہیں بلکہ آپ نے اس کی بات سنی ہی نہیں ۔ جب آپ صلی اللہ علیہ وسلم اپنی باتیں پوری کر چکے تو میں سمجھتا ہوں کہ آپ صلی اللہ علیہ وسلم نے یوں فرمایا وہ قیامت کے بارے میں پوچھنے والا کہاں گیا اس ( دیہاتی ) نے کہا ( حضور ) میں موجود ہوں ۔ آپ صلی اللہ علیہ وسلم نے فرمایا کہ جب امانت ( ایمانداری دنیا سے ) اٹھ جائے تو قیامت قائم ہونے کا انتظار کر ۔ اس نے کہا ایمانداری اٹھنے کا کیا مطلب ہے ؟ آپ صلی اللہ علیہ وسلم نے فرمایا کہ جب ( حکومت کے کاروبار ) نالائق لوگوں کو سونپ دئیے جائیں تو قیامت کا انتظار کر ۔', 'N/A', 'N/A', 'N/A', '1709038908', '2024-02-27 12:01:48', '2024-02-27 12:01:48'),
(4, '1709038997379', 'Umar bin Al-Khattab', 'Sahih al-Bukhari', '1709038633300', 'حَدَّثَنَا الْحُمَيْدِيُّ عَبْدُ اللَّهِ بْنُ الزُّبَيْرِ ، قَالَ : حَدَّثَنَا سُفْيَانُ ، قَالَ : حَدَّثَنَا يَحْيَى بْنُ سَعِيدٍ الْأَنْصَارِيُّ ، قَالَ : أَخْبَرَنِي مُحَمَّدُ بْنُ إِبْرَاهِيمَ التَّيْمِيُّ ، أَنَّهُ سَمِعَ عَلْقَمَةَ بْنَ وَقَّاصٍ اللَّيْثِيَّ ، يَقُولُ : سَمِعْتُ عُمَرَ بْنَ الْخَطَّابِ رَضِيَ اللَّهُ عَنْهُ عَلَى الْمِنْبَرِ، قَالَ : سَمِعْتُ رَسُولَ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ، يَقُولُ : \" إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ، وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى، فَمَنْ كَانَتْ هِجْرَتُهُ إِلَى دُنْيَا يُصِيبُهَا أَوْ إِلَى امْرَأَةٍ يَنْكِحُهَا، فَهِجْرَتُهُ إِلَى مَا هَاجَرَ إِلَيْهِ', 'I heard Allah\'s Messenger (ﷺ) saying, \"The reward of deeds depends upon the intentions and every person will get the reward according to what he has intended. So whoever emigrated for worldly benefits or for a woman to marry, his emigration was for what he emigrated for.\"', 'Allah Resulü\'nün (ﷺ) şöyle buyurduğunu işittim: \"Amellerin sevabı niyetlere bağlıdır ve her insan niyet ettiğine göre sevap alır. Kim dünya menfaati için veya evleneceği bir kadın için hicret ederse, onun hicreti ne için olmuştur.\" için göç etti.\"', 'ہم کو حمیدی نے یہ حدیث بیان کی ، انھوں نے کہا کہ ہم کو سفیان نے یہ حدیث بیان کی ، وہ کہتے ہیں ہم کو یحییٰ بن سعید انصاری نے یہ حدیث بیان کی ، انھوں نے کہا کہ مجھے یہ حدیث محمد بن ابراہیم تیمی سے حاصل ہوئی ۔ انھوں نے اس حدیث کو علقمہ بن وقاص لیثی سے سنا ، ان کا بیان ہے کہ میں نے مسجدنبوی میں منبر رسول صلی اللہ علیہ وسلم پر حضرت عمر بن خطاب رضی اللہ عنہ کی زبان سے سنا ، وہ فرما رہے تھے کہ میں نے جناب رسول اللہ صلی اللہ علیہ وسلم سے سنا آپ صلی اللہ علیہ وسلم فرما رہے تھے کہ تمام اعمال کا دارومدار نیت پر ہے اور ہر عمل کا نتیجہ ہر انسان کو اس کی نیت کے مطابق ہی ملے گا ۔ پس جس کی ہجرت ( ترک وطن ) دولت دنیا حاصل کرنے کے لیے ہو یا کسی عورت سے شادی کی غرض ہو ۔ پس اس کی ہجرت ان ہی چیزوں کے لیے ہو گی جن کے حاصل کرنے کی نیت سے اس نے ہجرت کی ہے ۔', 'N/A', 'N/A', 'N/A', '1709038997', '2024-02-27 12:03:17', '2024-02-27 12:03:17'),
(5, '1709039176167', 'Abu Dhar', 'Sahih al-Bukhari', '1709039086589', 'حَدَّثَنَا يَحْيَى بْنُ بُكَيْرٍ، قَالَ حَدَّثَنَا اللَّيْثُ، عَنْ يُونُسَ، عَنِ ابْنِ شِهَابٍ، عَنْ أَنَسِ بْنِ مَالِكٍ، قَالَ كَانَ أَبُو ذَرٍّ يُحَدِّثُ أَنَّ رَسُولَ اللَّهِ صلى الله عليه وسلم قَالَ ‏\"‏ فُرِجَ عَنْ سَقْفِ بَيْتِي وَأَنَا بِمَكَّةَ، فَنَزَلَ جِبْرِيلُ فَفَرَجَ صَدْرِي، ثُمَّ غَسَلَهُ بِمَاءِ زَمْزَمَ، ثُمَّ جَاءَ بِطَسْتٍ مِنْ ذَهَبٍ مُمْتَلِئٍ حِكْمَةً وَإِيمَانًا، فَأَفْرَغَهُ فِي صَدْرِي ثُمَّ أَطْبَقَهُ، ثُمَّ أَخَذَ بِيَدِي فَعَرَجَ بِي إِلَى السَّمَاءِ الدُّنْيَا، فَلَمَّا جِئْتُ إِلَى السَّمَاءِ الدُّنْيَا قَالَ جِبْرِيلُ لِخَازِنِ السَّمَاءِ افْتَحْ‏.‏ قَالَ مَنْ هَذَا قَالَ هَذَا جِبْرِيلُ‏.‏ قَالَ هَلْ مَعَكَ أَحَدٌ قَالَ نَعَمْ مَعِي مُحَمَّدٌ صلى الله عليه وسلم‏.‏ فَقَالَ أُرْسِلَ إِلَيْهِ قَالَ نَعَمْ‏.‏ فَلَمَّا فَتَحَ عَلَوْنَا السَّمَاءَ الدُّنْيَا، فَإِذَا رَجُلٌ قَاعِدٌ عَلَى يَمِينِهِ أَسْوِدَةٌ وَعَلَى يَسَارِهِ أَسْوِدَةٌ، إِذَا نَظَرَ قِبَلَ يَمِينِهِ ضَحِكَ، وَإِذَا نَظَرَ قِبَلَ يَسَارِهِ بَكَى، فَقَالَ مَرْحَبًا بِالنَّبِيِّ الصَّالِحِ وَالاِبْنِ الصَّالِحِ‏.‏ قُلْتُ لِجِبْرِيلَ مَنْ هَذَا قَالَ هَذَا آدَمُ‏.‏ وَهَذِهِ الأَسْوِدَةُ عَنْ يَمِينِهِ وَشِمَالِهِ نَسَمُ بَنِيهِ، فَأَهْلُ الْيَمِينِ مِنْهُمْ أَهْلُ الْجَنَّةِ، وَالأَسْوِدَةُ الَّتِي عَنْ شِمَالِهِ أَهْلُ النَّارِ، فَإِذَا نَظَرَ عَنْ يَمِينِهِ ضَحِكَ، وَإِذَا نَظَرَ قِبَلَ شِمَالِهِ بَكَى، حَتَّى عَرَجَ بِي إِلَى السَّمَاءِ الثَّانِيَةِ فَقَالَ لِخَازِنِهَا افْتَحْ‏.‏ فَقَالَ لَهُ خَازِنُهَا مِثْلَ مَا قَالَ الأَوَّلُ فَفَتَحَ ‏\"‏‏.‏ قَالَ أَنَسٌ فَذَكَرَ أَنَّهُ وَجَدَ فِي السَّمَوَاتِ آدَمَ وَإِدْرِيسَ وَمُوسَى وَعِيسَى وَإِبْرَاهِيمَ ـ صَلَوَاتُ اللَّهِ عَلَيْهِمْ ـ وَلَمْ يُثْبِتْ كَيْفَ مَنَازِلُهُمْ، غَيْرَ أَنَّهُ ذَكَرَ أَنَّهُ وَجَدَ آدَمَ فِي السَّمَاءِ الدُّنْيَا، وَإِبْرَاهِيمَ فِي السَّمَاءِ السَّادِسَةِ‏.‏ قَالَ أَنَسٌ فَلَمَّا مَرَّ جِبْرِيلُ بِالنَّبِيِّ صلى الله عليه وسلم بِإِدْرِيسَ قَالَ مَرْحَبًا بِالنَّبِيِّ الصَّالِحِ وَالأَخِ الصَّالِحِ‏.‏ فَقُلْتُ مَنْ هَذَا قَالَ هَذَا إِدْرِيسُ‏.‏ ثُمَّ مَرَرْتُ بِمُوسَى فَقَالَ مَرْحَبًا بِالنَّبِيِّ الصَّالِحِ وَالأَخِ الصَّالِحِ‏.‏ قُلْتُ مَنْ هَذَا قَالَ هَذَا مُوسَى‏.‏ ثُمَّ مَرَرْتُ بِعِيسَى فَقَالَ مَرْحَبًا بِالأَخِ الصَّالِحِ وَالنَّبِيِّ الصَّالِحِ‏.‏ قُلْتُ مَنْ هَذَا قَالَ هَذَا عِيسَى‏.‏ ثُمَّ مَرَرْتُ بِإِبْرَاهِيمَ فَقَالَ مَرْحَبًا بِالنَّبِيِّ الصَّالِحِ وَالاِبْنِ الصَّالِحِ‏.‏ قُلْتُ مَنْ هَذَا قَالَ هَذَا إِبْرَاهِيمُ صلى الله عليه وسلم ‏\"‏‏.‏ قَالَ ابْنُ شِهَابٍ فَأَخْبَرَنِي ابْنُ حَزْمٍ أَنَّ ابْنَ عَبَّاسٍ وَأَبَا حَبَّةَ الأَنْصَارِيَّ كَانَا يَقُولاَنِ قَالَ النَّبِيُّ صلى الله عليه وسلم ‏\"‏ ثُمَّ عُرِجَ بِي حَتَّى ظَهَرْتُ لِمُسْتَوًى أَسْمَعُ فِيهِ صَرِيفَ الأَقْلاَمِ ‏\"‏‏.‏ قَالَ ابْنُ حَزْمٍ وَأَنَسُ بْنُ مَالِكٍ قَالَ النَّبِيُّ صلى الله عليه وسلم ‏\"‏ فَفَرَضَ اللَّهُ عَلَى أُمَّتِي خَمْسِينَ صَلاَةً، فَرَجَعْتُ بِذَلِكَ حَتَّى مَرَرْتُ عَلَى مُوسَى فَقَالَ مَا فَرَضَ اللَّهُ لَكَ عَلَى أُمَّتِكَ قُلْتُ فَرَضَ خَمْسِينَ صَلاَةً‏.‏ قَالَ فَارْجِعْ إِلَى رَبِّكَ، فَإِنَّ أُمَّتَكَ لاَ تُطِيقُ ذَلِكَ‏.‏ فَرَاجَعْتُ فَوَضَعَ شَطْرَهَا، فَرَجَعْتُ إِلَى مُوسَى قُلْتُ وَضَعَ شَطْرَهَا‏.‏ فَقَالَ رَاجِعْ رَبَّكَ، فَإِنَّ أُمَّتَكَ لاَ تُطِيقُ، فَرَاجَعْتُ فَوَضَعَ شَطْرَهَا، فَرَجَعْتُ إِلَيْهِ فَقَالَ ارْجِعْ إِلَى رَبِّكَ، فَإِنَّ أُمَّتَكَ لاَ تُطِيقُ ذَلِكَ، فَرَاجَعْتُهُ‏.‏ فَقَالَ هِيَ خَمْسٌ وَهْىَ خَمْسُونَ، لاَ يُبَدَّلُ الْقَوْلُ لَدَىَّ‏.‏ فَرَجَعْتُ إِلَى مُوسَى فَقَالَ رَاجِعْ رَبَّكَ‏.‏ فَقُلْتُ اسْتَحْيَيْتُ مِنْ رَبِّي‏.‏ ثُمَّ انْطَلَقَ بِي حَتَّى انْتَهَى بِي إِلَى سِدْرَةِ الْمُنْتَهَى، وَغَشِيَهَا أَلْوَانٌ لاَ أَدْرِي مَا هِيَ، ثُمَّ أُدْخِلْتُ الْجَنَّةَ، فَإِذَا فِيهَا حَبَايِلُ اللُّؤْلُؤِ، وَإِذَا تُرَابُهَا الْمِسْكُ ‏\"‏‏', 'Allah\'s Messenger (ﷺ) said, \"While I was at Mecca the roof of my house was opened and Gabriel descended, opened my chest, and washed it with Zamzam water. Then he brought a golden tray full of wisdom and faith and having poured its contents into my chest, he closed it. Then he took my hand and ascended with me to the nearest heaven, when I reached the nearest heaven, Gabriel said to the gatekeeper of the heaven, \'Open (the gate).\' The gatekeeper asked, \'Who is it?\' Gabriel answered: \'Gabriel.\' He asked, \'Is there anyone with you?\' Gabriel replied, \'Yes, Muhammad I is with me.\' He asked, \'Has he been called?\' Gabriel said, \'Yes.\' So the gate was opened and we went over the nearest heaven and there we saw a man sitting with some people on his right and some on his left. When he looked towards his right, he laughed and when he looked toward his left he wept. Then he said, \'Welcome! O pious Prophet and pious son.\' I asked Gabriel, \'Who is he?\' He replied, \'He is Adam and the people on his right and left are the souls of his offspring. Those on his right are the people of Paradise and those on his left are the people of Hell and when he looks towards his right he laughs and when he looks towards his left he weeps.\' Then he ascended with me till he reached the second heaven and he (Gabriel) said to its gatekeeper, \'Open (the gate).\' The gatekeeper said to him the same as the gatekeeper of the first heaven had said and he opened the gate. Anas said: \"Abu Dhar added that the Prophet (ﷺ) met Adam, Idris, Moses, Jesus and Abraham, he (Abu Dhar) did not mention on which heaven they were but he mentioned that he (the Prophet (ﷺ) ) met Adam on the nearest heaven and Abraham on the sixth heaven. Anas said, \"When Gabriel along with the Prophet (ﷺ) passed by Idris, the latter said, \'Welcome! O pious Prophet and pious brother.\' The Prophet (ﷺ) asked, \'Who is he?\' Gabriel replied, \'He is Idris.\" The Prophet (ﷺ) added, \"I passed by Moses and he said, \'Welcome! O pious Prophet and pious brother.\' I asked Gabriel, \'Who is he?\' Gabriel replied, \'He is Moses.\' Then I passed by Jesus and he said, \'Welcome! O pious brother and pious Prophet.\' I asked, \'Who is he?\' Gabriel replied, \'He is Jesus. Then I passed by Abraham and he said, \'Welcome! O pious Prophet and pious son.\' I asked Gabriel, \'Who is he?\' Gabriel replied, \'He is Abraham. The Prophet (ﷺ) added, \'Then Gabriel ascended with me to a place where I heard the creaking of the pens.\" Ibn Hazm and Anas bin Malik said: The Prophet (ﷺ) said, \"Then Allah enjoined fifty prayers on my followers when I returned with this order of Allah, I passed by Moses who asked me, \'What has Allah enjoined on your followers?\' I replied, \'He has enjoined fifty prayers on them.\' Moses said, \'Go back to your Lord (and appeal for reduction) for your followers will not be able to bear it.\' (So I went back to Allah and requested for reduction) and He reduced it to half. When I passed by Moses again and informed him about it, he said, \'Go back to your Lord as your followers will not be able to bear it.\' So I returned to Allah and requested for further reduction and half of it was reduced. I again passed by Moses and he said to me: \'Return to your Lord, for your followers will not be able to bear it. So I returned to Allah and He said, \'These are five prayers and they are all (equal to) fifty (in reward) for My Word does not change.\' I returned to Moses and he told me to go back once again. I replied, \'Now I feel shy of asking my Lord again.\' Then Gabriel took me till we \'\' reached Sidrat-il-Muntaha (Lote tree of; the utmost boundary) which was shrouded in colors, indescribable. Then I was admitted into Paradise where I found small (tents or) walls (made) of pearls and its earth was of musk.\"', 'Yahya bin Bükayr bize rivayet etti, dedi, Leys bize Yunus\'tan, İbn Şihab\'tan, Enes bin Malik\'ten rivayet etti, dedi ki, Ebu Zer, Rasûlullah\'ın şöyle rivayet ettiğini söyledi: Allah\'ın salat ve selamı onun üzerine olsun, şöyle dedi: \"Ben Mekke\'de iken evimin damı açıldı, bunun üzerine Cebrail aşağı indi ve göğsümü serbest bıraktı, sonra onu Zemzem suyuyla yıkadı, sonra içi dolu altın bir leğen getirdi. Hikmet ve imanı göğsüme boşalttı, sonra kapattı, sonra elimden tutup beni en alt göğe götürdü.En alt göğe geldiğimde Cebrail, göklerin hazinedarına \"Aç\" dedi. \"Bu kim?\" dedi Cebrail, \"Bu.\" dedi. \"Yanında kimse var mı?\" dedi. \"Evet, Muhammed benimle beraberdir, Allah\'ın salat ve selamı onun üzerine olsun\" dedi. \"Ona gönderildi.\" \"Evet\" dedi. Üstümüzde en alt gök açıldığında sağında bir adam oturuyordu. Solunda aslanlar ve aslanlar. Sağına baktığında gülüyordu. soluna baktı, ağladı. Sonra dedi ki: Hoş geldin salih peygamber ve salih oğul. Cebrail\'e dedim ki: Bu kimdir? Bu Adem\'dir. Sağında ve solundaki şu aslanlar. Çocuklarına isim ver. Sağındakiler cennet ehli, solundaki aslanlar da cehennemliktir.Sağına baktığında güler, baktığında kabul eder.Sol eline gelinceye kadar ağlar. beni ikinci semaya çıkardı ve onun hazinedarına \"Aç\" dedi. Sonra hazinedar ona birincisinin dediği gibi dedi ve o da açtı. O, Adem\'i, İdris\'i, Musa\'yı, İsa\'yı ve İbrahim\'i cennette bulduğunu yalanladı. -Allah\'ın duası üzerlerine olsun- ve evlerinin mahiyetini teyit etmedi. Ancak Adem\'i en alt semada, İbrahim\'i ise altıncı semada bulduğunu belirtti. Enes şöyle dedi: Cebrail Peygamber\'in yanından geçerken, İdris şöyle dedi: \"Salih peygambere ve salih kardeşe hoş geldin.\" Ben de \"Bu kimdir?\" dedim. \"Bu İdris\'tir\" dedi. Sonra Musa\'nın yanından geçtim. \"Hoş geldin\" dedi. Salih peygamber ve salih kardeşe dedim ki: \"Kim bu?\" Musa dedi. Sonra İsa\'nın yanından geçtim ve o dedi ki: \"Salih kardeş ve salih peygambere hoş geldin.\" Ben de \"Bu kim?\" İsa şöyle dedi: \"Sonra İbrahim\'in yanından geçtim ve \'Salih peygamber ve salih oğula hoş geldin\' dedi.\" \"Bu kimdir?\" dedim. \"Bu İbrahim\'dir, Tanrı onu kutsasın ve ona bağışlasın\" dedi. İbn Şihab dedi ki: \"İbn Hazm bana İbn Abbas ve Ebu Habbah el-Ensari\'nin olduğunu söyledi. Onlar Peygamber (s.a.v.)\'in şöyle dediğini mi söylüyorlar: \"Sonra ben görününceye kadar beni kaldırdı. kalemlerin gıcırtısını duyabileceğim bir seviyede.” İbn Hazm ve Enes bin Malik şöyle dediler: Peygamber sallallahu aleyhi ve sellem şöyle buyurdu: “Allah, ümmetime elli vakit namazı farz kıldı, ben de ona geri döndüm. Musa\'nın yanından geçtim ve o şöyle dedi: \"Allah\'ın ümmetinize farz kıldığı şeyi, elli vakit namazdır\" dedim. \"Öyleyse dönün\" dedi. Rabbine, çünkü senin ümmetin buna dayanamaz. Ümmetin için Rabbine döndüm, buna dayanılmaz, geri döndüm, yarısını bıraktım, sonra ona döndüm ve o şöyle dedi: Rabbine dön, çünkü senin ümmetin buna dayanamaz. Ben de gittim. O da ona döndü ve şöyle dedi: \"Beş oldu, o da elli. Sözüm değiştirilemez. Bunun üzerine Musa\'ya döndüm, o da: \'Rabbinize dönün\' dedi. Ben de \'Ben\' dedim. Rabbimin önünde utandım.\" dedi ve Sidretü\'l-Münteha\'ya varıncaya kadar benimle devam etti, orası ne olduğunu bilmediğim renklerle kaplanmıştı. Sonra cennete girdim ve işte oradaydım. dizi incilerle kaplıydı ve işte toprağı miskle kaplıydı.”', 'ہم سے یحییٰ بن بکیر نے بیان کیا ، انھوں نے کہا ہم سے لیث بن سعد نے یونس کے واسطہ سے بیان کیا ، انھوں نے ابن شہاب سے ، انھوں نے انس بن مالک سے ، انھوں نے فرمایا کہ ابوذر غفاری رضی اللہ عنہ یہ حدیث بیان کرتے تھے کہ آنحضرت صلی اللہ علیہ وسلم نے فرمایا کہ میرے گھر کی چھت کھول دی گئی ، اس وقت میں مکہ میں تھا ۔ پھر جبرائیل علیہ السلام اترے اور انھوں نے میرا سینہ چاک کیا ۔ پھر اسے زمزم کے پانی سے دھویا ۔ پھر ایک سونے کا طشت لائے جو حکمت اور ایمان سے بھرا ہوا تھا ۔ اس کو میرے سینے میں رکھ دیا ، پھر سینے کو جوڑ دیا ، پھر میرا ہاتھ پکڑا اور مجھے آسمان کی طرف لے کر چلے ۔ جب میں پہلے آسمان پر پہنچا تو جبرائیل علیہ السلام نے آسمان کے داروغہ سے کہا کھولو ۔ اس نے پوچھا ، آپ کون ہیں ؟ جواب دیا کہ جبرائیل ، پھر انھوں نے پوچھا کیا آپ کے ساتھ کوئی اور بھی ہے ؟ جواب دیا ، ہاں میرے ساتھ محمد ( صلی اللہ علیہ وسلم ) ہیں ۔ انھوں نے پوچھا کہ کیا ان کے بلانے کے لیے آپ کو بھیجا گیا تھا ؟ کہا ، جی ہاں ! پھر جب انھوں نے دروازہ کھولا تو ہم پہلے آسمان پر چڑھ گئے ، وہاں ہم نے ایک شخص کو بیٹھے ہوئے دیکھا ۔ ان کے داہنی طرف کچھ لوگوں کے جھنڈ تھے اور کچھ جھنڈ بائیں طرف تھے ۔ جب وہ اپنی داہنی طرف دیکھتے تو مسکرا دیتے اور جب بائیں طرف نظر کرتے تو روتے ۔ انھوں نے مجھے دیکھ کر فرمایا ، آؤ اچھے آئے ہو ۔ صالح نبی اور صالح بیٹے ! میں نے جبرائیل علیہ السلام سے پوچھا یہ کون ہیں ؟ انھوں نے کہا کہ یہ آدم علیہ السلام ہیں اور ان کے دائیں بائیں جو جھنڈ ہیں یہ ان کے بیٹوں کی روحیں ہیں ۔ جو جھنڈ دائیں طرف ہیں وہ جنتی ہیں اور بائیں طرف کے جھنڈ دوزخی روحیں ہیں ۔ اس لیے جب وہ اپنے دائیں طرف دیکھتے ہیں تو خوشی سے مسکراتے ہیں اور جب بائیں طرف دیکھتے ہیں تو ( رنج سے ) روتے ہیں ۔ پھر جبرائیل مجھے لے کر دوسرے آسمان تک پہنچے اور اس کے داروغہ سے کہا کہ کھولو ۔ اس آسمان کے داروغہ نے بھی پہلے کی طرح پوچھا پھر کھول دیا ۔ حضرت انس نے کہا کہ ابوذر نے ذکر کیا کہ آپ صلی اللہ علیہ وسلم یعنی نبی کریم صلی اللہ علیہ وسلم نے آسمان پر آدم ، ادریس ، موسیٰ ، عیسیٰ اور ابراہیم علیہم السلام کو موجود پایا ۔ اور ابوذر رضی اللہ عنہ نے ہر ایک کا ٹھکانہ نہیں بیان کیا ۔ البتہ اتنا بیان کیا کہ آنحضور صلی اللہ علیہ وسلم نے حضرت آدم کو پہلے آسمان پر پایا اور حضرت ابراہیم علیہ السلام کو چھٹے آسمان پر ۔ انس نے بیان کیا کہ جب جبرائیل علیہ السلام نبی کریم صلی اللہ علیہ وسلم کے ساتھ ادریس علیہ السلام پر گزرے ۔ تو انھوں نے فرمایا کہ آؤ اچھے آئے ہو صالح نبی اور صالح بھائی ۔ میں نے پوچھا یہ کون ہیں ؟ جواب دیا کہ یہ ادریس علیہ السلام ہیں ۔ پھر موسیٰ علیہ السلام تک پہنچا تو انھوں نے فرمایا آؤ اچھے آئے ہو صالح نبی اور صالح بھائی ۔ میں نے پوچھا یہ کون ہیں ؟ جبرائیل علیہ السلام نے بتایا کہ موسیٰ علیہ السلام ہیں ۔ پھر میں عیسیٰ علیہ السلام تک پہنچا ، انھوں نے کہا آؤ اچھے آئے ہو صالح نبی اور صالح بھائی ۔ میں نے پوچھا یہ کون ہیں ؟ جبرائیل علیہ السلام نے بتایا کہ یہ عیسیٰ علیہ السلام ہیں ۔ پھر میں ابراہیم علیہ السلام تک پہنچا ۔ انھوں نے فرمایا آؤ اچھے آئے ہو صالح نبی اور صالح بیٹے ۔ میں نے پوچھا یہ کون ہیں ؟ جبرائیل علیہ السلام نے بتایا کہ یہ حضرت ابراہیم علیہ السلام ہیں ۔ ابن شہاب نے کہا کہ مجھے ابوبکر بن حزم نے خبر دی کہ عبداللہ بن عباس اور ابوحبۃ الانصاری رضی اللہ عنہم کہا کرتے تھے کہ نبی کریم صلی اللہ علیہ وسلم نے فرمایا ، پھر مجھے جبرائیل علیہ السلام لے کر چڑھے ، اب میں اس بلند مقام تک پہنچ گیا جہاں میں نے قلم کی آواز سنی ( جو لکھنے والے فرشتوں کی قلموں کی آواز تھی ) ابن حزم نے ( اپنے شیخ سے ) اور انس بن مالک نے ابوذر رضی اللہ عنہ سے نقل کیا کہ نبی کریم صلی اللہ علیہ وسلم نے فرمایا ۔ پس اللہ تعالیٰ نے میری امت پر پچاس وقت کی نمازیں فرض کیں ۔ میں یہ حکم لے کر واپس لوٹا ۔ جب موسیٰ علیہ السلام تک پہنچا تو انھوں نے پوچھا کہ آپ کی امت پر اللہ نے کیا فرض کیا ہے ؟ میں نے کہا کہ پچاس وقت کی نمازیں فرض کی ہیں ۔ انھوں نے فرمایا آپ واپس اپنے رب کی بارگاہ میں جائیے ۔ کیونکہ آپ کی امت اتنی نمازوں کو ادا کرنے کی طاقت نہیں رکھتی ہے ۔ میں واپس بارگاہ رب العزت میں گیا تو اللہ نے اس میں سے ایک حصہ کم کر دیا ، پھر موسیٰ علیہ السلام کے پاس آیا اور کہا کہ ایک حصہ کم کر دیا گیا ہے ، انھوں نے کہا کہ دوبارہ جائیے کیونکہ آپ کی امت میں اس کے برداشت کی بھی طاقت نہیں ہے ۔ پھر میں بارگاہ رب العزت میں حاضر ہوا ۔ پھر ایک حصہ کم ہوا ۔ جب موسیٰ علیہ السلام کے پاس پہنچا تو انھوں نے فرمایا کہ اپنے رب کی بارگاہ میں پھر جائیے ، کیونکہ آپ کی امت اس کو بھی برداشت نہ کر سکے گی ، پھر میں باربار آیا گیا پس اللہ تعالیٰ نے فرمایا کہ یہ نمازیں ( عمل میں ) پانچ ہیں اور ( ثواب میں ) پچاس ( کے برابر ) ہیں ۔ میری بات بدلی نہیں جاتی ۔ اب میں موسیٰ علیہ السلام کے پاس آیا تو انھوں نے پھر کہا کہ اپنے رب کے پاس جائیے ۔ لیکن میں نے کہا مجھے اب اپنے رب سے شرم آتی ہے ۔ پھر جبرائیل مجھے سدرۃالمنتہیٰ تک لے گئے جسے کئی طرح کے رنگوں نے ڈھانک رکھا تھا ۔ جن کے متعلق مجھے معلوم نہیں ہوا کہ وہ کیا ہیں ۔ اس کے بعد مجھے جنت میں لے جایا گیا ، میں نے دیکھا کہ اس میں موتیوں کے ہار ہیں اور اس کی مٹی مشک کی ہے ۔', 'N/A', 'N/A', 'N/A', '1709039176', '2024-02-27 12:06:16', '2024-02-27 12:06:16'),
(6, '1709039464637', 'Aisha', 'Sahih al-Bukhari', '1709039086589', 'حَدَّثَنَا عَبْدُ اللَّهِ بْنُ يُوسُفَ، قَالَ أَخْبَرَنَا مَالِكٌ، عَنْ صَالِحِ بْنِ كَيْسَانَ، عَنْ عُرْوَةَ بْنِ الزُّبَيْرِ، عَنْ عَائِشَةَ أُمِّ الْمُؤْمِنِينَ، قَالَتْ ‏ \"‏ فَرَضَ اللَّهُ الصَّلاَةَ حِينَ فَرَضَهَا رَكْعَتَيْنِ رَكْعَتَيْنِ فِي الْحَضَرِ وَالسَّفَرِ، فَأُقِرَّتْ صَلاَةُ السَّفَرِ، وَزِيدَ فِي صَلاَةِ الْحَضَرِ ‏\"', 'the mother of believers: Allah enjoined the prayer when He enjoined it, it was two rak`at only (in every prayer) both when in residence or on journey. Then the prayers offered on journey remained the same, but (the rak`at of) the prayers for non-travelers were increased.', 'Abdullah bin Yusuf bize Malik\'in, Salih bin Kaysan\'dan, Urve bin Zübeyr\'den, mü\'minlerin annesi Aişe\'den rivayetle şöyle dediğini söyledi: Allah, Namazı iki rek\'at, yaşamak ve yolculuk için iki rek\'at kılınca yolculuk namazı kılındı ​​ve şehir namazına bir ilave daha yapıldı.\"', 'ہم سے عبداللہ بن یوسف تنیسی نے بیان کیا ، انھوں نے کہا ہمیں خبر دی امام مالک نے صالح بن کیسان سے ، انھوں نے عروہ بن زبیر سے ، انھوں نے ام المؤمنین حضرت عائشہ رضی اللہ عنہا سے ، آپ نے فرمایا کہ اللہ تعالیٰ نے پہلے نماز میں دو دو رکعت فرض کی تھی ۔ سفر میں بھی اور اقامت کی حالت میں بھی ۔ پھر سفر کی نماز تو اپنی اصلی حالت پر باقی رکھی گئی اور حالت اقامت کی نمازوں میں زیادتی کر دی گئی ۔', 'N/A', 'N/A', 'N/A', '1709039464', '2024-02-27 12:11:04', '2024-02-27 12:11:04'),
(7, '1709039662124', 'Ibn Shihab', 'Sahih al-Bukhari', '1709039240179', 'حَدَّثَنَا عَبْدُ اللَّهِ بْنُ مَسْلَمَةَ، قَالَ قَرَأْتُ عَلَى مَالِكٍ عَنِ ابْنِ شِهَابٍ، أَنَّ عُمَرَ بْنَ عَبْدِ الْعَزِيزِ، أَخَّرَ الصَّلاَةَ يَوْمًا، فَدَخَلَ عَلَيْهِ عُرْوَةُ بْنُ الزُّبَيْرِ، فَأَخْبَرَهُ أَنَّ الْمُغِيرَةَ بْنَ شُعْبَةَ أَخَّرَ الصَّلاَةَ يَوْمًا وَهْوَ بِالْعِرَاقِ، فَدَخَلَ عَلَيْهِ أَبُو مَسْعُودٍ الأَنْصَارِيُّ فَقَالَ مَا هَذَا يَا مُغِيرَةُ أَلَيْسَ قَدْ عَلِمْتَ أَنَّ جِبْرِيلَ نَزَلَ فَصَلَّى، فَصَلَّى رَسُولُ اللَّهِ صلى الله عليه وسلم ثُمَّ صَلَّى فَصَلَّى رَسُولُ اللَّهِ صلى الله عليه وسلم ثُمَّ صَلَّى فَصَلَّى رَسُولُ اللَّهِ صلى الله عليه وسلم ثُمَّ صَلَّى فَصَلَّى رَسُولُ اللَّهِ صلى الله عليه وسلم ثُمَّ صَلَّى فَصَلَّى رَسُولُ اللَّهِ صلى الله عليه وسلم ثُمَّ قَالَ ‏ \"‏ بِهَذَا أُمِرْتُ ‏\"‏‏.‏ فَقَالَ عُمَرُ لِعُرْوَةَ اعْلَمْ مَا تُحَدِّثُ أَوَإِنَّ جِبْرِيلَ هُوَ أَقَامَ لِرَسُولِ اللَّهِ صلى الله عليه وسلم وَقْتَ الصَّلاَةِ‏.‏ قَالَ عُرْوَةُ كَذَلِكَ كَانَ بَشِيرُ بْنُ أَبِي مَسْعُودٍ يُحَدِّثُ عَنْ أَبِيهِ‏.‏ قَالَ عُرْوَةُ وَلَقَدْ حَدَّثَتْنِي عَائِشَةُ، أَنَّ رَسُولَ اللَّهِ صلى الله عليه وسلم كَانَ يُصَلِّي الْعَصْرَ، وَالشَّمْسُ فِي حُجْرَتِهَا قَبْلَ أَنْ تَظْهَرَ', 'Once `Umar bin `Abdul `Aziz delayed the prayer and `Urwa bin Az-Zubair went to him and said, \"Once in \'Iraq, Al-Mughira bin Shu`ba delayed his prayers and Abi Mas`ud Al-Ansari went to him and said, \'O Mughira! What is this? Don\'t you know that once Gabriel came and offered the prayer (Fajr prayer) and Allah\'s Messenger (ﷺ) prayed too, then he prayed again (Zuhr prayer) and so did Allah\'s Apostle and again he prayed (`Asr prayers and Allah\'s Messenger (ﷺ) did the same; again he prayed (Maghrib-prayer) and so did Allah\'s Messenger (ﷺ) and again prayed (`Isha prayer) and so did Allah\'s Apostle and (Gabriel) said, \'I was ordered to do so (to demonstrate the prayers prescribed to you)?\'\" `Umar (bin `Abdul `Aziz) said to `Urwa, \"Be sure of what you Say. Did Gabriel lead Allah\'s Messenger (ﷺ) at the stated times of the prayers?\" `Urwa replied, \"Bashir bin Abi Mas`ud narrated like this on the authority of his father.\" `Urwa added, \"Aisha told me that Allah\'s Messenger (ﷺ) used to pray `Asr prayer when the sunshine was still inside her residence (during the early time of `Asr).', 'Abdullah bin Mesleme bize şöyle dedi: İbni Şihab\'tan rivayetle Malik\'e okudum ki, Ömer bin Abdülaziz bir gün namazı geciktirdi ve başına bir döngü girdi. İbnü\'z-Zübeyr de ona şöyle haber verdi: Muğire İbni Şu\'be, Irak\'ta iken bir gün namazı geciktirdi, bunun üzerine Ebu Mesud el-Ensari ona geldi ve şöyle dedi: \"Bu nedir? Bir Muğire, Cebrail\'in gelip namaz kıldığını ve Resulullah\'ın (s.a.v.) Allah, Allah ona salat ve selam versin, dua etti, sonra dua etti ve Reslullah, Allah onu korusun ve huzur versin, dua etti, sonra dua etti ve Allah\'ın Elçisi, Allah ona bereket versin ve bağışlasın. ona selam verdi, dua etti, sonra dua etti. Sonra Resûlullah sallallahu aleyhi ve sellem dua etti, sonra dua etti, Resûlullah sallallahu aleyhi ve sellem de dua etti ve şöyle dedi: \"Bana böyle emredildi.\" Bunun üzerine Ömer, Urve\'ye şöyle dedi: \"Neden bahsettiğini veya o sırada Allah\'ın Resulü\'nün yanında duranın Cebrail olduğunu biliyorum. Beşir bin Ebi Mesud babasından şöyle rivayet ederdi: Urve dedi ki: Aişe bana dedi ki, Resûlullah -sallallahu aleyhi ve sellem- Allah ona salat ve selam versin, ikindi namazını kılardı. Güneş doğmadan önce odasındaydı.', 'ہم سے عبداللہ بن مسلمہ نے بیان کیا ، انھوں نے کہا کہ میں نے امام مالک رحمہ اللہ علیہ کو پڑھ کر سنایا ابن شہاب کی روایت سے کہ حضرت عمر بن عبدالعزیز رحمہ اللہ علیہ نے ایک دن ( عصر کی ) نماز میں دیر کی ، پس عروہ بن زبیر رضی اللہ عنہ کے پاس تشریف لے گئے ، اور انھوں نے بتایا کہ ( اسی طرح ) مغیرہ بن شعبہ رضی اللہ عنہ نے ایک دن ( عراق کے ملک میں ) نماز میں دیر کی تھی جب وہ عراق میں ( حاکم ) تھے ۔ پس ابومسعود انصاری ( عقبہ بن عمر ) ان کی خدمت میں گئے ۔ اور فرمایا ، مغیرہ رضی اللہ عنہ ! آخر یہ کیا بات ہے ، کیا آپ کو معلوم نہیں کہ جب جبرائیل علیہ السلام تشریف لائے تو انھوں نے نماز پڑھی اور رسول کریم صلی اللہ علیہ وسلم نے بھی نماز پڑھی ، پھر جبرائیل علیہ السلام نے نماز پڑھی تو نبی کریم صلی اللہ علیہ وسلم نے بھی نماز پڑھی ، پھر جبرائیل علیہ السلام نے نماز پڑھی تو نبی کریم صلی اللہ علیہ وسلم نے بھی نماز پڑھی ، پھر جبرائیل علیہ السلام نے کہا کہ میں اسی طرح حکم دیا گیا ہوں ۔ اس پر حضرت عمر بن عبدالعزیز رحمہ اللہ نے عروہ سے کہا ، معلوم بھی ہے آپ کیا بیان کر رہے ہیں ؟ کیا جبرائیل علیہ السلام نے نبی کریم صلی اللہ علیہ وسلم کو نماز کے اوقات ( عمل کر کے ) بتلائے تھے ۔ عروہ نے کہا ، کہ ہاں اسی طرح بشیر بن ابی مسعود رضی اللہ عنہ اپنے والد کے واسطہ سے بیان کرتے تھے ۔ عروہ رحمہ اللہ علیہ نے کہا کہ مجھ سے عائشہ رضی اللہ عنہا نے بیان کیا کہ رسول اللہ صلی اللہ علیہ وسلم عصر کی نماز اس وقت پڑھ لیتے تھے جب ابھی دھوپ ان کے حجرہ میں موجود ہوتی تھی اس سے بھی پہلے کہ وہ دیوار پر چڑھے ۔', 'N/A', 'N/A', 'N/A', '1709039662', '2024-02-27 12:14:22', '2024-02-27 12:15:18'),
(8, '1709039931877', 'Ibn `Abbas', 'Sahih al-Bukhari', '1709039240179', 'حَدَّثَنَا قُتَيْبَةُ بْنُ سَعِيدٍ، قَالَ حَدَّثَنَا عَبَّادٌ ـ هُوَ ابْنُ عَبَّادٍ ـ عَنْ أَبِي جَمْرَةَ، عَنِ ابْنِ عَبَّاسٍ، قَالَ قَدِمَ وَفْدُ عَبْدِ الْقَيْسِ عَلَى رَسُولِ اللَّهِ صلى الله عليه وسلم فَقَالُوا إِنَّا مِنْ هَذَا الْحَىِّ مِنْ رَبِيعَةَ، وَلَسْنَا نَصِلُ إِلَيْكَ إِلاَّ فِي الشَّهْرِ الْحَرَامِ، فَمُرْنَا بِشَىْءٍ نَأْخُذْهُ عَنْكَ، وَنَدْعُو إِلَيْهِ مَنْ وَرَاءَنَا‏.‏ فَقَالَ ‏ \"‏ آمُرُكُمْ بِأَرْبَعٍ، وَأَنْهَاكُمْ عَنْ أَرْبَعٍ الإِيمَانِ بِاللَّهِ ـ ثُمَّ فَسَّرَهَا لَهُمْ شَهَادَةُ أَنْ لاَ إِلَهَ إِلاَّ اللَّهُ، وَأَنِّي رَسُولُ اللَّهِ، وَإِقَامُ الصَّلاَةِ، وَإِيتَاءُ الزَّكَاةِ، وَأَنْ تُؤَدُّوا إِلَىَّ خُمُسَ مَا غَنِمْتُمْ، وَأَنْهَى عَنِ الدُّبَّاءِ وَالْحَنْتَمِ وَالْمُقَيَّرِ وَالنَّقِيرِ ‏', '\"Once a delegation of `Abdul Qais came to Allah\'s Messenger (ﷺ) and said, \"We belong to such and such branch of the tribe of Rabi\'ah and we can only come to you in the sacred months. Order us to do something good so that we may take it from you and also invite to it those whom we have left behind (at home).\" So he said, \"I order you to do four things and forbid you from four things: To believe in Allah\" - and then he explained it to them \"to testify that none has the right to be worshipped but Allah and that I am Allah\'s Messenger (ﷺ), to establish the prayers (at the stated times), to pay the Zakat (obligatory charity), to hand me the Khumus (fifth) if you acquire spoils of war. And I forbid from (using) Dubba, Hantam, Muqaiyyar, and Naqir (all these were utensils used for the preparation of alcoholic drinks).', 'Kutibe bin Saeed\'den, Ebu Cumre (Nasr bin İmran)\'den, İbn Abbas\'tan (Allah ondan razı olsun), Abdülkays\'tan rivayetle, Heyet, Hz. Peygamber Efendimiz (Allah\'ın selamı ve bereketi onun üzerine olsun) ve şöyle dedi: \"Biz bu Rabia kabilesindeniz ve Peygamber\'in (Allah\'ın selamı ve bereketi onun üzerine olsun) hizmetine ancak haram aylarda katılabiliriz. Bize senden öğrenebileceğimiz ve bize uyanları da buna davet edebileceğimiz şeyler söyledi: \"Ben sana dört şeyi ve dört şeyi emrediyorum: Önce Allah\'a, sonra Peygamber Efendimiz (s.a.v.)\'e iman etmeyi emrediyorum.\" ) bunu detaylı bir şekilde açıklamıştır, yani Allah\'tan başka ilah olmadığına ve benim Allah\'ın Resulü olduğuma şehadet etmek, ikincisi namaz kılmak, üçüncüsü zekat vermek, dördüncüsü zekat vermektir. - Ganimet olarak aldığınız malın beşte birini ve sizi ağır hantaam, kasar ve nakir kullanmaktan men ediyorum. (Not: Bu kapların tümü şarap yapımında kullanılmıştır).', 'ہم سے قتیبہ بن سعید نے بیان کیا ، کہا ہم سے عباد بن عباد بصریٰ نے ، اور یہ عباد کے لڑکے ہیں ، ابوجمرہ ( نصر بن عمران ) کے ذریعہ سے ، انھوں نے ابن عباس رضی اللہ عنہما سے ، انھوں نے کہا کہ عبدالقیس کا وفد رسول کریم صلی اللہ علیہ وسلم کی خدمت میں آیا اور کہا کہ ہم اس ربیعہ قبیلہ سے ہیں اور ہم آپ صلی اللہ علیہ وسلم کی خدمت میں صرف حرمت والے مہینوں ہی میں حاضر ہو سکتے ہیں ، اس لیے آپ صلی اللہ علیہ وسلم کسی ایسی بات کا ہمیں حکم دیجیئے ، جسے ہم آپ صلی اللہ علیہ وسلم سے سیکھ لیں اور اپنے پیچھے رہنے والے دوسرے لوگوں کو بھی اس کی دعوت دے سکیں ، آپ صلی اللہ علیہ وسلم نے فرمایا کہ میں تمہیں چار چیزوں کا حکم دیتا ہوں اور چار چیزوں سے روکتا ہوں ، پہلے خدا پر ایمان لانے کا ، پھر آپ صلی اللہ علیہ وسلم نے اس کی تفصیل بیان فرمائی کہ اس بات کی شہادت دینا کہ اللہ کے سوا کوئی معبود نہیں اور یہ کہ میں اللہ کا رسول ہوں ، اور دوسرے نماز قائم کرنے کا ، تیسرے زکوٰۃ دینے کا ، اور چوتھے جو مال تمہیں غنیمت میں ملے ، اس میں سے پانچواں حصہ ادا کرنے کا اور تمہیں میں تونبڑی حنتم ، قسار اور نقیر کے استعمال سے روکتا ہوں ۔ ( نوٹ : یہ تمام برتن شراب بنانے کے لیے استعمال ہوتے تھے ) ۔\n', 'N/A', 'N/A', 'N/A', '1709039931', '2024-02-27 12:18:51', '2024-02-27 12:18:51'),
(9, '1709040026161', 'Jarir bin `Abdullah', 'Sahih al-Bukhari', '1709039240179', 'حَدَّثَنَا مُحَمَّدُ بْنُ الْمُثَنَّى، قَالَ حَدَّثَنَا يَحْيَى، قَالَ حَدَّثَنَا إِسْمَاعِيلُ، قَالَ حَدَّثَنَا قَيْسٌ، عَنْ جَرِيرِ بْنِ عَبْدِ اللَّهِ، قَالَ بَايَعْتُ رَسُولَ اللَّهِ صلى الله عليه وسلم عَلَى إِقَامِ الصَّلاَةِ، وَإِيتَاءِ الزَّكَاةِ، وَالنُّصْحِ لِكُلِّ مُسْلِمٍ‏', 'I gave the pledge of allegiance to Allah\'s Messenger (ﷺ) for to offer prayers perfectly, to pay Zakat regularly, and to give good advice to every Muslim.', 'Namazı güzel kılmak, zekatı düzenli vermek ve her Müslümana güzel öğüt vermek üzere Resûlullah (s.a.v.)\'e biat ettim.', 'ہم سے محمد بن مثنیٰ نے بیان کیا ، انھوں نے کہا کہ ہم سے یحییٰ بن سعید قطان نے کہا کہ ہم سے اسماعیل بن ابی خالد نے بیان کیا ، انھوں نے کہا کہ ہم سے قیس بن ابی حازم نے جریر بن عبداللہ رضی اللہ عنہ کی روایت سے بیان کیا کہ جریر بن عبداللہ بجلی رضی اللہ عنہ نے فرمایا کہ میں نے رسول اللہ صلی اللہ علیہ وسلم کے دست مبارک پر نماز قائم کرنے ، زکوٰۃ دینے ، اور ہر مسلمان کے ساتھ خیرخواہی کرنے پر بیعت کی ۔\n', 'N/A', 'N/A', 'N/A', '1709040026', '2024-02-27 12:20:26', '2024-02-27 12:20:26'),
(10, '1709040126779', 'Abu Huraira', 'Sahih al-Bukhari', '1709037668143', 'حَدَّثَنَا عَبْدُ اللَّهِ بْنُ مُحَمَّدٍ، قَالَ حَدَّثَنَا أَبُو عَامِرٍ الْعَقَدِيُّ، قَالَ حَدَّثَنَا سُلَيْمَانُ بْنُ بِلاَلٍ، عَنْ عَبْدِ اللَّهِ بْنِ دِينَارٍ، عَنْ أَبِي صَالِحٍ، عَنْ أَبِي هُرَيْرَةَ ـ رضى الله عنه ـ عَنِ النَّبِيِّ صلى الله عليه وسلم قَالَ ‏ \"‏ الإِيمَانُ بِضْعٌ وَسِتُّونَ شُعْبَةً، وَالْحَيَاءُ شُعْبَةٌ مِنَ الإِيمَانِ ‏\"‏‏.‏\n', 'The Prophet (ﷺ) said, \"Faith (Belief) consists of more than sixty branches (i.e. parts). And Haya (This term \"Haya\" covers a large number of concepts which are to be taken together; amongst them are self respect, modesty, bashfulness, and scruple, etc.) is a part of faith.\"\n\n', 'Bize Abdullah ibn Muhammed Caferi rivayet etti, Ebu Emir Ukdi bize rivayet etti, Süleyman ibn Bilal bize rivayet etti, o da Abdullah ibn Dinar\'dan rivayet etti, o da Ebu Salih\'ten rivayet etti: Hazreti Ebu Hureyre\'nin yetkisi, Allah ondan razı olsun. Ve tevazu da imanın bir şubesidir.', 'ہم سے بیان کیا عبداللہ بن محمد جعفی نے ، انھوں نے کہا ہم سے بیان کیا ابوعامر عقدی نے ، انھوں نے کہا ہم سے بیان کیا سلیمان بن بلال نے ، انھوں نے عبداللہ بن دینار سے ، انہوں نے روایت کیا ابوصالح سے ، انہوں نے نقل کیا حضرت ابوہریرہ رضی اللہ عنہ سے ، انہوں نے نقل فرمایا جناب نبی کریم صلی اللہ علیہ وسلم سے آپ صلی اللہ علیہ وسلم نے فرمایا کہ ایمان کی ساٹھ سے کچھ اوپر شاخیں ہیں ۔ اور حیاء ( شرم ) بھی ایمان کی ایک شاخ ہے ۔\n', 'N/A', 'N/A', 'N/A', '1709040126', '2024-02-27 12:22:06', '2024-02-27 12:22:06'),
(11, '1709040207044', '\'Abdullah bin \'Amr', 'Sahih al-Bukhari', '1709037668143', 'حَدَّثَنَا آدَمُ بْنُ أَبِي إِيَاسٍ، قَالَ حَدَّثَنَا شُعْبَةُ، عَنْ عَبْدِ اللَّهِ بْنِ أَبِي السَّفَرِ، وَإِسْمَاعِيلَ، عَنِ الشَّعْبِيِّ، عَنْ عَبْدِ اللَّهِ بْنِ عَمْرٍو ـ رضى الله عنهما ـ عَنِ النَّبِيِّ صلى الله عليه وسلم قَالَ ‏ \"‏ الْمُسْلِمُ مَنْ سَلِمَ الْمُسْلِمُونَ مِنْ لِسَانِهِ وَيَدِهِ، وَالْمُهَاجِرُ مَنْ هَجَرَ مَا نَهَى اللَّهُ عَنْهُ ‏\"‏‏.‏ قَالَ أَبُو عَبْدِ اللَّهِ وَقَالَ أَبُو مُعَاوِيَةَ حَدَّثَنَا دَاوُدُ عَنْ عَامِرٍ قَالَ سَمِعْتُ عَبْدَ اللَّهِ عَنِ النَّبِيِّ صلى الله عليه وسلم‏.‏ وَقَالَ عَبْدُ الأَعْلَى عَنْ دَاوُدَ عَنْ عَامِرٍ عَنْ عَبْدِ اللَّهِ عَنِ النَّبِيِّ صلى الله عليه وسلم‏.‏\n', 'The Prophet (ﷺ) said, \"A Muslim is the one who avoids harming Muslims with his tongue and hands. And a Muhajir (emigrant) is the one who gives up (abandons) all what Allah has forbidden.\"\n\n', 'Peygamber Efendimiz (ﷺ) şöyle buyurmuştur: \"Müslüman, diliyle ve eliyle Müslümanlara zarar vermekten kaçınan kimsedir. Muhacir ise Allah\'ın haram kıldığı her şeyden vazgeçen (terk eden) kişidir.\"', 'ہم سے آدم بن ابی ایاس نے یہ حدیث بیان کی ، ان کو شعبہ نے وہ عبداللہ بن ابی السفر اور اسماعیل سے روایت کرتے ہیں ، وہ دونوں شعبی سے نقل کرتے ہیں ، انھوں نے عبداللہ بن عمرو بن عاص رضی اللہ عنہما سے ، وہ نبی کریم صلی اللہ علیہ وسلم سے روایت کرتے ہیں کہ آپ صلی اللہ علیہ وسلم نے فرمایا مسلمان وہ ہے جس کی زبان اور ہاتھ سے مسلمان بچے رہیں اور مہاجر وہ ہے جو ان کاموں کو چھوڑ دے جن سے اللہ نے منع فرمایا ۔ ابوعبداللہ امام بخاری نے فرمایا اور ابومعاویہ نے کہ ہم کو حدیث بیان کی داؤد بن ابی ہند نے ، انھوں نے روایت کی عامر شعبی سے ، انھوں نے کہا کہ میں نے سنا عبداللہ بن عمرو بن عاص سے ، وہ حدیث بیان کرتے ہیں جناب نبی کریم صلی اللہ علیہ وسلم سے ( وہی مذکورہ حدیث ) اور کہا کہ عبدالاعلیٰ نے روایت کیا داؤد سے ، انھوں نے عامر سے ، انھوں نے عبداللہ بن عمرو بن عاص سے ، انھوں نے نبی کریم صلی اللہ علیہ وسلم سے ۔\n', 'N/A', 'N/A', 'N/A', '1709040207', '2024-02-27 12:23:27', '2024-02-27 12:23:27'),
(12, '1709040301883', ' `Abdullah bin `Amr', 'Sahih al-Bukhari', '1709038694838', 'حَدَّثَنَا أَبُو النُّعْمَانِ، عَارِمُ بْنُ الْفَضْلِ قَالَ حَدَّثَنَا أَبُو عَوَانَةَ، عَنْ أَبِي بِشْرٍ، عَنْ يُوسُفَ بْنِ مَاهَكَ، عَنْ عَبْدِ اللَّهِ بْنِ عَمْرٍو، قَالَ تَخَلَّفَ عَنَّا النَّبِيُّ صلى الله عليه وسلم فِي سَفْرَةٍ سَافَرْنَاهَا، فَأَدْرَكَنَا وَقَدْ أَرْهَقَتْنَا الصَّلاَةُ وَنَحْنُ نَتَوَضَّأُ، فَجَعَلْنَا نَمْسَحُ عَلَى أَرْجُلِنَا، فَنَادَى بِأَعْلَى صَوْتِهِ ‏ \"‏ وَيْلٌ لِلأَعْقَابِ مِنَ النَّارِ ‏\"‏‏.‏ مَرَّتَيْنِ أَوْ ثَلاَثًا‏.‏\n', 'Once the Prophet (ﷺ) remained behind us in a journey. He joined us while we were performing ablution for the prayer which was over-due. We were just passing wet hands over our feet (and not washing them properly) so the Prophet (ﷺ) addressed us in a loud voice and said twice or thrice: \"Save your heels from the fire.\"\n\n', 'Ebu\'n-Nu\'man bize anlattı, bize dedi ki, Ebu Avane bize Ebu Beşar\'dan rivayet etti, Yusuf ibn Mahik\'ten rivayet etti, Abdullah ibn Amr\'dan rivayet etti, yaptığımız bir yolculukta bize şöyle dedi: Hz. (Allah\'ın selamı ve bereketi onun üzerine olsun) arkamızdaydı, ikindi namazı vakti geldiğinde ve biz (hızla) abdest alırken o (Allah\'ın selamı ve bereketi onun üzerine olsun) bizimle buluştu. Yani ayakları iyice yıkamak yerine bu şekilde yıkıyorduk. (Bu durumu görünce) Peygamber Efendimiz (sav) yüksek sesle bağırdı: Bakın, topukların şekli iki üç defa cehennemden olacak.', 'ہم سے ابوالنعمان نے بیان کیا ، کہا ہم سے ابوعوانہ نے ابوبشر سے بیان کیا ، انھوں نے یوسف بن ماہک سے ، انھوں نے عبداللہ بن عمرو سے ، انھوں نے کہا ایک سفر میں جو ہم نے کیا تھا آنحضرت صلی اللہ علیہ وسلم ہم سے پیچھے رہ گئے اور آپ صلی اللہ علیہ وسلم ہم سے اس وقت ملے جب ( عصر کی ) نماز کا وقت آن پہنچا تھا ہم ( جلدی جلدی ) وضو کر رہے تھے ۔ پس پاؤں کو خوب دھونے کے بدل ہم یوں ہی سا دھو رہے تھے ۔ ( یہ حال دیکھ کر ) آپ صلی اللہ علیہ وسلم نے بلند آواز سے پکارا دیکھو ایڑیوں کی خرابی دوزخ سے ہونے والی ہے دو یا تین بار آپ صلی اللہ علیہ وسلم نے ( یوں ہی بلند آواز سے ) فرمایا ۔\n', 'N/A', 'N/A', 'N/A', '1709040301', '2024-02-27 12:25:01', '2024-02-27 12:25:01'),
(13, '1709040378616', 'Ibn `Umar', 'Sahih al-Bukhari', '1709038694838', 'حَدَّثَنَا قُتَيْبَةُ، حَدَّثَنَا إِسْمَاعِيلُ بْنُ جَعْفَرٍ، عَنْ عَبْدِ اللَّهِ بْنِ دِينَارٍ، عَنِ ابْنِ عُمَرَ، قَالَ قَالَ رَسُولُ اللَّهِ صلى الله عليه وسلم ‏\"‏ إِنَّ مِنَ الشَّجَرِ شَجَرَةً لاَ يَسْقُطُ وَرَقُهَا، وَإِنَّهَا مَثَلُ الْمُسْلِمِ، فَحَدِّثُونِي مَا هِيَ ‏\"‏‏.‏ فَوَقَعَ النَّاسُ فِي شَجَرِ الْبَوَادِي‏.‏ قَالَ عَبْدُ اللَّهِ وَوَقَعَ فِي نَفْسِي أَنَّهَا النَّخْلَةُ، فَاسْتَحْيَيْتُ ثُمَّ قَالُوا حَدِّثْنَا مَا هِيَ يَا رَسُولَ اللَّهِ قَالَ ‏\"‏ هِيَ النَّخْلَةُ ‏\"‏‏.‏\n', 'Allah\'s Messenger (ﷺ) said, \"Amongst the trees, there is a tree, the leaves of which do not fall and is like a Muslim. Tell me the name of that tree.\" Everybody started thinking about the trees of the desert areas. And I thought of the date-palm tree but felt shy to answer the others then asked, \"What is that tree, O Allah\'s Messenger (ﷺ) ?\" He replied, \"It is the date-palm tree.\"\n\n', 'Allah Resulü (ﷺ) şöyle buyurdu: \"Ağaçların arasında yaprakları düşmeyen, Müslüman gibi bir ağaç vardır. Bana o ağacın adını söyle.\" Herkes çöllerdeki ağaçları düşünmeye başladı. Ben de hurma ağacını düşündüm ama diğerlerine cevap vermekten çekindim ve sordum: \"Bu ağaç nedir ya Resulallah?\" \"Bu hurma ağacıdır\" diye cevap verdi.', 'ہم سے قتیبہ بن سعید نے بیان کیا ، کہا ہم سے اسماعیل بن جعفر نے بیان کیا ، انھوں نے عبداللہ بن دینار سے ، انھوں نے عبداللہ بن عمر رضی اللہ عنہما سے کہا کہ آنحضرت صلی اللہ علیہ وسلم نے فرمایا درختوں میں ایک درخت ایسا ہے کہ اس کے پتے نہیں جھڑتے اور مسلمان کی مثال اسی درخت کی سی ہے ۔ بتاؤ وہ کون سا درخت ہے ؟ یہ سن کر لوگوں کا خیال جنگل کے درختوں کی طرف دوڑا ۔ عبداللہ رضی اللہ عنہ نے کہا میرے دل میں آیا کہ وہ کھجور کا درخت ہے ۔ مگر میں اپنی ( کم سنی کی ) شرم سے نہ بولا ۔ آخر صحابہ نے آنحضرت صلی اللہ علیہ وسلم ہی سے پوچھا کہ وہ کون سا درخت ہے ؟ آپ صلی اللہ علیہ وسلم نے فرمایا وہ کھجور کا درخت ہے ۔\n', 'N/A', 'N/A', 'N/A', '1709040378', '2024-02-27 12:26:18', '2024-02-27 12:26:18'),
(14, '1709040511358', 'Aisha', 'Sahih al-Bukhari', '1709038633300', 'حَدَّثَنَا عَبْدُ اللَّهِ بْنُ يُوسُفَ، قَالَ أَخْبَرَنَا مَالِكٌ، عَنْ هِشَامِ بْنِ عُرْوَةَ، عَنْ أَبِيهِ، عَنْ عَائِشَةَ أُمِّ الْمُؤْمِنِينَ ـ رضى الله عنها ـ أَنَّ الْحَارِثَ بْنَ هِشَامٍ ـ رضى الله عنه ـ سَأَلَ رَسُولَ اللَّهِ صلى الله عليه وسلم فَقَالَ يَا رَسُولَ اللَّهِ كَيْفَ يَأْتِيكَ الْوَحْىُ فَقَالَ رَسُولُ اللَّهِ صلى الله عليه وسلم ‏ \"‏ أَحْيَانًا يَأْتِينِي مِثْلَ صَلْصَلَةِ الْجَرَسِ ـ وَهُوَ أَشَدُّهُ عَلَىَّ ـ فَيُفْصَمُ عَنِّي وَقَدْ وَعَيْتُ عَنْهُ مَا قَالَ، وَأَحْيَانًا يَتَمَثَّلُ لِيَ الْمَلَكُ رَجُلاً فَيُكَلِّمُنِي فَأَعِي مَا يَقُولُ ‏\"‏‏.‏ قَالَتْ عَائِشَةُ رضى الله عنها وَلَقَدْ رَأَيْتُهُ يَنْزِلُ عَلَيْهِ الْوَحْىُ فِي الْيَوْمِ الشَّدِيدِ الْبَرْدِ، فَيَفْصِمُ عَنْهُ وَإِنَّ جَبِينَهُ لَيَتَفَصَّدُ عَرَقًا‏.‏\n', '(the mother of the faithful believers) Al-Harith bin Hisham asked Allah\'s Messenger (ﷺ) \"O Allah\'s Messenger (ﷺ)! How is the Divine Inspiration revealed to you?\" Allah\'s Messenger (ﷺ) replied, \"Sometimes it is (revealed) like the ringing of a bell, this form of Inspiration is the hardest of all and then this state passes off after I have grasped what is inspired. Sometimes the Angel comes in the form of a man and talks to me and I grasp whatever he says.\" \'Aisha added: Verily I saw the Prophet (ﷺ) being inspired divinely on a very cold day and noticed the sweat dropping from his forehead (as the Inspiration was over).\n\n', '(Müminlerin annesi) Hâris bin Hişam, Allah Resulü\'ne (ﷺ) sordu: \"Ey Allah\'ın Resulü! İlâhi vahiy sana nasıl vahyediliyor?\" Allah Resulü (ﷺ) buyurdu ki: \"Bazen zil sesi gibidir, bu vahyin en zorudur ve sonra vahyedileni kavradıktan sonra bu hal geçer. Bazen de melek gelir. bir adam görünümünde ve benimle konuşuyor ve ne derse onu anlıyorum.\" Aişe şunu ekledi: Gerçekten ben Peygamber Efendimiz\'e (s.a.v.) çok soğuk bir günde vahyedildiğini gördüm ve (vahyin bitmesiyle birlikte) alnından ter aktığını fark ettim.', 'ہم کو عبداللہ بن یوسف نے حدیث بیان کی ، ان کو مالک نے ہشام بن عروہ کی روایت سے خبر دی ، انھوں نے اپنے والد سے نقل کی ، انھوں نے ام المؤمنین حضرت عائشہ صدیقہ رضی اللہ عنہا سے نقل کی آپ نے فرمایا کہ ایک شخص حارث بن ہشام نامی نے آنحضرت صلی اللہ علیہ وسلم سے سوال کیا تھا کہ یا رسول اللہ ! آپ پر وحی کیسے نازل ہوتی ہے ؟ آپ صلی اللہ علیہ وسلم نے فرمایا کہ وحی نازل ہوتے وقت کبھی مجھ کو گھنٹی کی سی آواز محسوس ہوتی ہے اور وحی کی یہ کیفیت مجھ پر بہت شاق گذرتی ہے ۔ جب یہ کیفیت ختم ہوتی ہے تو میرے دل و دماغ پر اس ( فرشتے ) کے ذریعہ نازل شدہ وحی محفوظ ہو جاتی ہے اور کسی وقت ایسا ہوتا ہے کہ فرشتہ بشکل انسان میرے پاس آتا ہے اور مجھ سے کلام کرتا ہے ۔ پس میں اس کا کہا ہوا یاد رکھ لیتا ہوں ۔ حضرت عائشہ رضی اللہ عنہا کا بیان ہے کہ میں نے سخت کڑاکے کی سردی میں آنحضرت صلی اللہ علیہ وسلم کو دیکھا ہے کہ آپ صلی اللہ علیہ وسلم پر وحی نازل ہوئی اور جب اس کا سلسلہ موقوف ہوا تو آپ صلی اللہ علیہ وسلم کی پیشانی پسینے سے شرابور تھی ۔\n', 'N/A', 'N/A', 'N/A', '1709040511', '2024-02-27 12:28:31', '2024-02-27 12:28:31'),
(15, '1709040636415', 'Anas', 'Sahih al-Bukhari', '1709040569311', 'حَدَّثَنَا عِمْرَانُ بْنُ مَيْسَرَةَ، حَدَّثَنَا عَبْدُ الْوَارِثِ، حَدَّثَنَا خَالِدٌ الْحَذَّاءُ، عَنْ أَبِي قِلاَبَةَ، عَنْ أَنَسٍ، قَالَ ذَكَرُوا النَّارَ وَالنَّاقُوسَ، فَذَكَرُوا الْيَهُودَ وَالنَّصَارَى، فَأُمِرَ بِلاَلٌ أَنْ يَشْفَعَ الأَذَانَ وَأَنْ يُوتِرَ الإِقَامَةَ‏.‏\n', 'The people mentioned the fire and the bell (they suggested those as signals to indicate the starting of prayers), and by that they mentioned the Jews and the Christians. Then Bilal was ordered to pronounce Adhan for the prayer by saying its wordings twice, and for the Iqama (the call for the actual standing for the prayers in rows) by saying its wordings once. (Iqama is pronounced when the people are ready for the prayer).\n\n', 'Bize İmran bin Meysere anlattı, Abd el-Varis anlattı, Halid el-Hadha bize Ebu Kılabe\'den, Enes\'ten rivayetle şöyle dedi: \"Ateş ve çandan bahsettiler\" ve şöyle dedi: Yahudi ve Hıristiyanlar için Bilal\'e namazın ortasında ezan okuması ve Vitir\'i okuması emredildi.', 'ہم سے عمران بن میسرہ نے بیان کیا، کہا ہم سے عبدالوارث نے بیان کیا، کہا ہم سے خالد ہذا نے بیان کیا، انہوں نے ابوقلابہ سے، انہوں نے انس رضی اللہ عنہ سے، انہوں نے کہا کہ انہوں نے آگ اور گھنٹی کا ذکر کیا، تو انہوں نے ذکر کیا۔ یہود و نصاریٰ، تو بلال کو حکم دیا گیا کہ وہ نماز کے درمیان میں اذان دیں اور اقامت وتر کہیں۔', 'N/A', 'N/A', 'N/A', '1709040636', '2024-02-27 12:30:36', '2024-02-27 12:30:36'),
(16, '1709040717283', 'Ibn `Umar', 'Sahih al-Bukhari', '1709040569311', 'حَدَّثَنَا مَحْمُودُ بْنُ غَيْلاَنَ، قَالَ حَدَّثَنَا عَبْدُ الرَّزَّاقِ، قَالَ أَخْبَرَنَا ابْنُ جُرَيْجٍ، قَالَ أَخْبَرَنِي نَافِعٌ، أَنَّ ابْنَ عُمَرَ، كَانَ يَقُولُ كَانَ الْمُسْلِمُونَ حِينَ قَدِمُوا الْمَدِينَةَ يَجْتَمِعُونَ فَيَتَحَيَّنُونَ الصَّلاَةَ، لَيْسَ يُنَادَى لَهَا، فَتَكَلَّمُوا يَوْمًا فِي ذَلِكَ، فَقَالَ بَعْضُهُمْ اتَّخِذُوا نَاقُوسًا مِثْلَ نَاقُوسِ النَّصَارَى‏.‏ وَقَالَ بَعْضُهُمْ بَلْ بُوقًا مِثْلَ قَرْنِ الْيَهُودِ‏.‏ فَقَالَ عُمَرُ أَوَلاَ تَبْعَثُونَ رَجُلاً يُنَادِي بِالصَّلاَةِ‏.‏ فَقَالَ رَسُولُ اللَّهِ صلى الله عليه وسلم ‏ \"‏ يَا بِلاَلُ قُمْ فَنَادِ بِالصَّلاَةِ ‏\"‏‏.‏\n', 'When the Muslims arrived at Medina, they used to assemble for the prayer, and used to guess the time for it. During those days, the practice of Adhan for the prayers had not been introduced yet. Once they discussed this problem regarding the call for prayer. Some people suggested the use of a bell like the Christians, others proposed a trumpet like the horn used by the Jews, but `Umar was the first to suggest that a man should call (the people) for the prayer; so Allah\'s Messenger (ﷺ) ordered Bilal to get up and pronounce the Adhan for prayers.\n\n', 'Müslümanlar Medine\'ye vardıklarında namaz için toplanırlar ve vakti tahmin ederlerdi. O günlerde henüz namazlarda ezan okuma uygulaması başlamamıştı. Bir defasında ezanla ilgili bu meseleyi tartışmışlardı. Bazıları Hıristiyanlar gibi zil kullanılmasını, bazıları da Yahudilerin kullandığı boruya benzer bir borazan kullanılmasını önerdi; ancak Ömer, bir erkeğin (halkı) namaza çağırmasını öneren ilk kişi oldu; Bunun üzerine Allah Resulü (ﷺ), Bilal\'e kalkıp namaz için ezan okumasını emretti.', 'ہم سے محمود بن غیلان نے بیان کیا ، کہا کہ ہم سے عبدالرزاق بن ہمام نے ، کہا کہ ہمیں عبدالملک ابن جریج نے خبر دی ، کہا کہ مجھے نافع نے خبر دی کہ عبداللہ بن عمر رضی اللہ عنہما کہتے تھے کہ جب مسلمان ( ہجرت کر کے ) مدینہ پہنچے تو وقت مقرر کر کے نماز کے لیے آتے تھے ۔ اس کے لیے اذان نہیں دی جاتی تھی ۔ ایک دن اس بارے میں مشورہ ہوا ۔ کسی نے کہا نصاریٰ کی طرح ایک گھنٹہ لے لیا جائے اور کسی نے کہا کہ یہودیوں کی طرح نرسنگا ( بگل بنا لو ، اس کو پھونک دیا کرو ) لیکن حضرت عمر رضی اللہ عنہ نے فرمایا کہ کسی شخص کو کیوں نہ بھیج دیا جائے جو نماز کے لیے پکار دیا کرے ۔ اس پر آنحضرت صلی اللہ علیہ وسلم نے ( اسی رائے کو پسند فرمایا اور بلال سے ) فرمایا کہ بلال ! اٹھ اور نماز کے لیے اذان دے ۔\n', 'N/A', 'N/A', 'N/A', '1709040717', '2024-02-27 12:31:57', '2024-02-27 12:31:57');
INSERT INTO `hadiths` (`id`, `_id`, `narratedBy`, `referenceBook`, `category_id`, `hadithArabic`, `hadithEnglish`, `hadithTurkish`, `hadithUrdu`, `hadithBangla`, `hadithHindi`, `hadithFrench`, `timestamp`, `created_at`, `updated_at`) VALUES
(17, '1709040782555', 'Anas', 'Sahih al-Bukhari', '1709040569311', 'حَدَّثَنَا سُلَيْمَانُ بْنُ حَرْبٍ، قَالَ حَدَّثَنَا حَمَّادُ بْنُ زَيْدٍ، عَنْ سِمَاكِ بْنِ عَطِيَّةَ، عَنْ أَيُّوبَ، عَنْ أَبِي قِلاَبَةَ، عَنْ أَنَسٍ، قَالَ أُمِرَ بِلاَلٌ أَنْ يَشْفَعَ، الأَذَانَ وَأَنْ يُوتِرَ الإِقَامَةَ إِلاَّ الإِقَامَةَ‏.‏\n', 'Bilal was ordered to repeat the wording of the Adhan for prayers twice, and to pronounce the wording of the Iqama once except \"Qad-qamat-is-salat\".\n\n', 'Süleyman bin Harb bize anlattı, Hammad bin Zeyd\'in bize söylediğini söyledi, Samak bin Atiya\'dan, Eyyub\'dan, Ebu Kılabe\'den, Enes\'ten rivayetle, Bilal\'e şefaat etmesi emredildiğini söyledi, ezan ve kamet hariç vitir kametidir.', 'ہم سے سلیمان بن حرب نے بیان کیا، انہوں نے کہا کہ ہم سے حماد بن زید نے بیان کیا، انہوں نے سماک بن عطیہ سے، انہوں نے ایوب رضی اللہ عنہ سے، وہ ابو قلابہ سے، انہوں نے انس رضی اللہ عنہ سے، انہوں نے کہا کہ بلال رضی اللہ عنہ کو حکم ہوا کہ وہ شفاعت کریں، اذان اور وتر اقامت سوائے اقامت کے۔', 'N/A', 'N/A', 'N/A', '1709040782', '2024-02-27 12:33:02', '2024-02-27 12:33:02'),
(18, '1709040825715', 'Anas bin Malik', 'Sahih al-Bukhari', '1709040569311', 'حَدَّثَنَا مُحَمَّدٌ، قَالَ أَخْبَرَنَا عَبْدُ الْوَهَّابِ، قَالَ أَخْبَرَنَا خَالِدٌ الْحَذَّاءُ، عَنْ أَبِي قِلاَبَةَ، عَنْ أَنَسِ بْنِ مَالِكٍ، قَالَ لَمَّا كَثُرَ النَّاسُ قَالَ ـ ذَكَرُوا ـ أَنْ يَعْلَمُوا وَقْتَ الصَّلاَةِ بِشَىْءٍ يَعْرِفُونَهُ، فَذَكَرُوا أَنْ يُورُوا نَارًا أَوْ يَضْرِبُوا نَاقُوسًا، فَأُمِرَ بِلاَلٌ أَنْ يَشْفَعَ الأَذَانَ وَأَنْ يُوتِرَ الإِقَامَةَ‏.‏\n', 'When the number of Muslims increased they discussed the question as to how to know the time for the prayer by some familiar means. Some suggested that a fire be lit (at the time of the prayer) and others put forward the proposal to ring the bell. Bilal was ordered to pronounce the wording of Adhan twice and of the Iqama once only.\n\n', 'Müslümanların sayısı artınca, namaz vaktinin bilinen bazı yöntemlerle nasıl öğrenileceği konusunu tartıştılar. Kimisi (namaz vaktinde) ateş yakılmasını, kimisi de zilin çalınmasını önerdi. Bilal\'e, ezanın sözlerini iki kez, kametin sözlerini ise yalnızca bir kez okuması emredildi.', 'جب مسلمانوں کی تعداد بڑھ گئی تو انہوں نے اس سوال پر بحث کی کہ کسی مانوس طریقے سے نماز کا وقت کیسے معلوم کیا جائے؟ بعض نے تجویز پیش کی کہ (نماز کے وقت) آگ روشن کی جائے اور بعض نے گھنٹی بجانے کی تجویز پیش کی۔ بلال کو اذان دو بار اور اقامت صرف ایک بار کہنے کا حکم دیا گیا۔', 'N/A', 'N/A', 'N/A', '1709040825', '2024-02-27 12:33:45', '2024-02-27 12:33:45'),
(19, '1709040985173', '`Abdullah bin `Umar', 'Sahih al-Bukhari', '1709040918895', 'حَدَّثَنَا أَبُو الْيَمَانِ، قَالَ أَخْبَرَنَا شُعَيْبٌ، عَنِ الزُّهْرِيِّ، قَالَ أَخْبَرَنِي سَالِمُ بْنُ عَبْدِ اللَّهِ، أَنَّ عَبْدَ اللَّهِ بْنَ عُمَرَ، قَالَ أَخَذَ عُمَرُ جُبَّةً مِنْ إِسْتَبْرَقٍ تُبَاعُ فِي السُّوقِ، فَأَخَذَهَا فَأَتَى رَسُولَ اللَّهِ صلى الله عليه وسلم فَقَالَ يَا رَسُولَ اللَّهِ ابْتَعْ هَذِهِ تَجَمَّلْ بِهَا لِلْعِيدِ وَالْوُفُودِ‏.‏ فَقَالَ لَهُ رَسُولُ اللَّهِ صلى الله عليه وسلم ‏\"‏ إِنَّمَا هَذِهِ لِبَاسُ مَنْ لاَ خَلاَقَ لَهُ ‏\"‏‏.‏ فَلَبِثَ عُمَرُ مَا شَاءَ اللَّهُ أَنْ يَلْبَثَ، ثُمَّ أَرْسَلَ إِلَيْهِ رَسُولُ اللَّهِ صلى الله عليه وسلم بِجُبَّةِ دِيبَاجٍ، فَأَقْبَلَ بِهَا عُمَرُ، فَأَتَى بِهَا رَسُولَ اللَّهِ صلى الله عليه وسلم فَقَالَ يَا رَسُولَ اللَّهِ إِنَّكَ قُلْتَ ‏\"‏ إِنَّمَا هَذِهِ لِبَاسُ مَنْ لاَ خَلاَقَ لَهُ ‏\"‏‏.‏ وَأَرْسَلْتَ إِلَىَّ بِهَذِهِ الْجُبَّةِ فَقَالَ لَهُ رَسُولُ اللَّهِ صلى الله عليه وسلم ‏\"‏ تَبِيعُهَا أَوْ تُصِيبُ بِهَا حَاجَتَكَ ‏\"‏‏.‏\n', '`Umar bought a silk cloak from the market, took it to Allah\'s Messenger (ﷺ) and said, \"O Allah\'s Messenger (ﷺ)! Take it and adorn yourself with it during the `Id and when the delegations visit you.\" Allah\'s Messenger (ﷺ) (p.b.u.h) replied, \"This dress is for those who have no share (in the Hereafter).\" After a long period Allah\'s Messenger (ﷺ) (p.b.u.h) sent to `Umar a cloak of silk brocade. `Umar came to Allah\'s Messenger (ﷺ) (p.b.u.h) with the cloak and said, \"O Allah\'s Messenger (ﷺ)! You said that this dress was for those who had no share (in the Hereafter); yet you have sent me this cloak.\" Allah\'s Messenger (ﷺ) said to him, \"Sell it and fulfill your needs by it.\"\n\n', 'Ömer, çarşıdan ipek bir elbise satın aldı, onu Allah Resulü\'ne (ﷺ) götürdü ve şöyle dedi: \"Ya Resulallah! Onu al ve bayramda ve heyetler seni ziyaret ettiğinde onunla süslen.\" Allah Resulü (ﷺ) (p.b.u.h) şöyle cevap verdi: \"Bu elbise (ahiretten) nasibi olmayanlar içindir.\" Uzun bir süre sonra Resûlullah (s.a.v.) Ömer\'e ipekten bir elbise gönderdi. Ömer, Rasûlullah (s.a.v.)\'e hırkayla geldi ve şöyle dedi: \"Ey Allah\'ın Resulü! Sen bu elbisenin (ahiretten) nasibi olmayanlar için olduğunu söylemiştin, ama bana bunu gönderdin.\" pelerin.\" Allah Resulü (ﷺ) ona, \"Onu sat ve ihtiyacını onunla karşıla\" buyurdu.', 'عمر رضی اللہ عنہ نے بازار سے ایک ریشمی چادر خریدی، وہ رسول اللہ صلی اللہ علیہ وسلم کے پاس لے گئے اور عرض کیا: یا رسول اللہ صلی اللہ علیہ وسلم اسے لے لو اور عید کے موقع پر اور جب وفد آپ کی عیادت کریں تو اس سے اپنے آپ کو سنواریں۔ رسول اللہ صلی اللہ علیہ وسلم نے فرمایا: یہ لباس ان لوگوں کے لیے ہے جن کا (آخرت میں) کوئی حصہ نہیں۔ ایک طویل مدت کے بعد رسول اللہ صلی اللہ علیہ وسلم نے حضرت عمر رضی اللہ عنہ کے پاس ریشم کی ایک چادر بھیجی۔ عمر رضی اللہ عنہ چادر لے کر رسول اللہ صلی اللہ علیہ وسلم کی خدمت میں حاضر ہوئے اور عرض کیا یا رسول اللہ صلی اللہ علیہ وسلم آپ نے فرمایا کہ یہ لباس ان لوگوں کے لیے ہے جن کا (آخرت میں) کوئی حصہ نہیں، پھر بھی آپ نے مجھے یہ لباس بھیجا ہے۔ چادر۔\" آپ صلی اللہ علیہ وسلم نے اس سے فرمایا کہ اسے بیچ دو اور اس سے اپنی ضرورت پوری کر لو۔', 'N/A', 'N/A', 'N/A', '1709040985', '2024-02-27 12:36:25', '2024-02-27 12:36:25'),
(20, '1709041210836', 'Aisha', 'Sahih al-Bukhari', '1709040918895', 'حَدَّثَنَا أَحْمَدُ، قَالَ حَدَّثَنَا ابْنُ وَهْبٍ، قَالَ أَخْبَرَنَا عَمْرٌو، أَنَّ مُحَمَّدَ بْنَ عَبْدِ الرَّحْمَنِ الأَسَدِيَّ، حَدَّثَهُ عَنْ عُرْوَةَ، عَنْ عَائِشَةَ، قَالَتْ دَخَلَ عَلَىَّ رَسُولُ اللَّهِ صلى الله عليه وسلم وَعِنْدِي جَارِيَتَانِ تُغَنِّيَانِ بِغِنَاءِ بُعَاثَ، فَاضْطَجَعَ عَلَى الْفِرَاشِ وَحَوَّلَ وَجْهَهُ، وَدَخَلَ أَبُو بَكْرٍ فَانْتَهَرَنِي وَقَالَ مِزْمَارَةُ الشَّيْطَانِ عِنْدَ النَّبِيِّ صلى الله عليه وسلم فَأَقْبَلَ عَلَيْهِ رَسُولُ اللَّهِ ـ عَلَيْهِ السَّلاَمُ ـ فَقَالَ ‏\"‏ دَعْهُمَا ‏\"‏ فَلَمَّا غَفَلَ غَمَزْتُهُمَا فَخَرَجَتَا‏.‏ وَكَانَ يَوْمَ عِيدٍ يَلْعَبُ السُّودَانُ بِالدَّرَقِ وَالْحِرَابِ، فَإِمَّا سَأَلْتُ النَّبِيَّ صلى الله عليه وسلم وَإِمَّا قَالَ ‏\"‏ تَشْتَهِينَ تَنْظُرِينَ ‏\"‏‏.‏ فَقُلْتُ نَعَمْ‏.‏ فَأَقَامَنِي وَرَاءَهُ خَدِّي عَلَى خَدِّهِ، وَهُوَ يَقُولُ ‏\"‏ دُونَكُمْ يَا بَنِي أَرْفِدَةَ ‏\"‏‏.‏ حَتَّى إِذَا مَلِلْتُ قَالَ ‏\"‏ حَسْبُكِ ‏\"‏‏.‏ قُلْتُ نَعَمْ‏.‏ قَالَ ‏\"‏ فَاذْهَبِي ‏\"‏‏.‏\n', 'Allah\'s Messenger (ﷺ) (p.b.u.h) came to my house while two girls were singing beside me the songs of Buath (a story about the war between the two tribes of the Ansar, the Khazraj and the Aus, before Islam). The Prophet (p.b.u.h) lay down and turned his face to the other side. Then Abu Bakr came and spoke to me harshly saying, \"Musical instruments of Satan near the Prophet (p.b.u.h) ?\" Allah\'s Messenger (ﷺ) (p.b.u.h) turned his face towards him and said, \"Leave them.\" When Abu Bakr became inattentive, I signaled to those girls to go out and they left. It was the day of `Id, and the Black people were playing with shields and spears; so either I requested the Prophet (p.b.u.h) or he asked me whether I would like to see the display. I replied in the affirmative. Then the Prophet (p.b.u.h) made me stand behind him and my cheek was touching his cheek and he was saying, \"Carry on! O Bani Arfida,\" till I got tired. The Prophet (p.b.u.h) asked me, \"Are you satisfied (Is that sufficient for you)?\" I replied in the affirmative and he told me to leave.\n\n', 'Yanımda iki kız Buas şarkısını (İslam\'dan önce Ensar\'ın iki kabilesi olan Hazrec ve Evs arasındaki savaşı konu alan bir hikaye) söylerken, Resûlullah (s.a.v.) evime geldi. Peygamber (s.a.v.) uzanıp yüzünü diğer tarafa çevirdi. Sonra Ebû Bekir geldi ve bana sert bir dille konuştu: \"Peygamber Efendimiz (s.a.v.)\'in yanında şeytanın çalgıları mı?\" Allah Resulü (ﷺ) (p.b.u.h) yüzünü ona çevirdi ve \"Onları bırak\" dedi. Ebu Bekir dikkatsiz kalınca kızlara dışarı çıkmalarını işaret ettim ve onlar da gittiler. İd günüydü ve Siyahlar kalkanlar ve mızraklarla oynuyorlardı; yani ya ben Peygamber\'den (s.a.v.) rica ettim ya da o bana sergiyi görmek isteyip istemediğimi sordu. Olumlu yanıt verdim. Sonra Resûlullah (s.a.v.) beni arkasında durdurdu, yanağım onun yanağına değiyordu ve ben yoruluncaya kadar, \"Devam et, ey Bani Arfida\" dedi. Peygamber Efendimiz (s.a.v.) bana, \"Doydun mu (bu sana yeter mi)?\" diye sordu. Olumlu cevap verdim ve gitmemi söyledi.', 'ہم سے احمد نے بیان کیا، کہا ہم سے ابن وہب نے بیان کیا، انہوں نے کہا کہ ہم سے عمرو نے بیان کیا، کہا کہ ان سے محمد بن عبدالرحمٰن اسدی نے عروہ سے، انہوں نے عائشہ رضی اللہ عنہا سے، انہوں نے کہا کہ رسول اللہ صلی اللہ علیہ وسلم آپ صلی اللہ علیہ وسلم پر درود و سلام نازل فرما، میرے پاس داخل ہوئے جب کہ میرے پاس دو لونڈیاں تھیں جو بعثت کا گانا گا رہی تھیں، آپ صلی اللہ علیہ وسلم بستر پر لیٹ گئے اور منہ پھیر لیا، اور ابوبکر رضی اللہ عنہ داخل ہوئے، پھر آپ صلی اللہ علیہ وسلم نے مجھے ڈانٹا اور فرمایا: شیطان کی بانسری رسول اللہ صلی اللہ علیہ وسلم کے پاس ہے، پھر رسول اللہ صلی اللہ علیہ وسلم ان کے پاس آئے اور فرمایا: ”انہیں چھوڑ دو۔“ جب اس نے غفلت برتی تو میں نے ان کی طرف آنکھ اٹھا کر کہا۔ وہ لوگ باہر نکلے، عید کا دن تھا اور سوڈان نیزوں اور نیزوں سے کھیل رہا تھا، میں نے یا تو رسول اللہ صلی اللہ علیہ وسلم سے پوچھا، یا آپ صلی اللہ علیہ وسلم نے فرمایا: تم دیکھنا چاہتے ہو؟ ’’ہاں۔‘‘ پھر اس نے مجھے اپنے پیچھے کھڑا کیا، میرا گال اس کے گال پر لگایا اور کہا، ’’اے بنو عرفیدہ ہوشیار رہو۔‘‘ یہاں تک کہ جب وہ غضب ناک ہوتا تو میں کہتا، ’’یہ تمہارے لیے کافی ہے۔‘‘ کہا ہاں، اس نے کہا پھر جاؤ۔', 'N/A', 'N/A', 'N/A', '1709041210', '2024-02-27 12:40:10', '2024-02-27 12:40:10'),
(21, '1709041496755', 'Al-Bara', 'Sahih al-Bukhari', '1709040918895', 'حَدَّثَنَا حَجَّاجٌ، قَالَ حَدَّثَنَا شُعْبَةُ، قَالَ أَخْبَرَنِي زُبَيْدٌ، قَالَ سَمِعْتُ الشَّعْبِيَّ، عَنِ الْبَرَاءِ، قَالَ سَمِعْتُ النَّبِيَّ صلى الله عليه وسلم يَخْطُبُ فَقَالَ ‏ \"‏ إِنَّ أَوَّلَ مَا نَبْدَأُ مِنْ يَوْمِنَا هَذَا أَنْ نُصَلِّيَ، ثُمَّ نَرْجِعَ فَنَنْحَرَ، فَمَنْ فَعَلَ فَقَدْ أَصَابَ سُنَّتَنَا ‏\"‏‏.‏\n', 'I heard the Prophet (p.b.u.h) delivering a Khutba saying, \"The first thing to be done on this day (first day of `Id ul Adha) is to pray; and after returning from the prayer we slaughter our sacrifices (in the name of Allah) and whoever does so, he acted according to our Sunna (traditions).\"\n\n', 'Haccac bize anlattı, Şu\'be bize anlattı, Zübeyd bana anlattı dedi, Şu\'bi\'yi işittim dedi, El-Berâ\'dan işittim dedi, Peygamber\'i işittim dedi, Allah\'ın duası ve selamı üzerinize olsun. üzerine hutbe vererek şöyle dedi: \"Bugünden itibaren namaza başlarsak, sonra dönüp kurban kesersek, o zaman kim bunu yaparsa bizim sünnetimize uymuş olur.\"', 'ہم سے حجاج بن منہال نے بیان کیا ، کہا کہ ہم سے شعبہ نے بیان کیا ، انہیں زبید بن حارث نے خبر دی ، انہوں نے کہا کہ میں نے شعبی سے سنا ، ان سے براء بن عازب رضی اللہ عنہ نے بیان کیا کہ میں نے نبی کریم صلی اللہ علیہ وسلم سے سنا ، آپ صلی اللہ علیہ وسلم نے عید کے دن خطبہ دیتے ہوئے فرمایا کہ پہلا کام جو ہم آج کے دن ( عید الاضحیٰ ) میں کرتے ہیں ، یہ ہے کہ پہلے ہم نماز پڑھیں پھر واپس آ کر قربانی کریں ۔ جس نے اس طرح کیا وہ ہمارے طریق پر چلا ۔\n', 'N/A', 'N/A', 'N/A', '1709041496', '2024-02-27 12:44:56', '2024-02-27 12:44:56'),
(22, '1709041562940', 'Abu Huraira', 'Sahih al-Bukhari', '1709040875634', 'حَدَّثَنَا أَبُو الْيَمَانِ، قَالَ أَخْبَرَنَا شُعَيْبٌ، قَالَ حَدَّثَنَا أَبُو الزِّنَادِ، أَنَّ عَبْدَ الرَّحْمَنِ بْنَ هُرْمُزَ الأَعْرَجَ، مَوْلَى رَبِيعَةَ بْنِ الْحَارِثِ حَدَّثَهُ أَنَّهُ، سَمِعَ أَبَا هُرَيْرَةَ ـ رضى الله عنه ـ أَنَّهُ سَمِعَ رَسُولَ اللَّهِ صلى الله عليه وسلم يَقُولُ ‏ \"‏ نَحْنُ الآخِرُونَ السَّابِقُونَ يَوْمَ الْقِيَامَةِ، بَيْدَ أَنَّهُمْ أُوتُوا الْكِتَابَ مِنْ قَبْلِنَا، ثُمَّ هَذَا يَوْمُهُمُ الَّذِي فُرِضَ عَلَيْهِمْ فَاخْتَلَفُوا فِيهِ، فَهَدَانَا اللَّهُ، فَالنَّاسُ لَنَا فِيهِ تَبَعٌ، الْيَهُودُ غَدًا وَالنَّصَارَى بَعْدَ غَدٍ ‏\"‏‏.‏\n', 'I heard Allah\'s Messenger (ﷺ) (p.b.u.h) saying, \"We (Muslims) are the last (to come) but (will be) the foremost on the Day of Resurrection though the former nations were given the Holy Scriptures before us. And this was their day (Friday) the celebration of which was made compulsory for them but they differed about it. So Allah gave us the guidance for it (Friday) and all the other people are behind us in this respect: the Jews\' (holy day is) tomorrow (i.e. Saturday) and the Christians\' (is) the day after tomorrow (i.e. Sunday).\"\n\n', 'Ebu el-Yaman bize şunu söyledi, dedi, Şuayb bize dedi, Ebu el-Zennad bize Rabi\'ah ibn el-Haris\'in müşterisi Abd al-Rahman ibn Hürmüz el-Araj\'ın daha sonra, Ebu Hureyre -Allah ondan râzı olsun-, Resûlullah -sallallahu aleyhi ve sellem-\'in şöyle dediğini işitmişti: \"Biz kıyamet günü öncekilerin sonuncularıyız, fakat onlara kitap verildi.\" Bizden önce bu, onların üzerine farz kılınan gündür ve o gün üzerinde ihtilafa düştüler, Allah bize hidâyet etti, o gün insanlar bizimdir, yarın Yahudileri, ertesi gün de Hıristiyanları takip edin.”', 'ہم سے ابو الیمان نے بیان کیا ، کہا کہ ہمیں شعیب نے خبر دی ، کہا کہ ہم سے ابوالزناد نے بیان کیا ، ان سے ربیعہ بن حارث کے غلام عبدالرحمٰن بن ہرمز اعرج نے بیان کیا کہ انہوں نے ابوہریرہ رضی اللہ عنہ سے سنا اور آپ رضی اللہ عنہ نے نبی کریم صلی اللہ علیہ وسلم سے سنا ، آپ نے فرمایا کہ ہم دنیا میں تمام امتوں کے بعد ہونے کے باوجود قیامت میں سب سے آگے رہیں گے فرق صرف یہ ہے کہ کتاب انہیں ہم سے پہلے دی گئی تھی ۔ یہی ( جمعہ ) ان کا بھی دن تھا جو تم پر فرض ہوا ہے ۔ لیکن ان کا اس کے بارے میں اختلاف ہوا اور اللہ تعالیٰ نے ہمیں یہ دن بتا دیا اس لیے لوگ اس میں ہمارے تابع ہوں گے ۔ یہود دوسرے دن ہوں گے اور نصاریٰ تیسرے دن ۔\n', 'N/A', 'N/A', 'N/A', '1709041562', '2024-02-27 12:46:02', '2024-02-27 12:46:02'),
(23, '1709041625886', '`Abdullah bin `Umar', 'Sahih al-Bukhari', '1709040875634', 'حَدَّثَنَا عَبْدُ اللَّهِ بْنُ يُوسُفَ، قَالَ أَخْبَرَنَا مَالِكٌ، عَنْ نَافِعٍ، عَنْ عَبْدِ اللَّهِ بْنِ عُمَرَ ـ رضى الله عنهما ـ أَنَّ رَسُولَ اللَّهِ صلى الله عليه وسلم قَالَ ‏ \"‏ إِذَا جَاءَ أَحَدُكُمُ الْجُمُعَةَ فَلْيَغْتَسِلْ ‏\"‏‏.‏\n', 'Allah\'s Messenger (ﷺ) (p.b.u.h) said, \"Anyone of you attending the Friday (prayers) should take a bath.\"\n\n', 'Abdullah bin Yusuf bize, Malik\'in Nafi\'den, Abdullah bin Ömer\'den -Allah her ikisinden de razı olsun- rivayet ettiğini söyledi: Resûlullah, Allah ona bereket versin ve ona selâmet versin, “Eğer gelirse, “Sizden biri Cuma namazını kılsın.”', 'ہم سے عبداللہ بن یوسف تنیسی نے بیان کیا ، انہوں نے کہا کہ ہمیں امام مالک نے نافع سے خبر دی اور ان کو حضرت عبداللہ بن عمر رضی اللہ عنہما نے کہ رسول اللہ صلی اللہ علیہ وسلم نے فرمایا کہ تم میں سے جب کوئی شخص جمعہ کی نماز کے لیے آنا چا ہے تو اسے غسل کر لینا چاہیے ۔\n', 'N/A', 'N/A', 'N/A', '1709041625', '2024-02-27 12:47:05', '2024-02-27 12:47:05'),
(24, '1709041745265', 'Ibn `Umar', 'Sahih al-Bukhari', '1709040875634', 'حَدَّثَنَا عَبْدُ اللَّهِ بْنُ مُحَمَّدِ بْنِ أَسْمَاءَ، قَالَ أَخْبَرَنَا جُوَيْرِيَةُ، عَنْ مَالِكٍ، عَنِ الزُّهْرِيِّ، عَنْ سَالِمِ بْنِ عَبْدِ اللَّهِ بْنِ عُمَرَ، عَنِ ابْنِ عُمَرَ ـ رضى الله عنهما ـ أَنَّ عُمَرَ بْنَ الْخَطَّابِ، بَيْنَمَا هُوَ قَائِمٌ فِي الْخُطْبَةِ يَوْمَ الْجُمُعَةِ إِذْ دَخَلَ رَجُلٌ مِنَ الْمُهَاجِرِينَ الأَوَّلِينَ مِنْ أَصْحَابِ النَّبِيِّ صلى الله عليه وسلم فَنَادَاهُ عُمَرُ أَيَّةُ سَاعَةٍ هَذِهِ قَالَ إِنِّي شُغِلْتُ فَلَمْ أَنْقَلِبْ إِلَى أَهْلِي حَتَّى سَمِعْتُ التَّأْذِينَ، فَلَمْ أَزِدْ أَنْ تَوَضَّأْتُ‏.‏ فَقَالَ وَالْوُضُوءُ أَيْضًا وَقَدْ عَلِمْتَ أَنَّ رَسُولَ اللَّهِ صلى الله عليه وسلم كَانَ يَأْمُرُ بِالْغُسْلِ‏.‏\n', 'While `Umar bin Al-Khattab was standing and delivering the sermon on a Friday, one of the companions of the Prophet, who was one of the foremost Muhajirs (emigrants) came. `Umar said to him, \"What is the time now?\" He replied, \"I was busy and could not go back to my house till I heard the Adhan. I did not perform more than the ablution.\" Thereupon `Umar said to him, \"Did you perform only the ablution although you know that Allah\'s Messenger (ﷺ) (p.b.u.h) used to order us to take a bath (on Fridays)?\"\n\n', 'Abdullah bin Muhammed bin Esma bize anlattı, dedi ki, Cüveyriye bize Malik\'ten, Zühri\'den, Salem bin Abdullah bin Ömer\'den, İbn Ömer\'den rivayetle haber verdi. Allah her ikisinden de razı olsun - Cuma günü Ömer ibn el-Hattab hutbe okurken, Peygamber Efendimiz\'in ashabından ilk muhacirlerden bir adam Allah ondan razı olsun ve ona huzur versin. Bunun üzerine Ömer onu çağırdı: \"Saat kaç?\" dedi, \"Meşguldüm, ezan sesini duyana kadar ailemin yanına dönmedim. Ayrıca abdest aldım. \"Abdest de, sen bilirsin\" dedi. Resûlullah -sallallahu aleyhi ve sellem- abdest almayı emrederdi.\"', 'ہم سے عبداللہ بن محمد بن اسماء نے بیان کیا ، انہوں نے کہا کہ ہم سے جویریہ بن اسماء نے امام مالک سے بیان کیا ، ان سے زہری نے ، ان سے سالم بن عبداللہ بن عمر رضی اللہ عنہما نے ان سے ابن عمر رضی اللہ عنہما نے کہ عمر بن خطاب رضی اللہ عنہ جمعہ کے دن کھڑے خطبہ دے رہے تھے کہ اتنے میں نبی کریم صلی اللہ علیہ وسلم کے اگلے صحابہ مہاجرین میں سے ایک بزرگ تشریف لائے ( یعنی حضرت عثمان رضی اللہ عنہ ) عمر رضی اللہ عنہ نے ان سے کہا بھلا یہ کون سا وقت ہے انہوں نے فرمایا کہ میں مشغول ہو گیا تھا اور گھر واپس آتے ہی اذان سنی ، اس لیے میں وضو سے زیادہ اور کچھ ( غسل ) نہ کر سکا ۔ حضرت عمر رضی اللہ عنہ نے فرمایا کہ وضو بھی اچھا ہے ۔ حالانکہ آپ کو معلوم ہے کہ نبی کریم صلی اللہ علیہ وسلم غسل کے لیے فرماتے تھے ۔\n', 'N/A', 'N/A', 'N/A', '1709041745', '2024-02-27 12:49:05', '2024-02-27 12:49:05'),
(25, '1709041795901', 'Abu Sa`id Al-Khudri', 'Sahih al-Bukhari', '1709040875634', 'حَدَّثَنَا عَبْدُ اللَّهِ بْنُ يُوسُفَ، قَالَ أَخْبَرَنَا مَالِكٌ، عَنْ صَفْوَانَ بْنِ سُلَيْمٍ، عَنْ عَطَاءِ بْنِ يَسَارٍ، عَنْ أَبِي سَعِيدٍ الْخُدْرِيِّ ـ رضى الله عنه ـ أَنَّ رَسُولَ اللَّهِ صلى الله عليه وسلم قَالَ ‏ \"‏ غُسْلُ يَوْمِ الْجُمُعَةِ وَاجِبٌ عَلَى كُلِّ مُحْتَلِمٍ ‏\"‏‏.‏\n', 'Allah\'s Messenger (ﷺ) (p.b.u.h) said, \"The taking of a bath on Friday is compulsory for every male (Muslim) who has attained the age of puberty.\"\n\n', 'Abdullah bin Yusuf bize, Malik\'in Safvan bin Süleym\'den, Ata\' bin Yesar\'dan, Ebu Sa\'id el-Hudri\'den (Allah ondan razı olsun) rivayetle şöyle söylediğini anlattı: Resûlullah sallallahu aleyhi ve sellem, \"Cuma günü gusül, her ergene farzdır.\" buyurmuştur.', 'ہم سے عبداللہ بن یوسف نے حدیث بیان کی ، انہوں نے کہا کہ ہمیں مالک نے صفوان بن سلیم کے واسطہ سے خبر دی ، انہیں عطاء بن یسار نے ، انہیں حضرت ابو سعید خدری رضی اللہ عنہ نے کہ رسول اللہ صلی اللہ علیہ وسلم نے فرمایا کہ جمعہ کے دن ہر بالغ کے لیے غسل ضروری ہے ۔\n', 'N/A', 'N/A', 'N/A', '1709041795', '2024-02-27 12:49:55', '2024-02-27 12:49:55'),
(26, '1709042067986', ' Abdullah bin Mas`ud', 'Sahih al-Bukhari', '1709041859897', 'حَدَّثَنَا مُحَمَّدُ بْنُ بَشَّارٍ، قَالَ حَدَّثَنَا غُنْدَرٌ، قَالَ حَدَّثَنَا شُعْبَةُ، عَنْ أَبِي إِسْحَاقَ، قَالَ سَمِعْتُ الأَسْوَدَ، عَنْ عَبْدِ اللَّهِ ـ رضى الله عنه ـ قَالَ قَرَأَ النَّبِيُّ صلى الله عليه وسلم النَّجْمَ بِمَكَّةَ فَسَجَدَ فِيهَا، وَسَجَدَ مَنْ مَعَهُ، غَيْرَ شَيْخٍ أَخَذَ كَفًّا مِنْ حَصًى أَوْ تُرَابٍ فَرَفَعَهُ إِلَى جَبْهَتِهِ وَقَالَ يَكْفِينِي هَذَا‏.‏ فَرَأَيْتُهُ بَعْدَ ذَلِكَ قُتِلَ كَافِرًا‏.‏\n', 'The Prophet (ﷺ) recited Suratan-Najm (103) at Mecca and prostrated while reciting it and those who were with him did the same except an old man who took a handful of small stones or earth and lifted it to his forehead and said, \"This is sufficient for me.\" Later on, I saw him killed as a non-believer.\n\n', 'Muhammed bin Beşar bize anlattı, dedi, Gandar bize anlattı, dedi, Şu\'be bize Ebu İshak\'tan rivayet etti, dedi ki, Esved\'i Abdullah\'tan -Allah razı olsun- duydum. ondan memnun kaldı - dedi ki, Peygamber (s.a.v.) Mekke\'de yıldızı okudu ve orada secde etti, bir avuç çakıl veya toprak alan yaşlı bir adam dışında onunla birlikte olanlar da secde etti, sonra kaldırdı. alnına götürdü ve şöyle dedi: \"Bu bana yeter.\" Bundan sonra onu kâfir olarak öldürüldüğünü gördüm.', 'ہم سے محمد بن بشار نے بیان کیا ، کہا کہ ہم سے غندر محمد بن جعفر نے بیان کیا کہا کہ ہم سے شعبہ نے بیان کیا اور ان سے ابواسحاق نے انہوں نے کہا کہ میں نے اسود سے سنا انہوں نے عبداللہ بن مسعود رضی اللہ عنہما سے کہ مکہ میں نبی کریم صلی اللہ علیہ وسلم نے سورۃ النجم کی تلاوت کی اور سجدہ تلاوت کیا آپ صلی اللہ علیہ وسلم کے پاس جتنے آدمی تھے ( مسلمان اور کافر ) ان سب نے بھی آپ صلی اللہ علیہ وسلم کے ساتھ سجدہ کیا البتہ ایک بوڑھا شخص ( امیہ بن خلف ) اپنے ہاتھ میں کنکری یا مٹی اٹھا کر اپنی پیشانی تک لے گیا اور کہا میرے لیے یہی کافی ہے میں نے دیکھا کہ بعد میں وہ بوڑھا حالت کفر میں ہی مارا گیا ۔\n', 'N/A', 'N/A', 'N/A', '1709042067', '2024-02-27 12:54:28', '2024-02-27 12:54:28'),
(27, '1709042117424', 'Abu Huraira', 'Sahih al-Bukhari', '1709041859897', 'حَدَّثَنَا مُحَمَّدُ بْنُ يُوسُفَ، حَدَّثَنَا سُفْيَانُ، عَنْ سَعْدِ بْنِ إِبْرَاهِيمَ، عَنْ عَبْدِ الرَّحْمَنِ، عَنْ أَبِي هُرَيْرَةَ ـ رضى الله عنه ـ قَالَ كَانَ النَّبِيُّ صلى الله عليه وسلم يَقْرَأُ فِي الْجُمُعَةِ فِي صَلاَةِ الْفَجْرِ ‏{‏الم * تَنْزِيلُ‏}‏ السَّجْدَةَ وَ‏{‏هَلْ أَتَى عَلَى الإِنْسَانِ‏}‏\n', 'On Fridays the Prophet (ﷺ) used to recite Alif Lam Mim Tanzil-As-Sajda (in the first rak`a) and Hal ata `alal-insani i.e. Surat ad-Dahr (LXXVI) (in the second rak`a), in the Fajr prayer.\n\n', 'Muhammed ibn Yusuf bize anlattı, Süfyan bize Saad ibn İbrahim\'den, Abdul Rahman\'dan, Ebu Hureyre\'den -Allah ondan razı olsun- şöyle dedi: Peygamber, Allah\'ın duası olsun. Cuma günü sabah namazında secdeyi {Me\'am\'ı açığa vuran} ve {İnsanın üzerine geldi mi?} okurdu.', 'ہم سے محمد بن یوسف فریابی نے بیان کیا ، انہوں نے کہا کہ ہم سے سفیان ثوری نے بیان کیا ، انہوں نے سعد بن ابراہیم بن عبدالرحمٰن بن عوف سے بیان کیا ، ان سے عبدالرحمٰن بن ہرمز اعرج نے ، ان سے ابوہریرہ رضی اللہ عنہ نے کہ نبی کریم صلی اللہ علیہ وسلم جمعہ کے دن فجر کی نماز میں «الم تنزيل‏ السجدة» اور «هل أتى على الإنسان‏» ( سورۃ دھر ) پڑھا کرتے تھے ۔\n', 'N/A', 'N/A', 'N/A', '1709042117', '2024-02-27 12:55:17', '2024-02-27 12:55:17'),
(28, '1709042157894', 'Ibn `Abbas', 'Sahih al-Bukhari', '1709041859897', 'حَدَّثَنَا سُلَيْمَانُ بْنُ حَرْبٍ، وَأَبُو النُّعْمَانِ، قَالاَ حَدَّثَنَا حَمَّادٌ، عَنْ أَيُّوبَ، عَنْ عِكْرِمَةَ، عَنِ ابْنِ عَبَّاسٍ ـ رضى الله عنهما ـ قَالَ ‏{‏ص‏}‏ لَيْسَ مِنْ عَزَائِمِ السُّجُودِ، وَقَدْ رَأَيْتُ النَّبِيَّ صلى الله عليه وسلم يَسْجُدُ فِيهَا‏.‏\n', 'The prostration of Sa`d is not a compulsory one but I saw the Prophet (ﷺ) prostrating while reciting it.\n\n', 'Süleyman bin Harb ve Ebu Numan bize anlattılar, Hammad\'ın bize Eyüp\'ten, İkrime\'den, İbn Abbas\'tan -Allah her ikisinden de razı olsun- rivayet ettiğini söylediler. Secde direkleri ve Peygamber sallallahu aleyhi ve sellem\'i orada secde ederken gördüm.', 'ہم سے سلیمان بن حرب اور ابوالنعمان بن فضل نے بیان کیا ، ان دونوں نے کہا کہ ہم سے حماد بن زید نے بیان کیا ، ان سے ایوب نے بیان کیا ، ان سے عکرمہ نے بیان کیا اور ان سے حضرت عبداللہ بن عباس رضی اللہ عنہما نے فرمایا کہ سورۃ ص کا سجدہ کچھ تاکیدی سجدوں میں سے نہیں ہے اور میں نے نبی کریم صلی اللہ علیہ وسلم کو سجدہ کرتے ہوئے دیکھا ۔\n', 'N/A', 'N/A', 'N/A', '1709042157', '2024-02-27 12:55:57', '2024-02-27 12:55:57'),
(29, '1709042224400', 'Abdullah bin Mas`ud', 'Sahih al-Bukhari', '1709041859897', 'حَدَّثَنَا حَفْصُ بْنُ عُمَرَ، قَالَ حَدَّثَنَا شُعْبَةُ، عَنْ أَبِي إِسْحَاقَ، عَنِ الأَسْوَدِ، عَنْ عَبْدِ اللَّهِ ـ رضى الله عنه ـ أَنَّ النَّبِيَّ صلى الله عليه وسلم قَرَأَ سُورَةَ النَّجْمِ فَسَجَدَ بِهَا، فَمَا بَقِيَ أَحَدٌ مِنَ الْقَوْمِ إِلاَّ سَجَدَ، فَأَخَذَ رَجُلٌ مِنَ الْقَوْمِ كَفًّا مِنْ حَصًى أَوْ تُرَابٍ، فَرَفَعَهُ إِلَى وَجْهِهِ وَقَالَ يَكْفِينِي هَذَا، فَلَقَدْ رَأَيْتُهُ بَعْدُ قُتِلَ كَافِرًا‏.‏\n', 'The Prophet (ﷺ) recited Surat-an-Najm (53) and prostrated while reciting it and all the people prostrated and a man amongst the people took a handful of stones or earth and raised it to his face and said, \"This is sufficient for me. Later on I saw him killed as a non-believer.\"\n\n', 'Hafs bin Ömer bize şöyle dedi: Şu\'be bize Ebu İshak\'tan, Esved\'den, Abdullah -Allah ondan razı olsun-\'dan rivayetle şöyle dedi: Peygamber (sallallahu aleyhi vesellem) Necm Suresi\'ni okudu, onunla secde etti, insanlardan tek bir kişi bile kalmadı, ancak secde etti, kavimden bir adam bir avuç çakıl veya toprak aldı, sonra onu yüzüne kaldırdı ve şöyle dedi: , \"Bu bana yeter. Onu kâfir olarak öldürüldükten sonra gördüm.\"', 'ہم سے حفص بن عمر نے بیان کیا ، کہا کہ ہم سے شعبہ نے ، ابواسحاق سے بیان کیا ، ان سے اسود نے ، ان سے عبداللہ بن مسعود رضی اللہ عنہما نے کہ نبی کریم صلی اللہ علیہ وسلم نے سورۃ النجم کی تلاوت کی اور اس میں سجدہ کیا اس وقت قوم کا کوئی فرد ( مسلمان اور کافر ) بھی ایسا نہ تھا جس نے سجدہ نہ کیا ہو ۔ البتہ ایک شخص ( امیہ بن خلف ) نے ہاتھ میں کنکری یا مٹی لے کر اپنے چہرہ تک اٹھائی اور کہا کہ میرے لیے یہی کافی ہے ۔ عبداللہ بن مسعود رضی اللہ عنہما نے کہا کہ بعد میں میں نے دیکھا کہ وہ کفرکی حالت ہی میں قتل ہوا ۔\n', 'N/A', 'N/A', 'N/A', '1709042224', '2024-02-27 12:57:04', '2024-02-27 12:57:04'),
(30, '1709042264598', 'Ibn `Abbas', 'Sahih al-Bukhari', '1709041964802', 'حَدَّثَنَا عَلِيُّ بْنُ عَبْدِ اللَّهِ، قَالَ حَدَّثَنَا سُفْيَانُ، قَالَ حَدَّثَنَا سُلَيْمَانُ بْنُ أَبِي مُسْلِمٍ، عَنْ طَاوُسٍ، سَمِعَ ابْنَ عَبَّاسٍ ـ رضى الله عنهما ـ قَالَ كَانَ النَّبِيُّ صلى الله عليه وسلم إِذَا قَامَ مِنَ اللَّيْلِ يَتَهَجَّدُ قَالَ ‏\"‏ اللَّهُمَّ لَكَ الْحَمْدُ أَنْتَ قَيِّمُ السَّمَوَاتِ وَالأَرْضِ وَمَنْ فِيهِنَّ وَلَكَ الْحَمْدُ، لَكَ مُلْكُ السَّمَوَاتِ وَالأَرْضِ وَمَنْ فِيهِنَّ، وَلَكَ الْحَمْدُ أَنْتَ نُورُ السَّمَوَاتِ وَالأَرْضِ، وَلَكَ الْحَمْدُ أَنْتَ الْحَقُّ، وَوَعْدُكَ الْحَقُّ، وَلِقَاؤُكَ حَقٌّ، وَقَوْلُكَ حَقٌّ، وَالْجَنَّةُ حَقٌّ، وَالنَّارُ حَقٌّ، وَالنَّبِيُّونَ حَقٌّ، وَمُحَمَّدٌ صلى الله عليه وسلم حَقٌّ، وَالسَّاعَةُ حَقٌّ، اللَّهُمَّ لَكَ أَسْلَمْتُ، وَبِكَ آمَنْتُ وَعَلَيْكَ تَوَكَّلْتُ، وَإِلَيْكَ أَنَبْتُ، وَبِكَ خَاصَمْتُ، وَإِلَيْكَ حَاكَمْتُ، فَاغْفِرْ لِي مَا قَدَّمْتُ وَمَا أَخَّرْتُ، وَمَا أَسْرَرْتُ وَمَا أَعْلَنْتُ، أَنْتَ الْمُقَدِّمُ وَأَنْتَ الْمُؤَخِّرُ، لاَ إِلَهَ إِلاَّ أَنْتَ ـ أَوْ لاَ إِلَهَ غَيْرُكَ ـ ‏\"‏‏.‏ قَالَ سُفْيَانُ وَزَادَ عَبْدُ الْكَرِيمِ أَبُو أُمَيَّةَ ‏\"‏ وَلاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللَّهِ ‏\"‏‏.‏ قَالَ سُفْيَانُ قَالَ سُلَيْمَانُ بْنُ أَبِي مُسْلِمٍ سَمِعَهُ مِنْ طَاوُسٍ عَنِ ابْنِ عَبَّاسٍ ـ رضى الله عنهما ـ عَنِ النَّبِيِّ صلى الله عليه وسلم‏.‏\n', 'When the Prophet (ﷺ) got up at night to offer the Tahajjud prayer, he used to say: Allahumma lakal-hamd. Anta qaiyyimus-samawati wal-ard wa man fihinna. Walakal-hamd, Laka mulkus-samawati wal-ard wa man fihinna. Walakal-hamd, anta nurus-samawati wal-ard. Wa lakal-hamd, anta-l-haq wa wa\'duka-lhaq, wa liqa\'uka Haq, wa qauluka Haq, wal-jannatu Han wan-naru Haq wannabiyuna Haq. Wa Muhammadun, sallal-lahu\'alaihi wasallam, Haq, was-sa\'atu Haq. Allahumma aslamtu Laka wabika amantu, wa \'Alaika tawakkaltu, wa ilaika anabtu wa bika khasamtu, wa ilaika hakamtu faghfir li ma qaddamtu wama akh-khartu wama as-rartu wama\'a lantu, anta-l-muqaddim wa anta-l-mu akh-khir, la ilaha illa anta (or la ilaha ghairuka). (O Allah! All the praises are for you, You are the Holder of the Heavens and the Earth, And whatever is in them. All the praises are for You; You have the possession of the Heavens and the Earth And whatever is in them. All the praises are for You; You are the Light of the Heavens and the Earth And all the praises are for You; You are the King of the Heavens and the Earth; And all the praises are for You; You are the Truth and Your Promise is the truth, And to meet You is true, Your Word is the truth And Paradise is true And Hell is true And all the Prophets (Peace be upon them) are true; And Muhammad is true, And the Day of Resurrection is true. O Allah ! I surrender (my will) to You; I believe in You and depend on You. And repent to You, And with Your help I argue (with my opponents, the non-believers) And I take You as a judge (to judge between us). Please forgive me my previous And future sins; And whatever I concealed or revealed And You are the One who make (some people) forward And (some) backward. There is none to be worshipped but you . Sufyan said that `Abdul Karim Abu Umaiya added to the above, \'Wala haula Wala quwata illa billah\' (There is neither might nor power except with Allah).\n\n', 'Ali bin Abdullah bize anlattı, dedi, Süfyan bize anlattı, dedi, Süleyman bin Ebu Müslim bize anlattı, Tavus\'tan rivayet etti, İbni Abbas -Allah her ikisinden de râzı olsun- şöyle derken işitti: Hz. Allah\'ın salat ve selamı üzerine olsun, geceleyin kalktı ve şöyle dedi: \"Allah\'ım, hamd sana mahsustur, sen göklerin sahibisin.\" Yer ve onlarda bulunanlar ve hamd sanadır. Göklerin, yerin ve bunlarda bulunanların mülkü sanadır, hamd sanadır, sen göklerin ve yerin nurusun, hamd sanadır, sen haksın, vaadin sanadır. Haktır, sana kavuşmak haktır, sözlerin haktır, Cennet haktır, Cehennem haktır, peygamberler haktır ve Muhammed (s.a.v.) Haktır, kıyamet de haktır, Allah\'ım, sana teslim oldum, sana inandım, sana tevekkül ettim, sana tevbe ettim, sana karşı ihtilafa düştüm ve sana tövbe ettim. Hüküm verdim, yaptıklarımı ve yanlışlarımı bağışla, görmedim, gizlemedim, duyurmadım, sen ilerisin, sen gecikensin, senden başka ilah yoktur. -ya da senden başka ilah yoktur-\" diyen Süfyan, Abdulkerim Ebu Ümeyye de şunu ekledi: \"Allah\'tan başka güç ve kuvvet yoktur.\" İbn Abbas\'ın -Allah her ikisinden de razı olsun- Peygamber Efendimiz\'in (s.a.v.) rivayetine göre, Allah ondan razı olsun ve ona huzur versin.', 'ہم سے علی بن عبداللہ مدینی نے بیان کیا ، کہا کہ ہم سے سفیان بن عیینہ نے بیان کیا ، کہا کہ ہم سے سلیمان بن ابی مسلم نے بیان کیا ، ان سے طاؤس نے اور انہوں نے ابن عباس رضی اللہ عنہما سے سنا کہ رسول اللہ صلی اللہ علیہ وسلم جب رات میں تہجد کے لیے کھڑے ہوتے تو یہ دعا پڑھتے ۔ «اللهم لك الحمد أنت قيم السموات والأرض ومن فيهن ولك الحمد ،‏‏‏‏ ‏‏‏‏ لك ملك السموات والأرض ومن فيهن ،‏‏‏‏ ‏‏‏‏ ولك الحمد أنت نور السموات والأرض ،‏‏‏‏ ‏‏‏‏ ولك الحمد أنت الحق ،‏‏‏‏ ‏‏‏‏ ووعدك الحق ،‏‏‏‏ ‏‏‏‏ ولقاؤك حق ،‏‏‏‏ ‏‏‏‏ وقولك حق ،‏‏‏‏ ‏‏‏‏ والجنة حق ،‏‏‏‏ ‏‏‏‏ والنار حق ،‏‏‏‏ ‏‏‏‏ والنبيون حق ،‏‏‏‏ ‏‏‏‏ ومحمد صلى الله عليه وسلم حق ،‏‏‏‏ ‏‏‏‏ والساعة حق ،‏‏‏‏ ‏‏‏‏ اللهم لك أسلمت ،‏‏‏‏ ‏‏‏‏ وبك آمنت وعليك توكلت ،‏‏‏‏ ‏‏‏‏ وإليك أنبت ،‏‏‏‏ ‏‏‏‏ وبك خاصمت ،‏‏‏‏ ‏‏‏‏ وإليك حاكمت ،‏‏‏‏ ‏‏‏‏ فاغفر لي ما قدمت وما أخرت ،‏‏‏‏ ‏‏‏‏ وما أسررت وما أعلنت ،‏‏‏‏ ‏‏‏‏ أنت المقدم وأنت المؤخر ،‏‏‏‏ ‏‏‏‏لا إله إلا أنت ، لا إله غيرك» ( ترجمہ ) ” اے میرے اللہ ! ہر طرح کی تعریف تیرے ہی لیے زیبا ہے ، تو آسمان اور زمین اور ان میں رہنے والی تمام مخلوق کا سنبھالنے والا ہے اور حمد تمام کی تمام بس تیرے ہی لیے مناسب ہے آسمان اور زمین اور ان کی تمام مخلوقات پر حکومت صرف تیرے ہی لیے ہے اور تعریف تیرے ہی لیے ہے ، تو آسمان اور زمین کا نور ہے اور تعریف تیرے ہی لیے زیبا ہے ، تو سچا ہے ، تیرا وعدہ سچا ، تیری ملاقات سچی ، تیرا فرمان سچا ہے ، جنت سچ ہے ، دوزخ سچ ہے ، انبیاء سچے ہیں ۔ محمد صلی اللہ علیہ وسلم سچے ہیں اور قیامت کا ہونا سچ ہے ۔ اے میرے اللہ ! میں تیرا ہی فرماں بردار ہوں اور تجھی پر ایمان رکھتا ہوں ، تجھی پر بھروسہ ہے ، تیری ہی طرف رجوع کرتا ہوں ، تیرے ہی عطا کئے ہوئے دلائل کے ذریعہ بحث کرتا ہوں اور تجھی کو حکم بناتا ہوں ۔ پس جو خطائیں مجھ سے پہلے ہوئیں اور جو بعد میں ہوں گی ان سب کی مغفرت فرما ، خواہ وہ ظاہر ہوئی ہوں یا پوشیدہ ۔ آگے کرنے والا اور پیچھے رکھنے والا تو ہی ہے ۔ معبود صرف تو ہی ہے ۔ یا ( یہ کہا کہ ) تیرے سوا کوئی معبود نہیں “ ۔ ابوسفیان نے بیان کیا کہ عبدالکریم ابوامیہ نے اس دعا میں یہ زیادتی کی ہے ( «لا حول ولا قوة إلا بالله» ) سفیان نے بیان کیا کہ سلیمان بن مسلم نے طاؤس سے یہ حدیث سنی تھی ، انہوں نے حضرت عبداللہ بن عباس رضی اللہ عنہما سے اور انہوں نے نبی کریم صلی اللہ علیہ وسلم سے ۔\n', 'N/A', 'N/A', 'N/A', '1709042264', '2024-02-27 12:57:44', '2024-02-27 12:57:44'),
(31, '1709042315497', 'Salim\'s father', 'Sahih al-Bukhari', '1709041964802', 'حَدَّثَنَا عَبْدُ اللَّهِ بْنُ مُحَمَّدٍ، قَالَ حَدَّثَنَا هِشَامٌ، قَالَ أَخْبَرَنَا مَعْمَرٌ،‏.‏ وَحَدَّثَنِي مَحْمُودٌ، قَالَ حَدَّثَنَا عَبْدُ الرَّزَّاقِ، قَالَ أَخْبَرَنَا مَعْمَرٌ، عَنِ الزُّهْرِيِّ، عَنْ سَالِمٍ، عَنْ أَبِيهِ ـ رضى الله عنه ـ قَالَ كَانَ الرَّجُلُ فِي حَيَاةِ النَّبِيِّ صلى الله عليه وسلم إِذَا رَأَى رُؤْيَا قَصَّهَا عَلَى رَسُولِ اللَّهِ صلى الله عليه وسلم فَتَمَنَّيْتُ أَنْ أَرَى رُؤْيَا فَأَقُصَّهَا عَلَى رَسُولِ اللَّهِ صلى الله عليه وسلم وَكُنْتُ غُلاَمًا شَابًّا، وَكُنْتُ أَنَامُ فِي الْمَسْجِدِ عَلَى عَهْدِ رَسُولِ اللَّهِ صلى الله عليه وسلم فَرَأَيْتُ فِي النَّوْمِ كَأَنَّ مَلَكَيْنِ أَخَذَانِي فَذَهَبَا بِي إِلَى النَّارِ فَإِذَا هِيَ مَطْوِيَّةٌ كَطَىِّ الْبِئْرِ، وَإِذَا لَهَا قَرْنَانِ، وَإِذَا فِيهَا أُنَاسٌ قَدْ عَرَفْتُهُمْ فَجَعَلْتُ أَقُولُ أَعُوذُ بِاللَّهِ مِنَ النَّارِ ـ قَالَ ـ فَلَقِيَنَا مَلَكٌ آخَرُ فَقَالَ لِي لَمْ تُرَعْ‏.‏ فَقَصَصْتُهَا عَلَى حَفْصَةَ فَقَصَّتْهَا حَفْصَةُ عَلَى رَسُولِ اللَّهِ صلى الله عليه وسلم فَقَالَ ‏ \"‏ نِعْمَ الرَّجُلُ عَبْدُ اللَّهِ، لَوْ كَانَ يُصَلِّي مِنَ اللَّيْلِ ‏\"‏‏.‏ فَكَانَ بَعْدُ لاَ يَنَامُ مِنَ اللَّيْلِ إِلاَّ قَلِيلاً‏.‏\n', 'In the lifetime of the Prophet (ﷺ) whosoever saw a dream would narrate it to Allah\'s Messenger (ﷺ). I had a wish of seeing a dream to narrate it to Allah\'s Messenger (ﷺ) (p.b.u.h) I was a grown up boy and used to sleep in the Mosque in the lifetime of the Prophet. I saw in the dream that two angels caught hold of me and took me to the Fire which was built all round like a built well and had two poles in it and the people in it were known to me. I started saying, \"I seek refuge with Allah from the Fire.\" Then I met another angel who told me not to be afraid. I narrated the dream to Hafsa who told it to Allah\'s Messenger (ﷺ). The Prophet said, \"Abdullah is a good man. I wish he prayed Tahajjud.\" After that `Abdullah (i.e. Salim\'s father) used to sleep but a little at night.\n\n', 'Abdullah bin Muhammed bize anlattı, Hişam bize anlattı, Muammer bize söyledi, Mahmud bana anlattı, Abdulrezzak bize anlattı, Murr ile birlikte bize anlattı dedi, ez-Zuhri\'den, şöyle dedi: Salim, babasından -Allah ondan razı olsun- rivayet ettiğine göre, Peygamber Efendimiz (sav)\'in sağlığında, Allah ona salat ve selam versin, onun üzerinde bir adamdı, bir rüya gördüğünde şöyle demiştir: Bunu Resûlullah\'a (s.a.v.) gönderdim. Bir rüya görüp onu Resûlullah (s.a.v.)\'e anlatmak istedim, Allah ona salat ve selam versin. Ben genç bir çocuktum ve ben de öyleydim. Resûlullah -sallallahu aleyhi ve sellem-\'in saltanatı döneminde mesciddeydim ve uykumda sanki iki meleğin beni alıp ateşe götürdüğünü gördüm. bir kuyunun kıvrımları vardı ve işte iki boynuzu vardı ve işte içinde tanıdığım insanlar vardı ve ben ateşten Allah\'a sığınırım demeye başladım. - Sonra başka bir melekle karşılaştık ve o şöyle dedi: Ben de bunu Hafsa\'ya anlattım, Hafsa da bunu Resûlullah -sallallahu aleyhi ve sellem-\'e anlattı, o da şöyle dedi: \"Abdullah ne güzel adamdı, ne kadar da güzel bir insandı. Geceleri ibadet ederdi.\" Ancak gecenin çok az bir kısmı dışında uyumadı.', 'ہم سے عبداللہ بن محمد مسندی نے بیان کیا ، انہوں نے کہا کہ ہم سے ہشام بن یوسف صنعانی نے بیان کیا ، انہوں نے کہا کہ ہم سے معمر نے حدیث بیان کی ( دوسری سند ) اور مجھ سے محمود بن غیلان نے بیان کیا ، انہوں نے کہا کہ ہم سے عبدالرزاق نے بیان کیا ۔ انہوں نے کہا کہ ہمیں معمر نے خبر دی ، انہیں زہری نے ، انہیں سالم نے ، انہیں ان کے باپ عبداللہ بن عمر رضی اللہ عنہما نے بتایا کہ نبی کریم صلی اللہ علیہ وسلم کی زندگی میں جب کوئی خواب دیکھتا تو آپ صلی اللہ علیہ وسلم سے بیان کرتا ( آپ صلی اللہ علیہ وسلم تعبیر دیتے ) میرے بھی دل میں یہ خواہش پیدا ہوئی کہ میں بھی کوئی خواب دیکھتا اور آپ صلی اللہ علیہ وسلم سے بیان کرتا ، میں ابھی نوجوان تھا اور آپ صلی اللہ علیہ وسلم کے زمانہ میں مسجد میں سوتا تھا ۔ چنانچہ میں نے خواب میں دیکھا کہ دو فرشتے مجھے پکڑ کر دوزخ کی طرف لے گئے ۔ میں نے دیکھا کہ دوزخ پر کنویں کی طرح بندش ہے ( یعنی اس پر کنویں کی سی منڈیر بنی ہوئی ہے ) اس کے دو جانب تھے ۔ دوزخ میں بہت سے ایسے لوگوں کو دیکھا جنہیں میں پہچانتا تھا ۔ میں کہنے لگا دوزخ سے خدا کی پناہ ! انہوں نے بیان کیا کہ پھر ہم کو ایک فرشتہ ملا اور اس نے مجھ سے کہا ڈرو نہیں ۔ یہ خواب میں نے ( اپنی بہن ) حضرت حفصہ رضی اللہ عنہا کو سنایا اور انہوں نے رسول اللہ صلی اللہ علیہ وسلم کو ۔ تعبیر میں آپ صلی اللہ علیہ وسلم نے فرمایا کہ عبداللہ بہت خوب لڑکا ہے ۔ کاش رات میں نماز پڑھا کرتا ۔ ( راوی نے کہا کہ آپ کے اس فرمان کے بعد ) عبداللہ بن عمر رضی اللہ عنہما رات میں بہت کم سوتے تھے ( زیادہ عبادت ہی کرتے رہتے ) ۔\n', 'N/A', 'N/A', 'N/A', '1709042315', '2024-02-27 12:58:35', '2024-02-27 12:58:35'),
(32, '1709042349110', 'Aisha', 'Sahih al-Bukhari', '1709041964802', 'حَدَّثَنَا أَبُو الْيَمَانِ، قَالَ أَخْبَرَنَا شُعَيْبٌ، عَنِ الزُّهْرِيِّ، قَالَ أَخْبَرَنِي عُرْوَةُ، أَنَّ عَائِشَةَ ـ رضى الله عنها ـ أَخْبَرَتْهُ أَنَّ رَسُولَ اللَّهِ صلى الله عليه وسلم كَانَ يُصَلِّي إِحْدَى عَشْرَةَ رَكْعَةً، كَانَتْ تِلْكَ صَلاَتَهُ، يَسْجُدُ السَّجْدَةَ مِنْ ذَلِكَ قَدْرَ مَا يَقْرَأُ أَحَدُكُمْ خَمْسِينَ آيَةً قَبْلَ أَنْ يَرْفَعَ رَأْسَهُ، وَيَرْكَعُ رَكْعَتَيْنِ قَبْلَ صَلاَةِ الْفَجْرِ، ثُمَّ يَضْطَجِعُ عَلَى شِقِّهِ الأَيْمَنِ حَتَّى يَأْتِيَهُ الْمُنَادِي لِلصَّلاَةِ‏.‏\n', 'Allah\'s Messenger (ﷺ) used to offer eleven rak`at and that was his prayer. He used to prolong the prostration to such an extent that one could recite fifty verses (of the Qur\'an) before he would lift his head. He used to pray two rak`at (Sunna) before the Fajr prayer and then used to lie down on his right side till the call-maker came and informed him about the prayer.\n\n', 'Ebu\'l-Yaman bize şunu söyledi, dedi, Şuayb bize ez-Zuhri\'den rivayet etti, dedi ki, Urve bana dedi ki, Aişe -Allah ondan razı olsun- ona Allah\'ın Elçisi, Allah\'ın duası üzerine olsun dedi. Allah\'ın selamı üzerine olsun, on bir rek\'at namaz kılardı. Bu onun namazıydı. Sizden birinin elli ayet okuduğu kadar secde ederdi. Başını kaldırmadan önce sabah namazından önce iki rek\'at diz çöker, sonra Kendisine dua etmeye çağıran gelinceye kadar sağ yanı üzerine yatar.', 'ہم سے ابو الیمان نے بیان کیا ، انہوں نے کہا کہ ہمیں شعیب نے زہری سے خبر دی ، انہوں نے کہا کہ مجھے عروہ نے خبر دی اور انہیں ام المؤمنین حضرت عائشہ صدیقہ رضی اللہ عنہا نے خبر دی کہ رسول اللہ صلی اللہ علیہ وسلم ( رات میں ) گیارہ رکعتیں پڑھتے تھے ۔ آپ صلی اللہ علیہ وسلم کی یہی نماز تھی ۔ لیکن اس کے سجدے اتنے لمبے ہوا کرتے کہ تم میں سے کوئی نبی کریم صلی اللہ علیہ وسلم کے سر اٹھانے سے قبل پچاس آیتیں پڑھ سکتا تھا ( اور طلوع فجر ہونے پر ) فجر کی نماز سے پہلے آپ صلی اللہ علیہ وسلم دو رکعت سنت پڑھتے ۔ اس کے بعد دائیں پہلو پر لیٹ جاتے ۔ آخر مؤذن آپ صلی اللہ علیہ وسلم کو نماز کے لیے بلانے آتا ۔\n', 'N/A', 'N/A', 'N/A', '1709042349', '2024-02-27 12:59:09', '2024-02-27 12:59:09'),
(33, '1709042408244', 'Jundab', 'Sahih al-Bukhari', '1709041964802', 'حَدَّثَنَا أَبُو نُعَيْمٍ، قَالَ حَدَّثَنَا سُفْيَانُ، عَنِ الأَسْوَدِ، قَالَ سَمِعْتُ جُنْدَبًا، يَقُولُ اشْتَكَى النَّبِيُّ صلى الله عليه وسلم فَلَمْ يَقُمْ لَيْلَةً أَوْ لَيْلَتَيْنِ‏.‏\n', 'The Prophet (ﷺ) became sick and did not get up (for Tahajjud prayer) for a night or two.\n\n', 'Ebu Nu\'aym bize anlattı, dedi, Süfyan bize Esved\'den rivayet etti, şöyle dedi: Bir çekirgenin Peygamber sallallahu aleyhi ve sellem\'in şikayet ettiğini ve onun için dua etmediğini söylediğini duydum. bir veya iki gece.', 'ہم سے ابونعیم نے بیان کیا ، کہا کہ ہم سے سفیان ثوری نے اسود بن قیس سے بیان کیا ، کہا کہ میں نے جندب رضی اللہ عنہ سے سنا ، آپ نے فرمایا کہ نبی کریم صلی اللہ علیہ وسلم بیمار ہوئے تو ایک یا دو رات تک ( نماز کے لیے ) نہ اٹھ سکے ۔\n', 'N/A', 'N/A', 'N/A', '1709042408', '2024-02-27 13:00:08', '2024-02-27 13:00:08'),
(34, '1709042572308', 'Abdullah bin `Abbas', 'Sahih al-Bukhari', '1709042492087', 'حَدَّثَنَا عَبْدُ اللَّهِ بْنُ يُوسُفَ، أَخْبَرَنَا مَالِكٌ، عَنِ ابْنِ شِهَابٍ، عَنْ سُلَيْمَانَ بْنِ يَسَارٍ، عَنْ عَبْدِ اللَّهِ بْنِ عَبَّاسٍ ـ رضى الله عنهما ـ قَالَ كَانَ الْفَضْلُ رَدِيفَ رَسُولِ اللَّهِ صلى الله عليه وسلم فَجَاءَتِ امْرَأَةٌ مِنْ خَثْعَمَ، فَجَعَلَ الْفَضْلُ يَنْظُرُ إِلَيْهَا وَتَنْظُرُ إِلَيْهِ، وَجَعَلَ النَّبِيُّ صلى الله عليه وسلم يَصْرِفُ وَجْهَ الْفَضْلِ إِلَى الشِّقِّ الآخَرِ فَقَالَتْ يَا رَسُولَ اللَّهِ إِنَّ فَرِيضَةَ اللَّهِ عَلَى عِبَادِهِ فِي الْحَجِّ أَدْرَكَتْ أَبِي شَيْخًا كَبِيرًا، لاَ يَثْبُتُ عَلَى الرَّاحِلَةِ، أَفَأَحُجُّ عَنْهُ قَالَ ‏ \"‏ نَعَمْ ‏\"‏‏.‏ وَذَلِكَ فِي حَجَّةِ الْوَدَاعِ‏.‏\n', 'Al-Fadl (his brother) was riding behind Allah\'s Messenger (ﷺ) and a woman from the tribe of Khath\'am came and Al-Fadl started looking at her and she started looking at him. The Prophet (ﷺ) turned Al-Fadl\'s face to the other side. The woman said, \"O Allah\'s Messenger (ﷺ)! The obligation of Hajj enjoined by Allah on His devotees has become due on my father and he is old and weak, and he cannot sit firm on the Mount; may I perform Hajj on his behalf?\" The Prophet (ﷺ) replied, \"Yes, you may.\" That happened during the Hajj-al-Wida (of the Prophet (ﷺ) ).\n\n', 'Abdullah bin Yusuf bize anlattı, Malik bize İbn Şihab\'tan, Süleyman bin Yesar\'dan, Abdullah bin Abbas\'tan -Allah her ikisinden de razı olsun- rivayet ederek şöyle dedi: Resulullah\'ın sahabesine Allah\'ın salat ve selamı üzerine Has\'am\'dan bir kadın geldi, Fadl ona baktı, o da ona baktı, Peygamber Efendimiz (sallallahu aleyhi ve sellem) krediyi dağıtmaya başladı. diğer tarafa da şöyle dedi: \"Ey Allah\'ın Resulü, Allah\'ın kullarına hac yapması farzdır.\" Babamın yaşlı bir adam olduğunu gördü, hayır. Giden adama sadıktır. Ben de hac yapsam mı? Onun adına Hac mı? \"Evet\" dedi. Veda Haccı sırasındaydı.', 'ہم سے عبداللہ بن یوسف نے بیان کیا ، انہوں نے کہا کہ ہمیں امام مالک نے خبر دی انہیں ابن شہاب نے ، انہیں سلیمان بن یسارنے ، اور ان سے عبداللہ بن عباس رضی اللہ عنہما نے بیان کیا کہ فضل بن عباس ( حجۃ الوداع میں ) رسول اللہ صلی اللہ علیہ وسلم کے ساتھ سواری کے پیچھے بیٹھے ہوئے تھے کہ قبیلہ خثعم کی ایک خوبصورت عورت آئی ۔ فضل اس کو دیکھنے لگے وہ بھی انہیں دیکھ رہی تھی ۔ لیکن رسول اللہ صلی اللہ علیہ وسلم فضل رضی اللہ عنہ کا چہرہ بار بار دوسری طرف موڑ دینا چاہتے تھے ۔ اس عورت نے کہا یا رسول اللہ ! اللہ کا فریضہ حج میرے والد کے لیے ادا کرنا ضروری ہو گیا ہے ۔ لیکن وہ بہت بوڑھے ہیں اونٹنی پر بیٹھ نہیں سکتے ۔ کیا میں ان کی طرف سے حج ( بدل ) کر سکتی ہوں ؟ آپ صلی اللہ علیہ وسلم نے فرمایا کہ ہاں ۔ یہ حجتہ الوداع کا واقعہ تھا ۔\n', 'N/A', 'N/A', 'N/A', '1709042572', '2024-02-27 13:02:52', '2024-02-27 13:02:52'),
(35, '1709042713194', 'Ibn `Umar', 'Sahih al-Bukhari', '1709042492087', '\nحَدَّثَنَا أَحْمَدُ بْنُ عِيسَى، حَدَّثَنَا ابْنُ وَهْبٍ، عَنْ يُونُسَ، عَنِ ابْنِ شِهَابٍ، أَنَّ سَالِمَ بْنَ عَبْدِ اللَّهِ، أَخْبَرَهُ أَنَّ ابْنَ عُمَرَ ـ رضى الله عنهما ـ قَالَ رَأَيْتُ رَسُولَ اللَّهِ صلى الله عليه وسلم يَرْكَبُ رَاحِلَتَهُ بِذِي الْحُلَيْفَةِ ثُمَّ يُهِلُّ حَتَّى تَسْتَوِيَ بِهِ قَائِمَةً‏.‏\n', 'I saw that Allah\'s Messenger (ﷺ) used to ride on his Mount at Dhul Hulaifa and used to start saying, \"Labbaik\" when the Mount stood upright.\n\n', 'Ahmed bin İsa bize anlattı, İbn Vehb Yunus\'tan, İbn Şihab\'tan rivayet etti ki, Salem bin Abdullah ona İbn Ömer\'in -Allah her ikisinden de razı olsun- Allah\'ın Resulü\'nü gördüğümü söylediğini söyledi, Allah ona salât ve selâm versin; Zülhuleyfe\'de devesine biner, sonra kendisine bir sütun gelinceye kadar ihrama girer.', 'ہم سے احمد بن عیسیٰ نے بیان کیا ، کہا کہ ہمیں عبداللہ بن وہب نے خبر دی ، انہیں یونس نے ، انہیں بن شہاب نے کہ سالم بن عبداللہ بن عمر رضی اللہ عنہما نے انہیں خبر دی ، ان سے عبداللہ بن عمر نے فرمایا کہ میں نے رسول اللہ صلی اللہ علیہ وسلم کو ذی الحلیفہ میں دیکھا کہ اپنی سواری پر چڑھ رہے ہیں ۔ پھر جب وہ سیدھی کھڑی ہوئی تو آپ صلی اللہ علیہ وسلم نے لبیک کہا ۔\n', 'N/A', 'N/A', 'N/A', '1709042713', '2024-02-27 13:05:13', '2024-02-27 13:05:13'),
(36, '1709042770507', 'Jabir bin `Abdullah', 'Sahih al-Bukhari', '1709042492087', 'حَدَّثَنَا إِبْرَاهِيمُ، أَخْبَرَنَا الْوَلِيدُ، حَدَّثَنَا الأَوْزَاعِيُّ، سَمِعَ عَطَاءً، يُحَدِّثُ عَنْ جَابِرِ بْنِ عَبْدِ اللَّهِ ـ رضى الله عنهما ـ أَنَّ إِهْلاَلَ رَسُولِ اللَّهِ صلى الله عليه وسلم مِنْ ذِي الْحُلَيْفَةِ حِينَ اسْتَوَتْ بِهِ رَاحِلَتُهُ‏.‏ رَوَاهُ أَنَسٌ وَابْنُ عَبَّاسٍ رضى الله عنهم‏.‏\n', 'that Allah\'s Messenger (ﷺ) started saying, \"Labbaik\" from Dhul-Hulaifa when his Mount stood upright carrying him .\n\n', 'İbrahim bize anlattı, Velid bize anlattı, Evzai bize anlattı, Ata\'nın Cabir bin Abdullah -Allah her ikisinden de râzı olsun- rivayetiyle Rasulullah\'ın ihramını söylediğini işitti. Allah, Allah ona salat ve selam etsin, devesi kendisine geldiğinde Zülhuleyfe\'den. Enes ve İbni Abbas\'tan rivayet edilmiştir, Allah onlardan razı olsun.', 'ہم سے ابراہیم بن موسیٰ نے بیان کیا ، کہا کہ ہمیں ولید بن مسلم نے خبر دی ، کہا کہ ہم سے امام اوزاعی نے بیان کیا ، انہوں نے عطاء بن ابی رباح سے سنا ، وہ جابر بن عبداللہ انصاری رضی اللہ عنہما سے بیان کرتے تھے کہ رسول صلی اللہ علیہ وسلم نے ذوالحلیفہ سے احرام باندھا جب سواری آپ صلی اللہ علیہ وسلم کو لے کر سیدھی کھڑی ہو گئی ۔ ابراہیم بن موسیٰ کی یہ حدیث ابن عباس اور انس رضی اللہ عنہم سے بھی مروی ہے ۔\n', 'N/A', 'N/A', 'N/A', '1709042770', '2024-02-27 13:06:10', '2024-02-27 13:06:10'),
(37, '1709042897135', 'Aishah', 'Sahih al-Bukhari', '1709042492087', 'وَقَالَ أَبَانُ حَدَّثَنَا مَالِكُ بْنُ دِينَارٍ، عَنِ الْقَاسِمِ بْنِ مُحَمَّدٍ، عَنْ عَائِشَةَ، رضى الله عنها أَنَّ النَّبِيَّ صلى الله عليه وسلم بَعَثَ مَعَهَا أَخَاهَا عَبْدَ الرَّحْمَنِ، فَأَعْمَرَهَا مِنَ التَّنْعِيمِ، وَحَمَلَهَا عَلَى قَتَبٍ‏.‏ وَقَالَ عُمَرُ ـ رضى الله عنه ـ شُدُّوا الرِّحَالَ فِي الْحَجِّ، فَإِنَّهُ أَحَدُ الْجِهَادَيْنِ‏.‏\n', 'The Prophet (ﷺ) sent my brother, \'Abdur Rahman with me to Tan\'im for the \'Umra, and he made me ride on the packsaddle (of a camel). \'Umar said, \"Be ready to travel for Hajj as it (Hajj) is one of the two kind of Jihad\".\n', 'Aban şöyle dedi: Malik bin Dinar, Kasım bin Muhammed\'den, Aişe\'den (Allah ondan razı olsun) rivayete göre, Peygamber (sallallahu aleyhi vesellem)\'in kardeşi Abdüllah\'ı gönderdiğini söyledi. -Rahman da onunla birlikteydi, o da İşte Tan\'im\'dendi ve onu bir eyer üzerinde taşıdı. Ömer (Allah ondan razı olsun) şöyle dedi: Hac için bir yolculuğa çıktılar, çünkü bu ikisinden biridir. cihatlar.', 'اور ابان نے کہا ہم سے مالک بن دینار نے بیان کیا ، ان سے قاسم بن محمد نے اور ان سے عائشہ رضی اللہ عنہا نے کہ نبی کریم صلی اللہ علیہ وسلم نے ان کے ساتھ ان کے بھائی عبدالرحمٰن کو بھیجا اور انہوں نے عائشہ رضی اللہ عنہا کو تنعیم سے عمرہ کرایا اور پالان کی پچھلی لکڑی پر ان کو بٹھا لیا ۔ حضرت عمر رضی اللہ عنہ نے فرمایا کہ حج کے لیے پالانیں باندھو کیونکہ یہ بھی ایک جہاد ہے ۔\n', 'N/A', 'N/A', 'N/A', '1709042897', '2024-02-27 13:08:17', '2024-02-27 13:08:17'),
(38, '1709042955190', 'Abu Huraira', 'Sahih al-Bukhari', '1709042514261', 'حَدَّثَنَا عَبْدُ اللَّهِ بْنُ يُوسُفَ، أَخْبَرَنَا مَالِكٌ، عَنْ سُمَىٍّ، مَوْلَى أَبِي بَكْرِ بْنِ عَبْدِ الرَّحْمَنِ عَنْ أَبِي صَالِحٍ السَّمَّانِ، عَنْ أَبِي هُرَيْرَةَ ـ رضى الله عنه ـ أَنَّ رَسُولَ اللَّهِ صلى الله عليه وسلم قَالَ ‏ \"‏ الْعُمْرَةُ إِلَى الْعُمْرَةِ كَفَّارَةٌ لِمَا بَيْنَهُمَا، وَالْحَجُّ الْمَبْرُورُ لَيْسَ لَهُ جَزَاءٌ إِلاَّ الْجَنَّةُ ‏\"‏‏.‏\n', 'Allah\'s Messenger (ﷺ) said, \"(The performance of) `Umra is an expiation for the sins committed (between it and the previous one). And the reward of Hajj Mabrur (the one accepted by Allah) is nothing except Paradise.\"\n\n', 'Abdullah bin Yusuf bize, Malik bize, Ebu Bekir bin Abdul Rahman\'ın müşterisi Sümeyye\'den, Ebu Salih el-Samman\'dan, Ebu Hureyre\'den -Rada Tanrısı\'ndan - onun yetkisine dayanarak - şöyle dedi: Allah Resulü (s.a.v.) şöyle buyurmuştur: \"Umre, aralarında olanlara kefarettir ve Hac, \"Kabul olanın cennetten başka sevabı yoktur.\"', 'ہم سے عبداللہ بن یوسف نے بیان کیا ، انہوں نے کہا کہ ہم کو امام مالک نے خبر دی ، انہیں ابوبکر بن عبدالرحمٰن کے غلام سمی نے خبر دی ، انہیں ابوصالح سمان نے خبر دی اور انہیں حضرت ابوہریرہ رضی اللہ عنہ نے کہ رسول اللہ صلی اللہ علیہ وسلم نے فرمایا ایک عمرہ کے بعد دوسرا عمرہ دونوں کے درمیان کے گناہوں کا کفارہ ہے اور حج مبرور کی جزا جنت کے سوا اور کچھ نہیں ہے ۔\n', 'N/A', 'N/A', 'N/A', '1709042955', '2024-02-27 13:09:15', '2024-02-27 13:09:15');
INSERT INTO `hadiths` (`id`, `_id`, `narratedBy`, `referenceBook`, `category_id`, `hadithArabic`, `hadithEnglish`, `hadithTurkish`, `hadithUrdu`, `hadithBangla`, `hadithHindi`, `hadithFrench`, `timestamp`, `created_at`, `updated_at`) VALUES
(39, '1709043060106', 'Ibn Juraij', 'Sahih al-Bukhari', '1709042514261', 'حَدَّثَنَا أَحْمَدُ بْنُ مُحَمَّدٍ، أَخْبَرَنَا عَبْدُ اللَّهِ، أَخْبَرَنَا ابْنُ جُرَيْجٍ، أَنَّ عِكْرِمَةَ بْنَ خَالِدٍ، سَأَلَ ابْنَ عُمَرَ ـ رضى الله عنهما ـ عَنِ الْعُمْرَةِ، قَبْلَ الْحَجِّ فَقَالَ لاَ بَأْسَ‏.‏ قَالَ عِكْرِمَةُ قَالَ ابْنُ عُمَرَ اعْتَمَرَ النَّبِيُّ صلى الله عليه وسلم قَبْلَ أَنْ يَحُجَّ‏.‏ وَقَالَ إِبْرَاهِيمُ بْنُ سَعْدٍ عَنِ ابْنِ إِسْحَاقَ حَدَّثَنِي عِكْرِمَةُ بْنُ خَالِدٍ سَأَلْتُ ابْنَ عُمَرَ مِثْلَهُ‏.‏\nحَدَّثَنَا عَمْرُو بْنُ عَلِيٍّ، حَدَّثَنَا أَبُو عَاصِمٍ، أَخْبَرَنَا ابْنُ جُرَيْجٍ، قَالَ عِكْرِمَةُ بْنُ خَالِدٍ سَأَلْتُ ابْنَ عُمَرَ ـ رضى الله عنه ـ مِثْلَهُ‏.‏', '`Ikrima bin Khalid asked Ibn `Umar about performing `Umra before Hajj. Ibn `Umar replied, \"There is no harm in it.\" `Ikrima said, \"Ibn `Umar also said, \'The Prophet (ﷺ) had performed `Umra before performing Hajj.\'\"\n\nNarrated `Ikrima bin Khalid:\n\n\"I asked Ibn `Umar the same (as above).\"', 'Ahmed bin Muhammed anlattı, Abdullah anlattı, İbn Cüreyc bize, İkrime bin Halid\'in, Hac\'ı yapmadan önce İbn Ömer -Allah her ikisinden de razı olsun- umre hakkında soru sorduğunu ve şöyle dediğini söyledi: Hiçbir sakıncası yok. İkrime dedi ki: İbn Ömer dedi ki: Peygamber, Allah onu korusun ve huzur versin, Hac yapmadan önce umre yaptı. İbrahim bin Saad, İbn İshak\'tan rivayetle şöyle dedi: İkrime bin Halid bana şöyle dedi: İbn Ömer\'e sordum. aynı şey.\nAmr bin Ali anlattı, Ebu Asim anlattı, İbn Cüreyc anlattı, İkrime bin Halid şöyle dedi: İbn Ömer\'e -Allah ondan razı olsun- aynı şeyi sordum.', 'ہم سے احمد بن محمد نے بیان کیا، کہا ہم سے عبداللہ نے بیان کیا، کہا کہ ہم سے ابن جریج نے بیان کیا، کہ عکرمہ بن خالد نے ابن عمر رضی اللہ عنہما سے عمرہ، حج سے پہلے عمرہ کے بارے میں پوچھا، تو انہوں نے کہا: کوئی حرج نہیں ہے۔ عکرمہ نے کہا: ابن عمر نے کہا: رسول اللہ صلی اللہ علیہ وسلم نے حج کرنے سے پہلے عمرہ کیا، ابراہیم بن سعد نے ابن اسحاق کی روایت سے کہا: عکرمہ بن خالد نے مجھ سے بیان کیا: میں نے ابن عمر سے پوچھا: ایک ہی بات.\nہم سے عمرو بن علی نے بیان کیا، کہا ہم سے ابو عاصم نے بیان کیا، کہا ہم سے ابن جریج نے بیان کیا، کہا کہ عکرمہ بن خالد نے بیان کیا کہ میں نے ابن عمر رضی اللہ عنہما سے بھی یہی پوچھا۔', 'N/A', 'N/A', 'N/A', '1709043060', '2024-02-27 13:11:00', '2024-02-27 13:11:00'),
(40, '1709043174806', 'Mujahid', 'Sahih al-Bukhari', '1709042514261', 'حَدَّثَنَا قُتَيْبَةُ، حَدَّثَنَا جَرِيرٌ، عَنْ مَنْصُورٍ، عَنْ مُجَاهِدٍ، قَالَ دَخَلْتُ أَنَا وَعُرْوَةُ بْنُ الزُّبَيْرِ الْمَسْجِدَ،، فَإِذَا عَبْدُ اللَّهِ بْنُ عُمَرَ ـ رضى الله عنهما ـ جَالِسٌ إِلَى حُجْرَةِ عَائِشَةَ، وَإِذَا نَاسٌ يُصَلُّونَ فِي الْمَسْجِدِ صَلاَةَ الضُّحَى‏.‏ قَالَ فَسَأَلْنَاهُ عَنْ صَلاَتِهِمْ‏.‏ فَقَالَ بِدْعَةٌ‏.‏ ثُمَّ قَالَ لَهُ كَمِ اعْتَمَرَ رَسُولُ اللَّهِ صلى الله عليه وسلم قَالَ أَرْبَعً إِحْدَاهُنَّ فِي رَجَبٍ، فَكَرِهْنَا أَنْ نَرُدَّ عَلَيْهِ‏.‏ قَالَ وَسَمِعْنَا اسْتِنَانَ، عَائِشَةَ أُمِّ الْمُؤْمِنِينَ فِي الْحُجْرَةِ، فَقَالَ عُرْوَةُ يَا أُمَّاهُ، يَا أُمَّ الْمُؤْمِنِينَ‏.‏ أَلاَ تَسْمَعِينَ مَا يَقُولُ أَبُو عَبْدِ الرَّحْمَنِ‏.‏ قَالَتْ مَا يَقُولُ قَالَ يَقُولُ إِنَّ رَسُولَ اللَّهِ صلى الله عليه وسلم اعْتَمَرَ أَرْبَعَ عُمَرَاتٍ إِحْدَاهُنَّ فِي رَجَبٍ‏.‏ قَالَتْ يَرْحَمُ اللَّهُ أَبَا عَبْدِ الرَّحْمَنِ، مَا اعْتَمَرَ عُمْرَةً إِلاَّ وَهُوَ شَاهِدُهُ، وَمَا اعْتَمَرَ فِي رَجَبٍ قَطُّ‏.‏\n', 'Urwa bin Az-Zubair and I entered the Mosque (of the Prophet) and saw `Abdullah bin `Umar sitting near the dwelling place of Aisha and some people were offering the Duha prayer. We asked him about their prayer and he replied that it was a heresy. He (Urwa) then asked him how many times the Prophet (ﷺ) had performed `Umra. He replied, \'Four times; one of them was in the month of Rajab.\" We disliked to contradict him. Then we heard `Aisha, the Mother of faithful believers cleaning her teeth with Siwak in the dwelling place. \'Urwa said, \"O Mother! O Mother of the believers! Don\'t you hear what Abu `Abdur Rahman is saying?\" She said, \"What does he say?\" \'Urwa said, \"He says that Allah\'s Messenger (ﷺ) performed four `Umra and one of them was in the month of Rajab.\" `Aisha said, \"May Allah be merciful to Abu `Abdur Rahman! The Prophet (ﷺ) did not perform any `Umra except that he was with him, and he never performed any `Umra in Rajab.\"\n\n', 'Kuteybe bize anlattı, Cerir bize Mansur\'dan, Mücahid\'den rivayet etti: O şöyle dedi: Urve bin Zübeyr ve ben camiye girdik ve işte Abdullah bin Ömer -Allah onu kutsasın ve ona bağışlasın. selam - Allah ikisinden de razı olsun - Aişe\'nin odasında oturuyordu, mescidde Duha namazı kılanlar vardı, \"Biz de ona onların namazını sorduk\" dedi. \"Bir bid\'at\" dedi. Ona şöyle dedi: \"Resûlullah (s.a.v.) kaç defa umre yaptı?\" O da şöyle dedi: \"Dört tanesi, biri Recep ayında.\" Biz ona cevap vermekten hoşlanmadık. Dedi ki: \" İşittik.” Odadaki Müminlerin Annesi Aişe\'ye baktı ve şöyle dedi: “Urve, ey ​​anne, ey ​​Müminlerin annesi.” Ebu Abdurrahman\'ın ne dediğini duymuyor musun? Dedi ki: \"Ne diyor?\" Dedi ki: \"Resûlullah -sallallahu aleyhi ve sellem-\'in biri Recep ayında olmak üzere dört umre yaptığını söylüyor.\" O da şöyle dedi: \"Allah Ebû\'ya rahmet etsin.\" Abdurrahman, şahit olmadan umre yapmadı ve umre de yapmadı.\" Recep ayında...', 'ہم سے قتیبہ بن سعید نے بیان کیا ، ان سے جریر نے بیان کیا ، ان سے منصور نے ، ان سے مجاہد نے بیان کیا کہ میں اور عروہ بن زبیر مسجد نبوی میں داخل ہوئے ، وہاں عبداللہ بن عمر رضی اللہ عنہما حضرت عائشہ رضی اللہ عنہا کے حجرہ کے پاس بیٹھے ہوئے تھے ، کچھ لوگ مسجد نبوی میں اشراق کی نماز پڑھ رہے تھے ۔ انہوں نے بیان کیا کہ ہم نے عبداللہ بن عمر سے ان لوگوں کی اس نماز کے متعلق پوچھا تو آپ نے فرمایا کہ بدعت ہے ، پھر ان سے پوچھا کہ نبی کریم صلی اللہ علیہ وسلم نے کتنے عمرے کئے تھے ؟ انہوں نے کہا کہ چار ، ایک ان میں سے رجب میں کیا تھا ، لیکن ہم نے پسند نہیں کیا کہ ان کی اس بات کی تردید کریں ۔ مجاہد نے بیان کیا کہ ہم نے ام المؤمنین عائشہ رضی اللہ عنہا کے حجرہ سے ان کے مسواک کرنے کی آواز سنی تو عروہ نے پوچھا اے میری ماں ! اے ام المؤمنین ! ابوعبدالرحمٰن کی بات آپ سن رہی ہیں ؟ عائشہ رضی اللہ عنہا نے پوچھا وہ کیا کہہ رہے ہیں ؟ انہوں نے کہا کہہ رہے ہیں کہ رسول کریم صلی اللہ علیہ وسلم نے چار عمرے کئے تھے جن میں سے ایک رجب میں کیا تھا ، انہوں نے فرمایا کہ اللہ ابوعبدالرحمٰن پر رحم کرے ! آنحضرت صلی اللہ علیہ وسلم نے تو کوئی عمرہ ایسا نہیں کیا جس میں وہ خود موجود نہ رہے ہوں ، آپ صلی اللہ علیہ وسلم نے رجب میں تو کبھی عمرہ ہی نہیں کیا ۔\n', 'N/A', 'N/A', 'N/A', '1709043174', '2024-02-27 13:12:54', '2024-02-27 13:12:54'),
(41, '1709043251773', 'Urwa bin Az-Zubair', 'Sahih al-Bukhari', '1709042514261', 'حَدَّثَنَا أَبُو عَاصِمٍ، أَخْبَرَنَا ابْنُ جُرَيْجٍ، قَالَ أَخْبَرَنِي عَطَاءٌ، عَنْ عُرْوَةَ بْنِ الزُّبَيْرِ، قَالَ سَأَلْتُ عَائِشَةَ ـ رضى الله عنها ـ قَالَتْ مَا اعْتَمَرَ رَسُولُ اللَّهِ صلى الله عليه وسلم فِي رَجَبٍ‏.‏\n', 'I asked `Aisha (whether the Prophet (ﷺ) had performed `Umra in Rajab). She replied, \"Allah\'s Messenger (ﷺ) never performed any `Umra in Rajab.\"\n\n', 'Ebu Asım bize anlattı, İbn Cüreyc bize anlattı, Ata\' bana dedi, Urve ibn el-Zübeyr\'den rivayetle dedi ki, Aişe\'ye -Allah ondan razı olsun- sordum, o da onun üzerinde anlaştığını söyledi. Allah\'tan, Allah onu kutsasın ve ona huzur versin, Recep ayında', 'ہم سے ابوعاصم نے بیان کیا ، کہا ہم کو ابن جریج نے خبر دی ، کہا کہ مجھے عطاء بن ابی رباح نے خبر دی ، ان سے عروہ بن زبیر رضی اللہ عنہ نے بیان کیا کہ میں نے عائشہ رضی اللہ عنہا سے پوچھاتو آپ نے فرمایا کہ رسول اللہ صلی اللہ علیہ وسلم نے رجب میں کوئی عمرہ نہیں کیا تھا ۔\n', 'N/A', 'N/A', 'N/A', '1709043251', '2024-02-27 13:14:11', '2024-02-27 13:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `hadith_categories`
--

CREATE TABLE `hadith_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `_id` varchar(255) NOT NULL,
  `categoryArabic` varchar(255) NOT NULL,
  `categoryEnglish` varchar(255) NOT NULL,
  `categoryTurkish` varchar(255) NOT NULL,
  `categoryUrdu` varchar(255) NOT NULL,
  `categoryBangla` varchar(255) NOT NULL,
  `categoryHindi` varchar(255) NOT NULL,
  `categoryFrench` varchar(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hadith_categories`
--

INSERT INTO `hadith_categories` (`id`, `_id`, `categoryArabic`, `categoryEnglish`, `categoryTurkish`, `categoryUrdu`, `categoryBangla`, `categoryHindi`, `categoryFrench`, `timestamp`, `created_at`, `updated_at`) VALUES
(5, '1709037668143', 'كتاب الإيمان', 'Belief', 'İnanç', 'یقین', 'N/A', 'N/A', 'N/A', '1709037668', '2024-02-27 11:41:08', '2024-02-27 11:41:08'),
(6, '1709038633300', 'كتاب بدء الوحى', 'Revelation', 'Vahyin başlangıcı kitabı', 'وحی کے آغاز کی کتاب', 'N/A', 'N/A', 'N/A', '1709038633', '2024-02-27 11:57:13', '2024-02-27 11:57:13'),
(7, '1709038694838', 'كتاب العلم', 'Knowledge', 'Bilim kitabı', 'سائنس کی کتاب', 'N/A', 'N/A', 'N/A', '1709038694', '2024-02-27 11:58:14', '2024-02-27 11:58:14'),
(8, '1709039086589', 'كتاب الصلاة', 'Prayers (Salat)', 'dua kitabı', 'نماز کی کتاب', 'N/A', 'N/A', 'N/A', '1709039086', '2024-02-27 12:04:46', '2024-02-27 12:04:46'),
(9, '1709039240179', 'كتاب مواقيت الصلاة', 'Times of the Prayers', 'Namaz vakitleri kitabı', 'نماز کے اوقات کی کتاب', 'N/A', 'N/A', 'N/A', '1709039240', '2024-02-27 12:07:20', '2024-02-27 12:07:20'),
(10, '1709040569311', 'كتاب الأذان', 'Call to Prayers (Adhaan)', 'Ezan kitabı', 'اذان کتاب', 'N/A', 'N/A', 'N/A', '1709040569', '2024-02-27 12:29:29', '2024-02-27 12:29:29'),
(11, '1709040875634', 'كتاب الجمعة', 'Friday Prayer', 'Cuma Duası', 'جمعہ کی نماز', 'N/A', 'N/A', 'N/A', '1709040875', '2024-02-27 12:34:35', '2024-02-27 12:34:35'),
(12, '1709040918895', 'كتاب العيدين', 'The Two Festivals (Eids)', 'İki bayramın kitabı', 'دو عیدوں کی کتاب', 'N/A', 'N/A', 'N/A', '1709040918', '2024-02-27 12:35:18', '2024-02-27 12:35:18'),
(13, '1709041859897', 'كتاب سجود القرآن', 'Prostration During Recital of Qur\'an', 'Kuran\'ın secde kitabı', 'قرآن کی سجدہ کی کتاب', 'N/A', 'N/A', 'N/A', '1709041859', '2024-02-27 12:50:59', '2024-02-27 12:50:59'),
(14, '1709041964802', 'كتاب التهجد', 'Prayer at Night (Tahajjud)', 'Teheccüd kitabı', 'تہجد کی کتاب', 'N/A', 'N/A', 'N/A', '1709041964', '2024-02-27 12:52:44', '2024-02-27 12:52:44'),
(15, '1709042492087', 'كتاب الحج', 'Hajj (Pilgrimage)', 'Hac kitabı', 'حج کی کتاب', 'N/A', 'N/A', 'N/A', '1709042492', '2024-02-27 13:01:32', '2024-02-27 13:01:32'),
(16, '1709042514261', 'كتاب العمرة', '`Umrah (Minor pilgrimage)', 'Umre kitabı', 'عمرہ کی کتاب', 'N/A', 'N/A', 'N/A', '1709042514', '2024-02-27 13:01:54', '2024-02-27 13:01:54');

-- --------------------------------------------------------

--
-- Table structure for table `live_links`
--

CREATE TABLE `live_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `_id` varchar(255) NOT NULL,
  `live_link` text NOT NULL,
  `live_link_id` int(11) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `live_links`
--

INSERT INTO `live_links` (`id`, `_id`, `live_link`, `live_link_id`, `timestamp`, `created_at`, `updated_at`) VALUES
(1, '1709126399010', 'https://www.youtube.com/watch?v=-mr6TD6YxR8&ab_channel=%D9%82%D9%86%D8%A7%D8%A9%D8%A7%D9%84%D8%B3%D9%86%D8%A9%D8%A7%D9%84%D9%86%D8%A8%D9%88%D9%8A%D8%A9', 1, '1709126399', '2024-02-28 12:19:59', '2024-03-03 08:47:52');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(17, '2014_10_12_000000_create_users_table', 1),
(18, '2014_10_12_100000_create_password_resets_table', 1),
(19, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(20, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(21, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(22, '2016_06_01_000004_create_oauth_clients_table', 1),
(23, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(24, '2019_08_19_000000_create_failed_jobs_table', 1),
(25, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(26, '2024_02_20_071729_create_hadith_categories_table', 1),
(27, '2024_02_20_081737_create_hadiths_table', 1),
(28, '2024_02_20_101235_create_duas_table', 1),
(29, '2024_02_20_101249_create_dua_categories_table', 1),
(30, '2024_02_20_112003_create_azkar_categories_table', 1),
(31, '2024_02_20_113007_create_azkars_table', 1),
(32, '2024_02_20_120133_create_wallpapers_table', 1),
(33, '2024_02_22_064104_create_one_signals_table', 1),
(34, '2024_02_22_071349_create_donations_table', 1),
(35, '2024_02_22_072316_create_profile_images_table', 1),
(36, '2024_02_22_102518_create_forget_passes_table', 1),
(38, '2024_02_24_055059_create_admins_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notification_histories`
--

CREATE TABLE `notification_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `_id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_histories`
--

INSERT INTO `notification_histories` (`id`, `_id`, `title`, `image`, `message`, `user_type`, `timestamp`, `created_at`, `updated_at`) VALUES
(2, '1709067695936', 'Assalamu Walaikum', 'https://jazakallah-server.product8.net/../storage/notification_images/notification_1709067695.jpg', 'Welcome to the best Islamic App ever', 'all', '1709067695', '2024-02-27 20:01:35', '2024-02-27 20:01:35'),
(3, '1709067933074', 'Good Morning', 'https://jazakallah-server.product8.net/../storage/notification_images/notification_1709067933.jpg', 'Welcome to the best Islamic App ever', 'all', '1709067933', '2024-02-27 20:05:33', '2024-02-27 20:05:33'),
(4, '1709448430740', 'Good Day', 'https://jazakallah-server.product8.net/../storage/notification_images/notification_1709448430.jpg', 'Assalamu walaikum, Good people!', 'all', '1709448430', '2024-03-03 05:47:10', '2024-03-03 05:47:10');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `one_signals`
--

CREATE TABLE `one_signals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `oneSignalId` varchar(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `one_signals`
--

INSERT INTO `one_signals` (`id`, `user_id`, `oneSignalId`, `timestamp`, `created_at`, `updated_at`) VALUES
(1, '1709035151261', 'd9f6ce68-e509-483d-9d7e-db5ba1c10bb8', '1709035151', '2024-02-27 10:59:11', '2024-02-27 10:59:11'),
(2, '1709039427790', '362c63a3-29bd-4e71-935d-e71b92296815', '1709039427', '2024-02-27 12:10:27', '2024-02-27 12:10:27'),
(3, '1709052333818', 'f54fe8db-f209-487a-91df-a3a4950a805a', '1709052333', '2024-02-27 15:45:33', '2024-02-27 15:45:33'),
(4, '1709065793053', '859c05dd-3503-45a0-9931-3464256000e9', '1709065793', '2024-02-27 19:29:53', '2024-02-27 19:29:53'),
(5, '1709067900981', 'c6c3c7aa-5226-44a4-819c-0059dda1e162', '1709067900', '2024-02-27 20:05:01', '2024-02-27 20:05:01'),
(6, '1709097978159', '4811b74f-38c4-470b-ac7a-b29b495ec8b5', '1709097978', '2024-02-28 04:26:18', '2024-02-28 04:26:18'),
(7, '1709098020541', 'b32e15be-a03d-44af-b829-ef3533104ac3', '1709098020', '2024-02-28 04:27:00', '2024-02-28 04:27:00'),
(8, '1709098164449', '34ecf3fd-bac3-41bc-bcc6-c6ad9c9726c2', '1709098164', '2024-02-28 04:29:24', '2024-02-28 04:29:24'),
(9, '1709106806027', '2a5f52d1-298a-4f11-aa3e-2092e86d291d', '1709106806', '2024-02-28 06:53:26', '2024-02-28 08:13:11'),
(10, '1709112087399', '7b4427fc-081a-481f-bf9c-f636eca7c40d', '1709112087', '2024-02-28 08:21:27', '2024-02-28 08:21:27'),
(11, '1709116727603', '32a090d7-4bab-4aa1-b3d2-2f34b647dbe9', '1709116727', '2024-02-28 09:38:47', '2024-02-28 09:38:47'),
(12, '1709128643948', '854ee8b1-ae68-4337-9723-fe99e9b06a28', '1709128643', '2024-02-28 12:57:24', '2024-02-28 12:57:24'),
(13, '1709146473225', '3b209b43-83ba-4823-bbce-71a974294150', '1709146473', '2024-02-28 17:54:33', '2024-02-28 17:54:33'),
(14, '1709190700903', '016bc45c-da4c-4c1a-8d8c-4c2d8108f9c1', '1709190700', '2024-02-29 06:11:40', '2024-02-29 06:11:40'),
(15, '1709219276973', '87c0c76a-bddb-4d0a-9a35-e39958bd150d', '1709219276', '2024-02-29 14:07:57', '2024-02-29 14:07:57'),
(16, '1709302092239', 'dd9ed6a1-521b-42c9-a32b-a585d01a84ec', '1709302092', '2024-03-01 13:08:12', '2024-03-01 13:08:12'),
(17, '1709405802935', 'e0d77436-434b-41ef-89d7-6276723f9a34', '1709405802', '2024-03-02 17:56:43', '2024-03-02 17:56:43'),
(18, '1709451800109', 'a174b7e0-4556-4f79-8c89-f4672ba2968f', '1709451800', '2024-03-03 06:43:20', '2024-03-03 06:43:20'),
(19, '1709468515817', '5b667b81-d71f-46fa-9c77-f729e88b5b54', '1709468515', '2024-03-03 11:21:55', '2024-03-03 11:21:55'),
(20, '1709668253096', 'dd27941c-dd6e-4d88-ac4d-075ecf1256f5', '1709668253', '2024-03-05 18:50:53', '2024-03-05 18:50:53'),
(21, '1709811870632', '59a5811b-6877-4653-871b-e4356b0b5b2b', '1709811870', '2024-03-07 10:44:30', '2024-03-07 10:44:30'),
(22, '1709981563141', 'e1d4d557-6d7c-4134-a933-bce0afb9749c', '1709981563', '2024-03-09 09:52:43', '2024-03-09 09:52:43'),
(23, '1709982348047', 'unavailable', '1709982348', '2024-03-09 10:05:48', '2024-03-09 10:05:48'),
(24, '1709998459009', 'ea7068ec-d7ca-4317-8a5d-7503b2dd690a', '1709998459', '2024-03-09 14:34:19', '2024-03-09 14:34:19'),
(25, '1710072735516', 'unavailable', '1710072735', '2024-03-10 11:12:15', '2024-03-10 11:12:15'),
(26, '1710125616930', '985c3a5a-0f73-4c27-a2c6-a3c0934dd5b5', '1710125616', '2024-03-11 01:53:36', '2024-03-11 01:53:36'),
(27, '1710168296019', '3584d9b2-7648-474c-9cbf-17d59d00df75', '1710168296', '2024-03-11 13:44:56', '2024-03-11 13:44:56'),
(28, '1710171590020', '3f43ba4a-a703-4659-8159-f88a3387227b', '1710171590', '2024-03-11 14:39:50', '2024-03-12 13:34:00'),
(29, '1710215678881', '4e131d61-bb74-4a94-91d8-b033670d19d5', '1710215678', '2024-03-12 02:54:38', '2024-03-15 04:33:32'),
(30, '1710410035704', 'cf887b4a-2474-4ae1-9859-aaa2f683bb6e', '1710410035', '2024-03-14 08:53:55', '2024-03-14 08:53:55'),
(31, '1710420935438', '4c392666-d247-4e7b-812e-081bc656d7a2', '1710420935', '2024-03-14 11:55:35', '2024-03-14 11:55:35'),
(32, '1710544977336', '47c09566-ca09-4642-adcf-887287cbd15f', '1710544977', '2024-03-15 22:22:57', '2024-03-15 22:37:02'),
(33, '1710561989997', '2ad39711-4526-406c-890d-a7e1550b116e', '1710561989', '2024-03-16 03:06:30', '2024-03-16 03:06:30'),
(34, '1710617251785', '552c3a74-3957-40c9-a428-8aa4bae5de91', '1710617251', '2024-03-16 18:27:31', '2024-03-16 18:27:31'),
(35, '1710667754767', '17a14427-8a28-4479-b0a4-12ea40943d23', '1710667754', '2024-03-17 08:29:14', '2024-03-17 08:29:14'),
(36, '1710700659384', '574ab931-dd0f-45bd-9f08-b619ac1618ad', '1710700659', '2024-03-17 17:37:39', '2024-03-17 17:37:39'),
(37, '1710863151027', '6f8a356d-9431-4cbd-b8dc-0f7a18bb47f7', '1710863151', '2024-03-19 14:45:51', '2024-03-19 14:45:51'),
(38, '1711064446651', 'ada257c7-6bb0-4709-9d08-a9b3c10ec141', '1711064446', '2024-03-21 22:40:46', '2024-03-21 22:40:46'),
(39, '1711186809251', 'unavailable', '1711186809', '2024-03-23 08:40:09', '2024-03-23 08:40:09'),
(40, '1711219116340', 'da81699e-960d-4162-a38b-7cb9173a622c', '1711219116', '2024-03-23 17:38:36', '2024-03-23 17:38:36'),
(41, '1711275000041', '7522f844-7cec-4c77-ba66-e9f6fa7edce2', '1711275000', '2024-03-24 09:10:00', '2024-03-24 09:10:00'),
(42, '1711309228245', '7c0c6fab-6c47-4b10-8866-34d98dd1f026', '1711309228', '2024-03-24 18:40:28', '2024-03-24 18:40:28'),
(43, '1711331561683', '070d141d-b960-4eea-ab01-531d8f4f47be', '1711331561', '2024-03-25 00:52:41', '2024-03-27 19:48:08'),
(44, '1711459351608', 'be0a32d7-d7ea-4def-bd04-28fd26e6b297', '1711459351', '2024-03-26 12:22:31', '2024-03-26 12:22:31'),
(45, '1711486893630', '23f4006e-2fff-4104-94d7-ea6c19a4a46f', '1711486893', '2024-03-26 20:01:33', '2024-03-26 20:01:33'),
(46, '1711597632894', '49625bcb-928f-4c95-8edd-aca0051ddeab', '1711597632', '2024-03-28 02:47:12', '2024-03-28 02:47:12'),
(47, '1711640462774', '6f8a356d-9431-4cbd-b8dc-0f7a18bb47f7', '1711640462', '2024-03-28 14:41:02', '2024-03-28 14:41:02'),
(48, '1711770009416', 'ebae0e8a-6f94-4ced-a1b1-a2b1b8e03bed', '1711770009', '2024-03-30 02:40:09', '2024-03-30 02:40:09'),
(49, '1712011479603', '2392138e-07e5-4b9f-88e1-5a29b82bc2e1', '1712011479', '2024-04-01 20:44:39', '2024-04-01 20:44:39'),
(50, '1712173184592', 'b16485ef-0f23-4369-acf7-cc2f87f384aa', '1712173184', '2024-04-03 17:39:44', '2024-04-03 17:39:44'),
(51, '1712173589020', 'b16485ef-0f23-4369-acf7-cc2f87f384aa', '1712173589', '2024-04-03 17:46:29', '2024-04-03 17:46:29'),
(52, '1712192832746', '4193d055-5901-4d2c-8a69-ff486df2d6dd', '1712192832', '2024-04-03 23:07:12', '2024-04-03 23:07:12'),
(53, '1712385378864', '614c2687-ed52-42b6-8d8b-4f0f93a47311', '1712385378', '2024-04-06 04:36:18', '2024-04-06 04:36:18'),
(54, '1712395602279', 'cc61ffd2-09d3-4410-9061-fcf0caeaccb5', '1712395602', '2024-04-06 07:26:42', '2024-04-06 07:26:42'),
(55, '1712422520949', '81729d7a-f753-4df3-9c39-cd73856a87fe', '1712422520', '2024-04-06 14:55:21', '2024-04-07 02:14:38'),
(56, '1712468087621', 'dedbabae-a8e3-40c7-9680-ee4d668f2a0d', '1712468087', '2024-04-07 03:34:47', '2024-04-07 03:34:47'),
(57, '1712787001314', 'a0f9915d-57a8-4206-a521-97834da5a889', '1712787001', '2024-04-10 20:10:01', '2024-04-10 20:10:01'),
(58, '1712804092843', 'd45e796e-2bdb-495f-bb65-6e16c3bc09af', '1712804092', '2024-04-11 00:54:52', '2024-04-11 00:54:52'),
(59, '1712932377687', '0908d0a0-30af-4479-ac98-2f3d516f9192', '1712932377', '2024-04-12 12:32:57', '2024-04-12 12:32:57'),
(60, '1712986230200', 'a6457267-b025-4eb9-beeb-183948f06689', '1712986230', '2024-04-13 03:30:30', '2024-04-13 03:30:30'),
(61, '1712987562004', 'a6457267-b025-4eb9-beeb-183948f06689', '1712987562', '2024-04-13 03:52:42', '2024-04-13 03:52:42'),
(62, '1713123256508', 'f0a5a9e4-b7e4-4ae4-9b26-12dfaa4c2159', '1713123256', '2024-04-14 17:34:16', '2024-04-14 17:34:16'),
(63, '1713179565598', 'dedbabae-a8e3-40c7-9680-ee4d668f2a0d', '1713179565', '2024-04-15 09:12:45', '2024-04-15 09:12:45'),
(64, '1713189860773', 'e2e64c96-73f7-42af-8e24-3f0c960444c8', '1713189860', '2024-04-15 12:04:20', '2024-04-15 12:04:20'),
(65, '1713307721082', 'd05af768-1066-4c56-97cb-1fc3dfd0717e', '1713307721', '2024-04-16 20:48:41', '2024-04-16 20:48:41'),
(66, '1713351446616', '6be0fe64-1d98-421c-a7da-9111b0d11c63', '1713351446', '2024-04-17 08:57:26', '2024-04-17 08:57:26'),
(67, '1713438498377', '51c0b697-9905-4351-8909-1d5186cc11ab', '1713438498', '2024-04-18 09:08:18', '2024-04-21 05:22:14'),
(68, '1713475771460', 'd7623c3b-d03c-4c66-bee8-1744468d61a1', '1713475771', '2024-04-18 19:29:31', '2024-04-18 19:29:31'),
(69, '1713547111311', 'unavailable', '1713547111', '2024-04-19 15:18:31', '2024-04-19 15:18:31'),
(70, '1713856802982', 'd5fc32b7-3628-4539-8c7d-2149ed67f34e', '1713856802', '2024-04-23 05:20:03', '2024-04-23 05:20:03'),
(71, '1713873212576', '82709a9b-9c70-4e9e-9356-af924d2e57a3', '1713873212', '2024-04-23 09:53:32', '2024-04-23 09:53:32'),
(72, '1713899771378', 'unavailable', '1713899771', '2024-04-23 17:16:11', '2024-04-23 17:16:11'),
(73, '1713906796973', 'fd1b2254-6d87-4d3c-b94a-04ac432a4b45', '1713906796', '2024-04-23 19:13:17', '2024-04-23 19:13:17'),
(74, '1713940697395', 'e67155c4-181e-45a8-827d-31bc577e4c5e', '1713940697', '2024-04-24 04:38:17', '2024-04-24 04:38:17'),
(75, '1713957593743', '754244d1-5bf3-428b-bd72-70cfe8e6c7df', '1713957593', '2024-04-24 09:19:53', '2024-04-24 09:19:53'),
(76, '1713961285356', '3256310c-210f-490e-a6ea-8467e03c65a7', '1713961285', '2024-04-24 10:21:25', '2024-04-24 10:21:25'),
(77, '1714133602289', 'eaeb8fcc-3fa8-4cad-bdb1-85cb88521838', '1714133602', '2024-04-26 10:13:22', '2024-04-26 10:13:22'),
(78, '1714133637067', '61149e97-491b-45a9-9585-bfef058e91b1', '1714133637', '2024-04-26 10:13:57', '2024-04-26 10:13:57'),
(79, '1714551369914', 'c14dd5ea-a7c5-47d2-aa3c-2c6d0b12430a', '1714551369', '2024-05-01 06:16:09', '2024-05-01 06:16:09'),
(80, '1714738634242', '7d4a3e5b-e37a-48cb-8d83-855eb9f037c7', '1714738634', '2024-05-03 10:17:14', '2024-05-03 10:17:14'),
(81, '1714898832007', 'c290baac-987c-4836-bc11-424acdf44de2', '1714898832', '2024-05-05 06:47:12', '2024-05-05 18:15:03'),
(82, '1715335151268', '9e025eed-008a-4252-9ca9-887c2fd1ae9b', '1715335151', '2024-05-10 07:59:11', '2024-05-10 07:59:11'),
(83, '1715462030353', '1a3eda41-cb08-4669-896b-eb38e9aaee4e', '1715462030', '2024-05-11 19:13:50', '2024-05-11 19:13:50'),
(84, '1715564331235', 'f7b42708-c60b-43ce-b5e7-4d19ddccab48', '1715564331', '2024-05-12 23:38:51', '2024-05-12 23:38:51'),
(85, '1715697030845', '9f539227-08ed-4113-ab77-f515c65d3d0c', '1715697030', '2024-05-14 12:30:30', '2024-05-14 12:30:30'),
(86, '1715798424883', 'e59bb56d-b309-4095-8152-bbf8c7a61c85', '1715798424', '2024-05-15 16:40:24', '2024-05-15 16:40:24'),
(87, '1715805958061', 'unavailable', '1715805958', '2024-05-15 18:45:58', '2024-05-15 18:45:58'),
(88, '1715937361357', '99f77483-f7df-411d-b109-cf90db74916a', '1715937361', '2024-05-17 07:16:01', '2024-05-17 07:16:01'),
(89, '1716122503917', '111111', '1716122503', '2024-05-19 10:41:44', '2024-05-23 09:26:27'),
(90, '1716155519019', 'fd9b9539-2b93-4def-894c-0393b0f9f837', '1716155519', '2024-05-19 19:51:59', '2024-05-19 19:51:59'),
(91, '1716351444317', 'a827f581-d2ce-48f5-a570-e6c84487cd22', '1716351444', '2024-05-22 02:17:24', '2024-05-22 02:17:24'),
(92, '1716639473929', 'unavailable', '1716639473', '2024-05-25 10:17:53', '2024-05-25 10:17:53'),
(93, '1716643539760', '968febff-6acf-4fae-a080-6e4454de1eeb', '1716643539', '2024-05-25 11:25:39', '2024-05-25 11:25:39'),
(94, '1716972069431', '74513865-f8ea-433f-a16d-bc89c65da821', '1716972069', '2024-05-29 06:41:09', '2024-05-29 06:41:09'),
(95, '1717100831929', '020913af-640c-4cb7-ba72-ef2273eedddd', '1717100831', '2024-05-30 18:27:11', '2024-05-30 18:27:11'),
(96, '1717554011913', '8e788d54-af29-4ee8-a633-5130f3ff67a6', '1717554011', '2024-06-05 00:20:11', '2024-06-05 00:20:11'),
(97, '1717713553350', 'd7ac8961-ca81-405d-9c90-d5dcb5f1d139', '1717713553', '2024-06-06 20:39:13', '2024-06-06 20:39:13'),
(98, '1717958277142', 'f458ab3f-776b-40a5-bdba-41e94036a087', '1717958277', '2024-06-09 16:37:57', '2024-06-09 16:37:57'),
(99, '1726055324412', '165745468764', '1726055324', '2024-09-11 11:48:44', '2024-09-11 11:48:44'),
(100, '1726055615699', '165745468764', '1726055615', '2024-09-11 11:53:35', '2024-09-11 11:53:35'),
(101, '1726056431128', '49b5d0a4-a751-4aa7-8e6a-2c06d4d9b0c3', '1726056431', '2024-09-11 12:07:11', '2024-09-11 12:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profile_images`
--

CREATE TABLE `profile_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `originalUrl` varchar(255) NOT NULL,
  `thumbnailUrl` varchar(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile_images`
--

INSERT INTO `profile_images` (`id`, `user_id`, `originalUrl`, `thumbnailUrl`, `timestamp`, `created_at`, `updated_at`) VALUES
(1, '1709034890244', 'https://jazakallah-server.product8.net/../storage/admin_original_images/admin_original_image_1709034912.jpeg', 'https://jazakallah-server.product8.net/../storage/admin_thumbnail_images/admin_thumbnail_image_1709034912.jpeg', '1709034912', '2024-02-27 10:55:12', '2024-02-27 10:55:12'),
(2, '1709035969220', 'https://jazakallah-server.product8.net/../storage/admin_original_images/admin_original_image_1709036011.jpg', 'https://jazakallah-server.product8.net/../storage/admin_thumbnail_images/admin_thumbnail_image_1709036011.jpg', '1709036011', '2024-02-27 11:13:31', '2024-02-27 11:13:31'),
(3, '1709039427790', 'https://jazakallah-server.product8.net/../storage/user_original_images/user_original_image_1709039489.jpg', 'https://jazakallah-server.product8.net/../storage/user_thumbnail_images/user_thumbnail_image_1709039489.jpg', '1709039489', '2024-02-27 12:11:29', '2024-02-27 12:11:29'),
(4, '1709097978159', 'https://jazakallah-server.product8.net/../storage/user_original_images/user_original_image_1709098903.jpg', 'https://jazakallah-server.product8.net/../storage/user_thumbnail_images/user_thumbnail_image_1709098903.jpg', '1709098903', '2024-02-28 04:41:43', '2024-02-28 04:41:43'),
(5, '1709128643948', 'https://jazakallah-server.product8.net/../storage/user_original_images/user_original_image_1709128669.jpg', 'https://jazakallah-server.product8.net/../storage/user_thumbnail_images/user_thumbnail_image_1709128669.jpg', '1709128669', '2024-02-28 12:57:50', '2024-02-28 12:57:50'),
(6, '1711331561683', 'https://jazakallah-server.product8.net/../storage/user_original_images/user_original_image_1711331670.jpg', 'https://jazakallah-server.product8.net/../storage/user_thumbnail_images/user_thumbnail_image_1711331670.jpg', '1711331670', '2024-03-25 00:54:30', '2024-03-25 00:54:30'),
(7, '1711309228245', 'https://jazakallah-server.product8.net/../storage/user_original_images/user_original_image_1711379172.jpg', 'https://jazakallah-server.product8.net/../storage/user_thumbnail_images/user_thumbnail_image_1711379172.jpg', '1711379172', '2024-03-25 14:06:12', '2024-03-25 14:06:12'),
(8, '1711459351608', 'https://jazakallah-server.product8.net/../storage/user_original_images/user_original_image_1711461171.jpg', 'https://jazakallah-server.product8.net/../storage/user_thumbnail_images/user_thumbnail_image_1711461171.jpg', '1711461157', '2024-03-26 12:52:37', '2024-03-26 12:52:51'),
(9, '1711640462774', 'https://jazakallah-server.product8.net/../storage/user_original_images/user_original_image_1711640494.jpg', 'https://jazakallah-server.product8.net/../storage/user_thumbnail_images/user_thumbnail_image_1711640494.jpg', '1711640494', '2024-03-28 14:41:34', '2024-03-28 14:41:34'),
(10, '1712192832746', 'https://jazakallah-server.product8.net/../storage/user_original_images/user_original_image_1712193354.jpg', 'https://jazakallah-server.product8.net/../storage/user_thumbnail_images/user_thumbnail_image_1712193354.jpg', '1712193354', '2024-04-03 23:15:54', '2024-04-03 23:15:54'),
(11, '1712468087621', 'https://jazakallah-server.product8.net/../storage/user_original_images/user_original_image_1712473630.jpg', 'https://jazakallah-server.product8.net/../storage/user_thumbnail_images/user_thumbnail_image_1712473630.jpg', '1712473601', '2024-04-07 05:06:41', '2024-04-07 05:07:10'),
(12, '1713189860773', 'https://jazakallah-server.product8.net/../storage/user_original_images/user_original_image_1713190122.jpg', 'https://jazakallah-server.product8.net/../storage/user_thumbnail_images/user_thumbnail_image_1713190122.jpg', '1713190122', '2024-04-15 12:08:42', '2024-04-15 12:08:42'),
(13, '1713123256508', 'https://jazakallah-server.product8.net/../storage/user_original_images/user_original_image_1713206093.png', 'https://jazakallah-server.product8.net/../storage/user_thumbnail_images/user_thumbnail_image_1713206093.png', '1713206093', '2024-04-15 16:34:54', '2024-04-15 16:34:54'),
(14, '1713899771378', 'https://jazakallah-server.product8.net/../storage/user_original_images/user_original_image_1713899859.png', 'https://jazakallah-server.product8.net/../storage/user_thumbnail_images/user_thumbnail_image_1713899858.png', '1713899858', '2024-04-23 17:17:39', '2024-04-23 17:17:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `_id` varchar(255) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--


-- --------------------------------------------------------

--
-- Table structure for table `wallpapers`
--

CREATE TABLE `wallpapers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `_id` varchar(255) NOT NULL,
  `wallpaperName` varchar(255) NOT NULL,
  `originalUrl` varchar(255) NOT NULL,
  `thumbnailUrl` varchar(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallpapers`
--

INSERT INTO `wallpapers` (`id`, `_id`, `wallpaperName`, `originalUrl`, `thumbnailUrl`, `timestamp`, `created_at`, `updated_at`) VALUES
(3, '1709038289775', 'Netro Creative', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709038289.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709038289.jpg', '1709038289', '2024-02-27 11:51:29', '2024-02-27 11:51:29'),
(4, '1709038318101', 'Netro Creative', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709038318.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709038318.jpg', '1709038318', '2024-02-27 11:51:58', '2024-02-27 11:51:58'),
(5, '1709038340268', 'Netro Creative', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709038340.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709038340.jpg', '1709038340', '2024-02-27 11:52:20', '2024-02-27 11:52:20'),
(6, '1709038356252', 'Netro Creative', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709038356.jpeg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709038356.jpeg', '1709038356', '2024-02-27 11:52:36', '2024-02-27 11:52:36'),
(7, '1709038384505', 'Netro Creative', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709038384.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709038385.jpg', '1709038384', '2024-02-27 11:53:05', '2024-02-27 11:53:05'),
(9, '1709038418374', 'Netro Creative', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709038418.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709038418.jpg', '1709038418', '2024-02-27 11:53:39', '2024-02-27 11:53:39'),
(12, '1709038536954', 'Netro Creative', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709038536.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709038537.jpg', '1709038536', '2024-02-27 11:55:37', '2024-02-27 11:55:37'),
(13, '1709040264625', 'Netro Creative', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709040264.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709040264.jpg', '1709040264', '2024-02-27 12:24:24', '2024-02-27 12:24:24'),
(14, '1709040628808', 'Netro Creative', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709040628.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709040628.jpg', '1709040628', '2024-02-27 12:30:28', '2024-02-27 12:30:28'),
(15, '1709040638027', 'Netro Creative', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709040638.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709040638.jpg', '1709040638', '2024-02-27 12:30:38', '2024-02-27 12:30:38'),
(16, '1709040649096', 'Netro Creative', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709040649.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709040649.jpg', '1709040649', '2024-02-27 12:30:49', '2024-02-27 12:30:49'),
(17, '1709040657342', 'Netro Creative', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709040657.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709040657.jpg', '1709040657', '2024-02-27 12:30:57', '2024-02-27 12:30:57'),
(18, '1709040899609', 'Netro Creative', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709040899.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709040899.jpg', '1709040899', '2024-02-27 12:34:59', '2024-02-27 12:34:59'),
(19, '1709040911352', 'Netro Creative', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709040911.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709040911.jpg', '1709040911', '2024-02-27 12:35:11', '2024-02-27 12:35:11'),
(20, '1709449283248', 'Inspired AI-Netro', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709449283.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709449283.jpg', '1709449283', '2024-03-03 06:01:23', '2024-03-03 06:01:23'),
(21, '1709449289822', 'Inspired AI-Netro', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709449289.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709449289.jpg', '1709449289', '2024-03-03 06:01:29', '2024-03-03 06:01:29'),
(22, '1709449296296', 'Inspired AI-Netro', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709449296.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709449296.jpg', '1709449296', '2024-03-03 06:01:36', '2024-03-03 06:01:36'),
(23, '1709449301905', 'Inspired AI-Netro', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709449301.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709449301.jpg', '1709449301', '2024-03-03 06:01:41', '2024-03-03 06:01:41'),
(25, '1709449314680', 'Inspired AI-Netro', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709449314.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709449314.jpg', '1709449314', '2024-03-03 06:01:54', '2024-03-03 06:01:54'),
(26, '1709449325558', 'Inspired AI-Netro', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709449325.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709449325.jpg', '1709449325', '2024-03-03 06:02:05', '2024-03-03 06:02:05'),
(27, '1709449336321', 'Inspired AI-Netro', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709449336.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709449336.jpg', '1709449336', '2024-03-03 06:02:16', '2024-03-03 06:02:16'),
(28, '1709449342567', 'Inspired AI-Netro', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709449342.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709449342.jpg', '1709449342', '2024-03-03 06:02:22', '2024-03-03 06:02:22'),
(29, '1709449349155', 'Inspired AI-Netro', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709449349.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709449349.jpg', '1709449349', '2024-03-03 06:02:29', '2024-03-03 06:02:29'),
(30, '1709449354807', 'Inspired AI-Netro', 'https://jazakallah-server.product8.net/../storage/wallpaper_images/wallpaper_1709449354.jpg', 'https://jazakallah-server.product8.net/../storage/thumbnail_images/thumbnail_1709449354.jpg', '1709449354', '2024-03-03 06:02:34', '2024-03-03 06:02:34');

-- --------------------------------------------------------

--
-- Table structure for table `zakats`
--

CREATE TABLE `zakats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `_id` varchar(255) NOT NULL,
  `USD` double NOT NULL,
  `BDT` double NOT NULL,
  `INR` double NOT NULL,
  `PKR` double NOT NULL,
  `IDR` double NOT NULL,
  `TRY` double NOT NULL,
  `MYR` double NOT NULL,
  `SAR` double NOT NULL,
  `zakatId` int(11) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zakats`
--

INSERT INTO `zakats` (`id`, `_id`, `USD`, `BDT`, `INR`, `PKR`, `IDR`, `TRY`, `MYR`, `SAR`, `zakatId`, `timestamp`, `created_at`, `updated_at`) VALUES
(1, '1709035258537', 401.8, 44075, 33312.33, 112303.83, 6293413.99, 12513.02, 1913.38, 1506.94, 1, '1709035258', '2024-02-27 11:00:58', '2024-02-27 19:59:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `azkars`
--
ALTER TABLE `azkars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `azkar_categories`
--
ALTER TABLE `azkar_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `duas`
--
ALTER TABLE `duas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dua_categories`
--
ALTER TABLE `dua_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `forget_passes`
--
ALTER TABLE `forget_passes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hadiths`
--
ALTER TABLE `hadiths`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hadith_categories`
--
ALTER TABLE `hadith_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_links`
--
ALTER TABLE `live_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_histories`
--
ALTER TABLE `notification_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `one_signals`
--
ALTER TABLE `one_signals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `profile_images`
--
ALTER TABLE `profile_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallpapers`
--
ALTER TABLE `wallpapers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zakats`
--
ALTER TABLE `zakats`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `azkars`
--
ALTER TABLE `azkars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `azkar_categories`
--
ALTER TABLE `azkar_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `duas`
--
ALTER TABLE `duas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `dua_categories`
--
ALTER TABLE `dua_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forget_passes`
--
ALTER TABLE `forget_passes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hadiths`
--
ALTER TABLE `hadiths`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `hadith_categories`
--
ALTER TABLE `hadith_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `live_links`
--
ALTER TABLE `live_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `notification_histories`
--
ALTER TABLE `notification_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `one_signals`
--
ALTER TABLE `one_signals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profile_images`
--
ALTER TABLE `profile_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wallpapers`
--
ALTER TABLE `wallpapers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `zakats`
--
ALTER TABLE `zakats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
