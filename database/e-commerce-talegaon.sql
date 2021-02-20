-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2016 at 04:47 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-commerce-talegaon`
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
(1, 4, 0, '9251 Dedrick Extensions Apt. 854', '5801 Jacey Road', '+5853281146056', 'Fritsch Tunnel', '38464-4212', 'Sawaynville', 'Haiti', 'Montana', '2016-11-26 12:47:15', '2016-11-26 12:47:15', NULL),
(2, 4, 0, '5338 Tomasa Neck Apt. 741', '43645 Mueller Spurs Suite 465', '+2922446086625', 'Trantow Burgs', '58721-8597', 'Port Abdiel', 'Guatemala', 'Nebraska', '2016-11-26 12:47:15', '2016-11-26 12:47:15', NULL),
(3, 4, 0, '90754 Senger Fall', '4106 Batz Landing', '+0826189460046', 'Lawrence Bridge', '03210', 'Lake Frankie', 'Kazakhstan', 'South Dakota', '2016-11-26 12:47:15', '2016-11-26 12:47:15', NULL),
(4, 11, 0, '67726 Rashawn Ways', '494 Demetris Prairie', '+2902092362427', 'Trycia Shore', '61676', 'Port Ethyl', 'Switzerland', 'Arizona', '2016-11-26 12:47:15', '2016-11-26 12:47:15', NULL),
(5, 15, 0, '448 Braun Mount Suite 752', '49081 Arden Expressway', '+5953198044944', 'Devon Spring', '64384', 'Karleyfurt', 'Canada', 'Texas', '2016-11-26 12:47:15', '2016-11-26 12:47:15', NULL),
(6, 3, 0, '916 Buckridge Fork Suite 009', '9775 Borer Manor', '+5434241765592', 'Rosella Turnpike', '59146-1020', 'Ramonastad', 'Libyan Arab Jamahiriya', 'Nevada', '2016-11-26 12:47:15', '2016-11-26 12:47:15', NULL),
(7, 13, 0, '7396 Tremblay Ramp Apt. 764', '76234 Jerel Mews Apt. 394', '+7297441914409', 'River Parkway', '60268-5811', 'New Kolefurt', 'Falkland Islands (Malvinas)', 'Indiana', '2016-11-26 12:47:15', '2016-11-26 12:47:15', NULL),
(8, 7, 0, '335 Crist Roads Suite 513', '8404 Miller Fields', '+7105870246339', 'Schultz Turnpike', '66961-2460', 'Lucyport', 'Philippines', 'New Hampshire', '2016-11-26 12:47:15', '2016-11-26 12:47:15', NULL),
(9, 17, 0, '6513 Kohler Mountains', '9975 Darrick Overpass Suite 705', '+3277786063438', 'Karianne Streets', '14086-2829', 'South Marcelinaberg', 'Sierra Leone', 'Oregon', '2016-11-26 12:47:15', '2016-11-26 12:47:15', NULL),
(10, 21, 0, '5413 Shanel Key Suite 042', '691 Gerhold Orchard Apt. 713', '+3901134012228', 'Kassulke Causeway', '70140', 'New Bethany', 'Nauru', 'Indiana', '2016-11-26 12:47:15', '2016-11-26 12:47:15', NULL),
(11, 4, 1, '560 Gulgowski Road', '1603 Schuppe Mews', '+0063244432493', 'London Streets', '35325', 'Hermannton', 'Libyan Arab Jamahiriya', 'Utah', '2016-11-26 12:47:33', '2016-11-26 12:47:33', NULL),
(12, 1, 1, '301', 'SHRINIWAS APPATMENT', '8975707594', 'Amol Khaire', '411058', 'PUNE', 'India', 'Maharashtra', '2016-11-30 13:57:08', '2016-11-30 13:57:08', NULL),
(13, NULL, 1, '301', 'SHRINIWAS APPATMENT', '8975707594', 'Amol Khaire', '411058', 'PUNE', 'India', 'Maharashtra', '2016-11-30 14:01:53', '2016-11-30 14:01:53', NULL),
(14, NULL, 1, '301', 'SHRINIWAS APPATMENT', '8975707594', 'Amol Khaire', '411058', 'PUNE', 'India', 'Maharashtra', '2016-12-10 10:04:17', '2016-12-10 10:04:17', NULL),
(15, 44, 0, '301', 'SHRINIWAS APPATMENT', '8975707594', 'Atul Atode', '411058', 'PUNE', 'India', 'Maharashtra', '2016-12-11 12:49:26', '2016-12-11 13:33:56', NULL),
(16, 44, 0, '301', 'SHRINIWAS APPATMENT', '8975707594', 'atul atode', '411058', 'PUNE', 'India', 'Maharashtra', '2016-12-11 12:50:16', '2016-12-11 13:24:38', '2016-12-11 13:24:38'),
(17, NULL, 1, '301', 'SHRINIWAS APPATMENT', '8975707594', 'Atul Atode', '411058', 'PUNE', 'India', 'Maharashtra', '2016-12-11 12:52:53', '2016-12-11 12:52:53', NULL),
(18, 44, 0, '301', 'SHRINIWAS APPATMENT', '8975707594', 'A Atode', '411058', 'PUNE', 'India', 'Maharashtra', '2016-12-11 13:10:37', '2016-12-11 13:24:34', '2016-12-11 13:24:34'),
(19, 44, 0, '301', 'SHRINIWAS APPATMENT', '8975707594', 'AA', '411058', 'PUNE', 'India', 'Maharashtra', '2016-12-11 13:16:59', '2016-12-11 13:24:29', '2016-12-11 13:24:29'),
(20, 44, 0, '301', 'SHRINIWAS APPATMENT', '8975707594', 'Amol Khaire', '411058', 'PUNE', 'India', 'Maharashtra', '2016-12-11 13:19:18', '2016-12-11 13:22:06', '2016-12-11 13:22:06'),
(21, 44, 0, '301', 'SHRINIWAS APPATMENT', '8975707594', 'Amol Khaire', '411058', 'PUNE', 'India', 'Maharashtra', '2016-12-11 13:21:55', '2016-12-11 13:24:20', '2016-12-11 13:24:20'),
(22, 44, 1, '301', 'SHRINIWAS APPATMENT', '8975707594', 'Amol Khaire', '411058', 'PUNE', 'India', 'Maharashtra', '2016-12-11 13:21:56', '2016-12-11 13:33:56', NULL),
(23, NULL, 1, '301', 'SHRINIWAS APPATMENT', '8975707594', 'Amol Khaire', '411058', 'PUNE', 'India', 'Maharashtra', '2016-12-13 13:24:06', '2016-12-13 13:24:06', NULL),
(24, 46, 1, '301', 'SHRINIWAS APPATMENT', '8975707594', 'Amol Khaire', '411058', 'PUNE', 'Armenia', 'Maharashtra', '2016-12-16 14:05:47', '2016-12-16 14:05:47', NULL),
(25, NULL, 1, '301', 'SHRINIWAS APPATMENT', '8975707594', 'Amol Khaire', '411058', 'PUNE', 'Armenia', 'Maharashtra', '2016-12-16 14:06:13', '2016-12-16 14:06:13', NULL);

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
(1, NULL, 'Digital & Music', 'Ut laudantium ducimus quam. Non in est ad quisquam voluptatibus soluta.', 'fui-heart', 'test', 1, 'store', '2016-11-26 12:47:02', '2016-11-26 12:47:02'),
(2, 1, 'Music', 'Rerum inventore adipisci illum quia voluptate omnis.', 'fui-upload', 'testsub', 1, 'store', '2016-11-26 12:47:02', '2016-11-26 12:47:02'),
(3, 2, 'another sub', 'Non placeat ratione consequuntur illo suscipit consectetur molestiae.', 'fui-home', 'testsubsub', 1, 'store', '2016-11-26 12:47:02', '2016-11-26 12:47:02'),
(4, 2, 'another sub', 'Reprehenderit rem dicta minima est ut facere sed nisi.', 'fui-windows', 'testsubsub', 1, 'store', '2016-11-26 12:47:02', '2016-11-26 12:47:02'),
(5, 1, 'New Releases', 'Accusamus aut ex qui magnam qui sed. Doloribus et nesciunt et quidem.', 'fui-info-circle', 'testsub', 1, 'store', '2016-11-26 12:47:02', '2016-11-26 12:47:02'),
(6, 5, 'another sub', 'Possimus minus consequuntur magni corporis.', 'fui-loop', 'testsubsub', 1, 'store', '2016-11-26 12:47:02', '2016-11-26 12:47:02'),
(7, 5, 'another sub', 'Qui aut doloribus quae itaque. Quasi error sequi quam officia tempore.', 'fui-export', 'testsubsub', 1, 'store', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(8, 1, 'Deals', 'Error accusamus tempora minus quasi debitis beatae excepturi.', 'fui-video', 'testsub', 1, 'store', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(9, 8, 'another sub', 'Eligendi culpa dolorum vitae totam mollitia eius est. Ea illo facilis distinctio.', 'fui-cmd', 'testsubsub', 1, 'store', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(10, 8, 'another sub', 'Aut veritatis molestiae accusamus ea.', 'fui-question-circle', 'testsubsub', 1, 'store', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(11, 1, 'Music Library', 'Deserunt dolor culpa atque culpa. Quam voluptatem vero laudantium.', 'fui-export', 'testsub', 1, 'store', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(12, 11, 'another sub', 'Vel sunt aut dolorem ea vitae. Officia est dicta voluptatem porro.', 'fui-photo', 'testsubsub', 1, 'store', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(13, 11, 'another sub', 'Quibusdam illum recusandae cum accusantium. Sed est ut perspiciatis suscipit in.', 'fui-check-circle', 'testsubsub', 1, 'store', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(14, NULL, 'Books & Audible', 'Atque atque et sint sed cumque est delectus.', 'fui-search', 'test', 1, 'group', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(15, 14, 'Books', 'Repudiandae illum optio nobis labore nobis mollitia animi.', 'fui-cross', 'testsub', 1, 'group', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(16, 15, 'another sub', 'Eum vero et aliquid enim. Qui vitae rerum officia ut.', 'fui-cross-circle', 'testsubsub', 1, 'group', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(17, 15, 'another sub', 'Sit labore explicabo nam fugit eum.', 'fui-cross-circle', 'testsubsub', 1, 'group', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(18, 14, 'Children Books', 'Et aliquid recusandae provident natus dignissimos at. Deserunt doloremque temporibus rem.', 'fui-chat', 'testsub', 1, 'group', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(19, 18, 'another sub', 'Dolorem est non sint aperiam est. Et voluptates tenetur delectus quis.', 'fui-windows', 'testsubsub', 1, 'group', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(20, 18, 'another sub', 'Tenetur culpa magnam dignissimos est sunt. Placeat ipsa quia molestiae.', 'fui-alert-circle', 'testsubsub', 1, 'group', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(21, 14, 'Textbooks', 'Saepe et necessitatibus distinctio esse excepturi impedit molestiae.', 'fui-heart', 'testsub', 1, 'group', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(22, 21, 'another sub', 'Sed non consectetur facere totam ratione sed fuga.', 'fui-mic', 'testsubsub', 1, 'group', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(23, 21, 'another sub', 'Fugiat velit illum unde rerum. Qui totam est magni repellat.', 'fui-home', 'testsubsub', 1, 'group', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(24, 14, 'Magazines', 'Molestiae minus perspiciatis libero consectetur enim quis qui.', 'fui-cmd', 'testsub', 1, 'group', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(25, 24, 'another sub', 'Doloremque nobis rem aut modi voluptatem officiis.', 'fui-time', 'testsubsub', 1, 'group', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(26, 24, 'another sub', 'Occaecati aperiam rerum consequatur omnis sit accusantium reprehenderit consequatur.', 'fui-chat', 'testsubsub', 1, 'group', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(27, 14, 'Audible Audiobooks & More', 'Velit aut sint aut odio velit. Sed qui eaque vel ea perspiciatis.', 'fui-search', 'testsub', 1, 'group', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(28, 27, 'another sub', 'Quo est perspiciatis numquam cumque. Commodi sit accusamus vel ullam rerum tenetur.', 'fui-export', 'testsubsub', 1, 'group', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(29, 27, 'another sub', 'Modi debitis non perspiciatis ut ex non.', 'fui-new', 'testsubsub', 1, 'group', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(30, NULL, 'Movies, Music & Games', 'Dolorem cupiditate molestiae eligendi porro cum. Corporis rem culpa aut delectus.', 'fui-search', 'test', 1, 'store', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(31, 30, 'Movies & TV', 'Officia nemo eum qui consequuntur ducimus enim ex.', 'fui-photo', 'testsub', 1, 'store', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(32, 31, 'another sub', 'Architecto vitae maiores aspernatur et rem consequuntur repellat.', 'fui-question-circle', 'testsubsub', 1, 'store', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(33, 31, 'another sub', 'Ratione dolores reiciendis debitis modi laudantium similique et.', 'fui-mail', 'testsubsub', 1, 'store', '2016-11-26 12:47:03', '2016-11-26 12:47:03'),
(34, 30, 'Blu-ray', 'Natus voluptatem quis ipsa nemo vitae hic. Voluptatem vero hic porro quae qui.', 'fui-heart', 'testsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(35, 34, 'another sub', 'Voluptates atque quis commodi qui officiis molestiae quae.', 'fui-export', 'testsubsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(36, 34, 'another sub', 'Excepturi nisi itaque nesciunt aliquam. Ut ut facilis vero sit omnis soluta.', 'fui-upload', 'testsubsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(37, 30, 'CDs & Vinyl', 'Ea dolor ut sit ut eos voluptatem. Enim tempora quia repudiandae et nisi.', 'fui-upload', 'testsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(38, 37, 'another sub', 'Quaerat eveniet aut inventore mollitia porro magnam.', 'fui-location', 'testsubsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(39, 37, 'another sub', 'Et dolorem consequatur cum possimus fugiat facere quam.', 'fui-cross', 'testsubsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(40, 30, 'Digital Music', 'Et qui aut ea dolor quis nisi. Nobis qui consectetur consequatur enim esse enim sequi.', 'fui-upload', 'testsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(41, 40, 'another sub', 'Nam et officiis rem vel voluptas in.', 'fui-user', 'testsubsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(42, 40, 'another sub', 'A dolore voluptates ut adipisci et aut magni.', 'fui-video', 'testsubsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(43, 30, 'Musical Instruments', 'Nostrum est sapiente iste fuga laboriosam fugiat nam.', 'fui-chat', 'testsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(44, 43, 'another sub', 'Provident consectetur exercitationem dolor eum molestiae.', 'fui-arrow-right', 'testsubsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(45, 43, 'another sub', 'Et quis pariatur eaque repellat et quod. Fugit sit consectetur alias sapiente.', 'fui-location', 'testsubsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(46, 30, 'Video Games', 'Blanditiis labore omnis voluptatem eligendi.', 'fui-arrow-right', 'testsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(47, 46, 'another sub', 'Quam et aut possimus eum et dolore.', 'fui-location', 'testsubsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(48, 46, 'another sub', 'In fugiat repudiandae vel nesciunt cupiditate porro.', 'fui-loop', 'testsubsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(49, 30, 'Digital Games', 'Et inventore tenetur sint nobis. A et voluptas qui officia.', 'fui-user', 'testsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(50, 49, 'another sub', 'Officia eos provident eos rerum laboriosam voluptatibus.', 'fui-cross', 'testsubsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(51, 49, 'another sub', 'Eaque provident ut ut dolorem consectetur sunt vero. Id repellendus est et facere.', 'fui-cross-circle', 'testsubsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(52, 30, 'Entertainment Collectibles', 'Velit dolores consequatur aut et debitis architecto.', 'fui-mic', 'testsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(53, 52, 'another sub', 'Qui explicabo sit quam architecto eius voluptatem. Eaque possimus alias error.', 'fui-location', 'testsubsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(54, 52, 'another sub', 'Deserunt impedit qui sit aut qui quae non. Qui laboriosam aut dolore molestiae neque.', 'fui-check', 'testsubsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(55, 30, 'Trade In Movies, Music & Games', 'Dolor ea quo ratione nihil reprehenderit voluptatem nulla.', 'fui-home', 'testsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(56, 55, 'another sub', 'Omnis a omnis consectetur deserunt ut minus.', 'fui-arrow-left', 'testsubsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(57, 55, 'another sub', 'Rerum quis non ut exercitationem itaque earum dignissimos.', 'fui-plus', 'testsubsub', 1, 'store', '2016-11-26 12:47:04', '2016-11-26 12:47:04'),
(58, NULL, 'Electronics & Computers', 'Velit corrupti hic aut tenetur est voluptas tempora.', 'fui-cross-circle', 'test', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(59, 58, 'TV & Video', 'Consequatur at rerum voluptas dolorum. Tenetur perferendis ullam possimus et.', 'fui-photo', 'testsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(60, 59, 'another sub', 'Velit quia et perspiciatis molestiae.', 'fui-cross-circle', 'testsubsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(61, 59, 'another sub', 'Illum eum magnam natus blanditiis et modi. Et pariatur blanditiis laboriosam sequi sint.', 'fui-window', 'testsubsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(62, 58, 'Home Audio & Theater', 'Nobis exercitationem pariatur sunt dignissimos enim ut modi.', 'fui-info-circle', 'testsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(63, 62, 'another sub', 'Sed quam ut qui cum doloremque rerum mollitia. Cumque aliquam corporis labore illum.', 'fui-plus', 'testsubsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(64, 62, 'another sub', 'Nostrum accusantium animi optio aspernatur quas assumenda aperiam.', 'fui-eye', 'testsubsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(65, 58, 'Camera, Photo & Video', 'Veritatis est vitae ut aut unde laborum voluptatem.', 'fui-heart', 'testsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(66, 65, 'another sub', 'Aut expedita quisquam beatae. Omnis possimus voluptates rerum rerum possimus est minus.', 'fui-check', 'testsubsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(67, 65, 'another sub', 'Accusamus at sed quam vitae excepturi.', 'fui-arrow-right', 'testsubsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(68, 58, 'Cell Phones & Accessories', 'Temporibus culpa deleniti repellendus sapiente praesentium eaque unde.', 'fui-new', 'testsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(69, 68, 'another sub', 'Illum voluptatem quis voluptatem. Vel quis quia in. Eum assumenda modi esse sit.', 'fui-question-circle', 'testsubsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(70, 68, 'another sub', 'Voluptatem architecto dignissimos quia est. Sapiente repudiandae ut aut ut atque.', 'fui-eye', 'testsubsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(71, 58, 'Video Games', 'Voluptate sed qui tempora odit ipsum. Fugiat ea in illo labore architecto inventore.', 'fui-mic', 'testsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(72, 71, 'another sub', 'Quis velit eos ut minus voluptas eveniet impedit.', 'fui-photo', 'testsubsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(73, 71, 'another sub', 'Quisquam quo dolor placeat ducimus dolor pariatur.', 'fui-mic', 'testsubsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(74, 58, 'Portable Audio & Accessories', 'Laboriosam incidunt ipsum voluptate ea deserunt rerum officiis ut.', 'fui-mic', 'testsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(75, 74, 'another sub', 'Nostrum earum omnis aut aperiam laudantium sequi itaque.', 'fui-new', 'testsubsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(76, 74, 'another sub', 'Odio quisquam velit autem ut. Laboriosam et sed et sit voluptatum sequi consectetur.', 'fui-chat', 'testsubsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(77, 58, 'Car Electronics & GPS', 'Error est odio possimus praesentium recusandae ut culpa aut. Omnis non voluptas et quia.', 'fui-question-circle', 'testsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(78, 77, 'another sub', 'Ut dignissimos iusto non non ex qui architecto.', 'fui-alert-circle', 'testsubsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(79, 77, 'another sub', 'Aspernatur soluta sit sint id voluptas enim fugit cumque.', 'fui-location', 'testsubsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(80, 58, 'Musical Instruments', 'Ex dolores repudiandae velit aut.', 'fui-mic', 'testsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(81, 80, 'another sub', 'Reiciendis dolor autem quae labore incidunt et.', 'fui-heart', 'testsubsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(82, 80, 'another sub', 'Reiciendis repudiandae est sit nobis est sed itaque debitis.', 'fui-upload', 'testsubsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(83, 58, 'Electronics Accessories', 'Tempora eos consequuntur facere quaerat veniam. Quae minima quod alias ipsa aliquam aut.', 'fui-plus', 'testsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(84, 83, 'another sub', 'Quae sunt omnis tenetur qui.', 'fui-window', 'testsubsub', 1, 'group', '2016-11-26 12:47:05', '2016-11-26 12:47:05'),
(85, 83, 'another sub', 'Amet commodi minima dolores soluta aut. Vero occaecati et quasi et.', 'fui-location', 'testsubsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(86, 58, 'Wearable Technology', 'In accusamus omnis sint dolores necessitatibus.', 'fui-info-circle', 'testsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(87, 86, 'another sub', 'Rerum laborum et ducimus et eaque perspiciatis. Maxime sapiente quia tempore delectus.', 'fui-export', 'testsubsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(88, 86, 'another sub', 'Ratione est provident rerum optio. Qui quia quia reiciendis. Rerum maxime vel sunt quo.', 'fui-info-circle', 'testsubsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(89, 58, 'Laptops & Tablets', 'Consequuntur ut officiis nihil. Architecto et id aperiam odio ut doloremque minima.', 'fui-loop', 'testsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(90, 89, 'another sub', 'Quis atque non et adipisci. Explicabo placeat praesentium pariatur minima facere.', 'fui-mic', 'testsubsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(91, 89, 'another sub', 'Id quasi quia eos iusto amet recusandae quia. Quidem sunt nemo expedita cum atque.', 'fui-cross-circle', 'testsubsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(92, 58, 'Desktops & Monitors', 'Aperiam eum sunt exercitationem totam ipsam mollitia velit.', 'fui-cross-circle', 'testsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(93, 92, 'another sub', 'Odit ex consequatur quos. Nam illo rerum esse temporibus similique possimus iusto.', 'fui-search', 'testsubsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(94, 92, 'another sub', 'Illum beatae corrupti sint sequi minus aliquid impedit atque.', 'fui-new', 'testsubsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(95, 58, 'Computer Accessories & Peripherals', 'Saepe enim esse dolorem quia est voluptatem non.', 'fui-windows', 'testsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(96, 95, 'another sub', 'Qui animi eum ab rerum rerum sunt aperiam quis.', 'fui-arrow-left', 'testsubsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(97, 95, 'another sub', 'Accusantium saepe omnis repellat ipsam sit aspernatur et.', 'fui-list', 'testsubsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(98, 58, 'Computer Parts & Components', 'Nobis illum perferendis architecto. A et fugiat odio ut.', 'fui-new', 'testsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(99, 98, 'another sub', 'Fuga porro totam quis consequatur porro fugit harum.', 'fui-arrow-right', 'testsubsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(100, 98, 'another sub', 'Quis consequatur sint dolorem vitae nulla quo. Rerum nobis saepe libero accusamus.', 'fui-cross', 'testsubsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(101, 58, 'Software', 'Architecto dolor et officiis. Totam commodi corporis non commodi eveniet quia.', 'fui-info-circle', 'testsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(102, 101, 'another sub', 'Laudantium earum et nostrum rerum nam repellat ipsa. Tenetur qui aliquam nobis autem.', 'fui-list', 'testsubsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(103, 101, 'another sub', 'Placeat mollitia autem aut nihil quos quam distinctio.', 'fui-location', 'testsubsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(104, 58, 'Printers & Ink', 'Dolores expedita quisquam impedit vel ducimus voluptatum.', 'fui-arrow-left', 'testsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(105, 104, 'another sub', 'Ut eos esse voluptas eum itaque doloribus nam enim.', 'fui-chat', 'testsubsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(106, 104, 'another sub', 'Et dolor dolorem sequi quaerat voluptates quibusdam. Quia perspiciatis eaque quia.', 'fui-windows', 'testsubsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(107, 58, 'Office & School Supplies', 'Excepturi odit ea velit quam mollitia quae. Ut nostrum rerum voluptas repellendus.', 'fui-new', 'testsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(108, 107, 'another sub', 'Eos perferendis neque quaerat velit quia sapiente illum dolor.', 'fui-window', 'testsubsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(109, 107, 'another sub', 'Adipisci sed qui placeat reprehenderit sint explicabo sed.', 'fui-photo', 'testsubsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(110, 58, 'Trade In Your Electronics', 'Quaerat ea sed cum et qui. Id ipsam doloremque sint facilis.', 'fui-location', 'testsub', 1, 'group', '2016-11-26 12:47:06', '2016-11-26 12:47:06'),
(111, 110, 'another sub', 'Aut aut aspernatur et est laboriosam. Eaque quo rem magni deleniti soluta.', 'fui-cross-circle', 'testsubsub', 1, 'group', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(112, 110, 'another sub', 'Soluta harum quo ut vero. Rerum ea ea vitae porro quisquam molestiae rerum soluta.', 'fui-plus', 'testsubsub', 1, 'group', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(113, NULL, 'Home, Garden & Tools', 'Est nihil eum porro vitae voluptatibus ratione. Quia quia aspernatur enim cupiditate.', 'fui-window', 'test', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(114, 113, 'HomeKitchen & Dining', 'Ad qui ab ea vero vel. Tempore itaque velit velit at et.', 'fui-search', 'testsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(115, 114, 'another sub', 'Molestiae nostrum iste rerum ab. Omnis reiciendis mollitia placeat.', 'fui-info-circle', 'testsubsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(116, 114, 'another sub', 'Nemo numquam distinctio quo nisi explicabo.', 'fui-chat', 'testsubsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(117, 113, 'Furniture & Décor', 'Dolores rerum repudiandae sed esse. Est ad vel sunt magnam maiores nisi.', 'fui-location', 'testsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(118, 117, 'another sub', 'Totam voluptatem tenetur non exercitationem maiores eos.', 'fui-home', 'testsubsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(119, 117, 'another sub', 'Quae doloribus odit sed fugiat amet omnis.', 'fui-window', 'testsubsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(120, 113, 'Bedding & Bath', 'Laboriosam numquam soluta velit quibusdam voluptatem nemo est.', 'fui-location', 'testsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(121, 120, 'another sub', 'Eveniet eos nam consequatur at eos.', 'fui-eye', 'testsubsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(122, 120, 'another sub', 'Quaerat labore hic pariatur doloribus.', 'fui-plus', 'testsubsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(123, 113, 'Appliances', 'Dolorem dolore laboriosam dignissimos sed. Iusto ipsam id dolorum ut.', 'fui-plus-circle', 'testsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(124, 123, 'another sub', 'Iste a doloremque alias. Quaerat neque sit aut distinctio itaque iusto officia fugit.', 'fui-home', 'testsubsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(125, 123, 'another sub', 'Corporis eligendi quo fugit itaque. Et suscipit veniam illum ad hic iure.', 'fui-location', 'testsubsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(126, 113, 'Patio, Lawn & Garden', 'Occaecati odit sit voluptas itaque similique voluptas et.', 'fui-cmd', 'testsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(127, 126, 'another sub', 'Quia impedit corrupti quasi similique laudantium ab. Et eum qui placeat provident.', 'fui-question-circle', 'testsubsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(128, 126, 'another sub', 'Placeat enim atque assumenda enim et. Dignissimos in aut ut.', 'fui-eye', 'testsubsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(129, 113, 'Fine Art', 'Id voluptatem ipsum aut vel voluptas et doloremque.', 'fui-photo', 'testsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(130, 129, 'another sub', 'Sint et repellendus nemo illum. Debitis magni eveniet eum quia voluptas qui unde id.', 'fui-windows', 'testsubsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(131, 129, 'another sub', 'Exercitationem debitis in commodi voluptate dolor ullam quisquam tenetur.', 'fui-mic', 'testsubsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(132, 113, 'Arts, Crafts & Sewing', 'Ad est et architecto quia consequuntur.', 'fui-window', 'testsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(133, 132, 'another sub', 'Illum nobis autem et autem iste unde non.', 'fui-video', 'testsubsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(134, 132, 'another sub', 'Illo repellendus nam molestiae. Corporis inventore voluptatum est quis.', 'fui-loop', 'testsubsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(135, 113, 'Pet Supplies', 'Eligendi qui facere vero atque. Quo nemo laboriosam soluta ea.', 'fui-arrow-left', 'testsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(136, 135, 'another sub', 'Voluptatum doloribus dolorem sunt quos. Eum asperiores incidunt aut delectus.', 'fui-loop', 'testsubsub', 1, 'store', '2016-11-26 12:47:07', '2016-11-26 12:47:07'),
(137, 135, 'another sub', 'Voluptatem in amet vel et earum. Dolores modi et porro.', 'fui-alert-circle', 'testsubsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(138, 113, 'Wedding Registry', 'Aliquam et provident voluptatibus omnis consequuntur.', 'fui-new', 'testsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(139, 138, 'another sub', 'Enim sapiente ipsum ad. Dolorum doloremque dolores sit dolorum voluptas id earum maxime.', 'fui-info-circle', 'testsubsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(140, 138, 'another sub', 'Id nihil vitae est labore dolore. Molestiae cum et quaerat dolorem et.', 'fui-eye', 'testsubsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(141, 113, 'Home Improvement', 'Cum atque excepturi saepe quo.', 'fui-upload', 'testsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(142, 141, 'another sub', 'Vero debitis eos facilis assumenda. Laboriosam optio modi molestias error est.', 'fui-check-circle', 'testsubsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(143, 141, 'another sub', 'Sed fugiat iure iusto vel quia dolor. Sed ut quia eveniet veniam.', 'fui-loop', 'testsubsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(144, 113, 'Power & Hand Tools', 'Quia minima velit sequi dignissimos. Architecto sapiente dolor molestiae ex.', 'fui-cross', 'testsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(145, 144, 'another sub', 'Quibusdam harum consequatur ut reiciendis quibusdam nostrum.', 'fui-loop', 'testsubsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(146, 144, 'another sub', 'Eaque cum tempore pariatur et maxime blanditiis autem.', 'fui-search', 'testsubsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(147, 113, 'Lamps & Light Fixtures', 'Ipsum ab omnis iste iure qui soluta ut. Odit assumenda quia sed quas distinctio quos.', 'fui-new', 'testsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(148, 147, 'another sub', 'Dolor fuga et labore quidem sint et. Error minus alias ratione aut.', 'fui-arrow-left', 'testsubsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(149, 147, 'another sub', 'Amet temporibus qui et excepturi non. Incidunt fuga quia provident omnis.', 'fui-export', 'testsubsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(150, 113, 'Kitchen & Bath Fixtures', 'Corrupti rerum laudantium voluptatibus laudantium ut. Omnis perspiciatis ea repellat.', 'fui-cmd', 'testsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(151, 150, 'another sub', 'Alias et assumenda suscipit distinctio. Et natus nihil vel occaecati ut eum.', 'fui-chat', 'testsubsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(152, 150, 'another sub', 'Et quasi consequatur aut impedit facere veniam aliquid maxime.', 'fui-chat', 'testsubsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(153, 113, 'HardwareHome Automation', 'Natus blanditiis harum voluptate sed corporis neque veritatis.', 'fui-home', 'testsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(154, 153, 'another sub', 'Porro impedit velit non culpa earum ab dolorem. Ad sint ipsa rem omnis nobis sunt.', 'fui-upload', 'testsubsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(155, 153, 'another sub', 'Nobis quaerat amet pariatur at enim voluptates et.', 'fui-windows', 'testsubsub', 1, 'store', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(156, NULL, 'Beauty, Health & Grocery', 'Facilis ex eum saepe dolorem sint minima maiores et.', 'fui-photo', 'test', 1, 'group', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(157, 156, 'All Beauty', 'Ex molestiae rerum aliquam magnam. Quod harum rerum sint aut reiciendis in esse.', 'fui-question-circle', 'testsub', 1, 'group', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(158, 157, 'another sub', 'Minus et totam aperiam modi modi nulla id. Voluptatum quis quia accusamus excepturi.', 'fui-info-circle', 'testsubsub', 1, 'group', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(159, 157, 'another sub', 'Praesentium minus laudantium reiciendis minus eveniet.', 'fui-heart', 'testsubsub', 1, 'group', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(160, 156, 'Luxury Beauty', 'Praesentium voluptatum aut corrupti rerum. Ea et aperiam laboriosam consequatur.', 'fui-check-circle', 'testsub', 1, 'group', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(161, 160, 'another sub', 'Autem consequuntur voluptatem consequatur quaerat.', 'fui-check', 'testsubsub', 1, 'group', '2016-11-26 12:47:08', '2016-11-26 12:47:08'),
(162, 160, 'another sub', 'Perspiciatis voluptas aliquam maiores excepturi et.', 'fui-search', 'testsubsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(163, 156, 'Men’s Grooming', 'Eos ut provident eveniet ratione ea.', 'fui-question-circle', 'testsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(164, 163, 'another sub', 'Architecto nostrum sint ex dolore. Vero quasi consectetur occaecati ea.', 'fui-arrow-right', 'testsubsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(165, 163, 'another sub', 'Pariatur omnis tempore deserunt voluptates est in. Quidem quisquam veniam a libero aut.', 'fui-window', 'testsubsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(166, 156, 'Health, Household & Baby Care', 'Occaecati eos itaque sunt enim et impedit. In amet enim exercitationem minima sunt.', 'fui-cmd', 'testsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(167, 166, 'another sub', 'Nihil corporis repellat quia dolorem quam distinctio ab.', 'fui-new', 'testsubsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(168, 166, 'another sub', 'Amet doloremque libero veniam pariatur explicabo error quia.', 'fui-windows', 'testsubsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(169, 156, 'Grocery & Gourmet Food', 'Et quisquam voluptatum et repellendus exercitationem. Qui quam consequatur dolor et.', 'fui-export', 'testsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(170, 169, 'another sub', 'Aperiam et consequuntur voluptas quidem vel possimus.', 'fui-windows', 'testsubsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(171, 169, 'another sub', 'Reprehenderit quae ipsam et dicta placeat necessitatibus.', 'fui-cmd', 'testsubsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(172, 156, 'Specialty Diets', 'Velit sint et vel cum magnam velit assumenda. Facilis eligendi qui ut.', 'fui-location', 'testsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(173, 172, 'another sub', 'Rem in est est consequuntur. Illo distinctio delectus et voluptates quae.', 'fui-question-circle', 'testsubsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(174, 172, 'another sub', 'Temporibus excepturi fugiat quasi at perspiciatis id.', 'fui-cmd', 'testsubsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(175, 156, 'Wine', 'Id quia vel corporis consequatur quia excepturi.', 'fui-loop', 'testsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(176, 175, 'another sub', 'Aut sint consequatur libero. Est blanditiis quia nisi labore.', 'fui-cmd', 'testsubsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(177, 175, 'another sub', 'Harum rerum amet architecto sint repudiandae laboriosam excepturi.', 'fui-upload', 'testsubsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(178, 156, 'Subscribe & Save', 'Et iure ad et ipsam. Incidunt maxime soluta reprehenderit fugiat hic.', 'fui-windows', 'testsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(179, 178, 'another sub', 'Rerum praesentium a consequatur nemo dolorum fugiat. Sit aut et cumque eaque qui sint.', 'fui-export', 'testsubsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(180, 178, 'another sub', 'Autem quisquam sed quo nam voluptate provident.', 'fui-plus', 'testsubsub', 1, 'group', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(181, NULL, 'Toys, Kids & Baby', 'Doloribus odio reprehenderit voluptates beatae quasi. Qui cum et dolore sit corporis est.', 'fui-home', 'test', 1, 'store', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(182, 181, 'Toys & Games', 'Necessitatibus temporibus et perferendis aut. Harum error architecto voluptatem placeat.', 'fui-windows', 'testsub', 1, 'store', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(183, 182, 'another sub', 'Delectus enim delectus sed voluptatem doloremque non aliquid.', 'fui-chat', 'testsubsub', 1, 'store', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(184, 182, 'another sub', 'Odio et sit excepturi molestiae quam nisi assumenda molestiae.', 'fui-mic', 'testsubsub', 1, 'store', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(185, 181, 'Baby', 'Et minima sed esse mollitia ut fuga. Nesciunt labore impedit deleniti dolorum vel.', 'fui-export', 'testsub', 1, 'store', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(186, 185, 'another sub', 'Et qui quam quam blanditiis sunt. Vitae reiciendis velit rem.', 'fui-arrow-left', 'testsubsub', 1, 'store', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(187, 185, 'another sub', 'Doloribus amet ea deserunt molestiae nostrum.', 'fui-heart', 'testsubsub', 1, 'store', '2016-11-26 12:47:09', '2016-11-26 12:47:09'),
(188, 181, 'Video Games for Kids', 'Facere sequi unde consectetur ad ullam laboriosam omnis. Ad iusto culpa cumque.', 'fui-home', 'testsub', 1, 'store', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(189, 188, 'another sub', 'Sequi dolore minima aut modi. Ut architecto temporibus et et vero.', 'fui-cross-circle', 'testsubsub', 1, 'store', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(190, 188, 'another sub', 'Error maiores ut deserunt velit eum quasi.', 'fui-search', 'testsubsub', 1, 'store', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(191, 181, 'Baby Registry', 'Eligendi non voluptates hic sed facere consequatur. Amet beatae est aut quia sint.', 'fui-heart', 'testsub', 1, 'store', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(192, 191, 'another sub', 'Dolor officiis ut error rem. Est reiciendis sequi rerum culpa praesentium.', 'fui-mail', 'testsubsub', 1, 'store', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(193, 191, 'another sub', 'Voluptate voluptatem minus vel earum ut et voluptatem.', 'fui-cross-circle', 'testsubsub', 1, 'store', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(194, 181, 'Kids’ Birthdays', 'Et et et omnis asperiores. Deserunt consequatur soluta omnis vitae facilis.', 'fui-loop', 'testsub', 1, 'store', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(195, 194, 'another sub', 'Iure maxime sint velit amet ut ipsa. Est et adipisci sed repellat minus in perferendis.', 'fui-plus', 'testsubsub', 1, 'store', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(196, 194, 'another sub', 'Omnis est qui iure. Tenetur rerum eaque sapiente deleniti labore.', 'fui-new', 'testsubsub', 1, 'store', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(197, 181, 'For Girls', 'Enim exercitationem animi qui. At voluptas quaerat tempora excepturi est.', 'fui-search', 'testsub', 1, 'store', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(198, 197, 'another sub', 'Praesentium esse aperiam deleniti aspernatur molestiae.', 'fui-loop', 'testsubsub', 1, 'store', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(199, 197, 'another sub', 'Accusantium nobis commodi et cupiditate. Dicta unde temporibus laborum vitae.', 'fui-time', 'testsubsub', 1, 'store', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(200, 181, 'For Boys', 'A asperiores quod dolores nesciunt eos debitis molestiae.', 'fui-check', 'testsub', 1, 'store', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(201, 200, 'another sub', 'Sed delectus aliquid distinctio hic.', 'fui-search', 'testsubsub', 1, 'store', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(202, 200, 'another sub', 'Magni officia quos quisquam praesentium.', 'fui-time', 'testsubsub', 1, 'store', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(203, 181, 'For Baby', 'Sint dicta animi eum. Officiis magnam commodi et ea sit laborum consectetur.', 'fui-info-circle', 'testsub', 1, 'store', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(204, 203, 'another sub', 'Qui dolore quae odio sunt ut beatae placeat.', 'fui-check', 'testsubsub', 1, 'store', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(205, 203, 'another sub', 'Doloremque sit sit aspernatur in ut.', 'fui-location', 'testsubsub', 1, 'store', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(206, NULL, 'Clothing, Shoes & Jewelry', 'Quia quis cupiditate culpa magni repellat sit earum.', 'fui-search', 'test', 1, 'group', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(207, 206, 'Women', 'Incidunt mollitia suscipit voluptatum. Ipsa esse in assumenda aut.', 'fui-arrow-left', 'testsub', 1, 'group', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(208, 207, 'another sub', 'Voluptate fugit eos optio quam. Nisi quia consequatur sunt quae.', 'fui-mic', 'testsubsub', 1, 'group', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(209, 207, 'another sub', 'Excepturi provident delectus cupiditate. Cupiditate omnis a numquam est.', 'fui-plus', 'testsubsub', 1, 'group', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(210, 206, 'Men', 'Tempore ipsam rem consequatur eum libero. Quia minus quod aut quia est rem sit quo.', 'fui-video', 'testsub', 1, 'group', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(211, 210, 'another sub', 'Necessitatibus repudiandae consectetur exercitationem.', 'fui-export', 'testsubsub', 1, 'group', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(212, 210, 'another sub', 'Ad repellendus temporibus itaque nisi voluptas ea.', 'fui-cross', 'testsubsub', 1, 'group', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(213, 206, 'Girls', 'Inventore porro occaecati sit voluptatem. Labore rem voluptate tempora.', 'fui-check-circle', 'testsub', 1, 'group', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(214, 213, 'another sub', 'Vitae rerum dignissimos dolor. Iste corporis sed voluptas et doloremque fugit sint.', 'fui-user', 'testsubsub', 1, 'group', '2016-11-26 12:47:10', '2016-11-26 12:47:10'),
(215, 213, 'another sub', 'Nostrum cumque aperiam iusto architecto. Animi vel molestias iusto quis.', 'fui-check', 'testsubsub', 1, 'group', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(216, 206, 'Boys', 'Et dolorem et ea veniam. Quas est rerum ut cumque id laboriosam eius.', 'fui-mic', 'testsub', 1, 'group', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(217, 216, 'another sub', 'Esse est aperiam eum quo eum temporibus quia asperiores. Ut autem quia omnis qui.', 'fui-plus-circle', 'testsubsub', 1, 'group', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(218, 216, 'another sub', 'Doloremque qui dolorum porro necessitatibus accusamus.', 'fui-cross-circle', 'testsubsub', 1, 'group', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(219, 206, 'Baby', 'Quod sint non iste ut vero rerum et. Consequatur commodi numquam illo labore doloremque.', 'fui-check-circle', 'testsub', 1, 'group', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(220, 219, 'another sub', 'Ut possimus dolores iure qui et ex corporis est. Nam minus nesciunt ipsa.', 'fui-photo', 'testsubsub', 1, 'group', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(221, 219, 'another sub', 'Eos ut necessitatibus iusto natus. Labore enim placeat velit eum quia dolorem.', 'fui-mail', 'testsubsub', 1, 'group', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(222, 206, 'Luggage', 'Ut eum ea voluptas. Eveniet dolor expedita pariatur labore non magni velit possimus.', 'fui-alert-circle', 'testsub', 1, 'group', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(223, 222, 'another sub', 'Cumque fugit repudiandae autem quia maiores autem dolorum.', 'fui-chat', 'testsubsub', 1, 'group', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(224, 222, 'another sub', 'Accusamus ratione dolorum quo quo incidunt velit.', 'fui-plus-circle', 'testsubsub', 1, 'group', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(225, NULL, 'Sports & Outdoors', 'Dolores ratione labore aut nihil iure. Repellat facere autem voluptatem beatae deleniti.', 'fui-check-circle', 'test', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(226, 225, 'Athletic Clothing', 'Tempora deserunt quia qui laudantium quia sit.', 'fui-window', 'testsub', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(227, 226, 'another sub', 'Facilis fugiat earum ut minima rerum. Aut quo esse eum illum. Ut iste consequuntur quia.', 'fui-video', 'testsubsub', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(228, 226, 'another sub', 'Vel quia numquam quis. Impedit blanditiis in qui perspiciatis voluptatum unde unde.', 'fui-plus-circle', 'testsubsub', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(229, 225, 'Exercise & Fitness', 'Labore ullam dolorem eos atque. Saepe tempora qui est fugiat perferendis.', 'fui-info-circle', 'testsub', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(230, 229, 'another sub', 'Ad nesciunt ipsum ut illo suscipit. Vel modi aliquam libero omnis accusantium.', 'fui-export', 'testsubsub', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(231, 229, 'another sub', 'Debitis sed quo quia quidem. Nam ipsa nostrum qui dolore laudantium similique neque.', 'fui-check', 'testsubsub', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(232, 225, 'Hunting & Fishing', 'Rerum voluptatem facilis magni est non enim dolore nobis.', 'fui-video', 'testsub', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(233, 232, 'another sub', 'Voluptatibus vel sint cupiditate quibusdam nihil dolor necessitatibus.', 'fui-cmd', 'testsubsub', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(234, 232, 'another sub', 'Libero et unde voluptate. Quo quis et omnis consectetur fuga. Architecto est ratione ea.', 'fui-alert-circle', 'testsubsub', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(235, 225, 'Team Sports', 'Sed placeat et voluptatem. Aliquam tempore incidunt quae eos.', 'fui-video', 'testsub', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(236, 235, 'another sub', 'Ut magni enim provident eos tempora molestiae. Impedit doloremque ut quasi aut ut.', 'fui-info-circle', 'testsubsub', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(237, 235, 'another sub', 'Sunt illum ratione autem occaecati quia praesentium. Et quia eum hic.', 'fui-export', 'testsubsub', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(238, 225, 'Fan Shop', 'Enim nam rerum et eius.', 'fui-eye', 'testsub', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(239, 238, 'another sub', 'Rem cupiditate deserunt quasi accusamus.', 'fui-home', 'testsubsub', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(240, 238, 'another sub', 'Aut aut et nemo. Tempora pariatur rem facere repellat beatae maxime ut.', 'fui-question-circle', 'testsubsub', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(241, 225, 'Golf', 'Consequuntur cupiditate eius iste dicta. Placeat ullam et molestias eligendi.', 'fui-window', 'testsub', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(242, 241, 'another sub', 'Praesentium veniam quibusdam explicabo eius mollitia accusamus sed.', 'fui-check-circle', 'testsubsub', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(243, 241, 'another sub', 'Hic suscipit aut voluptas enim nemo illo.', 'fui-photo', 'testsubsub', 1, 'store', '2016-11-26 12:47:11', '2016-11-26 12:47:11'),
(244, 225, 'Leisure Sports & Game Room', 'Quod eveniet optio error dignissimos.', 'fui-user', 'testsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(245, 244, 'another sub', 'Illum modi numquam mollitia et neque. Unde exercitationem dolorem eveniet ut.', 'fui-arrow-right', 'testsubsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(246, 244, 'another sub', 'Suscipit sint et consequatur voluptates.', 'fui-check', 'testsubsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(247, 225, 'Sports Collectibles', 'Expedita facere voluptatem dolor ea labore.', 'fui-info-circle', 'testsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(248, 247, 'another sub', 'Voluptas tenetur id voluptates minus. Consequatur porro quidem voluptas voluptas.', 'fui-video', 'testsubsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(249, 247, 'another sub', 'Magnam maiores voluptates molestiae nobis ea dignissimos eos.', 'fui-arrow-right', 'testsubsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(250, 225, 'All Sports & Fitness', 'Eos et illum veritatis reprehenderit. Soluta doloremque cupiditate accusantium aut.', 'fui-time', 'testsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(251, 250, 'another sub', 'Facilis qui perspiciatis aut explicabo molestiae corrupti doloremque.', 'fui-export', 'testsubsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(252, 250, 'another sub', 'Minima inventore qui ut molestiae fugiat in.', 'fui-windows', 'testsubsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(253, 225, 'Camping & Hiking', 'Et voluptas sit facilis ut quos doloremque.', 'fui-cross-circle', 'testsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(254, 253, 'another sub', 'Eum impedit enim sunt alias atque consectetur veritatis.', 'fui-arrow-right', 'testsubsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(255, 253, 'another sub', 'Quod aut est minima voluptas et. Assumenda cupiditate ad voluptas dolorem.', 'fui-eye', 'testsubsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(256, 225, 'Cycling', 'Quod asperiores et dignissimos nihil non aut alias. Assumenda voluptas quod nisi vitae.', 'fui-check-circle', 'testsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(257, 256, 'another sub', 'Qui fugiat molestiae sint aspernatur dolores illo beatae sed.', 'fui-new', 'testsubsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(258, 256, 'another sub', 'Ea autem accusantium debitis. Eos qui nostrum doloribus voluptatem delectus dolor amet.', 'fui-plus-circle', 'testsubsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(259, 225, 'Outdoor Clothing', 'Quod nesciunt tenetur sit corrupti aut et veniam.', 'fui-user', 'testsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(260, 259, 'another sub', 'Et aliquam dolores nesciunt natus voluptatem. Facere cumque error doloribus maxime.', 'fui-new', 'testsubsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(261, 259, 'another sub', 'Ut nobis dolore minus inventore. Rerum ab impedit ex quis. Id id est quidem et sed.', 'fui-home', 'testsubsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(262, 225, 'Scooters, Skateboards & Skates', 'Doloremque nostrum sunt placeat omnis consequatur temporibus deserunt laborum.', 'fui-cmd', 'testsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(263, 262, 'another sub', 'Occaecati et expedita quibusdam id ut quaerat. Repellat deleniti aliquam recusandae ut.', 'fui-video', 'testsubsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(264, 262, 'another sub', 'Sequi facilis qui ea iste sunt. Dolorum sed et et id in explicabo consequuntur.', 'fui-plus', 'testsubsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(265, 225, 'Water Sports', 'Itaque excepturi suscipit sunt ex et animi. Voluptate et repellat accusamus dolor.', 'fui-chat', 'testsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(266, 265, 'another sub', 'Expedita atque commodi sint corporis totam porro.', 'fui-home', 'testsubsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(267, 265, 'another sub', 'Voluptas qui inventore et error. Cumque deserunt nobis ab quisquam.', 'fui-loop', 'testsubsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(268, 225, 'Winter Sports', 'Omnis delectus qui fugiat velit consequatur explicabo minima.', 'fui-cross-circle', 'testsub', 1, 'store', '2016-11-26 12:47:12', '2016-11-26 12:47:12'),
(269, 268, 'another sub', 'Consequatur omnis dolore est provident.', 'fui-eye', 'testsubsub', 1, 'store', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(270, 268, 'another sub', 'Fugit tenetur eos quia rem. Et minus molestiae voluptas voluptatem similique.', 'fui-heart', 'testsubsub', 1, 'store', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(271, 225, 'Climbing', 'Occaecati unde minima minus quam. Et quam dolorum et sequi exercitationem hic non.', 'fui-cross', 'testsub', 1, 'store', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(272, 271, 'another sub', 'Ducimus corporis vel repellat eos quo id. Placeat maxime et doloremque rerum.', 'fui-info-circle', 'testsubsub', 1, 'store', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(273, 271, 'another sub', 'Perspiciatis cum molestiae odio dolores est ea a aut.', 'fui-time', 'testsubsub', 1, 'store', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(274, 225, 'Accessories', 'Suscipit harum voluptas ut aut ut. Natus eius ut distinctio quos aperiam minus.', 'fui-home', 'testsub', 1, 'store', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(275, 274, 'another sub', 'Maxime repellendus rem sit doloremque iste ad vero ut. Et quae ut iste nihil doloribus.', 'fui-user', 'testsubsub', 1, 'store', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(276, 274, 'another sub', 'Repudiandae rem suscipit explicabo laborum.', 'fui-cmd', 'testsubsub', 1, 'store', '2016-11-26 12:47:13', '2016-11-26 12:47:13');
INSERT INTO `categories` (`id`, `category_id`, `name`, `description`, `icon`, `image`, `status`, `type`, `created_at`, `updated_at`) VALUES
(277, 225, 'All Outdoor Recreation', 'Expedita eos cupiditate rem et enim. Sint ratione cum provident eum ipsa asperiores.', 'fui-video', 'testsub', 1, 'store', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(278, 277, 'another sub', 'Ad est sed ut rerum nisi facere minus. Quo minus optio temporibus dicta sint vero.', 'fui-windows', 'testsubsub', 1, 'store', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(279, 277, 'another sub', 'Deserunt praesentium asperiores laboriosam ullam consequuntur ullam dolores.', 'fui-home', 'testsubsub', 1, 'store', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(280, NULL, 'Automotive & Industrial', 'Cumque voluptatem velit consequatur ea facilis dignissimos quae.', 'fui-new', 'test', 1, 'group', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(281, 280, 'Automotive Parts & Accessories', 'Voluptatum laboriosam aut odit vero accusantium harum et. Et hic nobis enim.', 'fui-alert-circle', 'testsub', 1, 'group', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(282, 281, 'another sub', 'Sint ratione repudiandae et atque excepturi eaque accusamus.', 'fui-windows', 'testsubsub', 1, 'group', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(283, 281, 'another sub', 'Nam consequatur architecto aut repudiandae reprehenderit aut nobis perferendis.', 'fui-eye', 'testsubsub', 1, 'group', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(284, 280, 'Automotive Tools & Equipment', 'Quo sed accusantium asperiores rem. Quae inventore quaerat molestias quis.', 'fui-new', 'testsub', 1, 'group', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(285, 284, 'another sub', 'Quisquam laboriosam cupiditate rem aut assumenda harum dolore odio.', 'fui-heart', 'testsubsub', 1, 'group', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(286, 284, 'another sub', 'Est consequatur reiciendis quo consequuntur harum aut non laudantium.', 'fui-windows', 'testsubsub', 1, 'group', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(287, 280, 'Car/Vehicle Electronics & GPS', 'Et ut quisquam ducimus impedit minus consequatur. Sequi sunt vel culpa nesciunt ipsam.', 'fui-plus', 'testsub', 1, 'group', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(288, 287, 'another sub', 'Consequuntur eum in qui rem eius.', 'fui-window', 'testsubsub', 1, 'group', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(289, 287, 'another sub', 'Tempore placeat inventore voluptates. Illo alias debitis enim occaecati quod suscipit.', 'fui-cross-circle', 'testsubsub', 1, 'group', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(290, 280, 'Tires & Wheels', 'Sed assumenda labore quibusdam ea aut.', 'fui-alert-circle', 'testsub', 1, 'group', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(291, 290, 'another sub', 'Veritatis laudantium eligendi eveniet rem.', 'fui-user', 'testsubsub', 1, 'group', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(292, 290, 'another sub', 'Neque omnis aut magni. Sit soluta voluptatum qui hic autem.', 'fui-question-circle', 'testsubsub', 1, 'group', '2016-11-26 12:47:13', '2016-11-26 12:47:13'),
(293, 280, 'Motorcycle & Powersports', 'Debitis aut cupiditate quibusdam quos. Voluptas fuga reprehenderit tempore eveniet.', 'fui-photo', 'testsub', 1, 'group', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(294, 293, 'another sub', 'Porro et voluptate fuga quae ea voluptas. Dolores et ratione minima.', 'fui-mic', 'testsubsub', 1, 'group', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(295, 293, 'another sub', 'Laborum magni eius accusamus molestiae. Aut quae repellendus eius ut ipsam expedita qui.', 'fui-video', 'testsubsub', 1, 'group', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(296, 280, 'Industrial Supplies', 'Sit dolores et est autem sit at nemo.', 'fui-check-circle', 'testsub', 1, 'group', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(297, 296, 'another sub', 'Quo in incidunt quidem sequi. Vel odit velit ratione aut.', 'fui-check-circle', 'testsubsub', 1, 'group', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(298, 296, 'another sub', 'In molestiae doloremque officia dicta. Magni libero nemo possimus qui ut ea consequatur.', 'fui-user', 'testsubsub', 1, 'group', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(299, 280, 'Lab & Scientific', 'Quia a ipsum minima esse. Beatae consequatur expedita neque dicta.', 'fui-time', 'testsub', 1, 'group', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(300, 299, 'another sub', 'Nisi repellendus suscipit quod qui nemo molestias.', 'fui-search', 'testsubsub', 1, 'group', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(301, 299, 'another sub', 'Molestias esse labore laudantium et ullam in.', 'fui-time', 'testsubsub', 1, 'group', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(302, 280, 'Janitorial', 'Eos et aliquam porro ut consequuntur officia. Doloribus eum doloremque voluptatibus quod.', 'fui-arrow-right', 'testsub', 1, 'group', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(303, 302, 'another sub', 'Aut sit unde qui praesentium facilis nam nihil repellat.', 'fui-arrow-left', 'testsubsub', 1, 'group', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(304, 302, 'another sub', 'Dolorem laboriosam ad blanditiis voluptatibus nobis.', 'fui-location', 'testsubsub', 1, 'group', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(305, 280, 'Safety', 'Minus cum eveniet modi laudantium dolorem. Suscipit possimus sit veniam consequuntur.', 'fui-info-circle', 'testsub', 1, 'group', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(306, 305, 'another sub', 'Earum totam voluptas voluptatum odio incidunt.', 'fui-search', 'testsubsub', 1, 'group', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(307, 305, 'another sub', 'Mollitia saepe cum possimus ut dolor reiciendis iure et.', 'fui-alert-circle', 'testsubsub', 1, 'group', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(308, NULL, 'Home Services', 'Est commodi rem eligendi. Et corporis totam minima provident.', 'fui-new', 'test', 1, 'store', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(309, 308, 'Home Improvement & Repair', 'Vero tempora numquam pariatur enim qui. Voluptatem voluptatem esse ut dolorem.', 'fui-info-circle', 'testsub', 1, 'store', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(310, 309, 'another sub', 'Omnis exercitationem expedita possimus autem. Et quidem facere aspernatur sunt laborum.', 'fui-mic', 'testsubsub', 1, 'store', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(311, 309, 'another sub', 'Natus error eius sint. Accusantium repellat fuga ut reprehenderit amet incidunt sint est.', 'fui-upload', 'testsubsub', 1, 'store', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(312, 308, 'Lawn & Garden Care', 'Optio accusantium maxime quidem veritatis. Fuga cum rerum sequi in quas.', 'fui-check-circle', 'testsub', 1, 'store', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(313, 312, 'another sub', 'Et non saepe et possimus. Eos quia et et. Adipisci laudantium molestiae sunt a.', 'fui-search', 'testsubsub', 1, 'store', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(314, 312, 'another sub', 'Voluptatem eum voluptate nam quis quibusdam aperiam maxime.', 'fui-eye', 'testsubsub', 1, 'store', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(315, 308, 'Automotive Services', 'A esse ea sequi porro. Similique expedita cum natus.', 'fui-plus-circle', 'testsub', 1, 'store', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(316, 315, 'another sub', 'Sit nisi facilis voluptate velit fugit omnis laborum.', 'fui-home', 'testsubsub', 1, 'store', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(317, 315, 'another sub', 'Eos enim ea soluta facere. Labore eaque sint at delectus ut et beatae.', 'fui-arrow-left', 'testsubsub', 1, 'store', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(318, 308, 'Computer & Electronics', 'Corporis natus praesentium odit ut perferendis qui.', 'fui-plus-circle', 'testsub', 1, 'store', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(319, 318, 'another sub', 'Architecto est incidunt iste officiis quo nostrum in iure.', 'fui-video', 'testsubsub', 1, 'store', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(320, 318, 'another sub', 'Ex iure odit est.', 'fui-list', 'testsubsub', 1, 'store', '2016-11-26 12:47:14', '2016-11-26 12:47:14'),
(321, 308, 'Lessons & Tutoring', 'Illo explicabo deleniti perspiciatis ut. Et et sit qui.', 'fui-window', 'testsub', 1, 'store', '2016-11-26 12:47:15', '2016-11-26 12:47:15'),
(322, 321, 'another sub', 'Modi consequatur corrupti vitae cumque ut molestias. In eaque rerum quae officiis non.', 'fui-eye', 'testsubsub', 1, 'store', '2016-11-26 12:47:15', '2016-11-26 12:47:15'),
(323, 321, 'another sub', 'Voluptatum repudiandae harum laboriosam eos.', 'fui-photo', 'testsubsub', 1, 'store', '2016-11-26 12:47:15', '2016-11-26 12:47:15');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'pune', '2016-12-03 23:08:30', '0000-00-00 00:00:00'),
(2, 'mumbai', '2016-12-03 23:13:52', '0000-00-00 00:00:00');

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
(1, 'info@info.net', 'contact@contact.net', 'sales@sales.net', 'support@support.net', 'active', 'First Last', 'E-commerce', 'Laravel E-commerce', '/img/logo200x100.png', '', '+8040789925880', '+918888888888', '1248 Vince Mountains Suite 007', 'Mahashtra', 'Pune', '411038', 'http://www.website.net', 'twitter.com', 'facebook.com', 'googleplus.com', '0b4a9e3b4aed04c4599eca136a1eb5fc', 'Ea cupiditate qui aut voluptatum blanditiis. Facilis qui quos hic sit. Sint nemo qui ipsa expedita sit quos.', 'sunt,nulla,qui,iusto,repellendus,deserunt,unde,consectetur,natus,doloribus,aut,officia,sequi,et,numquam,enim,tempore,porro,autem,et', 'Dolorem a et et maxime recusandae. Sed modi iusto eaque asperiores atque odio. Voluptatem impedit nobis impedit reiciendis ea. Molestiae in distinctio quisquam et.\nDolor eius recusandae possimus. Consequuntur nostrum ipsam reiciendis similique occaecati nostrum. Recusandae eum aperiam placeat nihil aut sit veritatis.\nIllo voluptas doloremque fugiat dolorum. Sequi reiciendis omnis commodi sit blanditiis inventore nisi. Sunt quas ea voluptatibus in autem qui expedita tenetur. Est nesciunt cumque repellat beatae.\nVel voluptatibus recusandae tempora eligendi rem ut accusantium velit. Perspiciatis qui ut voluptate quidem sint. Inventore ea ipsa voluptas sed veniam.\nAut necessitatibus rerum excepturi quasi doloribus aut perferendis deserunt. Aspernatur sint nam expedita est. Dignissimos illum voluptatibus dolor omnis ea cumque perspiciatis. Quisquam nemo ad enim ut.\nSoluta eos est magni non. Occaecati rerum voluptatem quia aut debitis aut molestias. Magnam ipsa nostrum aliquid totam velit ut. Vitae asperiores ut est maxime. Nihil qui eius sed aliquam.', 'Returns\r\n\r\nOur policy lasts 30 days. If 30 days have gone by since your purchase, unfortunately we can’t offer you a refund or exchange.\r\n\r\nTo be eligible for a return, your item must be unused and in the same condition that you received it. It must also be in the original packaging.\r\n\r\nSeveral types of goods are exempt from being returned. Perishable goods such as food, flowers, newspapers or magazines cannot be returned. We also do not accept products that are intimate or sanitary goods, hazardous materials, or flammable liquids or gases.\r\n\r\nAdditional non-returnable items:\r\nGift cards\r\nDownloadable software products\r\nSome health and personal care items\r\n\r\nTo complete your return, we require a receipt or proof of purchase.\r\n\r\nPlease do not send your purchase back to the manufacturer.\r\n\r\nThere are certain situations where only partial refunds are granted: (if applicable)\r\nBook with obvious signs of use\r\nCD, DVD, VHS tape, software, video game, cassette tape, or vinyl record that has been opened.\r\nAny item not in its original condition, is damaged or missing parts for reasons not due to our error.\r\nAny item that is returned more than 30 days after delivery\r\n\r\nRefunds (if applicable)\r\nOnce your return is received and inspected, we will send you an email to notify you that we have received your returned item. We will also notify you of the approval or rejection of your refund.\r\nIf you are approved, then your refund will be processed, and a credit will automatically be applied to your credit card or original method of payment, within a certain amount of days.\r\n\r\nLate or missing refunds (if applicable)\r\nIf you haven’t received a refund yet, first check your bank account again.\r\nThen contact your credit card company, it may take some time before your refund is officially posted.\r\nNext contact your bank. There is often some processing time before a refund is posted.\r\nIf you’ve done all of this and you still have not received your refund yet, please contact us at [ [ email@email.com ] ].\r\n\r\nSale items (if applicable)\r\nOnly regular priced items may be refunded, unfortunately sale items cannot be refunded.\r\n\r\nExchanges (if applicable)\r\nWe only replace items if they are defective or damaged.  If you need to exchange it for the same item, send us an email at [ [ email@email.com ] ] and send your item to: [ [  Address ] ] [ [ City ] ] [ [ State ] ] [ [ Country ] ] [ [ PostCode ] ].\r\n\r\nGifts\r\nIf the item was marked as a gift when purchased and shipped directly to you, you’ll receive a gift credit for the value of your return. Once the returned item is received, a gift certificate will be mailed to you.\r\n\r\nIf the item wasn’t marked as a gift when purchased, or the gift giver had the order shipped to themselves to give to you later, we will send a refund to the gift giver and he will find out about your return.\r\n\r\nShipping\r\nTo return your product, you should mail your product to: [ [  Address ] ] [ [ City ] ] [ [ State ] ] [ [ Country ] ] [ [ PostCode ] ].\r\n\r\nYou will be responsible for paying for your own shipping costs for returning your item. Shipping costs are non-refundable. If you receive a refund, the cost of return shipping will be deducted from your refund.\r\n\r\nDepending on where you live, the time it may take for your exchanged product to reach you, may vary.\r\n\r\nIf you are shipping an item over $75, you should consider using a trackable shipping service or purchasing shipping insurance. We don’t guarantee that we will receive your returned item.\r\n', 'PRIVACY STATEMENT\r\n\r\n\r\n\r\n----\r\n\r\n\r\n\r\nSECTION 1 - WHAT DO WE DO WITH YOUR INFORMATION?\r\n\r\n\r\n\r\nWhen you purchase something from our store, as part of the buying and selling process, we collect the personal information you give us such as your name, address and email address.\r\n\r\nWhen you browse our store, we also automatically receive your computer’s internet protocol (IP) address in order to provide us with information that helps us learn about your browser and operating system.\r\n\r\nEmail marketing (if applicable): With your permission, we may send you emails about our store, new products and other updates.\r\n\r\n\r\n\r\nSECTION 2 - CONSENT\r\n\r\n\r\n\r\nHow do you get my consent?\r\n\r\nWhen you provide us with personal information to complete a transaction, verify your credit card, place an order, arrange for a delivery or return a purchase, we imply that you consent to our collecting it and using it for that specific reason only.\r\n\r\nIf we ask for your personal information for a secondary reason, like marketing, we will either ask you directly for your expressed consent, or provide you with an opportunity to say no.\r\n\r\n\r\n\r\nHow do I withdraw my consent?\r\n\r\nIf after you opt-in, you change your mind, you may withdraw your consent for us to contact you, for the continued collection, use or disclosure of your information, at anytime, by contacting us at [ [ email@email.com ] ] or mailing us at: [ [ Business Name ] ] [ [  Address ] ] [ [ City ] ] [ [ State ] ] [ [ Country ] ] [ [ PostCode ] ]\r\n\r\n\r\nSECTION 3 - DISCLOSURE\r\n\r\n\r\n\r\nWe may disclose your personal information if we are required by law to do so or if you violate our Terms of Service.\r\n\r\n\r\n\r\nSECTION 4 - THE SOFTWARE COMPANY\r\n\r\n\r\n\r\nOur store is hosted on a third party company. They provide us with the online e-commerce platform that allows us to sell our products and services to you.\r\n\r\nYour data is stored through third party data storage, databases and the general application. They store your data on a secure server behind a firewall.\r\n\r\n\r\n\r\nPayment:\r\n\r\nAll direct payment gateways adhere to the standards set by PCI-DSS as managed by the PCI Security Standards Council, which is a joint effort of brands like Visa, MasterCard, American Express and Discover.\r\n\r\nPCI-DSS requirements help ensure the secure handling of credit card information by our store and its service providers.\r\n\r\n\r\n\r\n\r\nSECTION 5 - THIRD-PARTY SERVICES\r\n\r\n\r\n\r\nIn general, the third-party providers used by us will only collect, use and disclose your information to the extent necessary to allow them to perform the services they provide to us.\r\n\r\nHowever, certain third-party service providers, such as payment gateways and other payment transaction processors, have their own privacy policies in respect to the information we are required to provide to them for your purchase-related transactions.\r\n\r\nFor these providers, we recommend that you read their privacy policies so you can understand the manner in which your personal information will be handled by these providers.\r\n\r\nIn particular, remember that certain providers may be located in or have facilities that are located a different jurisdiction than either you or us. So if you elect to proceed with a transaction that involves the services of a third-party service provider, then your information may become subject to the laws of the jurisdiction(s) in which that service provider or its facilities are located.\r\n\r\nAs an example, if you are located in Canada and your transaction is processed by a payment gateway located in the United States, then your personal information used in completing that transaction may be subject to disclosure under United States legislation, including the Patriot Act.\r\n\r\nOnce you leave our store’s website or are redirected to a third-party website or application, you are no longer governed by this Privacy Policy or our website’s Terms of Service.\r\n\r\n\r\n\r\nLinks\r\n\r\nWhen you click on links on our store, they may direct you away from our site. We are not responsible for the privacy practices of other sites and encourage you to read their privacy statements.\r\n\r\nSECTION 6 - SECURITY\r\n\r\n\r\n\r\nTo protect your personal information, we take reasonable precautions and follow industry best practices to make sure it is not inappropriately lost, misused, accessed, disclosed, altered or destroyed.\r\n\r\nIf you provide us with your credit card information, the information is encrypted using secure socket layer technology (SSL) and stored with a AES-256 encryption.  Although no method of transmission over the Internet or electronic storage is 100% secure, we follow all PCI-DSS requirements and implement additional generally accepted industry standards.\r\n\r\n\r\n\r\n\r\nSECTION 8 - AGE OF CONSENT\r\n\r\n\r\n\r\n By using this site, you represent that you are at least the age of majority in your state or province of residence, or that you are the age of majority in your state or province of residence and you have given us your consent to allow any of your minor dependents to use this site.\r\n\r\n\r\n\r\nSECTION 9 - CHANGES TO THIS PRIVACY POLICY\r\n\r\n\r\n\r\nWe reserve the right to modify this privacy policy at any time, so please review it frequently. Changes and clarifications will take effect immediately upon their posting on the website. If we make material changes to this policy, we will notify you here that it has been updated, so that you are aware of what information we collect, how we use it, and under what circumstances, if any, we use and/or disclose it.\r\n\r\nIf our store is acquired or merged with another company, your information may be transferred to the new owners so that we may continue to sell products to you.\r\n\r\n\r\n\r\nQUESTIONS AND CONTACT INFORMATION\r\n\r\n\r\n\r\nIf you would like to: access, correct, amend or delete any personal information we have about you, register a complaint, or simply want more information contact our Privacy Compliance Officer at [ [ email@email.com ] ] or by mail at [ [ Business Name ] ]\r\n\r\n[Re: Privacy Compliance Officer]\r\n\r\n[[ [  Address ] ] [ [ City ] ] [ [ State ] ] [ [ Country ] ] [ [ PostCode ] ]]\r\n\r\n----\r\n', 'TERMS OF SERVICE\r\n\r\n\r\n\r\n-----\r\n\r\n\r\n\r\nOVERVIEW\r\n\r\n\r\n\r\nThis website is operated by [ [ Business Name ] ]. Throughout the site, the terms “we”, “us” and “our” refer to [ [ Business Name ] ]. [ [ Business Name ] ] offers this website, including all information, tools and services available from this site to you, the user, conditioned upon your acceptance of all terms, conditions, policies and notices stated here.\r\n\r\n\r\n\r\nBy visiting our site and/ or purchasing something from us, you engage in our “Service” and agree to be bound by the following terms and conditions (“Terms of Service”, “Terms”), including those additional terms and conditions and policies referenced herein and/or available by hyperlink. These Terms of Service apply  to all users of the site, including without limitation users who are browsers, vendors, customers, merchants, and/ or contributors of content.\r\n\r\n\r\n\r\nPlease read these Terms of Service carefully before accessing or using our website. By accessing or using any part of the site, you agree to be bound by these Terms of Service. If you do not agree to all the terms and conditions of this agreement, then you may not access the website or use any services. If these Terms of Service are considered an offer, acceptance is expressly limited to these Terms of Service.\r\n\r\n\r\n\r\nAny new features or tools which are added to the current store shall also be subject to the Terms of Service. You can review the most current version of the Terms of Service at any time on this page. We reserve the right to update, change or replace any part of these Terms of Service by posting updates and/or changes to our website. It is your responsibility to check this page periodically for changes. Your continued use of or access to the website following the posting of any changes constitutes acceptance of those changes.\r\n\r\n\r\n\r\nOur store is hosted on a third party company. They provide us with the online e-commerce platform that allows us to sell our products and services to you.\r\n\r\n\r\n\r\nSECTION 1 - ONLINE STORE TERMS\r\n\r\n\r\n\r\nBy agreeing to these Terms of Service, you represent that you are at least the age of majority in your state or province of residence, or that you are the age of majority in your state or province of residence and you have given us your consent to allow any of your minor dependents to use this site.\r\n\r\nYou may not use our products for any illegal or unauthorized purpose nor may you, in the use of the Service, violate any laws in your jurisdiction (including but not limited to copyright laws).\r\n\r\nYou must not transmit any worms or viruses or any code of a destructive nature.\r\n\r\nA breach or violation of any of the Terms will result in an immediate termination of your Services.\r\n\r\n\r\n\r\nSECTION 2 - GENERAL CONDITIONS\r\n\r\n\r\n\r\nWe reserve the right to refuse service to anyone for any reason at any time.\r\n\r\nYou understand that your content (not including credit card information), may be transferred unencrypted and involve (a) transmissions over various networks; and (b) changes to conform and adapt to technical requirements of connecting networks or devices. Credit card information is always encrypted during transfer over networks.\r\n\r\nYou agree not to reproduce, duplicate, copy, sell, resell or exploit any portion of the Service, use of the Service, or access to the Service or any contact on the website through which the service is provided, without express written permission by us.\r\n\r\nThe headings used in this agreement are included for convenience only and will not limit or otherwise affect these Terms.\r\n\r\n\r\n\r\nSECTION 3 - ACCURACY, COMPLETENESS AND TIMELINESS OF INFORMATION\r\n\r\n\r\n\r\nWe are not responsible if information made available on this site is not accurate, complete or current. The material on this site is provided for general information only and should not be relied upon or used as the sole basis for making decisions without consulting primary, more accurate, more complete or more timely sources of information. Any reliance on the material on this site is at your own risk.\r\n\r\nThis site may contain certain historical information. Historical information, necessarily, is not current and is provided for your reference only. We reserve the right to modify the contents of this site at any time, but we have no obligation to update any information on our site. You agree that it is your responsibility to monitor changes to our site.\r\n\r\n\r\n\r\nSECTION 4 - MODIFICATIONS TO THE SERVICE AND PRICES\r\n\r\n\r\n\r\nPrices for our products are subject to change without notice.\r\n\r\nWe reserve the right at any time to modify or discontinue the Service (or any part or content thereof) without notice at any time.\r\n\r\nWe shall not be liable to you or to any third-party for any modification, price change, suspension or discontinuance of the Service.\r\n\r\n\r\n\r\nSECTION 5 - PRODUCTS OR SERVICES (if applicable)\r\n\r\n\r\n\r\nCertain products or services may be available exclusively online through the website. These products or services may have limited quantities and are subject to return or exchange only according to our Return Policy.\r\n\r\nWe have made every effort to display as accurately as possible the colors and images of our products that appear at the store. We cannot guarantee that your computer monitor''s display of any color will be accurate.\r\n\r\nWe reserve the right, but are not obligated, to limit the sales of our products or Services to any person, geographic region or jurisdiction. We may exercise this right on a case-by-case basis. We reserve the right to limit the quantities of any products or services that we offer. All descriptions of products or product pricing are subject to change at anytime without notice, at the sole discretion of us. We reserve the right to discontinue any product at any time. Any offer for any product or service made on this site is void where prohibited.\r\n\r\nWe do not warrant that the quality of any products, services, information, or other material purchased or obtained by you will meet your expectations, or that any errors in the Service will be corrected.\r\n\r\n\r\n\r\nSECTION 6 - ACCURACY OF BILLING AND ACCOUNT INFORMATION\r\n\r\n\r\n\r\nWe reserve the right to refuse any order you place with us. We may, in our sole discretion, limit or cancel quantities purchased per person, per household or per order. These restrictions may include orders placed by or under the same customer account, the same credit card, and/or orders that use the same billing and/or shipping address. In the event that we make a change to or cancel an order, we may attempt to notify you by contacting the e-mail and/or billing address/phone number provided at the time the order was made. We reserve the right to limit or prohibit orders that, in our sole judgment, appear to be placed by dealers, resellers or distributors.\r\n\r\n\r\n\r\nYou agree to provide current, complete and accurate purchase and account information for all purchases made at our store. You agree to promptly update your account and other information, including your email address and credit card numbers and expiration dates, so that we can complete your transactions and contact you as needed.\r\n\r\n\r\n\r\nFor more detail, please review our Returns Policy.\r\n\r\n\r\n\r\nSECTION 7 - OPTIONAL TOOLS\r\n\r\n\r\n\r\nWe may provide you with access to third-party tools over which we neither monitor nor have any control nor input.\r\n\r\nYou acknowledge and agree that we provide access to such tools ”as is” and “as available” without any warranties, representations or conditions of any kind and without any endorsement. We shall have no liability whatsoever arising from or relating to your use of optional third-party tools.\r\n\r\nAny use by you of optional tools offered through the site is entirely at your own risk and discretion and you should ensure that you are familiar with and approve of the terms on which tools are provided by the relevant third-party provider(s).\r\n\r\nWe may also, in the future, offer new services and/or features through the website (including, the release of new tools and resources). Such new features and/or services shall also be subject to these Terms of Service.\r\n\r\n\r\n\r\nSECTION 8 - THIRD-PARTY LINKS\r\n\r\n\r\n\r\nCertain content, products and services available via our Service may include materials from third-parties.\r\n\r\nThird-party links on this site may direct you to third-party websites that are not affiliated with us. We are not responsible for examining or evaluating the content or accuracy and we do not warrant and will not have any liability or responsibility for any third-party materials or websites, or for any other materials, products, or services of third-parties.\r\n\r\nWe are not liable for any harm or damages related to the purchase or use of goods, services, resources, content, or any other transactions made in connection with any third-party websites. Please review carefully the third-party''s policies and practices and make sure you understand them before you engage in any transaction. Complaints, claims, concerns, or questions regarding third-party products should be directed to the third-party.\r\n\r\n\r\n\r\nSECTION 9 - USER COMMENTS, FEEDBACK AND OTHER SUBMISSIONS\r\n\r\n\r\n\r\nIf, at our request, you send certain specific submissions (for example contest entries) or without a request from us you send creative ideas, suggestions, proposals, plans, or other materials, whether online, by email, by postal mail, or otherwise (collectively, ''comments''), you agree that we may, at any time, without restriction, edit, copy, publish, distribute, translate and otherwise use in any medium any comments that you forward to us. We are and shall be under no obligation (1) to maintain any comments in confidence; (2) to pay compensation for any comments; or (3) to respond to any comments.\r\n\r\nWe may, but have no obligation to, monitor, edit or remove content that we determine in our sole discretion are unlawful, offensive, threatening, libelous, defamatory, pornographic, obscene or otherwise objectionable or violates any party’s intellectual property or these Terms of Service.\r\n\r\nYou agree that your comments will not violate any right of any third-party, including copyright, trademark, privacy, personality or other personal or proprietary right. You further agree that your comments will not contain libelous or otherwise unlawful, abusive or obscene material, or contain any computer virus or other malware that could in any way affect the operation of the Service or any related website. You may not use a false e-mail address, pretend to be someone other than yourself, or otherwise mislead us or third-parties as to the origin of any comments. You are solely responsible for any comments you make and their accuracy. We take no responsibility and assume no liability for any comments posted by you or any third-party.\r\n\r\n\r\n\r\nSECTION 10 - PERSONAL INFORMATION\r\n\r\n\r\n\r\nYour submission of personal information through the store is governed by our Privacy Policy. To view our Privacy Policy.\r\n\r\n\r\n\r\nSECTION 11 - ERRORS, INACCURACIES AND OMISSIONS\r\n\r\n\r\n\r\nOccasionally there may be information on our site or in the Service that contains typographical errors, inaccuracies or omissions that may relate to product descriptions, pricing, promotions, offers, product shipping charges, transit times and availability. We reserve the right to correct any errors, inaccuracies or omissions, and to change or update information or cancel orders if any information in the Service or on any related website is inaccurate at any time without prior notice (including after you have submitted your order).\r\n\r\nWe undertake no obligation to update, amend or clarify information in the Service or on any related website, including without limitation, pricing information, except as required by law. No specified update or refresh date applied in the Service or on any related website, should be taken to indicate that all information in the Service or on any related website has been modified or updated.\r\n\r\n\r\n\r\nSECTION 12 - PROHIBITED USES\r\n\r\n\r\n\r\nIn addition to other prohibitions as set forth in the Terms of Service, you are prohibited from using the site or its content: (a) for any unlawful purpose; (b) to solicit others to perform or participate in any unlawful acts; (c) to violate any international, federal, provincial or state regulations, rules, laws, or local ordinances; (d) to infringe upon or violate our intellectual property rights or the intellectual property rights of others; (e) to harass, abuse, insult, harm, defame, slander, disparage, intimidate, or discriminate based on gender, sexual orientation, religion, ethnicity, race, age, national origin, or disability; (f) to submit false or misleading information; (g) to upload or transmit viruses or any other type of malicious code that will or may be used in any way that will affect the functionality or operation of the Service or of any related website, other websites, or the Internet; (h) to collect or track the personal information of others; (i) to spam, phish, pharm, pretext, spider, crawl, or scrape; (j) for any obscene or immoral purpose; or (k) to interfere with or circumvent the security features of the Service or any related website, other websites, or the Internet. We reserve the right to terminate your use of the Service or any related website for violating any of the prohibited uses.\r\n\r\n\r\n\r\nSECTION 13 - DISCLAIMER OF WARRANTIES; LIMITATION OF LIABILITY\r\n\r\n\r\n\r\nWe do not guarantee, represent or warrant that your use of our service will be uninterrupted, timely, secure or error-free.\r\n\r\nWe do not warrant that the results that may be obtained from the use of the service will be accurate or reliable.\r\n\r\nYou agree that from time to time we may remove the service for indefinite periods of time or cancel the service at any time, without notice to you.\r\n\r\nYou expressly agree that your use of, or inability to use, the service is at your sole risk. The service and all products and services delivered to you through the service are (except as expressly stated by us) provided ''as is'' and ''as available'' for your use, without any representation, warranties or conditions of any kind, either express or implied, including all implied warranties or conditions of merchantability, merchantable quality, fitness for a particular purpose, durability, title, and non-infringement.\r\n\r\nIn no case shall [ [ Business Name ] ], our directors, officers, employees, affiliates, agents, contractors, interns, suppliers, service providers or licensors be liable for any injury, loss, claim, or any direct, indirect, incidental, punitive, special, or consequential damages of any kind, including, without limitation lost profits, lost revenue, lost savings, loss of data, replacement costs, or any similar damages, whether based in contract, tort (including negligence), strict liability or otherwise, arising from your use of any of the service or any products procured using the service, or for any other claim related in any way to your use of the service or any product, including, but not limited to, any errors or omissions in any content, or any loss or damage of any kind incurred as a result of the use of the service or any content (or product) posted, transmitted, or otherwise made available via the service, even if advised of their possibility. Because some states or jurisdictions do not allow the exclusion or the limitation of liability for consequential or incidental damages, in such states or jurisdictions, our liability shall be limited to the maximum extent permitted by law.\r\n\r\n\r\n\r\nSECTION 14 - INDEMNIFICATION\r\n\r\n\r\n\r\nYou agree to indemnify, defend and hold harmless [ [ Business Name ] ] and our parent, subsidiaries, affiliates, partners, officers, directors, agents, contractors, licensors, service providers, subcontractors, suppliers, interns and employees, harmless from any claim or demand, including reasonable attorneys’ fees, made by any third-party due to or arising out of your breach of these Terms of Service or the documents they incorporate by reference, or your violation of any law or the rights of a third-party.\r\n\r\n\r\n\r\nSECTION 15 - SEVERABILITY\r\n\r\n\r\n\r\nIn the event that any provision of these Terms of Service is determined to be unlawful, void or unenforceable, such provision shall nonetheless be enforceable to the fullest extent permitted by applicable law, and the unenforceable portion shall be deemed to be severed from these Terms of Service, such determination shall not affect the validity and enforceability of any other remaining provisions.\r\n\r\n\r\n\r\nSECTION 16 - TERMINATION\r\n\r\n\r\n\r\nThe obligations and liabilities of the parties incurred prior to the termination date shall survive the termination of this agreement for all purposes.\r\n\r\nThese Terms of Service are effective unless and until terminated by either you or us. You may terminate these Terms of Service at any time by notifying us that you no longer wish to use our Services, or when you cease using our site.\r\n\r\nIf in our sole judgment you fail, or we suspect that you have failed, to comply with any term or provision of these Terms of Service, we also may terminate this agreement at any time without notice and you will remain liable for all amounts due up to and including the date of termination; and/or accordingly may deny you access to our Services (or any part thereof).\r\n\r\n\r\n\r\nSECTION 17 - ENTIRE AGREEMENT\r\n\r\n\r\n\r\nThe failure of us to exercise or enforce any right or provision of these Terms of Service shall not constitute a waiver of such right or provision.\r\n\r\nThese Terms of Service and any policies or operating rules posted by us on this site or in respect to The Service constitutes the entire agreement and understanding between you and us and govern your use of the Service, superseding any prior or contemporaneous agreements, communications and proposals, whether oral or written, between you and us (including, but not limited to, any prior versions of the Terms of Service).\r\n\r\nAny ambiguities in the interpretation of these Terms of Service shall not be construed against the drafting party.\r\n\r\n\r\n\r\nSECTION 18 - GOVERNING LAW\r\n\r\n\r\n\r\nThese Terms of Service and any separate agreements whereby we provide you Services shall be governed by and construed in accordance with the laws of [ [  Address ] ] [ [ City ] ] [ [ State ] ] [ [ Country ] ] [ [ PostCode ] ].\r\n\r\n\r\n\r\nSECTION 19 - CHANGES TO TERMS OF SERVICE\r\n\r\n\r\n\r\nYou can review the most current version of the Terms of Service at any time at this page.\r\n\r\nWe reserve the right, at our sole discretion, to update, change or replace any part of these Terms of Service by posting updates and changes to our website. It is your responsibility to check our website periodically for changes. Your continued use of or access to our website or the Service following the posting of any changes to these Terms of Service constitutes acceptance of those changes.\r\n\r\n\r\n\r\nSECTION 20 - CONTACT INFORMATION\r\n\r\n\r\n\r\nQuestions about the Terms of Service should be sent to us at [ [ email@email.com ] ].\r\n\r\n\r\n\r\n\r\n\r\n--------------------------------------\r\n', 'AIzaSyCutQnEgrqX8W2X-nBCYB7-CbsTC-LlRMw', '2016-11-26 12:48:18', '2016-11-26 12:48:18', NULL);

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
(1, 1, 'Free Products', '2016-11-26 12:48:19', '2016-11-26 12:48:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'visitor', '34285', '2016-12-04 18:00:44', '2016-12-28 13:21:26');

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
(1, 1, 7, 44, 'Order #7 open', '2016-12-13 13:23:34', '2016-12-13 13:23:34'),
(2, 1, 7, 44, 'cart', '2016-12-13 13:23:34', '2016-12-13 13:23:34'),
(3, 4, 1, 44, '7', '2016-12-13 13:23:34', '2016-12-13 13:23:34'),
(4, 1, 7, 44, 'Order #7 open', '2016-12-13 13:24:06', '2016-12-13 13:24:06'),
(5, 1, 8, 44, 'Order #8 open', '2016-12-13 14:20:08', '2016-12-13 14:20:08'),
(6, 2, 8, 44, 'Order #8 pending', '2016-12-13 14:24:20', '2016-12-13 14:24:20'),
(7, 11, 8, 44, 'Order #8 sent', '2016-12-13 14:24:45', '2016-12-13 14:24:45'),
(8, 8, 8, 44, 'Order #8 closed', '2016-12-13 14:26:39', '2016-12-13 14:26:39'),
(9, 1, 9, 46, 'Order #9 open', '2016-12-16 14:05:14', '2016-12-16 14:05:14'),
(10, 1, 9, 46, 'cart', '2016-12-16 14:05:14', '2016-12-16 14:05:14'),
(11, 4, 2, 46, '9', '2016-12-16 14:05:15', '2016-12-16 14:05:15'),
(12, 1, 9, 46, 'Order #9 open', '2016-12-16 14:06:14', '2016-12-16 14:06:14'),
(13, 1, 10, 46, 'Order #10 open', '2016-12-16 14:27:14', '2016-12-16 14:27:14'),
(14, 4, 3, 46, '9', '2016-12-16 14:33:51', '2016-12-16 14:33:51'),
(15, 1, 11, 46, 'Order #11 open', '2016-12-16 14:34:05', '2016-12-16 14:34:05'),
(16, 1, 12, 44, 'Order #12 open', '2016-12-26 13:47:10', '2016-12-26 13:47:10'),
(17, 1, 12, 44, 'wishlist', '2016-12-26 13:47:10', '2016-12-26 13:47:10'),
(18, 4, 4, 44, '12', '2016-12-26 13:47:10', '2016-12-26 13:47:10'),
(19, 4, 5, 44, '7', '2016-12-26 13:47:39', '2016-12-26 13:47:39'),
(20, 1, 13, 44, 'Order #13 open', '2016-12-26 13:48:02', '2016-12-26 13:48:02'),
(21, 8, 13, 44, 'Order #13 closed', '2016-12-26 14:05:51', '2016-12-26 14:05:51'),
(22, 8, 8, 44, 'Order #8 closed', '2016-12-27 16:10:44', '2016-12-27 16:10:44'),
(23, 8, 8, 44, 'Order #8 closed', '2016-12-27 16:11:05', '2016-12-27 16:11:05'),
(24, 8, 8, 44, 'Order #8 closed', '2016-12-27 16:11:14', '2016-12-27 16:11:14'),
(25, 8, 8, 44, 'Order #8 closed', '2016-12-27 16:11:22', '2016-12-27 16:11:22'),
(26, 8, 8, 44, 'Order #8 closed', '2016-12-27 16:15:40', '2016-12-27 16:15:40'),
(27, 8, 8, 44, 'Order #8 closed', '2016-12-27 16:16:35', '2016-12-27 16:16:35'),
(28, 8, 8, 44, 'Order #8 closed', '2016-12-27 16:33:34', '2016-12-27 16:33:34'),
(29, 8, 8, 44, 'Order #8 closed', '2016-12-27 16:44:09', '2016-12-27 16:44:09'),
(30, 8, 8, 44, 'Order #8 closed', '2016-12-27 16:54:33', '2016-12-27 16:54:33'),
(31, 8, 8, 44, 'Order #8 closed', '2016-12-27 16:55:02', '2016-12-27 16:55:02'),
(32, 8, 8, 44, 'Order #8 closed', '2016-12-27 16:55:06', '2016-12-27 16:55:06'),
(33, 8, 8, 44, 'Order #8 closed', '2016-12-27 16:55:11', '2016-12-27 16:55:11'),
(34, 8, 8, 44, 'Order #8 closed', '2016-12-27 16:55:15', '2016-12-27 16:55:15'),
(35, 8, 8, 44, 'Order #8 closed', '2016-12-27 16:55:25', '2016-12-27 16:55:25'),
(36, 8, 8, 44, 'Order #8 closed', '2016-12-27 16:56:31', '2016-12-27 16:56:31'),
(37, 8, 8, 44, 'Order #8 closed', '2016-12-27 16:58:27', '2016-12-27 16:58:27'),
(38, 8, 8, 44, 'Order #8 closed', '2016-12-27 16:58:31', '2016-12-27 16:58:31'),
(39, 8, 8, 44, 'Order #8 closed', '2016-12-27 16:58:36', '2016-12-27 16:58:36'),
(40, 8, 8, 44, 'Order #8 closed', '2016-12-27 17:05:15', '2016-12-27 17:05:15'),
(41, 8, 8, 44, 'Order #8 closed', '2016-12-28 13:20:57', '2016-12-28 13:20:57'),
(42, 8, 8, 44, 'Order #8 closed', '2016-12-28 13:21:04', '2016-12-28 13:21:04');

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
(1, 45, 44, 1, 8, 'new', '2016-12-13 14:20:08', '2016-12-13 14:20:08'),
(2, 44, 45, 15, 8, 'read', '2016-12-13 14:24:20', '2016-12-25 12:50:36'),
(3, 44, 45, 11, 8, 'read', '2016-12-13 14:24:45', '2016-12-13 14:25:48'),
(4, 45, 44, 10, 8, 'new', '2016-12-13 14:26:39', '2016-12-13 14:26:39'),
(5, 45, 46, 1, 10, 'new', '2016-12-16 14:27:15', '2016-12-16 14:27:15'),
(6, 45, 46, 1, 11, 'new', '2016-12-16 14:34:05', '2016-12-16 14:34:05'),
(7, 45, 44, 1, 13, 'new', '2016-12-26 13:48:02', '2016-12-26 13:48:02'),
(8, 45, 44, 10, 13, 'new', '2016-12-26 14:05:51', '2016-12-26 14:05:51'),
(9, 45, 44, 14, 8, 'new', '2016-12-26 14:06:33', '2016-12-26 14:06:33');

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
  `pay_mode` enum('cod','online') COLLATE utf8_unicode_ci NOT NULL,
  `order_track_status` enum('initiated','packed','dispatched','delivered') COLLATE utf8_unicode_ci DEFAULT NULL,
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

INSERT INTO `orders` (`id`, `user_id`, `address_id`, `seller_id`, `status`, `type`, `pay_mode`, `order_track_status`, `description`, `end_date`, `rate`, `rate_comment`, `rate_mail_sent`, `created_at`, `updated_at`) VALUES
(7, 44, 23, NULL, 'open', 'cart', 'cod', '', NULL, NULL, NULL, NULL, 0, '2016-12-13 13:23:34', '2016-12-13 13:24:06'),
(8, 44, 23, 45, 'closed', 'order', 'cod', 'packed', NULL, '2016-12-14 01:26:39', NULL, NULL, 0, '2016-12-13 14:20:07', '2016-12-28 13:21:04'),
(9, 46, 25, NULL, 'open', 'cart', 'cod', NULL, NULL, NULL, NULL, NULL, 0, '2016-12-16 14:05:14', '2016-12-16 14:06:13'),
(10, 46, 25, 45, 'open', 'order', 'cod', NULL, NULL, NULL, NULL, NULL, 0, '2016-12-16 14:27:14', '2016-12-16 14:27:14'),
(11, 46, 25, 45, 'open', 'order', 'cod', NULL, NULL, NULL, NULL, NULL, 0, '2016-12-16 14:34:05', '2016-12-16 14:34:05'),
(12, 44, NULL, NULL, 'open', 'wishlist', 'cod', NULL, NULL, NULL, NULL, NULL, 0, '2016-12-26 13:47:10', '2016-12-26 13:47:10'),
(13, 44, 23, 45, 'closed', 'order', 'cod', NULL, NULL, '2016-12-27 01:05:51', NULL, NULL, 0, '2016-12-26 13:48:02', '2016-12-26 14:05:51');

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
(1, 8, 6, 300.00, 1, 1, NULL, 3, '', '2016-12-13 13:23:34', '2016-12-26 14:06:33'),
(2, 10, 6, 300.00, 1, 1, NULL, NULL, NULL, '2016-12-16 14:05:15', '2016-12-16 14:27:15'),
(3, 11, 6, 300.00, 1, 1, NULL, NULL, NULL, '2016-12-16 14:33:51', '2016-12-16 14:34:05'),
(5, 13, 6, 300.00, 2, 1, NULL, NULL, NULL, '2016-12-26 13:47:25', '2016-12-26 13:48:02');

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
(1, 'Amol', 'Khaire', '2016-12-11', 'male', '+3898824200844'),
(42, 'Amol1', 'Khaire1', '2016-12-05', 'male', NULL),
(43, 'Amol', 'Khaire', NULL, 'female', NULL),
(44, 'Atul1', 'Atode', '1992-09-05', 'female', NULL),
(45, 'Amol', 'Khaire', '2016-12-14', 'female', NULL),
(46, 'Pradeep', 'Pandey', NULL, 'female', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pincodes`
--

CREATE TABLE `pincodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `pincode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `area` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `disabled_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pincodes`
--

INSERT INTO `pincodes` (`id`, `country_id`, `state_id`, `city_id`, `pincode`, `area`, `remember_token`, `created_at`, `updated_at`, `disabled_at`, `deleted_at`) VALUES
(1, 1, 1, 1, '411058', 'Waraje', NULL, NULL, NULL, NULL, NULL),
(2, 1, 1, 2, '411038', 'Kothrud', NULL, NULL, NULL, NULL, NULL);

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
  `features` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `rate_val` double(10,2) DEFAULT NULL,
  `rate_count` int(11) DEFAULT NULL,
  `sale_counts` int(10) UNSIGNED NOT NULL,
  `view_counts` int(10) UNSIGNED NOT NULL,
  `product_status` enum('active','approved','rejected') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `user_id`, `parent_id`, `products_group`, `status`, `type`, `name`, `description`, `price`, `stock`, `low_stock`, `bar_code`, `brand`, `condition`, `tags`, `features`, `rate_val`, `rate_count`, `sale_counts`, `view_counts`, `product_status`, `created_at`, `updated_at`) VALUES
(6, 1, 45, NULL, NULL, 1, 'software', 'AmolKhaire96 product 1', 'AmolKhaire96 product 1  Description:  AmolKhaire96 product 1  Description: ', 300.00, 15, 10, NULL, 'puma', 'new', NULL, '{"images":["\\/img\\/products\\/image\\/45\\/122b269f8acf1519e41d5ccdfa0b67af.jpg","\\/img\\/products\\/image\\/45\\/a25f60744e05f4f428eda0f39c596651.jpg"],"weight":["500gm",""],"dimensions":["100X100m",""],"color":["black",""],"model":["dasf2",""]}', 3.00, 1, 3, 1, 'approved', '2016-12-13 13:12:11', '2016-12-26 14:06:33'),
(7, 2, 45, NULL, NULL, 1, 'software', 'amolkhaire96 fproduct 2', 'amolkhaire96 fproduct 2 descamolkhaire96 fproduct 2 descamolkhaire96 fproduct 2 desc', 300.00, 20, 12, NULL, 'sony music', 'new', NULL, '{"images":["\\/img\\/products\\/image\\/45\\/9fa7c2e57c390f7adc56ed985fa5947c.jpg","\\/img\\/products\\/image\\/45\\/81b491b10fbd8eb4e978c0a500338ea4.jpg"],"weight":["150",""],"dimensions":["100X100m",""],"color":["dasd",""],"model":["at20",""]}', NULL, NULL, 0, 1, 'approved', '2016-12-13 13:15:54', '2016-12-13 13:21:45');

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
(1, 'images', 'image', '{}', '{"images_1":"required_without_all:feature_images_2,feature_images_3,feature_images_4,feature_images_5,|","images_2":"required_without_all:feature_images_1,feature_images_3,feature_images_4,feature_images_5,|","images_3":"required_without_all:feature_image', '{}', 'all', 5, 'active', '2016-11-29 05:00:33', '2016-11-29 05:00:33'),
(2, 'virtual weight', 'text', '{}', '{}', '{}', 'key', 1, 'active', '2016-11-29 05:00:33', '2016-11-29 05:00:33'),
(3, 'OS', 'text', '{}', '{}', '{}', 'key', 1, 'active', '2016-11-29 05:00:34', '2016-11-29 05:00:34'),
(4, 'weight', 'text', '{}', '{}', '{}', 'item', 1, 'active', '2016-11-29 05:00:34', '2016-11-29 05:00:34'),
(5, 'dimensions', 'text', '{}', '{}', '{}', 'item', 1, 'active', '2016-11-29 05:00:34', '2016-11-29 05:00:34'),
(6, 'color', 'text', '{}', '{}', '{}', 'item', 1, 'active', '2016-11-29 05:00:34', '2016-11-29 05:00:34'),
(7, 'model', 'text', '{}', '{}', '{}', 'all', 1, 'active', '2016-11-29 05:00:34', '2016-11-29 05:00:34');

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

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mihpayid` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `txnid` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `productinfo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `PG_TYPE` varchar(255) NOT NULL,
  `name_on_card` varchar(255) NOT NULL,
  `cardnum` varchar(255) NOT NULL,
  `payuMoneyId` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `net_amount_debit` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `user_id`, `mihpayid`, `status`, `txnid`, `amount`, `productinfo`, `email`, `phone`, `PG_TYPE`, `name_on_card`, `cardnum`, `payuMoneyId`, `discount`, `net_amount_debit`, `created_at`, `updated_at`) VALUES
(3, 44, '403993715515368147', 'success', 'c0abf571c00d60a4e64c', '10.0', 'fastrack', 'atulatode@gmail.com', '9403326847', 'AXISPG', 'payu', '512345XXXXXX2346', '1110960818', '0.00', '10', '2016-12-13 14:20:07', '2016-12-13 14:20:07'),
(4, 44, '403993715515368147', 'success', 'c0abf571c00d60a4e64c', '10.0', 'fastrack', 'atulatode@gmail.com', '9403326847', 'AXISPG', 'payu', '512345XXXXXX2346', '1110960818', '0.00', '10', '2016-12-13 14:20:57', '2016-12-13 14:20:57');

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
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `pic_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `mobile_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pincode_id` int(11) NOT NULL,
  `area` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `work_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate_val` int(11) DEFAULT NULL,
  `rate_count` int(11) DEFAULT NULL,
  `role` enum('admin','business','nonprofit','person','subadmin') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'person',
  `type` enum('normal','trusted','rejected') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'normal',
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

INSERT INTO `users` (`id`, `email`, `nickname`, `password`, `pic_url`, `language`, `mobile_phone`, `pincode_id`, `area`, `work_phone`, `website`, `twitter`, `facebook`, `description`, `time_zone`, `rate_val`, `rate_count`, `role`, `type`, `verified`, `preferences`, `remember_token`, `created_at`, `updated_at`, `disabled_at`, `deleted_at`) VALUES
(1, 'amolkhaire96@gmail.com', '', '$2y$10$zol9IxNFKAZnRJsGwvh4l.WtsjCExRV.b0hX0ECy7c44hx4855HjG', '/img/profile/1/d86b66a653f7ddbe719b96f9bcb0a29a.jpg', 'en', NULL, 0, '', NULL, '', '@gocanto', 'gocanto', NULL, NULL, NULL, NULL, 'admin', 'trusted', 'yes', '{"product_viewed":[],"product_purchased":[{"tag":"\\"rerum","updated_at":"2016-12-03 13:54:42"},{"tag":"adipisci","updated_at":"2016-12-03 13:54:42"},{"tag":"qui\\"","updated_at":"2016-12-03 13:54:42"}],"product_shared":[],"product_categories":[1,2,5,8,11,3', 'bc0FCbnxEAc20sm2ke108BdD5ri2SLidoWgCmMegoGO1uKzVurCQmMc9cvsm', '2016-11-26 12:46:57', '2016-12-28 13:21:25', NULL, NULL),
(44, 'atulatode@gmail.com', 'atulatode@gmail.com', '$2y$10$zol9IxNFKAZnRJsGwvh4l.WtsjCExRV.b0hX0ECy7c44hx4855HjG', '/img/profile/44/3b68c663b91c6faaa5fee86836aa0eba.jpg', 'en', '8390806703', 0, '', NULL, '', '', '', NULL, NULL, NULL, NULL, 'person', 'normal', 'yes', NULL, 'PuBxK0759kXPcC7F3d4H9RmH9zak92Ph0qqv5gxzSgQ6Taz57duwSKgnX8w6', '2016-12-11 12:28:21', '2016-12-27 17:04:50', NULL, NULL),
(45, 'amol067@gmail.com', 'amolkhaire96@gmail.com', '$2y$10$zol9IxNFKAZnRJsGwvh4l.WtsjCExRV.b0hX0ECy7c44hx4855HjG', '/img/profile/45/57bee64ab3ed77ae46607c23058593ee.jpg', 'en', '8975707594', 0, '', NULL, '', '', '', NULL, NULL, NULL, NULL, 'business', 'trusted', 'yes', NULL, 'wEJ1pczNwGWtcLyxQTG2hvdJYShnNzEZH4EKlZtiq9GQDAIQpVXMw8lcme03', '2016-12-11 13:37:51', '2016-12-25 12:27:58', NULL, NULL),
(46, 'subadmin@subadmin.com', 'subadmin@subadmin.com', '$2y$10$zol9IxNFKAZnRJsGwvh4l.WtsjCExRV.b0hX0ECy7c44hx4855HjG', NULL, 'en', '9561313954', 1, 'kothrud', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'subadmin', 'normal', 'yes', NULL, NULL, '2016-12-16 12:28:50', '2016-12-16 12:28:50', NULL, NULL);

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
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `pincodes`
--
ALTER TABLE `pincodes`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `paypal_orders`
--
ALTER TABLE `paypal_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pincodes`
--
ALTER TABLE `pincodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `product_offers`
--
ALTER TABLE `product_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `type_preferences`
--
ALTER TABLE `type_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `user_points`
--
ALTER TABLE `user_points`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `virtual_products`
--
ALTER TABLE `virtual_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `virtual_product_orders`
--
ALTER TABLE `virtual_product_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

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
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
