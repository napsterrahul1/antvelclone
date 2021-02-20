-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2016 at 02:45 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `antvel`
--

-- --------------------------------------------------------

--
-- Table structure for table `action_types`
--

CREATE TABLE `action_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `source_type` enum('tag','order','free_product','order_detail','paypal') COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `action_types`
--

INSERT INTO `action_types` (`id`, `source_type`, `action`) VALUES
(1, 'order', 'open'),
(2, 'order', 'pending'),
(3, 'order', 'comment'),
(4, 'order_detail', 'create'),
(5, 'order_detail', 'update'),
(6, 'order', 'reload points'),
(7, 'order', 'check out'),
(8, 'order', 'closed'),
(9, 'order', 'cancelled'),
(10, 'order', 'received'),
(11, 'order', 'sent'),
(12, 'free_product', 'check out'),
(13, 'paypal', 'buy points'),
(14, 'order', 'rate'),
(15, 'order', 'processing');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '1',
  `line1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name_contact` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `default`, `line1`, `line2`, `phone`, `name_contact`, `zipcode`, `city`, `country`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 0, '19672 Reese Brooks', '5076 Gutkowski Throughway Suite 985', '+1776410458846', 'Wolf Loaf', '19092', 'Clovisstad', 'Cameroon', 'District of Columbia', '2016-11-29 10:30:10', '2016-11-29 10:30:10', NULL),
(2, 4, 0, '559 Marjorie Stravenue Suite 142', '9633 Stanton Mills Suite 289', '+8108468540645', 'Jordane Street', '67886-2513', 'Luettgenmouth', 'Aruba', 'Rhode Island', '2016-11-29 10:30:10', '2016-11-29 10:30:10', NULL),
(3, 4, 0, '7191 Cheyenne Street Suite 495', '703 Kunze Prairie', '+8090021194955', 'Cleta Turnpike', '03110-9888', 'East Lontown', 'Dominican Republic', 'Ohio', '2016-11-29 10:30:10', '2016-11-29 10:30:10', NULL),
(4, 3, 0, '648 Timothy Corners', '6013 Brooklyn Ports Suite 719', '+9038055361303', 'Jairo Lodge', '37036-3409', 'Quintonberg', 'Libyan Arab Jamahiriya', 'North Dakota', '2016-11-29 10:30:10', '2016-11-29 10:30:10', NULL),
(5, 17, 0, '973 Ursula Mountain Suite 369', '80442 Elmore Avenue', '+7542463979222', 'Yazmin Vista', '70212', 'Reichelberg', 'Burundi', 'Mississippi', '2016-11-29 10:30:10', '2016-11-29 10:30:10', NULL),
(6, 13, 0, '77305 Funk Crossing Suite 359', '464 Hosea Mill Suite 036', '+5864422962001', 'Senger Summit', '75800', 'Lake Christ', 'Kyrgyz Republic', 'Hawaii', '2016-11-29 10:30:10', '2016-11-29 10:30:10', NULL),
(7, 13, 0, '703 Rosa Bridge Suite 372', '1923 Keely Loaf Apt. 517', '+7899925237286', 'Rau Radial', '21143', 'Juliechester', 'Benin', 'New Mexico', '2016-11-29 10:30:10', '2016-11-29 10:30:10', NULL),
(8, 22, 0, '330 Farrell Corners Suite 473', '337 Monique Hollow', '+2509945562714', 'Schaden Mountains', '31183', 'Jerdemouth', 'Mauritius', 'New Mexico', '2016-11-29 10:30:10', '2016-11-29 10:30:10', NULL),
(9, 18, 0, '53097 Tracy Turnpike', '2718 Mueller Divide Apt. 420', '+7142844994031', 'Beier Islands', '54731', 'Lake Josefa', 'Austria', 'Pennsylvania', '2016-11-29 10:30:10', '2016-11-29 10:30:10', NULL),
(10, 9, 0, '65545 Powlowski Island Suite 386', '71672 Marisa Forks Apt. 314', '+6787004172878', 'Gleichner Avenue', '80727-9339', 'Beahanport', 'Bahrain', 'Delaware', '2016-11-29 10:30:11', '2016-11-29 10:30:11', NULL),
(11, 4, 1, '6664 Wisozk Branch', '1543 Alford Expressway Suite 192', '+4544621644299', 'Hattie Rapid', '18587-7689', 'South Wallace', 'Angola', 'New York', '2016-11-29 10:30:45', '2016-11-29 10:30:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `businesses`
--

CREATE TABLE `businesses` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `business_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` date NOT NULL,
  `local_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate_val` int(11) DEFAULT NULL,
  `rate_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `businesses`
--

INSERT INTO `businesses` (`user_id`, `business_name`, `creation_date`, `local_phone`, `rate_val`, `rate_count`) VALUES
(3, 'antvel seller', '2011-09-14', '+0691208803558', NULL, NULL),
(15, 'Krajcik Inc', '1981-01-02', '+0767241228097', NULL, NULL),
(16, 'Rutherford Inc', '2003-08-28', '+8704945581034', NULL, NULL),
(17, 'Wilkinson, Blanda and Quigley', '2016-09-13', '+9542376203376', NULL, NULL),
(18, 'McClure, Jenkins and Satterfield', '1985-07-09', '+2964205971233', NULL, NULL),
(19, 'Mills, Erdman and Reynolds', '2002-08-15', '+0936628689652', NULL, NULL),
(20, 'Schuppe-Pfannerstill', '2011-10-19', '+1702961776432', NULL, NULL),
(21, 'Anderson-Ward', '2006-06-16', '+5983434253290', NULL, NULL),
(22, 'Corkery Ltd', '1972-11-06', '+4117907249600', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `type` enum('group','store') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_id`, `name`, `description`, `icon`, `image`, `status`, `type`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Digital & Music', 'Vel hic et quia animi mollitia fuga mollitia. Dolores quibusdam qui commodi aut ut sunt.', 'fui-location', 'test', 1, 'group', '2016-11-29 10:29:24', '2016-11-29 10:29:24'),
(2, 1, 'Music', 'Fugit odio quos eum autem sint. Asperiores rerum omnis itaque illo ut libero eos.', 'fui-video', 'testsub', 1, 'group', '2016-11-29 10:29:25', '2016-11-29 10:29:25'),
(3, 2, 'another sub', 'Alias saepe ea vero esse quisquam. Rerum ad aut sed nemo.', 'fui-plus-circle', 'testsubsub', 1, 'group', '2016-11-29 10:29:25', '2016-11-29 10:29:25'),
(4, 2, 'another sub', 'Vel ut rem alias nihil minus nisi tempora. Quia culpa ratione ratione culpa velit sint.', 'fui-check', 'testsubsub', 1, 'group', '2016-11-29 10:29:26', '2016-11-29 10:29:26'),
(5, 1, 'New Releases', 'Non sit pariatur omnis est quae autem. Vitae cumque placeat dolorem fuga qui nisi.', 'fui-video', 'testsub', 1, 'group', '2016-11-29 10:29:26', '2016-11-29 10:29:26'),
(6, 5, 'another sub', 'Inventore eaque ut corrupti et cum ipsam. Soluta vel vel aperiam quidem animi incidunt.', 'fui-cmd', 'testsubsub', 1, 'group', '2016-11-29 10:29:27', '2016-11-29 10:29:27'),
(7, 5, 'another sub', 'Odio nemo beatae debitis id animi. Quod fugiat et expedita iste minima reiciendis qui.', 'fui-heart', 'testsubsub', 1, 'group', '2016-11-29 10:29:27', '2016-11-29 10:29:27'),
(8, 1, 'Deals', 'Excepturi ut temporibus dicta. Vel explicabo iste non sint.', 'fui-list', 'testsub', 1, 'group', '2016-11-29 10:29:27', '2016-11-29 10:29:27'),
(9, 8, 'another sub', 'Perferendis hic laudantium qui sint rem consequatur natus.', 'fui-eye', 'testsubsub', 1, 'group', '2016-11-29 10:29:27', '2016-11-29 10:29:27'),
(10, 8, 'another sub', 'Quasi ullam enim corrupti dolor. Architecto esse placeat aut ut incidunt veniam.', 'fui-eye', 'testsubsub', 1, 'group', '2016-11-29 10:29:28', '2016-11-29 10:29:28'),
(11, 1, 'Music Library', 'Nostrum illum doloremque magnam corrupti nihil consequatur.', 'fui-location', 'testsub', 1, 'group', '2016-11-29 10:29:28', '2016-11-29 10:29:28'),
(12, 11, 'another sub', 'Vel labore quas error nam aut iusto sit.', 'fui-plus-circle', 'testsubsub', 1, 'group', '2016-11-29 10:29:28', '2016-11-29 10:29:28'),
(13, 11, 'another sub', 'Velit soluta consequuntur deleniti deleniti.', 'fui-check-circle', 'testsubsub', 1, 'group', '2016-11-29 10:29:28', '2016-11-29 10:29:28'),
(14, NULL, 'Books & Audible', 'Dolorum sequi et eos voluptatem doloremque. Porro est error quam qui.', 'fui-eye', 'test', 1, 'store', '2016-11-29 10:29:28', '2016-11-29 10:29:28'),
(15, 14, 'Books', 'Voluptatibus quisquam aliquid hic voluptatem veniam magnam incidunt dolor.', 'fui-plus', 'testsub', 1, 'store', '2016-11-29 10:29:29', '2016-11-29 10:29:29'),
(16, 15, 'another sub', 'Exercitationem accusantium repudiandae quis quis minima. Quisquam autem sed dolores quas.', 'fui-cmd', 'testsubsub', 1, 'store', '2016-11-29 10:29:29', '2016-11-29 10:29:29'),
(17, 15, 'another sub', 'Ab qui esse ipsam dolores. Sunt eligendi fuga doloribus beatae adipisci rem.', 'fui-question-circle', 'testsubsub', 1, 'store', '2016-11-29 10:29:29', '2016-11-29 10:29:29'),
(18, 14, 'Children Books', 'Sapiente voluptates sint et est quam voluptatibus.', 'fui-location', 'testsub', 1, 'store', '2016-11-29 10:29:29', '2016-11-29 10:29:29'),
(19, 18, 'another sub', 'Quidem blanditiis sint maxime id et aspernatur. Eos vel aut nam ea laudantium minus.', 'fui-arrow-left', 'testsubsub', 1, 'store', '2016-11-29 10:29:29', '2016-11-29 10:29:29'),
(20, 18, 'another sub', 'Laboriosam dolor voluptatem saepe assumenda. Quis est ut placeat.', 'fui-plus', 'testsubsub', 1, 'store', '2016-11-29 10:29:29', '2016-11-29 10:29:29'),
(21, 14, 'Textbooks', 'Quia aut adipisci et illum consequatur voluptas sint.', 'fui-video', 'testsub', 1, 'store', '2016-11-29 10:29:29', '2016-11-29 10:29:29'),
(22, 21, 'another sub', 'Maxime iste molestiae in corporis. Placeat ut placeat officiis aut doloribus eaque qui.', 'fui-chat', 'testsubsub', 1, 'store', '2016-11-29 10:29:29', '2016-11-29 10:29:29'),
(23, 21, 'another sub', 'Porro eos facilis aut non ut dicta eligendi. Nobis vel corrupti mollitia alias quo.', 'fui-eye', 'testsubsub', 1, 'store', '2016-11-29 10:29:30', '2016-11-29 10:29:30'),
(24, 14, 'Magazines', 'Veritatis eum nostrum aut. Et consequuntur blanditiis deserunt at et aliquid.', 'fui-export', 'testsub', 1, 'store', '2016-11-29 10:29:30', '2016-11-29 10:29:30'),
(25, 24, 'another sub', 'Vitae itaque qui officia distinctio.', 'fui-heart', 'testsubsub', 1, 'store', '2016-11-29 10:29:30', '2016-11-29 10:29:30'),
(26, 24, 'another sub', 'Magnam voluptate minus corrupti id. Est ducimus reiciendis voluptas.', 'fui-user', 'testsubsub', 1, 'store', '2016-11-29 10:29:30', '2016-11-29 10:29:30'),
(27, 14, 'Audible Audiobooks & More', 'Vel culpa excepturi voluptatibus libero voluptatibus.', 'fui-home', 'testsub', 1, 'store', '2016-11-29 10:29:30', '2016-11-29 10:29:30'),
(28, 27, 'another sub', 'Error a labore eveniet iure. Quas neque sed sapiente fugiat nam.', 'fui-heart', 'testsubsub', 1, 'store', '2016-11-29 10:29:31', '2016-11-29 10:29:31'),
(29, 27, 'another sub', 'Et id dignissimos ut omnis ullam ut. Eos et commodi magni quia fugit consequatur nisi.', 'fui-home', 'testsubsub', 1, 'store', '2016-11-29 10:29:31', '2016-11-29 10:29:31'),
(30, NULL, 'Movies, Music & Games', 'Nam illo exercitationem facere et eaque. Omnis ullam cupiditate molestias nesciunt.', 'fui-user', 'test', 1, 'group', '2016-11-29 10:29:31', '2016-11-29 10:29:31'),
(31, 30, 'Movies & TV', 'Excepturi quia consequuntur fuga ullam. Eaque eaque ut sit error.', 'fui-cmd', 'testsub', 1, 'group', '2016-11-29 10:29:31', '2016-11-29 10:29:31'),
(32, 31, 'another sub', 'Maiores possimus eos molestiae vero voluptate eius.', 'fui-windows', 'testsubsub', 1, 'group', '2016-11-29 10:29:31', '2016-11-29 10:29:31'),
(33, 31, 'another sub', 'Et quas et nemo atque enim pariatur. Magnam sint et libero nihil cumque nemo.', 'fui-upload', 'testsubsub', 1, 'group', '2016-11-29 10:29:31', '2016-11-29 10:29:31'),
(34, 30, 'Blu-ray', 'Doloribus quae numquam quia ipsa.', 'fui-export', 'testsub', 1, 'group', '2016-11-29 10:29:31', '2016-11-29 10:29:31'),
(35, 34, 'another sub', 'Tempore nihil itaque veniam dolor quos. Sit ipsum ad nobis dolore quas.', 'fui-home', 'testsubsub', 1, 'group', '2016-11-29 10:29:32', '2016-11-29 10:29:32'),
(36, 34, 'another sub', 'Error consectetur incidunt reiciendis dicta voluptatum accusantium assumenda.', 'fui-cross-circle', 'testsubsub', 1, 'group', '2016-11-29 10:29:32', '2016-11-29 10:29:32'),
(37, 30, 'CDs & Vinyl', 'Id nihil pariatur eos quasi rerum asperiores. Itaque rerum id et.', 'fui-mail', 'testsub', 1, 'group', '2016-11-29 10:29:32', '2016-11-29 10:29:32'),
(38, 37, 'another sub', 'Id enim quia laborum perferendis ut ut.', 'fui-plus-circle', 'testsubsub', 1, 'group', '2016-11-29 10:29:32', '2016-11-29 10:29:32'),
(39, 37, 'another sub', 'Voluptas et earum ipsa mollitia commodi quisquam repudiandae.', 'fui-upload', 'testsubsub', 1, 'group', '2016-11-29 10:29:33', '2016-11-29 10:29:33'),
(40, 30, 'Digital Music', 'Deleniti minus dolorem corporis temporibus est et.', 'fui-plus-circle', 'testsub', 1, 'group', '2016-11-29 10:29:33', '2016-11-29 10:29:33'),
(41, 40, 'another sub', 'Est aspernatur delectus ea iste vero qui minima a.', 'fui-loop', 'testsubsub', 1, 'group', '2016-11-29 10:29:33', '2016-11-29 10:29:33'),
(42, 40, 'another sub', 'Aliquam quod omnis molestiae tempore. Repellendus voluptatem mollitia aut et.', 'fui-cross', 'testsubsub', 1, 'group', '2016-11-29 10:29:33', '2016-11-29 10:29:33'),
(43, 30, 'Musical Instruments', 'Officiis rerum a quasi ut consequatur voluptatem doloremque labore.', 'fui-upload', 'testsub', 1, 'group', '2016-11-29 10:29:33', '2016-11-29 10:29:33'),
(44, 43, 'another sub', 'Eos ullam sint dignissimos delectus. Tempore aut qui in quo autem et in.', 'fui-mail', 'testsubsub', 1, 'group', '2016-11-29 10:29:33', '2016-11-29 10:29:33'),
(45, 43, 'another sub', 'Velit iusto vero nostrum tenetur ex rem. Veritatis quo cum et placeat.', 'fui-mic', 'testsubsub', 1, 'group', '2016-11-29 10:29:33', '2016-11-29 10:29:33'),
(46, 30, 'Video Games', 'Sapiente nihil enim et. Molestias nihil dolore est.', 'fui-check-circle', 'testsub', 1, 'group', '2016-11-29 10:29:34', '2016-11-29 10:29:34'),
(47, 46, 'another sub', 'Laudantium id praesentium repellat est odit maiores.', 'fui-video', 'testsubsub', 1, 'group', '2016-11-29 10:29:34', '2016-11-29 10:29:34'),
(48, 46, 'another sub', 'Ut totam perspiciatis quia asperiores ut accusantium.', 'fui-time', 'testsubsub', 1, 'group', '2016-11-29 10:29:34', '2016-11-29 10:29:34'),
(49, 30, 'Digital Games', 'Porro itaque praesentium voluptas quod dolores.', 'fui-location', 'testsub', 1, 'group', '2016-11-29 10:29:34', '2016-11-29 10:29:34'),
(50, 49, 'another sub', 'Odit dolorum labore explicabo est doloribus. Id consectetur mollitia autem aperiam.', 'fui-export', 'testsubsub', 1, 'group', '2016-11-29 10:29:34', '2016-11-29 10:29:34'),
(51, 49, 'another sub', 'Quae perspiciatis sed id dolor officiis.', 'fui-info-circle', 'testsubsub', 1, 'group', '2016-11-29 10:29:34', '2016-11-29 10:29:34'),
(52, 30, 'Entertainment Collectibles', 'Maiores tenetur saepe ut earum ut. Ut laboriosam et nostrum. Non quas iure quia sapiente.', 'fui-eye', 'testsub', 1, 'group', '2016-11-29 10:29:35', '2016-11-29 10:29:35'),
(53, 52, 'another sub', 'Labore reprehenderit praesentium harum consectetur repellendus.', 'fui-cross-circle', 'testsubsub', 1, 'group', '2016-11-29 10:29:35', '2016-11-29 10:29:35'),
(54, 52, 'another sub', 'Pariatur qui numquam esse temporibus praesentium et dolores.', 'fui-windows', 'testsubsub', 1, 'group', '2016-11-29 10:29:35', '2016-11-29 10:29:35'),
(55, 30, 'Trade In Movies, Music & Games', 'In voluptate molestiae at voluptatibus fugit soluta cupiditate voluptatibus.', 'fui-windows', 'testsub', 1, 'group', '2016-11-29 10:29:35', '2016-11-29 10:29:35'),
(56, 55, 'another sub', 'Culpa quidem hic eius quaerat eveniet.', 'fui-new', 'testsubsub', 1, 'group', '2016-11-29 10:29:35', '2016-11-29 10:29:35'),
(57, 55, 'another sub', 'Molestiae vel expedita eos et animi aperiam quis.', 'fui-window', 'testsubsub', 1, 'group', '2016-11-29 10:29:35', '2016-11-29 10:29:35'),
(58, NULL, 'Electronics & Computers', 'Velit eos ea et facere corrupti. Id architecto voluptatem placeat sed.', 'fui-user', 'test', 1, 'store', '2016-11-29 10:29:36', '2016-11-29 10:29:36'),
(59, 58, 'TV & Video', 'Adipisci ut et dolores omnis doloremque et et.', 'fui-list', 'testsub', 1, 'store', '2016-11-29 10:29:36', '2016-11-29 10:29:36'),
(60, 59, 'another sub', 'Nihil velit modi ex qui et id.', 'fui-check', 'testsubsub', 1, 'store', '2016-11-29 10:29:36', '2016-11-29 10:29:36'),
(61, 59, 'another sub', 'Consequatur occaecati velit suscipit modi. Cumque rem dignissimos quia ex.', 'fui-plus-circle', 'testsubsub', 1, 'store', '2016-11-29 10:29:36', '2016-11-29 10:29:36'),
(62, 58, 'Home Audio & Theater', 'Dignissimos modi voluptatibus similique.', 'fui-loop', 'testsub', 1, 'store', '2016-11-29 10:29:36', '2016-11-29 10:29:36'),
(63, 62, 'another sub', 'Optio fugit voluptatem aut consequatur sed accusantium.', 'fui-windows', 'testsubsub', 1, 'store', '2016-11-29 10:29:36', '2016-11-29 10:29:36'),
(64, 62, 'another sub', 'Cupiditate quae id consequatur. Aperiam omnis est non delectus.', 'fui-question-circle', 'testsubsub', 1, 'store', '2016-11-29 10:29:36', '2016-11-29 10:29:36'),
(65, 58, 'Camera, Photo & Video', 'In et excepturi saepe accusamus et in et.', 'fui-eye', 'testsub', 1, 'store', '2016-11-29 10:29:37', '2016-11-29 10:29:37'),
(66, 65, 'another sub', 'Voluptatum pariatur sequi et earum.', 'fui-mail', 'testsubsub', 1, 'store', '2016-11-29 10:29:37', '2016-11-29 10:29:37'),
(67, 65, 'another sub', 'Qui maxime distinctio in quod ea. Quo ex et ex quasi.', 'fui-mail', 'testsubsub', 1, 'store', '2016-11-29 10:29:37', '2016-11-29 10:29:37'),
(68, 58, 'Cell Phones & Accessories', 'Quos ipsa sequi eum facere quae minima. Et eius assumenda repellat vitae.', 'fui-check-circle', 'testsub', 1, 'store', '2016-11-29 10:29:37', '2016-11-29 10:29:37'),
(69, 68, 'another sub', 'Eum debitis ut deserunt numquam laborum.', 'fui-chat', 'testsubsub', 1, 'store', '2016-11-29 10:29:37', '2016-11-29 10:29:37'),
(70, 68, 'another sub', 'Quae nostrum officiis omnis mollitia. Commodi repudiandae fugit dignissimos officia.', 'fui-check-circle', 'testsubsub', 1, 'store', '2016-11-29 10:29:37', '2016-11-29 10:29:37'),
(71, 58, 'Video Games', 'Et dolor amet incidunt itaque earum perferendis consectetur.', 'fui-upload', 'testsub', 1, 'store', '2016-11-29 10:29:37', '2016-11-29 10:29:37'),
(72, 71, 'another sub', 'Beatae ipsum magnam cum libero. Eaque recusandae nemo asperiores possimus.', 'fui-mail', 'testsubsub', 1, 'store', '2016-11-29 10:29:37', '2016-11-29 10:29:37'),
(73, 71, 'another sub', 'Dolores amet repellendus praesentium aut quis magnam.', 'fui-cross', 'testsubsub', 1, 'store', '2016-11-29 10:29:38', '2016-11-29 10:29:38'),
(74, 58, 'Portable Audio & Accessories', 'Eius et eos eveniet fugit incidunt dolores. Repudiandae voluptate iste tempore est.', 'fui-location', 'testsub', 1, 'store', '2016-11-29 10:29:38', '2016-11-29 10:29:38'),
(75, 74, 'another sub', 'Dicta dolorum impedit voluptatibus quaerat.', 'fui-chat', 'testsubsub', 1, 'store', '2016-11-29 10:29:38', '2016-11-29 10:29:38'),
(76, 74, 'another sub', 'Praesentium nulla dolorum numquam mollitia.', 'fui-eye', 'testsubsub', 1, 'store', '2016-11-29 10:29:38', '2016-11-29 10:29:38'),
(77, 58, 'Car Electronics & GPS', 'Impedit voluptatibus repellat veritatis deserunt maiores voluptas laudantium.', 'fui-plus-circle', 'testsub', 1, 'store', '2016-11-29 10:29:38', '2016-11-29 10:29:38'),
(78, 77, 'another sub', 'Autem nostrum ea aut sed cumque sed a.', 'fui-search', 'testsubsub', 1, 'store', '2016-11-29 10:29:38', '2016-11-29 10:29:38'),
(79, 77, 'another sub', 'Sapiente ea deserunt excepturi occaecati ad et sunt.', 'fui-home', 'testsubsub', 1, 'store', '2016-11-29 10:29:39', '2016-11-29 10:29:39'),
(80, 58, 'Musical Instruments', 'Possimus officia ipsum eius et ut expedita consectetur ducimus. Neque rerum odio aut.', 'fui-upload', 'testsub', 1, 'store', '2016-11-29 10:29:39', '2016-11-29 10:29:39'),
(81, 80, 'another sub', 'Illum est enim in est voluptatem. Doloremque dolorum repudiandae eaque voluptatem.', 'fui-cmd', 'testsubsub', 1, 'store', '2016-11-29 10:29:39', '2016-11-29 10:29:39'),
(82, 80, 'another sub', 'Sint qui quae et sit aut repellat. Incidunt veniam porro dolores.', 'fui-arrow-right', 'testsubsub', 1, 'store', '2016-11-29 10:29:39', '2016-11-29 10:29:39'),
(83, 58, 'Electronics Accessories', 'Commodi saepe aperiam rem beatae qui. Neque aut enim nisi aperiam.', 'fui-search', 'testsub', 1, 'store', '2016-11-29 10:29:39', '2016-11-29 10:29:39'),
(84, 83, 'another sub', 'Necessitatibus in dolores autem corrupti nisi est iure sint.', 'fui-new', 'testsubsub', 1, 'store', '2016-11-29 10:29:39', '2016-11-29 10:29:39'),
(85, 83, 'another sub', 'Est consequatur omnis consequatur ullam. Quae quidem consequatur iusto odio.', 'fui-check-circle', 'testsubsub', 1, 'store', '2016-11-29 10:29:39', '2016-11-29 10:29:39'),
(86, 58, 'Wearable Technology', 'Dolore modi totam recusandae cumque libero.', 'fui-window', 'testsub', 1, 'store', '2016-11-29 10:29:39', '2016-11-29 10:29:39'),
(87, 86, 'another sub', 'Quia magnam non dignissimos consectetur nesciunt incidunt dolore.', 'fui-photo', 'testsubsub', 1, 'store', '2016-11-29 10:29:39', '2016-11-29 10:29:39'),
(88, 86, 'another sub', 'Similique exercitationem odio quod sint voluptas.', 'fui-check', 'testsubsub', 1, 'store', '2016-11-29 10:29:39', '2016-11-29 10:29:39'),
(89, 58, 'Laptops & Tablets', 'Ullam odit assumenda corporis quisquam est dignissimos.', 'fui-photo', 'testsub', 1, 'store', '2016-11-29 10:29:40', '2016-11-29 10:29:40'),
(90, 89, 'another sub', 'Dolorem quidem eos vitae cum enim laborum repudiandae ipsam.', 'fui-plus', 'testsubsub', 1, 'store', '2016-11-29 10:29:40', '2016-11-29 10:29:40'),
(91, 89, 'another sub', 'Quibusdam ut qui aliquam ut exercitationem saepe.', 'fui-cross-circle', 'testsubsub', 1, 'store', '2016-11-29 10:29:40', '2016-11-29 10:29:40'),
(92, 58, 'Desktops & Monitors', 'Odio velit inventore mollitia commodi ut. Necessitatibus molestiae explicabo enim.', 'fui-plus', 'testsub', 1, 'store', '2016-11-29 10:29:41', '2016-11-29 10:29:41'),
(93, 92, 'another sub', 'Voluptatum autem et qui ea quia minus sed.', 'fui-mic', 'testsubsub', 1, 'store', '2016-11-29 10:29:41', '2016-11-29 10:29:41'),
(94, 92, 'another sub', 'Porro repudiandae impedit nulla atque dolores. Deserunt enim vel eos.', 'fui-loop', 'testsubsub', 1, 'store', '2016-11-29 10:29:41', '2016-11-29 10:29:41'),
(95, 58, 'Computer Accessories & Peripherals', 'Expedita saepe illum consequatur. Quidem repellat quam facilis non.', 'fui-arrow-left', 'testsub', 1, 'store', '2016-11-29 10:29:41', '2016-11-29 10:29:41'),
(96, 95, 'another sub', 'Autem sit libero omnis ea non quia aut molestiae. Aperiam sunt non ut officia.', 'fui-time', 'testsubsub', 1, 'store', '2016-11-29 10:29:41', '2016-11-29 10:29:41'),
(97, 95, 'another sub', 'Expedita esse sunt excepturi rerum laborum voluptas aut.', 'fui-cross', 'testsubsub', 1, 'store', '2016-11-29 10:29:41', '2016-11-29 10:29:41'),
(98, 58, 'Computer Parts & Components', 'Ut eos fugiat ut sapiente quos eveniet. Inventore quas corporis voluptate.', 'fui-window', 'testsub', 1, 'store', '2016-11-29 10:29:41', '2016-11-29 10:29:41'),
(99, 98, 'another sub', 'Eos mollitia similique et. Ea aspernatur soluta voluptatibus velit voluptate.', 'fui-upload', 'testsubsub', 1, 'store', '2016-11-29 10:29:41', '2016-11-29 10:29:41'),
(100, 98, 'another sub', 'Minus et et provident vel similique ipsam debitis.', 'fui-chat', 'testsubsub', 1, 'store', '2016-11-29 10:29:41', '2016-11-29 10:29:41'),
(101, 58, 'Software', 'Sit labore nihil excepturi quis quisquam culpa consequuntur nam.', 'fui-search', 'testsub', 1, 'store', '2016-11-29 10:29:42', '2016-11-29 10:29:42'),
(102, 101, 'another sub', 'Doloremque voluptas ab reiciendis in.', 'fui-heart', 'testsubsub', 1, 'store', '2016-11-29 10:29:42', '2016-11-29 10:29:42'),
(103, 101, 'another sub', 'Molestiae odit incidunt dicta molestiae provident laudantium quia facere.', 'fui-eye', 'testsubsub', 1, 'store', '2016-11-29 10:29:42', '2016-11-29 10:29:42'),
(104, 58, 'Printers & Ink', 'Quo quisquam voluptatem neque et provident et. Soluta et aut sed.', 'fui-plus-circle', 'testsub', 1, 'store', '2016-11-29 10:29:42', '2016-11-29 10:29:42'),
(105, 104, 'another sub', 'Reiciendis ut est cupiditate. Eos aut deserunt et eum sunt.', 'fui-loop', 'testsubsub', 1, 'store', '2016-11-29 10:29:42', '2016-11-29 10:29:42'),
(106, 104, 'another sub', 'Aut quia et quis aut. In et est maxime fuga laborum odio.', 'fui-time', 'testsubsub', 1, 'store', '2016-11-29 10:29:42', '2016-11-29 10:29:42'),
(107, 58, 'Office & School Supplies', 'Dolor omnis molestias officiis labore vel. Cum expedita repellendus soluta eos rerum.', 'fui-alert-circle', 'testsub', 1, 'store', '2016-11-29 10:29:42', '2016-11-29 10:29:42'),
(108, 107, 'another sub', 'Tempora labore aut officiis sit repudiandae asperiores eveniet.', 'fui-mic', 'testsubsub', 1, 'store', '2016-11-29 10:29:43', '2016-11-29 10:29:43'),
(109, 107, 'another sub', 'Voluptatibus beatae saepe nihil hic ipsa voluptas pariatur ut.', 'fui-home', 'testsubsub', 1, 'store', '2016-11-29 10:29:43', '2016-11-29 10:29:43'),
(110, 58, 'Trade In Your Electronics', 'Necessitatibus et sapiente sapiente omnis ad.', 'fui-eye', 'testsub', 1, 'store', '2016-11-29 10:29:43', '2016-11-29 10:29:43'),
(111, 110, 'another sub', 'Facilis autem sed dicta. Expedita aliquam corporis ut deleniti. Dolorem id omnis error.', 'fui-plus', 'testsubsub', 1, 'store', '2016-11-29 10:29:43', '2016-11-29 10:29:43'),
(112, 110, 'another sub', 'Ut aut sapiente voluptates porro qui sequi. Illum soluta ducimus expedita qui magni nam.', 'fui-video', 'testsubsub', 1, 'store', '2016-11-29 10:29:43', '2016-11-29 10:29:43'),
(113, NULL, 'Home, Garden & Tools', 'Natus ex cupiditate deserunt dolores ut.', 'fui-check', 'test', 1, 'group', '2016-11-29 10:29:43', '2016-11-29 10:29:43'),
(114, 113, 'HomeKitchen & Dining', 'Possimus numquam et similique saepe natus vero ullam.', 'fui-plus-circle', 'testsub', 1, 'group', '2016-11-29 10:29:43', '2016-11-29 10:29:43'),
(115, 114, 'another sub', 'Tempore iusto incidunt quis quia repellendus ab totam.', 'fui-window', 'testsubsub', 1, 'group', '2016-11-29 10:29:43', '2016-11-29 10:29:43'),
(116, 114, 'another sub', 'Non reprehenderit ipsum ducimus maiores et impedit quod.', 'fui-eye', 'testsubsub', 1, 'group', '2016-11-29 10:29:44', '2016-11-29 10:29:44'),
(117, 113, 'Furniture & Décor', 'Fugiat voluptatem illo eveniet totam provident qui.', 'fui-eye', 'testsub', 1, 'group', '2016-11-29 10:29:44', '2016-11-29 10:29:44'),
(118, 117, 'another sub', 'Nam rerum et dolor ut earum aut. Temporibus totam est quisquam dolores autem libero.', 'fui-heart', 'testsubsub', 1, 'group', '2016-11-29 10:29:44', '2016-11-29 10:29:44'),
(119, 117, 'another sub', 'Consectetur non ut sunt minima dolore harum esse. Ex iusto mollitia unde ea nisi error.', 'fui-video', 'testsubsub', 1, 'group', '2016-11-29 10:29:44', '2016-11-29 10:29:44'),
(120, 113, 'Bedding & Bath', 'Qui officia dignissimos nemo et. Voluptas quis aut aperiam laboriosam nam.', 'fui-search', 'testsub', 1, 'group', '2016-11-29 10:29:44', '2016-11-29 10:29:44'),
(121, 120, 'another sub', 'Magni autem sunt dolorem ratione.', 'fui-eye', 'testsubsub', 1, 'group', '2016-11-29 10:29:44', '2016-11-29 10:29:44'),
(122, 120, 'another sub', 'Quidem dolor dolores et illo maiores et.', 'fui-export', 'testsubsub', 1, 'group', '2016-11-29 10:29:44', '2016-11-29 10:29:44'),
(123, 113, 'Appliances', 'Voluptatibus ut nihil reprehenderit temporibus iusto eaque.', 'fui-window', 'testsub', 1, 'group', '2016-11-29 10:29:44', '2016-11-29 10:29:44'),
(124, 123, 'another sub', 'Esse voluptatem magnam et. Non suscipit voluptas excepturi sit numquam.', 'fui-arrow-left', 'testsubsub', 1, 'group', '2016-11-29 10:29:45', '2016-11-29 10:29:45'),
(125, 123, 'another sub', 'In animi ut dolorem quaerat ea rem enim deserunt.', 'fui-eye', 'testsubsub', 1, 'group', '2016-11-29 10:29:45', '2016-11-29 10:29:45'),
(126, 113, 'Patio, Lawn & Garden', 'Vel quia porro reiciendis.', 'fui-window', 'testsub', 1, 'group', '2016-11-29 10:29:45', '2016-11-29 10:29:45'),
(127, 126, 'another sub', 'Et omnis atque autem sint illum et.', 'fui-heart', 'testsubsub', 1, 'group', '2016-11-29 10:29:45', '2016-11-29 10:29:45'),
(128, 126, 'another sub', 'Hic sint quo facere esse dolorem.', 'fui-new', 'testsubsub', 1, 'group', '2016-11-29 10:29:45', '2016-11-29 10:29:45'),
(129, 113, 'Fine Art', 'Quasi consectetur et doloribus neque consequatur maxime pariatur perferendis.', 'fui-new', 'testsub', 1, 'group', '2016-11-29 10:29:45', '2016-11-29 10:29:45'),
(130, 129, 'another sub', 'Dolorem aut officia ea at non. Eius esse et quia tempore non sed.', 'fui-cross-circle', 'testsubsub', 1, 'group', '2016-11-29 10:29:45', '2016-11-29 10:29:45'),
(131, 129, 'another sub', 'Id similique voluptatum facere nemo. Non facilis et facere nihil ut sed asperiores.', 'fui-cmd', 'testsubsub', 1, 'group', '2016-11-29 10:29:45', '2016-11-29 10:29:45'),
(132, 113, 'Arts, Crafts & Sewing', 'Officia magni aut ut qui perspiciatis.', 'fui-check-circle', 'testsub', 1, 'group', '2016-11-29 10:29:45', '2016-11-29 10:29:45'),
(133, 132, 'another sub', 'Qui enim quis omnis culpa eos quaerat sit.', 'fui-plus-circle', 'testsubsub', 1, 'group', '2016-11-29 10:29:46', '2016-11-29 10:29:46'),
(134, 132, 'another sub', 'Sint at error cumque commodi. Omnis voluptate in quae voluptatum reiciendis.', 'fui-search', 'testsubsub', 1, 'group', '2016-11-29 10:29:46', '2016-11-29 10:29:46'),
(135, 113, 'Pet Supplies', 'Illo ipsum et autem cupiditate dolorum sint a. Recusandae nobis corrupti et quas.', 'fui-arrow-right', 'testsub', 1, 'group', '2016-11-29 10:29:46', '2016-11-29 10:29:46'),
(136, 135, 'another sub', 'Aut nesciunt eveniet nihil eligendi dolorem deserunt. Rerum et ea placeat et nobis.', 'fui-time', 'testsubsub', 1, 'group', '2016-11-29 10:29:46', '2016-11-29 10:29:46'),
(137, 135, 'another sub', 'Minus voluptatum aliquam velit aut vel et dolorem voluptatum.', 'fui-check', 'testsubsub', 1, 'group', '2016-11-29 10:29:46', '2016-11-29 10:29:46'),
(138, 113, 'Wedding Registry', 'Reiciendis dolorum corrupti esse tempora in laborum.', 'fui-cmd', 'testsub', 1, 'group', '2016-11-29 10:29:46', '2016-11-29 10:29:46'),
(139, 138, 'another sub', 'Soluta nobis maxime quaerat sint quo est. Id commodi eos ducimus molestiae nulla.', 'fui-arrow-right', 'testsubsub', 1, 'group', '2016-11-29 10:29:46', '2016-11-29 10:29:46'),
(140, 138, 'another sub', 'Asperiores eos asperiores incidunt ipsa qui excepturi aut.', 'fui-windows', 'testsubsub', 1, 'group', '2016-11-29 10:29:47', '2016-11-29 10:29:47'),
(141, 113, 'Home Improvement', 'Veritatis enim aut at quasi vel sed et.', 'fui-video', 'testsub', 1, 'group', '2016-11-29 10:29:47', '2016-11-29 10:29:47'),
(142, 141, 'another sub', 'Mollitia voluptas aut dignissimos delectus.', 'fui-check', 'testsubsub', 1, 'group', '2016-11-29 10:29:47', '2016-11-29 10:29:47'),
(143, 141, 'another sub', 'Accusamus similique iusto sequi eaque eos dolore. Optio soluta ipsum itaque a quis.', 'fui-upload', 'testsubsub', 1, 'group', '2016-11-29 10:29:47', '2016-11-29 10:29:47'),
(144, 113, 'Power & Hand Tools', 'Qui ipsa enim unde hic. Explicabo et aut qui ut vitae velit.', 'fui-cross', 'testsub', 1, 'group', '2016-11-29 10:29:48', '2016-11-29 10:29:48'),
(145, 144, 'another sub', 'Explicabo et soluta quis qui laboriosam ex.', 'fui-home', 'testsubsub', 1, 'group', '2016-11-29 10:29:48', '2016-11-29 10:29:48'),
(146, 144, 'another sub', 'Delectus possimus iure officia officia iste mollitia. Debitis dolor veritatis quisquam.', 'fui-plus-circle', 'testsubsub', 1, 'group', '2016-11-29 10:29:48', '2016-11-29 10:29:48'),
(147, 113, 'Lamps & Light Fixtures', 'Sint a consequatur quisquam libero reiciendis sit.', 'fui-alert-circle', 'testsub', 1, 'group', '2016-11-29 10:29:48', '2016-11-29 10:29:48'),
(148, 147, 'another sub', 'Inventore iusto eveniet consequatur consequuntur sint consequatur dolore ut.', 'fui-mic', 'testsubsub', 1, 'group', '2016-11-29 10:29:48', '2016-11-29 10:29:48'),
(149, 147, 'another sub', 'Aut et dolorem culpa cupiditate debitis et sit.', 'fui-heart', 'testsubsub', 1, 'group', '2016-11-29 10:29:48', '2016-11-29 10:29:48'),
(150, 113, 'Kitchen & Bath Fixtures', 'Perspiciatis enim incidunt ut minima sit consectetur corrupti.', 'fui-new', 'testsub', 1, 'group', '2016-11-29 10:29:48', '2016-11-29 10:29:48'),
(151, 150, 'another sub', 'Dolores quod dolor rerum rerum quaerat hic a occaecati.', 'fui-loop', 'testsubsub', 1, 'group', '2016-11-29 10:29:48', '2016-11-29 10:29:48'),
(152, 150, 'another sub', 'Enim qui nostrum ut est sit amet odit. Consectetur a cum voluptatum.', 'fui-heart', 'testsubsub', 1, 'group', '2016-11-29 10:29:48', '2016-11-29 10:29:48'),
(153, 113, 'HardwareHome Automation', 'Quisquam et quo inventore eligendi ut. Dolorem numquam maiores cumque totam.', 'fui-check-circle', 'testsub', 1, 'group', '2016-11-29 10:29:48', '2016-11-29 10:29:48'),
(154, 153, 'another sub', 'Iste sit aliquam asperiores in quia voluptates.', 'fui-loop', 'testsubsub', 1, 'group', '2016-11-29 10:29:48', '2016-11-29 10:29:48'),
(155, 153, 'another sub', 'Aperiam a quia molestias enim. Accusantium ut ut voluptatum.', 'fui-upload', 'testsubsub', 1, 'group', '2016-11-29 10:29:48', '2016-11-29 10:29:48'),
(156, NULL, 'Beauty, Health & Grocery', 'Sit voluptatibus neque atque aperiam molestiae quae amet.', 'fui-window', 'test', 1, 'store', '2016-11-29 10:29:48', '2016-11-29 10:29:48'),
(157, 156, 'All Beauty', 'Explicabo reiciendis reiciendis qui.', 'fui-info-circle', 'testsub', 1, 'store', '2016-11-29 10:29:49', '2016-11-29 10:29:49'),
(158, 157, 'another sub', 'Voluptas libero qui natus culpa optio ipsum vitae.', 'fui-window', 'testsubsub', 1, 'store', '2016-11-29 10:29:49', '2016-11-29 10:29:49'),
(159, 157, 'another sub', 'Numquam et quisquam quod. Quibusdam sit aliquid dolorum odio.', 'fui-check-circle', 'testsubsub', 1, 'store', '2016-11-29 10:29:49', '2016-11-29 10:29:49'),
(160, 156, 'Luxury Beauty', 'Quas aut ut enim corporis aut voluptate debitis.', 'fui-upload', 'testsub', 1, 'store', '2016-11-29 10:29:49', '2016-11-29 10:29:49'),
(161, 160, 'another sub', 'Eaque aut qui numquam repellendus dicta quo esse. Praesentium qui ut aperiam.', 'fui-chat', 'testsubsub', 1, 'store', '2016-11-29 10:29:49', '2016-11-29 10:29:49'),
(162, 160, 'another sub', 'Eos necessitatibus non aut ab omnis. Et dolores nemo voluptatem.', 'fui-cmd', 'testsubsub', 1, 'store', '2016-11-29 10:29:49', '2016-11-29 10:29:49'),
(163, 156, 'Men’s Grooming', 'Aut veniam ut impedit voluptatum dolor.', 'fui-alert-circle', 'testsub', 1, 'store', '2016-11-29 10:29:49', '2016-11-29 10:29:49'),
(164, 163, 'another sub', 'Eius modi consectetur autem perspiciatis temporibus blanditiis et.', 'fui-cmd', 'testsubsub', 1, 'store', '2016-11-29 10:29:49', '2016-11-29 10:29:49'),
(165, 163, 'another sub', 'Repellat laboriosam consequatur quis id excepturi.', 'fui-window', 'testsubsub', 1, 'store', '2016-11-29 10:29:49', '2016-11-29 10:29:49'),
(166, 156, 'Health, Household & Baby Care', 'Sunt numquam qui voluptate officia sapiente. Illo quis quia mollitia aut fugiat.', 'fui-list', 'testsub', 1, 'store', '2016-11-29 10:29:49', '2016-11-29 10:29:49'),
(167, 166, 'another sub', 'Rerum aut sunt excepturi reiciendis aliquam distinctio.', 'fui-check', 'testsubsub', 1, 'store', '2016-11-29 10:29:49', '2016-11-29 10:29:49'),
(168, 166, 'another sub', 'Atque nesciunt hic id. Animi quod nesciunt dolor nam.', 'fui-check-circle', 'testsubsub', 1, 'store', '2016-11-29 10:29:49', '2016-11-29 10:29:49'),
(169, 156, 'Grocery & Gourmet Food', 'Excepturi vero soluta at velit est. Totam ad quas expedita nihil dicta earum.', 'fui-location', 'testsub', 1, 'store', '2016-11-29 10:29:49', '2016-11-29 10:29:49'),
(170, 169, 'another sub', 'Similique et est dolorum consequatur est est.', 'fui-info-circle', 'testsubsub', 1, 'store', '2016-11-29 10:29:49', '2016-11-29 10:29:49'),
(171, 169, 'another sub', 'Qui perferendis in odit nobis. Quo sit assumenda iure et ea amet optio ea.', 'fui-loop', 'testsubsub', 1, 'store', '2016-11-29 10:29:50', '2016-11-29 10:29:50'),
(172, 156, 'Specialty Diets', 'Et voluptas magnam natus blanditiis ea. Ut labore et et delectus. Cum qui qui et.', 'fui-export', 'testsub', 1, 'store', '2016-11-29 10:29:50', '2016-11-29 10:29:50'),
(173, 172, 'another sub', 'Amet deleniti doloremque laudantium blanditiis mollitia.', 'fui-loop', 'testsubsub', 1, 'store', '2016-11-29 10:29:50', '2016-11-29 10:29:50'),
(174, 172, 'another sub', 'Distinctio hic ut illo facilis. Aspernatur explicabo culpa doloribus.', 'fui-check', 'testsubsub', 1, 'store', '2016-11-29 10:29:50', '2016-11-29 10:29:50'),
(175, 156, 'Wine', 'Eum quod dolor et sed laboriosam. At et aut impedit qui voluptas odit beatae.', 'fui-alert-circle', 'testsub', 1, 'store', '2016-11-29 10:29:50', '2016-11-29 10:29:50'),
(176, 175, 'another sub', 'Ut recusandae consequatur explicabo quis occaecati omnis.', 'fui-video', 'testsubsub', 1, 'store', '2016-11-29 10:29:50', '2016-11-29 10:29:50'),
(177, 175, 'another sub', 'Quisquam nobis delectus excepturi consequatur magni totam.', 'fui-photo', 'testsubsub', 1, 'store', '2016-11-29 10:29:50', '2016-11-29 10:29:50'),
(178, 156, 'Subscribe & Save', 'Omnis expedita animi voluptas sit sit. Doloribus sit animi et.', 'fui-windows', 'testsub', 1, 'store', '2016-11-29 10:29:50', '2016-11-29 10:29:50'),
(179, 178, 'another sub', 'Iste eos sunt quasi incidunt possimus dolorem voluptas et.', 'fui-cmd', 'testsubsub', 1, 'store', '2016-11-29 10:29:50', '2016-11-29 10:29:50'),
(180, 178, 'another sub', 'Omnis rerum explicabo enim ducimus labore ea. Impedit nam et aspernatur alias.', 'fui-check-circle', 'testsubsub', 1, 'store', '2016-11-29 10:29:50', '2016-11-29 10:29:50'),
(181, NULL, 'Toys, Kids & Baby', 'Quidem ut architecto id doloribus molestiae deserunt illo.', 'fui-check', 'test', 1, 'group', '2016-11-29 10:29:51', '2016-11-29 10:29:51'),
(182, 181, 'Toys & Games', 'Provident aperiam ea neque. Facere ut nesciunt in dolore accusamus assumenda minima.', 'fui-mail', 'testsub', 1, 'group', '2016-11-29 10:29:51', '2016-11-29 10:29:51'),
(183, 182, 'another sub', 'Vero iste ut architecto aut quam sint molestiae. Eveniet libero eum officia doloremque.', 'fui-video', 'testsubsub', 1, 'group', '2016-11-29 10:29:51', '2016-11-29 10:29:51'),
(184, 182, 'another sub', 'Laboriosam quisquam repudiandae iure voluptas ut.', 'fui-photo', 'testsubsub', 1, 'group', '2016-11-29 10:29:51', '2016-11-29 10:29:51'),
(185, 181, 'Baby', 'Sint est quam nam earum. Molestiae nihil hic vitae non maiores.', 'fui-photo', 'testsub', 1, 'group', '2016-11-29 10:29:51', '2016-11-29 10:29:51'),
(186, 185, 'another sub', 'Beatae labore quaerat est provident magni qui.', 'fui-search', 'testsubsub', 1, 'group', '2016-11-29 10:29:51', '2016-11-29 10:29:51'),
(187, 185, 'another sub', 'Necessitatibus rem neque placeat at est maxime. Facere doloribus vel facilis hic vel et.', 'fui-question-circle', 'testsubsub', 1, 'group', '2016-11-29 10:29:51', '2016-11-29 10:29:51'),
(188, 181, 'Video Games for Kids', 'Dolorem omnis non eius tempora. Dignissimos consectetur voluptatum autem.', 'fui-cross', 'testsub', 1, 'group', '2016-11-29 10:29:51', '2016-11-29 10:29:51'),
(189, 188, 'another sub', 'Et sapiente ipsa pariatur ut. Adipisci illo tempora autem pariatur.', 'fui-user', 'testsubsub', 1, 'group', '2016-11-29 10:29:51', '2016-11-29 10:29:51'),
(190, 188, 'another sub', 'Vel mollitia soluta natus error officiis ea praesentium. Possimus et et a maxime cum.', 'fui-check-circle', 'testsubsub', 1, 'group', '2016-11-29 10:29:51', '2016-11-29 10:29:51'),
(191, 181, 'Baby Registry', 'Cum inventore quos enim laudantium. Vero quas et ducimus voluptas reprehenderit.', 'fui-video', 'testsub', 1, 'group', '2016-11-29 10:29:51', '2016-11-29 10:29:51'),
(192, 191, 'another sub', 'Aspernatur voluptatibus non quia amet. Officia alias aut a sunt.', 'fui-cross', 'testsubsub', 1, 'group', '2016-11-29 10:29:52', '2016-11-29 10:29:52'),
(193, 191, 'another sub', 'Eos fugiat explicabo blanditiis facilis distinctio omnis modi.', 'fui-check-circle', 'testsubsub', 1, 'group', '2016-11-29 10:29:52', '2016-11-29 10:29:52'),
(194, 181, 'Kids’ Birthdays', 'Sit adipisci atque eius vel in aut recusandae dolor.', 'fui-check-circle', 'testsub', 1, 'group', '2016-11-29 10:29:52', '2016-11-29 10:29:52'),
(195, 194, 'another sub', 'Sit quibusdam magnam exercitationem consequuntur incidunt deserunt id.', 'fui-chat', 'testsubsub', 1, 'group', '2016-11-29 10:29:52', '2016-11-29 10:29:52'),
(196, 194, 'another sub', 'Totam nulla deleniti quis voluptas sit iure. Et laudantium eum et ut quia molestias.', 'fui-upload', 'testsubsub', 1, 'group', '2016-11-29 10:29:52', '2016-11-29 10:29:52'),
(197, 181, 'For Girls', 'Sit eveniet cupiditate dicta omnis cum. Laudantium quia aut et sed rerum.', 'fui-time', 'testsub', 1, 'group', '2016-11-29 10:29:52', '2016-11-29 10:29:52'),
(198, 197, 'another sub', 'Et et reiciendis eum qui. Omnis quisquam vel repellat quaerat commodi ducimus.', 'fui-loop', 'testsubsub', 1, 'group', '2016-11-29 10:29:52', '2016-11-29 10:29:52'),
(199, 197, 'another sub', 'Quaerat voluptas exercitationem facere quia.', 'fui-home', 'testsubsub', 1, 'group', '2016-11-29 10:29:52', '2016-11-29 10:29:52'),
(200, 181, 'For Boys', 'Voluptatem eum hic et et placeat. Sed eius omnis neque.', 'fui-loop', 'testsub', 1, 'group', '2016-11-29 10:29:52', '2016-11-29 10:29:52'),
(201, 200, 'another sub', 'Et sit voluptatem earum impedit saepe similique officia a.', 'fui-windows', 'testsubsub', 1, 'group', '2016-11-29 10:29:53', '2016-11-29 10:29:53'),
(202, 200, 'another sub', 'Laboriosam quia rerum corrupti aut sequi unde non vero.', 'fui-info-circle', 'testsubsub', 1, 'group', '2016-11-29 10:29:53', '2016-11-29 10:29:53'),
(203, 181, 'For Baby', 'Enim voluptate aspernatur facilis aperiam.', 'fui-arrow-right', 'testsub', 1, 'group', '2016-11-29 10:29:53', '2016-11-29 10:29:53'),
(204, 203, 'another sub', 'Totam dolorem molestias nulla aspernatur doloremque quae sed labore.', 'fui-time', 'testsubsub', 1, 'group', '2016-11-29 10:29:53', '2016-11-29 10:29:53'),
(205, 203, 'another sub', 'Quidem non quae deleniti. Inventore quis libero consequatur reprehenderit.', 'fui-alert-circle', 'testsubsub', 1, 'group', '2016-11-29 10:29:53', '2016-11-29 10:29:53'),
(206, NULL, 'Clothing, Shoes & Jewelry', 'Dolores a quibusdam laboriosam fugiat molestiae eum. Minus iusto corrupti omnis qui eos.', 'fui-export', 'test', 1, 'store', '2016-11-29 10:29:53', '2016-11-29 10:29:53'),
(207, 206, 'Women', 'Temporibus corporis ut illum fugiat alias eaque. Ut tempora velit earum eos.', 'fui-video', 'testsub', 1, 'store', '2016-11-29 10:29:53', '2016-11-29 10:29:53'),
(208, 207, 'another sub', 'Beatae aut qui et qui vel est. Est earum facere sed temporibus quo quae iste.', 'fui-photo', 'testsubsub', 1, 'store', '2016-11-29 10:29:53', '2016-11-29 10:29:53'),
(209, 207, 'another sub', 'Nihil cum rerum optio enim. Placeat laudantium consectetur provident quis.', 'fui-window', 'testsubsub', 1, 'store', '2016-11-29 10:29:54', '2016-11-29 10:29:54'),
(210, 206, 'Men', 'Quis dolorem amet odio deserunt mollitia voluptas nihil.', 'fui-location', 'testsub', 1, 'store', '2016-11-29 10:29:54', '2016-11-29 10:29:54'),
(211, 210, 'another sub', 'Exercitationem voluptate recusandae sed dolores voluptatem ut quae.', 'fui-upload', 'testsubsub', 1, 'store', '2016-11-29 10:29:54', '2016-11-29 10:29:54'),
(212, 210, 'another sub', 'Reiciendis magnam tempora aliquid recusandae sed ipsam ratione.', 'fui-new', 'testsubsub', 1, 'store', '2016-11-29 10:29:54', '2016-11-29 10:29:54'),
(213, 206, 'Girls', 'Rerum quam cumque qui quod. Blanditiis molestiae aliquam dolore quaerat ipsum.', 'fui-list', 'testsub', 1, 'store', '2016-11-29 10:29:54', '2016-11-29 10:29:54'),
(214, 213, 'another sub', 'Deserunt dolore aut vel fugit sunt possimus. Ex iste inventore quo quae velit.', 'fui-check', 'testsubsub', 1, 'store', '2016-11-29 10:29:54', '2016-11-29 10:29:54'),
(215, 213, 'another sub', 'Labore est molestias quas mollitia nisi sit debitis quas.', 'fui-alert-circle', 'testsubsub', 1, 'store', '2016-11-29 10:29:54', '2016-11-29 10:29:54'),
(216, 206, 'Boys', 'Velit officia dolor consequatur numquam consequatur cumque optio.', 'fui-windows', 'testsub', 1, 'store', '2016-11-29 10:29:54', '2016-11-29 10:29:54'),
(217, 216, 'another sub', 'Enim tenetur est quo nostrum. Fugiat voluptatem vel officiis.', 'fui-location', 'testsubsub', 1, 'store', '2016-11-29 10:29:54', '2016-11-29 10:29:54'),
(218, 216, 'another sub', 'Reprehenderit corrupti quos vel aut eveniet est fuga.', 'fui-list', 'testsubsub', 1, 'store', '2016-11-29 10:29:54', '2016-11-29 10:29:54'),
(219, 206, 'Baby', 'Delectus labore pariatur esse aperiam.', 'fui-new', 'testsub', 1, 'store', '2016-11-29 10:29:54', '2016-11-29 10:29:54'),
(220, 219, 'another sub', 'Et ut aut beatae error distinctio distinctio. Voluptas accusantium optio omnis corporis.', 'fui-cmd', 'testsubsub', 1, 'store', '2016-11-29 10:29:54', '2016-11-29 10:29:54'),
(221, 219, 'another sub', 'Natus et commodi similique inventore laudantium. Reiciendis ut est voluptate ut officiis.', 'fui-upload', 'testsubsub', 1, 'store', '2016-11-29 10:29:55', '2016-11-29 10:29:55'),
(222, 206, 'Luggage', 'Dolores distinctio officiis qui culpa eos hic omnis et.', 'fui-plus', 'testsub', 1, 'store', '2016-11-29 10:29:55', '2016-11-29 10:29:55'),
(223, 222, 'another sub', 'Quam voluptatem laborum provident dolor voluptatem.', 'fui-heart', 'testsubsub', 1, 'store', '2016-11-29 10:29:55', '2016-11-29 10:29:55'),
(224, 222, 'another sub', 'Quidem porro dolores sint quod accusantium. Quae consequatur labore est ab et.', 'fui-chat', 'testsubsub', 1, 'store', '2016-11-29 10:29:56', '2016-11-29 10:29:56'),
(225, NULL, 'Sports & Outdoors', 'Dolores eos enim quo est atque et. Sint dicta similique veritatis dolores incidunt.', 'fui-list', 'test', 1, 'group', '2016-11-29 10:29:56', '2016-11-29 10:29:56'),
(226, 225, 'Athletic Clothing', 'Quod vel vel praesentium minus qui sunt.', 'fui-alert-circle', 'testsub', 1, 'group', '2016-11-29 10:29:57', '2016-11-29 10:29:57'),
(227, 226, 'another sub', 'Et dolores cumque minus ipsa qui. A corporis voluptas quia eligendi eveniet quia.', 'fui-loop', 'testsubsub', 1, 'group', '2016-11-29 10:29:57', '2016-11-29 10:29:57'),
(228, 226, 'another sub', 'Quidem eaque fugit expedita aut illo. Illo quae et ut aut ipsa sint enim ex.', 'fui-export', 'testsubsub', 1, 'group', '2016-11-29 10:29:58', '2016-11-29 10:29:58'),
(229, 225, 'Exercise & Fitness', 'Quidem tempora quae voluptas soluta sed id. Vel sed totam ea accusamus et.', 'fui-mic', 'testsub', 1, 'group', '2016-11-29 10:29:58', '2016-11-29 10:29:58'),
(230, 229, 'another sub', 'Dignissimos porro aut ullam fugiat atque. Est maiores ipsa hic unde magni.', 'fui-list', 'testsubsub', 1, 'group', '2016-11-29 10:29:58', '2016-11-29 10:29:58'),
(231, 229, 'another sub', 'Nihil iure porro ratione sequi sit.', 'fui-list', 'testsubsub', 1, 'group', '2016-11-29 10:29:58', '2016-11-29 10:29:58'),
(232, 225, 'Hunting & Fishing', 'Occaecati amet alias iste eos sunt molestiae in et. Unde dolore facere natus placeat.', 'fui-check-circle', 'testsub', 1, 'group', '2016-11-29 10:29:59', '2016-11-29 10:29:59'),
(233, 232, 'another sub', 'Natus et sunt dolorum libero non. Tenetur pariatur est sunt ullam.', 'fui-arrow-left', 'testsubsub', 1, 'group', '2016-11-29 10:29:59', '2016-11-29 10:29:59'),
(234, 232, 'another sub', 'Corrupti sequi ullam dignissimos. Voluptatem pariatur aut minus velit.', 'fui-question-circle', 'testsubsub', 1, 'group', '2016-11-29 10:29:59', '2016-11-29 10:29:59'),
(235, 225, 'Team Sports', 'Nesciunt quia perferendis eveniet odit. Tempore in vero molestiae repudiandae optio.', 'fui-loop', 'testsub', 1, 'group', '2016-11-29 10:29:59', '2016-11-29 10:29:59'),
(236, 235, 'another sub', 'Eum laudantium non magnam assumenda. Alias totam assumenda vitae possimus dolor qui eos.', 'fui-mail', 'testsubsub', 1, 'group', '2016-11-29 10:29:59', '2016-11-29 10:29:59'),
(237, 235, 'another sub', 'Odit et eum quia qui. Est aliquid similique blanditiis nesciunt.', 'fui-eye', 'testsubsub', 1, 'group', '2016-11-29 10:29:59', '2016-11-29 10:29:59'),
(238, 225, 'Fan Shop', 'Fuga doloremque molestiae quasi omnis repudiandae ipsam.', 'fui-heart', 'testsub', 1, 'group', '2016-11-29 10:29:59', '2016-11-29 10:29:59'),
(239, 238, 'another sub', 'Aut ut nostrum aut alias vitae aliquam est.', 'fui-location', 'testsubsub', 1, 'group', '2016-11-29 10:30:00', '2016-11-29 10:30:00'),
(240, 238, 'another sub', 'Voluptatem quisquam esse officiis et quod molestiae consectetur.', 'fui-search', 'testsubsub', 1, 'group', '2016-11-29 10:30:00', '2016-11-29 10:30:00'),
(241, 225, 'Golf', 'Tenetur dolorem in eveniet autem et. Ea aut ut aut dignissimos corporis molestiae.', 'fui-loop', 'testsub', 1, 'group', '2016-11-29 10:30:00', '2016-11-29 10:30:00'),
(242, 241, 'another sub', 'Sed mollitia et enim non illo. Recusandae iure accusantium maxime dolor.', 'fui-loop', 'testsubsub', 1, 'group', '2016-11-29 10:30:00', '2016-11-29 10:30:00'),
(243, 241, 'another sub', 'Corrupti voluptatem non aut ad quam.', 'fui-plus', 'testsubsub', 1, 'group', '2016-11-29 10:30:00', '2016-11-29 10:30:00'),
(244, 225, 'Leisure Sports & Game Room', 'Id voluptatem aut tempore enim quia deleniti aperiam.', 'fui-location', 'testsub', 1, 'group', '2016-11-29 10:30:00', '2016-11-29 10:30:00'),
(245, 244, 'another sub', 'Alias inventore aspernatur magni fuga error ad at necessitatibus.', 'fui-cross', 'testsubsub', 1, 'group', '2016-11-29 10:30:00', '2016-11-29 10:30:00'),
(246, 244, 'another sub', 'Id et molestiae dolor vero laborum optio.', 'fui-heart', 'testsubsub', 1, 'group', '2016-11-29 10:30:00', '2016-11-29 10:30:00'),
(247, 225, 'Sports Collectibles', 'Sed rem voluptatem et sed. Laudantium inventore sint voluptate.', 'fui-time', 'testsub', 1, 'group', '2016-11-29 10:30:00', '2016-11-29 10:30:00'),
(248, 247, 'another sub', 'Et accusamus totam perferendis et dolorem.', 'fui-eye', 'testsubsub', 1, 'group', '2016-11-29 10:30:01', '2016-11-29 10:30:01'),
(249, 247, 'another sub', 'Accusamus ipsam autem velit voluptas natus consequatur.', 'fui-loop', 'testsubsub', 1, 'group', '2016-11-29 10:30:01', '2016-11-29 10:30:01'),
(250, 225, 'All Sports & Fitness', 'Dolore velit cum est non sint sit.', 'fui-question-circle', 'testsub', 1, 'group', '2016-11-29 10:30:01', '2016-11-29 10:30:01'),
(251, 250, 'another sub', 'Fugiat expedita quod voluptatem ut laboriosam facilis.', 'fui-plus', 'testsubsub', 1, 'group', '2016-11-29 10:30:01', '2016-11-29 10:30:01'),
(252, 250, 'another sub', 'Temporibus possimus laboriosam occaecati perspiciatis saepe ea.', 'fui-check-circle', 'testsubsub', 1, 'group', '2016-11-29 10:30:01', '2016-11-29 10:30:01'),
(253, 225, 'Camping & Hiking', 'Excepturi quos sit vitae omnis. Praesentium qui aut suscipit omnis et possimus vitae.', 'fui-question-circle', 'testsub', 1, 'group', '2016-11-29 10:30:01', '2016-11-29 10:30:01'),
(254, 253, 'another sub', 'Expedita eum non qui odio. Voluptas exercitationem possimus mollitia sint in.', 'fui-mail', 'testsubsub', 1, 'group', '2016-11-29 10:30:02', '2016-11-29 10:30:02'),
(255, 253, 'another sub', 'Similique ea nobis doloremque ipsum illum. Nihil fugiat porro occaecati pariatur ab.', 'fui-eye', 'testsubsub', 1, 'group', '2016-11-29 10:30:02', '2016-11-29 10:30:02'),
(256, 225, 'Cycling', 'Quae nesciunt sed atque sequi aut assumenda maiores eveniet. Quod ea est sit ad.', 'fui-check', 'testsub', 1, 'group', '2016-11-29 10:30:02', '2016-11-29 10:30:02'),
(257, 256, 'another sub', 'Consequatur perferendis animi vitae et tempora tempore.', 'fui-cmd', 'testsubsub', 1, 'group', '2016-11-29 10:30:02', '2016-11-29 10:30:02'),
(258, 256, 'another sub', 'Vero provident exercitationem labore earum sint aut.', 'fui-alert-circle', 'testsubsub', 1, 'group', '2016-11-29 10:30:02', '2016-11-29 10:30:02'),
(259, 225, 'Outdoor Clothing', 'Sit dicta maiores maxime possimus impedit. Nisi eum corporis nihil rerum.', 'fui-cmd', 'testsub', 1, 'group', '2016-11-29 10:30:02', '2016-11-29 10:30:02'),
(260, 259, 'another sub', 'Animi maxime sunt hic qui. Quia perspiciatis aspernatur eaque nemo eveniet.', 'fui-chat', 'testsubsub', 1, 'group', '2016-11-29 10:30:02', '2016-11-29 10:30:02'),
(261, 259, 'another sub', 'Aut iste quia dolores est quo optio. Eum dolores expedita magnam ullam sunt et harum.', 'fui-export', 'testsubsub', 1, 'group', '2016-11-29 10:30:03', '2016-11-29 10:30:03'),
(262, 225, 'Scooters, Skateboards & Skates', 'Tempora et eligendi occaecati maiores voluptatum. Nulla et nulla voluptatem sit.', 'fui-cross', 'testsub', 1, 'group', '2016-11-29 10:30:03', '2016-11-29 10:30:03'),
(263, 262, 'another sub', 'Quia iusto fugiat eaque quidem doloremque occaecati eum alias.', 'fui-list', 'testsubsub', 1, 'group', '2016-11-29 10:30:03', '2016-11-29 10:30:03'),
(264, 262, 'another sub', 'Nostrum rerum architecto soluta dolorem est cupiditate est.', 'fui-cmd', 'testsubsub', 1, 'group', '2016-11-29 10:30:03', '2016-11-29 10:30:03'),
(265, 225, 'Water Sports', 'Culpa sint rerum cum cum earum. Quia qui dolorem tempora earum quae.', 'fui-arrow-left', 'testsub', 1, 'group', '2016-11-29 10:30:03', '2016-11-29 10:30:03'),
(266, 265, 'another sub', 'Ipsa maxime quos voluptatum minus.', 'fui-upload', 'testsubsub', 1, 'group', '2016-11-29 10:30:03', '2016-11-29 10:30:03'),
(267, 265, 'another sub', 'Qui in voluptatem maxime non. Debitis ex vero atque iusto asperiores nobis.', 'fui-windows', 'testsubsub', 1, 'group', '2016-11-29 10:30:03', '2016-11-29 10:30:03'),
(268, 225, 'Winter Sports', 'Voluptatum laudantium accusamus est eaque necessitatibus voluptas suscipit aliquam.', 'fui-cmd', 'testsub', 1, 'group', '2016-11-29 10:30:03', '2016-11-29 10:30:03'),
(269, 268, 'another sub', 'Magnam et earum et consequatur. Et eos quisquam eos nemo quas odio nostrum totam.', 'fui-list', 'testsubsub', 1, 'group', '2016-11-29 10:30:04', '2016-11-29 10:30:04'),
(270, 268, 'another sub', 'Doloribus quas nesciunt est non. Asperiores et est vel quibusdam.', 'fui-info-circle', 'testsubsub', 1, 'group', '2016-11-29 10:30:04', '2016-11-29 10:30:04'),
(271, 225, 'Climbing', 'Quidem ea debitis omnis est laborum sint. Harum dicta aliquam consequuntur aut.', 'fui-loop', 'testsub', 1, 'group', '2016-11-29 10:30:04', '2016-11-29 10:30:04'),
(272, 271, 'another sub', 'Et quos itaque pariatur ut adipisci. Reprehenderit dolorem omnis eum aut.', 'fui-time', 'testsubsub', 1, 'group', '2016-11-29 10:30:04', '2016-11-29 10:30:04'),
(273, 271, 'another sub', 'Ratione natus quibusdam in id quisquam. Dolores dolor et veritatis iure.', 'fui-check', 'testsubsub', 1, 'group', '2016-11-29 10:30:04', '2016-11-29 10:30:04'),
(274, 225, 'Accessories', 'Vero aut nesciunt aut eos ab accusamus aut. Repellat aut sequi placeat sunt et suscipit.', 'fui-question-circle', 'testsub', 1, 'group', '2016-11-29 10:30:04', '2016-11-29 10:30:04'),
(275, 274, 'another sub', 'Labore sint excepturi quis iste qui est. Dolorem et quia voluptates.', 'fui-new', 'testsubsub', 1, 'group', '2016-11-29 10:30:04', '2016-11-29 10:30:04'),
(276, 274, 'another sub', 'Et ipsam quo molestiae id aut omnis. Vero quos tempora ad architecto.', 'fui-plus-circle', 'testsubsub', 1, 'group', '2016-11-29 10:30:04', '2016-11-29 10:30:04'),
(277, 225, 'All Outdoor Recreation', 'Rerum velit laudantium dolores qui reiciendis. Aut tempore maxime est consectetur sed.', 'fui-export', 'testsub', 1, 'group', '2016-11-29 10:30:04', '2016-11-29 10:30:04'),
(278, 277, 'another sub', 'Voluptatem maxime in ex omnis. Cum quam quis sunt voluptas excepturi quia.', 'fui-eye', 'testsubsub', 1, 'group', '2016-11-29 10:30:04', '2016-11-29 10:30:04'),
(279, 277, 'another sub', 'Aut neque nihil dolorem eligendi architecto possimus debitis.', 'fui-mail', 'testsubsub', 1, 'group', '2016-11-29 10:30:05', '2016-11-29 10:30:05');
INSERT INTO `categories` (`id`, `category_id`, `name`, `description`, `icon`, `image`, `status`, `type`, `created_at`, `updated_at`) VALUES
(280, NULL, 'Automotive & Industrial', 'Et doloremque est voluptas. Dolorem illo quidem veniam dolor labore doloribus qui.', 'fui-new', 'test', 1, 'store', '2016-11-29 10:30:05', '2016-11-29 10:30:05'),
(281, 280, 'Automotive Parts & Accessories', 'Perferendis et sequi magnam deleniti facere omnis et. Illum doloremque ad ipsa cum.', 'fui-cmd', 'testsub', 1, 'store', '2016-11-29 10:30:05', '2016-11-29 10:30:05'),
(282, 281, 'another sub', 'Voluptatibus aliquid labore repudiandae placeat.', 'fui-window', 'testsubsub', 1, 'store', '2016-11-29 10:30:05', '2016-11-29 10:30:05'),
(283, 281, 'another sub', 'Et ipsam laudantium reiciendis ut neque nam.', 'fui-plus-circle', 'testsubsub', 1, 'store', '2016-11-29 10:30:06', '2016-11-29 10:30:06'),
(284, 280, 'Automotive Tools & Equipment', 'Quia esse qui ratione blanditiis et repudiandae exercitationem.', 'fui-new', 'testsub', 1, 'store', '2016-11-29 10:30:06', '2016-11-29 10:30:06'),
(285, 284, 'another sub', 'Nemo quo aut aut voluptatem.', 'fui-arrow-left', 'testsubsub', 1, 'store', '2016-11-29 10:30:06', '2016-11-29 10:30:06'),
(286, 284, 'another sub', 'Sed illo porro et velit. Delectus officia aliquam saepe vitae dignissimos ut nostrum.', 'fui-heart', 'testsubsub', 1, 'store', '2016-11-29 10:30:06', '2016-11-29 10:30:06'),
(287, 280, 'Car/Vehicle Electronics & GPS', 'Voluptas ad officia possimus eveniet quia. Sit nemo numquam qui fugiat culpa repudiandae.', 'fui-video', 'testsub', 1, 'store', '2016-11-29 10:30:06', '2016-11-29 10:30:06'),
(288, 287, 'another sub', 'Perferendis et provident aut. Non quia rem exercitationem voluptas et adipisci.', 'fui-check-circle', 'testsubsub', 1, 'store', '2016-11-29 10:30:06', '2016-11-29 10:30:06'),
(289, 287, 'another sub', 'Dolore debitis ut rerum rerum architecto. Maiores delectus aperiam eveniet provident eum.', 'fui-cmd', 'testsubsub', 1, 'store', '2016-11-29 10:30:06', '2016-11-29 10:30:06'),
(290, 280, 'Tires & Wheels', 'Illo qui repellat et a ab quia praesentium.', 'fui-user', 'testsub', 1, 'store', '2016-11-29 10:30:06', '2016-11-29 10:30:06'),
(291, 290, 'another sub', 'Sed aliquid iste et iure sed. Sunt enim velit minus quo corporis.', 'fui-search', 'testsubsub', 1, 'store', '2016-11-29 10:30:06', '2016-11-29 10:30:06'),
(292, 290, 'another sub', 'Fuga dignissimos culpa eaque quod. Reiciendis saepe aut et amet.', 'fui-check-circle', 'testsubsub', 1, 'store', '2016-11-29 10:30:06', '2016-11-29 10:30:06'),
(293, 280, 'Motorcycle & Powersports', 'Architecto nemo tempora dolor. Repudiandae officia aliquid excepturi ullam delectus.', 'fui-user', 'testsub', 1, 'store', '2016-11-29 10:30:06', '2016-11-29 10:30:06'),
(294, 293, 'another sub', 'In nobis culpa vero tenetur dolorum id alias. Aut tempore accusamus nostrum.', 'fui-arrow-left', 'testsubsub', 1, 'store', '2016-11-29 10:30:06', '2016-11-29 10:30:06'),
(295, 293, 'another sub', 'Voluptatem dolores occaecati corporis est incidunt perspiciatis.', 'fui-video', 'testsubsub', 1, 'store', '2016-11-29 10:30:07', '2016-11-29 10:30:07'),
(296, 280, 'Industrial Supplies', 'Illo sit rerum nulla laboriosam.', 'fui-check', 'testsub', 1, 'store', '2016-11-29 10:30:07', '2016-11-29 10:30:07'),
(297, 296, 'another sub', 'Dolore pariatur reprehenderit repudiandae beatae.', 'fui-search', 'testsubsub', 1, 'store', '2016-11-29 10:30:07', '2016-11-29 10:30:07'),
(298, 296, 'another sub', 'Voluptas quibusdam corrupti sit libero culpa.', 'fui-windows', 'testsubsub', 1, 'store', '2016-11-29 10:30:07', '2016-11-29 10:30:07'),
(299, 280, 'Lab & Scientific', 'Nesciunt omnis rerum sed consequuntur tempore deserunt vitae.', 'fui-eye', 'testsub', 1, 'store', '2016-11-29 10:30:07', '2016-11-29 10:30:07'),
(300, 299, 'another sub', 'Sunt accusamus voluptas molestiae voluptas.', 'fui-home', 'testsubsub', 1, 'store', '2016-11-29 10:30:07', '2016-11-29 10:30:07'),
(301, 299, 'another sub', 'Voluptas necessitatibus ipsum eos numquam facilis.', 'fui-mail', 'testsubsub', 1, 'store', '2016-11-29 10:30:07', '2016-11-29 10:30:07'),
(302, 280, 'Janitorial', 'Omnis aut nemo cum. Vel unde dolores atque unde.', 'fui-location', 'testsub', 1, 'store', '2016-11-29 10:30:08', '2016-11-29 10:30:08'),
(303, 302, 'another sub', 'Aspernatur sunt similique unde commodi nihil laboriosam voluptatibus.', 'fui-photo', 'testsubsub', 1, 'store', '2016-11-29 10:30:08', '2016-11-29 10:30:08'),
(304, 302, 'another sub', 'Quia neque inventore excepturi sequi sequi.', 'fui-cross-circle', 'testsubsub', 1, 'store', '2016-11-29 10:30:08', '2016-11-29 10:30:08'),
(305, 280, 'Safety', 'Blanditiis libero omnis ea et deserunt adipisci.', 'fui-chat', 'testsub', 1, 'store', '2016-11-29 10:30:08', '2016-11-29 10:30:08'),
(306, 305, 'another sub', 'Harum et qui ut odit est quo tempora. Et eligendi pariatur nostrum qui dolorem.', 'fui-list', 'testsubsub', 1, 'store', '2016-11-29 10:30:08', '2016-11-29 10:30:08'),
(307, 305, 'another sub', 'Pariatur perspiciatis ex enim perspiciatis. Nihil soluta unde deserunt eligendi sapiente.', 'fui-home', 'testsubsub', 1, 'store', '2016-11-29 10:30:08', '2016-11-29 10:30:08'),
(308, NULL, 'Home Services', 'Id temporibus quisquam qui voluptatem. Natus unde cupiditate recusandae voluptas.', 'fui-window', 'test', 1, 'group', '2016-11-29 10:30:08', '2016-11-29 10:30:08'),
(309, 308, 'Home Improvement & Repair', 'Veniam eligendi accusantium provident reiciendis voluptate.', 'fui-info-circle', 'testsub', 1, 'group', '2016-11-29 10:30:08', '2016-11-29 10:30:08'),
(310, 309, 'another sub', 'Et et ex accusamus voluptatibus. Harum hic hic delectus.', 'fui-check', 'testsubsub', 1, 'group', '2016-11-29 10:30:08', '2016-11-29 10:30:08'),
(311, 309, 'another sub', 'Qui consequatur ut quo repellendus amet.', 'fui-location', 'testsubsub', 1, 'group', '2016-11-29 10:30:08', '2016-11-29 10:30:08'),
(312, 308, 'Lawn & Garden Care', 'Vel ut magnam corrupti officia placeat fugiat hic.', 'fui-windows', 'testsub', 1, 'group', '2016-11-29 10:30:08', '2016-11-29 10:30:08'),
(313, 312, 'another sub', 'Aut quam dolorum autem et. Voluptatem enim nulla reprehenderit labore et at aliquid.', 'fui-photo', 'testsubsub', 1, 'group', '2016-11-29 10:30:08', '2016-11-29 10:30:08'),
(314, 312, 'another sub', 'Aut quod animi ullam quaerat delectus. Voluptatem quasi vel suscipit et fugiat dolor.', 'fui-cmd', 'testsubsub', 1, 'group', '2016-11-29 10:30:08', '2016-11-29 10:30:08'),
(315, 308, 'Automotive Services', 'Rem inventore esse nostrum ullam. Dolore odio porro et non odio numquam praesentium.', 'fui-upload', 'testsub', 1, 'group', '2016-11-29 10:30:08', '2016-11-29 10:30:08'),
(316, 315, 'another sub', 'Voluptatum est rerum quia reiciendis maxime aut. Autem sed sed dolor unde eos quia.', 'fui-plus-circle', 'testsubsub', 1, 'group', '2016-11-29 10:30:09', '2016-11-29 10:30:09'),
(317, 315, 'another sub', 'Deserunt laudantium suscipit a nihil iusto.', 'fui-user', 'testsubsub', 1, 'group', '2016-11-29 10:30:09', '2016-11-29 10:30:09'),
(318, 308, 'Computer & Electronics', 'Quia qui ut illo excepturi. Possimus asperiores eveniet ad vitae rem.', 'fui-user', 'testsub', 1, 'group', '2016-11-29 10:30:09', '2016-11-29 10:30:09'),
(319, 318, 'another sub', 'Harum ratione nam mollitia ut recusandae veritatis dolores.', 'fui-upload', 'testsubsub', 1, 'group', '2016-11-29 10:30:09', '2016-11-29 10:30:09'),
(320, 318, 'another sub', 'Sapiente ea amet perferendis qui.', 'fui-user', 'testsubsub', 1, 'group', '2016-11-29 10:30:09', '2016-11-29 10:30:09'),
(321, 308, 'Lessons & Tutoring', 'In cum vero cupiditate necessitatibus delectus quo.', 'fui-windows', 'testsub', 1, 'group', '2016-11-29 10:30:09', '2016-11-29 10:30:09'),
(322, 321, 'another sub', 'Consectetur sapiente officia ut quo autem ex possimus.', 'fui-home', 'testsubsub', 1, 'group', '2016-11-29 10:30:09', '2016-11-29 10:30:09'),
(323, 321, 'another sub', 'Et consequatur accusamus consequatur voluptas.', 'fui-info-circle', 'testsubsub', 1, 'group', '2016-11-29 10:30:10', '2016-11-29 10:30:10');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `action_type_id` int(10) UNSIGNED NOT NULL,
  `source_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comment` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `action_type_id`, `source_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 9, 171247, 19, 'A neque dolorem voluptatem eveniet eum vel.', '2016-11-29 10:30:52', '2016-11-29 10:30:52'),
(2, 15, 342077, 20, 'Quis recusandae et sed enim totam illo deleniti.', '2016-11-29 10:30:52', '2016-11-29 10:30:52'),
(3, 9, 701413, 22, 'Omnis dolor neque laborum quidem.', '2016-11-29 10:30:53', '2016-11-29 10:30:53'),
(4, 13, 279592, 6, 'Omnis debitis qui ratione est sunt.', '2016-11-29 10:30:53', '2016-11-29 10:30:53'),
(5, 15, 898416, 1, 'Quas quaerat quis est optio praesentium.', '2016-11-29 10:30:53', '2016-11-29 10:30:53'),
(6, 7, 394899, 21, 'Molestiae eaque culpa voluptas nam quo.', '2016-11-29 10:30:53', '2016-11-29 10:30:53'),
(7, 3, 410654, 16, 'Quasi nostrum inventore voluptatem atque.', '2016-11-29 10:30:53', '2016-11-29 10:30:53'),
(8, 11, 397707, 8, 'Tempora quasi consequuntur veritatis natus minus.', '2016-11-29 10:30:54', '2016-11-29 10:30:54'),
(9, 9, 445975, 21, 'Tempore magnam nemo aut laborum omnis velit qui.', '2016-11-29 10:30:54', '2016-11-29 10:30:54'),
(10, 14, 307104, 12, 'Omnis consequatur autem nisi veniam.', '2016-11-29 10:30:54', '2016-11-29 10:30:54'),
(11, 12, 483792, 2, 'Culpa qui id exercitationem ab.', '2016-11-29 10:30:54', '2016-11-29 10:30:54'),
(12, 13, 261784, 13, 'Necessitatibus rerum fuga natus repellendus quis.', '2016-11-29 10:30:54', '2016-11-29 10:30:54'),
(13, 12, 293333, 13, 'Perferendis repellendus quas sunt ducimus.', '2016-11-29 10:30:54', '2016-11-29 10:30:54'),
(14, 10, 441005, 6, 'Dolorem iusto quia illum.', '2016-11-29 10:30:54', '2016-11-29 10:30:54'),
(15, 7, 628849, 6, 'Recusandae deserunt voluptatum est accusamus.', '2016-11-29 10:30:55', '2016-11-29 10:30:55'),
(16, 11, 673735, 15, 'Sit repellat ea expedita.', '2016-11-29 10:30:55', '2016-11-29 10:30:55'),
(17, 15, 144054, 5, 'Impedit quod fugiat atque tempore inventore.', '2016-11-29 10:30:55', '2016-11-29 10:30:55'),
(18, 14, 238688, 20, 'Qui alias possimus vitae.', '2016-11-29 10:30:55', '2016-11-29 10:30:55'),
(19, 1, 377356, 4, 'Alias officiis enim est dolores.', '2016-11-29 10:30:55', '2016-11-29 10:30:55'),
(20, 8, 165238, 12, 'Dicta qui exercitationem autem.', '2016-11-29 10:30:55', '2016-11-29 10:30:55');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sales_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `support_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slogan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cell_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_app_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `keywords` longtext COLLATE utf8_unicode_ci NOT NULL,
  `about_us` longtext COLLATE utf8_unicode_ci NOT NULL,
  `refund_policy` longtext COLLATE utf8_unicode_ci NOT NULL,
  `privacy_policy` longtext COLLATE utf8_unicode_ci NOT NULL,
  `terms_of_service` longtext COLLATE utf8_unicode_ci NOT NULL,
  `google_maps_key_api` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `email`, `contact_email`, `sales_email`, `support_email`, `status`, `name`, `website_name`, `slogan`, `logo`, `theme`, `phone_number`, `cell_phone`, `address`, `state`, `city`, `zip_code`, `website`, `twitter`, `facebook`, `google_plus`, `facebook_app_id`, `description`, `keywords`, `about_us`, `refund_policy`, `privacy_policy`, `terms_of_service`, `google_maps_key_api`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'info@BechtelarRunte.org', 'contact@BechtelarRunte.org', 'sales@BechtelarRunte.org', 'support@BechtelarRunte.org', 'active', 'Bechtelar Runte', 'Bechtelar Runte', 'Diverse empowering model', '/img/pt-default/273.jpg', '', '+2330761952886', '+2513956460160', '3329 Mayer Roads', 'Washington', 'Bretbury', '10835-2543', 'http://BechtelarRunte.org', 'BechtelarRunte', 'BechtelarRunte', 'BechtelarRunte', '08d8747f17e3713178e275cd625f7e1e', 'Dolorum enim velit magnam repudiandae excepturi. Enim praesentium tempora nostrum ipsam reiciendis consectetur. Maiores autem dolores soluta aut ducimus quas.', 'dolor,voluptatibus,fugiat,dolor,vero,alias,velit,officiis,totam,non,sunt,rerum,praesentium,et,culpa,quo,autem,deleniti,et,aut', 'Omnis sapiente eaque voluptatem quia. Vitae et officia eos voluptatem voluptate soluta cum labore. Explicabo quia accusamus quia porro voluptatem eum.\nSint assumenda voluptatibus hic nihil voluptate consequatur dolor. Ipsa aut quam non sint qui. Quis id consequatur eveniet est itaque. Sint distinctio aut voluptas id eum.\nIncidunt voluptates et explicabo modi. Minima rerum fugiat totam ut ex doloremque repellendus ab. Molestias vel ea ut nam. Sit neque molestiae qui.\nDeleniti voluptas tempore quos dolores mollitia. Suscipit accusantium nesciunt architecto mollitia dignissimos sapiente. Iure voluptatem et nihil. Excepturi ea omnis recusandae dicta et. Culpa ducimus minus eveniet sit omnis.\nTempora rem aut id omnis reiciendis dolore. Reiciendis et aut tempore consequatur. Nobis voluptatum iure occaecati omnis quia enim. Ducimus id rerum dolores.\nNostrum cum natus perferendis ea libero quia reprehenderit. Et occaecati ut consequatur adipisci incidunt velit. Rerum vero maiores iste qui minima. Molestiae debitis dolor minima.', 'Returns\r\n\r\nOur policy lasts 30 days. If 30 days have gone by since your purchase, unfortunately we can’t offer you a refund or exchange.\r\n\r\nTo be eligible for a return, your item must be unused and in the same condition that you received it. It must also be in the original packaging.\r\n\r\nSeveral types of goods are exempt from being returned. Perishable goods such as food, flowers, newspapers or magazines cannot be returned. We also do not accept products that are intimate or sanitary goods, hazardous materials, or flammable liquids or gases.\r\n\r\nAdditional non-returnable items:\r\nGift cards\r\nDownloadable software products\r\nSome health and personal care items\r\n\r\nTo complete your return, we require a receipt or proof of purchase.\r\n\r\nPlease do not send your purchase back to the manufacturer.\r\n\r\nThere are certain situations where only partial refunds are granted: (if applicable)\r\nBook with obvious signs of use\r\nCD, DVD, VHS tape, software, video game, cassette tape, or vinyl record that has been opened.\r\nAny item not in its original condition, is damaged or missing parts for reasons not due to our error.\r\nAny item that is returned more than 30 days after delivery\r\n\r\nRefunds (if applicable)\r\nOnce your return is received and inspected, we will send you an email to notify you that we have received your returned item. We will also notify you of the approval or rejection of your refund.\r\nIf you are approved, then your refund will be processed, and a credit will automatically be applied to your credit card or original method of payment, within a certain amount of days.\r\n\r\nLate or missing refunds (if applicable)\r\nIf you haven’t received a refund yet, first check your bank account again.\r\nThen contact your credit card company, it may take some time before your refund is officially posted.\r\nNext contact your bank. There is often some processing time before a refund is posted.\r\nIf you’ve done all of this and you still have not received your refund yet, please contact us at [ [ email@email.com ] ].\r\n\r\nSale items (if applicable)\r\nOnly regular priced items may be refunded, unfortunately sale items cannot be refunded.\r\n\r\nExchanges (if applicable)\r\nWe only replace items if they are defective or damaged.  If you need to exchange it for the same item, send us an email at [ [ email@email.com ] ] and send your item to: [ [  Address ] ] [ [ City ] ] [ [ State ] ] [ [ Country ] ] [ [ PostCode ] ].\r\n\r\nGifts\r\nIf the item was marked as a gift when purchased and shipped directly to you, you’ll receive a gift credit for the value of your return. Once the returned item is received, a gift certificate will be mailed to you.\r\n\r\nIf the item wasn’t marked as a gift when purchased, or the gift giver had the order shipped to themselves to give to you later, we will send a refund to the gift giver and he will find out about your return.\r\n\r\nShipping\r\nTo return your product, you should mail your product to: [ [  Address ] ] [ [ City ] ] [ [ State ] ] [ [ Country ] ] [ [ PostCode ] ].\r\n\r\nYou will be responsible for paying for your own shipping costs for returning your item. Shipping costs are non-refundable. If you receive a refund, the cost of return shipping will be deducted from your refund.\r\n\r\nDepending on where you live, the time it may take for your exchanged product to reach you, may vary.\r\n\r\nIf you are shipping an item over $75, you should consider using a trackable shipping service or purchasing shipping insurance. We don’t guarantee that we will receive your returned item.\r\n', 'PRIVACY STATEMENT\r\n\r\n\r\n\r\n----\r\n\r\n\r\n\r\nSECTION 1 - WHAT DO WE DO WITH YOUR INFORMATION?\r\n\r\n\r\n\r\nWhen you purchase something from our store, as part of the buying and selling process, we collect the personal information you give us such as your name, address and email address.\r\n\r\nWhen you browse our store, we also automatically receive your computer’s internet protocol (IP) address in order to provide us with information that helps us learn about your browser and operating system.\r\n\r\nEmail marketing (if applicable): With your permission, we may send you emails about our store, new products and other updates.\r\n\r\n\r\n\r\nSECTION 2 - CONSENT\r\n\r\n\r\n\r\nHow do you get my consent?\r\n\r\nWhen you provide us with personal information to complete a transaction, verify your credit card, place an order, arrange for a delivery or return a purchase, we imply that you consent to our collecting it and using it for that specific reason only.\r\n\r\nIf we ask for your personal information for a secondary reason, like marketing, we will either ask you directly for your expressed consent, or provide you with an opportunity to say no.\r\n\r\n\r\n\r\nHow do I withdraw my consent?\r\n\r\nIf after you opt-in, you change your mind, you may withdraw your consent for us to contact you, for the continued collection, use or disclosure of your information, at anytime, by contacting us at [ [ email@email.com ] ] or mailing us at: [ [ Business Name ] ] [ [  Address ] ] [ [ City ] ] [ [ State ] ] [ [ Country ] ] [ [ PostCode ] ]\r\n\r\n\r\nSECTION 3 - DISCLOSURE\r\n\r\n\r\n\r\nWe may disclose your personal information if we are required by law to do so or if you violate our Terms of Service.\r\n\r\n\r\n\r\nSECTION 4 - THE SOFTWARE COMPANY\r\n\r\n\r\n\r\nOur store is hosted on a third party company. They provide us with the online e-commerce platform that allows us to sell our products and services to you.\r\n\r\nYour data is stored through third party data storage, databases and the general application. They store your data on a secure server behind a firewall.\r\n\r\n\r\n\r\nPayment:\r\n\r\nAll direct payment gateways adhere to the standards set by PCI-DSS as managed by the PCI Security Standards Council, which is a joint effort of brands like Visa, MasterCard, American Express and Discover.\r\n\r\nPCI-DSS requirements help ensure the secure handling of credit card information by our store and its service providers.\r\n\r\n\r\n\r\n\r\nSECTION 5 - THIRD-PARTY SERVICES\r\n\r\n\r\n\r\nIn general, the third-party providers used by us will only collect, use and disclose your information to the extent necessary to allow them to perform the services they provide to us.\r\n\r\nHowever, certain third-party service providers, such as payment gateways and other payment transaction processors, have their own privacy policies in respect to the information we are required to provide to them for your purchase-related transactions.\r\n\r\nFor these providers, we recommend that you read their privacy policies so you can understand the manner in which your personal information will be handled by these providers.\r\n\r\nIn particular, remember that certain providers may be located in or have facilities that are located a different jurisdiction than either you or us. So if you elect to proceed with a transaction that involves the services of a third-party service provider, then your information may become subject to the laws of the jurisdiction(s) in which that service provider or its facilities are located.\r\n\r\nAs an example, if you are located in Canada and your transaction is processed by a payment gateway located in the United States, then your personal information used in completing that transaction may be subject to disclosure under United States legislation, including the Patriot Act.\r\n\r\nOnce you leave our store’s website or are redirected to a third-party website or application, you are no longer governed by this Privacy Policy or our website’s Terms of Service.\r\n\r\n\r\n\r\nLinks\r\n\r\nWhen you click on links on our store, they may direct you away from our site. We are not responsible for the privacy practices of other sites and encourage you to read their privacy statements.\r\n\r\nSECTION 6 - SECURITY\r\n\r\n\r\n\r\nTo protect your personal information, we take reasonable precautions and follow industry best practices to make sure it is not inappropriately lost, misused, accessed, disclosed, altered or destroyed.\r\n\r\nIf you provide us with your credit card information, the information is encrypted using secure socket layer technology (SSL) and stored with a AES-256 encryption.  Although no method of transmission over the Internet or electronic storage is 100% secure, we follow all PCI-DSS requirements and implement additional generally accepted industry standards.\r\n\r\n\r\n\r\n\r\nSECTION 8 - AGE OF CONSENT\r\n\r\n\r\n\r\n By using this site, you represent that you are at least the age of majority in your state or province of residence, or that you are the age of majority in your state or province of residence and you have given us your consent to allow any of your minor dependents to use this site.\r\n\r\n\r\n\r\nSECTION 9 - CHANGES TO THIS PRIVACY POLICY\r\n\r\n\r\n\r\nWe reserve the right to modify this privacy policy at any time, so please review it frequently. Changes and clarifications will take effect immediately upon their posting on the website. If we make material changes to this policy, we will notify you here that it has been updated, so that you are aware of what information we collect, how we use it, and under what circumstances, if any, we use and/or disclose it.\r\n\r\nIf our store is acquired or merged with another company, your information may be transferred to the new owners so that we may continue to sell products to you.\r\n\r\n\r\n\r\nQUESTIONS AND CONTACT INFORMATION\r\n\r\n\r\n\r\nIf you would like to: access, correct, amend or delete any personal information we have about you, register a complaint, or simply want more information contact our Privacy Compliance Officer at [ [ email@email.com ] ] or by mail at [ [ Business Name ] ]\r\n\r\n[Re: Privacy Compliance Officer]\r\n\r\n[[ [  Address ] ] [ [ City ] ] [ [ State ] ] [ [ Country ] ] [ [ PostCode ] ]]\r\n\r\n----\r\n', 'TERMS OF SERVICE\r\n\r\n\r\n\r\n-----\r\n\r\n\r\n\r\nOVERVIEW\r\n\r\n\r\n\r\nThis website is operated by [ [ Business Name ] ]. Throughout the site, the terms “we”, “us” and “our” refer to [ [ Business Name ] ]. [ [ Business Name ] ] offers this website, including all information, tools and services available from this site to you, the user, conditioned upon your acceptance of all terms, conditions, policies and notices stated here.\r\n\r\n\r\n\r\nBy visiting our site and/ or purchasing something from us, you engage in our “Service” and agree to be bound by the following terms and conditions (“Terms of Service”, “Terms”), including those additional terms and conditions and policies referenced herein and/or available by hyperlink. These Terms of Service apply  to all users of the site, including without limitation users who are browsers, vendors, customers, merchants, and/ or contributors of content.\r\n\r\n\r\n\r\nPlease read these Terms of Service carefully before accessing or using our website. By accessing or using any part of the site, you agree to be bound by these Terms of Service. If you do not agree to all the terms and conditions of this agreement, then you may not access the website or use any services. If these Terms of Service are considered an offer, acceptance is expressly limited to these Terms of Service.\r\n\r\n\r\n\r\nAny new features or tools which are added to the current store shall also be subject to the Terms of Service. You can review the most current version of the Terms of Service at any time on this page. We reserve the right to update, change or replace any part of these Terms of Service by posting updates and/or changes to our website. It is your responsibility to check this page periodically for changes. Your continued use of or access to the website following the posting of any changes constitutes acceptance of those changes.\r\n\r\n\r\n\r\nOur store is hosted on a third party company. They provide us with the online e-commerce platform that allows us to sell our products and services to you.\r\n\r\n\r\n\r\nSECTION 1 - ONLINE STORE TERMS\r\n\r\n\r\n\r\nBy agreeing to these Terms of Service, you represent that you are at least the age of majority in your state or province of residence, or that you are the age of majority in your state or province of residence and you have given us your consent to allow any of your minor dependents to use this site.\r\n\r\nYou may not use our products for any illegal or unauthorized purpose nor may you, in the use of the Service, violate any laws in your jurisdiction (including but not limited to copyright laws).\r\n\r\nYou must not transmit any worms or viruses or any code of a destructive nature.\r\n\r\nA breach or violation of any of the Terms will result in an immediate termination of your Services.\r\n\r\n\r\n\r\nSECTION 2 - GENERAL CONDITIONS\r\n\r\n\r\n\r\nWe reserve the right to refuse service to anyone for any reason at any time.\r\n\r\nYou understand that your content (not including credit card information), may be transferred unencrypted and involve (a) transmissions over various networks; and (b) changes to conform and adapt to technical requirements of connecting networks or devices. Credit card information is always encrypted during transfer over networks.\r\n\r\nYou agree not to reproduce, duplicate, copy, sell, resell or exploit any portion of the Service, use of the Service, or access to the Service or any contact on the website through which the service is provided, without express written permission by us.\r\n\r\nThe headings used in this agreement are included for convenience only and will not limit or otherwise affect these Terms.\r\n\r\n\r\n\r\nSECTION 3 - ACCURACY, COMPLETENESS AND TIMELINESS OF INFORMATION\r\n\r\n\r\n\r\nWe are not responsible if information made available on this site is not accurate, complete or current. The material on this site is provided for general information only and should not be relied upon or used as the sole basis for making decisions without consulting primary, more accurate, more complete or more timely sources of information. Any reliance on the material on this site is at your own risk.\r\n\r\nThis site may contain certain historical information. Historical information, necessarily, is not current and is provided for your reference only. We reserve the right to modify the contents of this site at any time, but we have no obligation to update any information on our site. You agree that it is your responsibility to monitor changes to our site.\r\n\r\n\r\n\r\nSECTION 4 - MODIFICATIONS TO THE SERVICE AND PRICES\r\n\r\n\r\n\r\nPrices for our products are subject to change without notice.\r\n\r\nWe reserve the right at any time to modify or discontinue the Service (or any part or content thereof) without notice at any time.\r\n\r\nWe shall not be liable to you or to any third-party for any modification, price change, suspension or discontinuance of the Service.\r\n\r\n\r\n\r\nSECTION 5 - PRODUCTS OR SERVICES (if applicable)\r\n\r\n\r\n\r\nCertain products or services may be available exclusively online through the website. These products or services may have limited quantities and are subject to return or exchange only according to our Return Policy.\r\n\r\nWe have made every effort to display as accurately as possible the colors and images of our products that appear at the store. We cannot guarantee that your computer monitor''s display of any color will be accurate.\r\n\r\nWe reserve the right, but are not obligated, to limit the sales of our products or Services to any person, geographic region or jurisdiction. We may exercise this right on a case-by-case basis. We reserve the right to limit the quantities of any products or services that we offer. All descriptions of products or product pricing are subject to change at anytime without notice, at the sole discretion of us. We reserve the right to discontinue any product at any time. Any offer for any product or service made on this site is void where prohibited.\r\n\r\nWe do not warrant that the quality of any products, services, information, or other material purchased or obtained by you will meet your expectations, or that any errors in the Service will be corrected.\r\n\r\n\r\n\r\nSECTION 6 - ACCURACY OF BILLING AND ACCOUNT INFORMATION\r\n\r\n\r\n\r\nWe reserve the right to refuse any order you place with us. We may, in our sole discretion, limit or cancel quantities purchased per person, per household or per order. These restrictions may include orders placed by or under the same customer account, the same credit card, and/or orders that use the same billing and/or shipping address. In the event that we make a change to or cancel an order, we may attempt to notify you by contacting the e-mail and/or billing address/phone number provided at the time the order was made. We reserve the right to limit or prohibit orders that, in our sole judgment, appear to be placed by dealers, resellers or distributors.\r\n\r\n\r\n\r\nYou agree to provide current, complete and accurate purchase and account information for all purchases made at our store. You agree to promptly update your account and other information, including your email address and credit card numbers and expiration dates, so that we can complete your transactions and contact you as needed.\r\n\r\n\r\n\r\nFor more detail, please review our Returns Policy.\r\n\r\n\r\n\r\nSECTION 7 - OPTIONAL TOOLS\r\n\r\n\r\n\r\nWe may provide you with access to third-party tools over which we neither monitor nor have any control nor input.\r\n\r\nYou acknowledge and agree that we provide access to such tools ”as is” and “as available” without any warranties, representations or conditions of any kind and without any endorsement. We shall have no liability whatsoever arising from or relating to your use of optional third-party tools.\r\n\r\nAny use by you of optional tools offered through the site is entirely at your own risk and discretion and you should ensure that you are familiar with and approve of the terms on which tools are provided by the relevant third-party provider(s).\r\n\r\nWe may also, in the future, offer new services and/or features through the website (including, the release of new tools and resources). Such new features and/or services shall also be subject to these Terms of Service.\r\n\r\n\r\n\r\nSECTION 8 - THIRD-PARTY LINKS\r\n\r\n\r\n\r\nCertain content, products and services available via our Service may include materials from third-parties.\r\n\r\nThird-party links on this site may direct you to third-party websites that are not affiliated with us. We are not responsible for examining or evaluating the content or accuracy and we do not warrant and will not have any liability or responsibility for any third-party materials or websites, or for any other materials, products, or services of third-parties.\r\n\r\nWe are not liable for any harm or damages related to the purchase or use of goods, services, resources, content, or any other transactions made in connection with any third-party websites. Please review carefully the third-party''s policies and practices and make sure you understand them before you engage in any transaction. Complaints, claims, concerns, or questions regarding third-party products should be directed to the third-party.\r\n\r\n\r\n\r\nSECTION 9 - USER COMMENTS, FEEDBACK AND OTHER SUBMISSIONS\r\n\r\n\r\n\r\nIf, at our request, you send certain specific submissions (for example contest entries) or without a request from us you send creative ideas, suggestions, proposals, plans, or other materials, whether online, by email, by postal mail, or otherwise (collectively, ''comments''), you agree that we may, at any time, without restriction, edit, copy, publish, distribute, translate and otherwise use in any medium any comments that you forward to us. We are and shall be under no obligation (1) to maintain any comments in confidence; (2) to pay compensation for any comments; or (3) to respond to any comments.\r\n\r\nWe may, but have no obligation to, monitor, edit or remove content that we determine in our sole discretion are unlawful, offensive, threatening, libelous, defamatory, pornographic, obscene or otherwise objectionable or violates any party’s intellectual property or these Terms of Service.\r\n\r\nYou agree that your comments will not violate any right of any third-party, including copyright, trademark, privacy, personality or other personal or proprietary right. You further agree that your comments will not contain libelous or otherwise unlawful, abusive or obscene material, or contain any computer virus or other malware that could in any way affect the operation of the Service or any related website. You may not use a false e-mail address, pretend to be someone other than yourself, or otherwise mislead us or third-parties as to the origin of any comments. You are solely responsible for any comments you make and their accuracy. We take no responsibility and assume no liability for any comments posted by you or any third-party.\r\n\r\n\r\n\r\nSECTION 10 - PERSONAL INFORMATION\r\n\r\n\r\n\r\nYour submission of personal information through the store is governed by our Privacy Policy. To view our Privacy Policy.\r\n\r\n\r\n\r\nSECTION 11 - ERRORS, INACCURACIES AND OMISSIONS\r\n\r\n\r\n\r\nOccasionally there may be information on our site or in the Service that contains typographical errors, inaccuracies or omissions that may relate to product descriptions, pricing, promotions, offers, product shipping charges, transit times and availability. We reserve the right to correct any errors, inaccuracies or omissions, and to change or update information or cancel orders if any information in the Service or on any related website is inaccurate at any time without prior notice (including after you have submitted your order).\r\n\r\nWe undertake no obligation to update, amend or clarify information in the Service or on any related website, including without limitation, pricing information, except as required by law. No specified update or refresh date applied in the Service or on any related website, should be taken to indicate that all information in the Service or on any related website has been modified or updated.\r\n\r\n\r\n\r\nSECTION 12 - PROHIBITED USES\r\n\r\n\r\n\r\nIn addition to other prohibitions as set forth in the Terms of Service, you are prohibited from using the site or its content: (a) for any unlawful purpose; (b) to solicit others to perform or participate in any unlawful acts; (c) to violate any international, federal, provincial or state regulations, rules, laws, or local ordinances; (d) to infringe upon or violate our intellectual property rights or the intellectual property rights of others; (e) to harass, abuse, insult, harm, defame, slander, disparage, intimidate, or discriminate based on gender, sexual orientation, religion, ethnicity, race, age, national origin, or disability; (f) to submit false or misleading information; (g) to upload or transmit viruses or any other type of malicious code that will or may be used in any way that will affect the functionality or operation of the Service or of any related website, other websites, or the Internet; (h) to collect or track the personal information of others; (i) to spam, phish, pharm, pretext, spider, crawl, or scrape; (j) for any obscene or immoral purpose; or (k) to interfere with or circumvent the security features of the Service or any related website, other websites, or the Internet. We reserve the right to terminate your use of the Service or any related website for violating any of the prohibited uses.\r\n\r\n\r\n\r\nSECTION 13 - DISCLAIMER OF WARRANTIES; LIMITATION OF LIABILITY\r\n\r\n\r\n\r\nWe do not guarantee, represent or warrant that your use of our service will be uninterrupted, timely, secure or error-free.\r\n\r\nWe do not warrant that the results that may be obtained from the use of the service will be accurate or reliable.\r\n\r\nYou agree that from time to time we may remove the service for indefinite periods of time or cancel the service at any time, without notice to you.\r\n\r\nYou expressly agree that your use of, or inability to use, the service is at your sole risk. The service and all products and services delivered to you through the service are (except as expressly stated by us) provided ''as is'' and ''as available'' for your use, without any representation, warranties or conditions of any kind, either express or implied, including all implied warranties or conditions of merchantability, merchantable quality, fitness for a particular purpose, durability, title, and non-infringement.\r\n\r\nIn no case shall [ [ Business Name ] ], our directors, officers, employees, affiliates, agents, contractors, interns, suppliers, service providers or licensors be liable for any injury, loss, claim, or any direct, indirect, incidental, punitive, special, or consequential damages of any kind, including, without limitation lost profits, lost revenue, lost savings, loss of data, replacement costs, or any similar damages, whether based in contract, tort (including negligence), strict liability or otherwise, arising from your use of any of the service or any products procured using the service, or for any other claim related in any way to your use of the service or any product, including, but not limited to, any errors or omissions in any content, or any loss or damage of any kind incurred as a result of the use of the service or any content (or product) posted, transmitted, or otherwise made available via the service, even if advised of their possibility. Because some states or jurisdictions do not allow the exclusion or the limitation of liability for consequential or incidental damages, in such states or jurisdictions, our liability shall be limited to the maximum extent permitted by law.\r\n\r\n\r\n\r\nSECTION 14 - INDEMNIFICATION\r\n\r\n\r\n\r\nYou agree to indemnify, defend and hold harmless [ [ Business Name ] ] and our parent, subsidiaries, affiliates, partners, officers, directors, agents, contractors, licensors, service providers, subcontractors, suppliers, interns and employees, harmless from any claim or demand, including reasonable attorneys’ fees, made by any third-party due to or arising out of your breach of these Terms of Service or the documents they incorporate by reference, or your violation of any law or the rights of a third-party.\r\n\r\n\r\n\r\nSECTION 15 - SEVERABILITY\r\n\r\n\r\n\r\nIn the event that any provision of these Terms of Service is determined to be unlawful, void or unenforceable, such provision shall nonetheless be enforceable to the fullest extent permitted by applicable law, and the unenforceable portion shall be deemed to be severed from these Terms of Service, such determination shall not affect the validity and enforceability of any other remaining provisions.\r\n\r\n\r\n\r\nSECTION 16 - TERMINATION\r\n\r\n\r\n\r\nThe obligations and liabilities of the parties incurred prior to the termination date shall survive the termination of this agreement for all purposes.\r\n\r\nThese Terms of Service are effective unless and until terminated by either you or us. You may terminate these Terms of Service at any time by notifying us that you no longer wish to use our Services, or when you cease using our site.\r\n\r\nIf in our sole judgment you fail, or we suspect that you have failed, to comply with any term or provision of these Terms of Service, we also may terminate this agreement at any time without notice and you will remain liable for all amounts due up to and including the date of termination; and/or accordingly may deny you access to our Services (or any part thereof).\r\n\r\n\r\n\r\nSECTION 17 - ENTIRE AGREEMENT\r\n\r\n\r\n\r\nThe failure of us to exercise or enforce any right or provision of these Terms of Service shall not constitute a waiver of such right or provision.\r\n\r\nThese Terms of Service and any policies or operating rules posted by us on this site or in respect to The Service constitutes the entire agreement and understanding between you and us and govern your use of the Service, superseding any prior or contemporaneous agreements, communications and proposals, whether oral or written, between you and us (including, but not limited to, any prior versions of the Terms of Service).\r\n\r\nAny ambiguities in the interpretation of these Terms of Service shall not be construed against the drafting party.\r\n\r\n\r\n\r\nSECTION 18 - GOVERNING LAW\r\n\r\n\r\n\r\nThese Terms of Service and any separate agreements whereby we provide you Services shall be governed by and construed in accordance with the laws of [ [  Address ] ] [ [ City ] ] [ [ State ] ] [ [ Country ] ] [ [ PostCode ] ].\r\n\r\n\r\n\r\nSECTION 19 - CHANGES TO TERMS OF SERVICE\r\n\r\n\r\n\r\nYou can review the most current version of the Terms of Service at any time at this page.\r\n\r\nWe reserve the right, at our sole discretion, to update, change or replace any part of these Terms of Service by posting updates and changes to our website. It is your responsibility to check our website periodically for changes. Your continued use of or access to our website or the Service following the posting of any changes to these Terms of Service constitutes acceptance of those changes.\r\n\r\n\r\n\r\nSECTION 20 - CONTACT INFORMATION\r\n\r\n\r\n\r\nQuestions about the Terms of Service should be sent to us at [ [ email@email.com ] ].\r\n\r\n\r\n\r\n\r\n\r\n--------------------------------------\r\n', 'AIzaSyCutQnEgrqX8W2X-nBCYB7-CbsTC-LlRMw', '2016-11-29 10:31:20', '2016-11-29 10:31:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company_features`
--

CREATE TABLE `company_features` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company_features`
--

INSERT INTO `company_features` (`id`, `company_id`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Free Products', '2016-11-29 10:31:20', '2016-11-29 10:31:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `freeproducts`
--

CREATE TABLE `freeproducts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `participation_cost` int(11) NOT NULL,
  `min_participants` int(11) NOT NULL,
  `max_participants` int(11) NOT NULL,
  `max_participations_per_user` int(11) NOT NULL,
  `draw_number` int(11) NOT NULL,
  `draw_date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `freeproduct_order`
--

CREATE TABLE `freeproduct_order` (
  `freeproduct_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `freeproduct_participants`
--

CREATE TABLE `freeproduct_participants` (
  `id` int(10) UNSIGNED NOT NULL,
  `freeproduct_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('cancelled','registered','winner') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `action_type_id` int(10) UNSIGNED NOT NULL,
  `source_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `details` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `action_type_id`, `source_id`, `user_id`, `details`, `created_at`, `updated_at`) VALUES
(1, 11, 1, 4, 'Order #1 sent', '2016-11-29 10:30:34', '2016-11-29 10:30:34'),
(2, 1, 2, 13, 'Order #2 open', '2016-11-29 10:30:36', '2016-11-29 10:30:36'),
(3, 1, 3, 4, 'Order #3 open', '2016-11-29 10:30:36', '2016-11-29 10:30:36'),
(4, 11, 4, 9, 'Order #4 sent', '2016-11-29 10:30:36', '2016-11-29 10:30:36'),
(5, 1, 5, 3, 'Order #5 open', '2016-11-29 10:30:37', '2016-11-29 10:30:37'),
(6, 1, 7, 13, 'Order #7 open', '2016-11-29 10:30:38', '2016-11-29 10:30:38'),
(7, 8, 8, 4, 'Order #8 closed', '2016-11-29 10:30:38', '2016-11-29 10:30:38'),
(8, 1, 9, 4, 'Order #9 open', '2016-11-29 10:30:38', '2016-11-29 10:30:38'),
(9, 1, 11, 18, 'Order #11 open', '2016-11-29 10:30:39', '2016-11-29 10:30:39'),
(10, 1, 13, 3, 'Order #13 open', '2016-11-29 10:30:40', '2016-11-29 10:30:40'),
(11, 1, 14, 4, 'Order #14 open', '2016-11-29 10:30:41', '2016-11-29 10:30:41'),
(12, 10, 15, 18, 'Order #15 received', '2016-11-29 10:30:41', '2016-11-29 10:30:41'),
(13, 1, 16, 3, 'Order #16 open', '2016-11-29 10:30:42', '2016-11-29 10:30:42'),
(14, 1, 17, 9, 'Order #17 open', '2016-11-29 10:30:43', '2016-11-29 10:30:43'),
(15, 9, 18, 17, 'Order #18 cancelled', '2016-11-29 10:30:43', '2016-11-29 10:30:43'),
(16, 1, 19, 3, 'Order #19 open', '2016-11-29 10:30:44', '2016-11-29 10:30:44'),
(17, 1, 20, 9, 'Order #20 open', '2016-11-29 10:30:44', '2016-11-29 10:30:44'),
(18, 8, 21, 4, 'Order #21 closed', '2016-11-29 10:30:46', '2016-11-29 10:30:46'),
(19, 8, 22, 4, 'Order #22 closed', '2016-11-29 10:30:46', '2016-11-29 10:30:46'),
(20, 8, 23, 4, 'Order #23 closed', '2016-11-29 10:30:46', '2016-11-29 10:30:46'),
(21, 8, 24, 4, 'Order #24 closed', '2016-11-29 10:30:47', '2016-11-29 10:30:47'),
(22, 8, 25, 4, 'Order #25 closed', '2016-11-29 10:30:47', '2016-11-29 10:30:47'),
(23, 8, 26, 4, 'Order #26 closed', '2016-11-29 10:30:47', '2016-11-29 10:30:47'),
(24, 8, 27, 4, 'Order #27 closed', '2016-11-29 10:30:48', '2016-11-29 10:30:48'),
(25, 8, 28, 4, 'Order #28 closed', '2016-11-29 10:30:49', '2016-11-29 10:30:49'),
(26, 8, 29, 4, 'Order #29 closed', '2016-11-29 10:30:49', '2016-11-29 10:30:49'),
(27, 8, 30, 4, 'Order #30 closed', '2016-11-29 10:30:49', '2016-11-29 10:30:49'),
(28, 1, 31, 4, 'Order #31 open', '2016-11-29 10:30:50', '2016-11-29 10:30:50'),
(29, 10, 597158, 12, 'Enim nihil quia totam sed.', '2016-11-29 10:30:50', '2016-11-29 10:30:50'),
(30, 12, 694601, 11, 'Recusandae est dolores autem et.', '2016-11-29 10:30:50', '2016-11-29 10:30:50'),
(31, 12, 52966, 16, 'Dolore nihil reprehenderit nobis aperiam.', '2016-11-29 10:30:50', '2016-11-29 10:30:50'),
(32, 7, 181687, 11, 'Non sit sit ipsa aut totam.', '2016-11-29 10:30:50', '2016-11-29 10:30:50'),
(33, 6, 60051, 2, 'Et in quae sed et.', '2016-11-29 10:30:50', '2016-11-29 10:30:50'),
(34, 9, 151384, 9, 'Ut rerum consequatur quia accusantium.', '2016-11-29 10:30:51', '2016-11-29 10:30:51'),
(35, 2, 531296, 15, 'Tempore ea sequi officia.', '2016-11-29 10:30:51', '2016-11-29 10:30:51'),
(36, 8, 305505, 16, 'Sit unde dolor iste sed culpa.', '2016-11-29 10:30:51', '2016-11-29 10:30:51'),
(37, 4, 179087, 17, 'Voluptas id numquam veritatis sint asperiores.', '2016-11-29 10:30:51', '2016-11-29 10:30:51'),
(38, 8, 522790, 7, 'Atque nemo porro molestias ducimus animi.', '2016-11-29 10:30:51', '2016-11-29 10:30:51'),
(39, 4, 597406, 14, 'Nihil recusandae quasi beatae quam.', '2016-11-29 10:30:51', '2016-11-29 10:30:51'),
(40, 12, 395585, 22, 'Sunt eos sed consequuntur et ad omnis eos nihil.', '2016-11-29 10:30:51', '2016-11-29 10:30:51'),
(41, 4, 186862, 16, 'Tenetur aut totam illo qui iste ab et.', '2016-11-29 10:30:51', '2016-11-29 10:30:51'),
(42, 12, 50253, 5, 'Architecto id sed ut laudantium.', '2016-11-29 10:30:51', '2016-11-29 10:30:51'),
(43, 11, 722020, 15, 'Ipsum ea inventore aut ratione vel.', '2016-11-29 10:30:51', '2016-11-29 10:30:51'),
(44, 12, 314576, 6, 'Aut ad ex qui laboriosam rem at.', '2016-11-29 10:30:52', '2016-11-29 10:30:52'),
(45, 11, 367955, 2, 'Distinctio porro et harum et.', '2016-11-29 10:30:52', '2016-11-29 10:30:52'),
(46, 5, 595679, 15, 'Expedita labore mollitia odit dolores.', '2016-11-29 10:30:52', '2016-11-29 10:30:52'),
(47, 8, 293859, 5, 'Ut alias modi amet eos delectus temporibus.', '2016-11-29 10:30:52', '2016-11-29 10:30:52'),
(48, 10, 504909, 9, 'Quibusdam et quia rem nisi ipsum expedita non.', '2016-11-29 10:30:52', '2016-11-29 10:30:52');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_03_10_203321_create_type_preferences_table', 1),
('2015_03_11_200446_create_persons_table', 1),
('2015_03_11_203023_create_businesses_table', 1),
('2015_03_12_204126_create_addresses_table', 1),
('2015_03_12_210054_create_categories_table', 1),
('2015_03_12_210941_create_products_table', 1),
('2015_03_12_214023_create_product_offers_table', 1),
('2015_03_12_215015_create_product_details_table', 1),
('2015_03_13_144541_create_orders_table', 1),
('2015_03_13_144622_create_order_details_table', 1),
('2015_03_13_144805_create_virtual_products_table', 1),
('2015_03_13_145859_create_virtual_product_orders_table', 1),
('2015_03_13_173855_create_freeproducts_table', 1),
('2015_03_13_173953_create_freeproduct_participants_table', 1),
('2015_03_13_174019_create_freeproduct_order_table', 1),
('2015_03_27_182914_create_action_types_table', 1),
('2015_03_27_183007_create_logs_table', 1),
('2015_04_06_103013_create_notices_table', 1),
('2015_04_16_132134_create_user_points_table', 1),
('2015_04_20_132905_create_comments_table', 1),
('2015_05_28_183136_create_paypal_orders_table', 1),
('2015_08_24_164817_create_company_table', 1),
('2015_08_24_170025_create_company_features_table', 1),
('2016_06_07_114833_change_zipcode_addresses_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL,
  `action_type_id` int(10) UNSIGNED NOT NULL,
  `source_id` int(10) UNSIGNED NOT NULL,
  `status` enum('new','unread','read') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `user_id`, `sender_id`, `action_type_id`, `source_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 3, 11, 1, 'new', '2016-11-29 10:30:35', '2016-11-29 10:30:35'),
(2, 9, 3, 11, 4, 'new', '2016-11-29 10:30:37', '2016-11-29 10:30:37'),
(3, 3, 13, 1, 7, 'new', '2016-11-29 10:30:38', '2016-11-29 10:30:38'),
(4, 3, 4, 8, 8, 'new', '2016-11-29 10:30:38', '2016-11-29 10:30:38'),
(5, 3, 17, 9, 18, 'new', '2016-11-29 10:30:43', '2016-11-29 10:30:43'),
(6, 17, 3, 9, 18, 'new', '2016-11-29 10:30:44', '2016-11-29 10:30:44');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `address_id` int(10) UNSIGNED DEFAULT NULL,
  `seller_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('cancelled','closed','open','paid','pending','received','sent') COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('cart','wishlist','order','later','freeproduct') COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `rate_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate_mail_sent` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address_id`, `seller_id`, `status`, `type`, `description`, `end_date`, `rate`, `rate_comment`, `rate_mail_sent`, `created_at`, `updated_at`) VALUES
(1, 4, 2, 3, 'sent', 'order', '', NULL, NULL, NULL, 0, '2016-11-29 10:30:34', '2016-11-29 10:30:34'),
(2, 13, 7, 3, 'open', 'cart', '', NULL, NULL, NULL, 0, '2016-11-29 10:30:35', '2016-11-29 10:30:35'),
(3, 4, 1, 3, 'open', 'wishlist', 'Ltd', NULL, NULL, NULL, 0, '2016-11-29 10:30:36', '2016-11-29 10:30:36'),
(4, 9, 10, 3, 'sent', 'order', '', NULL, NULL, NULL, 0, '2016-11-29 10:30:36', '2016-11-29 10:30:36'),
(5, 3, 4, 3, 'open', 'cart', '', NULL, NULL, NULL, 0, '2016-11-29 10:30:37', '2016-11-29 10:30:37'),
(6, 4, 1, 3, 'paid', 'order', '', NULL, NULL, NULL, 0, '2016-11-29 10:30:37', '2016-11-29 10:30:37'),
(7, 13, 6, 3, 'open', 'order', '', NULL, NULL, NULL, 0, '2016-11-29 10:30:38', '2016-11-29 10:30:38'),
(8, 4, 2, 3, 'closed', 'order', '', '1989-06-17 14:27:06', NULL, NULL, 0, '2016-11-29 10:30:38', '2016-11-29 10:30:38'),
(9, 4, 2, 3, 'open', 'wishlist', 'Inc', NULL, NULL, NULL, 0, '2016-11-29 10:30:38', '2016-11-29 10:30:38'),
(10, 17, 5, 3, 'paid', 'order', '', NULL, NULL, NULL, 0, '2016-11-29 10:30:39', '2016-11-29 10:30:39'),
(11, 18, 9, 3, 'open', 'cart', '', NULL, NULL, NULL, 0, '2016-11-29 10:30:39', '2016-11-29 10:30:39'),
(12, 13, 7, 3, 'paid', 'order', '', NULL, NULL, NULL, 0, '2016-11-29 10:30:39', '2016-11-29 10:30:39'),
(13, 3, 4, 3, 'open', 'cart', '', NULL, NULL, NULL, 0, '2016-11-29 10:30:40', '2016-11-29 10:30:40'),
(14, 4, 1, 3, 'open', 'wishlist', 'LLC', NULL, NULL, NULL, 0, '2016-11-29 10:30:41', '2016-11-29 10:30:41'),
(15, 18, 9, 3, 'received', 'order', '', NULL, NULL, NULL, 0, '2016-11-29 10:30:41', '2016-11-29 10:30:41'),
(16, 3, 4, 3, 'open', 'cart', '', NULL, NULL, NULL, 0, '2016-11-29 10:30:42', '2016-11-29 10:30:42'),
(17, 9, 10, 3, 'open', 'wishlist', 'Ltd', NULL, NULL, NULL, 0, '2016-11-29 10:30:42', '2016-11-29 10:30:42'),
(18, 17, 5, 3, 'cancelled', 'order', '', '2004-02-11 12:44:03', NULL, NULL, 0, '2016-11-29 10:30:43', '2016-11-29 10:30:43'),
(19, 3, 4, 3, 'open', 'wishlist', 'Inc', NULL, NULL, NULL, 0, '2016-11-29 10:30:44', '2016-11-29 10:30:44'),
(20, 9, 10, 3, 'open', 'wishlist', 'Group', NULL, NULL, NULL, 0, '2016-11-29 10:30:44', '2016-11-29 10:30:44'),
(21, 4, 11, 3, 'closed', 'order', '', '1981-10-30 22:03:08', NULL, NULL, 0, '2016-11-29 10:30:46', '2016-11-29 10:30:46'),
(22, 4, 11, 3, 'closed', 'order', '', '1996-10-26 05:28:13', NULL, NULL, 0, '2016-11-29 10:30:46', '2016-11-29 10:30:46'),
(23, 4, 11, 3, 'closed', 'order', '', '2011-08-29 11:32:24', NULL, NULL, 0, '2016-11-29 10:30:46', '2016-11-29 10:30:46'),
(24, 4, 11, 3, 'closed', 'order', '', '2003-02-22 06:51:20', NULL, NULL, 0, '2016-11-29 10:30:47', '2016-11-29 10:30:47'),
(25, 4, 11, 3, 'closed', 'order', '', '1979-06-07 12:09:37', NULL, NULL, 0, '2016-11-29 10:30:47', '2016-11-29 10:30:47'),
(26, 4, 11, 3, 'closed', 'order', '', '1982-04-23 23:23:23', NULL, NULL, 0, '2016-11-29 10:30:47', '2016-11-29 10:30:47'),
(27, 4, 11, 3, 'closed', 'order', '', '1983-07-01 23:49:34', NULL, NULL, 0, '2016-11-29 10:30:48', '2016-11-29 10:30:48'),
(28, 4, 11, 3, 'closed', 'order', '', '1992-06-06 11:05:18', NULL, NULL, 0, '2016-11-29 10:30:48', '2016-11-29 10:30:48'),
(29, 4, 11, 3, 'closed', 'order', '', '2001-09-15 18:32:00', NULL, NULL, 0, '2016-11-29 10:30:49', '2016-11-29 10:30:49'),
(30, 4, 11, 3, 'closed', 'order', '', '1970-03-03 04:59:34', NULL, NULL, 0, '2016-11-29 10:30:49', '2016-11-29 10:30:49'),
(31, 4, 11, 3, 'open', 'order', '', NULL, NULL, NULL, 0, '2016-11-29 10:30:50', '2016-11-29 10:30:50');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `price` double(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `delivery_date` datetime DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `rate_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `price`, `quantity`, `status`, `delivery_date`, `rate`, `rate_comment`, `created_at`, `updated_at`) VALUES
(1, 1, 11, 98.00, 3, 1, NULL, NULL, NULL, '2016-11-29 10:30:35', '2016-11-29 10:30:35'),
(2, 1, 34, 35.00, 3, 1, NULL, NULL, NULL, '2016-11-29 10:30:35', '2016-11-29 10:30:35'),
(3, 1, 17, 21.00, 3, 1, NULL, NULL, NULL, '2016-11-29 10:30:35', '2016-11-29 10:30:35'),
(4, 2, 88, 22.00, 5, 1, NULL, NULL, NULL, '2016-11-29 10:30:36', '2016-11-29 10:30:36'),
(5, 2, 117, 16.00, 5, 1, NULL, NULL, NULL, '2016-11-29 10:30:36', '2016-11-29 10:30:36'),
(6, 2, 130, 38.00, 5, 1, '2009-03-28 01:03:11', NULL, NULL, '2016-11-29 10:30:36', '2016-11-29 10:30:36'),
(7, 2, 49, 44.00, 5, 1, NULL, NULL, NULL, '2016-11-29 10:30:36', '2016-11-29 10:30:36'),
(8, 3, 86, 69.00, 4, 1, NULL, NULL, NULL, '2016-11-29 10:30:36', '2016-11-29 10:30:36'),
(9, 3, 8, 14.00, 4, 1, '1993-12-20 21:56:37', NULL, NULL, '2016-11-29 10:30:36', '2016-11-29 10:30:36'),
(10, 3, 146, 67.00, 4, 1, '2016-01-27 10:32:54', NULL, NULL, '2016-11-29 10:30:36', '2016-11-29 10:30:36'),
(11, 3, 50, 6.00, 4, 1, '2010-04-25 14:30:18', NULL, NULL, '2016-11-29 10:30:36', '2016-11-29 10:30:36'),
(12, 4, 89, 77.00, 20, 1, '1977-06-24 22:18:14', NULL, NULL, '2016-11-29 10:30:36', '2016-11-29 10:30:36'),
(13, 4, 54, 60.00, 20, 1, NULL, NULL, NULL, '2016-11-29 10:30:37', '2016-11-29 10:30:37'),
(14, 5, 62, 10.00, 7, 1, '2015-10-03 02:04:23', NULL, NULL, '2016-11-29 10:30:37', '2016-11-29 10:30:37'),
(15, 5, 44, 51.00, 7, 1, '1984-11-16 22:08:56', NULL, NULL, '2016-11-29 10:30:37', '2016-11-29 10:30:37'),
(16, 5, 20, 43.00, 7, 1, '1999-05-13 04:47:53', NULL, NULL, '2016-11-29 10:30:37', '2016-11-29 10:30:37'),
(17, 5, 137, 31.00, 7, 1, '1995-12-29 21:45:39', NULL, NULL, '2016-11-29 10:30:37', '2016-11-29 10:30:37'),
(18, 5, 26, 95.00, 7, 1, NULL, NULL, NULL, '2016-11-29 10:30:37', '2016-11-29 10:30:37'),
(19, 6, 37, 4.00, 6, 1, NULL, NULL, NULL, '2016-11-29 10:30:37', '2016-11-29 10:30:37'),
(20, 6, 19, 31.00, 6, 1, NULL, NULL, NULL, '2016-11-29 10:30:37', '2016-11-29 10:30:37'),
(21, 6, 27, 79.00, 6, 1, '1975-02-16 04:58:08', NULL, NULL, '2016-11-29 10:30:38', '2016-11-29 10:30:38'),
(22, 6, 45, 99.00, 6, 1, NULL, NULL, NULL, '2016-11-29 10:30:38', '2016-11-29 10:30:38'),
(23, 6, 69, 98.00, 6, 1, '1976-07-23 11:20:15', NULL, NULL, '2016-11-29 10:30:38', '2016-11-29 10:30:38'),
(24, 7, 150, 5.00, 4, 1, NULL, NULL, NULL, '2016-11-29 10:30:38', '2016-11-29 10:30:38'),
(25, 7, 99, 4.00, 4, 1, '1989-02-18 23:27:24', NULL, NULL, '2016-11-29 10:30:38', '2016-11-29 10:30:38'),
(26, 7, 89, 77.00, 4, 1, '1979-06-21 11:32:53', NULL, NULL, '2016-11-29 10:30:38', '2016-11-29 10:30:38'),
(27, 7, 77, 35.00, 4, 1, '1991-01-13 05:58:56', NULL, NULL, '2016-11-29 10:30:38', '2016-11-29 10:30:38'),
(28, 8, 9, 23.00, 3, 1, '1991-01-18 12:23:34', NULL, NULL, '2016-11-29 10:30:38', '2016-11-29 10:30:38'),
(29, 8, 100, 75.00, 3, 1, '1976-01-09 09:23:05', NULL, NULL, '2016-11-29 10:30:38', '2016-11-29 10:30:38'),
(30, 9, 144, 47.00, 1, 1, '2001-12-10 01:53:38', NULL, NULL, '2016-11-29 10:30:39', '2016-11-29 10:30:39'),
(31, 9, 40, 74.00, 1, 1, '1975-12-13 05:19:05', NULL, NULL, '2016-11-29 10:30:39', '2016-11-29 10:30:39'),
(32, 9, 78, 21.00, 1, 1, NULL, NULL, NULL, '2016-11-29 10:30:39', '2016-11-29 10:30:39'),
(33, 9, 77, 35.00, 1, 1, '1973-03-25 08:11:42', NULL, NULL, '2016-11-29 10:30:39', '2016-11-29 10:30:39'),
(34, 10, 137, 31.00, 11, 1, NULL, NULL, NULL, '2016-11-29 10:30:39', '2016-11-29 10:30:39'),
(35, 10, 57, 16.00, 11, 1, NULL, NULL, NULL, '2016-11-29 10:30:39', '2016-11-29 10:30:39'),
(36, 11, 14, 36.00, 7, 1, NULL, NULL, NULL, '2016-11-29 10:30:39', '2016-11-29 10:30:39'),
(37, 11, 130, 38.00, 7, 1, NULL, NULL, NULL, '2016-11-29 10:30:39', '2016-11-29 10:30:39'),
(38, 11, 26, 95.00, 7, 1, '1978-03-13 15:41:44', NULL, NULL, '2016-11-29 10:30:39', '2016-11-29 10:30:39'),
(39, 11, 79, 32.00, 7, 1, NULL, NULL, NULL, '2016-11-29 10:30:39', '2016-11-29 10:30:39'),
(40, 11, 109, 42.00, 7, 1, '1979-12-23 05:28:21', NULL, NULL, '2016-11-29 10:30:39', '2016-11-29 10:30:39'),
(41, 12, 81, 64.00, 19, 1, NULL, NULL, NULL, '2016-11-29 10:30:40', '2016-11-29 10:30:40'),
(42, 12, 91, 25.00, 19, 1, NULL, NULL, NULL, '2016-11-29 10:30:40', '2016-11-29 10:30:40'),
(43, 12, 37, 4.00, 19, 1, NULL, NULL, NULL, '2016-11-29 10:30:40', '2016-11-29 10:30:40'),
(44, 12, 3, 98.00, 19, 1, '1990-04-04 13:20:11', NULL, NULL, '2016-11-29 10:30:40', '2016-11-29 10:30:40'),
(45, 13, 106, 8.00, 5, 1, '2004-12-22 08:31:41', NULL, NULL, '2016-11-29 10:30:40', '2016-11-29 10:30:40'),
(46, 13, 15, 74.00, 5, 1, NULL, NULL, NULL, '2016-11-29 10:30:40', '2016-11-29 10:30:40'),
(47, 13, 68, 85.00, 5, 1, '2005-04-28 23:47:38', NULL, NULL, '2016-11-29 10:30:40', '2016-11-29 10:30:40'),
(48, 13, 142, 43.00, 5, 1, NULL, NULL, NULL, '2016-11-29 10:30:40', '2016-11-29 10:30:40'),
(49, 14, 41, 28.00, 6, 1, NULL, NULL, NULL, '2016-11-29 10:30:41', '2016-11-29 10:30:41'),
(50, 14, 9, 23.00, 6, 1, NULL, NULL, NULL, '2016-11-29 10:30:41', '2016-11-29 10:30:41'),
(51, 14, 2, 97.00, 6, 1, '2012-10-07 02:48:16', NULL, NULL, '2016-11-29 10:30:41', '2016-11-29 10:30:41'),
(52, 15, 85, 63.00, 20, 1, '2006-02-18 15:17:48', NULL, NULL, '2016-11-29 10:30:41', '2016-11-29 10:30:41'),
(53, 15, 143, 79.00, 20, 1, NULL, NULL, NULL, '2016-11-29 10:30:41', '2016-11-29 10:30:41'),
(54, 15, 138, 93.00, 20, 1, NULL, NULL, NULL, '2016-11-29 10:30:41', '2016-11-29 10:30:41'),
(55, 15, 15, 74.00, 20, 1, NULL, NULL, NULL, '2016-11-29 10:30:42', '2016-11-29 10:30:42'),
(56, 16, 13, 81.00, 15, 1, NULL, NULL, NULL, '2016-11-29 10:30:42', '2016-11-29 10:30:42'),
(57, 16, 42, 96.00, 15, 1, NULL, NULL, NULL, '2016-11-29 10:30:42', '2016-11-29 10:30:42'),
(58, 16, 116, 43.00, 15, 1, NULL, NULL, NULL, '2016-11-29 10:30:42', '2016-11-29 10:30:42'),
(59, 16, 57, 16.00, 15, 1, '1972-09-29 12:37:12', NULL, NULL, '2016-11-29 10:30:42', '2016-11-29 10:30:42'),
(60, 16, 110, 48.00, 15, 1, '1986-11-15 14:44:05', NULL, NULL, '2016-11-29 10:30:42', '2016-11-29 10:30:42'),
(61, 17, 37, 4.00, 20, 1, '1976-02-15 11:05:39', NULL, NULL, '2016-11-29 10:30:43', '2016-11-29 10:30:43'),
(62, 17, 90, 41.00, 20, 1, '2008-08-05 21:58:08', NULL, NULL, '2016-11-29 10:30:43', '2016-11-29 10:30:43'),
(63, 17, 137, 31.00, 20, 1, NULL, NULL, NULL, '2016-11-29 10:30:43', '2016-11-29 10:30:43'),
(64, 17, 84, 24.00, 20, 1, '1986-09-02 21:21:47', NULL, NULL, '2016-11-29 10:30:43', '2016-11-29 10:30:43'),
(65, 17, 4, 50.00, 20, 1, NULL, NULL, NULL, '2016-11-29 10:30:43', '2016-11-29 10:30:43'),
(66, 18, 146, 67.00, 10, 1, NULL, NULL, NULL, '2016-11-29 10:30:43', '2016-11-29 10:30:43'),
(67, 18, 49, 44.00, 10, 1, '1983-01-02 09:24:36', NULL, NULL, '2016-11-29 10:30:43', '2016-11-29 10:30:43'),
(68, 18, 5, 60.00, 10, 1, NULL, NULL, NULL, '2016-11-29 10:30:43', '2016-11-29 10:30:43'),
(69, 18, 104, 92.00, 10, 1, '1998-07-01 03:27:46', NULL, NULL, '2016-11-29 10:30:43', '2016-11-29 10:30:43'),
(70, 19, 63, 4.00, 12, 1, '1977-02-12 05:39:15', NULL, NULL, '2016-11-29 10:30:44', '2016-11-29 10:30:44'),
(71, 19, 42, 96.00, 12, 1, NULL, NULL, NULL, '2016-11-29 10:30:44', '2016-11-29 10:30:44'),
(72, 19, 88, 22.00, 12, 1, '1993-04-26 16:52:51', NULL, NULL, '2016-11-29 10:30:44', '2016-11-29 10:30:44'),
(73, 20, 115, 19.00, 14, 1, '2016-05-11 05:12:05', NULL, NULL, '2016-11-29 10:30:44', '2016-11-29 10:30:44'),
(74, 20, 22, 53.00, 14, 1, '1971-08-29 15:42:54', NULL, NULL, '2016-11-29 10:30:44', '2016-11-29 10:30:44'),
(75, 20, 148, 61.00, 14, 1, NULL, NULL, NULL, '2016-11-29 10:30:44', '2016-11-29 10:30:44'),
(76, 20, 88, 22.00, 14, 1, '2014-04-03 20:15:02', NULL, NULL, '2016-11-29 10:30:45', '2016-11-29 10:30:45'),
(77, 20, 44, 51.00, 14, 1, '1985-02-18 10:24:19', NULL, NULL, '2016-11-29 10:30:45', '2016-11-29 10:30:45'),
(78, 21, 151, 75.00, 1, 1, '1985-12-08 15:36:49', 1, 'Iusto ad quisquam aut sint veritatis. Qui et error qui eveniet repellendus.', '2016-11-29 10:30:46', '2016-11-29 10:30:46'),
(79, 22, 151, 75.00, 1, 1, '1980-06-11 16:13:09', 4, 'Architecto tempora cupiditate repudiandae aut cumque.', '2016-11-29 10:30:46', '2016-11-29 10:30:46'),
(80, 23, 151, 75.00, 1, 1, '1989-03-04 17:06:31', 5, 'Itaque culpa itaque asperiores libero. Quo amet enim omnis ut pariatur earum.', '2016-11-29 10:30:46', '2016-11-29 10:30:46'),
(81, 24, 151, 75.00, 1, 1, '1992-01-30 01:39:56', 2, 'Labore eaque nesciunt consequatur voluptatem repellendus. Aut consequuntur nulla ut quis.', '2016-11-29 10:30:47', '2016-11-29 10:30:47'),
(82, 25, 151, 75.00, 1, 1, '1984-09-26 23:48:27', 5, 'Esse sed omnis facilis ex ipsa debitis occaecati.', '2016-11-29 10:30:47', '2016-11-29 10:30:47'),
(83, 26, 151, 75.00, 1, 1, '1973-04-18 22:10:45', NULL, NULL, '2016-11-29 10:30:47', '2016-11-29 10:30:47'),
(84, 26, 152, 71.00, 1, 1, '2003-08-23 10:16:23', NULL, NULL, '2016-11-29 10:30:48', '2016-11-29 10:30:48'),
(85, 26, 153, 75.00, 1, 1, '1985-08-21 11:02:55', NULL, NULL, '2016-11-29 10:30:48', '2016-11-29 10:30:48'),
(86, 27, 151, 75.00, 1, 1, '1971-02-06 08:47:57', NULL, NULL, '2016-11-29 10:30:48', '2016-11-29 10:30:48'),
(87, 27, 152, 71.00, 1, 1, '2000-05-01 01:11:52', NULL, NULL, '2016-11-29 10:30:48', '2016-11-29 10:30:48'),
(88, 27, 153, 75.00, 1, 1, '1973-07-16 00:19:36', NULL, NULL, '2016-11-29 10:30:48', '2016-11-29 10:30:48'),
(89, 28, 151, 75.00, 1, 1, '1973-08-12 14:48:18', NULL, NULL, '2016-11-29 10:30:49', '2016-11-29 10:30:49'),
(90, 28, 152, 71.00, 1, 1, '1978-12-26 13:48:35', NULL, NULL, '2016-11-29 10:30:49', '2016-11-29 10:30:49'),
(91, 28, 153, 75.00, 1, 1, '1987-07-15 17:35:29', NULL, NULL, '2016-11-29 10:30:49', '2016-11-29 10:30:49'),
(92, 29, 151, 75.00, 1, 1, '1991-08-04 13:55:14', NULL, NULL, '2016-11-29 10:30:49', '2016-11-29 10:30:49'),
(93, 29, 152, 71.00, 1, 1, '1973-02-28 01:45:40', NULL, NULL, '2016-11-29 10:30:49', '2016-11-29 10:30:49'),
(94, 29, 153, 75.00, 1, 1, '2002-02-08 12:22:58', NULL, NULL, '2016-11-29 10:30:49', '2016-11-29 10:30:49'),
(95, 30, 151, 75.00, 1, 1, '2014-06-15 09:41:20', NULL, NULL, '2016-11-29 10:30:50', '2016-11-29 10:30:50'),
(96, 30, 152, 71.00, 1, 1, '2003-02-19 11:17:03', NULL, NULL, '2016-11-29 10:30:50', '2016-11-29 10:30:50'),
(97, 30, 153, 75.00, 1, 1, '1989-07-28 10:11:02', NULL, NULL, '2016-11-29 10:30:50', '2016-11-29 10:30:50'),
(98, 31, 151, 75.00, 3, 1, NULL, NULL, NULL, '2016-11-29 10:30:50', '2016-11-29 10:30:50');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_orders`
--

CREATE TABLE `paypal_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `payment_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `sex` enum('female','male') COLLATE utf8_unicode_ci NOT NULL,
  `home_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `persons`
--

INSERT INTO `persons` (`user_id`, `first_name`, `last_name`, `birthday`, `sex`, `home_phone`) VALUES
(1, 'Admin', 'root', '2016-11-30', 'male', '+0521988321951'),
(2, 'AntVel', 'Developer', '1983-06-20', 'male', '+9280186339038'),
(4, 'Joesph', 'Hudson', '1981-07-31', 'male', '+0742180239244'),
(5, 'Orin', 'Heaney', '1984-09-27', 'male', '+3516763037238'),
(6, 'Ansley', 'Buckridge', '1989-09-07', 'female', '+9490434026122'),
(7, 'Mckayla', 'Brown', '1997-03-09', 'male', '+3017002409250'),
(8, 'Alden', 'Wiza', '1996-02-12', 'male', '+1055862031693'),
(9, 'Josianne', 'Mitchell', '1993-10-24', 'female', '+0106195184990'),
(10, 'Leslie', 'Skiles', '1981-04-22', 'female', '+3834142662337'),
(11, 'Lyda', 'Kirlin', '1987-01-11', 'female', '+6894244686323'),
(12, 'Rahsaan', 'Wisoky', '1992-03-04', 'female', '+6223494077938'),
(13, 'Iliana', 'Schaden', '1982-01-25', 'male', '+2863266576341'),
(14, 'Shane', 'Dooley', '1977-12-21', 'male', '+0785663578919');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `products_group` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `type` enum('item','key','software','software_key','gift_card','freeproduct') COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `price` double(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `low_stock` int(11) NOT NULL DEFAULT '0',
  `bar_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `condition` enum('new','refurbished','used') COLLATE utf8_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `features` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rate_val` double(10,2) DEFAULT NULL,
  `rate_count` int(11) DEFAULT NULL,
  `sale_counts` int(10) UNSIGNED NOT NULL,
  `view_counts` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `user_id`, `parent_id`, `products_group`, `status`, `type`, `name`, `description`, `price`, `stock`, `low_stock`, `bar_code`, `brand`, `condition`, `tags`, `features`, `rate_val`, `rate_count`, `sale_counts`, `view_counts`, `created_at`, `updated_at`) VALUES
(1, 225, 3, NULL, NULL, 1, 'software', 'Multi-layered secondary policy', 'Aut voluptas earum quae officia eveniet. Quam facilis et voluptates voluptate aliquam illo. Quo deserunt a itaque placeat. Illo voluptatem ipsam culpa quas rerum non. Et impedit ducimus culpa.\nEos et delectus et dignissimos dicta praesentium quia et. Assumenda quia sunt explicabo. Id quasi consequatur ad dolorem et omnis aperiam. Inventore nihil voluptatem voluptatem quae numquam et accusantium.', 84.00, 30, 10, NULL, 'Gigabyte', 'refurbished', '"maxime,eveniet,iusto"', '{"images":["\\/img\\/pt-default\\/66.jpg","\\/img\\/pt-default\\/124.jpg","\\/img\\/pt-default\\/2.jpg","\\/img\\/pt-default\\/187.jpg","\\/img\\/pt-default\\/90.jpg"],"weight":"63 Kg","dimensions":"10 X 2 X 20 cm","color":"blue"}', NULL, NULL, 381303890, 835308073, '2016-11-29 10:30:11', '2016-11-29 10:30:11'),
(2, 303, 3, NULL, NULL, 1, 'software', 'Programmable 4thgeneration leverage', 'Inventore sed veniam dolor quis. Corporis ratione distinctio nam omnis nihil et aspernatur. Necessitatibus nulla impedit quia totam quia sint quo. Omnis dolores numquam sunt et tempore facere natus.\nQuia quam molestiae velit aspernatur dolores odio est. Ratione et sunt in. Rerum exercitationem veniam vel consequatur dolor incidunt.', 97.00, 23, 10, NULL, 'Google. Inc', 'new', '"temporibus,voluptatibus,repudiandae"', '{"images":["\\/img\\/pt-default\\/190.jpg","\\/img\\/pt-default\\/60.jpg","\\/img\\/pt-default\\/73.jpg","\\/img\\/pt-default\\/213.jpg","\\/img\\/pt-default\\/207.jpg"],"weight":"71 Kg","dimensions":"28 X 27 X 4 mm","color":"teal"}', NULL, NULL, 632495822, 422872839, '2016-11-29 10:30:11', '2016-11-29 10:30:11'),
(3, 119, 3, NULL, NULL, 1, 'software', 'Progressive 4thgeneration info-mediaries', 'Vel eum dolorem at. Id minima est aliquid quo exercitationem.\nIn enim eos unde voluptatem necessitatibus. Non eius necessitatibus nesciunt beatae. Voluptas cum aperiam aut eum dolorem.\nReiciendis illum consequatur dolorem velit molestias. Fugiat et consequatur qui optio ipsa libero tenetur. Nihil at dolores placeat excepturi consequatur nisi et. Laboriosam deserunt quibusdam aliquam dolorum.', 98.00, 20, 10, NULL, 'Gigabyte', 'refurbished', '"explicabo,deserunt,natus"', '{"images":["\\/img\\/pt-default\\/176.jpg","\\/img\\/pt-default\\/194.jpg","\\/img\\/pt-default\\/208.jpg","\\/img\\/pt-default\\/321.jpg","\\/img\\/pt-default\\/203.jpg"],"weight":"24 Oz","dimensions":"16 X 6 X 14 inch","color":"gray"}', NULL, NULL, 753789338, 187593917, '2016-11-29 10:30:11', '2016-11-29 10:30:11'),
(4, 171, 3, NULL, NULL, 1, 'software', 'Function-based incremental flexibility', 'Sapiente inventore enim vero enim quibusdam quis voluptates. Porro consectetur eum magni dolorem odit aut laudantium. Aspernatur dolores et harum dolor qui itaque nostrum veniam. Ratione nam ea numquam voluptas et omnis. Sit doloribus doloremque aut ullam est ratione veritatis.\nReiciendis alias repellat aut non voluptas et fugit. Doloremque quia quis voluptas fugiat id. Et aut provident nihil.', 50.00, 38, 10, NULL, 'Lg', 'new', '"non,facere,id"', '{"images":["\\/img\\/pt-default\\/295.jpg","\\/img\\/pt-default\\/46.jpg","\\/img\\/pt-default\\/75.jpg","\\/img\\/pt-default\\/329.jpg","\\/img\\/pt-default\\/151.jpg"],"weight":"132 Kg","dimensions":"29 X 12 X 12 cm","color":"gray"}', NULL, NULL, 494252993, 349559430, '2016-11-29 10:30:12', '2016-11-29 10:30:12'),
(5, 165, 3, NULL, NULL, 1, 'software', 'Object-based heuristic standardization', 'Est animi non quis. Dolores itaque vitae facere voluptas dignissimos. Quam et odit vel.\nQui tempore ipsa vero dolores neque ducimus. Mollitia ducimus est necessitatibus. Illo ipsa ut praesentium est tempore.\nEsse ut debitis ut fugiat omnis fugiat. Non quia minima voluptatem dolorem at. Est sit magni rerum fuga praesentium similique ex.', 60.00, 49, 10, NULL, 'Samsung', 'refurbished', '"veniam,quis,dolor"', '{"images":["\\/img\\/pt-default\\/298.jpg","\\/img\\/pt-default\\/121.jpg","\\/img\\/pt-default\\/139.jpg","\\/img\\/pt-default\\/291.jpg","\\/img\\/pt-default\\/72.jpg"],"weight":"45 Gr","dimensions":"16 X 1 X 4 mm","color":"purple"}', NULL, NULL, 683608910, 593358444, '2016-11-29 10:30:12', '2016-11-29 10:30:12'),
(6, 224, 3, NULL, NULL, 1, 'software', 'Adaptive executive securedline', 'Architecto in facilis commodi hic maxime voluptate. Minima consectetur maxime eum iste quos aspernatur et. Dolores eius doloribus minima adipisci deserunt.\nPerspiciatis sint sed esse velit. Dolores et quod labore blanditiis. Provident vel harum dolorum iure.\nInventore accusantium omnis ea quaerat. Necessitatibus nihil quibusdam omnis odit qui. Nam voluptatem mollitia numquam in mollitia dolore facere.', 77.00, 40, 5, NULL, 'Apple', 'refurbished', '"sint,nisi,omnis"', '{"images":["\\/img\\/pt-default\\/246.jpg","\\/img\\/pt-default\\/41.jpg","\\/img\\/pt-default\\/1.jpg","\\/img\\/pt-default\\/318.jpg","\\/img\\/pt-default\\/33.jpg"],"weight":"31 Oz","dimensions":"11 X 19 X 1 inch","color":"maroon"}', NULL, NULL, 64422251, 975667615, '2016-11-29 10:30:12', '2016-11-29 10:30:12'),
(7, 167, 3, NULL, NULL, 1, 'software', 'Managed directional conglomeration', 'Nesciunt aliquam enim amet ducimus necessitatibus. Voluptas repudiandae molestias et. Cum beatae omnis earum alias in tempore.\nFugiat sunt aut modi facere delectus a. Ut sed consequatur unde aut adipisci. Optio doloremque expedita eius quibusdam. Blanditiis non ut optio alias reiciendis.\nAsperiores est est ut odit cupiditate cum eum. Sit quasi incidunt vero pariatur non. Nam ducimus iure nemo et enim repellat alias.', 53.00, 35, 5, NULL, 'Apple', 'used', '"placeat,incidunt,dolor"', '{"images":["\\/img\\/pt-default\\/199.jpg","\\/img\\/pt-default\\/216.jpg","\\/img\\/pt-default\\/158.jpg","\\/img\\/pt-default\\/139.jpg","\\/img\\/pt-default\\/106.jpg"],"weight":"134 Oz","dimensions":"16 X 16 X 15 inch","color":"yellow"}', NULL, NULL, 617743604, 395844096, '2016-11-29 10:30:12', '2016-11-29 10:30:12'),
(8, 27, 3, NULL, NULL, 1, 'software', 'Phased responsive securedline', 'Veritatis fugit nam excepturi voluptate esse officiis. Aut et facilis omnis non quo suscipit facere. Et a optio in unde vel dolores.\nNesciunt sed neque illum excepturi. Id minus hic praesentium est ea. Magni magni nobis atque distinctio quidem.\nEnim molestiae et minus delectus. Et eos saepe quisquam quae ut sequi. Odio quia quidem sint magni tempora ut voluptatum. Culpa et ea accusamus.', 14.00, 42, 15, NULL, 'Apple', 'refurbished', '"dolores,sed,totam"', '{"images":["\\/img\\/pt-default\\/198.jpg","\\/img\\/pt-default\\/293.jpg","\\/img\\/pt-default\\/69.jpg","\\/img\\/pt-default\\/213.jpg","\\/img\\/pt-default\\/72.jpg"],"weight":"74 Lb","dimensions":"5 X 3 X 2 inch","color":"teal"}', NULL, NULL, 866290758, 810243022, '2016-11-29 10:30:12', '2016-11-29 10:30:12'),
(9, 95, 3, NULL, NULL, 1, 'software', 'Reactive non-volatile leverage', 'Tempora omnis qui optio voluptatem aperiam omnis saepe. Quibusdam temporibus voluptatibus esse molestiae rerum. Est voluptatum delectus autem inventore doloribus ut. Odit et dolores et magni quaerat voluptatem neque.\nQuisquam animi eius corporis quo atque. Earum facere non nesciunt. Repellendus assumenda commodi nobis veniam sint. Eius sit quia provident sit. Quam aliquid fugit unde tenetur nisi perferendis numquam iure.', 23.00, 24, 5, NULL, 'Apple', 'used', '"sit,harum,nesciunt"', '{"images":["\\/img\\/pt-default\\/184.jpg","\\/img\\/pt-default\\/170.jpg","\\/img\\/pt-default\\/131.jpg","\\/img\\/pt-default\\/323.jpg","\\/img\\/pt-default\\/152.jpg"],"weight":"147 Oz","dimensions":"22 X 10 X 20 cm","color":"black"}', NULL, NULL, 955348674, 205736155, '2016-11-29 10:30:12', '2016-11-29 10:30:12'),
(10, 54, 3, NULL, NULL, 1, 'software', 'Mandatory nextgeneration instructionset', 'Non ut sit non iusto aut quaerat voluptate. Aliquid et ut aliquid est voluptatibus aut eius. Qui eos illum qui vitae.\nEst veritatis ad laboriosam nobis voluptatem eius. Cumque et et quia fugiat ratione. Tenetur qui culpa assumenda perspiciatis nihil enim atque.\nImpedit earum veritatis laudantium ex. Non quo molestiae sit deleniti. Sequi sed quia corrupti consequatur dignissimos voluptatem distinctio. Explicabo sed ab commodi iure asperiores dolorem qui.', 49.00, 37, 5, NULL, 'Gigabyte', 'used', '"corrupti,eos,ut"', '{"images":["\\/img\\/pt-default\\/165.jpg","\\/img\\/pt-default\\/47.jpg","\\/img\\/pt-default\\/157.jpg","\\/img\\/pt-default\\/101.jpg","\\/img\\/pt-default\\/234.jpg"],"weight":"65 Gr","dimensions":"21 X 30 X 25 inch","color":"olive"}', NULL, NULL, 104125126, 186185352, '2016-11-29 10:30:13', '2016-11-29 10:30:13'),
(11, 176, 3, NULL, NULL, 1, 'software', 'Robust background matrices', 'Officiis et sed voluptates recusandae quidem omnis. Omnis est quidem veritatis aut laborum culpa. Ut ut est natus iure provident perferendis debitis nulla.\nBeatae eaque quo aut quasi consectetur. Excepturi asperiores officiis recusandae soluta deserunt quaerat. Asperiores quibusdam voluptas harum vitae. Soluta et ut minima.', 98.00, 28, 15, NULL, 'Google. Inc', 'used', '"saepe,magnam,non"', '{"images":["\\/img\\/pt-default\\/243.jpg","\\/img\\/pt-default\\/61.jpg","\\/img\\/pt-default\\/273.jpg","\\/img\\/pt-default\\/297.jpg","\\/img\\/pt-default\\/227.jpg"],"weight":"92 Kg","dimensions":"22 X 1 X 26 cm","color":"white"}', NULL, NULL, 534867726, 774919540, '2016-11-29 10:30:13', '2016-11-29 10:30:13'),
(12, 178, 3, NULL, NULL, 1, 'software', 'Extended tertiary monitoring', 'Tenetur qui officiis aut adipisci consequatur quas quibusdam rerum. Quia culpa vitae consequatur sapiente. Quo ipsam sit sit rerum.\nMolestias maiores aperiam assumenda harum quod similique ea. Optio pariatur amet nihil error ea expedita. Nostrum id illum eos quas vitae possimus. Tenetur culpa nesciunt aperiam molestiae nam exercitationem veniam vel.', 92.00, 33, 5, NULL, 'Apple', 'refurbished', '"optio,aut,voluptas"', '{"images":["\\/img\\/pt-default\\/287.jpg","\\/img\\/pt-default\\/209.jpg","\\/img\\/pt-default\\/315.jpg","\\/img\\/pt-default\\/210.jpg","\\/img\\/pt-default\\/134.jpg"],"weight":"27 Mg","dimensions":"17 X 21 X 30 inch","color":"gray"}', NULL, NULL, 559090950, 243561933, '2016-11-29 10:30:13', '2016-11-29 10:30:13'),
(13, 32, 3, NULL, NULL, 1, 'software', 'Front-line neutral capacity', 'Ut minus tenetur est in. Et est laborum ea excepturi. Aperiam nostrum sunt architecto magni pariatur et vel alias.\nVoluptatum magnam dolor suscipit in sapiente voluptatem iure. Suscipit sit rerum dolore voluptas voluptatem harum. Sunt voluptate numquam iusto at et omnis.\nEt et omnis quo harum. Numquam expedita distinctio voluptas vero voluptatibus delectus cupiditate. Architecto voluptatem ut error qui velit voluptatum.', 81.00, 41, 15, NULL, 'Lg', 'used', '"at,velit,at"', '{"images":["\\/img\\/pt-default\\/291.jpg","\\/img\\/pt-default\\/200.jpg","\\/img\\/pt-default\\/139.jpg","\\/img\\/pt-default\\/305.jpg","\\/img\\/pt-default\\/23.jpg"],"weight":"33 Lb","dimensions":"15 X 2 X 18 cm","color":"navy"}', NULL, NULL, 819345136, 981958987, '2016-11-29 10:30:13', '2016-11-29 10:30:13'),
(14, 140, 3, NULL, NULL, 1, 'software', 'Up-sized uniform firmware', 'Corporis sit ex quia et officia eum consequatur. Sunt dolore iusto ut consequatur sunt hic. Sit mollitia facilis voluptas. Quaerat repellendus voluptates autem ipsum.\nUt consectetur ducimus reiciendis repellat recusandae non. Omnis praesentium quia eum laboriosam. Quidem et eveniet aut vero qui saepe eum.\nFuga magnam distinctio repellendus sint. Voluptates et officia omnis dolore. Dolores et sint quia tempore voluptates dolor repellat. Soluta nemo quo mollitia repudiandae minus.', 36.00, 46, 15, NULL, 'Google. Inc', 'used', '"iure,dolor,voluptatem"', '{"images":["\\/img\\/pt-default\\/162.jpg","\\/img\\/pt-default\\/124.jpg","\\/img\\/pt-default\\/246.jpg","\\/img\\/pt-default\\/300.jpg","\\/img\\/pt-default\\/8.jpg"],"weight":"99 Gr","dimensions":"26 X 21 X 8 cm","color":"blue"}', NULL, NULL, 311200164, 296448453, '2016-11-29 10:30:13', '2016-11-29 10:30:13'),
(15, 313, 3, NULL, NULL, 1, 'software', 'Re-contextualized mission-critical concept', 'Provident nulla vel laborum. Nobis debitis sint adipisci laborum dicta deleniti. In qui veniam reiciendis quam nostrum aliquam fuga.\nQuia illum temporibus explicabo deleniti doloremque. Autem quia laudantium qui quis consectetur praesentium labore rerum. Optio omnis laboriosam delectus nam voluptatem enim.\nQuia sit laborum porro impedit optio molestias aut. Repellat assumenda repudiandae adipisci sed similique. Facere quia quidem enim soluta.', 74.00, 49, 5, NULL, 'Microsoft', 'new', '"mollitia,placeat,doloremque"', '{"images":["\\/img\\/pt-default\\/278.jpg","\\/img\\/pt-default\\/59.jpg","\\/img\\/pt-default\\/65.jpg","\\/img\\/pt-default\\/241.jpg","\\/img\\/pt-default\\/162.jpg"],"weight":"20 Kg","dimensions":"30 X 14 X 24 cm","color":"olive"}', NULL, NULL, 758743132, 884784232, '2016-11-29 10:30:13', '2016-11-29 10:30:13'),
(16, 147, 3, NULL, NULL, 1, 'software', 'Exclusive maximized website', 'Minima hic iure provident nostrum. Similique voluptas eaque nostrum nostrum hic. Iusto est repellat occaecati architecto. Asperiores nihil est aut qui maiores quia id.\nNecessitatibus quisquam debitis velit sapiente qui accusamus nihil. Tenetur quam totam cumque laboriosam. At doloribus nemo quibusdam et. Dolore aut laudantium magnam est.\nDolorum debitis magnam et suscipit eum. Non consectetur occaecati sapiente error ullam. Natus ut ipsa libero placeat voluptas modi.', 85.00, 49, 10, NULL, 'Gigabyte', 'new', '"ullam,sequi,consequuntur"', '{"images":["\\/img\\/pt-default\\/14.jpg","\\/img\\/pt-default\\/19.jpg","\\/img\\/pt-default\\/160.jpg","\\/img\\/pt-default\\/9.jpg","\\/img\\/pt-default\\/233.jpg"],"weight":"110 Oz","dimensions":"4 X 30 X 6 mm","color":"green"}', NULL, NULL, 728972477, 518471478, '2016-11-29 10:30:13', '2016-11-29 10:30:13'),
(17, 195, 3, NULL, NULL, 1, 'software', 'Advanced radical synergy', 'Natus molestiae et repudiandae id soluta hic eum. Natus atque est hic quia aut error. Nostrum voluptatibus et officia excepturi eaque minus laborum.\nSint aut debitis ullam numquam quibusdam omnis ut. Molestiae nihil saepe neque et temporibus id dolore repudiandae. Maxime dolorum animi nihil enim voluptas dolor. Id et assumenda fugiat dolor exercitationem.', 21.00, 32, 10, NULL, 'Samsung', 'refurbished', '"dignissimos,consequatur,culpa"', '{"images":["\\/img\\/pt-default\\/74.jpg","\\/img\\/pt-default\\/163.jpg","\\/img\\/pt-default\\/1.jpg","\\/img\\/pt-default\\/201.jpg","\\/img\\/pt-default\\/181.jpg"],"weight":"76 Lb","dimensions":"10 X 11 X 29 mm","color":"teal"}', NULL, NULL, 293322513, 160748235, '2016-11-29 10:30:13', '2016-11-29 10:30:13'),
(18, 286, 3, NULL, NULL, 1, 'software', 'Configurable uniform forecast', 'Deserunt eius fuga odit recusandae nisi sequi. Eligendi est eum consequatur accusantium. Facere voluptas incidunt temporibus quidem recusandae. Fuga beatae in vel eos voluptas.\nNostrum quasi qui culpa expedita quisquam. Itaque delectus dolor reiciendis nobis veniam delectus pariatur.\nPossimus unde hic id unde qui dolores. Consectetur odit voluptates praesentium et in distinctio. Optio ut totam iure corporis ut vel. Dolorem dicta sunt cum a.', 18.00, 48, 5, NULL, 'Apple', 'used', '"in,exercitationem,veniam"', '{"images":["\\/img\\/pt-default\\/248.jpg","\\/img\\/pt-default\\/308.jpg","\\/img\\/pt-default\\/168.jpg","\\/img\\/pt-default\\/292.jpg","\\/img\\/pt-default\\/141.jpg"],"weight":"141 Gr","dimensions":"4 X 1 X 5 mm","color":"blue"}', NULL, NULL, 626195603, 979119068, '2016-11-29 10:30:13', '2016-11-29 10:30:13'),
(19, 311, 3, NULL, NULL, 1, 'software', 'Multi-layered clear-thinking policy', 'Omnis impedit ut eos est reiciendis. Nisi iste accusamus et et rem. Libero dolores qui labore. Eum veritatis quis ut totam.\nEt occaecati earum vel laboriosam est. Fuga ipsam nihil error et repellendus quis blanditiis. Saepe itaque dolorum sit quasi.\nVoluptatum aut vero exercitationem eligendi autem quasi. Aut ad exercitationem quod dolorem non. Et excepturi delectus iste.', 31.00, 32, 5, NULL, 'Gigabyte', 'used', '"omnis,dolorem,et"', '{"images":["\\/img\\/pt-default\\/148.jpg","\\/img\\/pt-default\\/61.jpg","\\/img\\/pt-default\\/294.jpg","\\/img\\/pt-default\\/306.jpg","\\/img\\/pt-default\\/164.jpg"],"weight":"37 Oz","dimensions":"19 X 7 X 11 mm","color":"silver"}', NULL, NULL, 609299192, 737136866, '2016-11-29 10:30:13', '2016-11-29 10:30:13'),
(20, 306, 3, NULL, NULL, 1, 'software', 'Object-based radical hardware', 'Eum rerum repudiandae provident quas sapiente doloremque numquam. Quas ad eius omnis aut mollitia quia. Sed facere vel est eum placeat.\nEos voluptatibus voluptas enim voluptas. Temporibus maxime molestiae aut nam. Cumque quia doloribus et sint. Temporibus dicta eum voluptate temporibus autem velit reprehenderit.', 43.00, 22, 10, NULL, 'Samsung', 'used', '"qui,ut,qui"', '{"images":["\\/img\\/pt-default\\/126.jpg","\\/img\\/pt-default\\/189.jpg","\\/img\\/pt-default\\/10.jpg","\\/img\\/pt-default\\/222.jpg","\\/img\\/pt-default\\/315.jpg"],"weight":"129 Lb","dimensions":"12 X 8 X 25 inch","color":"black"}', NULL, NULL, 838528981, 15283146, '2016-11-29 10:30:14', '2016-11-29 10:30:14'),
(21, 126, 3, NULL, NULL, 1, 'software', 'Synergistic holistic alliance', 'Amet sapiente dolorem temporibus eos aut. Suscipit quibusdam et molestias dignissimos sunt temporibus. A laboriosam unde exercitationem consequatur.\nOfficiis autem et provident velit. Totam ipsa perferendis necessitatibus. Non expedita earum quaerat qui modi et laboriosam.\nRerum neque eveniet ut est deleniti perspiciatis. Et nihil velit quis non. Qui eos soluta sit qui.', 82.00, 48, 10, NULL, 'Google. Inc', 'new', '"ea,itaque,dicta"', '{"images":["\\/img\\/pt-default\\/316.jpg","\\/img\\/pt-default\\/302.jpg","\\/img\\/pt-default\\/304.jpg","\\/img\\/pt-default\\/75.jpg","\\/img\\/pt-default\\/303.jpg"],"weight":"74 Kg","dimensions":"10 X 4 X 17 cm","color":"navy"}', NULL, NULL, 800781217, 441188087, '2016-11-29 10:30:14', '2016-11-29 10:30:14'),
(22, 185, 3, NULL, NULL, 1, 'software', 'Universal context-sensitive adapter', 'Ducimus quia mollitia vero aliquid ut maiores. Sapiente ut quis ullam optio.\nId vel necessitatibus vitae omnis molestias. Nemo cupiditate qui enim nobis maxime.\nConsequatur porro nihil qui iure et. Necessitatibus quos vel ex aperiam amet. Atque ut est reiciendis cupiditate in.\nAlias qui quidem qui velit minima cupiditate doloremque. Facilis laudantium rerum minus nisi dignissimos velit. Quo delectus consequatur fuga reiciendis. Unde vel occaecati dolor eum.', 53.00, 41, 10, NULL, 'Gigabyte', 'new', '"architecto,ut,ut"', '{"images":["\\/img\\/pt-default\\/44.jpg","\\/img\\/pt-default\\/310.jpg","\\/img\\/pt-default\\/293.jpg","\\/img\\/pt-default\\/138.jpg","\\/img\\/pt-default\\/118.jpg"],"weight":"74 Oz","dimensions":"20 X 22 X 8 mm","color":"black"}', NULL, NULL, 800220357, 976062175, '2016-11-29 10:30:14', '2016-11-29 10:30:14'),
(23, 10, 3, NULL, NULL, 1, 'software', 'Optional 24/7 definition', 'Dolore sed culpa eos molestias. Non minus dolorem voluptatem consequuntur quidem ut. Voluptatum dolorem id debitis saepe. Qui veniam ipsum nulla accusantium.\nAliquid nesciunt est sequi et perferendis officia. Est et molestiae cumque qui.\nNemo possimus est aut. Ut quo omnis fugit aut omnis expedita quae. Ea velit corporis ea rem occaecati. Et repellat cumque dolorum officiis laboriosam itaque.', 84.00, 22, 5, NULL, 'Google. Inc', 'refurbished', '"vero,ut,consequatur"', '{"images":["\\/img\\/pt-default\\/75.jpg","\\/img\\/pt-default\\/254.jpg","\\/img\\/pt-default\\/250.jpg","\\/img\\/pt-default\\/175.jpg","\\/img\\/pt-default\\/298.jpg"],"weight":"48 Kg","dimensions":"7 X 3 X 10 inch","color":"fuchsia"}', NULL, NULL, 808122873, 1, '2016-11-29 10:30:14', '2016-11-30 05:34:31'),
(24, 242, 3, NULL, NULL, 1, 'software', 'Re-contextualized zerodefect openarchitecture', 'Est in earum explicabo corporis blanditiis nam. Aut eum itaque qui tenetur quasi. Ut excepturi quae consequatur aut quia necessitatibus repellat. Et est qui cum.\nIncidunt nemo rerum debitis distinctio. Id accusantium sint in quidem sint a. Tenetur rerum voluptatum reprehenderit dolores provident animi. Est alias ratione eos et.\nDolor ut sequi molestiae et accusamus. Doloribus recusandae quia corrupti eveniet. Qui sint iste nostrum impedit.', 23.00, 36, 10, NULL, 'Microsoft', 'refurbished', '"numquam,quidem,soluta"', '{"images":["\\/img\\/pt-default\\/137.jpg","\\/img\\/pt-default\\/251.jpg","\\/img\\/pt-default\\/287.jpg","\\/img\\/pt-default\\/262.jpg","\\/img\\/pt-default\\/63.jpg"],"weight":"42 Gr","dimensions":"27 X 25 X 30 inch","color":"aqua"}', NULL, NULL, 816066559, 826664872, '2016-11-29 10:30:14', '2016-11-29 10:30:14'),
(25, 147, 3, NULL, NULL, 1, 'software', 'Open-source dedicated installation', 'Aliquam voluptas et pariatur. Corrupti eos deserunt et vel optio quia esse quia. Repudiandae rem beatae sed ipsa vero.\nAsperiores ipsam asperiores repudiandae. Blanditiis molestias quasi velit facilis id dolores. Aliquid magnam et qui similique voluptates impedit.\nAliquam voluptas dignissimos nulla voluptas impedit ipsa quo. In neque perferendis id ad a.\nAut velit laboriosam ipsum qui accusantium. Et eius commodi unde voluptas rem. Tempore accusantium consequatur ut temporibus saepe.', 16.00, 41, 5, NULL, 'Gigabyte', 'used', '"accusantium,commodi,asperiores"', '{"images":["\\/img\\/pt-default\\/170.jpg","\\/img\\/pt-default\\/253.jpg","\\/img\\/pt-default\\/126.jpg","\\/img\\/pt-default\\/220.jpg","\\/img\\/pt-default\\/69.jpg"],"weight":"69 Oz","dimensions":"11 X 28 X 21 mm","color":"white"}', NULL, NULL, 339206955, 946886207, '2016-11-29 10:30:14', '2016-11-29 10:30:14'),
(26, 271, 3, NULL, NULL, 1, 'software', 'Intuitive optimizing utilisation', 'Consequatur sed consequatur sed non qui vel. Placeat sed voluptas magni. Dolores at rem consequatur rerum. Sequi ipsa vel adipisci est occaecati harum ad pariatur. Odio dolorum quia officia error amet quae.\nDoloremque labore sint quod quis velit necessitatibus ipsa enim. Et sint rerum dolorum quis repellat adipisci minus. Et similique aut minus. Veniam molestias iure ea consequuntur est. Enim dignissimos facere voluptatibus.', 95.00, 42, 5, NULL, 'Samsung', 'refurbished', '"nostrum,perferendis,molestias"', '{"images":["\\/img\\/pt-default\\/190.jpg","\\/img\\/pt-default\\/118.jpg","\\/img\\/pt-default\\/270.jpg","\\/img\\/pt-default\\/112.jpg","\\/img\\/pt-default\\/283.jpg"],"weight":"97 Mg","dimensions":"28 X 11 X 4 cm","color":"black"}', NULL, NULL, 1414597, 123439013, '2016-11-29 10:30:14', '2016-11-29 10:30:14'),
(27, 224, 3, NULL, NULL, 1, 'software', 'Multi-channelled 4thgeneration data-warehouse', 'Aspernatur placeat laboriosam optio nam. Dolorum aut nisi unde quis. Ad assumenda quia quia maxime. Illo fugit sapiente ratione dolores officiis ex.\nCupiditate aliquid laborum laudantium amet. Laboriosam adipisci officia aut adipisci. Consectetur quia est consequuntur molestias. Id enim eaque qui saepe.\nUt dolore ea praesentium soluta reprehenderit. Deleniti dolorem molestias ut et iste aut. Impedit officia dignissimos et dolores quas numquam nisi labore.', 79.00, 38, 10, NULL, 'Google. Inc', 'refurbished', '"rerum,quod,odio"', '{"images":["\\/img\\/pt-default\\/321.jpg","\\/img\\/pt-default\\/176.jpg","\\/img\\/pt-default\\/178.jpg","\\/img\\/pt-default\\/110.jpg","\\/img\\/pt-default\\/188.jpg"],"weight":"102 Gr","dimensions":"30 X 24 X 8 inch","color":"white"}', NULL, NULL, 53973543, 562517045, '2016-11-29 10:30:15', '2016-11-29 10:30:15'),
(28, 169, 3, NULL, NULL, 1, 'software', 'Future-proofed encompassing moderator', 'Velit perspiciatis autem voluptatem voluptatem. Rerum qui deleniti necessitatibus et error. Voluptate eos qui sed odit praesentium cum et.\nDistinctio sit quisquam sit quae quo. Aut voluptatibus assumenda esse eos omnis dolore dolores voluptate. Porro unde ullam non beatae impedit possimus officiis.\nEst architecto in rem omnis qui est. Repellendus praesentium molestias labore. Accusamus nihil itaque temporibus ad eveniet et atque libero.', 56.00, 36, 5, NULL, 'Microsoft', 'refurbished', '"illum,tempore,nulla"', '{"images":["\\/img\\/pt-default\\/278.jpg","\\/img\\/pt-default\\/91.jpg","\\/img\\/pt-default\\/17.jpg","\\/img\\/pt-default\\/155.jpg","\\/img\\/pt-default\\/306.jpg"],"weight":"88 Kg","dimensions":"24 X 28 X 21 cm","color":"silver"}', NULL, NULL, 762493099, 976436129, '2016-11-29 10:30:15', '2016-11-29 10:30:15'),
(29, 289, 3, NULL, NULL, 1, 'software', 'Virtual local array', 'Quasi enim illum nemo quo molestiae voluptates aut. Eaque aperiam iste voluptas dolores incidunt pariatur dolores. Dolores perferendis sequi voluptatem modi expedita asperiores sit. Aut impedit eos corporis vitae fugit et quod. Pariatur modi fugit delectus nemo voluptatibus in.', 94.00, 39, 10, NULL, 'Lg', 'used', '"tempora,itaque,eius"', '{"images":["\\/img\\/pt-default\\/213.jpg","\\/img\\/pt-default\\/157.jpg","\\/img\\/pt-default\\/175.jpg","\\/img\\/pt-default\\/187.jpg","\\/img\\/pt-default\\/121.jpg"],"weight":"133 Mg","dimensions":"14 X 1 X 5 inch","color":"black"}', NULL, NULL, 183903445, 603472780, '2016-11-29 10:30:15', '2016-11-29 10:30:15'),
(30, 115, 3, NULL, NULL, 1, 'software', 'Up-sized directional standardization', 'Et voluptas rerum nisi aut voluptas. Sit aliquid ut inventore. Repellat non corporis qui et. Hic alias qui non ea ea asperiores voluptatum.\nEsse aut sapiente debitis nihil. Aut fugiat qui eum eligendi. Dignissimos unde minima illum adipisci est est.\nEos eligendi nostrum doloremque veniam molestiae dolor. Ut quae blanditiis atque ut quis debitis. Commodi ipsam aut accusantium et.', 44.00, 43, 15, NULL, 'Apple', 'refurbished', '"sed,expedita,libero"', '{"images":["\\/img\\/pt-default\\/130.jpg","\\/img\\/pt-default\\/324.jpg","\\/img\\/pt-default\\/89.jpg","\\/img\\/pt-default\\/167.jpg","\\/img\\/pt-default\\/312.jpg"],"weight":"58 Oz","dimensions":"9 X 2 X 5 mm","color":"white"}', NULL, NULL, 416833412, 742298173, '2016-11-29 10:30:15', '2016-11-29 10:30:15'),
(31, 214, 3, NULL, NULL, 1, 'software', 'Expanded mission-critical hub', 'Rem cumque molestiae possimus et saepe sit aut. Incidunt quis quia autem aut aliquam. Facere est voluptatem assumenda quisquam. Blanditiis iure eos ut vel exercitationem ipsum placeat.\nQuam voluptatem eum assumenda neque nesciunt aliquam. Eum et aut ipsum voluptatem impedit ipsum autem. Et consectetur accusamus sed quam. Est consequuntur error et et est.', 17.00, 36, 15, NULL, 'Gigabyte', 'new', '"nulla,incidunt,omnis"', '{"images":["\\/img\\/pt-default\\/265.jpg","\\/img\\/pt-default\\/169.jpg","\\/img\\/pt-default\\/221.jpg","\\/img\\/pt-default\\/240.jpg","\\/img\\/pt-default\\/245.jpg"],"weight":"62 Oz","dimensions":"24 X 17 X 30 cm","color":"gray"}', NULL, NULL, 554175087, 295807190, '2016-11-29 10:30:15', '2016-11-29 10:30:15'),
(32, 12, 3, NULL, NULL, 1, 'software', 'Programmable web-enabled interface', 'Quibusdam ipsum sunt temporibus officiis sed commodi earum. Omnis voluptas dignissimos in optio. Eius dolorum eos voluptatibus sint pariatur ipsam est. Vel dignissimos expedita dolorem placeat.\nEum sed autem exercitationem quia. Tempora deserunt voluptatem sapiente voluptatibus ut. Aut a esse a voluptatem ullam.\nNon et aut error aut omnis veniam. Exercitationem sit necessitatibus odio nihil omnis odio. Quo optio sunt sunt doloribus dicta repellendus.', 5.00, 42, 10, NULL, 'Google. Inc', 'used', '"repudiandae,qui,tenetur"', '{"images":["\\/img\\/pt-default\\/55.jpg","\\/img\\/pt-default\\/310.jpg","\\/img\\/pt-default\\/59.jpg","\\/img\\/pt-default\\/306.jpg","\\/img\\/pt-default\\/299.jpg"],"weight":"51 Oz","dimensions":"21 X 10 X 26 cm","color":"fuchsia"}', NULL, NULL, 846476730, 497979244, '2016-11-29 10:30:16', '2016-11-29 10:30:16'),
(33, 200, 3, NULL, NULL, 1, 'software', 'User-centric leadingedge conglomeration', 'Vero sit vitae non numquam minus voluptas vel. Eaque quia hic ut ut culpa. Minus voluptates blanditiis rem dicta distinctio consequatur.\nDolorem eligendi ut quos quibusdam maiores ut temporibus. Magnam accusantium ea rerum ipsam eius illum. Mollitia reprehenderit quasi iusto sapiente aut dolor. Sit quis porro sequi magnam necessitatibus ut provident.\nEst voluptatem illum quis praesentium expedita quo. Et unde harum dolor. Voluptatum et exercitationem hic aut aperiam omnis autem enim.', 99.00, 31, 10, NULL, 'Microsoft', 'refurbished', '"modi,quos,sed"', '{"images":["\\/img\\/pt-default\\/277.jpg","\\/img\\/pt-default\\/297.jpg","\\/img\\/pt-default\\/293.jpg","\\/img\\/pt-default\\/11.jpg","\\/img\\/pt-default\\/80.jpg"],"weight":"81 Oz","dimensions":"14 X 23 X 19 mm","color":"blue"}', NULL, NULL, 456599378, 784332344, '2016-11-29 10:30:16', '2016-11-29 10:30:16'),
(34, 298, 3, NULL, NULL, 1, 'software', 'Balanced static contingency', 'Ratione ea nesciunt tempora delectus facere distinctio et. Quo numquam odio nobis non natus dolor. Non vel culpa officia. Dicta alias sunt at molestiae labore praesentium unde. Voluptates quo eum sint sequi.\nPorro non eaque ut dolorem. Laudantium dolorem unde alias omnis tempora maxime. Non quo omnis sunt omnis dolorem.\nEst quas natus aut qui voluptatem repellat nemo et. Minus dolorum doloremque nobis omnis fugit maxime.', 35.00, 35, 10, NULL, 'Gigabyte', 'used', '"optio,ea,asperiores"', '{"images":["\\/img\\/pt-default\\/254.jpg","\\/img\\/pt-default\\/85.jpg","\\/img\\/pt-default\\/56.jpg","\\/img\\/pt-default\\/272.jpg","\\/img\\/pt-default\\/81.jpg"],"weight":"26 Kg","dimensions":"9 X 15 X 11 mm","color":"purple"}', NULL, NULL, 231322287, 305494900, '2016-11-29 10:30:17', '2016-11-29 10:30:17'),
(35, 82, 3, NULL, NULL, 1, 'software', 'Advanced leadingedge productivity', 'Fugit numquam veniam omnis. Voluptas quo eum consequuntur at. In et eaque fugit voluptate eos voluptate. Nesciunt non aut corporis sint reprehenderit aliquam impedit.\nQuos nostrum aut occaecati quia. Alias esse eum amet iusto corporis et fugit non. At velit nesciunt libero veritatis omnis. Et officiis recusandae ab est fugit.\nDolor quos eos ex repudiandae. Autem et qui quia iusto quam.', 1.00, 43, 15, NULL, 'Google. Inc', 'used', '"rerum,et,rem"', '{"images":["\\/img\\/pt-default\\/217.jpg","\\/img\\/pt-default\\/4.jpg","\\/img\\/pt-default\\/242.jpg","\\/img\\/pt-default\\/93.jpg","\\/img\\/pt-default\\/258.jpg"],"weight":"144 Kg","dimensions":"5 X 8 X 20 mm","color":"teal"}', NULL, NULL, 695147087, 24405578, '2016-11-29 10:30:17', '2016-11-29 10:30:17'),
(36, 246, 3, NULL, NULL, 1, 'software', 'User-friendly value-added architecture', 'Cum vitae et voluptatum magni. In quo mollitia aut quia debitis sunt iste. Perspiciatis optio inventore qui est autem qui. Quis asperiores suscipit sunt itaque reiciendis dolorem mollitia.\nVoluptas sapiente quaerat aspernatur rerum voluptatibus voluptas molestiae. Ex beatae voluptatem deserunt eos error. Aliquid animi autem error rerum et.', 53.00, 48, 10, NULL, 'Microsoft', 'used', '"quidem,inventore,quia"', '{"images":["\\/img\\/pt-default\\/282.jpg","\\/img\\/pt-default\\/263.jpg","\\/img\\/pt-default\\/18.jpg","\\/img\\/pt-default\\/185.jpg","\\/img\\/pt-default\\/262.jpg"],"weight":"61 Oz","dimensions":"24 X 16 X 9 inch","color":"fuchsia"}', NULL, NULL, 952744854, 929668806, '2016-11-29 10:30:17', '2016-11-29 10:30:17'),
(37, 75, 3, NULL, NULL, 1, 'software', 'Reactive client-driven superstructure', 'Aspernatur aliquam amet error ipsum quisquam incidunt vero. Et mollitia vel porro ducimus labore voluptas. Quas animi repellendus voluptas perspiciatis. Reprehenderit in iusto deleniti corrupti. Autem distinctio consequatur nostrum velit veniam voluptatem.\nMolestiae modi sapiente optio aut. At et soluta nisi.\nLaboriosam sapiente laborum consequatur. Explicabo veniam veniam doloremque quibusdam. Neque laborum nobis beatae cum.', 4.00, 30, 5, NULL, 'Microsoft', 'used', '"delectus,sed,voluptas"', '{"images":["\\/img\\/pt-default\\/225.jpg","\\/img\\/pt-default\\/215.jpg","\\/img\\/pt-default\\/232.jpg","\\/img\\/pt-default\\/303.jpg","\\/img\\/pt-default\\/291.jpg"],"weight":"73 Kg","dimensions":"14 X 12 X 1 cm","color":"blue"}', NULL, NULL, 442158043, 19941813, '2016-11-29 10:30:17', '2016-11-29 10:30:17'),
(38, 168, 3, NULL, NULL, 1, 'software', 'Innovative client-driven synergy', 'Doloremque vel atque inventore. Veniam recusandae et earum deserunt culpa sed. Asperiores impedit voluptatum vel asperiores id. Commodi iure deleniti nam aut aut consequatur.\nMinus delectus est ducimus in. Ea non assumenda facilis laborum. Ea rerum ex omnis non culpa.\nNam dolorem molestiae aperiam vitae iure quos. At facere in placeat qui facere in. Minima distinctio beatae ducimus.\nQuas rerum exercitationem ipsum dignissimos molestiae nisi nihil. Maxime sed ut quae.', 56.00, 46, 5, NULL, 'Samsung', 'used', '"aspernatur,et,eum"', '{"images":["\\/img\\/pt-default\\/34.jpg","\\/img\\/pt-default\\/304.jpg","\\/img\\/pt-default\\/82.jpg","\\/img\\/pt-default\\/161.jpg","\\/img\\/pt-default\\/309.jpg"],"weight":"91 Kg","dimensions":"3 X 7 X 28 inch","color":"yellow"}', NULL, NULL, 131080837, 838164419, '2016-11-29 10:30:18', '2016-11-29 10:30:18'),
(39, 60, 3, NULL, NULL, 1, 'software', 'Devolved dynamic database', 'Distinctio aut veniam molestiae aperiam. Ipsum sint itaque sapiente amet voluptatem. Aliquam aspernatur modi fugiat aliquam.\nOfficia sint et enim qui error. Ea quia facilis necessitatibus amet. Tenetur tempore qui autem repellendus nemo.\nLabore eum deleniti qui odit animi. Sapiente aut pariatur pariatur dolor aliquid molestias repudiandae ut. Repellendus voluptas repudiandae autem odit laboriosam.', 43.00, 20, 15, NULL, 'Microsoft', 'new', '"impedit,qui,sit"', '{"images":["\\/img\\/pt-default\\/161.jpg","\\/img\\/pt-default\\/87.jpg","\\/img\\/pt-default\\/116.jpg","\\/img\\/pt-default\\/168.jpg","\\/img\\/pt-default\\/259.jpg"],"weight":"19 Gr","dimensions":"5 X 19 X 19 inch","color":"blue"}', NULL, NULL, 222662794, 881133133, '2016-11-29 10:30:18', '2016-11-29 10:30:18'),
(40, 281, 3, NULL, NULL, 1, 'software', 'Virtual intangible knowledgebase', 'Expedita natus possimus eius similique ea cum. Fuga odio velit ullam. Quidem non quibusdam in sunt vel iste aliquid.\nMolestiae molestias omnis dolor. Eaque rerum nemo quia qui assumenda. Saepe id aliquid sit. Eos laborum repellendus et facere. Ducimus dolorem sit iste.\nIste est quidem cupiditate sed. Est reprehenderit dolor vero a eum. Eveniet mollitia veritatis consequuntur recusandae id aut omnis excepturi.', 74.00, 34, 10, NULL, 'Google. Inc', 'refurbished', '"omnis,aut,eum"', '{"images":["\\/img\\/pt-default\\/295.jpg","\\/img\\/pt-default\\/29.jpg","\\/img\\/pt-default\\/213.jpg","\\/img\\/pt-default\\/237.jpg","\\/img\\/pt-default\\/175.jpg"],"weight":"65 Kg","dimensions":"13 X 1 X 23 cm","color":"purple"}', NULL, NULL, 1692656, 602601944, '2016-11-29 10:30:18', '2016-11-29 10:30:18'),
(41, 18, 3, NULL, NULL, 1, 'software', 'Right-sized attitude-oriented leverage', 'Ullam neque praesentium vel vitae. Occaecati ea quisquam alias molestiae quis eius quasi. Blanditiis rerum ratione et quasi ut voluptas. Illo minus sit qui voluptatibus dolor consequatur exercitationem. Officia nobis voluptatem voluptatem dolorem.\nTotam eligendi voluptatem fuga perspiciatis sit. Dolorem voluptas minus quaerat non optio. Quam aut rerum enim ea autem.', 28.00, 43, 10, NULL, 'Samsung', 'refurbished', '"aut,aut,facilis"', '{"images":["\\/img\\/pt-default\\/35.jpg","\\/img\\/pt-default\\/236.jpg","\\/img\\/pt-default\\/59.jpg","\\/img\\/pt-default\\/274.jpg","\\/img\\/pt-default\\/146.jpg"],"weight":"20 Mg","dimensions":"23 X 27 X 26 inch","color":"black"}', NULL, NULL, 659073083, 568383231, '2016-11-29 10:30:18', '2016-11-29 10:30:18'),
(42, 191, 3, NULL, NULL, 1, 'software', 'Realigned national capacity', 'In amet earum facere id. Tenetur ea qui quis expedita sit velit culpa. Architecto vel consectetur reiciendis. Temporibus ducimus sunt optio est.\nUnde cupiditate nihil maiores in architecto quia dolor. Alias corporis in magni dolores incidunt est. Qui eum alias dolore illum voluptate aliquid omnis.', 96.00, 26, 15, NULL, 'Lg', 'used', '"magnam,tempore,sed"', '{"images":["\\/img\\/pt-default\\/155.jpg","\\/img\\/pt-default\\/26.jpg","\\/img\\/pt-default\\/185.jpg","\\/img\\/pt-default\\/109.jpg","\\/img\\/pt-default\\/28.jpg"],"weight":"78 Oz","dimensions":"17 X 5 X 10 mm","color":"yellow"}', NULL, NULL, 628109081, 27521176, '2016-11-29 10:30:19', '2016-11-29 10:30:19'),
(43, 218, 3, NULL, NULL, 1, 'software', 'Reverse-engineered local function', 'Nisi rerum qui officia vel aut enim. Ex nihil assumenda consequatur sed tempore. Doloribus non molestias ipsa iste nobis aut. Dolor aut quas optio debitis.\nUt sed aut et adipisci et accusamus. Sit sit tempore consequatur blanditiis voluptatem aut. Est quidem et aut corrupti voluptas quae possimus. Molestiae soluta mollitia facere qui.\nDicta sapiente est quidem voluptatem est occaecati. Voluptas fugiat iste esse dolorum reprehenderit. Aut velit maiores sequi impedit a eveniet repellat.', 37.00, 34, 5, NULL, 'Samsung', 'new', '"quo,reiciendis,placeat"', '{"images":["\\/img\\/pt-default\\/107.jpg","\\/img\\/pt-default\\/298.jpg","\\/img\\/pt-default\\/267.jpg","\\/img\\/pt-default\\/272.jpg","\\/img\\/pt-default\\/32.jpg"],"weight":"140 Oz","dimensions":"9 X 12 X 6 cm","color":"blue"}', NULL, NULL, 344382915, 290508305, '2016-11-29 10:30:19', '2016-11-29 10:30:19'),
(44, 82, 3, NULL, NULL, 1, 'software', 'Optimized attitude-oriented collaboration', 'Est molestias quia laudantium quis. Ut consequatur dolor sed commodi voluptate. Consequatur nesciunt ex odio ut magni in. Atque ut ducimus facere velit laudantium ut. Veritatis sunt sequi deleniti magni at corrupti a.\nQuos alias accusantium soluta molestiae. Facere aut eius rerum sint adipisci cumque. Expedita quia vero id quia corrupti tenetur.', 51.00, 41, 15, NULL, 'Google. Inc', 'refurbished', '"accusamus,quod,expedita"', '{"images":["\\/img\\/pt-default\\/68.jpg","\\/img\\/pt-default\\/231.jpg","\\/img\\/pt-default\\/29.jpg","\\/img\\/pt-default\\/111.jpg","\\/img\\/pt-default\\/196.jpg"],"weight":"16 Kg","dimensions":"28 X 8 X 26 inch","color":"maroon"}', NULL, NULL, 62012836, 316798358, '2016-11-29 10:30:20', '2016-11-29 10:30:20'),
(45, 58, 3, NULL, NULL, 1, 'software', 'Digitized secondary budgetarymanagement', 'Nulla alias ea aperiam voluptatum aut. Provident praesentium tempore doloribus quo quisquam quis et. Tempore minima debitis earum autem nemo.\nSapiente qui ullam delectus distinctio. Atque vel corporis qui voluptatem velit et. Magnam quo rerum qui doloribus quidem reprehenderit eius. Et natus eum quo optio voluptates dolorum omnis officiis.\nSit in est ut quae magni quia. Ipsa voluptatum et aut et. Accusantium eos ea nihil dolores facere eveniet.', 99.00, 32, 15, NULL, 'Gigabyte', 'refurbished', '"itaque,soluta,quasi"', '{"images":["\\/img\\/pt-default\\/292.jpg","\\/img\\/pt-default\\/147.jpg","\\/img\\/pt-default\\/295.jpg","\\/img\\/pt-default\\/152.jpg","\\/img\\/pt-default\\/154.jpg"],"weight":"78 Mg","dimensions":"12 X 4 X 14 inch","color":"blue"}', NULL, NULL, 453327598, 391076235, '2016-11-29 10:30:20', '2016-11-29 10:30:20'),
(46, 127, 3, NULL, NULL, 1, 'software', 'Reduced grid-enabled GraphicalUserInterface', 'Porro et tenetur consequuntur. Quis laudantium ut quos in consectetur nam. Et accusamus porro tempora cum similique distinctio recusandae.\nOmnis veritatis quia commodi odit et. Dolore quibusdam quia ut voluptatem quia laborum hic. Fugiat fugit error est fugiat vero quae delectus. Porro repellendus natus distinctio qui numquam ratione incidunt.\nNon sed necessitatibus minima voluptatum. Aut commodi laborum explicabo nesciunt veritatis officia. Non in velit voluptate ut quia voluptates.', 89.00, 33, 5, NULL, 'Lg', 'new', '"consequatur,ad,placeat"', '{"images":["\\/img\\/pt-default\\/49.jpg","\\/img\\/pt-default\\/296.jpg","\\/img\\/pt-default\\/114.jpg","\\/img\\/pt-default\\/326.jpg","\\/img\\/pt-default\\/274.jpg"],"weight":"50 Kg","dimensions":"12 X 19 X 30 mm","color":"olive"}', NULL, NULL, 545238646, 529808533, '2016-11-29 10:30:21', '2016-11-29 10:30:21'),
(47, 321, 3, NULL, NULL, 1, 'software', 'Up-sized grid-enabled function', 'Dolores non et est velit aut omnis iure. Occaecati voluptate exercitationem omnis reiciendis consequuntur sed dolor. Quis eius reprehenderit aut repellat officia unde dolorem.\nPossimus at fugiat sunt porro sit. Nemo dolorem debitis doloremque dolores laudantium libero. Ut deleniti itaque quia aliquid.', 72.00, 26, 5, NULL, 'Samsung', 'new', '"libero,corporis,autem"', '{"images":["\\/img\\/pt-default\\/219.jpg","\\/img\\/pt-default\\/201.jpg","\\/img\\/pt-default\\/141.jpg","\\/img\\/pt-default\\/132.jpg","\\/img\\/pt-default\\/325.jpg"],"weight":"67 Lb","dimensions":"29 X 3 X 9 mm","color":"green"}', NULL, NULL, 97673191, 591597446, '2016-11-29 10:30:21', '2016-11-29 10:30:21'),
(48, 175, 3, NULL, NULL, 1, 'software', 'Multi-channelled reciprocal moratorium', 'Totam sapiente et provident nulla provident dolorem et eum. Temporibus sed occaecati similique eveniet qui est id. Perspiciatis magnam non officia occaecati.\nAssumenda rerum ut rerum vitae. Deserunt animi qui ut nihil. Mollitia quae voluptatum deleniti nobis sapiente.\nOptio aspernatur voluptas eveniet voluptatem reiciendis et non. Maxime deleniti quaerat repellendus at consequatur. Molestiae sunt quia libero. Consectetur doloremque eveniet dignissimos quis laborum nihil.', 76.00, 47, 10, NULL, 'Gigabyte', 'new', '"architecto,quo,quis"', '{"images":["\\/img\\/pt-default\\/66.jpg","\\/img\\/pt-default\\/6.jpg","\\/img\\/pt-default\\/5.jpg","\\/img\\/pt-default\\/24.jpg","\\/img\\/pt-default\\/76.jpg"],"weight":"132 Lb","dimensions":"16 X 2 X 22 mm","color":"blue"}', NULL, NULL, 262696329, 615701395, '2016-11-29 10:30:21', '2016-11-29 10:30:21'),
(49, 216, 3, NULL, NULL, 1, 'software', 'Visionary client-driven GraphicalUserInterface', 'Quo nihil iure quia et deleniti. Ea voluptas corrupti et id. Est ut pariatur maxime et earum eum.\nAutem cumque voluptatibus doloremque quaerat. Omnis omnis nemo a quod ut non at nostrum. Veniam et saepe nostrum eaque. Debitis dolorem qui sint.\nTempora recusandae vel esse cupiditate repellat pariatur voluptatem. Itaque voluptatem nostrum sed quia sed esse. Veritatis pariatur in quis.', 44.00, 46, 5, NULL, 'Microsoft', 'used', '"eos,explicabo,unde"', '{"images":["\\/img\\/pt-default\\/176.jpg","\\/img\\/pt-default\\/80.jpg","\\/img\\/pt-default\\/140.jpg","\\/img\\/pt-default\\/55.jpg","\\/img\\/pt-default\\/264.jpg"],"weight":"126 Mg","dimensions":"2 X 13 X 16 inch","color":"silver"}', NULL, NULL, 873878981, 360346789, '2016-11-29 10:30:22', '2016-11-29 10:30:22'),
(50, 238, 3, NULL, NULL, 1, 'software', 'Enhanced coherent strategy', 'Quia perferendis corrupti eligendi earum facere aspernatur. Aut et voluptatem facere voluptas. Aspernatur aspernatur libero rerum.\nIure aut quia aut aut expedita repellat ducimus. Alias illum magni ex nostrum velit. Vero sapiente enim blanditiis officia qui hic.\nEx necessitatibus fugit nobis reiciendis. Qui possimus ut veritatis fugit. Architecto soluta illum repellendus eveniet a sunt magni est. Ipsum libero soluta veniam. Velit natus quis ut et.', 6.00, 37, 15, NULL, 'Microsoft', 'refurbished', '"voluptatibus,iure,reprehenderit"', '{"images":["\\/img\\/pt-default\\/2.jpg","\\/img\\/pt-default\\/299.jpg","\\/img\\/pt-default\\/4.jpg","\\/img\\/pt-default\\/94.jpg","\\/img\\/pt-default\\/29.jpg"],"weight":"21 Kg","dimensions":"30 X 22 X 26 inch","color":"black"}', NULL, NULL, 904311389, 530279737, '2016-11-29 10:30:22', '2016-11-29 10:30:22'),
(51, 232, 3, NULL, NULL, 1, 'software', 'Upgradable exuding utilisation', 'Tempore tempora fugit aut enim excepturi placeat animi. Non impedit dicta possimus. Quae et quia id consequatur debitis. Repellendus nulla ut nostrum vitae ipsam. Quis consectetur sit harum rerum.\nDolorum provident nihil impedit nesciunt. Est aliquid quas blanditiis ut et. Quia incidunt eius molestiae libero nihil nam necessitatibus voluptatem.\nHarum et inventore enim dicta dolorem odio nemo. Accusamus tempora alias iste et voluptates. Aspernatur impedit est eos.', 1.00, 35, 10, NULL, 'Gigabyte', 'new', '"delectus,natus,consequatur"', '{"images":["\\/img\\/pt-default\\/326.jpg","\\/img\\/pt-default\\/228.jpg","\\/img\\/pt-default\\/87.jpg","\\/img\\/pt-default\\/70.jpg","\\/img\\/pt-default\\/71.jpg"],"weight":"130 Lb","dimensions":"19 X 27 X 2 cm","color":"black"}', NULL, NULL, 880011422, 236670213, '2016-11-29 10:30:22', '2016-11-29 10:30:22'),
(52, 310, 3, NULL, NULL, 1, 'software', 'Automated discrete migration', 'Dicta quidem dolorem aut magni rerum. Qui est neque impedit et ad est ullam. Quis consequatur perspiciatis veniam ab esse voluptas qui.\nRerum quia et eveniet dolor. Odio placeat similique odio. Vel a et ab culpa quibusdam expedita labore. Voluptatem consequuntur voluptatibus et sed.\nCorporis optio in eaque. Earum culpa quo aspernatur sint praesentium illum consequuntur excepturi.', 53.00, 31, 15, NULL, 'Gigabyte', 'used', '"assumenda,corrupti,fugit"', '{"images":["\\/img\\/pt-default\\/179.jpg","\\/img\\/pt-default\\/89.jpg","\\/img\\/pt-default\\/289.jpg","\\/img\\/pt-default\\/146.jpg","\\/img\\/pt-default\\/19.jpg"],"weight":"16 Kg","dimensions":"1 X 1 X 16 mm","color":"fuchsia"}', NULL, NULL, 687663977, 506545815, '2016-11-29 10:30:22', '2016-11-29 10:30:22'),
(53, 14, 3, NULL, NULL, 1, 'software', 'Visionary tangible time-frame', 'Quia suscipit voluptates quibusdam natus. Sit corrupti harum et. Porro sint quaerat laudantium ea non eligendi labore sint. Ex dolor quibusdam velit provident voluptatum unde totam.\nSimilique qui occaecati tenetur eius non voluptatem id. Enim possimus et doloremque nostrum aliquid aperiam quod. Ducimus officiis non porro.\nTempora sint fuga eum omnis voluptatibus eum eveniet nihil. Et ut eos veniam quia dolorem ducimus. Illo odit rem consequatur corporis dolorem ut.', 65.00, 34, 15, NULL, 'Samsung', 'new', '"quasi,eveniet,autem"', '{"images":["\\/img\\/pt-default\\/238.jpg","\\/img\\/pt-default\\/218.jpg","\\/img\\/pt-default\\/257.jpg","\\/img\\/pt-default\\/322.jpg","\\/img\\/pt-default\\/323.jpg"],"weight":"147 Mg","dimensions":"14 X 13 X 3 inch","color":"green"}', NULL, NULL, 960245269, 811033162, '2016-11-29 10:30:22', '2016-11-29 10:30:22'),
(54, 47, 3, NULL, NULL, 1, 'software', 'Organized impactful openarchitecture', 'Et est delectus enim. Rerum hic eum cumque molestiae fugiat distinctio et in. Qui similique optio commodi laborum nihil. Eius incidunt quasi esse tenetur.\nAliquid ut placeat qui voluptas molestias quibusdam praesentium deserunt. Commodi sint et exercitationem deleniti qui a nulla. Vitae aliquid odio rerum est. Nihil eum quidem et distinctio. Voluptas odio vel autem ut soluta.', 60.00, 31, 5, NULL, 'Gigabyte', 'new', '"ipsum,molestiae,doloremque"', '{"images":["\\/img\\/pt-default\\/68.jpg","\\/img\\/pt-default\\/225.jpg","\\/img\\/pt-default\\/186.jpg","\\/img\\/pt-default\\/123.jpg","\\/img\\/pt-default\\/301.jpg"],"weight":"82 Lb","dimensions":"23 X 21 X 4 inch","color":"white"}', NULL, NULL, 457765022, 257046228, '2016-11-29 10:30:22', '2016-11-29 10:30:22'),
(55, 117, 3, NULL, NULL, 1, 'software', 'Self-enabling client-server implementation', 'Expedita et quisquam et quibusdam labore dolor laboriosam. Tenetur quidem earum ipsam fugit molestiae. Illum ea quae assumenda facere in doloribus.\nQuae quia velit in. Sit est quasi sit sint. Dolor et enim similique asperiores incidunt. Pariatur quam dolor sequi eum ipsam eveniet facere.\nEt laboriosam et nostrum excepturi est. Impedit aut aliquam at. Minima et deleniti qui possimus ipsum provident est.', 87.00, 43, 15, NULL, 'Samsung', 'new', '"ab,ullam,qui"', '{"images":["\\/img\\/pt-default\\/50.jpg","\\/img\\/pt-default\\/100.jpg","\\/img\\/pt-default\\/24.jpg","\\/img\\/pt-default\\/6.jpg","\\/img\\/pt-default\\/69.jpg"],"weight":"21 Lb","dimensions":"30 X 19 X 20 inch","color":"purple"}', NULL, NULL, 427955443, 294024603, '2016-11-29 10:30:22', '2016-11-29 10:30:22'),
(56, 85, 3, NULL, NULL, 1, 'software', 'Expanded explicit securedline', 'Dolorem a autem fugiat deserunt. Ut aut voluptatum voluptas. Omnis sint dolor impedit reprehenderit sequi. Incidunt fuga voluptates quia qui alias.\nSit optio sed veniam labore. Voluptas est quam incidunt aut et. Autem pariatur dolore fuga asperiores dolor. Est perspiciatis quos quibusdam incidunt.\nDignissimos consequatur qui saepe voluptate expedita corrupti. Sapiente et vero eligendi dicta totam hic. Culpa et vero ad totam.', 36.00, 49, 15, NULL, 'Lg', 'new', '"natus,consectetur,vero"', '{"images":["\\/img\\/pt-default\\/264.jpg","\\/img\\/pt-default\\/284.jpg","\\/img\\/pt-default\\/286.jpg","\\/img\\/pt-default\\/238.jpg","\\/img\\/pt-default\\/154.jpg"],"weight":"86 Kg","dimensions":"8 X 3 X 27 cm","color":"blue"}', NULL, NULL, 868806976, 721860655, '2016-11-29 10:30:22', '2016-11-29 10:30:22');
INSERT INTO `products` (`id`, `category_id`, `user_id`, `parent_id`, `products_group`, `status`, `type`, `name`, `description`, `price`, `stock`, `low_stock`, `bar_code`, `brand`, `condition`, `tags`, `features`, `rate_val`, `rate_count`, `sale_counts`, `view_counts`, `created_at`, `updated_at`) VALUES
(57, 299, 3, NULL, NULL, 1, 'software', 'Assimilated fresh-thinking superstructure', 'Sed eligendi ut dolores voluptas rerum. Sit similique ipsa tempora est omnis qui quidem tempora. Tenetur incidunt debitis et dolores rerum qui.\nConsequatur nulla dolor perspiciatis aperiam. Quos in doloremque quas. Et rerum aperiam eligendi animi aut. Accusantium rerum maiores earum omnis est autem deserunt.\nEst nobis sunt sed doloremque. Rerum aut soluta excepturi consequuntur.', 16.00, 23, 5, NULL, 'Samsung', 'used', '"molestiae,esse,qui"', '{"images":["\\/img\\/pt-default\\/272.jpg","\\/img\\/pt-default\\/329.jpg","\\/img\\/pt-default\\/267.jpg","\\/img\\/pt-default\\/2.jpg","\\/img\\/pt-default\\/324.jpg"],"weight":"22 Oz","dimensions":"3 X 28 X 13 inch","color":"fuchsia"}', NULL, NULL, 285048621, 418071117, '2016-11-29 10:30:23', '2016-11-29 10:30:23'),
(58, 112, 3, NULL, NULL, 1, 'software', 'Up-sized incremental internetsolution', 'Reprehenderit ducimus deserunt nihil eaque. Earum pariatur sed voluptas maxime ad vitae et unde. Architecto qui voluptas tenetur et distinctio. Eos ex et commodi illum maiores.\nNumquam consequatur repellat accusantium officia incidunt natus ex. Rem id quam autem voluptatem non sed enim provident. Voluptatem quis numquam in iusto. Voluptatem qui sit et dolores consequuntur repellendus.', 65.00, 22, 15, NULL, 'Gigabyte', 'new', '"fugit,amet,voluptatibus"', '{"images":["\\/img\\/pt-default\\/106.jpg","\\/img\\/pt-default\\/120.jpg","\\/img\\/pt-default\\/152.jpg","\\/img\\/pt-default\\/202.jpg","\\/img\\/pt-default\\/171.jpg"],"weight":"115 Mg","dimensions":"23 X 1 X 7 cm","color":"olive"}', NULL, NULL, 570788964, 686433494, '2016-11-29 10:30:23', '2016-11-29 10:30:23'),
(59, 148, 3, NULL, NULL, 1, 'software', 'Intuitive 6thgeneration migration', 'Libero voluptatum omnis et similique consequuntur. Aperiam natus aut quaerat ut.\nUt atque deleniti beatae doloremque aperiam nostrum. Debitis quasi praesentium ut numquam laborum. Architecto blanditiis nostrum in in. Dolorum et magni impedit et.\nEst dolore ab sit adipisci atque. Sint enim debitis debitis ea ad. Consequatur hic tenetur molestiae nesciunt iste dolore.\nVoluptas reiciendis voluptatum quibusdam vitae. Ab quam in in sunt veritatis. Sequi culpa cumque et aliquid.', 95.00, 30, 15, NULL, 'Gigabyte', 'refurbished', '"alias,ut,sed"', '{"images":["\\/img\\/pt-default\\/199.jpg","\\/img\\/pt-default\\/159.jpg","\\/img\\/pt-default\\/312.jpg","\\/img\\/pt-default\\/200.jpg","\\/img\\/pt-default\\/209.jpg"],"weight":"29 Kg","dimensions":"19 X 10 X 20 inch","color":"blue"}', NULL, NULL, 435663345, 326279507, '2016-11-29 10:30:23', '2016-11-29 10:30:23'),
(60, 74, 3, NULL, NULL, 1, 'software', 'Versatile analyzing pricingstructure', 'Minima et nesciunt ut et. Quisquam qui dicta delectus et.\nTotam consequatur neque dolorum magnam eius placeat. Fugiat distinctio sed unde sunt consectetur.\nDoloribus vel impedit ratione. Est eum enim quia in quia. Qui sequi est in velit et.\nReprehenderit dignissimos et enim praesentium quia rerum accusantium. Voluptate ex est non ipsum.', 93.00, 25, 15, NULL, 'Lg', 'used', '"quis,ullam,dolores"', '{"images":["\\/img\\/pt-default\\/144.jpg","\\/img\\/pt-default\\/202.jpg","\\/img\\/pt-default\\/143.jpg","\\/img\\/pt-default\\/29.jpg","\\/img\\/pt-default\\/201.jpg"],"weight":"14 Gr","dimensions":"27 X 6 X 21 inch","color":"yellow"}', NULL, NULL, 547481557, 418384223, '2016-11-29 10:30:23', '2016-11-29 10:30:23'),
(61, 94, 3, NULL, NULL, 1, 'software', 'Programmable needs-based frame', 'Qui doloremque sapiente natus excepturi quam nesciunt placeat reprehenderit. Suscipit et consequatur voluptatem minima. Tempora tempora laudantium impedit in. Officia quo velit delectus fuga.\nDolorum corrupti et deleniti tenetur incidunt. Non accusantium quia nostrum tempore molestiae. Quae eligendi perspiciatis nihil est qui nam praesentium. Et ut veniam velit suscipit.', 71.00, 41, 5, NULL, 'Lg', 'used', '"nostrum,voluptatem,quos"', '{"images":["\\/img\\/pt-default\\/290.jpg","\\/img\\/pt-default\\/233.jpg","\\/img\\/pt-default\\/172.jpg","\\/img\\/pt-default\\/294.jpg","\\/img\\/pt-default\\/141.jpg"],"weight":"46 Gr","dimensions":"12 X 19 X 24 cm","color":"white"}', NULL, NULL, 614140696, 364552290, '2016-11-29 10:30:23', '2016-11-29 10:30:23'),
(62, 253, 3, NULL, NULL, 1, 'software', 'Horizontal optimizing capacity', 'Qui voluptatum quia quo deleniti id. At tempora minima non corporis necessitatibus eligendi. Qui qui maiores animi quia dolorem.\nMinus quasi molestiae iusto ex. Praesentium enim minus a at. Aut consequatur voluptas maiores corporis optio.\nConsequatur quae velit in in eligendi amet. Modi omnis atque ut ex. Laudantium culpa animi exercitationem repellendus.\nLabore temporibus dignissimos aperiam et omnis modi vel aliquam. Porro non ullam eligendi consequatur sunt in ducimus nostrum.', 10.00, 26, 15, NULL, 'Google. Inc', 'refurbished', '"quis,et,dolorem"', '{"images":["\\/img\\/pt-default\\/224.jpg","\\/img\\/pt-default\\/145.jpg","\\/img\\/pt-default\\/227.jpg","\\/img\\/pt-default\\/92.jpg","\\/img\\/pt-default\\/156.jpg"],"weight":"139 Oz","dimensions":"8 X 16 X 3 inch","color":"aqua"}', NULL, NULL, 226200042, 363051607, '2016-11-29 10:30:24', '2016-11-29 10:30:24'),
(63, 132, 3, NULL, NULL, 1, 'software', 'Function-based context-sensitive hub', 'Enim autem in atque. Minus sed ipsam eligendi minima. Sed sunt dolorem dolores saepe est magni et. Inventore repellendus nesciunt numquam commodi architecto ad.\nQuas illum unde quia dicta autem consequatur ut. Eum voluptatem sunt quisquam rerum dolorum laboriosam. Aut alias tenetur eum adipisci.\nArchitecto corporis voluptatibus aut corporis natus sit. Aut perferendis alias cum perspiciatis numquam ipsa vel. Ut et blanditiis dolorem voluptate.', 4.00, 48, 15, NULL, 'Microsoft', 'used', '"quisquam,et,accusamus"', '{"images":["\\/img\\/pt-default\\/271.jpg","\\/img\\/pt-default\\/215.jpg","\\/img\\/pt-default\\/209.jpg","\\/img\\/pt-default\\/287.jpg","\\/img\\/pt-default\\/81.jpg"],"weight":"79 Oz","dimensions":"12 X 7 X 14 cm","color":"yellow"}', NULL, NULL, 479083852, 670002339, '2016-11-29 10:30:24', '2016-11-29 10:30:24'),
(64, 260, 3, NULL, NULL, 1, 'software', 'Realigned discrete synergy', 'Enim in aut quod qui quo sed reprehenderit facere. Pariatur asperiores amet accusamus vero ea qui dolor. Doloribus totam aut aut doloremque.\nEt quis cumque voluptas fuga fugit. Ut placeat accusamus repellendus nisi dicta modi at. Quaerat aut pariatur omnis repellat magnam reprehenderit. Dignissimos reiciendis ut rerum veniam ex saepe.', 71.00, 45, 5, NULL, 'Apple', 'used', '"qui,aut,autem"', '{"images":["\\/img\\/pt-default\\/100.jpg","\\/img\\/pt-default\\/33.jpg","\\/img\\/pt-default\\/87.jpg","\\/img\\/pt-default\\/298.jpg","\\/img\\/pt-default\\/295.jpg"],"weight":"147 Lb","dimensions":"16 X 1 X 7 cm","color":"navy"}', NULL, NULL, 484722062, 725309615, '2016-11-29 10:30:24', '2016-11-29 10:30:24'),
(65, 194, 3, NULL, NULL, 1, 'software', 'Down-sized methodical product', 'Ea commodi accusantium qui in vitae. Quaerat occaecati aut et est. Laborum velit culpa voluptatem eos sint. Quod voluptatum voluptatem non.\nVero libero aut omnis atque suscipit occaecati. Saepe accusamus blanditiis sit. Cupiditate qui nisi odit mollitia amet cupiditate.\nSit voluptas voluptatum dolore quis nostrum. Fuga magnam et iure quibusdam possimus quam. Eum sunt accusamus ut incidunt excepturi. Sint aut dolorem eos dicta reiciendis nesciunt earum. Est quia aspernatur atque ut.', 12.00, 26, 5, NULL, 'Lg', 'refurbished', '"magnam,minus,vero"', '{"images":["\\/img\\/pt-default\\/291.jpg","\\/img\\/pt-default\\/169.jpg","\\/img\\/pt-default\\/65.jpg","\\/img\\/pt-default\\/211.jpg","\\/img\\/pt-default\\/27.jpg"],"weight":"121 Kg","dimensions":"26 X 29 X 16 cm","color":"silver"}', NULL, NULL, 654822401, 436554991, '2016-11-29 10:30:24', '2016-11-29 10:30:24'),
(66, 15, 3, NULL, NULL, 1, 'software', 'Business-focused scalable implementation', 'Ut mollitia eum consequatur quae qui consequatur. Minus earum nihil iste vitae voluptatem voluptatem. Et quis cupiditate esse dolore rerum dolorum minus. Et nihil dicta deserunt a quia repellat id. Numquam saepe et vel consequatur non.\nOptio recusandae quos sapiente commodi. Inventore sint quasi nesciunt sit eos voluptas. Deleniti aut et ratione cum quos in incidunt. Eos autem veritatis modi.', 60.00, 33, 5, NULL, 'Microsoft', 'refurbished', '"similique,qui,officiis"', '{"images":["\\/img\\/pt-default\\/109.jpg","\\/img\\/pt-default\\/80.jpg","\\/img\\/pt-default\\/228.jpg","\\/img\\/pt-default\\/330.jpg","\\/img\\/pt-default\\/103.jpg"],"weight":"68 Kg","dimensions":"24 X 11 X 1 cm","color":"green"}', NULL, NULL, 737849658, 384057608, '2016-11-29 10:30:24', '2016-11-29 10:30:24'),
(67, 115, 3, NULL, NULL, 1, 'software', 'Networked zerotolerance infrastructure', 'Nihil et sit et nihil illo illo perferendis. Officia neque laborum ipsam et ex facere voluptatem enim. Iusto inventore molestiae odit quidem ut. Perspiciatis eligendi non tenetur nostrum aut temporibus aut.\nDebitis at voluptas id. Commodi dolor sit ad quia. Dolore laborum sed repudiandae sit quia est fugiat. Consequatur voluptas ipsam aut.\nAut porro sed velit eaque nemo culpa expedita. Laudantium nulla non aut pariatur inventore repellat. Enim delectus sed sit adipisci sequi qui.', 46.00, 30, 10, NULL, 'Apple', 'new', '"sit,tenetur,eveniet"', '{"images":["\\/img\\/pt-default\\/128.jpg","\\/img\\/pt-default\\/137.jpg","\\/img\\/pt-default\\/71.jpg","\\/img\\/pt-default\\/156.jpg","\\/img\\/pt-default\\/142.jpg"],"weight":"114 Lb","dimensions":"24 X 18 X 10 inch","color":"black"}', NULL, NULL, 368882359, 456016020, '2016-11-29 10:30:24', '2016-11-29 10:30:24'),
(68, 228, 3, NULL, NULL, 1, 'software', 'Down-sized 5thgeneration parallelism', 'Dolores iure qui voluptatum dolorem quam. Ad accusamus quisquam voluptas in est. Ea aut voluptatem dolorum tempora qui. Deleniti expedita quas dicta harum odit corrupti qui. Voluptatibus vel quis eaque et ea cum.\nQuae et reiciendis enim. Doloribus omnis consequatur cupiditate quos. Vero rerum laborum voluptatem quia beatae.\nRecusandae tenetur est aliquam delectus. Aperiam vel itaque earum omnis tempore neque omnis. Expedita et quae pariatur asperiores.', 85.00, 29, 15, NULL, 'Microsoft', 'used', '"laudantium,voluptatem,ut"', '{"images":["\\/img\\/pt-default\\/97.jpg","\\/img\\/pt-default\\/47.jpg","\\/img\\/pt-default\\/133.jpg","\\/img\\/pt-default\\/300.jpg","\\/img\\/pt-default\\/270.jpg"],"weight":"28 Gr","dimensions":"27 X 21 X 13 mm","color":"fuchsia"}', NULL, NULL, 179791877, 679708105, '2016-11-29 10:30:24', '2016-11-29 10:30:24'),
(69, 38, 3, NULL, NULL, 1, 'software', 'Operative upward-trending synergy', 'Et et distinctio a vel laudantium. Sed tempore perferendis rerum voluptatem vero possimus est eum. Blanditiis odit id qui consequatur quisquam nisi. Perspiciatis aut aut distinctio ut et suscipit. Nulla totam qui voluptas unde dolore eum.\nLaboriosam facilis est beatae delectus. Aliquid maxime ab adipisci maiores aut est et. Qui ullam consequatur rerum qui aperiam distinctio quae. Sit cum aliquid ducimus sunt vel.', 98.00, 41, 10, NULL, 'Google. Inc', 'used', '"beatae,voluptatem,maiores"', '{"images":["\\/img\\/pt-default\\/288.jpg","\\/img\\/pt-default\\/77.jpg","\\/img\\/pt-default\\/194.jpg","\\/img\\/pt-default\\/13.jpg","\\/img\\/pt-default\\/131.jpg"],"weight":"61 Gr","dimensions":"7 X 27 X 6 inch","color":"navy"}', NULL, NULL, 895665604, 300396442, '2016-11-29 10:30:25', '2016-11-29 10:30:25'),
(70, 164, 3, NULL, NULL, 1, 'software', 'Operative secondary archive', 'Libero magni temporibus aut. Qui nihil facilis placeat illo. Cum dolore qui voluptatibus non. Doloremque sit accusantium omnis repellendus laboriosam repellat.\nDeserunt veniam provident iusto facilis perferendis ut et. Labore quae est repellat non dolores et.\nNon sequi tempora odio. Totam velit accusantium voluptas nam et voluptatum voluptatem. Expedita corporis tempora animi corporis eveniet et ratione.', 48.00, 33, 5, NULL, 'Microsoft', 'used', '"commodi,nihil,adipisci"', '{"images":["\\/img\\/pt-default\\/106.jpg","\\/img\\/pt-default\\/140.jpg","\\/img\\/pt-default\\/207.jpg","\\/img\\/pt-default\\/25.jpg","\\/img\\/pt-default\\/316.jpg"],"weight":"53 Kg","dimensions":"4 X 6 X 15 mm","color":"black"}', NULL, NULL, 811428871, 102160214, '2016-11-29 10:30:25', '2016-11-29 10:30:25'),
(71, 17, 3, NULL, NULL, 1, 'software', 'Ergonomic transitional structure', 'Tempora ratione voluptatem aut ullam ratione reiciendis dolor error. Ea corporis illum quam sed tempore reprehenderit. Maiores consequatur est est quos cupiditate sint atque qui.\nRepellendus et omnis quos perferendis vel. At impedit consequatur ex corporis. Suscipit architecto deleniti eius sed quod optio.', 45.00, 31, 15, NULL, 'Google. Inc', 'new', '"ipsum,a,et"', '{"images":["\\/img\\/pt-default\\/103.jpg","\\/img\\/pt-default\\/62.jpg","\\/img\\/pt-default\\/250.jpg","\\/img\\/pt-default\\/206.jpg","\\/img\\/pt-default\\/103.jpg"],"weight":"15 Gr","dimensions":"23 X 4 X 8 inch","color":"olive"}', NULL, NULL, 45067779, 463180013, '2016-11-29 10:30:25', '2016-11-29 10:30:25'),
(72, 45, 3, NULL, NULL, 1, 'software', 'Robust 24/7 utilisation', 'Tenetur ut eius tempore occaecati voluptatem possimus. Labore dolore neque atque est dolorem est. Recusandae aut exercitationem quae.\nSit veniam reiciendis et molestiae molestiae. Tenetur sit omnis voluptatibus aut voluptatem. Dolorum est voluptates ut facere corporis non quidem autem. Ad ab sint vitae et reiciendis.', 65.00, 28, 15, NULL, 'Apple', 'new', '"sequi,recusandae,quidem"', '{"images":["\\/img\\/pt-default\\/253.jpg","\\/img\\/pt-default\\/25.jpg","\\/img\\/pt-default\\/131.jpg","\\/img\\/pt-default\\/204.jpg","\\/img\\/pt-default\\/208.jpg"],"weight":"45 Kg","dimensions":"14 X 25 X 17 inch","color":"maroon"}', NULL, NULL, 57582721, 675587523, '2016-11-29 10:30:25', '2016-11-29 10:30:25'),
(73, 105, 3, NULL, NULL, 1, 'software', 'Front-line actuating parallelism', 'Dolorem est error quia accusantium. Laudantium ut et magni architecto odio dolorem qui.\nPerspiciatis provident quidem provident illo culpa eaque. Facilis explicabo quis quia quia. Temporibus ex ad dignissimos quibusdam quisquam.\nEligendi consequatur et enim officiis autem. Laboriosam ut molestiae quaerat officia. Ut consequatur voluptates laudantium. Ut magnam repellendus laboriosam sequi quasi.', 17.00, 27, 10, NULL, 'Samsung', 'new', '"a,optio,veritatis"', '{"images":["\\/img\\/pt-default\\/259.jpg","\\/img\\/pt-default\\/154.jpg","\\/img\\/pt-default\\/124.jpg","\\/img\\/pt-default\\/153.jpg","\\/img\\/pt-default\\/53.jpg"],"weight":"109 Kg","dimensions":"7 X 20 X 6 cm","color":"lime"}', NULL, NULL, 586155776, 1, '2016-11-29 10:30:25', '2016-11-30 05:34:21'),
(74, 18, 3, NULL, NULL, 1, 'software', 'Pre-emptive dedicated opensystem', 'Ratione reiciendis dolor aperiam dolores sit cum. Quia odit blanditiis hic officiis inventore hic. Sint quia architecto laboriosam sunt. Possimus et quo inventore consequuntur nihil delectus.\nOfficia aliquid ut qui nemo a amet. Qui consequatur unde quos excepturi. Delectus est ullam quae sapiente. Quisquam molestias maxime ut numquam quis iste reiciendis est.', 96.00, 36, 10, NULL, 'Apple', 'new', '"soluta,non,aut"', '{"images":["\\/img\\/pt-default\\/58.jpg","\\/img\\/pt-default\\/281.jpg","\\/img\\/pt-default\\/179.jpg","\\/img\\/pt-default\\/96.jpg","\\/img\\/pt-default\\/250.jpg"],"weight":"124 Gr","dimensions":"11 X 21 X 15 cm","color":"silver"}', NULL, NULL, 150236002, 596728126, '2016-11-29 10:30:25', '2016-11-29 10:30:25'),
(75, 98, 3, NULL, NULL, 1, 'software', 'Persevering national localareanetwork', 'At quis nam et. Voluptatem est et est beatae libero repellendus. Iure vel et explicabo.\nExpedita earum porro molestias animi rerum labore mollitia. Ad aut sed nihil eos autem facilis. Modi officia eligendi ut et quisquam. Enim voluptas magnam facilis officia fugiat et et.\nEx quasi eos quia occaecati. Labore quas maiores expedita iure. Cum aut doloribus culpa placeat numquam. Laudantium sit earum corrupti.', 16.00, 39, 5, NULL, 'Gigabyte', 'used', '"aliquam,sint,animi"', '{"images":["\\/img\\/pt-default\\/84.jpg","\\/img\\/pt-default\\/289.jpg","\\/img\\/pt-default\\/14.jpg","\\/img\\/pt-default\\/318.jpg","\\/img\\/pt-default\\/287.jpg"],"weight":"139 Kg","dimensions":"30 X 24 X 3 cm","color":"yellow"}', NULL, NULL, 749237664, 1, '2016-11-29 10:30:25', '2016-11-30 05:31:37'),
(76, 249, 3, NULL, NULL, 1, 'software', 'Horizontal assymetric success', 'Accusantium et cupiditate magnam cum possimus. In quaerat commodi atque eos. Incidunt qui maxime odit eum repellendus. Id eius pariatur eum vel architecto dicta.\nFugit doloremque nihil molestiae totam vel delectus eligendi. Quia rem quisquam a ut. Placeat ut officia nihil aspernatur vel. Distinctio laudantium est qui mollitia atque perspiciatis. Nostrum dolores aliquam earum.', 6.00, 44, 5, NULL, 'Google. Inc', 'new', '"quaerat,quo,necessitatibus"', '{"images":["\\/img\\/pt-default\\/241.jpg","\\/img\\/pt-default\\/56.jpg","\\/img\\/pt-default\\/47.jpg","\\/img\\/pt-default\\/291.jpg","\\/img\\/pt-default\\/162.jpg"],"weight":"84 Kg","dimensions":"21 X 10 X 6 mm","color":"navy"}', NULL, NULL, 686099958, 311485132, '2016-11-29 10:30:25', '2016-11-29 10:30:25'),
(77, 92, 3, NULL, NULL, 1, 'software', 'Sharable systemic info-mediaries', 'Sequi nobis architecto numquam dolor consequatur nulla et. Minima iusto tempora et aut dolore culpa. Beatae ea fuga ut dolores repudiandae omnis doloremque ut.\nQui corporis sed ut aliquid recusandae ut voluptas voluptatibus. Explicabo debitis adipisci reprehenderit et voluptas et dolor laborum.\nNemo iusto iste asperiores sit officiis magni possimus. Eligendi non quo beatae doloremque eligendi ipsa. Quia aut adipisci ducimus amet et voluptatem. Quia ad et ad vel voluptatem.', 35.00, 29, 10, NULL, 'Samsung', 'new', '"dolore,dolore,nulla"', '{"images":["\\/img\\/pt-default\\/86.jpg","\\/img\\/pt-default\\/224.jpg","\\/img\\/pt-default\\/47.jpg","\\/img\\/pt-default\\/203.jpg","\\/img\\/pt-default\\/75.jpg"],"weight":"47 Gr","dimensions":"14 X 18 X 28 cm","color":"lime"}', NULL, NULL, 47807806, 590558888, '2016-11-29 10:30:26', '2016-11-29 10:30:26'),
(78, 202, 3, NULL, NULL, 1, 'software', 'Networked context-sensitive task-force', 'Consequatur facere quia minima non qui. Delectus ad sit quos sit. Eos et et dolor sunt quisquam doloremque reiciendis.\nUllam et nihil possimus architecto et. Ad quisquam voluptatem fugiat impedit autem doloremque. Est asperiores tempora unde. Eligendi aut nisi unde consequatur asperiores ipsam omnis.\nMolestiae ut id est. Est sit tenetur rerum eveniet placeat blanditiis. Eaque architecto ipsum reprehenderit iste et nihil repellat.', 21.00, 31, 15, NULL, 'Microsoft', 'new', '"voluptatem,et,nesciunt"', '{"images":["\\/img\\/pt-default\\/83.jpg","\\/img\\/pt-default\\/145.jpg","\\/img\\/pt-default\\/230.jpg","\\/img\\/pt-default\\/294.jpg","\\/img\\/pt-default\\/323.jpg"],"weight":"97 Gr","dimensions":"9 X 24 X 28 mm","color":"maroon"}', NULL, NULL, 92885051, 501759026, '2016-11-29 10:30:26', '2016-11-29 10:30:26'),
(79, 233, 3, NULL, NULL, 1, 'software', 'Quality-focused zerodefect neural-net', 'Adipisci ab vel voluptatum voluptas. Accusantium rem quidem eius nobis eum quae. Sunt ea adipisci exercitationem omnis explicabo voluptatem. Aliquam omnis sit quos consequatur.\nDistinctio aut quo beatae ut sunt neque officia. Doloremque laudantium earum animi molestiae. Eveniet harum perferendis recusandae a tempora ut. In non dolores maiores.\nQuisquam quae doloribus rerum voluptatibus sunt illum. Aspernatur voluptas autem vel aperiam harum. Quis sit rerum distinctio magnam vitae assumenda.', 32.00, 26, 15, NULL, 'Samsung', 'used', '"quis,et,velit"', '{"images":["\\/img\\/pt-default\\/90.jpg","\\/img\\/pt-default\\/226.jpg","\\/img\\/pt-default\\/224.jpg","\\/img\\/pt-default\\/110.jpg","\\/img\\/pt-default\\/74.jpg"],"weight":"31 Lb","dimensions":"26 X 11 X 5 cm","color":"blue"}', NULL, NULL, 58043134, 645803420, '2016-11-29 10:30:26', '2016-11-29 10:30:26'),
(80, 12, 3, NULL, NULL, 1, 'software', 'Organized 3rdgeneration orchestration', 'Rerum adipisci odit autem omnis sit iusto. Quia dolorum non eius neque autem quam. Architecto assumenda eos deleniti voluptatibus nihil commodi.\nEst et sequi nisi animi. Laudantium nemo est et quis sed perspiciatis qui.\nEius vitae atque recusandae rerum suscipit. Est quibusdam unde debitis aut consequatur tenetur non qui. Autem voluptatem sit et quis. Laudantium voluptates pariatur laboriosam et.', 11.00, 33, 15, NULL, 'Google. Inc', 'used', '"porro,autem,dolor"', '{"images":["\\/img\\/pt-default\\/59.jpg","\\/img\\/pt-default\\/25.jpg","\\/img\\/pt-default\\/192.jpg","\\/img\\/pt-default\\/38.jpg","\\/img\\/pt-default\\/36.jpg"],"weight":"104 Gr","dimensions":"8 X 8 X 28 mm","color":"aqua"}', NULL, NULL, 993606043, 141682165, '2016-11-29 10:30:26', '2016-11-29 10:30:26'),
(81, 131, 3, NULL, NULL, 1, 'software', 'Profound local neural-net', 'Id at dolores omnis ut eum illo. Sequi nam quo consequatur expedita dolorum non omnis autem. Sit et numquam expedita velit rerum assumenda. Consequatur est dolorum soluta dolores. Itaque aspernatur harum eum delectus incidunt explicabo veniam.\nCulpa voluptatem ab fugit illum veritatis. Aut totam dolores esse veritatis aliquid eos repellat. Quaerat sit impedit at aut quia reprehenderit cum. Commodi autem qui modi eligendi fuga et qui.', 64.00, 46, 15, NULL, 'Lg', 'new', '"quae,corrupti,dignissimos"', '{"images":["\\/img\\/pt-default\\/132.jpg","\\/img\\/pt-default\\/40.jpg","\\/img\\/pt-default\\/71.jpg","\\/img\\/pt-default\\/205.jpg","\\/img\\/pt-default\\/278.jpg"],"weight":"14 Oz","dimensions":"17 X 19 X 3 mm","color":"green"}', NULL, NULL, 147597741, 450044145, '2016-11-29 10:30:26', '2016-11-29 10:30:26'),
(82, 14, 3, NULL, NULL, 1, 'software', 'Front-line responsive knowledgeuser', 'Sint at velit qui voluptatem quibusdam possimus minus ut. Fugit iste adipisci nihil nihil distinctio veniam. Vel ullam necessitatibus ea culpa consequatur rem consequatur.\nOccaecati consequatur aperiam optio in voluptates suscipit voluptatum. Numquam similique repellendus nostrum iure labore velit. Voluptatibus corrupti deleniti aperiam quam. Aut voluptate similique consequatur mollitia asperiores a.', 6.00, 21, 15, NULL, 'Gigabyte', 'new', '"sunt,ut,aliquam"', '{"images":["\\/img\\/pt-default\\/218.jpg","\\/img\\/pt-default\\/214.jpg","\\/img\\/pt-default\\/52.jpg","\\/img\\/pt-default\\/40.jpg","\\/img\\/pt-default\\/267.jpg"],"weight":"129 Lb","dimensions":"7 X 23 X 13 mm","color":"lime"}', NULL, NULL, 457313759, 637003632, '2016-11-29 10:30:26', '2016-11-29 10:30:26'),
(83, 8, 3, NULL, NULL, 1, 'software', 'Managed full-range complexity', 'Molestias asperiores aut ipsa repellendus sint quod. Sed velit sint quia quos magni deleniti quia id. Eum sunt a consectetur ea fugit fuga.\nOfficia et voluptatem nam ad. Amet occaecati suscipit quasi quia ut ut ex. Nisi omnis rerum et et expedita.\nMinus aut dolore delectus non quibusdam in. Cum qui quae dicta vero. Aut error perspiciatis blanditiis maxime doloremque.', 70.00, 42, 5, NULL, 'Samsung', 'refurbished', '"nulla,quo,dolor"', '{"images":["\\/img\\/pt-default\\/32.jpg","\\/img\\/pt-default\\/330.jpg","\\/img\\/pt-default\\/59.jpg","\\/img\\/pt-default\\/20.jpg","\\/img\\/pt-default\\/217.jpg"],"weight":"78 Mg","dimensions":"30 X 14 X 13 cm","color":"lime"}', NULL, NULL, 64901547, 475513766, '2016-11-29 10:30:26', '2016-11-29 10:30:26'),
(84, 52, 3, NULL, NULL, 1, 'software', 'Decentralized exuding monitoring', 'Atque ut eius et dolore quas provident. Et eligendi nostrum veniam blanditiis dolorem. Quia ullam ut est iste et omnis.\nQui quas voluptatum perspiciatis aut officia nihil. Et voluptates vitae tenetur hic et. Repellat dolore eveniet ipsa voluptates nam voluptate. Fuga est sequi expedita aliquam quibusdam.\nVoluptas itaque est aut aut reprehenderit. Voluptate ipsa qui fugit voluptatibus rerum minima voluptatem. Velit reprehenderit ratione inventore nam.', 24.00, 49, 10, NULL, 'Samsung', 'used', '"rerum,perferendis,minima"', '{"images":["\\/img\\/pt-default\\/314.jpg","\\/img\\/pt-default\\/249.jpg","\\/img\\/pt-default\\/297.jpg","\\/img\\/pt-default\\/170.jpg","\\/img\\/pt-default\\/145.jpg"],"weight":"30 Gr","dimensions":"5 X 6 X 15 cm","color":"navy"}', NULL, NULL, 803836737, 778144632, '2016-11-29 10:30:27', '2016-11-29 10:30:27'),
(85, 109, 3, NULL, NULL, 1, 'software', 'Intuitive 24hour circuit', 'Unde autem praesentium dicta esse eos. Provident sint et sequi illo. Magnam ratione necessitatibus facilis eveniet. Quod ut perferendis modi odio aut repellendus.\nCulpa quia aut odio deserunt. Quis eos rerum nihil quia corrupti sit veniam. Et ipsam et molestiae quia.\nIllum culpa officia non sint. Dolorem iure est ut eius doloremque. Fugiat non et recusandae dolores libero.\nMaxime et velit assumenda voluptatibus voluptatum ipsa ipsum. Et nihil voluptatem et quia.', 63.00, 41, 10, NULL, 'Gigabyte', 'used', '"quae,molestiae,eum"', '{"images":["\\/img\\/pt-default\\/309.jpg","\\/img\\/pt-default\\/123.jpg","\\/img\\/pt-default\\/257.jpg","\\/img\\/pt-default\\/50.jpg","\\/img\\/pt-default\\/276.jpg"],"weight":"125 Oz","dimensions":"1 X 16 X 25 mm","color":"navy"}', NULL, NULL, 6140444, 661184184, '2016-11-29 10:30:27', '2016-11-29 10:30:27'),
(86, 31, 3, NULL, NULL, 1, 'software', 'Secured intermediate paradigm', 'Omnis laborum ipsa non sit aliquid et ex. Voluptatem blanditiis quam placeat.\nEa voluptate dolor nulla vel minima nulla ea. Debitis dolor quia odit minus iure sunt est rerum. Amet similique suscipit quas occaecati animi saepe soluta. Omnis sequi sed itaque.\nQuia sequi sit ut perspiciatis delectus sit animi. Delectus dolorum minus commodi perspiciatis. Laboriosam molestias quod provident similique rerum sed. Quae voluptatem culpa quibusdam quisquam aliquid inventore nisi.', 69.00, 22, 10, NULL, 'Apple', 'refurbished', '"quo,ipsum,nobis"', '{"images":["\\/img\\/pt-default\\/43.jpg","\\/img\\/pt-default\\/190.jpg","\\/img\\/pt-default\\/267.jpg","\\/img\\/pt-default\\/285.jpg","\\/img\\/pt-default\\/19.jpg"],"weight":"46 Oz","dimensions":"17 X 13 X 11 inch","color":"lime"}', NULL, NULL, 144379397, 331693854, '2016-11-29 10:30:27', '2016-11-29 10:30:27'),
(87, 22, 3, NULL, NULL, 1, 'software', 'Multi-lateral user-facing extranet', 'Asperiores provident veritatis aspernatur consequuntur quia cumque voluptates. Quia numquam earum sit voluptatem aut aut. Similique quam placeat veritatis ut voluptatibus architecto dolorem. Voluptatem sed in quia ut sed blanditiis aut.\nProvident quia ea enim voluptas reprehenderit ipsam. Ab et voluptas pariatur labore ducimus aspernatur sint. Pariatur quibusdam aperiam aut corrupti ad. Odit dolorem commodi repellat esse.', 42.00, 30, 5, NULL, 'Microsoft', 'used', '"illum,est,consequatur"', '{"images":["\\/img\\/pt-default\\/189.jpg","\\/img\\/pt-default\\/122.jpg","\\/img\\/pt-default\\/266.jpg","\\/img\\/pt-default\\/20.jpg","\\/img\\/pt-default\\/17.jpg"],"weight":"42 Oz","dimensions":"16 X 9 X 24 mm","color":"teal"}', NULL, NULL, 588294181, 487640415, '2016-11-29 10:30:27', '2016-11-29 10:30:27'),
(88, 99, 3, NULL, NULL, 1, 'software', 'Open-source multi-state securedline', 'Iure doloribus assumenda natus sunt vero voluptate. Maiores maiores magnam voluptatum ut dolorem et officia et. Perspiciatis ullam aliquid non debitis. Dolor et et est necessitatibus excepturi. Fuga doloremque explicabo voluptatem temporibus.\nEius et eum dolores in et fuga numquam. Voluptatem et error sunt quod voluptatem magnam. Id nam sunt non nihil dolores iure voluptatibus. Quia laboriosam sit alias dolor.', 22.00, 29, 10, NULL, 'Google. Inc', 'refurbished', '"suscipit,voluptatem,reiciendis"', '{"images":["\\/img\\/pt-default\\/63.jpg","\\/img\\/pt-default\\/47.jpg","\\/img\\/pt-default\\/261.jpg","\\/img\\/pt-default\\/313.jpg","\\/img\\/pt-default\\/240.jpg"],"weight":"80 Mg","dimensions":"18 X 20 X 28 mm","color":"blue"}', NULL, NULL, 625404625, 385043022, '2016-11-29 10:30:27', '2016-11-29 10:30:27'),
(89, 293, 3, NULL, NULL, 1, 'software', 'Polarised holistic application', 'Voluptates et quis pariatur et repellat aut consequatur voluptatibus. Explicabo impedit ullam ad laboriosam assumenda. Illo dolores omnis sunt ab ullam distinctio ad.\nSit id esse qui corrupti earum qui delectus. Tenetur ullam et deleniti voluptatum distinctio placeat omnis enim. Dolores et nostrum a est quam rerum sit est. Id esse nihil officia dolor minus.\nEt qui id nulla non voluptatem dolores et. Id et earum officia exercitationem libero. Ex nihil placeat facere ea nihil est.', 77.00, 43, 15, NULL, 'Microsoft', 'used', '"quod,delectus,est"', '{"images":["\\/img\\/pt-default\\/63.jpg","\\/img\\/pt-default\\/85.jpg","\\/img\\/pt-default\\/276.jpg","\\/img\\/pt-default\\/131.jpg","\\/img\\/pt-default\\/20.jpg"],"weight":"72 Oz","dimensions":"11 X 9 X 22 cm","color":"yellow"}', NULL, NULL, 750571078, 196491905, '2016-11-29 10:30:27', '2016-11-29 10:30:27'),
(90, 81, 3, NULL, NULL, 1, 'software', 'Switchable didactic focusgroup', 'Aut quo eum veniam molestiae aliquid. Amet id ab qui. Eaque distinctio perferendis sunt ullam. Hic tenetur ut vel ab odit.\nTempore ut maiores praesentium voluptatum et dolorem. Explicabo dolores doloremque est cumque nesciunt molestias. Suscipit aut voluptatem dolorem repellat sapiente.\nTemporibus minima velit inventore optio. Deserunt et corporis consequatur deleniti voluptatibus. Non est hic mollitia doloremque est quae.', 41.00, 37, 10, NULL, 'Samsung', 'new', '"maxime,quas,ullam"', '{"images":["\\/img\\/pt-default\\/175.jpg","\\/img\\/pt-default\\/213.jpg","\\/img\\/pt-default\\/54.jpg","\\/img\\/pt-default\\/290.jpg","\\/img\\/pt-default\\/214.jpg"],"weight":"145 Mg","dimensions":"6 X 2 X 24 mm","color":"green"}', NULL, NULL, 325221762, 640014909, '2016-11-29 10:30:27', '2016-11-29 10:30:27'),
(91, 1, 3, NULL, NULL, 1, 'software', 'Centralized grid-enabled moratorium', 'Iure dolores nihil maiores tempora. Exercitationem quae amet quia sunt quas omnis repellendus occaecati. Non non eaque sed magnam.\nOfficia omnis molestiae natus dolor temporibus facere. Similique et aut sit. Aliquid distinctio illo laboriosam amet esse non dolorem. Reprehenderit aut debitis veniam corrupti quia sapiente.\nHarum voluptatem ea natus voluptas laudantium dolor. Nemo iusto adipisci rerum consequatur error. Veniam deserunt autem cumque debitis. Quia qui et a minima possimus sed.', 25.00, 46, 15, NULL, 'Apple', 'new', '"eveniet,iusto,vel"', '{"images":["\\/img\\/pt-default\\/103.jpg","\\/img\\/pt-default\\/163.jpg","\\/img\\/pt-default\\/188.jpg","\\/img\\/pt-default\\/129.jpg","\\/img\\/pt-default\\/158.jpg"],"weight":"89 Kg","dimensions":"15 X 5 X 27 mm","color":"green"}', NULL, NULL, 21342425, 723988549, '2016-11-29 10:30:27', '2016-11-29 10:30:27'),
(92, 217, 3, NULL, NULL, 1, 'software', 'Horizontal encompassing support', 'Unde deleniti ipsa quidem alias ut vel voluptatem. Distinctio est consequatur in eaque iusto eum. Dolores voluptate non quia beatae voluptas quis dolor est.\nEarum libero quisquam et voluptatem repellendus. At voluptatem in consequatur eos. Cum velit qui vitae consequuntur. Repudiandae magnam voluptate ea qui magni.\nSed qui aspernatur ipsam nemo dolor enim. Minima dolorem voluptas in necessitatibus ad velit. Et minus asperiores ullam quibusdam perspiciatis.', 9.00, 23, 5, NULL, 'Microsoft', 'used', '"id,saepe,accusantium"', '{"images":["\\/img\\/pt-default\\/211.jpg","\\/img\\/pt-default\\/129.jpg","\\/img\\/pt-default\\/196.jpg","\\/img\\/pt-default\\/313.jpg","\\/img\\/pt-default\\/145.jpg"],"weight":"147 Mg","dimensions":"13 X 12 X 14 mm","color":"maroon"}', NULL, NULL, 890842177, 123208521, '2016-11-29 10:30:27', '2016-11-29 10:30:27'),
(93, 294, 3, NULL, NULL, 1, 'software', 'Networked discrete paradigm', 'Qui voluptatibus est quod exercitationem quidem blanditiis. Pariatur vel et corporis sit voluptatem nisi sunt rerum. Quos vel quia iure velit doloremque. Laudantium sunt quos vitae ut maxime occaecati id.\nVoluptatem qui consequatur deleniti ducimus. Quo facere quia perferendis voluptatum non quod quia. Cumque voluptatum dolores culpa possimus id dolor.', 98.00, 30, 15, NULL, 'Lg', 'used', '"non,autem,qui"', '{"images":["\\/img\\/pt-default\\/211.jpg","\\/img\\/pt-default\\/165.jpg","\\/img\\/pt-default\\/76.jpg","\\/img\\/pt-default\\/151.jpg","\\/img\\/pt-default\\/258.jpg"],"weight":"86 Mg","dimensions":"9 X 26 X 27 mm","color":"fuchsia"}', NULL, NULL, 468337328, 170509316, '2016-11-29 10:30:28', '2016-11-29 10:30:28'),
(94, 91, 3, NULL, NULL, 1, 'software', 'Programmable fresh-thinking hierarchy', 'Sint perferendis molestiae quia enim repudiandae. Distinctio at nisi qui quis magni.\nIncidunt beatae asperiores cupiditate quaerat. Eius eos eos quisquam quae recusandae.\nVoluptatem est porro reiciendis eos quisquam impedit quas. Nobis iusto modi impedit error non sed. Sint vel ut natus minus architecto. Rerum culpa ducimus ratione cum.', 72.00, 29, 5, NULL, 'Gigabyte', 'used', '"atque,totam,excepturi"', '{"images":["\\/img\\/pt-default\\/269.jpg","\\/img\\/pt-default\\/229.jpg","\\/img\\/pt-default\\/291.jpg","\\/img\\/pt-default\\/123.jpg","\\/img\\/pt-default\\/266.jpg"],"weight":"44 Mg","dimensions":"29 X 14 X 4 mm","color":"aqua"}', NULL, NULL, 690433555, 640657467, '2016-11-29 10:30:28', '2016-11-29 10:30:28'),
(95, 277, 3, NULL, NULL, 1, 'software', 'Fundamental client-server hardware', 'A animi quia nobis voluptatibus earum aut ipsa. Dolor dolores eius recusandae sint voluptates. Rem fugiat consequuntur vel vel.\nNumquam voluptatem voluptas est molestias neque. Facilis quisquam dolorem ut sit assumenda architecto possimus earum. Omnis saepe libero eveniet quos tenetur excepturi.\nNatus inventore totam odio est. Fugiat blanditiis tenetur voluptas similique est. Debitis ex reiciendis ipsum sit minus. Et consequatur sunt eaque et itaque.', 90.00, 48, 10, NULL, 'Apple', 'used', '"omnis,voluptates,fugit"', '{"images":["\\/img\\/pt-default\\/239.jpg","\\/img\\/pt-default\\/246.jpg","\\/img\\/pt-default\\/205.jpg","\\/img\\/pt-default\\/249.jpg","\\/img\\/pt-default\\/270.jpg"],"weight":"34 Mg","dimensions":"13 X 10 X 5 inch","color":"maroon"}', NULL, NULL, 641661647, 704408684, '2016-11-29 10:30:28', '2016-11-29 10:30:28'),
(96, 140, 3, NULL, NULL, 1, 'software', 'User-centric leadingedge middleware', 'Suscipit ut laboriosam voluptatum ut. Omnis aliquam distinctio rerum exercitationem mollitia dolorem. Quasi ad molestias blanditiis.\nFacere vitae qui vel dolorem et facere quae minima. Et et ut et quo voluptas. Possimus rerum et eos. Quaerat illum dolor pariatur nesciunt repellendus esse eaque qui.\nQui quia eaque accusamus illum quibusdam quibusdam. Facilis ut incidunt ipsa alias repellat praesentium repellendus. Quos sint eveniet culpa neque error quia in.', 34.00, 42, 15, NULL, 'Gigabyte', 'refurbished', '"voluptas,et,ea"', '{"images":["\\/img\\/pt-default\\/13.jpg","\\/img\\/pt-default\\/190.jpg","\\/img\\/pt-default\\/117.jpg","\\/img\\/pt-default\\/149.jpg","\\/img\\/pt-default\\/319.jpg"],"weight":"89 Gr","dimensions":"9 X 18 X 20 inch","color":"olive"}', NULL, NULL, 70070297, 472577210, '2016-11-29 10:30:28', '2016-11-29 10:30:28'),
(97, 203, 3, NULL, NULL, 1, 'software', 'Visionary cohesive framework', 'Ea et aut illo. Voluptatem sed laborum error culpa sint. Explicabo recusandae quo molestiae sapiente. Natus consequuntur praesentium voluptatem reiciendis.\nMinus sit architecto molestiae assumenda qui et est. Deleniti ad fugiat sed quos nostrum aliquam quaerat. Debitis qui id id doloribus suscipit unde numquam ab.\nCum omnis pariatur in eius. Sint consequatur at est fuga iste eos quisquam atque.\nQui voluptates aut repellat labore repellendus necessitatibus. Natus rem autem iure.', 79.00, 26, 15, NULL, 'Gigabyte', 'used', '"et,aliquam,accusantium"', '{"images":["\\/img\\/pt-default\\/199.jpg","\\/img\\/pt-default\\/303.jpg","\\/img\\/pt-default\\/270.jpg","\\/img\\/pt-default\\/65.jpg","\\/img\\/pt-default\\/143.jpg"],"weight":"80 Lb","dimensions":"16 X 16 X 26 cm","color":"purple"}', NULL, NULL, 122037441, 701141045, '2016-11-29 10:30:28', '2016-11-29 10:30:28'),
(98, 161, 3, NULL, NULL, 1, 'software', 'Sharable optimizing moderator', 'Et maiores et numquam harum. Consequatur perspiciatis et omnis beatae exercitationem incidunt. Dolor veniam ut exercitationem fuga quia.\nSimilique nisi eaque similique vitae vel ratione. Vel qui dicta deleniti sit molestias. Deserunt cum incidunt eaque optio.\nConsequuntur ipsum est nihil officia at. Impedit sint saepe excepturi voluptate quia iure quo placeat. Sunt fuga ducimus quae minus. Voluptatum omnis doloribus qui magni voluptatem suscipit exercitationem.', 51.00, 35, 15, NULL, 'Gigabyte', 'used', '"qui,adipisci,quae"', '{"images":["\\/img\\/pt-default\\/21.jpg","\\/img\\/pt-default\\/215.jpg","\\/img\\/pt-default\\/229.jpg","\\/img\\/pt-default\\/184.jpg","\\/img\\/pt-default\\/255.jpg"],"weight":"48 Kg","dimensions":"3 X 12 X 26 inch","color":"blue"}', NULL, NULL, 10085627, 452472394, '2016-11-29 10:30:28', '2016-11-29 10:30:28'),
(99, 148, 3, NULL, NULL, 1, 'software', 'Streamlined fresh-thinking groupware', 'Quisquam quidem commodi sit sequi deleniti aut. Labore nostrum aut dicta vel odio sed id. Aspernatur laudantium et dolores quos.\nError molestias voluptatem ipsum ut nostrum. Et corporis molestiae dignissimos et sed. Voluptatem numquam aut aut ipsum iure laboriosam. Officia quo exercitationem fuga temporibus dolor quibusdam. Nemo aut perspiciatis dolores.\nPerspiciatis sunt corporis quasi velit et. Ea nihil omnis non praesentium. Ut inventore magni placeat ut beatae sed sed eveniet.', 4.00, 20, 5, NULL, 'Apple', 'new', '"voluptatum,qui,modi"', '{"images":["\\/img\\/pt-default\\/269.jpg","\\/img\\/pt-default\\/146.jpg","\\/img\\/pt-default\\/89.jpg","\\/img\\/pt-default\\/129.jpg","\\/img\\/pt-default\\/273.jpg"],"weight":"134 Gr","dimensions":"14 X 5 X 16 inch","color":"navy"}', NULL, NULL, 427455449, 279001790, '2016-11-29 10:30:28', '2016-11-29 10:30:28'),
(100, 221, 3, NULL, NULL, 1, 'software', 'Assimilated maximized application', 'Et saepe facere delectus. Voluptas dolorem ipsam consectetur est accusamus quod. Ea sed quidem sapiente necessitatibus pariatur. Repellendus delectus magnam sequi voluptas inventore.\nOdio qui quidem non totam est. Atque sed quidem sed minima. Maxime vitae eveniet est enim natus. Odit non consequatur totam sapiente et.\nIncidunt labore molestiae ratione esse quam totam. Doloribus ea sint quaerat voluptatibus consequuntur.', 75.00, 26, 15, NULL, 'Microsoft', 'used', '"rem,debitis,facere"', '{"images":["\\/img\\/pt-default\\/45.jpg","\\/img\\/pt-default\\/319.jpg","\\/img\\/pt-default\\/52.jpg","\\/img\\/pt-default\\/63.jpg","\\/img\\/pt-default\\/273.jpg"],"weight":"37 Lb","dimensions":"5 X 28 X 27 mm","color":"gray"}', NULL, NULL, 991341483, 804272193, '2016-11-29 10:30:28', '2016-11-29 10:30:28'),
(101, 122, 3, NULL, NULL, 1, 'software', 'Versatile 4thgeneration solution', 'Dignissimos consequatur facilis quis vitae reprehenderit aut omnis. Sed corrupti voluptatem recusandae possimus. Id qui repellat quia id.\nCumque nesciunt ut veniam esse officia error nulla. Culpa sequi blanditiis sint dolor qui quod. Eaque non id inventore sint et saepe doloremque.', 56.00, 45, 10, NULL, 'Apple', 'refurbished', '"distinctio,quis,dicta"', '{"images":["\\/img\\/pt-default\\/30.jpg","\\/img\\/pt-default\\/145.jpg","\\/img\\/pt-default\\/178.jpg","\\/img\\/pt-default\\/188.jpg","\\/img\\/pt-default\\/254.jpg"],"weight":"89 Lb","dimensions":"14 X 21 X 7 inch","color":"gray"}', NULL, NULL, 222625515, 546577278, '2016-11-29 10:30:28', '2016-11-29 10:30:28'),
(102, 229, 3, NULL, NULL, 1, 'software', 'Total discrete middleware', 'Et harum iste voluptas non cum quibusdam saepe. Itaque et ipsa nobis odit quis. Eligendi autem corrupti voluptatum nihil debitis. Voluptate est ut at nostrum necessitatibus et est.\nVoluptas explicabo totam asperiores iure. Non deleniti quidem cum. Perspiciatis accusantium veritatis voluptate sequi. Aliquid dolores veritatis quia inventore eum totam facilis.\nQuaerat in et dignissimos porro. Aut assumenda id ut cumque asperiores.\nDicta qui alias debitis. Rerum iusto voluptas ipsa voluptates.', 72.00, 21, 10, NULL, 'Lg', 'used', '"voluptatem,quae,et"', '{"images":["\\/img\\/pt-default\\/25.jpg","\\/img\\/pt-default\\/187.jpg","\\/img\\/pt-default\\/71.jpg","\\/img\\/pt-default\\/205.jpg","\\/img\\/pt-default\\/48.jpg"],"weight":"58 Oz","dimensions":"3 X 19 X 12 inch","color":"lime"}', NULL, NULL, 165451591, 607162105, '2016-11-29 10:30:28', '2016-11-29 10:30:28'),
(103, 260, 3, NULL, NULL, 1, 'software', 'Expanded clear-thinking groupware', 'Aut cumque est excepturi expedita adipisci. Voluptas est aut nam eos quaerat itaque. Tempora pariatur provident non esse. Non distinctio nisi consequatur a mollitia quisquam eveniet facere.\nIn similique aperiam ut quas maxime at. Incidunt mollitia laudantium debitis. Dolor cumque atque sed possimus temporibus aliquid in et. Ad dolor recusandae aut in et.\nEarum quam delectus unde. Quibusdam alias modi perferendis ea. Sunt porro vero saepe qui et vel doloribus.', 47.00, 29, 10, NULL, 'Lg', 'new', '"autem,eum,molestiae"', '{"images":["\\/img\\/pt-default\\/191.jpg","\\/img\\/pt-default\\/64.jpg","\\/img\\/pt-default\\/144.jpg","\\/img\\/pt-default\\/139.jpg","\\/img\\/pt-default\\/277.jpg"],"weight":"133 Kg","dimensions":"11 X 3 X 4 inch","color":"maroon"}', NULL, NULL, 428525130, 713645996, '2016-11-29 10:30:28', '2016-11-29 10:30:28'),
(104, 73, 3, NULL, NULL, 1, 'software', 'Fundamental intermediate toolset', 'Praesentium suscipit aut qui voluptates adipisci ipsam. Ipsa ut perferendis recusandae eum ullam et. Atque veritatis architecto eos inventore id doloremque et. Placeat consequuntur quia error.\nVitae repudiandae et ea dolores in. Qui est recusandae et molestias voluptatem nobis non. Officia rerum tenetur blanditiis quibusdam sunt. Deleniti aut ad recusandae est ipsa aut. Consequatur blanditiis explicabo culpa dicta ut.', 92.00, 23, 5, NULL, 'Google. Inc', 'new', '"dignissimos,assumenda,tempora"', '{"images":["\\/img\\/pt-default\\/257.jpg","\\/img\\/pt-default\\/102.jpg","\\/img\\/pt-default\\/195.jpg","\\/img\\/pt-default\\/125.jpg","\\/img\\/pt-default\\/202.jpg"],"weight":"120 Oz","dimensions":"10 X 22 X 8 inch","color":"lime"}', NULL, NULL, 453963238, 893033354, '2016-11-29 10:30:29', '2016-11-29 10:30:29'),
(105, 288, 3, NULL, NULL, 1, 'software', 'Proactive demand-driven leverage', 'Ut eum sunt aperiam et inventore omnis sed non. Voluptatibus eaque earum est odit optio aut omnis. Ut consectetur porro culpa asperiores voluptas corrupti tenetur. Illum adipisci harum quos quo omnis vel. Repellendus perferendis omnis velit magnam.\nIn voluptas tenetur eum fugiat non quos et aut. Quis consequatur et est consequatur. Sequi accusantium distinctio et reiciendis est excepturi quis. Harum suscipit molestiae expedita qui.', 59.00, 21, 5, NULL, 'Samsung', 'new', '"nostrum,et,quia"', '{"images":["\\/img\\/pt-default\\/248.jpg","\\/img\\/pt-default\\/324.jpg","\\/img\\/pt-default\\/164.jpg","\\/img\\/pt-default\\/4.jpg","\\/img\\/pt-default\\/305.jpg"],"weight":"19 Oz","dimensions":"5 X 22 X 23 cm","color":"aqua"}', NULL, NULL, 291823937, 727725601, '2016-11-29 10:30:29', '2016-11-29 10:30:29'),
(106, 146, 3, NULL, NULL, 1, 'software', 'Networked encompassing productivity', 'Voluptatem adipisci ut quis molestias. Sunt laudantium fuga est repellendus rem quia expedita. Occaecati accusamus hic quia maiores aut. Ab impedit occaecati qui occaecati pariatur qui. Necessitatibus velit voluptates autem ducimus.\nBlanditiis dicta nihil vel. Corrupti ut neque ducimus rem aut. Non a nihil reiciendis. Quis modi sapiente placeat quo fuga ipsa cum. Ut dignissimos eum corrupti cumque eius.', 8.00, 48, 5, NULL, 'Apple', 'new', '"et,qui,architecto"', '{"images":["\\/img\\/pt-default\\/95.jpg","\\/img\\/pt-default\\/164.jpg","\\/img\\/pt-default\\/76.jpg","\\/img\\/pt-default\\/107.jpg","\\/img\\/pt-default\\/15.jpg"],"weight":"142 Oz","dimensions":"26 X 11 X 15 cm","color":"navy"}', NULL, NULL, 112318616, 494689168, '2016-11-29 10:30:29', '2016-11-29 10:30:29'),
(107, 293, 3, NULL, NULL, 1, 'software', 'Realigned nextgeneration middleware', 'Eius ullam harum repellat. Molestias et quaerat labore quae nisi. Fuga totam dolorem ipsam officia explicabo dolorem est.\nDolor est vel minus alias error voluptate. Necessitatibus reiciendis officia architecto explicabo aliquid. Ipsam blanditiis nesciunt aperiam perferendis nam quos et.\nQui vitae eligendi sapiente ut sint nulla. Perferendis pariatur saepe ut nulla quidem. Consequuntur quis suscipit quidem. Eos adipisci excepturi sunt non dolores.', 31.00, 42, 15, NULL, 'Gigabyte', 'new', '"cumque,dicta,possimus"', '{"images":["\\/img\\/pt-default\\/207.jpg","\\/img\\/pt-default\\/203.jpg","\\/img\\/pt-default\\/162.jpg","\\/img\\/pt-default\\/165.jpg","\\/img\\/pt-default\\/286.jpg"],"weight":"98 Kg","dimensions":"7 X 6 X 7 cm","color":"fuchsia"}', NULL, NULL, 480553104, 247091508, '2016-11-29 10:30:29', '2016-11-29 10:30:29'),
(108, 62, 3, NULL, NULL, 1, 'software', 'Open-architected transitional customerloyalty', 'Voluptas consequuntur facere eaque at. Velit eaque sunt eius modi blanditiis tempora tempore. Voluptatem exercitationem harum ut amet.\nPerferendis atque nobis pariatur sed autem. Est rerum nesciunt dolor qui nobis. In sunt voluptatem dolores deleniti dicta. Et nulla doloribus ut. Soluta ratione eum nostrum illum aut hic cupiditate.\nLaboriosam et est culpa ut fuga qui laboriosam. Aut sit aperiam et temporibus tempora. Minima optio aliquid non est. Culpa perspiciatis incidunt voluptatem.', 75.00, 27, 5, NULL, 'Samsung', 'refurbished', '"sed,culpa,fugiat"', '{"images":["\\/img\\/pt-default\\/287.jpg","\\/img\\/pt-default\\/175.jpg","\\/img\\/pt-default\\/313.jpg","\\/img\\/pt-default\\/178.jpg","\\/img\\/pt-default\\/280.jpg"],"weight":"90 Lb","dimensions":"3 X 19 X 7 inch","color":"maroon"}', NULL, NULL, 830675388, 782069391, '2016-11-29 10:30:29', '2016-11-29 10:30:29'),
(109, 49, 3, NULL, NULL, 1, 'software', 'Inverse secondary encoding', 'Assumenda dolores aperiam atque aspernatur dignissimos. Eius eius expedita eveniet. Ab totam maxime odio dolores sit libero quia optio.\nUt aut adipisci aut nemo ut. Nisi non adipisci quod non fugit id. Necessitatibus dolores in nesciunt et in ipsam labore.\nEnim sequi suscipit tenetur sint est omnis. Soluta ipsa repudiandae ut qui possimus.', 42.00, 33, 10, NULL, 'Lg', 'new', '"illo,ea,unde"', '{"images":["\\/img\\/pt-default\\/127.jpg","\\/img\\/pt-default\\/308.jpg","\\/img\\/pt-default\\/256.jpg","\\/img\\/pt-default\\/132.jpg","\\/img\\/pt-default\\/241.jpg"],"weight":"36 Kg","dimensions":"10 X 6 X 17 cm","color":"yellow"}', NULL, NULL, 910743999, 728652650, '2016-11-29 10:30:29', '2016-11-29 10:30:29'),
(110, 226, 3, NULL, NULL, 1, 'software', 'Intuitive non-volatile hardware', 'Autem ab omnis aut necessitatibus. Commodi accusamus laboriosam doloribus aut.\nRepellendus dolores cum iste atque odit. Eos fuga accusantium nobis quos commodi distinctio.\nQuam in aspernatur dignissimos mollitia est corporis. Odit magni modi autem adipisci consequatur id. Ut eos illo nesciunt facere.\nNon molestiae velit laborum reiciendis. Repudiandae voluptatem eligendi nobis sit omnis distinctio. Quae error harum adipisci debitis a.', 48.00, 33, 10, NULL, 'Samsung', 'used', '"minima,ut,delectus"', '{"images":["\\/img\\/pt-default\\/4.jpg","\\/img\\/pt-default\\/297.jpg","\\/img\\/pt-default\\/63.jpg","\\/img\\/pt-default\\/255.jpg","\\/img\\/pt-default\\/148.jpg"],"weight":"70 Mg","dimensions":"21 X 18 X 24 inch","color":"green"}', NULL, NULL, 586630039, 974773682, '2016-11-29 10:30:29', '2016-11-29 10:30:29'),
(111, 287, 3, NULL, NULL, 1, 'software', 'Seamless 5thgeneration policy', 'Error aliquam consequatur nisi hic exercitationem ut et. Consequatur necessitatibus sint quia. Et aperiam cupiditate et expedita sint aut quo velit. Eum molestias velit placeat soluta maxime delectus.\nQui est et quos at placeat. Maiores officiis deleniti ad vel adipisci. Repellendus ut qui maiores.\nQuidem rem ipsum quod in. Rerum accusamus officiis libero excepturi.', 28.00, 45, 10, NULL, 'Gigabyte', 'refurbished', '"optio,laborum,earum"', '{"images":["\\/img\\/pt-default\\/186.jpg","\\/img\\/pt-default\\/186.jpg","\\/img\\/pt-default\\/28.jpg","\\/img\\/pt-default\\/309.jpg","\\/img\\/pt-default\\/263.jpg"],"weight":"145 Kg","dimensions":"3 X 15 X 1 cm","color":"white"}', NULL, NULL, 552821414, 858258887, '2016-11-29 10:30:29', '2016-11-29 10:30:29'),
(112, 281, 3, NULL, NULL, 1, 'software', 'Polarised static functionalities', 'Sunt excepturi eos voluptatum ea. Et ut distinctio est voluptatum assumenda repellendus. Nihil omnis cupiditate dolores incidunt at maiores omnis quod. Iusto asperiores qui qui minus voluptatibus.\nQuos autem nihil dolorum aperiam omnis velit totam. Et sed illum voluptatem similique minus. Molestias pariatur dolorem id ab provident minus praesentium aut.\nVitae non molestiae aut libero placeat. Molestiae ea ex exercitationem qui voluptates harum.', 61.00, 29, 5, NULL, 'Apple', 'new', '"voluptatem,laboriosam,laudantium"', '{"images":["\\/img\\/pt-default\\/328.jpg","\\/img\\/pt-default\\/109.jpg","\\/img\\/pt-default\\/184.jpg","\\/img\\/pt-default\\/182.jpg","\\/img\\/pt-default\\/120.jpg"],"weight":"107 Kg","dimensions":"26 X 7 X 22 cm","color":"aqua"}', NULL, NULL, 664198981, 779307883, '2016-11-29 10:30:29', '2016-11-29 10:30:29');
INSERT INTO `products` (`id`, `category_id`, `user_id`, `parent_id`, `products_group`, `status`, `type`, `name`, `description`, `price`, `stock`, `low_stock`, `bar_code`, `brand`, `condition`, `tags`, `features`, `rate_val`, `rate_count`, `sale_counts`, `view_counts`, `created_at`, `updated_at`) VALUES
(113, 258, 3, NULL, NULL, 1, 'software', 'Reactive demand-driven hub', 'Ut ex ipsa ut temporibus consequatur sequi. Similique animi distinctio commodi illo non illo. Dolorem cum voluptatem aut eaque quae. Nihil ex odit excepturi numquam natus eum.\nSit rerum voluptatibus omnis quaerat. Sint debitis saepe sunt veniam eos explicabo alias. In molestiae placeat eius porro corporis eum molestiae aliquid. Dolor explicabo laborum ut voluptates voluptas officiis et. Voluptatem autem saepe enim.', 90.00, 28, 15, NULL, 'Microsoft', 'new', '"ab,laboriosam,est"', '{"images":["\\/img\\/pt-default\\/7.jpg","\\/img\\/pt-default\\/121.jpg","\\/img\\/pt-default\\/278.jpg","\\/img\\/pt-default\\/236.jpg","\\/img\\/pt-default\\/254.jpg"],"weight":"134 Kg","dimensions":"12 X 11 X 30 cm","color":"lime"}', NULL, NULL, 146761965, 514907888, '2016-11-29 10:30:29', '2016-11-29 10:30:29'),
(114, 93, 3, NULL, NULL, 1, 'software', 'Optional local website', 'Quis nostrum mollitia exercitationem sint cumque. Et ducimus facere est rerum ea rerum. Accusamus consequatur in delectus est. Voluptas saepe facere velit nostrum ut.\nQui nulla iste qui delectus. Dicta molestiae adipisci quo ut asperiores et dignissimos. Deserunt veritatis eum nobis iure vitae eveniet possimus debitis. Hic occaecati quo dolorum odio.', 80.00, 26, 10, NULL, 'Samsung', 'new', '"iusto,provident,neque"', '{"images":["\\/img\\/pt-default\\/302.jpg","\\/img\\/pt-default\\/286.jpg","\\/img\\/pt-default\\/97.jpg","\\/img\\/pt-default\\/148.jpg","\\/img\\/pt-default\\/315.jpg"],"weight":"67 Mg","dimensions":"16 X 21 X 28 cm","color":"blue"}', NULL, NULL, 502306880, 617950022, '2016-11-29 10:30:29', '2016-11-29 10:30:29'),
(115, 143, 3, NULL, NULL, 1, 'software', 'Horizontal actuating hardware', 'Quo expedita rerum voluptas cum rem voluptatibus sed. Ea voluptatem porro ab accusamus dicta ducimus. Necessitatibus iure tempore dolores. Inventore incidunt id quam distinctio et aut.\nCupiditate ut sint tenetur expedita et. Asperiores possimus aspernatur amet.\nLibero atque nesciunt facilis mollitia illum distinctio. Et ducimus voluptates sit.', 19.00, 28, 10, NULL, 'Samsung', 'refurbished', '"blanditiis,voluptatibus,molestiae"', '{"images":["\\/img\\/pt-default\\/237.jpg","\\/img\\/pt-default\\/85.jpg","\\/img\\/pt-default\\/221.jpg","\\/img\\/pt-default\\/284.jpg","\\/img\\/pt-default\\/46.jpg"],"weight":"121 Mg","dimensions":"24 X 10 X 25 inch","color":"white"}', NULL, NULL, 964326501, 173549204, '2016-11-29 10:30:30', '2016-11-29 10:30:30'),
(116, 116, 3, NULL, NULL, 1, 'software', 'Quality-focused dedicated help-desk', 'Sit voluptatem esse dolore dicta et eligendi. Nostrum occaecati nemo minus rem. Sit in ut fuga beatae fugiat. Repellendus reprehenderit dolorum ut consequatur dicta in.\nCulpa enim rerum fugiat assumenda nulla autem. Non dolorum sed inventore nostrum beatae placeat animi. Voluptatem nihil fugit exercitationem.\nCupiditate quia eum et beatae. Voluptatibus doloremque dicta et aut et. Unde voluptatem magnam odio error suscipit incidunt rem.', 43.00, 29, 5, NULL, 'Lg', 'refurbished', '"vero,est,laudantium"', '{"images":["\\/img\\/pt-default\\/209.jpg","\\/img\\/pt-default\\/179.jpg","\\/img\\/pt-default\\/117.jpg","\\/img\\/pt-default\\/301.jpg","\\/img\\/pt-default\\/215.jpg"],"weight":"39 Kg","dimensions":"26 X 29 X 30 cm","color":"yellow"}', NULL, NULL, 616580981, 100483796, '2016-11-29 10:30:30', '2016-11-29 10:30:30'),
(117, 255, 3, NULL, NULL, 1, 'software', 'Synergized content-based projection', 'Id qui fuga quos et mollitia iure harum laudantium. Explicabo non in magni quo hic. Aut totam ea beatae consequatur rerum ad. Molestias nobis aut at sequi voluptas.\nQuia saepe dignissimos voluptatem quo voluptatem unde praesentium quos. Veritatis odit eveniet numquam ipsum. Quisquam ut non delectus quae nesciunt voluptas.\nIpsa illum et odio et reiciendis aliquid sint fugiat. Sed ipsam cupiditate vero soluta. Nobis est praesentium repudiandae cupiditate earum.', 16.00, 39, 15, NULL, 'Apple', 'new', '"neque,dolorum,nesciunt"', '{"images":["\\/img\\/pt-default\\/92.jpg","\\/img\\/pt-default\\/76.jpg","\\/img\\/pt-default\\/301.jpg","\\/img\\/pt-default\\/278.jpg","\\/img\\/pt-default\\/328.jpg"],"weight":"138 Kg","dimensions":"5 X 9 X 24 mm","color":"maroon"}', NULL, NULL, 894108050, 821906098, '2016-11-29 10:30:30', '2016-11-29 10:30:30'),
(118, 26, 3, NULL, NULL, 1, 'software', 'Synchronised context-sensitive array', 'Maiores autem tempora numquam nobis inventore qui. Reiciendis cumque natus expedita ut. Aliquam et quo eos molestiae earum a dolores soluta.\nVel labore aut excepturi cumque. Quibusdam quia corporis et vel dignissimos sapiente odit. Enim nam dignissimos ullam nulla reiciendis fuga est eaque.\nQuod in consectetur natus dolore provident laudantium et. Voluptas aperiam repudiandae dicta id iure dolores et. Tempora rerum dolor dolore omnis impedit.', 53.00, 24, 10, NULL, 'Microsoft', 'new', '"pariatur,occaecati,non"', '{"images":["\\/img\\/pt-default\\/5.jpg","\\/img\\/pt-default\\/70.jpg","\\/img\\/pt-default\\/96.jpg","\\/img\\/pt-default\\/202.jpg","\\/img\\/pt-default\\/217.jpg"],"weight":"82 Kg","dimensions":"3 X 8 X 18 mm","color":"navy"}', NULL, NULL, 961428808, 160944845, '2016-11-29 10:30:30', '2016-11-29 10:30:30'),
(119, 231, 3, NULL, NULL, 1, 'software', 'Universal bottom-line access', 'Voluptate optio accusamus consequatur quas dicta. Illo ea quisquam harum culpa saepe quisquam. Doloremque ut maiores dicta dolore. Et facere ullam iste repellendus commodi et.\nIn doloremque blanditiis ea ut sit repellat. Ullam deserunt eum dolorem doloribus provident qui consequatur. Eveniet dolorem ullam et nisi velit ut quas. Rerum repellat alias consequatur deserunt iste. Doloremque libero explicabo consequatur dolore sint consequatur deserunt.', 22.00, 24, 15, NULL, 'Samsung', 'used', '"repudiandae,sit,quasi"', '{"images":["\\/img\\/pt-default\\/317.jpg","\\/img\\/pt-default\\/233.jpg","\\/img\\/pt-default\\/49.jpg","\\/img\\/pt-default\\/25.jpg","\\/img\\/pt-default\\/236.jpg"],"weight":"124 Gr","dimensions":"20 X 26 X 26 cm","color":"blue"}', NULL, NULL, 933957847, 259675305, '2016-11-29 10:30:30', '2016-11-29 10:30:30'),
(120, 200, 3, NULL, NULL, 1, 'software', 'Switchable encompassing firmware', 'Doloremque iusto quaerat voluptates ut quidem. Quae magnam nostrum odio ut ipsam. Et consequatur assumenda labore in sequi atque dolores.\nEaque molestiae fuga impedit sed voluptates. Deleniti amet ut rerum non magnam quia unde. Ducimus quam officiis tempora necessitatibus voluptatibus rerum. Ea aut nesciunt et nemo.', 22.00, 41, 5, NULL, 'Samsung', 'used', '"dicta,ut,totam"', '{"images":["\\/img\\/pt-default\\/284.jpg","\\/img\\/pt-default\\/8.jpg","\\/img\\/pt-default\\/245.jpg","\\/img\\/pt-default\\/272.jpg","\\/img\\/pt-default\\/58.jpg"],"weight":"43 Mg","dimensions":"13 X 30 X 11 inch","color":"yellow"}', NULL, NULL, 714874285, 781601427, '2016-11-29 10:30:30', '2016-11-29 10:30:30'),
(121, 152, 3, NULL, NULL, 1, 'software', 'Focused fault-tolerant adapter', 'Quibusdam quibusdam eos corrupti molestiae. Odio inventore laboriosam rerum voluptatem. Doloremque quo eius quas iste. Non voluptas itaque fugit similique maxime.\nUnde optio mollitia quo et amet. Aut ipsam esse cum. Rerum eveniet sit est et ad et at. Adipisci illo placeat perferendis sit aut earum.\nQuae qui a quas est ea voluptatem. Maiores repudiandae illo quia eum quia totam. Esse nisi et vitae aut totam.', 23.00, 43, 15, NULL, 'Microsoft', 'new', '"iste,quibusdam,et"', '{"images":["\\/img\\/pt-default\\/299.jpg","\\/img\\/pt-default\\/204.jpg","\\/img\\/pt-default\\/48.jpg","\\/img\\/pt-default\\/309.jpg","\\/img\\/pt-default\\/81.jpg"],"weight":"81 Oz","dimensions":"20 X 28 X 21 inch","color":"white"}', NULL, NULL, 866536790, 492751036, '2016-11-29 10:30:30', '2016-11-29 10:30:30'),
(122, 298, 3, NULL, NULL, 1, 'software', 'Centralized discrete paradigm', 'Aliquid ratione quis earum laudantium accusantium quos commodi. Voluptatibus temporibus deserunt voluptatum fugit. Quaerat id natus qui assumenda in quam necessitatibus.\nMagni velit sit impedit repudiandae. Molestiae odit consequatur dolorum odio omnis occaecati. Eum qui quia consequuntur vero. Consequatur sapiente sit error nobis rem.\nUt enim quidem nostrum. Facere autem ratione ab. Quasi quidem perferendis quisquam harum exercitationem rerum aliquid.', 24.00, 21, 15, NULL, 'Google. Inc', 'new', '"ut,reiciendis,facere"', '{"images":["\\/img\\/pt-default\\/209.jpg","\\/img\\/pt-default\\/292.jpg","\\/img\\/pt-default\\/295.jpg","\\/img\\/pt-default\\/227.jpg","\\/img\\/pt-default\\/148.jpg"],"weight":"42 Mg","dimensions":"2 X 12 X 25 inch","color":"maroon"}', NULL, NULL, 304691432, 430376098, '2016-11-29 10:30:30', '2016-11-29 10:30:30'),
(123, 14, 3, NULL, NULL, 1, 'software', 'Re-contextualized motivating projection', 'Nihil unde commodi dolorem aut amet magnam voluptas. Sit quisquam sunt corrupti quo. Dolorem soluta modi laudantium necessitatibus quia. Nobis voluptas cupiditate deserunt deleniti repellendus quisquam est. Eligendi error qui ex quidem.\nDolore aut excepturi molestias tempora in ut. Consequatur labore assumenda adipisci. Est officia aperiam quod odit labore. Amet id tempore asperiores quis tenetur consectetur. Voluptas omnis ex quam officia accusantium aut debitis provident.', 95.00, 33, 5, NULL, 'Samsung', 'used', '"aut,exercitationem,tenetur"', '{"images":["\\/img\\/pt-default\\/255.jpg","\\/img\\/pt-default\\/134.jpg","\\/img\\/pt-default\\/117.jpg","\\/img\\/pt-default\\/72.jpg","\\/img\\/pt-default\\/85.jpg"],"weight":"93 Gr","dimensions":"30 X 21 X 11 cm","color":"teal"}', NULL, NULL, 232735154, 520673700, '2016-11-29 10:30:30', '2016-11-29 10:30:30'),
(124, 50, 3, NULL, NULL, 1, 'software', 'Profound 4thgeneration extranet', 'Totam eaque voluptas fugiat ut. Praesentium dolores tempore quis dolorem autem et. Deserunt tenetur voluptates sed exercitationem qui.\nCommodi velit quod impedit ut laborum quos accusantium. Odit natus et earum est fugit. Nam in ut illum assumenda. Rerum quam quis rem.\nExercitationem quas amet aspernatur quia. Odio reprehenderit laudantium totam voluptatibus. Porro sapiente sint consequatur facere tenetur. Commodi minus repellat sequi illo cupiditate in doloribus.', 80.00, 44, 15, NULL, 'Apple', 'used', '"ipsam,facere,iste"', '{"images":["\\/img\\/pt-default\\/129.jpg","\\/img\\/pt-default\\/182.jpg","\\/img\\/pt-default\\/209.jpg","\\/img\\/pt-default\\/165.jpg","\\/img\\/pt-default\\/218.jpg"],"weight":"129 Oz","dimensions":"21 X 7 X 28 inch","color":"olive"}', NULL, NULL, 626363945, 387969234, '2016-11-29 10:30:30', '2016-11-29 10:30:30'),
(125, 91, 3, NULL, NULL, 1, 'software', 'Persevering scalable flexibility', 'Maxime autem itaque id dolorem molestiae et atque. Aut expedita hic et. Vitae eveniet quasi saepe corporis.\nQui voluptatem autem perspiciatis autem ut hic. Asperiores cumque non quod dolor facilis reiciendis officiis. Incidunt necessitatibus inventore animi soluta quas iure explicabo aut. Ex iusto nulla hic enim praesentium.\nUnde velit quia tenetur. Et cumque illo ea perferendis veritatis. Est reprehenderit voluptas consequatur cum qui sit quia necessitatibus.', 23.00, 22, 15, NULL, 'Lg', 'used', '"recusandae,eos,quia"', '{"images":["\\/img\\/pt-default\\/241.jpg","\\/img\\/pt-default\\/265.jpg","\\/img\\/pt-default\\/247.jpg","\\/img\\/pt-default\\/186.jpg","\\/img\\/pt-default\\/187.jpg"],"weight":"37 Kg","dimensions":"27 X 10 X 14 inch","color":"yellow"}', NULL, NULL, 246350185, 403322407, '2016-11-29 10:30:31', '2016-11-29 10:30:31'),
(126, 216, 3, NULL, NULL, 1, 'software', 'Intuitive coherent concept', 'Aliquam quia velit nisi qui. Quaerat itaque delectus aut incidunt. Ut veniam quo quasi incidunt velit magni. Unde soluta eos et et modi corrupti unde.\nInventore quo tempore quibusdam repellendus. Exercitationem voluptas voluptas minus nihil. Ratione ut esse sit. Sed deleniti reiciendis labore delectus.\nAccusamus qui quia iste veniam. Aut ut iste deserunt. Voluptas recusandae autem in quaerat. Omnis quasi et debitis distinctio alias iure hic ut.', 29.00, 29, 15, NULL, 'Apple', 'used', '"quae,et,est"', '{"images":["\\/img\\/pt-default\\/276.jpg","\\/img\\/pt-default\\/160.jpg","\\/img\\/pt-default\\/300.jpg","\\/img\\/pt-default\\/178.jpg","\\/img\\/pt-default\\/317.jpg"],"weight":"50 Mg","dimensions":"30 X 27 X 14 mm","color":"lime"}', NULL, NULL, 645776437, 388136667, '2016-11-29 10:30:31', '2016-11-29 10:30:31'),
(127, 320, 3, NULL, NULL, 1, 'software', 'Triple-buffered stable budgetarymanagement', 'Modi magni error dolore. Consequatur et beatae eos. Quia et voluptate aut incidunt. Architecto commodi sint cum tempore.\nRatione quas nobis quasi esse et. Doloribus rerum incidunt quod rerum placeat eius corrupti sequi. Quia a placeat et quaerat sunt. Ut sed aut amet illo nihil placeat aspernatur.\nModi fugiat consectetur eum quia. Aliquid maxime nostrum veniam. Saepe voluptatem fugit minus libero. Perspiciatis officia perspiciatis eaque et earum.', 41.00, 36, 10, NULL, 'Gigabyte', 'refurbished', '"inventore,temporibus,molestias"', '{"images":["\\/img\\/pt-default\\/139.jpg","\\/img\\/pt-default\\/304.jpg","\\/img\\/pt-default\\/319.jpg","\\/img\\/pt-default\\/312.jpg","\\/img\\/pt-default\\/265.jpg"],"weight":"54 Oz","dimensions":"5 X 2 X 16 inch","color":"blue"}', NULL, NULL, 268070911, 617342127, '2016-11-29 10:30:31', '2016-11-29 10:30:31'),
(128, 309, 3, NULL, NULL, 1, 'software', 'Distributed multi-state superstructure', 'Qui voluptatum consectetur consequatur harum quae consequuntur consectetur. Aliquam doloribus quidem blanditiis quo consequatur facilis. Tempora in dolor delectus sint totam minima.\nDolore et aliquam nam voluptatem dolores est porro. Sapiente rerum doloribus architecto sunt ab occaecati. Commodi reprehenderit laboriosam quas explicabo distinctio.', 57.00, 30, 5, NULL, 'Apple', 'refurbished', '"officiis,adipisci,illo"', '{"images":["\\/img\\/pt-default\\/220.jpg","\\/img\\/pt-default\\/258.jpg","\\/img\\/pt-default\\/75.jpg","\\/img\\/pt-default\\/132.jpg","\\/img\\/pt-default\\/230.jpg"],"weight":"55 Mg","dimensions":"2 X 22 X 10 mm","color":"blue"}', NULL, NULL, 5825291, 830043929, '2016-11-29 10:30:31', '2016-11-29 10:30:31'),
(129, 201, 3, NULL, NULL, 1, 'software', 'Multi-tiered reciprocal solution', 'Ut et distinctio velit totam. Laborum vero doloribus enim nihil. Quam eius et aspernatur rerum.\nIusto tempora est consequuntur facilis. Natus dolores nisi iste sequi quasi. Nisi vel labore temporibus repudiandae et nobis accusamus. Sunt repudiandae autem eum animi nemo atque blanditiis ipsa.\nAdipisci dolore rem asperiores rerum. Cum atque adipisci et voluptates quo voluptas perferendis. Quos sit ut quasi ea sit quia omnis sed. Nihil eum tenetur quisquam. Consequuntur eveniet earum reiciendis.', 31.00, 32, 15, NULL, 'Apple', 'used', '"non,nihil,cum"', '{"images":["\\/img\\/pt-default\\/295.jpg","\\/img\\/pt-default\\/118.jpg","\\/img\\/pt-default\\/228.jpg","\\/img\\/pt-default\\/150.jpg","\\/img\\/pt-default\\/284.jpg"],"weight":"75 Kg","dimensions":"8 X 3 X 6 mm","color":"black"}', NULL, NULL, 524465656, 390336656, '2016-11-29 10:30:31', '2016-11-29 10:30:31'),
(130, 5, 3, NULL, NULL, 1, 'software', 'Universal systematic database', 'Sed at in veritatis dolor. Pariatur optio assumenda magnam autem perspiciatis fuga.\nPlaceat aspernatur asperiores animi culpa illum sed. Et voluptatem in quia. Quia numquam ut dolores quod consequatur et.\nBeatae nulla nihil qui dolores voluptas nobis et. Incidunt adipisci doloremque doloribus aut ex minus in. Enim qui natus nostrum dolorem ut minus quis facilis. Praesentium hic molestiae est adipisci et.', 38.00, 28, 15, NULL, 'Microsoft', 'new', '"voluptatem,quis,tempore"', '{"images":["\\/img\\/pt-default\\/127.jpg","\\/img\\/pt-default\\/289.jpg","\\/img\\/pt-default\\/263.jpg","\\/img\\/pt-default\\/209.jpg","\\/img\\/pt-default\\/40.jpg"],"weight":"53 Lb","dimensions":"24 X 23 X 10 cm","color":"green"}', NULL, NULL, 190131979, 467590462, '2016-11-29 10:30:31', '2016-11-29 10:30:31'),
(131, 247, 3, NULL, NULL, 1, 'software', 'Public-key client-server methodology', 'Aut commodi placeat eos dicta. Ex blanditiis ipsam exercitationem est aut aut recusandae. Nostrum dolorum libero saepe voluptate quia. Beatae fugiat et beatae vel sapiente voluptas.\nAperiam porro placeat veniam aliquid assumenda. Veniam voluptates quos tempora molestiae ad similique et. Nulla voluptate delectus quae aut ea.\nAutem repudiandae animi aut. Et in eligendi numquam sed. Repudiandae exercitationem mollitia est illo omnis ducimus id ea.', 95.00, 28, 10, NULL, 'Gigabyte', 'new', '"et,dolorem,tenetur"', '{"images":["\\/img\\/pt-default\\/140.jpg","\\/img\\/pt-default\\/60.jpg","\\/img\\/pt-default\\/189.jpg","\\/img\\/pt-default\\/222.jpg","\\/img\\/pt-default\\/151.jpg"],"weight":"48 Oz","dimensions":"13 X 17 X 9 mm","color":"gray"}', NULL, NULL, 172521994, 333255668, '2016-11-29 10:30:31', '2016-11-29 10:30:31'),
(132, 293, 3, NULL, NULL, 1, 'software', 'Virtual leadingedge benchmark', 'Rerum nihil et harum omnis. Vero repellat quae eligendi dolorem temporibus ut ratione cumque. Distinctio blanditiis aut ea laborum doloribus voluptate.\nDolorem nemo reprehenderit qui hic adipisci molestiae. Nam molestiae vero architecto aperiam. Quia tenetur dolorem maiores est. Aspernatur omnis nulla nesciunt aut fugit.\nDicta tempora voluptatem ut et repudiandae alias modi. Ratione id voluptatem aspernatur ullam velit.', 54.00, 29, 15, NULL, 'Apple', 'refurbished', '"sint,voluptatum,enim"', '{"images":["\\/img\\/pt-default\\/291.jpg","\\/img\\/pt-default\\/232.jpg","\\/img\\/pt-default\\/145.jpg","\\/img\\/pt-default\\/191.jpg","\\/img\\/pt-default\\/17.jpg"],"weight":"76 Gr","dimensions":"11 X 4 X 15 inch","color":"aqua"}', NULL, NULL, 42890763, 379182618, '2016-11-29 10:30:31', '2016-11-29 10:30:31'),
(133, 79, 3, NULL, NULL, 1, 'software', 'Compatible user-facing implementation', 'Voluptas quos qui distinctio dolorem. Aut ab nostrum aut explicabo distinctio. Aut magni numquam consequatur repellat.\nReiciendis ab magnam quis atque. Sunt impedit facere sit dolorem nam. Eum vitae praesentium consequuntur asperiores dolorum ut. Omnis autem fugiat cum.', 48.00, 43, 10, NULL, 'Apple', 'used', '"nemo,voluptas,nisi"', '{"images":["\\/img\\/pt-default\\/111.jpg","\\/img\\/pt-default\\/160.jpg","\\/img\\/pt-default\\/239.jpg","\\/img\\/pt-default\\/286.jpg","\\/img\\/pt-default\\/57.jpg"],"weight":"109 Mg","dimensions":"13 X 25 X 28 cm","color":"silver"}', NULL, NULL, 457521468, 254969598, '2016-11-29 10:30:31', '2016-11-29 10:30:31'),
(134, 67, 3, NULL, NULL, 1, 'software', 'Down-sized context-sensitive policy', 'Aut sed et similique nisi deleniti ab. Debitis asperiores exercitationem cupiditate sit architecto. Sunt quasi nisi aspernatur laboriosam maiores iure temporibus. Saepe praesentium sit sit fuga earum quam et dolores. Est voluptatem et voluptatem optio reprehenderit.\nMolestias id illum cum laboriosam autem. Id quaerat voluptates architecto velit modi. Qui sed aliquid repudiandae molestiae minima id. Accusamus et ea est dolores sed omnis officia.', 18.00, 30, 15, NULL, 'Gigabyte', 'new', '"voluptas,itaque,hic"', '{"images":["\\/img\\/pt-default\\/232.jpg","\\/img\\/pt-default\\/317.jpg","\\/img\\/pt-default\\/130.jpg","\\/img\\/pt-default\\/181.jpg","\\/img\\/pt-default\\/290.jpg"],"weight":"19 Oz","dimensions":"4 X 6 X 27 cm","color":"black"}', NULL, NULL, 419498675, 899122903, '2016-11-29 10:30:31', '2016-11-29 10:30:31'),
(135, 192, 3, NULL, NULL, 1, 'software', 'Digitized well-modulated orchestration', 'Aspernatur sint saepe repellendus tempora numquam quas. Harum odit voluptate voluptatem explicabo.\nAliquam nisi rerum velit. Dolor quibusdam iure rerum veniam voluptates quia. Nobis velit ad ducimus alias fugiat voluptatem.\nLaborum blanditiis qui suscipit. Voluptatum iste voluptas eos dolores. Commodi veniam ipsum quis.\nVitae velit saepe ratione et. Ad quibusdam non praesentium animi deserunt explicabo explicabo.', 78.00, 20, 5, NULL, 'Samsung', 'refurbished', '"voluptatibus,voluptatibus,saepe"', '{"images":["\\/img\\/pt-default\\/14.jpg","\\/img\\/pt-default\\/309.jpg","\\/img\\/pt-default\\/13.jpg","\\/img\\/pt-default\\/302.jpg","\\/img\\/pt-default\\/260.jpg"],"weight":"46 Mg","dimensions":"8 X 15 X 15 cm","color":"green"}', NULL, NULL, 905173135, 373368594, '2016-11-29 10:30:31', '2016-11-29 10:30:31'),
(136, 281, 3, NULL, NULL, 1, 'software', 'Versatile eco-centric monitoring', 'Aut quia consequuntur iusto esse. Mollitia culpa iusto iusto mollitia eaque blanditiis est eligendi. Nisi et sunt voluptatem vitae. Minus sequi ut qui laborum ex.\nSimilique enim voluptatum nisi dolor. Earum eum veniam nemo quia. Officia veniam ut amet ut molestiae. Ut officiis velit reprehenderit voluptates placeat eos.\nVelit recusandae rerum aliquam vero. Ut sunt non non dolore est. Voluptatum rerum numquam non quae.', 32.00, 44, 10, NULL, 'Apple', 'used', '"optio,eum,nulla"', '{"images":["\\/img\\/pt-default\\/33.jpg","\\/img\\/pt-default\\/145.jpg","\\/img\\/pt-default\\/297.jpg","\\/img\\/pt-default\\/230.jpg","\\/img\\/pt-default\\/224.jpg"],"weight":"44 Oz","dimensions":"8 X 14 X 23 cm","color":"black"}', NULL, NULL, 796571717, 715437088, '2016-11-29 10:30:31', '2016-11-29 10:30:31'),
(137, 7, 3, NULL, NULL, 1, 'software', 'Managed 24hour data-warehouse', 'Ut tempora et magnam perspiciatis adipisci repellendus. Dolorem et aut est cumque voluptatem. Voluptas recusandae enim repellendus molestias rerum.\nEst necessitatibus velit accusamus eum repudiandae adipisci. Quibusdam inventore nulla atque dolores. Praesentium rerum voluptas odio earum.', 31.00, 28, 10, NULL, 'Gigabyte', 'used', '"itaque,laboriosam,et"', '{"images":["\\/img\\/pt-default\\/103.jpg","\\/img\\/pt-default\\/251.jpg","\\/img\\/pt-default\\/222.jpg","\\/img\\/pt-default\\/85.jpg","\\/img\\/pt-default\\/132.jpg"],"weight":"42 Mg","dimensions":"7 X 19 X 14 cm","color":"purple"}', NULL, NULL, 403059553, 214894383, '2016-11-29 10:30:31', '2016-11-29 10:30:31'),
(138, 157, 3, NULL, NULL, 1, 'software', 'Diverse exuding database', 'Enim aut illum vero quibusdam eos qui maxime. Sit voluptas ipsam neque et aut et. Libero quia et et distinctio. Quia nobis tempora dolores non aut magnam.\nConsectetur deleniti quia magni est neque mollitia. Nihil ducimus nisi et ut voluptate. Aut qui illo dignissimos ex est quis non. Sapiente voluptatem quis et omnis.', 93.00, 48, 10, NULL, 'Samsung', 'used', '"voluptatem,nihil,asperiores"', '{"images":["\\/img\\/pt-default\\/319.jpg","\\/img\\/pt-default\\/267.jpg","\\/img\\/pt-default\\/67.jpg","\\/img\\/pt-default\\/305.jpg","\\/img\\/pt-default\\/120.jpg"],"weight":"109 Gr","dimensions":"28 X 13 X 1 cm","color":"fuchsia"}', NULL, NULL, 230777765, 531344321, '2016-11-29 10:30:32', '2016-11-29 10:30:32'),
(139, 210, 3, NULL, NULL, 1, 'software', 'Grass-roots homogeneous architecture', 'Eligendi animi harum modi ut odit esse deleniti sit. Veritatis blanditiis exercitationem magnam est dolor repudiandae et. Sed est voluptas voluptatem et. Sed qui rem suscipit a.\nDolores dolore ipsa animi quidem. Est quo architecto nihil neque.\nPerspiciatis velit molestias facilis est unde in. Minima voluptatibus alias soluta aut.\nEst veritatis velit rerum debitis. In suscipit non et distinctio sunt et aut. Nam vitae debitis velit.', 33.00, 25, 15, NULL, 'Gigabyte', 'new', '"maxime,neque,necessitatibus"', '{"images":["\\/img\\/pt-default\\/166.jpg","\\/img\\/pt-default\\/223.jpg","\\/img\\/pt-default\\/133.jpg","\\/img\\/pt-default\\/225.jpg","\\/img\\/pt-default\\/184.jpg"],"weight":"80 Oz","dimensions":"2 X 10 X 26 mm","color":"blue"}', NULL, NULL, 551127474, 71207510, '2016-11-29 10:30:32', '2016-11-29 10:30:32'),
(140, 155, 3, NULL, NULL, 1, 'software', 'Open-source holistic portal', 'Et voluptatem quia deserunt beatae. Nihil nam esse qui similique odio commodi ex. Minima blanditiis sunt quis officia repellat et dolore. Non voluptatem error architecto modi aperiam.\nQuae dolor aspernatur qui autem similique aspernatur. Perspiciatis veritatis sed excepturi ad assumenda magnam repellendus. Aut autem dicta exercitationem ipsa. Sed deleniti eaque nobis ea nihil pariatur.', 63.00, 47, 5, NULL, 'Gigabyte', 'new', '"velit,debitis,provident"', '{"images":["\\/img\\/pt-default\\/209.jpg","\\/img\\/pt-default\\/151.jpg","\\/img\\/pt-default\\/329.jpg","\\/img\\/pt-default\\/16.jpg","\\/img\\/pt-default\\/180.jpg"],"weight":"99 Kg","dimensions":"3 X 22 X 23 inch","color":"maroon"}', NULL, NULL, 904468177, 631414523, '2016-11-29 10:30:32', '2016-11-29 10:30:32'),
(141, 234, 3, NULL, NULL, 1, 'software', 'Universal needs-based leverage', 'Aut inventore accusamus maxime et. Qui ducimus tenetur ducimus aut fuga ipsam.\nNon voluptatibus quo quasi voluptates ipsum cupiditate. Fugit neque in non qui consequatur sunt deserunt ut. Occaecati asperiores velit quia quisquam assumenda.\nEt et harum molestiae numquam. Reprehenderit sequi ut iusto cupiditate quidem natus. Totam ab ducimus et.', 53.00, 38, 10, NULL, 'Lg', 'refurbished', '"deserunt,voluptatum,omnis"', '{"images":["\\/img\\/pt-default\\/319.jpg","\\/img\\/pt-default\\/27.jpg","\\/img\\/pt-default\\/138.jpg","\\/img\\/pt-default\\/189.jpg","\\/img\\/pt-default\\/187.jpg"],"weight":"85 Mg","dimensions":"3 X 7 X 23 inch","color":"gray"}', NULL, NULL, 687261949, 185550177, '2016-11-29 10:30:32', '2016-11-29 10:30:32'),
(142, 244, 3, NULL, NULL, 1, 'software', 'Persistent bifurcated throughput', 'Omnis aperiam sunt sunt molestias hic repellendus omnis. Dolorem deleniti doloremque ipsam nemo quia vel. Debitis mollitia explicabo sunt consequuntur.\nPerferendis sapiente vel ut neque aut. Porro saepe ipsam temporibus quo. Sit aliquam et sit autem cumque velit aut. Corporis quia aut et at corrupti autem exercitationem nulla.', 43.00, 50, 5, NULL, 'Microsoft', 'new', '"vel,qui,porro"', '{"images":["\\/img\\/pt-default\\/49.jpg","\\/img\\/pt-default\\/283.jpg","\\/img\\/pt-default\\/153.jpg","\\/img\\/pt-default\\/149.jpg","\\/img\\/pt-default\\/65.jpg"],"weight":"60 Kg","dimensions":"19 X 26 X 3 cm","color":"olive"}', NULL, NULL, 668080153, 754617832, '2016-11-29 10:30:32', '2016-11-29 10:30:32'),
(143, 180, 3, NULL, NULL, 1, 'software', 'Universal neutral opensystem', 'Totam qui itaque et aliquid. Dolor officia inventore et. Esse consectetur dolor ipsa voluptas ut dolor.\nSit quidem voluptates eos. Nam id sint sed. Dignissimos sapiente laborum natus impedit.\nInventore qui perferendis facilis ex voluptate dolores. Qui molestias qui earum sed dolorum et. Et error sunt est architecto.\nQuisquam nisi enim minus aliquid numquam eos. Similique est esse soluta qui. Rerum rerum sunt in quaerat.', 79.00, 25, 15, NULL, 'Google. Inc', 'refurbished', '"ullam,quasi,distinctio"', '{"images":["\\/img\\/pt-default\\/120.jpg","\\/img\\/pt-default\\/223.jpg","\\/img\\/pt-default\\/22.jpg","\\/img\\/pt-default\\/319.jpg","\\/img\\/pt-default\\/92.jpg"],"weight":"71 Mg","dimensions":"21 X 16 X 17 inch","color":"silver"}', NULL, NULL, 671815601, 858357507, '2016-11-29 10:30:32', '2016-11-29 10:30:32'),
(144, 50, 3, NULL, NULL, 1, 'software', 'Assimilated optimal openarchitecture', 'Quasi voluptatem tempora qui quae et nobis dicta. Molestias dolore hic vel reiciendis sint et rerum. Quidem quaerat repellat quos accusamus. Voluptates voluptatem harum omnis in possimus perferendis.\nIllum molestiae tenetur exercitationem reiciendis. Possimus sit voluptate magnam. Nobis id reprehenderit repellat et.\nIpsam quasi mollitia et architecto. Accusamus impedit et earum. Aperiam impedit dolore sed dolorem nulla ab aut explicabo.', 47.00, 43, 10, NULL, 'Lg', 'refurbished', '"enim,itaque,doloribus"', '{"images":["\\/img\\/pt-default\\/195.jpg","\\/img\\/pt-default\\/245.jpg","\\/img\\/pt-default\\/68.jpg","\\/img\\/pt-default\\/131.jpg","\\/img\\/pt-default\\/84.jpg"],"weight":"103 Kg","dimensions":"11 X 17 X 28 mm","color":"yellow"}', NULL, NULL, 343998060, 615543100, '2016-11-29 10:30:32', '2016-11-29 10:30:32'),
(145, 147, 3, NULL, NULL, 1, 'software', 'Public-key optimal localareanetwork', 'Nam repellendus sint aperiam et voluptas. Incidunt voluptas aut officiis ea molestias. Omnis nesciunt atque aut cumque laboriosam est corporis enim. Necessitatibus repellendus et sunt laborum.\nMaiores pariatur dolorum sed. Magni atque autem qui et. Sapiente minus quis earum repellendus est. Sit assumenda et praesentium dolores quas.\nEt aliquam doloribus deserunt sequi facilis sunt. A aut fuga laboriosam quis saepe dolorum. Recusandae minus harum tempora quo et ut.', 75.00, 45, 10, NULL, 'Google. Inc', 'used', '"assumenda,sit,velit"', '{"images":["\\/img\\/pt-default\\/51.jpg","\\/img\\/pt-default\\/18.jpg","\\/img\\/pt-default\\/73.jpg","\\/img\\/pt-default\\/183.jpg","\\/img\\/pt-default\\/93.jpg"],"weight":"48 Gr","dimensions":"3 X 8 X 4 inch","color":"white"}', NULL, NULL, 687192330, 685560323, '2016-11-29 10:30:32', '2016-11-29 10:30:32'),
(146, 239, 3, NULL, NULL, 1, 'software', 'Intuitive mission-critical help-desk', 'Unde hic sapiente non quis. In pariatur sint porro ea. Minus explicabo ipsa consequatur quas nostrum ut. Sint provident animi sed odit nihil. Deserunt ex officiis maxime aut rerum perspiciatis sequi voluptas.\nVel voluptate ut repellat corrupti molestiae soluta inventore quas. Ratione vitae minus omnis laudantium itaque eum. Est eos delectus quia fugit odit ipsam consequatur. Quas inventore ab et et.', 67.00, 35, 5, NULL, 'Gigabyte', 'used', '"aliquid,assumenda,laborum"', '{"images":["\\/img\\/pt-default\\/105.jpg","\\/img\\/pt-default\\/28.jpg","\\/img\\/pt-default\\/328.jpg","\\/img\\/pt-default\\/139.jpg","\\/img\\/pt-default\\/214.jpg"],"weight":"89 Gr","dimensions":"13 X 23 X 11 inch","color":"yellow"}', NULL, NULL, 774148828, 32297207, '2016-11-29 10:30:32', '2016-11-29 10:30:32'),
(147, 223, 3, NULL, NULL, 1, 'software', 'Enterprise-wide eco-centric infrastructure', 'Voluptatem laborum dolorem velit et. Culpa incidunt unde libero necessitatibus numquam. Perferendis non ea enim dolor dolore magni. Magni sequi aut officia iste a.\nQuia distinctio sit corrupti veritatis. Maiores sint aliquam voluptas consequatur fuga. Id cumque est et in deserunt reiciendis.\nQui est blanditiis voluptates. Qui consequatur voluptatem quasi impedit in culpa sunt. Nobis consequuntur velit vel et qui.', 97.00, 43, 10, NULL, 'Microsoft', 'refurbished', '"dolore,officiis,vero"', '{"images":["\\/img\\/pt-default\\/131.jpg","\\/img\\/pt-default\\/246.jpg","\\/img\\/pt-default\\/169.jpg","\\/img\\/pt-default\\/288.jpg","\\/img\\/pt-default\\/188.jpg"],"weight":"103 Kg","dimensions":"12 X 15 X 4 cm","color":"black"}', NULL, NULL, 508409955, 781706427, '2016-11-29 10:30:33', '2016-11-29 10:30:33'),
(148, 49, 3, NULL, NULL, 1, 'software', 'Diverse mobile contingency', 'Rerum totam rerum voluptates eligendi qui. Officia tenetur ullam ut nihil molestiae explicabo minima. Impedit tempora dicta quas veritatis. Cupiditate eveniet odio officia aut quis voluptatem cumque.\nHarum minima et mollitia ad laboriosam aut numquam. Quibusdam porro in non nihil ducimus. Consequuntur facere vero ab quia autem.\nFacere qui sunt unde ullam velit ut earum. Voluptatibus molestias occaecati iure. Et impedit reiciendis accusamus voluptatem illum numquam molestias.', 61.00, 24, 5, NULL, 'Apple', 'used', '"voluptatem,et,repudiandae"', '{"images":["\\/img\\/pt-default\\/151.jpg","\\/img\\/pt-default\\/257.jpg","\\/img\\/pt-default\\/327.jpg","\\/img\\/pt-default\\/14.jpg","\\/img\\/pt-default\\/262.jpg"],"weight":"145 Gr","dimensions":"11 X 5 X 28 mm","color":"teal"}', NULL, NULL, 244729983, 502195130, '2016-11-29 10:30:33', '2016-11-29 10:30:33'),
(149, 182, 3, NULL, NULL, 1, 'software', 'Reverse-engineered didactic data-warehouse', 'Recusandae aspernatur et ex libero exercitationem eius ut. Rerum non fugit perferendis debitis et eveniet ipsa molestias. Dolorem ut unde qui ut modi non et. Dolores quam quam aut alias placeat.\nRem voluptates iste vel deleniti magni nostrum atque cupiditate. Nam dignissimos dolor deserunt eius explicabo. Omnis officia accusamus incidunt alias nemo.\nNemo commodi saepe quo accusantium voluptatem corrupti. Voluptate rem quo in. Ullam ab omnis autem ipsa eius.', 86.00, 24, 10, NULL, 'Lg', 'new', '"numquam,reiciendis,expedita"', '{"images":["\\/img\\/pt-default\\/37.jpg","\\/img\\/pt-default\\/138.jpg","\\/img\\/pt-default\\/181.jpg","\\/img\\/pt-default\\/195.jpg","\\/img\\/pt-default\\/281.jpg"],"weight":"59 Oz","dimensions":"10 X 25 X 1 cm","color":"fuchsia"}', NULL, NULL, 838557291, 620659267, '2016-11-29 10:30:33', '2016-11-29 10:30:33'),
(150, 132, 3, NULL, NULL, 1, 'software', 'Balanced web-enabled structure', 'Nam cupiditate quia corporis sit earum. Voluptas ut cupiditate veritatis illo consectetur.\nProvident quia non reiciendis esse nemo totam quis. Cupiditate id nam dolor accusantium reiciendis voluptates. Et sed deserunt maxime.\nFacere neque vitae eum libero enim quod sit. Rerum fugit soluta odio sed. Quia aliquid at omnis eveniet aut consequatur.\nMagnam accusantium rerum non quae quo qui quia. Aut error ratione sed hic totam consequatur adipisci.', 5.00, 47, 15, NULL, 'Microsoft', 'refurbished', '"ea,harum,officia"', '{"images":["\\/img\\/pt-default\\/222.jpg","\\/img\\/pt-default\\/281.jpg","\\/img\\/pt-default\\/308.jpg","\\/img\\/pt-default\\/99.jpg","\\/img\\/pt-default\\/157.jpg"],"weight":"50 Oz","dimensions":"18 X 11 X 17 inch","color":"olive"}', NULL, NULL, 667580121, 191915690, '2016-11-29 10:30:33', '2016-11-29 10:30:33'),
(151, 14, 3, NULL, NULL, 1, 'software', 'My Seeded Product', 'Qui nam voluptates necessitatibus. Asperiores culpa corrupti veritatis quo amet dolores.', 75.00, 100, 10, NULL, 'Samsung', 'new', '"recusandae,saepe,est"', '{"images":["\\/img\\/pt-default\\/120.jpg","\\/img\\/pt-default\\/168.jpg","\\/img\\/pt-default\\/178.jpg","\\/img\\/pt-default\\/115.jpg","\\/img\\/pt-default\\/74.jpg"],"weight":"23 Gr","dimensions":"19 X 25 X 7 inch","color":"gray"}', 3.00, 5, 824620835, 606101862, '2016-11-29 10:30:45', '2016-11-29 10:30:45'),
(152, 14, 3, NULL, NULL, 1, 'software', 'Another Seeded Product', 'Sunt dolorem reprehenderit et sit.', 71.00, 100, 15, NULL, 'Lg', 'used', '"dolorem,unde,aut"', '{"images":["\\/img\\/pt-default\\/47.jpg","\\/img\\/pt-default\\/190.jpg","\\/img\\/pt-default\\/110.jpg","\\/img\\/pt-default\\/290.jpg","\\/img\\/pt-default\\/111.jpg"],"weight":"109 Gr","dimensions":"23 X 13 X 29 mm","color":"olive"}', 4.00, 5, 937383952, 648073668, '2016-11-29 10:30:47', '2016-11-29 10:30:47'),
(153, 14, 3, NULL, NULL, 1, 'software', 'More on Seeded Product', 'At est fuga qui dolores fuga quis.', 75.00, 100, 5, NULL, 'Microsoft', 'refurbished', '"deserunt,nihil,vitae"', '{"images":["\\/img\\/pt-default\\/179.jpg","\\/img\\/pt-default\\/75.jpg","\\/img\\/pt-default\\/286.jpg","\\/img\\/pt-default\\/79.jpg","\\/img\\/pt-default\\/199.jpg"],"weight":"121 Mg","dimensions":"29 X 26 X 22 cm","color":"white"}', 4.00, 5, 401075338, 149569146, '2016-11-29 10:30:47', '2016-11-29 10:30:47'),
(154, 8, 3, NULL, NULL, 1, 'key', 'VIRTUAL Operative intangible openarchitecture', 'Libero velit ea enim. Minima ut recusandae aut et id dolorem architecto impedit. Aut dolor aperiam voluptatem explicabo. Quam numquam nostrum rerum possimus in explicabo. Voluptas et accusantium sint quia atque laboriosam.\nQuis velit sunt eius quaerat. Aspernatur amet dignissimos aut ipsa in fugiat laudantium nobis.', 91.00, 21, 0, NULL, 'Apple', 'refurbished', '"deserunt,eaque,aliquam"', '{"images":["\\/img\\/\\/pt-default\\/138.jpg","\\/img\\/\\/pt-default\\/296.jpg","\\/img\\/\\/pt-default\\/263.jpg","\\/img\\/\\/pt-default\\/113.jpg","\\/img\\/\\/pt-default\\/270.jpg"]}', NULL, NULL, 310697243, 238314533, '2016-11-29 10:30:56', '2016-11-29 10:30:56'),
(155, 4, 3, NULL, NULL, 1, 'key', 'VIRTUAL Facetoface neutral service-desk', 'Repudiandae in nostrum consequatur beatae voluptatem deleniti ut. Velit ut qui vel id. Ex maiores qui dolor omnis. Ut ipsum reiciendis omnis voluptatibus iste vel sed. Alias nesciunt exercitationem nulla veniam.\nNeque reiciendis consequatur ea nihil et vitae. Est architecto impedit sapiente voluptatibus nisi. Laborum consequatur asperiores et quas.', 87.00, 38, 0, NULL, 'Lg', 'new', '"cupiditate,et,dignissimos"', '{"images":["\\/img\\/\\/pt-default\\/95.jpg","\\/img\\/\\/pt-default\\/305.jpg","\\/img\\/\\/pt-default\\/93.jpg","\\/img\\/\\/pt-default\\/212.jpg","\\/img\\/\\/pt-default\\/210.jpg"]}', NULL, NULL, 766207950, 56672035, '2016-11-29 10:31:00', '2016-11-29 10:31:00'),
(156, 1, 3, NULL, NULL, 1, 'key', 'VIRTUAL Configurable heuristic firmware', 'Tempora laborum cumque quo consequuntur laudantium. Laboriosam neque repellendus est fugit aperiam magnam. Odit eaque quaerat facilis et magni perferendis. Et dolorum ex et aspernatur sed.\nMollitia necessitatibus doloremque temporibus dolores delectus laborum. Porro provident doloribus molestiae eos minus. Dolor delectus consequatur debitis sit ipsa provident id. Minus ut ea sit necessitatibus numquam saepe.', 22.00, 35, 0, NULL, 'Gigabyte', 'used', '"ut,doloribus,esse"', '{"images":["\\/img\\/\\/pt-default\\/120.jpg","\\/img\\/\\/pt-default\\/52.jpg","\\/img\\/\\/pt-default\\/160.jpg","\\/img\\/\\/pt-default\\/312.jpg","\\/img\\/\\/pt-default\\/150.jpg"]}', NULL, NULL, 604875990, 943305051, '2016-11-29 10:31:06', '2016-11-29 10:31:06'),
(157, 3, 3, NULL, NULL, 1, 'key', 'VIRTUAL Visionary multi-tasking algorithm', 'Dolor dolores veritatis voluptatem aliquid possimus voluptatem. In libero quia quis tempora. Ipsam nisi inventore eligendi ratione iusto magni. Mollitia sed perspiciatis beatae sed sint ut.\nNemo molestias ut aspernatur sapiente quas et provident. Nemo assumenda iusto et omnis neque.\nMinima quia iste amet quasi blanditiis. Quas nulla alias tempora quaerat porro repellat error placeat. Repellendus fugiat iure illum voluptas magnam dolor. Blanditiis nam quibusdam consequuntur.', 75.00, 23, 0, NULL, 'Gigabyte', 'refurbished', '"vero,sit,blanditiis"', '{"images":["\\/img\\/\\/pt-default\\/136.jpg","\\/img\\/\\/pt-default\\/162.jpg","\\/img\\/\\/pt-default\\/4.jpg","\\/img\\/\\/pt-default\\/225.jpg","\\/img\\/\\/pt-default\\/213.jpg"]}', NULL, NULL, 425753001, 418359398, '2016-11-29 10:31:10', '2016-11-29 10:31:10'),
(158, 7, 3, NULL, NULL, 1, 'key', 'VIRTUAL Vision-oriented multi-tasking approach', 'Ab necessitatibus inventore eos veritatis repellat assumenda. Minima et error et sed hic et sed est. Quidem quos eligendi ducimus dolorem perspiciatis nostrum reiciendis. Placeat voluptatum qui molestias occaecati et.\nItaque autem soluta adipisci voluptate nostrum. Laboriosam non est architecto ut quasi aut est. Vitae beatae tempore nobis error. Totam officia aperiam quam sunt est quia. Magni omnis qui vel laboriosam ut natus inventore qui.', 30.00, 47, 0, NULL, 'Samsung', 'refurbished', '"architecto,unde,nam"', '{"images":["\\/img\\/\\/pt-default\\/205.jpg","\\/img\\/\\/pt-default\\/324.jpg","\\/img\\/\\/pt-default\\/128.jpg","\\/img\\/\\/pt-default\\/294.jpg","\\/img\\/\\/pt-default\\/130.jpg"]}', NULL, NULL, 788997010, 153013487, '2016-11-29 10:31:12', '2016-11-29 10:31:12'),
(159, 7, 3, NULL, NULL, 1, 'key', 'VIRTUAL Proactive modular migration', 'Asperiores ullam dolore voluptates omnis voluptatibus. Minus necessitatibus velit distinctio autem in ut sunt. Perspiciatis at fuga fuga vel. Est et enim temporibus est vel.\nVeniam consequuntur est ea consequuntur asperiores. Qui et error veritatis quia. Est quidem et accusamus. Sit voluptas adipisci quasi aut est.\nSequi dolorem qui molestias aut. Ut vero autem temporibus ut qui. Vero enim accusamus necessitatibus cupiditate nihil error consequatur dolorem. Amet iste et voluptate explicabo.', 89.00, 25, 0, NULL, 'Apple', 'used', '"qui,dicta,neque"', '{"images":["\\/img\\/\\/pt-default\\/220.jpg","\\/img\\/\\/pt-default\\/213.jpg","\\/img\\/\\/pt-default\\/168.jpg","\\/img\\/\\/pt-default\\/271.jpg","\\/img\\/\\/pt-default\\/274.jpg"]}', NULL, NULL, 466944670, 34632445, '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(160, 4, 3, NULL, NULL, 1, 'key', 'VIRTUAL Seamless high-level synergy', 'Omnis sunt minus maxime sunt magni dolores eaque odio. Sunt tenetur officia et esse.\nNatus soluta eaque a odit illum. Est et perferendis cumque culpa consectetur. Nam est excepturi quis cumque.\nFuga et reiciendis quidem rerum. Illum veritatis exercitationem aut rem molestias ut qui. Reiciendis qui sunt eos alias ut voluptatem et ad.', 3.00, 30, 0, NULL, 'Apple', 'used', '"ut,ea,recusandae"', '{"images":["\\/img\\/\\/pt-default\\/256.jpg","\\/img\\/\\/pt-default\\/20.jpg","\\/img\\/\\/pt-default\\/268.jpg","\\/img\\/\\/pt-default\\/206.jpg","\\/img\\/\\/pt-default\\/140.jpg"]}', NULL, NULL, 237967938, 185762555, '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(161, 5, 3, NULL, NULL, 1, 'key', 'VIRTUAL Public-key real-time groupware', 'Sequi tempora fugit laborum rerum minus. Eum nihil voluptas non ut. Officiis dolores nulla libero consequatur sint deleniti et.\nQuibusdam necessitatibus illo distinctio. Nostrum voluptatem porro suscipit ipsum facilis hic. Itaque sint adipisci repellat pariatur.\nDolorum at sed et. Et natus molestiae et voluptate voluptatibus saepe. Quis voluptatem laborum aut sunt quia provident non.', 12.00, 35, 0, NULL, 'Microsoft', 'refurbished', '"accusantium,aut,deleniti"', '{"images":["\\/img\\/\\/pt-default\\/185.jpg","\\/img\\/\\/pt-default\\/321.jpg","\\/img\\/\\/pt-default\\/19.jpg","\\/img\\/\\/pt-default\\/217.jpg","\\/img\\/\\/pt-default\\/41.jpg"]}', NULL, NULL, 134237180, 487137814, '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(162, 8, 3, NULL, NULL, 1, 'key', 'VIRTUAL Total holistic emulation', 'Exercitationem assumenda ipsam cupiditate aut amet natus. Reprehenderit consequatur et et corrupti veniam voluptas aut. Est saepe non architecto. Consequatur deleniti eos incidunt vel esse.\nTempora consequuntur facere dolorem vero iusto velit et. Velit ut qui ex. Nisi ut quam excepturi. Rem ut provident reiciendis quia quis saepe. Qui consequatur aperiam autem blanditiis.\nAut molestiae non consequatur et quam omnis quaerat. Perferendis sed voluptas rerum est.', 1.00, 38, 0, NULL, 'Apple', 'used', '"perferendis,sit,et"', '{"images":["\\/img\\/\\/pt-default\\/81.jpg","\\/img\\/\\/pt-default\\/329.jpg","\\/img\\/\\/pt-default\\/118.jpg","\\/img\\/\\/pt-default\\/271.jpg","\\/img\\/\\/pt-default\\/70.jpg"]}', NULL, NULL, 17950829, 11989398, '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(163, 3, 3, NULL, NULL, 1, 'key', 'VIRTUAL Innovative exuding software', 'Et sunt ratione aut enim expedita dolor aut. Perspiciatis perferendis pariatur facilis. Exercitationem quas quo quasi animi deserunt qui omnis. Est qui magni nemo hic.\nIn magni perspiciatis velit vero. Dignissimos quia asperiores quas. In vel non expedita iusto aliquid illo autem nam.\nDolor corrupti dolores earum saepe ea omnis aut eum. Ut sint et qui sint voluptate. Voluptas suscipit quis voluptas vero et voluptatibus accusamus. Excepturi omnis dolorem optio beatae quod fugit voluptatem.', 11.00, 32, 0, NULL, 'Gigabyte', 'used', '"odio,est,sed"', '{"images":["\\/img\\/\\/pt-default\\/51.jpg","\\/img\\/\\/pt-default\\/305.jpg","\\/img\\/\\/pt-default\\/195.jpg","\\/img\\/\\/pt-default\\/8.jpg","\\/img\\/\\/pt-default\\/39.jpg"]}', NULL, NULL, 922174907, 930282513, '2016-11-29 10:31:18', '2016-11-29 10:31:18');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `input_type` enum('text','select','radio','checkbox','image','document') COLLATE utf8_unicode_ci NOT NULL,
  `default_values` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validation_rules` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `help_message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_products` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `max_num_values` smallint(6) NOT NULL DEFAULT '1',
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `name`, `input_type`, `default_values`, `validation_rules`, `help_message`, `type_products`, `max_num_values`, `status`, `created_at`, `updated_at`) VALUES
(1, 'images', 'image', '{}', '{"images_1":"required_without_all:feature_images_2,feature_images_3,feature_images_4,feature_images_5,|","images_2":"required_without_all:feature_images_1,feature_images_3,feature_images_4,feature_images_5,|","images_3":"required_without_all:feature_image', '{}', 'all', 5, 'active', '2016-11-29 10:30:33', '2016-11-29 10:30:33'),
(2, 'virtual weight', 'text', '{}', '{}', '{}', 'key', 1, 'active', '2016-11-29 10:30:33', '2016-11-29 10:30:33'),
(3, 'OS', 'text', '{}', '{}', '{}', 'key', 1, 'active', '2016-11-29 10:30:34', '2016-11-29 10:30:34'),
(4, 'weight', 'text', '{}', '{}', '{}', 'item', 1, 'active', '2016-11-29 10:30:34', '2016-11-29 10:30:34'),
(5, 'dimensions', 'text', '{}', '{}', '{}', 'item', 1, 'active', '2016-11-29 10:30:34', '2016-11-29 10:30:34'),
(6, 'color', 'text', '{}', '{}', '{}', 'item', 1, 'active', '2016-11-29 10:30:34', '2016-11-29 10:30:34'),
(7, 'model', 'text', '{}', '{}', '{}', 'all', 1, 'active', '2016-11-29 10:30:34', '2016-11-29 10:30:34');

-- --------------------------------------------------------

--
-- Table structure for table `product_offers`
--

CREATE TABLE `product_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `day_start` datetime NOT NULL,
  `day_end` datetime NOT NULL,
  `percentage` double(2,2) NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_offers`
--

INSERT INTO `product_offers` (`id`, `product_id`, `day_start`, `day_end`, `percentage`, `price`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 3, '1971-11-26 22:26:36', '2017-05-28 17:34:48', 0.99, 34.3, 10, '2016-11-29 10:30:11', '2016-11-29 10:30:11'),
(2, 4, '2013-06-17 17:40:18', '2017-08-08 17:10:03', 0.99, 12.5, 19, '2016-11-29 10:30:12', '2016-11-29 10:30:12'),
(3, 7, '1997-05-25 23:26:40', '2016-12-19 20:29:46', 0.99, 18.55, 18, '2016-11-29 10:30:12', '2016-11-29 10:30:12'),
(4, 9, '2011-03-12 18:02:37', '2017-01-12 07:26:48', 0.99, 11.5, 12, '2016-11-29 10:30:12', '2016-11-29 10:30:12'),
(5, 10, '1996-02-12 19:55:29', '2017-07-06 07:25:30', 0.99, 7.35, 19, '2016-11-29 10:30:13', '2016-11-29 10:30:13'),
(6, 11, '1982-02-17 06:54:21', '2017-08-14 06:05:05', 0.99, 9.8, 14, '2016-11-29 10:30:13', '2016-11-29 10:30:13'),
(7, 12, '1982-11-28 10:17:58', '2017-06-23 15:41:34', 0.99, 32.2, 17, '2016-11-29 10:30:13', '2016-11-29 10:30:13'),
(8, 13, '1995-11-30 10:01:46', '2017-06-30 17:17:34', 0.99, 40.5, 21, '2016-11-29 10:30:13', '2016-11-29 10:30:13'),
(9, 14, '2008-06-13 07:36:26', '2017-11-08 09:58:29', 0.99, 3.6, 23, '2016-11-29 10:30:13', '2016-11-29 10:30:13'),
(10, 16, '2010-11-19 18:09:30', '2017-05-25 11:18:46', 0.99, 21.25, 25, '2016-11-29 10:30:13', '2016-11-29 10:30:13'),
(11, 18, '1970-12-21 16:18:57', '2017-06-14 09:44:52', 0.99, 9, 24, '2016-11-29 10:30:13', '2016-11-29 10:30:13'),
(12, 19, '2010-12-17 13:16:57', '2017-05-03 22:35:48', 0.99, 10.85, 16, '2016-11-29 10:30:14', '2016-11-29 10:30:14'),
(13, 22, '2012-10-13 16:22:16', '2017-06-17 23:15:17', 0.99, 26.5, 21, '2016-11-29 10:30:14', '2016-11-29 10:30:14'),
(14, 23, '2007-05-13 14:52:54', '2017-03-11 16:50:04', 0.99, 42, 11, '2016-11-29 10:30:14', '2016-11-29 10:30:14'),
(15, 25, '2014-08-07 13:57:11', '2017-05-15 08:23:18', 0.99, 2.4, 21, '2016-11-29 10:30:14', '2016-11-29 10:30:14'),
(16, 26, '2014-10-10 21:30:15', '2016-12-13 17:12:07', 0.99, 9.5, 21, '2016-11-29 10:30:14', '2016-11-29 10:30:14'),
(17, 27, '1989-07-18 06:56:39', '2017-01-17 14:50:19', 0.99, 7.9, 19, '2016-11-29 10:30:15', '2016-11-29 10:30:15'),
(18, 28, '2014-03-02 03:17:36', '2017-10-01 18:17:49', 0.99, 19.6, 18, '2016-11-29 10:30:15', '2016-11-29 10:30:15'),
(19, 29, '1987-05-17 18:46:56', '2017-01-20 18:29:03', 0.99, 14.1, 20, '2016-11-29 10:30:15', '2016-11-29 10:30:15'),
(20, 31, '2010-11-24 01:41:01', '2017-08-28 14:19:08', 0.99, 5.95, 18, '2016-11-29 10:30:16', '2016-11-29 10:30:16'),
(21, 32, '1987-12-16 21:38:22', '2016-12-09 11:40:03', 0.99, 1.75, 21, '2016-11-29 10:30:16', '2016-11-29 10:30:16'),
(22, 33, '2003-06-11 07:53:19', '2017-02-14 21:18:56', 0.99, 34.65, 16, '2016-11-29 10:30:16', '2016-11-29 10:30:16'),
(23, 34, '1981-03-09 23:48:04', '2017-08-04 03:07:36', 0.99, 12.25, 18, '2016-11-29 10:30:17', '2016-11-29 10:30:17'),
(24, 35, '1985-09-19 02:11:31', '2017-02-04 01:52:33', 0.99, 0.15, 22, '2016-11-29 10:30:17', '2016-11-29 10:30:17'),
(25, 37, '1992-01-13 17:08:12', '2017-02-08 15:19:13', 0.99, 1, 15, '2016-11-29 10:30:18', '2016-11-29 10:30:18'),
(26, 38, '1978-01-21 13:59:26', '2016-12-06 16:17:56', 0.99, 8.4, 23, '2016-11-29 10:30:18', '2016-11-29 10:30:18'),
(27, 41, '1993-05-10 00:53:37', '2017-02-09 12:00:10', 0.99, 9.8, 22, '2016-11-29 10:30:18', '2016-11-29 10:30:18'),
(28, 42, '1984-05-21 00:05:25', '2017-05-20 05:26:33', 0.99, 48, 13, '2016-11-29 10:30:19', '2016-11-29 10:30:19'),
(29, 45, '2006-09-03 16:51:34', '2017-10-04 11:37:47', 0.99, 49.5, 16, '2016-11-29 10:30:20', '2016-11-29 10:30:20'),
(30, 46, '1993-10-30 16:17:54', '2017-09-20 03:35:44', 0.99, 22.25, 17, '2016-11-29 10:30:21', '2016-11-29 10:30:21'),
(31, 47, '2013-12-19 02:53:32', '2017-02-07 04:07:36', 0.99, 18, 13, '2016-11-29 10:30:21', '2016-11-29 10:30:21'),
(32, 48, '1992-09-22 16:06:47', '2017-07-01 22:43:50', 0.99, 7.6, 24, '2016-11-29 10:30:21', '2016-11-29 10:30:21'),
(33, 49, '1982-04-17 05:35:12', '2017-09-01 15:16:41', 0.99, 15.4, 23, '2016-11-29 10:30:22', '2016-11-29 10:30:22'),
(34, 50, '1997-04-08 23:36:05', '2017-05-26 00:02:19', 0.99, 0.9, 19, '2016-11-29 10:30:22', '2016-11-29 10:30:22'),
(35, 53, '1983-07-11 03:38:00', '2017-06-18 10:54:24', 0.99, 6.5, 17, '2016-11-29 10:30:22', '2016-11-29 10:30:22'),
(36, 54, '1974-11-26 17:41:37', '2017-07-29 10:53:45', 0.99, 15, 16, '2016-11-29 10:30:22', '2016-11-29 10:30:22'),
(37, 56, '1986-02-18 15:50:08', '2017-01-20 11:00:31', 0.99, 3.6, 25, '2016-11-29 10:30:23', '2016-11-29 10:30:23'),
(38, 58, '2006-01-20 10:53:37', '2017-06-24 18:37:50', 0.99, 22.75, 11, '2016-11-29 10:30:23', '2016-11-29 10:30:23'),
(39, 59, '1996-09-25 01:14:49', '2017-11-21 04:34:51', 0.99, 14.25, 15, '2016-11-29 10:30:23', '2016-11-29 10:30:23'),
(40, 65, '2006-08-26 09:32:50', '2016-12-18 20:55:19', 0.99, 1.8, 13, '2016-11-29 10:30:24', '2016-11-29 10:30:24'),
(41, 66, '2007-07-29 14:55:03', '2017-07-24 18:31:40', 0.99, 15, 17, '2016-11-29 10:30:24', '2016-11-29 10:30:24'),
(42, 67, '1973-08-24 12:03:18', '2017-08-31 09:19:40', 0.99, 6.9, 15, '2016-11-29 10:30:24', '2016-11-29 10:30:24'),
(43, 74, '1980-06-23 21:21:34', '2017-04-22 04:37:58', 0.99, 48, 18, '2016-11-29 10:30:25', '2016-11-29 10:30:25'),
(44, 75, '2013-08-05 22:24:54', '2017-07-23 06:57:52', 0.99, 1.6, 20, '2016-11-29 10:30:25', '2016-11-29 10:30:25'),
(45, 76, '1995-08-20 03:58:57', '2017-06-12 20:27:50', 0.99, 1.5, 22, '2016-11-29 10:30:25', '2016-11-29 10:30:25'),
(46, 77, '2008-06-18 19:15:07', '2017-06-29 04:29:24', 0.99, 8.75, 15, '2016-11-29 10:30:26', '2016-11-29 10:30:26'),
(47, 78, '2004-04-08 20:55:25', '2017-01-08 20:10:24', 0.99, 7.35, 16, '2016-11-29 10:30:26', '2016-11-29 10:30:26'),
(48, 79, '1989-04-18 20:06:06', '2017-01-27 14:59:57', 0.99, 16, 13, '2016-11-29 10:30:26', '2016-11-29 10:30:26'),
(49, 80, '2005-06-18 10:14:50', '2016-12-05 18:21:44', 0.99, 1.65, 17, '2016-11-29 10:30:26', '2016-11-29 10:30:26'),
(50, 82, '1976-03-18 16:50:22', '2017-11-11 20:52:10', 0.99, 0.6, 11, '2016-11-29 10:30:26', '2016-11-29 10:30:26'),
(51, 84, '1974-02-25 01:49:31', '2017-08-09 20:50:18', 0.99, 6, 25, '2016-11-29 10:30:27', '2016-11-29 10:30:27'),
(52, 88, '1970-01-02 19:15:35', '2017-03-05 22:29:51', 0.99, 7.7, 15, '2016-11-29 10:30:27', '2016-11-29 10:30:27'),
(53, 89, '1989-01-28 02:43:11', '2017-07-20 00:08:16', 0.99, 26.95, 22, '2016-11-29 10:30:27', '2016-11-29 10:30:27'),
(54, 90, '2001-08-03 11:40:23', '2016-12-26 08:29:47', 0.99, 10.25, 19, '2016-11-29 10:30:27', '2016-11-29 10:30:27'),
(55, 93, '1981-08-24 04:18:14', '2017-11-01 07:16:35', 0.99, 49, 15, '2016-11-29 10:30:28', '2016-11-29 10:30:28'),
(56, 96, '1981-06-20 09:17:28', '2016-12-09 10:30:26', 0.99, 11.9, 21, '2016-11-29 10:30:28', '2016-11-29 10:30:28'),
(57, 99, '1976-06-04 05:51:31', '2017-03-09 10:19:28', 0.99, 2, 10, '2016-11-29 10:30:28', '2016-11-29 10:30:28'),
(58, 102, '2001-03-15 10:16:46', '2017-08-25 02:55:58', 0.99, 36, 11, '2016-11-29 10:30:28', '2016-11-29 10:30:28'),
(59, 103, '1989-02-10 15:43:40', '2017-10-02 06:34:05', 0.99, 16.45, 15, '2016-11-29 10:30:28', '2016-11-29 10:30:28'),
(60, 108, '1980-12-27 16:33:31', '2017-09-06 18:36:08', 0.99, 18.75, 14, '2016-11-29 10:30:29', '2016-11-29 10:30:29'),
(61, 111, '1978-08-27 10:39:25', '2017-03-31 04:52:12', 0.99, 4.2, 23, '2016-11-29 10:30:29', '2016-11-29 10:30:29'),
(62, 112, '1984-03-14 16:18:00', '2017-03-23 17:25:59', 0.99, 9.15, 15, '2016-11-29 10:30:29', '2016-11-29 10:30:29'),
(63, 114, '1986-12-27 23:48:05', '2016-12-06 05:26:26', 0.99, 20, 13, '2016-11-29 10:30:29', '2016-11-29 10:30:29'),
(64, 115, '2012-10-24 04:56:53', '2017-04-05 01:26:20', 0.99, 4.75, 14, '2016-11-29 10:30:30', '2016-11-29 10:30:30'),
(65, 119, '2010-01-04 05:05:08', '2017-05-15 10:43:00', 0.99, 5.5, 12, '2016-11-29 10:30:30', '2016-11-29 10:30:30'),
(66, 120, '2012-08-14 20:03:13', '2017-02-06 01:59:15', 0.99, 11, 21, '2016-11-29 10:30:30', '2016-11-29 10:30:30'),
(67, 121, '1981-06-10 02:34:25', '2017-10-25 01:32:00', 0.99, 8.05, 22, '2016-11-29 10:30:30', '2016-11-29 10:30:30'),
(68, 124, '1987-07-30 02:55:21', '2016-12-19 19:25:32', 0.99, 28, 22, '2016-11-29 10:30:30', '2016-11-29 10:30:30'),
(69, 126, '2007-07-18 17:02:09', '2017-09-09 18:52:52', 0.99, 10.15, 15, '2016-11-29 10:30:31', '2016-11-29 10:30:31'),
(70, 130, '2001-12-01 01:52:18', '2017-08-16 13:26:27', 0.99, 13.3, 14, '2016-11-29 10:30:31', '2016-11-29 10:30:31'),
(71, 134, '1981-01-07 19:32:19', '2017-11-03 10:44:59', 0.99, 9, 15, '2016-11-29 10:30:31', '2016-11-29 10:30:31'),
(72, 136, '2002-06-07 08:09:44', '2017-05-15 05:20:37', 0.99, 16, 22, '2016-11-29 10:30:31', '2016-11-29 10:30:31'),
(73, 137, '1987-06-17 09:12:44', '2017-01-15 18:25:16', 0.99, 10.85, 14, '2016-11-29 10:30:32', '2016-11-29 10:30:32'),
(74, 141, '1998-03-22 22:13:32', '2017-01-24 00:28:00', 0.99, 5.3, 19, '2016-11-29 10:30:32', '2016-11-29 10:30:32'),
(75, 142, '1984-10-15 05:14:01', '2017-03-26 04:41:04', 0.99, 15.05, 25, '2016-11-29 10:30:32', '2016-11-29 10:30:32'),
(76, 144, '1992-12-14 07:03:21', '2017-08-05 01:20:45', 0.99, 11.75, 22, '2016-11-29 10:30:32', '2016-11-29 10:30:32'),
(77, 145, '1977-12-06 19:18:59', '2017-04-25 07:39:19', 0.99, 26.25, 23, '2016-11-29 10:30:32', '2016-11-29 10:30:32'),
(78, 148, '1980-04-25 23:08:13', '2017-07-03 02:55:44', 0.99, 9.15, 12, '2016-11-29 10:30:33', '2016-11-29 10:30:33'),
(79, 150, '2005-08-15 22:30:37', '2017-11-27 03:19:28', 0.99, 1.75, 24, '2016-11-29 10:30:33', '2016-11-29 10:30:33');

-- --------------------------------------------------------

--
-- Table structure for table `type_preferences`
--

CREATE TABLE `type_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('string','date','json','number') COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `nickname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `pic_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `mobile_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate_val` int(11) DEFAULT NULL,
  `rate_count` int(11) DEFAULT NULL,
  `role` enum('admin','business','nonprofit','person') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'person',
  `type` enum('normal','trusted') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'normal',
  `verified` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `preferences` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `disabled_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nickname`, `email`, `password`, `pic_url`, `language`, `mobile_phone`, `work_phone`, `website`, `twitter`, `facebook`, `description`, `time_zone`, `rate_val`, `rate_count`, `role`, `type`, `verified`, `preferences`, `remember_token`, `created_at`, `updated_at`, `disabled_at`, `deleted_at`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$pjCVNGjqt6NpQ6B6wnnGbe8g.LFjmGmo/IOTwRTANXcSmbp3da1dS', '/img/profile/1/0c35898ad27e8c512556aa1ca5607c05.png', 'en', NULL, NULL, '', '@gocanto', 'gocanto', NULL, NULL, NULL, NULL, 'admin', 'trusted', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', 'HHMUfydGyuVQFlzaxSrMcQNF58YNHDOp5ORPzIWvRf76aS7FlNWadmrFcb2l', '2016-11-29 10:29:13', '2016-11-30 04:51:24', NULL, NULL),
(2, 'dev', 'dev@antvel.com', '$2y$10$pry7.hZvnalNf3Af5yIjYumqm3qPid37DYAsFLkkdDbfKD2Fhj72O', '/img/pt-default/4.jpg', 'en', NULL, NULL, NULL, '@_antvel', '_antvel', NULL, NULL, NULL, NULL, 'admin', 'trusted', 'no', NULL, NULL, '2016-11-29 10:29:13', '2016-11-29 10:29:13', NULL, NULL),
(3, 'antvelseller', 'seller@antvel.com', '$2y$10$DNiBa3PJ6p9M6UIVQlzt8ep4eQpUAYjMqmNcdPrFf21OHFq1Q.J1y', '/img/pt-default/6.jpg', 'en', NULL, NULL, NULL, '@seller', 'antvel seller', NULL, NULL, NULL, NULL, 'business', 'normal', 'no', '{"product_viewed":[{"tag":"\\"vero","updated_at":"2016-11-30 11:30:55"},{"tag":"ut","updated_at":"2016-11-30 11:30:55"},{"tag":"consequatur\\"","updated_at":"2016-11-30 11:30:55"}],"product_purchased":[],"product_shared":[],"product_categories":[1,3,4,5,10,', NULL, '2016-11-29 10:29:14', '2016-11-30 06:00:55', NULL, NULL),
(4, 'antvelbuyer', 'buyer@antvel.com', '$2y$10$b8YGQ1Ln7Te0eLBGpxuEfO56LfSaEPJG43T.DWDqPPk3IJaJJ2O9i', '/img/pt-default/3.jpg', 'en', NULL, NULL, NULL, '@buyer', 'buyer', NULL, NULL, NULL, NULL, 'person', 'normal', 'no', NULL, NULL, '2016-11-29 10:29:14', '2016-11-29 10:29:14', NULL, NULL),
(5, 'woodrow.walker', 'eturcotte@yahoo.com', '$2y$10$EynXtJSG866Ju/T2XdLL4O6MPjncVjFRQDEG5YwygREHUVf/TmKUi', '/img/pt-default/5.jpg', 'en', NULL, NULL, NULL, '@ortiz.kamron', 'anolan', NULL, NULL, NULL, NULL, 'person', 'normal', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', NULL, '2016-11-29 10:29:15', '2016-11-29 10:29:15', NULL, NULL),
(6, 'floy83', 'kade.okuneva@weimann.biz', '$2y$10$qPHxw7bvHwCejdozqHJkk.EYTOb9XA8l8ye/Yjbce6s3r2umWJHdy', '/img/pt-default/20.jpg', 'en', NULL, NULL, NULL, '@henderson.nikolaus', 'samara69', NULL, NULL, NULL, NULL, 'person', 'normal', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', NULL, '2016-11-29 10:29:15', '2016-11-29 10:29:15', NULL, NULL),
(7, 'alysha.cummings', 'amy.kutch@frami.com', '$2y$10$LwYgel4IXRJuTxIVqDgeueEA09gwuYePTmIwdezmLz1.6ilQCfKMW', '/img/pt-default/20.jpg', 'en', NULL, NULL, NULL, '@oswald.kunze', 'kacie19', NULL, NULL, NULL, NULL, 'person', 'normal', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', NULL, '2016-11-29 10:29:16', '2016-11-29 10:29:16', NULL, NULL),
(8, 'cherzog', 'rubie32@lebsack.com', '$2y$10$w6xo9pLpMjfaHKn1s4oq4es/3.c.qgPTxSceDAmPF28oGw9qLIFs2', '/img/pt-default/18.jpg', 'en', NULL, NULL, NULL, '@kschroeder', 'kristy.littel', NULL, NULL, NULL, NULL, 'person', 'normal', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', NULL, '2016-11-29 10:29:16', '2016-11-29 10:29:16', NULL, NULL),
(9, 'timmy65', 'nbayer@lang.com', '$2y$10$iIx0DpXTueBu3yMdUOmNAOsBu5fqnM6jXKGtshP0OupKZzcXjSegq', '/img/pt-default/5.jpg', 'en', NULL, NULL, NULL, '@gglover', 'giovanna.kuhn', NULL, NULL, NULL, NULL, 'person', 'normal', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', NULL, '2016-11-29 10:29:17', '2016-11-29 10:29:17', NULL, NULL),
(10, 'kareem.greenholt', 'ankunding.terrell@denesik.net', '$2y$10$PvlSi0r.rBGZQIi.UIjvH.lVICRV1x9QV5zxGgLO5FiC4TNZJRVNK', '/img/pt-default/7.jpg', 'en', NULL, NULL, NULL, '@rice.aryanna', 'vivian22', NULL, NULL, NULL, NULL, 'person', 'normal', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', NULL, '2016-11-29 10:29:17', '2016-11-29 10:29:17', NULL, NULL),
(11, 'lakin.destany', 'terrell58@hotmail.com', '$2y$10$bha4yvsQq7wJpnMYgcUap.9f/47YgIq21Xxn4Rm3V6HOV4i5V4x8G', '/img/pt-default/13.jpg', 'en', NULL, NULL, NULL, '@heathcote.carole', 'gorczany.angela', NULL, NULL, NULL, NULL, 'person', 'normal', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', NULL, '2016-11-29 10:29:18', '2016-11-29 10:29:18', NULL, NULL),
(12, 'dbuckridge', 'wisoky.ferne@hotmail.com', '$2y$10$ili2fZg9NMeHFCyhBVyr3ud36VZiNWy2ay2OI8q.TMrLg683TtGbW', '/img/pt-default/18.jpg', 'en', NULL, NULL, NULL, '@nharber', 'nbashirian', NULL, NULL, NULL, NULL, 'person', 'normal', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', NULL, '2016-11-29 10:29:18', '2016-11-29 10:29:18', NULL, NULL),
(13, 'marlee16', 'rjaskolski@jakubowski.net', '$2y$10$hSbsuAG46FEvNzJB5urECe1cZ1FWHzR.AqptwzCTLKFLcRxm.1jE6', '/img/pt-default/15.jpg', 'en', NULL, NULL, NULL, '@oblick', 'afritsch', NULL, NULL, NULL, NULL, 'person', 'normal', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', NULL, '2016-11-29 10:29:19', '2016-11-29 10:29:19', NULL, NULL),
(14, 'wmayert', 'aurelie.ziemann@hotmail.com', '$2y$10$nJkYNyyZDBPDSyW3tN0qYevt/yCdD8dSL8IGIoFxJnV.uFxcryuzy', '/img/pt-default/1.jpg', 'en', NULL, NULL, NULL, '@jolie.kassulke', 'reid67', NULL, NULL, NULL, NULL, 'person', 'normal', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', NULL, '2016-11-29 10:29:19', '2016-11-29 10:29:19', NULL, NULL),
(15, 'price.alvina', 'lockman.fleta@gleichner.com', '$2y$10$LhS7qqJ0wH8JDlGwn2ibaesz0FmLZu6IG1GugmO7tzUvm6zngbDFy', '/img/pt-default/7.jpg', 'en', NULL, NULL, NULL, '@Krajcik Inc', 'Krajcik Inc', NULL, NULL, NULL, NULL, 'business', 'normal', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', NULL, '2016-11-29 10:29:20', '2016-11-29 10:29:20', NULL, NULL),
(16, 'qmayert', 'edythe34@toy.net', '$2y$10$FrN50R.ZsVSzQX9NlQuyouAqbnkwZ/xlyhEwjyHMRM9inuVzWc5Xi', '/img/pt-default/18.jpg', 'en', NULL, NULL, NULL, '@Rutherford Inc', 'Rutherford Inc', NULL, NULL, NULL, NULL, 'business', 'normal', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', NULL, '2016-11-29 10:29:20', '2016-11-29 10:29:20', NULL, NULL),
(17, 'marquardt.terry', 'denesik.earlene@hotmail.com', '$2y$10$DKO6eL2tFntdjbXeKECWke3tg.BVVgrMOesoeGPAIgfnQxShBcQcK', '/img/pt-default/11.jpg', 'en', NULL, NULL, NULL, '@Wilkinson, Blanda and Quigley', 'Wilkinson, Blanda and Quigley', NULL, NULL, NULL, NULL, 'business', 'normal', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', NULL, '2016-11-29 10:29:21', '2016-11-29 10:29:21', NULL, NULL),
(18, 'uriel.schulist', 'pward@yahoo.com', '$2y$10$ErWdbnstx7Pfya4Cscjy9uhPw740oBRNmVnO8kGp3CcxmlU6V.2y.', '/img/pt-default/1.jpg', 'en', NULL, NULL, NULL, '@McClure, Jenkins and Satterfield', 'McClure, Jenkins and Satterfield', NULL, NULL, NULL, NULL, 'business', 'normal', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', NULL, '2016-11-29 10:29:21', '2016-11-29 10:29:21', NULL, NULL),
(19, 'williamson.lonny', 'ylowe@fadel.biz', '$2y$10$5HOAD0ZaZC52/HQoSPsuEOFeNXzQca7SsGVwEyHWb2lU1x/RTS.Ky', '/img/pt-default/17.jpg', 'en', NULL, NULL, NULL, '@Mills, Erdman and Reynolds', 'Mills, Erdman and Reynolds', NULL, NULL, NULL, NULL, 'business', 'trusted', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', NULL, '2016-11-29 10:29:22', '2016-11-29 10:29:22', NULL, NULL),
(20, 'rozella56', 'sosinski@jast.biz', '$2y$10$AwvdxTDVQgUpgKT.mrN5kOtQAYVZrgULstc2/mhllQvhPuwFNYVYi', '/img/pt-default/5.jpg', 'en', NULL, NULL, NULL, '@Schuppe-Pfannerstill', 'Schuppe-Pfannerstill', NULL, NULL, NULL, NULL, 'business', 'normal', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', NULL, '2016-11-29 10:29:22', '2016-11-29 10:29:22', NULL, NULL),
(21, 'antonina.kessler', 'rubie40@gmail.com', '$2y$10$657YJL.rnnR8nG0Nd/hcVO.GJg6STy5dh3AK0DaXezN3nJ2ZDtL5a', '/img/pt-default/7.jpg', 'en', NULL, NULL, NULL, '@Anderson-Ward', 'Anderson-Ward', NULL, NULL, NULL, NULL, 'business', 'normal', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', NULL, '2016-11-29 10:29:23', '2016-11-29 10:29:23', NULL, NULL),
(22, 'kmcdermott', 'ndoyle@reichert.org', '$2y$10$TsYZOB.FDMer9CF1qXweqeuVMeTIN5okl7LxfouMYaBffRnCmNWj2', '/img/pt-default/10.jpg', 'en', NULL, NULL, NULL, '@Corkery Ltd', 'Corkery Ltd', NULL, NULL, NULL, NULL, 'business', 'normal', 'no', '{"product_viewed":[],"product_purchased":[],"product_shared":[],"product_categories":[],"my_searches":[]}', NULL, '2016-11-29 10:29:23', '2016-11-29 10:29:23', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_points`
--

CREATE TABLE `user_points` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `action_type_id` int(10) UNSIGNED NOT NULL,
  `source_id` int(10) UNSIGNED NOT NULL,
  `points` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_points`
--

INSERT INTO `user_points` (`id`, `user_id`, `action_type_id`, `source_id`, `points`, `created_at`, `updated_at`) VALUES
(1, 4, 6, 1, 100, '2016-11-29 10:30:45', '2016-11-29 10:30:45'),
(2, 4, 6, 1, 100, '2016-11-29 10:30:45', '2016-11-29 10:30:45');

-- --------------------------------------------------------

--
-- Table structure for table `virtual_products`
--

CREATE TABLE `virtual_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `status` enum('cancelled','closed','open','paid','pending','received','sent') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `virtual_products`
--

INSERT INTO `virtual_products` (`id`, `product_id`, `key`, `url`, `amount`, `expiration_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 154, 'undefined', NULL, NULL, NULL, 'cancelled', '2016-11-29 10:30:56', '2016-11-29 10:30:56'),
(2, 154, 'c78eabdc-8207-3a5f-9075-caff7e6b0c0e', NULL, NULL, NULL, 'open', '2016-11-29 10:30:56', '2016-11-29 10:30:56'),
(3, 154, 'ec70bade-ce2f-3f82-952f-666e202f4420', NULL, NULL, NULL, 'open', '2016-11-29 10:30:56', '2016-11-29 10:30:56'),
(4, 154, 'c32dfc8b-8393-3318-8269-02b1983531f0', NULL, NULL, NULL, 'open', '2016-11-29 10:30:57', '2016-11-29 10:30:57'),
(5, 154, '2993494f-30d1-3dfa-8205-a339a4cc3370', NULL, NULL, NULL, 'open', '2016-11-29 10:30:57', '2016-11-29 10:30:57'),
(6, 154, 'd275d9a0-0bad-354d-bf82-fe3400541223', NULL, NULL, NULL, 'open', '2016-11-29 10:30:57', '2016-11-29 10:30:57'),
(7, 154, '99cc1729-504c-3f92-8512-14c30b038529', NULL, NULL, NULL, 'open', '2016-11-29 10:30:58', '2016-11-29 10:30:58'),
(8, 154, '3631d42b-11f9-350e-9aa8-298dec5f2f4d', NULL, NULL, NULL, 'open', '2016-11-29 10:30:58', '2016-11-29 10:30:58'),
(9, 154, '30eedf22-3f55-3e76-a464-2d9c23eb711b', NULL, NULL, NULL, 'open', '2016-11-29 10:30:58', '2016-11-29 10:30:58'),
(10, 154, '846c0825-d7a1-31f3-9f1c-103a0592a2ec', NULL, NULL, NULL, 'open', '2016-11-29 10:30:58', '2016-11-29 10:30:58'),
(11, 154, '887e7d8b-d989-321e-a7e8-ddcb7e65be57', NULL, NULL, NULL, 'open', '2016-11-29 10:30:58', '2016-11-29 10:30:58'),
(12, 154, '9b6b669b-8d73-3ec4-815a-6c9e03e385e6', NULL, NULL, NULL, 'open', '2016-11-29 10:30:58', '2016-11-29 10:30:58'),
(13, 154, '60286ec8-e6bb-36d0-94c4-31757584834b', NULL, NULL, NULL, 'open', '2016-11-29 10:30:59', '2016-11-29 10:30:59'),
(14, 154, 'acab3f53-1c00-3a6c-8bbc-e996a170670e', NULL, NULL, NULL, 'open', '2016-11-29 10:30:59', '2016-11-29 10:30:59'),
(15, 154, '023bec2f-4681-36c3-9a50-8b19af008693', NULL, NULL, NULL, 'open', '2016-11-29 10:30:59', '2016-11-29 10:30:59'),
(16, 154, 'c39323c5-b6d7-38ff-a41e-9cdb55c56f25', NULL, NULL, NULL, 'open', '2016-11-29 10:30:59', '2016-11-29 10:30:59'),
(17, 154, '20a62cc2-15a5-31e8-a3d4-e893620ec761', NULL, NULL, NULL, 'open', '2016-11-29 10:30:59', '2016-11-29 10:30:59'),
(18, 154, '6e461887-6779-34df-a9d6-e66729195813', NULL, NULL, NULL, 'open', '2016-11-29 10:30:59', '2016-11-29 10:30:59'),
(19, 154, '2cf71039-27df-380f-a32c-7dc160acc83f', NULL, NULL, NULL, 'open', '2016-11-29 10:31:00', '2016-11-29 10:31:00'),
(20, 154, 'd4697b36-b404-3eb4-bf2a-4c138fb5ee5a', NULL, NULL, NULL, 'open', '2016-11-29 10:31:00', '2016-11-29 10:31:00'),
(21, 154, '6e937254-b06c-3587-bc74-5f590ed069f2', NULL, NULL, NULL, 'open', '2016-11-29 10:31:00', '2016-11-29 10:31:00'),
(22, 155, 'undefined', NULL, NULL, NULL, 'cancelled', '2016-11-29 10:31:00', '2016-11-29 10:31:00'),
(23, 155, '0a4d0e9d-2987-39be-a22e-e7140fb329b0', NULL, NULL, NULL, 'open', '2016-11-29 10:31:01', '2016-11-29 10:31:01'),
(24, 155, '8210660b-698e-38a4-9fcf-f22a8a74fe5e', NULL, NULL, NULL, 'open', '2016-11-29 10:31:01', '2016-11-29 10:31:01'),
(25, 155, '39ea80f8-7929-3f16-bc2a-1c53990b1703', NULL, NULL, NULL, 'open', '2016-11-29 10:31:01', '2016-11-29 10:31:01'),
(26, 155, '8b2ea506-969a-377f-8255-b377a40693b6', NULL, NULL, NULL, 'open', '2016-11-29 10:31:01', '2016-11-29 10:31:01'),
(27, 155, '4f8de4aa-8d6d-3154-859c-a75fac1d688a', NULL, NULL, NULL, 'open', '2016-11-29 10:31:01', '2016-11-29 10:31:01'),
(28, 155, '321c2ad1-5dfe-3831-bb43-2cb2360cc868', NULL, NULL, NULL, 'open', '2016-11-29 10:31:01', '2016-11-29 10:31:01'),
(29, 155, '55319150-4c83-3ba6-b16e-7bbbcc242ceb', NULL, NULL, NULL, 'open', '2016-11-29 10:31:02', '2016-11-29 10:31:02'),
(30, 155, 'fb457d4d-4312-330e-b60a-b0407588b99d', NULL, NULL, NULL, 'open', '2016-11-29 10:31:02', '2016-11-29 10:31:02'),
(31, 155, '26814c86-7abf-3fa6-9d4a-f0ade159f25b', NULL, NULL, NULL, 'open', '2016-11-29 10:31:02', '2016-11-29 10:31:02'),
(32, 155, 'ea7135b8-2356-3dc5-a432-23ef5188ed4c', NULL, NULL, NULL, 'open', '2016-11-29 10:31:02', '2016-11-29 10:31:02'),
(33, 155, '679f4e0b-3df9-3e0c-bddf-8cfb85fcd901', NULL, NULL, NULL, 'open', '2016-11-29 10:31:02', '2016-11-29 10:31:02'),
(34, 155, '1204a384-aee6-3b86-8abf-974331b31c7b', NULL, NULL, NULL, 'open', '2016-11-29 10:31:02', '2016-11-29 10:31:02'),
(35, 155, '5246e9a1-4ae2-3e54-bab1-4d68115d01cd', NULL, NULL, NULL, 'open', '2016-11-29 10:31:03', '2016-11-29 10:31:03'),
(36, 155, '1da391ad-ae25-3cc4-8272-515933e17176', NULL, NULL, NULL, 'open', '2016-11-29 10:31:03', '2016-11-29 10:31:03'),
(37, 155, 'ab0a2d26-48fa-3c86-8fac-52b58a5afc3c', NULL, NULL, NULL, 'open', '2016-11-29 10:31:03', '2016-11-29 10:31:03'),
(38, 155, 'f699449f-91e4-3d23-a858-53cd37ac3f5a', NULL, NULL, NULL, 'open', '2016-11-29 10:31:03', '2016-11-29 10:31:03'),
(39, 155, 'fe46d6d3-e223-3358-bca2-ad56c0c666b2', NULL, NULL, NULL, 'open', '2016-11-29 10:31:03', '2016-11-29 10:31:03'),
(40, 155, 'b3aea042-c2e0-3486-a7bd-e31c1fbfb8a2', NULL, NULL, NULL, 'open', '2016-11-29 10:31:03', '2016-11-29 10:31:03'),
(41, 155, '7716d838-b08b-31b5-94bd-8514eb85910d', NULL, NULL, NULL, 'open', '2016-11-29 10:31:04', '2016-11-29 10:31:04'),
(42, 155, '3f87da5a-f6ff-3943-98cb-8f7089c65422', NULL, NULL, NULL, 'open', '2016-11-29 10:31:04', '2016-11-29 10:31:04'),
(43, 155, '442e996c-d1f7-3f12-82a0-14ddb738a0c6', NULL, NULL, NULL, 'open', '2016-11-29 10:31:04', '2016-11-29 10:31:04'),
(44, 155, '6febeffe-bc3b-332b-ae62-d5fff2bce883', NULL, NULL, NULL, 'open', '2016-11-29 10:31:04', '2016-11-29 10:31:04'),
(45, 155, '054a2513-bd56-3cc5-819f-b706747fb916', NULL, NULL, NULL, 'open', '2016-11-29 10:31:04', '2016-11-29 10:31:04'),
(46, 155, 'e1dd9840-e8c6-360c-a70b-fd000e46fd5c', NULL, NULL, NULL, 'open', '2016-11-29 10:31:04', '2016-11-29 10:31:04'),
(47, 155, 'f4163c1e-eb48-3952-965f-1a20832555f8', NULL, NULL, NULL, 'open', '2016-11-29 10:31:04', '2016-11-29 10:31:04'),
(48, 155, '83d07202-d249-306c-8f74-357936d60406', NULL, NULL, NULL, 'open', '2016-11-29 10:31:04', '2016-11-29 10:31:04'),
(49, 155, '8af0737d-8781-34fa-8941-e6a200c08bb7', NULL, NULL, NULL, 'open', '2016-11-29 10:31:05', '2016-11-29 10:31:05'),
(50, 155, 'c9234e96-99b2-3bfc-a14c-10d36372f99e', NULL, NULL, NULL, 'open', '2016-11-29 10:31:05', '2016-11-29 10:31:05'),
(51, 155, '5375aec9-bfdb-3ed5-a42b-11966976f6f6', NULL, NULL, NULL, 'open', '2016-11-29 10:31:05', '2016-11-29 10:31:05'),
(52, 155, 'bfcd23c6-c664-35f9-a169-60e4d54cf431', NULL, NULL, NULL, 'open', '2016-11-29 10:31:05', '2016-11-29 10:31:05'),
(53, 155, 'dfe9cb9f-b9ae-3d8a-9854-0da1fd909d66', NULL, NULL, NULL, 'open', '2016-11-29 10:31:05', '2016-11-29 10:31:05'),
(54, 155, '032d0ffa-072c-38c1-8f8b-9cc7a7794f78', NULL, NULL, NULL, 'open', '2016-11-29 10:31:05', '2016-11-29 10:31:05'),
(55, 155, 'deb231cc-9303-3d39-9c51-861418aa94c4', NULL, NULL, NULL, 'open', '2016-11-29 10:31:05', '2016-11-29 10:31:05'),
(56, 155, 'ed01de86-e3de-33ee-ab67-2ef52c945255', NULL, NULL, NULL, 'open', '2016-11-29 10:31:05', '2016-11-29 10:31:05'),
(57, 155, 'd4f213b4-8d2f-3a84-8830-1ea03f96f391', NULL, NULL, NULL, 'open', '2016-11-29 10:31:06', '2016-11-29 10:31:06'),
(58, 155, 'e4bf4a80-58ff-37bc-83cd-81e7a4ba41c6', NULL, NULL, NULL, 'open', '2016-11-29 10:31:06', '2016-11-29 10:31:06'),
(59, 155, '2aaf999b-12a0-3e3f-81a4-b16b4aeb25e9', NULL, NULL, NULL, 'open', '2016-11-29 10:31:06', '2016-11-29 10:31:06'),
(60, 156, 'undefined', NULL, NULL, NULL, 'cancelled', '2016-11-29 10:31:06', '2016-11-29 10:31:06'),
(61, 156, 'd3b241d0-ec38-3d7b-a1ac-d31407482fda', NULL, NULL, NULL, 'open', '2016-11-29 10:31:06', '2016-11-29 10:31:06'),
(62, 156, 'ab05d248-e676-339f-8629-fca9125b886b', NULL, NULL, NULL, 'open', '2016-11-29 10:31:06', '2016-11-29 10:31:06'),
(63, 156, 'ebb18495-76a0-3745-88ce-1feac85bedea', NULL, NULL, NULL, 'open', '2016-11-29 10:31:06', '2016-11-29 10:31:06'),
(64, 156, '502dbcdb-4e37-3e11-8cc6-a84bc37ca926', NULL, NULL, NULL, 'open', '2016-11-29 10:31:06', '2016-11-29 10:31:06'),
(65, 156, '8dd21cf4-a8dd-3a0c-a2b5-ac0c9106f6e1', NULL, NULL, NULL, 'open', '2016-11-29 10:31:06', '2016-11-29 10:31:06'),
(66, 156, '37e23cd1-a6a2-3f44-bce4-5a86f3e7aafb', NULL, NULL, NULL, 'open', '2016-11-29 10:31:07', '2016-11-29 10:31:07'),
(67, 156, '14aacfde-58d3-369b-82f5-9967d5450235', NULL, NULL, NULL, 'open', '2016-11-29 10:31:07', '2016-11-29 10:31:07'),
(68, 156, 'e6e115ba-fb94-3059-8c1f-47246d3df972', NULL, NULL, NULL, 'open', '2016-11-29 10:31:07', '2016-11-29 10:31:07'),
(69, 156, '9ff1f8ff-07fb-3854-ae77-287652771121', NULL, NULL, NULL, 'open', '2016-11-29 10:31:07', '2016-11-29 10:31:07'),
(70, 156, '04558383-2a46-3210-8675-b5aba4f2aab2', NULL, NULL, NULL, 'open', '2016-11-29 10:31:07', '2016-11-29 10:31:07'),
(71, 156, 'e167c7f9-e53f-3fa3-8842-ade407bce06a', NULL, NULL, NULL, 'open', '2016-11-29 10:31:07', '2016-11-29 10:31:07'),
(72, 156, '79d96481-a9b7-356f-a405-d1718f540452', NULL, NULL, NULL, 'open', '2016-11-29 10:31:07', '2016-11-29 10:31:07'),
(73, 156, '1876f35c-6795-38c7-82e8-12a8a0aaa3bc', NULL, NULL, NULL, 'open', '2016-11-29 10:31:07', '2016-11-29 10:31:07'),
(74, 156, '39330207-968e-38d7-9ea3-4e25149a5356', NULL, NULL, NULL, 'open', '2016-11-29 10:31:08', '2016-11-29 10:31:08'),
(75, 156, '100c0abb-b0f2-341a-940f-e081ff012a90', NULL, NULL, NULL, 'open', '2016-11-29 10:31:08', '2016-11-29 10:31:08'),
(76, 156, '7e370b0d-cea7-38b5-8c2b-c2700c7ca89f', NULL, NULL, NULL, 'open', '2016-11-29 10:31:08', '2016-11-29 10:31:08'),
(77, 156, '13a23fa4-74db-3368-9c24-d1624c1c65a5', NULL, NULL, NULL, 'open', '2016-11-29 10:31:08', '2016-11-29 10:31:08'),
(78, 156, '9ba59412-5935-34c7-a9d5-8619ea9280ff', NULL, NULL, NULL, 'open', '2016-11-29 10:31:08', '2016-11-29 10:31:08'),
(79, 156, '40a4eda5-5eed-3469-9822-807a9657d4eb', NULL, NULL, NULL, 'open', '2016-11-29 10:31:08', '2016-11-29 10:31:08'),
(80, 156, 'a020865e-8b96-3ffc-88e7-b04225d13df3', NULL, NULL, NULL, 'open', '2016-11-29 10:31:09', '2016-11-29 10:31:09'),
(81, 156, '88483620-e625-3dcb-93d5-86bfadd10b3c', NULL, NULL, NULL, 'open', '2016-11-29 10:31:09', '2016-11-29 10:31:09'),
(82, 156, '02082599-afcd-3444-8c9a-cc502a47c6de', NULL, NULL, NULL, 'open', '2016-11-29 10:31:09', '2016-11-29 10:31:09'),
(83, 156, '8977c2d4-7053-3cbd-b0cf-349cb6bc7c68', NULL, NULL, NULL, 'open', '2016-11-29 10:31:09', '2016-11-29 10:31:09'),
(84, 156, '942188ae-0b33-395f-bf19-e3282df71107', NULL, NULL, NULL, 'open', '2016-11-29 10:31:09', '2016-11-29 10:31:09'),
(85, 156, 'd24ffd80-deb1-345f-9b47-5c0b5ff61ee9', NULL, NULL, NULL, 'open', '2016-11-29 10:31:09', '2016-11-29 10:31:09'),
(86, 156, 'c6f2b263-2084-3962-8aea-9ab2634f3bc0', NULL, NULL, NULL, 'open', '2016-11-29 10:31:09', '2016-11-29 10:31:09'),
(87, 156, '406b21cf-b909-395e-bd3b-753dbcac431f', NULL, NULL, NULL, 'open', '2016-11-29 10:31:09', '2016-11-29 10:31:09'),
(88, 156, 'e2d04248-7fe3-36e0-9560-26fc6bb7906d', NULL, NULL, NULL, 'open', '2016-11-29 10:31:09', '2016-11-29 10:31:09'),
(89, 156, '3bf296f4-5146-302e-8778-b51541148052', NULL, NULL, NULL, 'open', '2016-11-29 10:31:09', '2016-11-29 10:31:09'),
(90, 156, '6a6d0b21-9b42-3ee7-bf5e-ac312f0130eb', NULL, NULL, NULL, 'open', '2016-11-29 10:31:10', '2016-11-29 10:31:10'),
(91, 156, 'e783668b-d2ad-31e6-9bde-39fb6625fe81', NULL, NULL, NULL, 'open', '2016-11-29 10:31:10', '2016-11-29 10:31:10'),
(92, 156, 'd42d1c81-a2db-39de-adc4-3edc5edd1d1d', NULL, NULL, NULL, 'open', '2016-11-29 10:31:10', '2016-11-29 10:31:10'),
(93, 156, 'a4e9200e-6f75-3588-9e11-004bc233217e', NULL, NULL, NULL, 'open', '2016-11-29 10:31:10', '2016-11-29 10:31:10'),
(94, 156, 'c89ecd4f-7a8c-3b22-835f-98a6a827952c', NULL, NULL, NULL, 'open', '2016-11-29 10:31:10', '2016-11-29 10:31:10'),
(95, 157, 'undefined', NULL, NULL, NULL, 'cancelled', '2016-11-29 10:31:10', '2016-11-29 10:31:10'),
(96, 157, 'fdda0dab-1c0c-36f1-a15a-f1a583dff10f', NULL, NULL, NULL, 'open', '2016-11-29 10:31:10', '2016-11-29 10:31:10'),
(97, 157, '7d5bed8d-5b2c-38bc-b34e-845c7d977c87', NULL, NULL, NULL, 'open', '2016-11-29 10:31:10', '2016-11-29 10:31:10'),
(98, 157, 'da1805eb-bd51-3632-a3c2-76e0b5a5abd3', NULL, NULL, NULL, 'open', '2016-11-29 10:31:10', '2016-11-29 10:31:10'),
(99, 157, '57184aff-2a38-3eea-8ebe-4b0dffe8a77a', NULL, NULL, NULL, 'open', '2016-11-29 10:31:10', '2016-11-29 10:31:10'),
(100, 157, 'bfcb271c-b7d9-33f6-b6ee-69bac60ce7e5', NULL, NULL, NULL, 'open', '2016-11-29 10:31:10', '2016-11-29 10:31:10'),
(101, 157, 'f76b9944-4406-3500-a261-f939efb0cf8a', NULL, NULL, NULL, 'open', '2016-11-29 10:31:11', '2016-11-29 10:31:11'),
(102, 157, '82d5e89d-e67d-362e-97d9-eb89d3ceac78', NULL, NULL, NULL, 'open', '2016-11-29 10:31:11', '2016-11-29 10:31:11'),
(103, 157, 'd39eaf87-400f-3c00-b7a4-09ef1b1f2e25', NULL, NULL, NULL, 'open', '2016-11-29 10:31:11', '2016-11-29 10:31:11'),
(104, 157, '1f9a6d02-ae50-3fb5-9b4a-4e5999136dbb', NULL, NULL, NULL, 'open', '2016-11-29 10:31:11', '2016-11-29 10:31:11'),
(105, 157, '3084a9c2-f76e-3bc3-a9a8-c1ecaee9b589', NULL, NULL, NULL, 'open', '2016-11-29 10:31:11', '2016-11-29 10:31:11'),
(106, 157, '61c50d2e-b3eb-3e0b-8740-7067333df412', NULL, NULL, NULL, 'open', '2016-11-29 10:31:11', '2016-11-29 10:31:11'),
(107, 157, 'f3cbbb59-b8e7-3da0-8adb-574e861414bd', NULL, NULL, NULL, 'open', '2016-11-29 10:31:11', '2016-11-29 10:31:11'),
(108, 157, 'ae7e6c24-488a-31a4-938c-a3452966b606', NULL, NULL, NULL, 'open', '2016-11-29 10:31:11', '2016-11-29 10:31:11'),
(109, 157, '3c2c593e-0c80-35f9-b552-3678effd0041', NULL, NULL, NULL, 'open', '2016-11-29 10:31:11', '2016-11-29 10:31:11'),
(110, 157, '536d5468-1c93-35c1-865e-2008f85e2b90', NULL, NULL, NULL, 'open', '2016-11-29 10:31:11', '2016-11-29 10:31:11'),
(111, 157, 'b233aaef-51e9-3563-94a4-578d99f5b835', NULL, NULL, NULL, 'open', '2016-11-29 10:31:11', '2016-11-29 10:31:11'),
(112, 157, '261b1ffb-eb2d-3806-9078-9e1bb35c714c', NULL, NULL, NULL, 'open', '2016-11-29 10:31:11', '2016-11-29 10:31:11'),
(113, 157, '155d1711-4b3d-3aed-b6b8-bdd63fd45309', NULL, NULL, NULL, 'open', '2016-11-29 10:31:11', '2016-11-29 10:31:11'),
(114, 157, '8d9faac4-c218-3a66-a41b-a6be8b58d248', NULL, NULL, NULL, 'open', '2016-11-29 10:31:12', '2016-11-29 10:31:12'),
(115, 157, 'bdf7c9d6-ab39-3660-9789-1e1a49cc8c50', NULL, NULL, NULL, 'open', '2016-11-29 10:31:12', '2016-11-29 10:31:12'),
(116, 157, 'ba3c1fec-9658-3d98-98e0-243372507223', NULL, NULL, NULL, 'open', '2016-11-29 10:31:12', '2016-11-29 10:31:12'),
(117, 157, '979ea118-f1e3-3053-b22d-5c2bb837bae7', NULL, NULL, NULL, 'open', '2016-11-29 10:31:12', '2016-11-29 10:31:12'),
(118, 158, 'undefined', NULL, NULL, NULL, 'cancelled', '2016-11-29 10:31:12', '2016-11-29 10:31:12'),
(119, 158, '0fc8021f-d377-362d-88ef-8b00f8f7a7f4', NULL, NULL, NULL, 'open', '2016-11-29 10:31:12', '2016-11-29 10:31:12'),
(120, 158, '5cea5318-23fd-326c-a10f-0a8ec852dcc6', NULL, NULL, NULL, 'open', '2016-11-29 10:31:12', '2016-11-29 10:31:12'),
(121, 158, '28ba8956-3e41-3ec8-88a1-9cac4b402424', NULL, NULL, NULL, 'open', '2016-11-29 10:31:12', '2016-11-29 10:31:12'),
(122, 158, '756fc99d-8b4a-350d-8214-17136d182b33', NULL, NULL, NULL, 'open', '2016-11-29 10:31:12', '2016-11-29 10:31:12'),
(123, 158, '4edcdd4c-1213-341a-9cc3-5e17b6bcf481', NULL, NULL, NULL, 'open', '2016-11-29 10:31:12', '2016-11-29 10:31:12'),
(124, 158, '3692a0f8-1fde-3a3b-a9f0-26b63e4b33cd', NULL, NULL, NULL, 'open', '2016-11-29 10:31:12', '2016-11-29 10:31:12'),
(125, 158, 'f65c6ae5-44a3-3cdd-a9e1-3630fdb3298e', NULL, NULL, NULL, 'open', '2016-11-29 10:31:12', '2016-11-29 10:31:12'),
(126, 158, 'b80193ef-4746-3c45-8d62-27df356447bb', NULL, NULL, NULL, 'open', '2016-11-29 10:31:12', '2016-11-29 10:31:12'),
(127, 158, '09ccb7c0-3d5e-349c-9810-71094a4581c2', NULL, NULL, NULL, 'open', '2016-11-29 10:31:12', '2016-11-29 10:31:12'),
(128, 158, '32d0fbff-c8ec-3fed-94d0-eeab020dbfde', NULL, NULL, NULL, 'open', '2016-11-29 10:31:12', '2016-11-29 10:31:12'),
(129, 158, '473e2422-28c8-3bc3-9429-c6798ca0b195', NULL, NULL, NULL, 'open', '2016-11-29 10:31:12', '2016-11-29 10:31:12'),
(130, 158, 'fd04797d-8dcf-31c3-a9f6-bea146768b23', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(131, 158, '963b0316-6675-3bb0-ad14-b5b53e116420', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(132, 158, 'fe653b3b-c5ed-3399-8a15-37ea48415f39', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(133, 158, '3cf4883d-a344-36f3-807a-90a762c73fec', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(134, 158, '7d8ebb94-bdbb-3baf-8736-1af86c2302fc', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(135, 158, '2f38ee9d-cbf0-3847-ab48-94562da16a75', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(136, 158, 'b32a045d-2432-3dfe-ae53-083642e6dd1a', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(137, 158, 'eebd0fe6-57f7-31ca-9e0a-ce64753c0185', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(138, 158, '01df3364-c3d3-3d72-be2d-4ef35837973a', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(139, 158, 'd54db6b4-6a15-31f8-b413-b1a9019dc064', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(140, 158, '3fdfd12c-5290-327b-a72d-c2f2aaf0e184', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(141, 158, 'ea491a65-7276-3b2b-8683-3ed9dc40b85e', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(142, 158, '14e671f8-b20e-3467-96d1-5179727b2a47', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(143, 158, '6c02bda9-5a93-3d10-9c4a-8ea40c288ee4', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(144, 158, 'bc57a8a1-b2fa-349a-8bf2-fe0349e1eba5', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(145, 158, '0986b97a-83e8-38f1-8c84-1a4bf1c9856b', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(146, 158, 'a96cd75e-c9be-3e9b-9cb0-5cdffc046633', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(147, 158, '6abfb6c7-48b3-37dd-b828-5fe0ef499302', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(148, 158, '53cf483c-4a54-3fbb-b381-f1bb3cfb63b3', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(149, 158, 'ef79663b-3fdc-35f1-958e-7d5091e082c1', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(150, 158, 'ebfb92bd-a3ed-35c1-a44d-8f8d168cec7f', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(151, 158, 'ee75153b-c67a-3f87-8e14-44108b5e01de', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(152, 158, '41c61caf-b087-3a55-b443-b48abf96237a', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(153, 158, '6d5bc7c5-0af8-3fd3-8370-1943a4248fac', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(154, 158, 'f12eee30-d788-3dac-98b9-68a298217d8b', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(155, 158, '6d764a13-5e05-3503-8ccb-e00a69258997', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(156, 158, '9403140e-1201-3ad1-9d36-a86daf9f21ab', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(157, 158, '63aca122-43a7-3f93-b916-bdeeb367b65f', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(158, 158, '7022b690-6096-35c9-bd6e-f87f2aa9d89d', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(159, 158, '9f535c76-4824-3dcc-9fea-f6e98259ff76', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(160, 158, '8f93436f-19eb-38d4-bdc8-1eaf83661a70', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(161, 158, 'efde059c-f996-3e98-a27c-fabd85449b4b', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(162, 158, '772b6411-d4be-3671-ac6b-183d3d1763e7', NULL, NULL, NULL, 'open', '2016-11-29 10:31:13', '2016-11-29 10:31:13'),
(163, 158, '8ee18e40-718c-38eb-ad45-f1e897d2dbdb', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(164, 158, '8937c3b9-e275-3482-8ebc-622f81556bdb', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(165, 159, 'undefined', NULL, NULL, NULL, 'cancelled', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(166, 159, 'b263cb20-be88-3698-9222-c5e2df88c254', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(167, 159, '5ac96ab6-7678-372d-8173-1309a39d72ce', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(168, 159, '204fe8ac-9fe4-31ab-b130-82d3a4f27a9c', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(169, 159, '9daed490-6b26-322a-98cf-b7d69ea2ad34', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(170, 159, 'e32a5b26-6a38-3764-9feb-fd58b30b9100', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(171, 159, '3ace446d-d4ad-3402-9bf9-95e51fb2c58a', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(172, 159, 'ce621f7b-1c89-357f-9a27-0fd9fa92a997', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(173, 159, 'b4ff22d8-7356-350a-8e00-ca7dabed2b65', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(174, 159, 'ed5f0509-79ea-38e1-92dd-4aeb35c3a4c4', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(175, 159, '3666e7f8-1152-3b1b-8d85-bb6888ed5bb5', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(176, 159, '9c2ad87f-ab40-3d54-a6ab-3d973bd8010f', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(177, 159, '86a63158-4a20-34bc-bc7b-7c6b25767bc0', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(178, 159, 'a8ba9783-bf64-3135-8126-c75a92fe42fb', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(179, 159, 'f0e18674-972a-3094-83f8-a48b2109a637', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(180, 159, 'f1aa3175-f1f8-36d1-ab74-412aa0373f7a', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(181, 159, 'aaadb36a-f0b1-3adb-b00f-6915540ba255', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(182, 159, '091a4e33-97b5-36f3-ab5e-1ecfda1f656f', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(183, 159, '34d9fc33-4d5c-324f-9766-73fff36e32ea', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(184, 159, '6b1d9b7f-4c4b-336f-b665-b09db6cb4141', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(185, 159, 'aa96facc-6ca9-39ca-9011-1f3ec99b6959', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(186, 159, 'fb328b24-ba39-3d0c-ab0b-6c772abe3d6a', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(187, 159, 'a9b6a4f6-19de-3426-9677-69dd6516cb96', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(188, 159, '17d881ce-2e87-3ca7-a311-201f025ea6ca', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(189, 159, '75d8e77b-f33a-359c-aa98-10b01fab2bf5', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(190, 160, 'undefined', NULL, NULL, NULL, 'cancelled', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(191, 160, '2534e74b-280f-32e0-9dee-f56f76a9d4db', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(192, 160, 'e77b1c52-fadf-3e97-89ce-6817af087701', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(193, 160, '0f9c4746-b5a4-3ba2-b024-ef713c5272b9', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(194, 160, '142113bd-0308-34db-add8-a8538d117784', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(195, 160, '628638bd-4b4e-3733-a905-8854ab1e9b2c', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(196, 160, '7ec3e3c4-664b-3520-8e89-5446ea1faaea', NULL, NULL, NULL, 'open', '2016-11-29 10:31:14', '2016-11-29 10:31:14'),
(197, 160, 'b5ba1ff6-3375-3aa3-b191-e7f080c26135', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(198, 160, '9787d522-33cf-3c0d-bef0-eb96b3088b6b', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(199, 160, 'b688d6ee-4892-3f83-bbe1-9d3f0472252f', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(200, 160, '1fcb6e36-e358-3505-9d89-cc7e13fba6bb', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(201, 160, '31775568-29e8-3acc-8c3e-055abe2b5559', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(202, 160, '268c48f4-c930-3185-b8c7-a155344ef4cf', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(203, 160, 'bc0b023d-3de5-3038-be24-ad8dc68c74c3', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(204, 160, '15e882f5-a130-334b-a994-8880a7478ed2', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(205, 160, 'fcbd5605-c066-31a7-893f-b6e632f8d93e', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(206, 160, '932a4a77-691a-3d1c-9501-a2fb7b6905aa', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(207, 160, 'fd929abb-e54e-3db0-a63b-4b7902116e08', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(208, 160, '96ba2ae5-3fb8-35f4-9929-eeba40c971e4', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(209, 160, 'fc5a6fb3-15fc-391f-b41f-9f3cc09f9197', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(210, 160, '28a74bd2-612b-3b92-a344-61bc4ce0dc52', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(211, 160, 'dc7640b8-c46a-3917-a2ec-d444202a5953', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(212, 160, 'cb84d1e5-db5b-37a6-a2a0-35d1f2c8198f', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(213, 160, '7cf7ab3d-4817-37c5-971a-62d7c14e3996', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(214, 160, '77810ca9-17eb-3403-b51b-6bf9868da867', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(215, 160, '80c6f878-bca9-39f8-a001-09a60448112c', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(216, 160, '5a29fcd9-761d-357c-98d9-c0effcd6aca6', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(217, 160, '6110dd89-6ec5-347f-a9e8-2ab9fb48134c', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(218, 160, '59a8d227-4717-30b1-b449-e1095cd12785', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(219, 160, 'a1ddd009-184b-37a4-b702-cddb9f48ae48', NULL, NULL, NULL, 'open', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(220, 161, 'undefined', NULL, NULL, NULL, 'cancelled', '2016-11-29 10:31:15', '2016-11-29 10:31:15'),
(221, 161, '0d9bd108-ce98-38f0-b0c1-a0d0797d3f36', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(222, 161, 'd200fb8f-e297-3899-9be9-9bfed9bcb5d2', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(223, 161, '87dd6bb8-a7cb-3d7b-b711-bc2a8a75ddcd', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(224, 161, 'f5f58912-729c-36f0-b1c6-c69a0d8f1128', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(225, 161, '0127c334-f6fd-33a5-aa1f-e947ccfba5dc', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(226, 161, '9a60807c-ceba-3eef-bec2-8273dde3d955', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(227, 161, 'acf1843b-8672-3c26-b877-b71e53eefe29', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(228, 161, '90b929d6-aa8c-32d8-afe8-bd08469a424f', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(229, 161, 'bd971740-0d64-3f63-83d7-38c404fde356', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(230, 161, '681e4085-0e22-3f21-a9ae-ec67282d50b8', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(231, 161, '3e63c186-7031-3c6e-b008-21a131e1ed91', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(232, 161, 'a42360d0-5b21-3346-ae1c-cf55ea053bdc', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(233, 161, 'e3d3df4e-fb29-3c8c-8d77-10d46e265dc6', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(234, 161, 'c166bc65-f8bb-360e-821e-b0a65ae879f8', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(235, 161, 'b854c168-f718-3fc8-b70b-719d29a392af', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(236, 161, '626b7d73-666e-3ef1-a17f-cbcc51c00b44', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(237, 161, 'c1e670ed-3ff1-32ff-986f-b520ca41dfd0', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(238, 161, '2a3350f4-5b4a-3140-9270-8404eb148f34', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(239, 161, 'ed7f423b-75c3-336c-b209-6c0b14f02d38', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(240, 161, '9828001e-5261-3db8-b67b-58962fc4893f', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(241, 161, '8d2022a7-7002-3ae8-8c94-692821a87c48', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(242, 161, '18d3d357-7612-3d63-8104-18626e1f465d', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(243, 161, 'ffd8578a-2dee-351f-8b6c-18bb8673c5e8', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(244, 161, '5203b07a-34eb-366e-be84-1da52d9e711e', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(245, 161, '91097d90-089e-30ae-9c61-bcd5171760a8', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(246, 161, 'e6c6cd4c-03a5-3223-9385-f62f437c6eb0', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(247, 161, '5621d987-e765-3010-bf8f-a19a2ad358fb', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(248, 161, '2083bf04-b863-37e9-b2bf-b18d77e2a85b', NULL, NULL, NULL, 'open', '2016-11-29 10:31:16', '2016-11-29 10:31:16'),
(249, 161, '93a9a5e6-87ec-3ce0-89be-5650046d06e6', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(250, 161, 'f5f20dca-84ab-382e-80cc-d285584e242b', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(251, 161, 'f62c192d-e5f1-3b0c-a5f0-38a3583b2c53', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(252, 161, '293e1e01-8f28-3492-b559-e2753952ca07', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(253, 161, '71e6f631-4dbf-3ea7-90df-10fe003f38dd', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(254, 161, '071d7a75-1b6f-3c69-8bbb-d5928208f87c', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(255, 162, 'undefined', NULL, NULL, NULL, 'cancelled', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(256, 162, '26415745-e270-35c3-adce-f078af7e67c7', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(257, 162, '39fed236-4a35-3fff-8021-86854b40967e', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(258, 162, 'ee34b4a8-3444-3608-944a-0bb458ffe2c6', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(259, 162, '8654fb8b-ee22-3088-8b2f-2edf77fd32ed', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(260, 162, '5b6550d9-ad85-32b1-98ae-ec381559c9f2', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(261, 162, 'cbc31b97-511f-3bcf-a7ee-2dae9ece8dcf', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(262, 162, 'db2c2cc2-c9f6-3c04-9324-2e9d6df14070', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(263, 162, '9ab36370-a029-3320-b413-6ff1416cd2f9', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(264, 162, '2a5c5745-1d2d-3397-9cc9-17a2dc3ad0f6', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(265, 162, '51c44977-9b99-3bda-be43-2391605e21e3', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(266, 162, 'e9721ebb-ecc7-331a-8738-f5c716d5408d', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(267, 162, 'a63adc34-d307-37b4-9a8e-c020cc81199f', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(268, 162, '7c377436-685f-3b61-a6d0-3530aaf6d59c', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(269, 162, 'd0dcb252-26d2-3139-95b8-e683f627b03c', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(270, 162, 'aeed74ca-9903-3abc-88e3-9c3a3d32f41c', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(271, 162, '50cfea40-c15e-3c5b-a83a-9686f307864d', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(272, 162, 'b07a2385-91ef-38e2-8f7c-1dc9d661b19f', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(273, 162, '6e7f1585-af33-3445-a50f-a9ecfb26c8b2', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(274, 162, '34971974-2ec1-3a32-b291-ea095ebeecdf', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(275, 162, '72b8b0d7-580f-3404-8ebc-9969e3c770ff', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(276, 162, '2fe00671-0007-39dd-895d-87a81a41dd5c', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(277, 162, '84145b73-6133-3d25-89d0-34c894cfbf86', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(278, 162, '8c7aa679-56fa-3083-8231-fb540a8fdb1f', NULL, NULL, NULL, 'open', '2016-11-29 10:31:17', '2016-11-29 10:31:17'),
(279, 162, '409c8efd-5187-3fce-9f81-550eb310c7ed', NULL, NULL, NULL, 'open', '2016-11-29 10:31:18', '2016-11-29 10:31:18'),
(280, 162, 'f1612702-81cd-3e89-9693-8cc9cf7550be', NULL, NULL, NULL, 'open', '2016-11-29 10:31:18', '2016-11-29 10:31:18'),
(281, 162, 'e1bb03dc-cfab-3a51-87cc-a5b81309ba21', NULL, NULL, NULL, 'open', '2016-11-29 10:31:18', '2016-11-29 10:31:18'),
(282, 162, '252d3983-90c0-3061-b754-1517d38ccc0a', NULL, NULL, NULL, 'open', '2016-11-29 10:31:18', '2016-11-29 10:31:18'),
(283, 162, 'b1bf575f-108e-3ff1-aeb2-cefa30934520', NULL, NULL, NULL, 'open', '2016-11-29 10:31:18', '2016-11-29 10:31:18'),
(284, 162, 'e7e0119c-e6ab-30cc-a509-8114a19cf727', NULL, NULL, NULL, 'open', '2016-11-29 10:31:18', '2016-11-29 10:31:18'),
(285, 162, '553d9e1b-6247-3379-817e-caad61888026', NULL, NULL, NULL, 'open', '2016-11-29 10:31:18', '2016-11-29 10:31:18'),
(286, 162, '667f2cb0-d5c8-350e-864d-dd1136805e13', NULL, NULL, NULL, 'open', '2016-11-29 10:31:18', '2016-11-29 10:31:18'),
(287, 162, '87582bc6-7f19-35a0-89d6-656fc7b7d64c', NULL, NULL, NULL, 'open', '2016-11-29 10:31:18', '2016-11-29 10:31:18'),
(288, 162, 'd44ab908-9888-3021-bbb4-5c9bbcc2a751', NULL, NULL, NULL, 'open', '2016-11-29 10:31:18', '2016-11-29 10:31:18'),
(289, 162, 'e3c67d74-663b-3e82-8297-4696adc821da', NULL, NULL, NULL, 'open', '2016-11-29 10:31:18', '2016-11-29 10:31:18'),
(290, 162, '5dc83183-12cf-369e-91ed-d6d0900d3da8', NULL, NULL, NULL, 'open', '2016-11-29 10:31:18', '2016-11-29 10:31:18'),
(291, 162, '846ff5d7-bf8c-30b5-8dc4-5f93db07bcc4', NULL, NULL, NULL, 'open', '2016-11-29 10:31:18', '2016-11-29 10:31:18'),
(292, 162, 'cc6032a6-393b-3d46-848f-ae4ba4e8094e', NULL, NULL, NULL, 'open', '2016-11-29 10:31:18', '2016-11-29 10:31:18'),
(293, 163, 'undefined', NULL, NULL, NULL, 'cancelled', '2016-11-29 10:31:18', '2016-11-29 10:31:18'),
(294, 163, '2b4e3a18-1307-34f8-af3e-0c591d1af1b2', NULL, NULL, NULL, 'open', '2016-11-29 10:31:18', '2016-11-29 10:31:18'),
(295, 163, '2385ebab-9cfa-36f0-a4cc-340c41e13f48', NULL, NULL, NULL, 'open', '2016-11-29 10:31:18', '2016-11-29 10:31:18'),
(296, 163, '0c9d58a8-b723-3f6d-b086-c290a22d6ae2', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(297, 163, '37f9a76f-ab63-38c2-9614-4c4650c1e2e4', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(298, 163, 'ae92c532-d2d1-3226-b723-5fe7052a6a55', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(299, 163, '8c85ff71-bf14-3144-a580-607d383a2e91', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(300, 163, 'c258b347-1d28-3254-b63a-e21e812dbc6a', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(301, 163, '91a0b1b6-a3a9-378e-938e-fe290a30e35f', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(302, 163, '92e5d7e1-eaef-3a9d-aebc-530fc3a7370f', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(303, 163, '966b7233-0743-389d-bbd5-fea8415e0e04', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(304, 163, '9613ba15-c474-3653-aa25-43c3acf63bda', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(305, 163, '75274899-10b9-3719-88b7-618cd7ec914d', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(306, 163, '70c78d75-3b30-3af6-8083-a4a35f56ad06', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(307, 163, '503f3231-b82e-3e70-b624-65b69c9d3a92', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(308, 163, '25297684-e417-3ad4-accc-80abd3e5d55d', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(309, 163, '50ca0177-2441-3251-ab73-e1f609290f60', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(310, 163, '1301420f-4f23-309f-afc7-83544a6a02ef', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(311, 163, '097a2f94-2c33-31d5-8ec5-db7add4ac894', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(312, 163, 'a01d6b45-5b66-3cb0-8416-35bb2ba062a6', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(313, 163, 'e7bca80e-2057-3007-8950-72e2a3f555c1', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(314, 163, '2f9af833-8773-377d-93e4-f8d6a795d7bd', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(315, 163, '8debb85b-02e0-3494-a56b-78765ee26e60', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(316, 163, '658fbccb-b33a-32a8-97a6-78c972514d3b', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(317, 163, '15162494-5923-3f03-80be-e747124350bd', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(318, 163, '4b0a3350-ce55-3eec-87ff-d7c8997baa96', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(319, 163, '51a2d72a-f9a1-3ac7-a3b9-4a421287e295', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(320, 163, '15af59d6-44bd-37c4-9395-58ce27b09d80', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(321, 163, 'ab77634f-f485-318a-a243-651e048421ef', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(322, 163, '04666300-d095-3b04-84c5-10461d342c8e', NULL, NULL, NULL, 'open', '2016-11-29 10:31:19', '2016-11-29 10:31:19'),
(323, 163, 'acdd5f41-5f61-3b00-86b2-5e2ab58f4c57', NULL, NULL, NULL, 'open', '2016-11-29 10:31:20', '2016-11-29 10:31:20'),
(324, 163, 'df8f70e7-953e-3b5d-8a16-714c23f3befc', NULL, NULL, NULL, 'open', '2016-11-29 10:31:20', '2016-11-29 10:31:20');

-- --------------------------------------------------------

--
-- Table structure for table `virtual_product_orders`
--

CREATE TABLE `virtual_product_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `virtual_product_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `action_types`
--
ALTER TABLE `action_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `businesses`
--
ALTER TABLE `businesses`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_action_type_id_foreign` (`action_type_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_email_unique` (`email`);

--
-- Indexes for table `company_features`
--
ALTER TABLE `company_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_features_company_id_foreign` (`company_id`);

--
-- Indexes for table `freeproducts`
--
ALTER TABLE `freeproducts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `freeproducts_user_id_index` (`user_id`);

--
-- Indexes for table `freeproduct_order`
--
ALTER TABLE `freeproduct_order`
  ADD KEY `freeproduct_order_freeproduct_id_index` (`freeproduct_id`),
  ADD KEY `freeproduct_order_order_id_index` (`order_id`);

--
-- Indexes for table `freeproduct_participants`
--
ALTER TABLE `freeproduct_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `freeproduct_participants_user_id_foreign` (`user_id`),
  ADD KEY `freeproduct_participants_freeproduct_id_foreign` (`freeproduct_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logs_action_type_id_foreign` (`action_type_id`),
  ADD KEY `logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notices_user_id_foreign` (`user_id`),
  ADD KEY `notices_sender_id_foreign` (`sender_id`),
  ADD KEY `notices_action_type_id_foreign` (`action_type_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_address_id_foreign` (`address_id`),
  ADD KEY `orders_seller_id_foreign` (`seller_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `paypal_orders`
--
ALTER TABLE `paypal_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paypal_orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_offers`
--
ALTER TABLE `product_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_offers_product_id_foreign` (`product_id`);

--
-- Indexes for table `type_preferences`
--
ALTER TABLE `type_preferences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_nickname_unique` (`nickname`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_points`
--
ALTER TABLE `user_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_points_action_type_id_foreign` (`action_type_id`),
  ADD KEY `user_points_user_id_index` (`user_id`);

--
-- Indexes for table `virtual_products`
--
ALTER TABLE `virtual_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `virtual_product_orders`
--
ALTER TABLE `virtual_product_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `virtual_product_orders_order_id_foreign` (`order_id`),
  ADD KEY `virtual_product_orders_virtual_product_id_foreign` (`virtual_product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `company_features`
--
ALTER TABLE `company_features`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `freeproducts`
--
ALTER TABLE `freeproducts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `freeproduct_participants`
--
ALTER TABLE `freeproduct_participants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT for table `paypal_orders`
--
ALTER TABLE `paypal_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;
--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `product_offers`
--
ALTER TABLE `product_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT for table `type_preferences`
--
ALTER TABLE `type_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `user_points`
--
ALTER TABLE `user_points`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `virtual_products`
--
ALTER TABLE `virtual_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=325;
--
-- AUTO_INCREMENT for table `virtual_product_orders`
--
ALTER TABLE `virtual_product_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `businesses`
--
ALTER TABLE `businesses`
  ADD CONSTRAINT `businesses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_action_type_id_foreign` FOREIGN KEY (`action_type_id`) REFERENCES `action_types` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `company_features`
--
ALTER TABLE `company_features`
  ADD CONSTRAINT `company_features_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `freeproducts`
--
ALTER TABLE `freeproducts`
  ADD CONSTRAINT `freeproducts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `freeproduct_order`
--
ALTER TABLE `freeproduct_order`
  ADD CONSTRAINT `freeproduct_order_freeproduct_id_foreign` FOREIGN KEY (`freeproduct_id`) REFERENCES `freeproducts` (`id`),
  ADD CONSTRAINT `freeproduct_order_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `freeproduct_participants`
--
ALTER TABLE `freeproduct_participants`
  ADD CONSTRAINT `freeproduct_participants_freeproduct_id_foreign` FOREIGN KEY (`freeproduct_id`) REFERENCES `freeproducts` (`id`),
  ADD CONSTRAINT `freeproduct_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_action_type_id_foreign` FOREIGN KEY (`action_type_id`) REFERENCES `action_types` (`id`),
  ADD CONSTRAINT `logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `notices`
--
ALTER TABLE `notices`
  ADD CONSTRAINT `notices_action_type_id_foreign` FOREIGN KEY (`action_type_id`) REFERENCES `action_types` (`id`),
  ADD CONSTRAINT `notices_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `orders_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `paypal_orders`
--
ALTER TABLE `paypal_orders`
  ADD CONSTRAINT `paypal_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `persons`
--
ALTER TABLE `persons`
  ADD CONSTRAINT `persons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `product_offers`
--
ALTER TABLE `product_offers`
  ADD CONSTRAINT `product_offers_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `user_points`
--
ALTER TABLE `user_points`
  ADD CONSTRAINT `user_points_action_type_id_foreign` FOREIGN KEY (`action_type_id`) REFERENCES `action_types` (`id`),
  ADD CONSTRAINT `user_points_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `virtual_product_orders`
--
ALTER TABLE `virtual_product_orders`
  ADD CONSTRAINT `virtual_product_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `virtual_product_orders_virtual_product_id_foreign` FOREIGN KEY (`virtual_product_id`) REFERENCES `virtual_products` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
