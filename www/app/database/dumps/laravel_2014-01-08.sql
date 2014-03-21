# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: datastore.internal (MySQL 5.5.24-0ubuntu0.12.04.1-log)
# Database: laravel
# Generation Time: 2014-01-08 22:47:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table answers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `answers`;

CREATE TABLE `answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `option_ids` text COLLATE utf8_unicode_ci,
  `response_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;

INSERT INTO `answers` (`id`, `survey_id`, `question_id`, `user_id`, `option_ids`, `response_text`, `created_at`, `updated_at`)
VALUES
	(1,1,1,1,'[1,2]','Response!','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(14,3,10,24,NULL,'test','2013-12-05 15:23:37','2013-12-05 15:23:37'),
	(15,3,11,24,NULL,'','2013-12-05 15:23:47','2013-12-05 15:23:47'),
	(16,3,10,31,NULL,'xxx','2013-12-05 15:26:27','2013-12-05 15:26:27'),
	(17,3,11,31,NULL,'xxx','2013-12-05 15:26:36','2013-12-05 15:26:36'),
	(18,3,10,33,NULL,'','2013-12-05 15:31:56','2013-12-05 15:31:56'),
	(19,3,11,33,NULL,'','2013-12-05 15:32:01','2013-12-05 15:32:01'),
	(20,3,9,33,NULL,'Tide','2013-12-05 15:32:35','2013-12-05 15:32:35'),
	(21,3,12,33,'[2]','','2013-12-05 15:32:35','2013-12-05 15:32:35'),
	(22,3,13,33,'[0]','male','2013-12-05 15:32:35','2013-12-05 15:32:35'),
	(23,3,10,32,NULL,'','2013-12-05 15:41:06','2013-12-05 15:41:06'),
	(24,3,11,32,NULL,'','2013-12-05 15:41:10','2013-12-05 15:41:10'),
	(25,3,10,37,NULL,'','2013-12-05 15:46:37','2013-12-05 15:46:37'),
	(26,3,11,37,NULL,'','2013-12-05 15:46:44','2013-12-05 15:46:44'),
	(27,3,10,40,NULL,'','2013-12-05 15:50:33','2013-12-05 15:50:33'),
	(28,3,11,40,NULL,'','2013-12-05 15:50:39','2013-12-05 15:50:39'),
	(29,4,15,7,NULL,'It looks very similar to different online resources I\'ve used. That means it makes me think of technology and being modern which is what the company wants.','2013-12-06 15:14:45','2013-12-06 15:14:45'),
	(30,4,16,7,NULL,'I think the dotted \"P\" makes the design look like it is for a children\'s brand.','2013-12-06 15:15:15','2013-12-06 15:15:15'),
	(31,4,15,22,NULL,'You shouldnt feel like you have to go around anyone. My path is going right through. Maybe not a straight line but straight through.','2013-12-06 15:15:35','2013-12-06 15:15:35'),
	(32,4,17,7,'[0]','','2013-12-06 15:15:41','2013-12-06 15:15:41'),
	(33,4,18,7,'[0]','male','2013-12-06 15:15:41','2013-12-06 15:15:41'),
	(34,4,19,7,'[4]','','2013-12-06 15:15:41','2013-12-06 15:15:41'),
	(35,4,16,22,NULL,'Looks too kiddy','2013-12-06 15:15:54','2013-12-06 15:15:54'),
	(36,4,17,22,'[0]','','2013-12-06 15:16:21','2013-12-06 15:16:21'),
	(37,4,18,22,'[0]','male','2013-12-06 15:16:21','2013-12-06 15:16:21'),
	(38,4,19,22,'[3]','','2013-12-06 15:16:21','2013-12-06 15:16:21'),
	(39,4,15,6,NULL,'it looks unique and quite different to impress people of all ages','2013-12-06 15:16:51','2013-12-06 15:16:51'),
	(40,4,15,13,NULL,'The logo looks clean and tells a story. I think Millennials can identify with this logo and concept.','2013-12-06 15:16:56','2013-12-06 15:16:56'),
	(41,4,15,20,NULL,'This logo is creative. It\'s not just a simple dotted line under the company name. It makes the viewer look at it longer.','2013-12-06 15:17:04','2013-12-06 15:17:04'),
	(42,4,16,6,NULL,'looking something different and new','2013-12-06 15:17:09','2013-12-06 15:17:09'),
	(43,4,15,36,NULL,'It\'s the most visually engaging of the three. The graphics convey a sense of action and getting things done.','2013-12-06 15:17:21','2013-12-06 15:17:21'),
	(44,4,15,33,NULL,'This logo best describes the path that milennials have to take in todays day and age. The path is winding and crosses through  many obstacles but in the end milennials will make it out in one piece.','2013-12-06 15:17:25','2013-12-06 15:17:25'),
	(45,4,16,13,NULL,'It\'s not easily understandable upon first glance.','2013-12-06 15:17:35','2013-12-06 15:17:35'),
	(46,4,17,6,'[0]','','2013-12-06 15:17:40','2013-12-06 15:17:40'),
	(47,4,18,6,'[0]','male','2013-12-06 15:17:40','2013-12-06 15:17:40'),
	(48,4,19,6,'[1]','','2013-12-06 15:17:40','2013-12-06 15:17:40'),
	(49,4,16,36,NULL,'The graphics look antiquated and uninteresting.','2013-12-06 15:17:46','2013-12-06 15:17:46'),
	(50,4,15,40,NULL,'It is simple, modern, and conveys a sense of energy.','2013-12-06 15:17:54','2013-12-06 15:17:54'),
	(51,4,16,33,NULL,'This logo has an awkward design and makes me feel that people on this path will end up being confused and starting back at square 1.','2013-12-06 15:17:58','2013-12-06 15:17:58'),
	(52,4,17,36,'[3]','','2013-12-06 15:18:16','2013-12-06 15:18:16'),
	(53,4,18,36,'[0]','male','2013-12-06 15:18:16','2013-12-06 15:18:16'),
	(54,4,19,36,'[4]','','2013-12-06 15:18:16','2013-12-06 15:18:16'),
	(55,4,16,20,NULL,'It\'s just not all that interesting. It\'s just the company name with a dotted line under it. People want something creative; something that catches their eye. This logo just doesn\'t do that.','2013-12-06 15:18:33','2013-12-06 15:18:33'),
	(56,4,15,38,NULL,'the dotted curve attracts this age and the line resembles the path people a good logo to be attracted by the age group 18-24','2013-12-06 15:18:34','2013-12-06 15:18:34'),
	(57,4,17,33,'[0]','','2013-12-06 15:18:43','2013-12-06 15:18:43'),
	(58,4,18,33,'[0]','male','2013-12-06 15:18:43','2013-12-06 15:18:43'),
	(59,4,19,33,'[1]','','2013-12-06 15:18:43','2013-12-06 15:18:43'),
	(60,4,17,13,'[2]','','2013-12-06 15:18:48','2013-12-06 15:18:48'),
	(61,4,18,13,'[1]','female','2013-12-06 15:18:48','2013-12-06 15:18:48'),
	(62,4,19,13,'[4]','','2013-12-06 15:18:48','2013-12-06 15:18:48'),
	(63,4,15,19,NULL,'The \"P\" looks like a ribbon or a perhaps a check-mark, both of which have positive connotations. It\'s a nice looking design.','2013-12-06 15:18:53','2013-12-06 15:18:53'),
	(64,4,16,38,NULL,'it doesnt have that much design to capture the attention of this age group','2013-12-06 15:19:08','2013-12-06 15:19:08'),
	(65,4,15,39,NULL,'The color palette is appealing, and the blue dot line looks cool - its different.  To me it connotates a winding path, which is what life/careers are really like.','2013-12-06 15:19:10','2013-12-06 15:19:10'),
	(66,4,17,20,'[0]','','2013-12-06 15:19:34','2013-12-06 15:19:34'),
	(67,4,18,20,'[1]','female','2013-12-06 15:19:34','2013-12-06 15:19:34'),
	(68,4,19,20,'[4]','','2013-12-06 15:19:34','2013-12-06 15:19:34'),
	(69,4,16,19,NULL,'The line going through the middle of \"mypath\" looks like a snake or a worm. It looks a bit creepy.','2013-12-06 15:19:42','2013-12-06 15:19:42'),
	(70,4,17,38,'[0]','','2013-12-06 15:20:09','2013-12-06 15:20:09'),
	(71,4,18,38,'[0]','male','2013-12-06 15:20:09','2013-12-06 15:20:09'),
	(72,4,19,38,'[1]','','2013-12-06 15:20:09','2013-12-06 15:20:09'),
	(73,4,16,39,NULL,'This logo seems childish, or \'mom\'ish - like it would be for a kid craft website or a knitting/sewing site.  The font is also not appealing.','2013-12-06 15:20:24','2013-12-06 15:20:24'),
	(74,4,15,35,NULL,'It just looks more young and hip than the others, and is just more appealing. I like how the blue dots go thru the my path instead of under it.','2013-12-06 15:21:01','2013-12-06 15:21:01'),
	(75,4,17,19,'[0]','','2013-12-06 15:21:05','2013-12-06 15:21:05'),
	(76,4,18,19,'[0]','male','2013-12-06 15:21:05','2013-12-06 15:21:05'),
	(77,4,19,19,'[4]','','2013-12-06 15:21:05','2013-12-06 15:21:05'),
	(78,4,17,39,'[3]','','2013-12-06 15:21:28','2013-12-06 15:21:28'),
	(79,4,18,39,'[1]','female','2013-12-06 15:21:28','2013-12-06 15:21:28'),
	(80,4,19,39,'[4]','','2013-12-06 15:21:28','2013-12-06 15:21:28'),
	(81,4,16,40,NULL,'This logo is hard to read and looks old fashioned. The \"P\" looks like sewing stitches and does not really look like a P.','2013-12-06 15:21:32','2013-12-06 15:21:32'),
	(82,4,15,48,NULL,'The image is the dots moving forward like you are on the rise of something.  The other image was just a flat path.  This first image is catchy and makes you think where the other one is just pretty standard.','2013-12-06 15:21:37','2013-12-06 15:21:37'),
	(83,4,15,28,NULL,'I think the blue \"path\" really draws your attention to the logo.  The contrast in colors is pleasing to the eye.  The dotted path is a great association to the \"brand\" showing that by using my path, you can take all the necessary steps to be successful.','2013-12-06 15:21:45','2013-12-06 15:21:45'),
	(84,4,15,60,NULL,'I think that the blue dotted line heading upward will draw Millennials in because it replicates success. For example, they want their careers to proceed upward much like the blue line.','2013-12-06 15:21:51','2013-12-06 15:21:51'),
	(85,4,15,64,NULL,'THE DESIGN IS GOOD...','2013-12-06 15:21:52','2013-12-06 15:21:52'),
	(86,4,15,24,NULL,'The logo is very clever. It actually underlines the \"my path\" text with what looks like an actual path of stones. I like this logo because it puts more emphasis on the personal path of the viewer. the text is simple and not differing in font. This is the ','2013-12-06 15:21:57','2013-12-06 15:21:57'),
	(87,4,15,25,NULL,'very simple logo and very good color selection .','2013-12-06 15:22:25','2013-12-06 15:22:25'),
	(88,4,16,60,NULL,'I think it is least likely to capture their attention because the \"P\" is hard to read and very distracting.','2013-12-06 15:22:27','2013-12-06 15:22:27'),
	(89,4,16,64,NULL,'NEAT AND SIMPLE..','2013-12-06 15:22:29','2013-12-06 15:22:29'),
	(90,4,16,35,NULL,'Something about the blue wavy line going under the text just doesn\'t look right to me. Makes it seem like its for senior citizens or something.','2013-12-06 15:22:43','2013-12-06 15:22:43'),
	(91,4,16,25,NULL,'did not understand quickly','2013-12-06 15:22:45','2013-12-06 15:22:45'),
	(92,4,15,59,NULL,'It is a modern design, and shows a pathway leading upwards in a positive direction','2013-12-06 15:22:50','2013-12-06 15:22:50'),
	(93,4,15,11,NULL,'they would love the pattern of the P how its all stitched and its very eye catching','2013-12-06 15:22:53','2013-12-06 15:22:53'),
	(94,4,17,40,'[2]','','2013-12-06 15:22:58','2013-12-06 15:22:58'),
	(95,4,18,40,'[0]','male','2013-12-06 15:22:58','2013-12-06 15:22:58'),
	(96,4,19,40,'[4]','','2013-12-06 15:22:58','2013-12-06 15:22:58'),
	(97,4,17,25,'[0]','','2013-12-06 15:23:11','2013-12-06 15:23:11'),
	(98,4,18,25,'[0]','male','2013-12-06 15:23:11','2013-12-06 15:23:11'),
	(99,4,19,25,'[1]','','2013-12-06 15:23:11','2013-12-06 15:23:11'),
	(100,4,17,60,'[1]','','2013-12-06 15:23:15','2013-12-06 15:23:15'),
	(101,4,18,60,'[0]','male','2013-12-06 15:23:15','2013-12-06 15:23:15'),
	(102,4,19,60,'[4]','','2013-12-06 15:23:15','2013-12-06 15:23:15'),
	(103,4,16,28,NULL,'I didn\'t like this one because the path doesn\'t really look like a \"P\" to me which makes the logo hard to read and interpret.  The coloring needs some contrast to it as well.  Maybe a blue and green dotted path would grab one\'s attention more because it i','2013-12-06 15:23:24','2013-12-06 15:23:24'),
	(104,4,16,11,NULL,'its very distracting and does not look visually appealing','2013-12-06 15:23:25','2013-12-06 15:23:25'),
	(105,4,17,35,'[2]','','2013-12-06 15:23:39','2013-12-06 15:23:39'),
	(106,4,18,35,'[0]','male','2013-12-06 15:23:39','2013-12-06 15:23:39'),
	(107,4,19,35,'[4]','','2013-12-06 15:23:39','2013-12-06 15:23:39'),
	(108,4,16,24,NULL,'This logo feels and looks weird because of the design. The path itself in the logo is all over the place, going through letters and below and above words. this feels like my path will be uncertain and will go all over the place which I do not want in my l','2013-12-06 15:23:47','2013-12-06 15:23:47'),
	(109,4,16,48,NULL,'It\'s confusing.  I understand its the letter \"P\" but it is very confusing and doesn\'t flow well at all.  It\'s ugly in my opinion and not cohesive.','2013-12-06 15:24:02','2013-12-06 15:24:02'),
	(110,4,16,59,NULL,'the pathway in the logo loops around, as though someone does not know where they are headed.','2013-12-06 15:24:03','2013-12-06 15:24:03'),
	(111,4,17,11,'[0]','','2013-12-06 15:24:19','2013-12-06 15:24:19'),
	(112,4,18,11,'[1]','female','2013-12-06 15:24:19','2013-12-06 15:24:19'),
	(113,4,19,11,'[4]','','2013-12-06 15:24:19','2013-12-06 15:24:19'),
	(114,4,15,56,NULL,'this very motivated logo i like this very much this is very impress to me','2013-12-06 15:24:25','2013-12-06 15:24:25'),
	(115,4,15,14,NULL,'I think this logo is the most pleasing to the eyes overall and the colors work well. Out of the two images used in the logos (the dotted P and the squiggled line) the dotted P brought about mental images of a pirate map style path which I think would work','2013-12-06 15:24:25','2013-12-06 15:24:25'),
	(116,4,17,59,'[6]','','2013-12-06 15:24:45','2013-12-06 15:24:45'),
	(117,4,18,59,'[1]','female','2013-12-06 15:24:45','2013-12-06 15:24:45'),
	(118,4,19,59,'[4]','','2013-12-06 15:24:45','2013-12-06 15:24:45'),
	(119,4,17,64,'[1]','','2013-12-06 15:24:46','2013-12-06 15:24:46'),
	(120,4,18,64,'[1]','female','2013-12-06 15:24:46','2013-12-06 15:24:46'),
	(121,4,19,64,'[1]','','2013-12-06 15:24:46','2013-12-06 15:24:46'),
	(122,4,15,15,NULL,'It stylish and good.','2013-12-06 15:25:10','2013-12-06 15:25:10'),
	(123,4,17,28,'[3]','','2013-12-06 15:25:12','2013-12-06 15:25:12'),
	(124,4,18,28,'[1]','female','2013-12-06 15:25:12','2013-12-06 15:25:12'),
	(125,4,19,28,'[4]','','2013-12-06 15:25:12','2013-12-06 15:25:12'),
	(126,4,16,56,NULL,'i don\'t like this logo this not impress for me.','2013-12-06 15:25:18','2013-12-06 15:25:18'),
	(127,4,17,48,'[4]','','2013-12-06 15:25:27','2013-12-06 15:25:27'),
	(128,4,18,48,'[0]','male','2013-12-06 15:25:27','2013-12-06 15:25:27'),
	(129,4,19,48,'[4]','','2013-12-06 15:25:27','2013-12-06 15:25:27'),
	(130,4,16,15,NULL,'It\'s good and attractive.','2013-12-06 15:25:37','2013-12-06 15:25:37'),
	(131,4,15,70,NULL,'The blue line highlights the title \"my path\" rather than distracting from \nit as in the other logos.','2013-12-06 15:25:48','2013-12-06 15:25:48'),
	(132,4,15,63,NULL,'This is unique design & definitely eye catching than other designs','2013-12-06 15:25:53','2013-12-06 15:25:53'),
	(133,4,17,56,'[0]','','2013-12-06 15:26:05','2013-12-06 15:26:05'),
	(134,4,18,56,'[1]','female','2013-12-06 15:26:05','2013-12-06 15:26:05'),
	(135,4,19,56,'[1]','','2013-12-06 15:26:05','2013-12-06 15:26:05'),
	(136,4,16,70,NULL,'It almost looks like it says \"my faith\".','2013-12-06 15:26:17','2013-12-06 15:26:17'),
	(137,4,16,63,NULL,'Although logo is good  but its too simple & not unique.','2013-12-06 15:26:40','2013-12-06 15:26:40'),
	(138,4,17,15,'[1]','','2013-12-06 15:26:44','2013-12-06 15:26:44'),
	(139,4,18,15,'[1]','female','2013-12-06 15:26:44','2013-12-06 15:26:44'),
	(140,4,19,15,'[1]','','2013-12-06 15:26:44','2013-12-06 15:26:44'),
	(141,4,17,24,'[1]','','2013-12-06 15:26:46','2013-12-06 15:26:46'),
	(142,4,18,24,'[0]','male','2013-12-06 15:26:46','2013-12-06 15:26:46'),
	(143,4,19,24,'[4]','','2013-12-06 15:26:46','2013-12-06 15:26:46'),
	(144,4,17,70,'[0]','','2013-12-06 15:26:49','2013-12-06 15:26:49'),
	(145,4,18,70,'[0]','male','2013-12-06 15:26:49','2013-12-06 15:26:49'),
	(146,4,19,70,'[4]','','2013-12-06 15:26:49','2013-12-06 15:26:49'),
	(147,4,16,14,NULL,'The main issue I found with this logo was the dotted squiggle line interferes with the name of the company way more than a logo should. Perhaps swapping the color scheme, so the text is blue and the squiggle is green, would make it look less busy.','2013-12-06 15:27:33','2013-12-06 15:27:33'),
	(148,4,15,65,NULL,'Among the three logos this is the best.','2013-12-06 15:27:59','2013-12-06 15:29:50'),
	(149,4,17,63,'[2]','','2013-12-06 15:28:03','2013-12-06 15:28:03'),
	(150,4,18,63,'[0]','male','2013-12-06 15:28:03','2013-12-06 15:28:03'),
	(151,4,19,63,'[1]','','2013-12-06 15:28:03','2013-12-06 15:28:03'),
	(152,4,15,72,NULL,'It is simple, not overly complicated.  The blue line present imagery of a young person\'s path through life, around many turns.  The green is friendly and inviting.','2013-12-06 15:28:28','2013-12-06 15:28:28'),
	(153,4,16,72,NULL,'What is \"Myath\"?  Why is there a knot in the middle?  Why is one word blue and one green?  Is this an insurance company?','2013-12-06 15:29:22','2013-12-06 15:29:22'),
	(154,4,17,14,'[1]','','2013-12-06 15:29:43','2013-12-06 15:29:43'),
	(155,4,18,14,'[0]','male','2013-12-06 15:29:43','2013-12-06 15:29:43'),
	(156,4,19,14,'[4]','','2013-12-06 15:29:43','2013-12-06 15:29:43'),
	(157,4,15,74,NULL,'because it is very creative. the letter is sort of outlined as an actual path .','2013-12-06 15:30:13','2013-12-06 15:30:13'),
	(158,4,16,65,NULL,'','2013-12-06 15:30:17','2013-12-06 15:30:17'),
	(159,4,17,72,'[2]','','2013-12-06 15:30:23','2013-12-06 15:30:23'),
	(160,4,18,72,'[0]','male','2013-12-06 15:30:23','2013-12-06 15:30:23'),
	(161,4,19,72,'[4]','','2013-12-06 15:30:23','2013-12-06 15:30:23'),
	(162,4,16,74,NULL,'the little bubbles are all over the letters and just seems that it doesnt fit in.','2013-12-06 15:31:18','2013-12-06 15:31:18'),
	(163,4,15,73,NULL,'The design caught my eye immediately. It looks new on modern which might get the interest of the age group. It says that the company is open to new ideas and ways of doing things. It does not look old or dated I think it would at least get the target audi','2013-12-06 15:31:59','2013-12-06 15:31:59'),
	(164,4,16,73,NULL,'to me it looks like an advertisement for something concerning retirement. It looks dull and uninteresting','2013-12-06 15:32:55','2013-12-06 15:32:55'),
	(165,4,17,74,'[0]','','2013-12-06 15:33:17','2013-12-06 15:33:17'),
	(166,4,18,74,'[0]','male','2013-12-06 15:33:17','2013-12-06 15:33:17'),
	(167,4,19,74,'[3]','','2013-12-06 15:33:17','2013-12-06 15:33:17'),
	(168,4,17,73,'[6]','','2013-12-06 15:34:09','2013-12-06 15:34:09'),
	(169,4,18,73,'[1]','female','2013-12-06 15:34:09','2013-12-06 15:34:09'),
	(170,4,19,73,'[4]','','2013-12-06 15:34:09','2013-12-06 15:34:09'),
	(171,4,17,65,'[4]','','2013-12-06 15:34:48','2013-12-06 15:34:48'),
	(172,4,18,65,'[0]','male','2013-12-06 15:34:48','2013-12-06 15:34:48'),
	(173,4,19,65,'[1]','','2013-12-06 15:34:48','2013-12-06 15:34:48'),
	(174,4,15,57,NULL,'This logo shows a path weaving through the person\'s imagined path and destination.  I think a young person will see this as a guiding influence, a creation of a path they want to go down.  We see similar guides and pointers in a lot of web interfaces and ','2013-12-06 15:35:13','2013-12-06 15:35:13'),
	(175,4,15,75,NULL,'It is just more pleasing to my eye. I really did not like the first logo at all. The last with the \"path\" going through the words \"my path\" seemed confusing to me. I don\'t really like any of them all that much, but this one was somewhat better. That is al','2013-12-06 15:35:43','2013-12-06 15:35:43'),
	(176,4,16,57,NULL,'This logo looks directionless, if you saw someone leave this path in a forest you would immediately assume their are lost.  The logo itself looks kind of like an untied shoelace to me.  I think this logo just doesn\'t give a good solidity or guidance feel,','2013-12-06 15:36:19','2013-12-06 15:36:19'),
	(177,4,16,75,NULL,'I simply don\'t like the way the path intersects the words. It is purely a visual thing for me.','2013-12-06 15:36:58','2013-12-06 15:36:58'),
	(178,4,17,57,'[4]','','2013-12-06 15:37:02','2013-12-06 15:37:02'),
	(179,4,18,57,'[0]','male','2013-12-06 15:37:02','2013-12-06 15:37:02'),
	(180,4,19,57,'[4]','','2013-12-06 15:37:02','2013-12-06 15:37:02'),
	(181,4,17,75,'[6]','','2013-12-06 15:38:18','2013-12-06 15:38:18'),
	(182,4,18,75,'[0]','male','2013-12-06 15:38:18','2013-12-06 15:38:18'),
	(183,4,19,75,'[4]','','2013-12-06 15:38:18','2013-12-06 15:38:18'),
	(184,4,15,78,NULL,'It is streamlined and it tells a story.  The blue line conveys a path, which supports the theme of the wording.','2013-12-06 15:52:11','2013-12-06 15:52:49'),
	(185,4,16,78,NULL,'It is messy and indirect.  It seems to imply that a mistake has been made along the path.','2013-12-06 15:53:30','2013-12-06 15:53:30'),
	(186,4,17,78,'[4]','','2013-12-06 15:54:45','2013-12-06 15:54:45'),
	(187,4,18,78,'[0]','male','2013-12-06 15:54:45','2013-12-06 15:54:45'),
	(188,4,19,78,'[4]','','2013-12-06 15:54:45','2013-12-06 15:54:45'),
	(189,4,15,80,NULL,'','2013-12-06 23:02:34','2013-12-06 23:02:34'),
	(190,4,16,80,NULL,'','2013-12-06 23:03:47','2013-12-06 23:03:47'),
	(191,3,10,85,NULL,'Green feels environmentally correct','2013-12-10 17:02:53','2013-12-10 17:39:43'),
	(192,3,11,85,NULL,'I don\'t think women will like the pink color','2013-12-10 17:03:00','2013-12-10 17:40:22'),
	(193,3,9,85,NULL,'tide','2013-12-10 17:41:46','2013-12-10 17:41:46'),
	(194,3,12,85,'[3]','','2013-12-10 17:41:46','2013-12-10 17:41:46'),
	(195,3,13,85,'[1]','female','2013-12-10 17:41:46','2013-12-10 17:41:46'),
	(196,3,10,89,NULL,'','2013-12-11 14:59:24','2013-12-11 14:59:24'),
	(197,3,11,89,NULL,'','2013-12-11 14:59:29','2013-12-11 14:59:29'),
	(198,3,10,88,NULL,'Green seems environmentally friendly','2013-12-11 15:19:23','2013-12-11 15:19:23'),
	(199,3,11,88,NULL,'The garden bouquet scent is off-putting','2013-12-11 15:20:15','2013-12-11 15:20:15'),
	(200,3,9,88,NULL,'Tide','2013-12-11 15:22:28','2013-12-11 15:22:28'),
	(201,3,12,88,'[3]','45-54','2013-12-11 15:22:28','2013-12-11 15:22:28'),
	(202,3,13,88,'[1]','female','2013-12-11 15:22:28','2013-12-11 15:22:28'),
	(203,3,10,95,NULL,'','2014-01-03 14:51:48','2014-01-03 14:51:48'),
	(204,3,11,95,NULL,'','2014-01-03 14:51:53','2014-01-03 14:51:53'),
	(205,5,23,101,NULL,'','2014-01-08 20:23:56','2014-01-08 20:23:56'),
	(206,5,24,101,NULL,'','2014-01-08 20:24:00','2014-01-08 20:24:00'),
	(207,5,22,101,NULL,'asc','2014-01-08 20:24:09','2014-01-08 20:24:09'),
	(208,5,25,101,'[0]','0-12','2014-01-08 20:24:09','2014-01-08 20:24:09'),
	(209,5,26,101,'[0]','male','2014-01-08 20:24:09','2014-01-08 20:24:09'),
	(210,5,23,102,NULL,'','2014-01-08 20:28:22','2014-01-08 20:28:22'),
	(211,5,24,102,NULL,'','2014-01-08 20:28:26','2014-01-08 20:28:26'),
	(212,5,22,102,NULL,'afvadv','2014-01-08 21:05:36','2014-01-08 21:05:36'),
	(213,5,25,102,'[0]','0-12','2014-01-08 21:05:36','2014-01-08 21:05:36'),
	(214,5,26,102,'[1]','female','2014-01-08 21:05:36','2014-01-08 21:05:36'),
	(215,5,27,102,'[1]','No','2014-01-08 21:20:48','2014-01-08 21:20:48'),
	(216,5,28,102,NULL,'all of it','2014-01-08 21:29:03','2014-01-08 21:29:03'),
	(217,5,29,102,'[1]','Millennials in general','2014-01-08 21:29:10','2014-01-08 21:29:10'),
	(218,5,31,102,NULL,'sdvadv','2014-01-08 21:29:16','2014-01-08 21:29:16');

/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Skin Care','2013-12-03 16:31:24','2013-12-03 16:31:24'),
	(2,'Laundry Care','2013-12-03 16:31:24','2013-12-03 16:31:24'),
	(3,'Automotive','2013-12-03 16:31:24','2013-12-03 16:31:24'),
	(4,'Arts & Crafts','2013-12-03 16:31:24','2013-12-03 16:31:24'),
	(5,'Oral Hygiene','2013-12-03 16:31:24','2013-12-05 15:50:42'),
	(6,'Paints & Stains','2013-12-03 16:31:24','2013-12-03 16:31:24'),
	(7,'Lawn & Garden','2013-12-03 16:31:24','2013-12-03 16:31:24'),
	(8,'Office Supplies','2013-12-03 16:31:24','2013-12-03 16:31:24'),
	(9,'A Sports Coach / Assistant Coach','2013-12-03 16:56:19','2013-12-03 16:56:19'),
	(10,'A New Mom / Woman Expecting','2013-12-03 16:56:30','2013-12-03 16:56:30'),
	(11,'A College Student / Student Preparing for College','2013-12-03 16:56:44','2013-12-03 16:56:44'),
	(12,'A Senior Manager (Business)','2013-12-03 16:56:46','2013-12-03 16:56:46'),
	(13,'A Teacher / Teacher’s Aide','2013-12-03 16:56:53','2013-12-03 16:56:53'),
	(14,'An Artist / Aspiring Artist','2013-12-03 16:56:57','2013-12-03 16:56:57'),
	(15,'A Professional Musician','2013-12-03 16:57:01','2013-12-03 16:57:01'),
	(16,'An Athlete – Professional or Amateur','2013-12-03 16:57:11','2013-12-03 16:57:11');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table concept_frames
# ------------------------------------------------------------

DROP TABLE IF EXISTS `concept_frames`;

CREATE TABLE `concept_frames` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `videos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table concepts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `concepts`;

CREATE TABLE `concepts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `html` text COLLATE utf8_unicode_ci NOT NULL,
  `thumb_html` text COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `concept_frames` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `survey_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `concepts` WRITE;
/*!40000 ALTER TABLE `concepts` DISABLE KEYS */;

INSERT INTO `concepts` (`id`, `name`, `description`, `html`, `thumb_html`, `content`, `concept_frames`, `survey_id`, `created_at`, `updated_at`)
VALUES
	(1,'Blue Cap Laundry Detergent','','<div style=\"background-color:white;min-height:267px;width:75%;margin:0px auto;border-radius: 5px 5px 5px 5px;box-shadow: 0 0 5px 5px #454545;overflow:hidden\"><img style=\"float:left;max-height:267px;margin-left:15px;max-width:200px;\" src=\"./usrimg/laundry/1.jpg\">\n                              <ul style=\"float:left;color:black;margin-left:45px;margin-top:23px;list-style:disc outside none\">\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">Cleans 64 Loads</li>\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">Low suds formula</li>\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">\"Fresh Rain\" scent</li>\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">100oz</li>\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">$12.00</li>\n                              </ul></div>','<img class=\"conceptThumbnail\" src=\"/usrimg/laundry/1.jpg\"  class=\"thumb\" />','','',3,'2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(2,'Pink Laundry Detergent','','<div style=\"background-color:white;min-height:267px;width:75%;margin:0px auto;border-radius: 5px 5px 5px 5px;box-shadow: 0 0 5px 5px #454545;overflow:hidden\"><img style=\"float:left;max-height:267px;margin-left:15px;max-width:200px;\" src=\"./usrimg/laundry/2.jpg\">\n                              <ul style=\"float:left;color:black;margin-left:45px;margin-top:23px;list-style:disc outside none\">\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">Cleans 48 Loads</li>\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">Low suds formula</li>\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">\"Garden Bouquet\" scent</li>\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">72oz</li>\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">$9.99</li>\n                              </ul></div>','<img class=\"conceptThumbnail\" src=\"/usrimg/laundry/2.jpg\"  class=\"thumb\" />','','',3,'2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(3,'Green Laundry Detergent','','<div style=\"background-color:white;min-height:267px;width:75%;margin:0px auto;border-radius: 5px 5px 5px 5px;box-shadow: 0 0 5px 5px #454545;overflow:hidden\"><img style=\"float:left;max-height:267px;margin-top:40px;margin-left:15px;max-width:200px;\" src=\"./usrimg/laundry/3.jpg\">\r\n                              <ul style=\"float:left;color:black;margin-left:45px;margin-top:23px;list-style:disc outside none\">\r\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">Cleans 124 Loads</li>\r\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">Concentrated formula</li>\r\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">\"Springtime\" scent</li>\r\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">124oz</li>\r\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">$19.99</li></ul></div>','<img class=\"conceptThumbnail\" src=\"/usrimg/laundry/3.jpg\"  class=\"thumb\" />','','',3,'2013-12-03 16:31:25','2013-12-05 15:51:29'),
	(4,'Red Cap Laundry Detergent','','<div style=\"background-color:white;min-height:267px;width:75%;margin:0px auto;border-radius: 5px 5px 5px 5px;box-shadow: 0 0 5px 5px #454545;overflow:hidden\"><img style=\"float:left;max-height:267px;margin-left:15px;max-width:200px;\" src=\"./usrimg/laundry/4.jpg\">\n                              <ul style=\"float:left;color:black;margin-left:45px;margin-top:23px;list-style:disc outside none\">\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">Cleans 36 Loads</li>\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">Powder form</li>\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">\"Aqua Fresh\" scent</li>\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">18oz</li>\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">$4.99</li></ul></div>','<img class=\"conceptThumbnail\" src=\"/usrimg/laundry/4.jpg\"  class=\"thumb\" />','','',3,'2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(5,'Pink Cap Laundry Detergent','','<div style=\"background-color:white;min-height:267px;width:75%;margin:0px auto;border-radius: 5px 5px 5px 5px;box-shadow: 0 0 5px 5px #454545;overflow:hidden\"><img style=\"float:left;max-height:267px;margin-left:15px;max-width:200px;\" src=\"./usrimg/laundry/5.jpg\">\n                              <ul style=\"float:left;color:black;margin-left:45px;margin-top:23px;list-style:disc outside none\">\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">Cleans 72 Loads</li>\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">Low suds formula</li>\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">Unscented</li>\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">72oz</li>\n                              <li style=\"padding:9px 0px;list-style:disc outside none\">$14.99</li></ul></div>','<img class=\"conceptThumbnail\" src=\"/usrimg/laundry/5.jpg\"  class=\"thumb\" />','','',3,'2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(6,'Bill Clinton','The president who likes blue dresses','','','William Jefferson \"Bill\" Clinton is an American politician who served as the 42nd President of the United States from 1993 to 2001. Inaugurated at age 46, he was the third-youngest president.','',2,'2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(7,'Herman Cain','9 plan','','','Herman Cain is an American author, business executive, radio host, syndicated columnist, and Tea Party activist from Georgia. He was a candidate for the 2012 U.S. Republican Party presidential nomination.','',2,'2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(8,'Home Depot','The you can do it we can help store','<img width=\"300px\" src=\"http://louisianarecord.com/wp-content/uploads/2013/01/home-depot-kids-workshop.jpg\">','','The Home Depot is an American retailer of home improvement and construction products and services. It operates many big-box format stores across the United States, all ten provinces of Canada, as well as Mexico and China.','',1,'2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(9,'Lowes','The home improvement destination','<link href=\"http://vjs.zencdn.net/4.1/video-js.css\" rel=\"stylesheet\">\n<script src=\"http://vjs.zencdn.net/4.1/video.js\"></script>\n\nPretend this video is about Lowes.\n<video id=\"example_video_1\" class=\"video-js vjs-default-skin\"\n  controls preload=\"auto\" width=\"640\" height=\"264\"\n  poster=\"http://video-js.zencoder.com/oceans-clip.png\"\n  data-setup=\'{\"example_option\":true}\'>\n <source src=\"http://video-js.zencoder.com/oceans-clip.mp4\" type=\"video/mp4\" />\n <source src=\"http://video-js.zencoder.com/oceans-clip.webm\" type=\"video/webm\" />\n <source src=\"http://video-js.zencoder.com/oceans-clip.ogv\" type=\"video/ogg\" />\n</video>','','Lowe\'s Companies, Inc. is an American chain of retail home improvement and appliance stores that has retail stores in the United States, Canada, and Mexico.','',1,'2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(10,'Rudy Giuliani','The eternal mayor of New York','','','Rudolph William Louis \"Rudy\" Giuliani is an American lawyer, businessman, former politician, and public speaker from New York. He served as Mayor of New York City from 1994 to 2001.','',2,'2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(11,'Paul Ryan','I have a plan yall','','','Paul Davis Ryan is the United States Representative for Wisconsin\'s 1st congressional district and current chairman of the House Budget Committee. He was the Republican Party nominee for Vice President of the United States in the 2012 election.','',2,'2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(12,'Logo N','','<div style=\"text-align: center; background-color:white;min-height:267px;width:35%;margin:0px auto;border-radius: 5px 5px 5px 5px;box-shadow: 0 0 5px 5px #454545;overflow:hidden; min-width: 410px;\">\r\n	<h2>Logo A</h2>\r\n	<img style=\"max-height:267px;margin-left:15px;max-width:200px;\" src=\"./usrimg/sapient/A.jpg\">\r\n</div>','<img class=\"conceptThumbnail\" src=\"/usrimg/sapient/A.jpg\"  class=\"thumb\" />','','',4,'2013-12-03 16:31:25','2013-12-04 19:43:46'),
	(13,'Logo F','','<div style=\"text-align: center; background-color:white;min-height:267px;width:35%;margin:0px auto;border-radius: 5px 5px 5px 5px;box-shadow: 0 0 5px 5px #454545;overflow:hidden; min-width: 410px;\">\r\n	<h2>Logo B</h2>\r\n	<img style=\"max-height:267px;margin-left:15px;max-width:200px;\" src=\"./usrimg/sapient/B.jpg\">\r\n</div>','<img class=\"conceptThumbnail\" src=\"/usrimg/sapient/B.jpg\"  class=\"thumb\" />','','',4,'2013-12-03 16:31:25','2013-12-04 19:44:08'),
	(14,'Logo W','','<div style=\"text-align: center; background-color:white;min-height:267px;width:35%;margin:0px auto;border-radius: 5px 5px 5px 5px;box-shadow: 0 0 5px 5px #454545;overflow:hidden; min-width: 410px;\">\r\n	<h2>Logo C</h2>\r\n	<img style=\"max-height:267px;margin-left:15px;max-width:200px;\" src=\"./usrimg/sapient/C.jpg\">\r\n</div>','<img class=\"conceptThumbnail\" src=\"/usrimg/sapient/C.jpg\"  class=\"thumb\" />','','',4,'2013-12-03 16:31:25','2013-12-04 19:44:20'),
	(15,'Logo N','','<div style=\"text-align: center; background-color:white;min-height:267px;width:35%;margin:0px auto;border-radius: 5px 5px 5px 5px;box-shadow: 0 0 5px 5px #454545;overflow:hidden; min-width: 410px;\">\r\n	<h2>Logo A</h2>\r\n	<img style=\"max-height:267px;margin-left:15px;max-width:200px;\" src=\"./usrimg/sapient/A.jpg\">\r\n</div>','<img class=\"conceptThumbnail\" src=\"/usrimg/sapient/A.jpg\"  class=\"thumb\" />','','',5,'2013-12-03 16:31:25','2013-12-04 19:43:46'),
	(16,'Logo F','','<div style=\"text-align: center; background-color:white;min-height:267px;width:35%;margin:0px auto;border-radius: 5px 5px 5px 5px;box-shadow: 0 0 5px 5px #454545;overflow:hidden; min-width: 410px;\">\r\n	<h2>Logo B</h2>\r\n	<img style=\"max-height:267px;margin-left:15px;max-width:200px;\" src=\"./usrimg/sapient/B.jpg\">\r\n</div>','<img class=\"conceptThumbnail\" src=\"/usrimg/sapient/B.jpg\"  class=\"thumb\" />','','',5,'2013-12-03 16:31:25','2013-12-04 19:44:08'),
	(17,'Logo W','','<div style=\"text-align: center; background-color:white;min-height:267px;width:35%;margin:0px auto;border-radius: 5px 5px 5px 5px;box-shadow: 0 0 5px 5px #454545;overflow:hidden; min-width: 410px;\">\r\n	<h2>Logo C</h2>\r\n	<img style=\"max-height:267px;margin-left:15px;max-width:200px;\" src=\"./usrimg/sapient/C.jpg\">\r\n</div>','<img class=\"conceptThumbnail\" src=\"/usrimg/sapient/C.jpg\"  class=\"thumb\" />','','',5,'2013-12-03 16:31:25','2013-12-04 19:44:20');

/*!40000 ALTER TABLE `concepts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table investments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `investments`;

CREATE TABLE `investments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `concept_id` int(11) NOT NULL,
  `price_of_purchase` float(8,2) NOT NULL,
  `number_of_shares` decimal(10,5) NOT NULL,
  `is_best` tinyint(1) NOT NULL,
  `is_worst` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `investments` WRITE;
/*!40000 ALTER TABLE `investments` DISABLE KEYS */;

INSERT INTO `investments` (`id`, `user_id`, `concept_id`, `price_of_purchase`, `number_of_shares`, `is_best`, `is_worst`, `created_at`, `updated_at`)
VALUES
	(1,3,14,0.00,0.00000,0,0,'2013-12-05 22:46:26','2013-12-05 22:46:26'),
	(2,3,13,0.00,0.00000,0,0,'2013-12-05 22:46:27','2013-12-05 22:46:27'),
	(3,3,12,0.00,0.00000,0,0,'2013-12-05 22:46:28','2013-12-05 22:46:28'),
	(7,7,14,33.33,30.00300,1,0,'2013-12-06 15:13:56','2013-12-06 15:13:56'),
	(8,7,13,33.33,0.00000,0,0,'2013-12-06 15:13:56','2013-12-06 15:13:56'),
	(11,22,14,36.05,27.73925,1,0,'2013-12-06 15:14:42','2013-12-06 15:14:42'),
	(16,7,12,0.00,0.00000,0,1,'2013-12-06 15:15:16','2013-12-06 15:15:16'),
	(17,43,13,0.00,0.00000,0,0,'2013-12-06 15:15:23','2013-12-06 15:15:23'),
	(21,22,12,0.00,0.00000,0,1,'2013-12-06 15:15:54','2013-12-06 15:15:54'),
	(23,6,12,30.68,16.42764,1,0,'2013-12-06 15:16:04','2013-12-06 15:16:04'),
	(24,6,13,30.68,16.16688,0,0,'2013-12-06 15:16:04','2013-12-06 15:16:04'),
	(27,13,14,38.65,25.87322,1,0,'2013-12-06 15:16:13','2013-12-06 15:16:13'),
	(29,20,13,30.68,0.00000,0,1,'2013-12-06 15:16:19','2013-12-06 15:16:19'),
	(30,20,14,38.65,25.87322,1,0,'2013-12-06 15:16:19','2013-12-06 15:16:19'),
	(35,33,14,38.65,18.18887,1,0,'2013-12-06 15:16:36','2013-12-06 15:16:36'),
	(36,33,13,30.68,9.68057,0,0,'2013-12-06 15:16:36','2013-12-06 15:16:36'),
	(37,36,13,28.96,34.53039,1,0,'2013-12-06 15:16:42','2013-12-06 15:16:42'),
	(39,6,14,0.00,0.00000,0,1,'2013-12-06 15:17:09','2013-12-06 15:17:09'),
	(42,40,13,30.68,32.59452,1,0,'2013-12-06 15:17:15','2013-12-06 15:17:15'),
	(43,19,13,28.96,17.26519,0,0,'2013-12-06 15:17:17','2013-12-06 15:17:17'),
	(44,19,12,28.99,17.24733,1,0,'2013-12-06 15:17:17','2013-12-06 15:17:17'),
	(45,39,14,39.56,25.27806,1,0,'2013-12-06 15:17:25','2013-12-06 15:17:25'),
	(46,38,14,42.06,23.77556,1,0,'2013-12-06 15:17:30','2013-12-06 15:17:30'),
	(47,38,12,28.99,0.00000,0,0,'2013-12-06 15:17:30','2013-12-06 15:17:30'),
	(49,13,12,0.00,0.00000,0,1,'2013-12-06 15:17:36','2013-12-06 15:17:36'),
	(53,36,12,0.00,0.00000,0,1,'2013-12-06 15:17:47','2013-12-06 15:17:47'),
	(55,33,12,0.00,0.00000,0,1,'2013-12-06 15:17:58','2013-12-06 15:17:58'),
	(65,24,12,24.21,7.47625,0,0,'2013-12-06 15:19:08','2013-12-06 15:19:08'),
	(66,24,13,32.88,24.90876,1,0,'2013-12-06 15:19:08','2013-12-06 15:19:08'),
	(67,38,13,0.00,0.00000,0,1,'2013-12-06 15:19:09','2013-12-06 15:19:09'),
	(70,35,14,42.91,23.30459,1,0,'2013-12-06 15:19:15','2013-12-06 15:19:15'),
	(72,11,13,32.88,13.92944,0,0,'2013-12-06 15:19:20','2013-12-06 15:19:20'),
	(73,11,12,24.21,22.38744,1,0,'2013-12-06 15:19:20','2013-12-06 15:19:20'),
	(75,14,13,32.88,3.04136,0,0,'2013-12-06 15:19:34','2013-12-06 15:19:34'),
	(76,14,12,24.21,37.17472,1,0,'2013-12-06 15:19:34','2013-12-06 15:19:34'),
	(77,19,14,0.00,0.00000,0,1,'2013-12-06 15:19:42','2013-12-06 15:19:42'),
	(78,28,13,32.88,7.32968,0,0,'2013-12-06 15:19:45','2013-12-06 15:19:45'),
	(79,28,14,42.91,17.68818,1,0,'2013-12-06 15:19:45','2013-12-06 15:19:45'),
	(86,39,12,0.00,0.00000,0,1,'2013-12-06 15:20:24','2013-12-06 15:20:24'),
	(87,48,14,41.35,24.18380,1,0,'2013-12-06 15:20:50','2013-12-06 15:20:50'),
	(88,48,13,32.75,0.00000,0,0,'2013-12-06 15:20:50','2013-12-06 15:20:50'),
	(90,60,14,41.35,24.18380,1,0,'2013-12-06 15:20:56','2013-12-06 15:20:56'),
	(93,59,13,32.75,12.73282,0,0,'2013-12-06 15:21:14','2013-12-06 15:21:14'),
	(94,59,14,41.35,14.09915,1,0,'2013-12-06 15:21:14','2013-12-06 15:21:14'),
	(95,64,12,23.80,25.29412,1,0,'2013-12-06 15:21:27','2013-12-06 15:21:27'),
	(96,64,14,46.11,8.63153,0,0,'2013-12-06 15:21:27','2013-12-06 15:21:27'),
	(97,40,12,0.00,0.00000,0,1,'2013-12-06 15:21:32','2013-12-06 15:21:32'),
	(98,25,13,34.06,17.14621,1,0,'2013-12-06 15:21:44','2013-12-06 15:21:44'),
	(99,25,14,41.76,9.96169,0,0,'2013-12-06 15:21:44','2013-12-06 15:21:44'),
	(100,60,12,0.00,0.00000,0,1,'2013-12-06 15:22:27','2013-12-06 15:22:27'),
	(101,64,13,0.00,0.00000,0,1,'2013-12-06 15:22:30','2013-12-06 15:22:30'),
	(102,35,13,0.00,0.00000,0,1,'2013-12-06 15:22:43','2013-12-06 15:22:43'),
	(103,25,12,0.00,0.00000,0,1,'2013-12-06 15:22:46','2013-12-06 15:22:46'),
	(108,11,14,0.00,0.00000,0,1,'2013-12-06 15:23:25','2013-12-06 15:23:25'),
	(109,28,12,0.00,0.00000,0,1,'2013-12-06 15:23:26','2013-12-06 15:23:26'),
	(110,56,14,46.59,21.46383,1,0,'2013-12-06 15:23:29','2013-12-06 15:23:29'),
	(115,24,14,0.00,0.00000,0,1,'2013-12-06 15:23:48','2013-12-06 15:23:48'),
	(117,48,12,0.00,0.00000,0,1,'2013-12-06 15:24:02','2013-12-06 15:24:02'),
	(118,59,12,0.00,0.00000,0,1,'2013-12-06 15:24:04','2013-12-06 15:24:04'),
	(122,15,12,22.41,22.66845,1,0,'2013-12-06 15:24:35','2013-12-06 15:24:35'),
	(123,15,13,28.86,17.04782,0,0,'2013-12-06 15:24:35','2013-12-06 15:24:35'),
	(124,63,12,22.41,18.38465,1,0,'2013-12-06 15:24:50','2013-12-06 15:24:50'),
	(125,63,13,28.86,6.58351,0,1,'2013-12-06 15:24:50','2013-12-06 15:24:50'),
	(126,63,14,48.73,8.16745,0,0,'2013-12-06 15:24:50','2013-12-06 15:24:50'),
	(127,70,13,29.67,33.70408,1,0,'2013-12-06 15:24:56','2013-12-06 15:24:56'),
	(128,56,13,0.00,0.00000,0,1,'2013-12-06 15:25:18','2013-12-06 15:25:18'),
	(129,15,14,0.00,0.00000,0,1,'2013-12-06 15:25:37','2013-12-06 15:25:37'),
	(130,70,12,0.00,0.00000,0,1,'2013-12-06 15:26:17','2013-12-06 15:26:17'),
	(134,72,13,32.11,31.14295,1,0,'2013-12-06 15:27:31','2013-12-06 15:27:31'),
	(135,14,14,0.00,0.00000,0,1,'2013-12-06 15:27:33','2013-12-06 15:27:33'),
	(136,65,12,23.36,17.12329,0,0,'2013-12-06 15:27:48','2013-12-06 15:27:48'),
	(137,65,14,44.53,13.47406,1,0,'2013-12-06 15:27:48','2013-12-06 15:27:48'),
	(139,74,12,23.08,43.32756,1,0,'2013-12-06 15:28:44','2013-12-06 15:28:44'),
	(142,72,12,0.00,0.00000,0,1,'2013-12-06 15:29:22','2013-12-06 15:29:22'),
	(145,73,12,26.30,38.02281,1,0,'2013-12-06 15:30:13','2013-12-06 15:30:13'),
	(146,65,13,0.00,0.00000,0,1,'2013-12-06 15:30:18','2013-12-06 15:30:18'),
	(149,74,14,0.00,0.00000,0,1,'2013-12-06 15:31:18','2013-12-06 15:31:18'),
	(150,57,14,39.83,20.01004,1,0,'2013-12-06 15:31:18','2013-12-06 15:31:18'),
	(151,57,13,30.82,6.58663,0,0,'2013-12-06 15:31:18','2013-12-06 15:31:18'),
	(153,73,13,0.00,0.00000,0,1,'2013-12-06 15:32:58','2013-12-06 15:32:58'),
	(154,75,13,30.39,32.90556,1,0,'2013-12-06 15:33:47','2013-12-06 15:33:47'),
	(155,57,12,0.00,0.00000,0,1,'2013-12-06 15:36:19','2013-12-06 15:36:19'),
	(156,75,14,0.00,0.00000,0,1,'2013-12-06 15:36:59','2013-12-06 15:36:59'),
	(158,78,13,33.24,30.08424,1,0,'2013-12-06 15:51:46','2013-12-06 15:51:46'),
	(159,78,14,0.00,0.00000,0,1,'2013-12-06 15:53:30','2013-12-06 15:53:30'),
	(160,80,12,0.00,0.00000,0,1,'2013-12-06 23:01:25','2013-12-06 23:01:25'),
	(161,80,14,0.00,0.00000,1,0,'2013-12-06 23:01:26','2013-12-06 23:01:26'),
	(162,80,13,0.00,0.00000,0,0,'2013-12-06 23:01:27','2013-12-06 23:01:27'),
	(173,85,4,20.00,11.80000,0,0,'2013-12-10 17:39:16','2013-12-10 17:39:16'),
	(174,85,3,20.00,31.00000,1,0,'2013-12-10 17:39:16','2013-12-10 17:39:16'),
	(175,85,1,20.00,7.20000,0,0,'2013-12-10 17:39:16','2013-12-10 17:39:16'),
	(176,85,2,0.00,0.00000,0,1,'2013-12-10 17:40:22','2013-12-10 17:40:22'),
	(179,89,1,19.76,50.60729,1,0,'2013-12-11 14:59:22','2013-12-11 14:59:22'),
	(180,89,3,21.73,0.00000,0,0,'2013-12-11 14:59:22','2013-12-11 14:59:22'),
	(181,89,2,0.00,0.00000,0,1,'2013-12-11 14:59:29','2013-12-11 14:59:29'),
	(185,88,3,20.81,36.90533,1,0,'2013-12-11 15:18:42','2013-12-11 15:18:42'),
	(186,88,4,19.27,4.77426,0,0,'2013-12-11 15:18:42','2013-12-11 15:18:42'),
	(187,88,1,23.16,6.04491,0,0,'2013-12-11 15:18:42','2013-12-11 15:18:42'),
	(188,88,2,0.00,0.00000,0,1,'2013-12-11 15:20:15','2013-12-11 15:20:15'),
	(192,95,1,22.76,21.96837,1,0,'2014-01-03 14:50:54','2014-01-03 14:50:54'),
	(193,95,3,23.13,10.80847,0,0,'2014-01-03 14:50:55','2014-01-03 14:50:55'),
	(194,95,4,18.84,13.26964,0,0,'2014-01-03 14:50:55','2014-01-03 14:50:55'),
	(195,95,2,0.00,0.00000,0,1,'2014-01-03 14:51:54','2014-01-03 14:51:54'),
	(196,100,4,0.00,0.00000,0,0,'2014-01-03 15:30:39','2014-01-03 15:30:39'),
	(197,100,3,0.00,0.00000,0,0,'2014-01-03 15:30:43','2014-01-03 15:30:43'),
	(198,100,1,0.00,0.00000,0,0,'2014-01-03 15:30:45','2014-01-03 15:30:45'),
	(201,101,17,33.33,30.00300,1,0,'2014-01-08 20:23:53','2014-01-08 20:23:53'),
	(202,101,16,33.33,0.00000,0,0,'2014-01-08 20:23:53','2014-01-08 20:23:53'),
	(203,101,15,0.00,0.00000,0,1,'2014-01-08 20:23:59','2014-01-08 20:23:59'),
	(205,102,15,31.97,31.27932,1,0,'2014-01-08 20:28:12','2014-01-08 20:28:12'),
	(206,102,17,0.00,0.00000,0,1,'2014-01-08 20:28:25','2014-01-08 20:28:25');

/*!40000 ALTER TABLE `investments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table market
# ------------------------------------------------------------

DROP TABLE IF EXISTS `market`;

CREATE TABLE `market` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `market_header` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `market_question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `market_subtext` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `current_market_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_market_selection` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `market` WRITE;
/*!40000 ALTER TABLE `market` DISABLE KEYS */;

INSERT INTO `market` (`id`, `survey_id`, `market_header`, `market_question`, `market_subtext`, `current_market_status`, `user_market_selection`, `created_at`, `updated_at`)
VALUES
	(1,1,'Your Product Concepts','Which concept is most likely to be purchased by women aged 28 - 52?','Use the sliders to estimate the probability of each product being most preferred. You must choose at least one product, but you may also assign a probability of preference to two or more products. Remember, you will only earn a bonus by choosing the produ','{concept1, \"blah\", concept2: \"blah2\", concept3: \"blah3\"}','{concept1, \"user_blah\", concept2: \"user_blah2\", concept3: \"user_blah3\"}','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(2,2,'Your Product Concepts for market 2','Which concept is most likely to be purchased by elderly rabid gambling addicts?','Use the sliders to estimate the probability of each product being most preferred. You must choose at least one product, but you may also assign a probability of preference to two or more products. Remember, you will only earn a bonus by choosing the produ','{concept1, \"blah\", concept2: \"blah2\", concept3: \"blah3\"}','{concept1, \"user_blah\", concept2: \"user_blah2\", concept3: \"user_blah3\"}','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(3,3,'Your Product Concepts for market 2','Which concept is most likely to be purchased by duck dynasty viewers over the age of 45?','Use the sliders to estimate the probability of each product being most preferred. You must choose at least one product, but you may also assign a probability of preference to two or more products. Remember, you will only earn a bonus by choosing the produ','{concept1, \"blah\", concept2: \"blah2\", concept3: \"blah3\"}','{concept1, \"user_blah\", concept2: \"user_blah2\", concept3: \"user_blah3\"}','2013-12-03 16:31:25','2013-12-03 16:31:25');

/*!40000 ALTER TABLE `market` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`migration`, `batch`)
VALUES
	('2013_05_20_160129_create_users_table',1),
	('2013_05_24_182858_create_categories_table',1),
	('2013_05_30_190418_create_surveys_table',1),
	('2013_06_03_155928_create_concepts_table',1),
	('2013_07_01_191414_create_market_table',1),
	('2013_07_11_192713_create_investments_table',1),
	('2013_07_15_192139_create_concept_frames_table',1),
	('2013_07_15_192750_create_target_demographic_table',1),
	('2013_07_15_193820_create_suggestions_table',1),
	('2013_07_15_194449_create_suggestion_votes_table',1),
	('2013_09_09_150010_create_answers_table',1),
	('2013_09_09_151109_create_questions_table',1),
	('2013_11_05_161647_create_pages_table',1),
	('2013_11_05_211518_create_templates_table',1),
	('2014_01_07_165107_add_branching_questions_table',2),
	('2014_01_07_210434_add_background_image_to_survey_table',2);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;

INSERT INTO `pages` (`id`, `survey_id`, `name`, `hash`, `type`, `template`, `created_at`, `updated_at`)
VALUES
	(1,3,'intro','','default','<div class=\"wrapper\" id=\"intro\">\r\n	<div id=\"translations\">\r\n		<a href=\"language/en\">English</a> | <a href=\"language/es\">Spanish</a>\r\n	</div><!-- #translations -->\r\n	<h1 class=\"tagline\">Get Paid for Having FUN!!</h1>\r\n	<p>We\'d like your help today by participating in a stock investing game. In this game we\'ll present you with several new product concepts. Once you\'ve reviewed each product concept, you\'ll be given the opportunity to buy shares in them using a stock trading tool.  Don’t worry, we won’t ask for your money!  We’re giving you $1,000 virtual dollars to invest.</p>\r\n	<p>This exercise represents a new way for you to help product designers predict which product will be successful and which will fail. In addition to the reward you\'ll be receiving for participating, by investing in the correct product concept, you\'ll be able to win up to an additional $10!</p>\r\n	<h2 id=\"intro\"> </h2>\r\n\r\n\r\n	<div id=\"centerButtons\">\r\n		<a href=\"\" class=\"styledButton navNextButton\">Let\'s Get Started!</a>\r\n	</div>\r\n</div>','2013-12-03 16:31:24','2013-12-05 15:45:05'),
	(2,3,'categories',NULL,'default','<a href=\"#intro\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n<div class=\"wrapper\" id=\"\">\n	<h1>Topic Categories</h1>\r\n	<p>In order to \"win big,\" you\'ll need to make an accurate prediction regarding how people will feel about a particular product concept.  With that in mind, we are testing concepts in the following categories.  Please select the three (3) categories you feel most qualified to evaluate.</p>\r\n	<ul id=\"screenerCategories\" class=\"clearfix\">\r\n	<% _.each(display_categories, function(cat, i) { %>\r\n		<li><input class=\"category_button\" type=\"checkbox\" id=\"<%= cat.id %>\" name=\"<%= cat.name %>\" value=\"<%= cat.id %>\">\r\n			<label for=\"<%= cat.id %>\"><%= cat.name %></label>\r\n		</li>\r\n	<% }); %>\r\n	</ul>\r\n	<div id=\"centerButtons\">\r\n		<a id=\"checkCategories\" href=\"\" class=\"styledButton navNextButton\">Continue</a>\r\n	</div>\r\n</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(3,3,'agreement','','default','<p><a href=\"#categories\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a></p>\r\n\r\n<div id=\"nda\" align=\"center\">\r\n    <table border=\"0\" align=\"center\" width=\"1015px\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n    <td border=\"0\" height=\"11px\"><img src=\"https://surveys.infosurv.com/vovici/images/iCE/theme_01.gif\" border=\"0\"></td>\r\n    </tr>\r\n    <tr>\r\n    <td background=\"https://surveys.infosurv.com/vovici/images/iCE/theme_03.gif\">\r\n    <div style=\"position:relative;margin-left:10px;padding-left:3px;padding-right:2px;width:980px;\">\r\n\r\n              <h1>Intengo</h1>\r\n    <div style=\"font-weight:bold;font-size:1.7em;color:gray;\">Agreement</div>\r\n        <p>This Agreement (the \"Agreement\") is made and entered into by and between Infosurv, Inc. d/b/a Intengo, a Delaware corporation (hereinafter \"Intengo\"), and a participant (hereinafter \"RESPONDENT\") in an online internet study (\"the Study\") being conducted by Intengo (collectively, the \"Parties\").</p>\r\n        <p><strong>WHEREAS</strong>, Intengo desires to share certain confidential information with the RESPONDENT in connection with the Study;</p>\r\n        <p><strong>WHEREAS</strong>, RESPONDENT desires to provide Intengo certain non-confidential information in connection with the Study;</p>\r\n        <p><strong>NOW THEREFORE</strong>, for and in consideration of the foregoing and the mutual promises and covenants contained herein, the Parties agree as follows:</p>\r\n\r\n        <strong>1. DEFINITIONS</strong>\r\n        <ul>\r\n            <li>1.1. \"Confidential Information\" shall mean all non-public information that Intengo provides to RESPONDENT. \"Confidential Information\" shall include, but not be limited to, any images, ideas, descriptions, or media related to the concepts found within the Study.</li>\r\n            <li>1.2. Confidential Information shall not include that information included within the definition of Confidential Information above which:</li>\r\n                <ul>\r\n                    <li>1.2a entered the public domain without RESPONDENT\'s breach of any obligation owed Intengo, or</li>\r\n                    <li>1.2b became known to RESPONDENT prior to Intengo\'s disclosure of such information to RESPONDENT, or</li>\r\n                    <li>1.2c became known to RESPONDENT from a source other than Intengo other than by the breach of an obligation of confidentiality owed to Intengo, or</li>\r\n                    <li>1.2d was independently developed by RESPONDENT.</li>\r\n                </ul>\r\n\r\n            <li>RESPONDENT must establish that information falls into categories 1.2a, 1.2b, 1.2c, or 1.2d with contemporaneous documentary evidence.</li>\r\n            <li>1.3. \"Confidential Materials\" shall mean all tangible materials in any media containing Confidential Information, including without limitation, written or printed documents, product samples, software, machines, prototypes, designs, specifications, articles of manufacture, drawings, and computer disks or tapes, whether machine-readable or user-readable.</li>\r\n        </ul>\r\n\r\n        <strong>2. RESTRICTIONS</strong>\r\n        <ul>\r\n            <li>2.1. RESPONDENT agrees that it will not use the Confidential Information or Confidential Materials for any purpose whatsoever except as necessary for the performance of its duties in connection with the Study.</li>\r\n            <li>2.2. RESPONDENT shall take all reasonable steps necessary to preserve the confidentiality of the Confidential Information and Confidential Materials and to prevent such Confidential Information and Confidential Materials from falling into the public domain or into the possession of other persons, including without limitation those steps that RESPONDENT takes to protect the confidentiality of its own confidential information.</li>\r\n            <li>2.3. RESPONDENT shall not (i) disclose any Confidential Information to any person, or (ii) use the Confidential Information or Confidential Materials for any reason or purpose other than to evaluate said Confidential Materials within the Study.</li>\r\n            <li>2.4. RESPONDENT may not reverse engineer, recreate, reconstruct, deconstruct, decompile, disassemble, or analyze any Confidential Materials or any substantial part thereof, nor create derivative works similar to any Confidential Materials without the express written permission of Intengo. RESPONDENT acknowledges its obligation to control access to technical data under the U.S. Export Laws and Regulations and agrees to adhere to such laws and regulations with regard to any technical data received under this Agreement.</li>\r\n            <li>2.5. RESPONDENT may disclose Confidential Information as required by government or judicial order, provided RESPONDENT gives Intengo prompt notice of such order and complies with any protective order (or equivalent) imposed on such disclosure.</li>\r\n            <li>2.6. RESPONDENT agrees that any and all information provided by RESPONDENT to Intengo in connection with the Study shall be considered non-confidential information by both Parties and such information may be used and/or disclosed by Intengo without restriction.  In addition, both Parties agree that Intengo may transfer any of its rights to use and disclose such information to any third party. Notwithstanding the foregoing, Intengo agrees that it shall not disclose the RESPONDENT’S name or residence address to any third party.  RESPONDENT further agrees that all title, ownership rights, and other intellectual and proprietary rights in any an idea or concept embodied in the information provided by RESPONDENT to Intengo shall be the property of Intengo.  If necessary RESPONDENT agrees that it will sign all paperwork required to transfer all title, ownership rights, and other intellectual and proprietary rights in any such idea or concept to Intengo.</li>\r\n        </ul>\r\n\r\n        <strong>3. RIGHTS AND REMEDIES</strong>\r\n        <ul>\r\n            <li>3.1. RESPONDENT shall notify Intengo promptly upon discovery of any unauthorized use or disclosure of Confidential Information or Confidential Materials, or any other breach of this Agreement by RESPONDENT, and will cooperate with Intengo in every reasonable way to help Intengo regain possession of the Confidential Information or Confidential Materials and prevent its future unauthorized use.</li>\r\n            <li>3.2. RESPONDENT shall return all originals, copies, reproductions, and summaries of Confidential Information and Confidential Materials at Intengo\'s request or, at Intengo\'s option, certify destruction of the same.</li>\r\n            <li>3.3. RESPONDENT acknowledges that monetary damages may not be a sufficient remedy for unauthorized disclosure or use of Confidential Information or Confidential Materials and that Intengo shall be entitle to, without waiving any other rights or remedies, such injunctive or equitable relief as may deemed proper by a court of competent jurisdiction.</li>\r\n        </ul>\r\n\r\n        <strong>4. MISCELLANEOUS</strong>\r\n        <ul>\r\n            <li>4.1. All Confidential Information and Confidential Materials are and shall remain the property of Intengo. By disclosing information to RESPONDENT, Intengo does not grant any express or implied right or license to RESPONDENT to use the Confidential Information and Confidential Materials or to any of Intengo\'s patents, copyrights, trademarks, trade secret information or other intellectual property.</li>\r\n            <li>4.2. This Agreement constitutes the entire agreement between the Parties with respect to the subject matter hereof and merges all prior discussions between them regarding the Confidential Information and Confidential Materials. This Agreement shall not be modified except by a written agreement dated subsequent to the date of this Agreement and signed by both Parties. None of the provisions of this Agreement shall be deemed to have been waived by any act or acquiescence on the part of Intengo, its agents, or employees, but only by an instrument in writing signed by an authorized officer of Intengo. No waiver of any provision of this Agreement shall constitute a waiver of any other provision(s) or of the same provision on another occasion.</li>\r\n            <li>4.3. If Intengo employs attorneys to enforce any rights arising out of or in relation to this Agreement, and prevails in such matter, Intengo shall be entitled to recover reasonable attorney\'s fees. This Agreement shall be construed and controlled by the laws of the State of Georgia, and both Parties consent to jurisdiction by the state and federal courts sitting in the State of Georgia. Process may be served on either party by U.S. Mail, postage prepaid, certified or registered, return receipt requested. If any provision of this Agreement shall be held by a court of competent jurisdiction to be illegal, invalid or unenforceable, the remaining provisions shall remain in full force and effect.</li>\r\n            <li>4.4. This Agreement will inure to the benefit of and be binding upon the Parties, their successors and assigns. All obligations created by this Agreement shall survive termination of the Parties\' business relationship.</li>\r\n        </ul>\r\n\r\n    <br>\r\n    <table cellspacing=\"0\" cellpadding=\"0\" width=\"900\" border=\"0\" class=\"copyright-text\">\r\n    <tbody>\r\n    <tr>\r\n    <td align=\"left\" width=\"33%\"></td>\r\n    <td align=\"center\" width=\"33%\"><span class=\"copyright-text\"><font color=\"#777777\">© 2013 Intengo. (Infosurv, Inc. d/b/a Intengo). All rights reserved.</font></span></td>\r\n    <td align=\"right\" width=\"34%\"></td></tr></tbody></table>\r\n    </div>\r\n    </td></tr>\r\n    <tr>\r\n    <td><img src=\"https://surveys.infosurv.com/vovici/images/iCE/theme_05.gif\"></td></tr></tbody></table>\r\n</div>\r\n\r\n<div class=\"wrapper\" id=\"\">\r\n    <h1>Agreement</h1>\r\n    <p>A major U.S. manufacturer of laundry care products would like your feedback! But before we begin, we need you to recognize that the concepts you are about to review are the confidential, intellectual property of our client. In order to proceed, you must agree to the terms of our <a href=\"#nda\" class=\"fancybox\">NDA (non-disclosure agreement)</a> which specifies how you must treat this confidential information.</p>\r\n\r\n    <ul id=\"agreementPage\">\r\n        <li><a href=\"#thank_you_fail\" class=\"styledButton do-not-agree\">I Do Not Agree</a></li>\r\n        <li><a href=\"\" class=\"styledButton agree navNextButton\">I Agree</a></li>\r\n    </ul>\r\n</div>','2013-12-03 16:31:25','2013-12-05 15:35:10'),
	(4,3,'background',NULL,'default','<a href=\"#agreement\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	<div class=\"wrapper\" id=\"\">\n		<h1>Background</h1>\r\n		<p>\r\n			First things first.  We need you to get inside the mind of this company’s primary customer. In this case, a woman between the ages of 28 and 52 who makes decisions regarding laundry care for her family. Today you’ll be predicting which new product concept this customer is most likely to buy if it becomes available for purchase.\r\n		</p>\r\n\r\n		<p>\r\n			If you predict the right one, you can earn up to an additional $10!\r\n		</p>\r\n\r\n		<div id=\"centerButtons\">\r\n			<a href=\"\" class=\"styledButton navNextButton\">Continue</a>\r\n		</div>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(5,3,'instructions','','default','<a href=\"#instructions\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	<div class=\"wrapper\" id=\"instructions\">\r\n		<h1>Instructions</h1>\r\n		<p>\r\n			To make your predictions, you’ll be asked to invest $1,000 virtual dollars among the available concepts.\r\n		</p>\r\n\r\n		<p>\r\n			On the next page, we’re going to show you the first concept.  If you think you’d like to buy shares in this concept, just click “Add to Portfolio.” If you don’t think the concept will be successful, just click “No Thanks.”\r\n		</p>\r\n		<p>\r\n			Once you’ve chosen all of the concepts you’d like to buy shares in, we’ll tell you the cost of each concept’s shares and then let you decide how you’d like to invest. You can always remove concepts from your portfolio if you decide not to purchase shares.\r\n		</p>\r\n\r\n		<div id=\"centerButtons\">\r\n			<a href=\"\" class=\"styledButton navNextButton\">Show me the Concepts</a>\r\n		</div>\r\n	</div>','2013-12-03 16:31:25','2013-12-05 15:37:14'),
	(6,3,'concept',NULL,'default','<a href=\"#instructions\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	<div class=\"wrapper\" id=\"conceptsPage\">\n		<h1><%= this.model.get(\'name\') %></h1>\r\n\r\n		<div id=\"conceptHTML\">\r\n			<%= this.model.get(\'html\') %>\r\n\r\n			<div id=\"portfolioButtons\">\r\n				<div style=\"display:inline;margin:0px 10px;\">\r\n					<a href=\"#next\" data-concept_id=\"<%= this.model.get(\'id\') %>\" class=\"styledButton reject\">No Thanks</a>\r\n				</div>\r\n\r\n				<div style=\"display:inline;margin:0px 10px;\">\r\n					<a href=\"#next\" class=\"styledButton add\" data-concept_id=\"<%= this.model.get(\'id\') %>\">Add To Portfolio</a>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(7,3,'buy','','default','<div class=\"wrapper\" id=\"buy\">\r\n		<h1>Your Concepts</h1>\r\n		<p>Alright, it\'s time to check out. Below, you\'ll see the logos you have selected and their current share price. You have $1,000 virtual dollars to invest in shares. If you buy shares in the logo <strong>that correctly answers the following question</strong>, those shares will be converted to real money (USD)!</p>\r\n\r\n		<div class=\'concept-question\'>Which concept is most likely to be purchased by women aged 28-52?</div>\r\n\r\n		<form action=\"\">\r\n			<table width=\"100%\" id=\"market\">\r\n				<tr>\r\n					<th class=\'removeFromCart\'></th>\r\n					<th>Concept Name</th>\r\n					<th id=\"priceth\">Current Price</th>\r\n					<th id=\"ati\" colspan=\"2\" >Amount to Invest</th>\r\n					<th id=\"pic\">Payout if Correct</th>\r\n				</tr>\r\n				<%\r\n					concepts.each(function(concept, idx){\r\n				%>\r\n					<tr class=\'<%= (idx % 2 == 0) ? \"even\" : \"odd\" %> concept\' id=\"concept_<%= idx %>\" data-id=\"<%= concept.get(\'id\') %>\">\r\n						<td class=\'removeFromCart\'><a href=\"#removeFromCart\" class=\"remove\">╳</a></td>\r\n						<td class=\"conceptName\" data-id=\"<%= concept.get(\'id\') %>\">\r\n							<a href=\"#<%= concept.get(\'id\') %>\" class=\"inline\"><%= concept.get(\'name\') %></a>\r\n						</td>\r\n						<td class=\'price\'>$<%= concept.get(\'marketPrice\') %></td>\r\n						<td class=\"atislider\">\r\n							<input type=\"range\" class=\"stock_selection\" id=\"stock_<%= idx %>\" value=\'0\' min=\'0\' max=\'1000\' step=\"1\">\r\n						</td>\r\n						<td class=\"amountToInvest\">$<input class=\"ati\" type=\"text\" value=\"0\"></td>\r\n\r\n						<td class=\'payout\'>$0.00</td>\r\n					</tr>\r\n				<% }); %>\r\n			</table>\r\n		</form>\r\n\r\n		<div id=\"balanceWrapper\">\r\n			Remaining Balance: <span id=\"remainingBalance\">$1000.00</span>\r\n		</div>\r\n\r\n		<div id=\"buyFooter\">\r\n			<a href=\"#concept/0\" class=\"styledButton reset\">Reset</a>\r\n			<a href=\"\" class=\"styledButton purchase navNextButton\">Purchase</a>\r\n		</div>\r\n		\r\n		<div class=\"popups hidden\">\r\n			<% concepts.each(function(concept, idx){ %>\r\n				<div id=\"<%= concept.get(\'id\') %>\">\r\n					<h4><%= concept.get(\'name\') %></h4>\r\n					<p><%= concept.get(\'thumb_html\') %></p>\r\n				</div>\r\n			<% }); %>\r\n		</div>\r\n</div>','2013-12-03 16:31:25','2013-12-05 15:39:09'),
	(8,3,'best_concept','','default','<a href=\"\" class=\"next navNextButton\"><img src=\"http://intengoresearch.com/img/next.png\" alt=\"next\"></a>\r\n\r\n<div class=\"wrapper\" id=\"best_concept\">\r\n	<h1 id=\"notietitle\">Best Concept</h1>\r\n	<h1 id=\"tietitle\" style=\"display:none;\">Best Concept</h1>\r\n	<section id=\"tie\">\r\n		<p>If we were to offer you 10 additional shares in <strong>one</strong> of the following concepts, which would you choose?</p>\r\n		<div id=\"concepts\"></div>\r\n	</section>\r\n\r\n	<section id=\"winner\">\r\n		<div id=\"concept\"></div>\r\n		<div id=\"questions\"></div>\r\n	</section>\r\n	</div>','2013-12-03 16:31:25','2013-12-05 15:40:31'),
	(9,3,'worst_concept',NULL,'default','<a href=\"#best_concept\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	\r\n<a href=\"\" class=\"next navNextButton\"><img src=\"http://intengoresearch.com/img/next.png\" alt=\"next\"></a>\r\n<div class=\"wrapper\" id=\"worst_concept\">\n	<h1 id=\"notietitle\">Worst Concept</h1>\r\n	<h1 id=\"tietitle\" style=\"display:none;\">Worst Concept Tie</h1>\r\n	<section id=\"tie\">\r\n		<p>You decided not to purchase shares in the following <strong>concepts</strong>. However, imagine you owned ten (10) shares in each. If you were forced to <strong>sell all of your shares</strong> in one of these <strong>concepts</strong>, which would you choose.</p>\r\n		<div id=\"concepts\"></div>\r\n	</section>\r\n\r\n	<section id=\"winner\" class=\"result\">\r\n		<div id=\"concept\"></div>\r\n		<div id=\"questions\"></div>\r\n	</section>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(10,3,'suggestions',NULL,'default','<a href=\"#worst_concept\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	\r\n<a href=\"\" class=\"next navNextButton\"><img src=\"http://intengoresearch.com/img/next.png\" alt=\"next\"></a>\r\n<div class=\"wrapper\" id=\"suggestions\">\n	<h1>Help Improve These Products!</h1>\r\n	<section>\r\n		<div id=\"concepts\"></div>\r\n		<div id=\"votes\">\r\n			<p style=\"margin-top:0px;\">\r\n				Here are some suggestions for improving this product. Use the \"thumbs up\" or \"thumbs down\" buttons to indicate if you agree with the suggestion. You can also add a suggestion of your own using the space provided at the bottom.\r\n			</p>\r\n\r\n			<b>If you could change one thing about this concept to make it more appealing to women aged 28-52, what would that be?</b>\r\n			<div id=\"suggestions_wrapper\"></div>\r\n\r\n		</div>\r\n	</section>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(11,3,'demographics',NULL,'default','<a href=\"#suggestions\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	\r\n<a href=\"\"  class=\"next navNextButton\"><img src=\"http://intengoresearch.com/img/next.png\" alt=\"next\"></a>\r\n\r\n<div class=\"wrapper\" id=\"demographics\">\n	<h1>Tell us a little about yourself.</h1>\r\n\r\n	<section>\r\n		<p></p>\r\n		<ul id=\"questions\"></ul>\r\n	</section>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(12,3,'finish',NULL,'default','<div class=\"wrapper\" id=\"finish\">\n	<h1>Thank you for participating.</h1>\r\n	<p>\r\n		Thanks for taking the time to give us your feedback...\r\n	</p>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(13,3,'buy_fail',NULL,'optional','<div class=\"wrapper\" id=\"buy_fail\">\n	<h1>Uh oh!</h1>\r\n	<p>You must add at least one concept to your portfolio. Please click the button below to try again.</p>\r\n\r\n	<div id=\"centerButtons\">\r\n			<a href=\"#concept/0\" class=\"styledButton reset\">Try Again</a>\r\n	</div>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(14,3,'category_fail',NULL,'optional','<div class=\"wrapper\" id=\"category_fail\">\n	<h1>Thank you for participating.</h1>\r\n	<p>\r\n		Thanks for your interest in our research.  Unfortunately, your expertise isn\'t a great match for our current prediction challenges.  But we\'re launching new studies every week, so be on the lookout for another opportunity soon!\r\n	</p>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(15,3,'thank_you_fail',NULL,'optional','<div class=\"wrapper\" id=\"thank_you_fail\">\n\r\n		<h1>Thank you for participating.</h1>\r\n		<p>\r\n		       Unfortunately you arent good enough, dont meet our criteria, and therefore fail at life.\r\n		       Oh and .... Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante,\r\n		       ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per. Curabitur\r\n		       vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per.\r\n		</p>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(16,3,'quota_met',NULL,'optional','<div class=\"wrapper\" id=\"quota_met\">\n	<h1>Uh oh!</h1>\r\n	<p>This survey has already been completed by the maximum number of participants. Thank you for your interest!</p>\r\n\r\n\r\n	</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(17,4,'intro','','default','<div class=\"wrapper\" id=\"intro\">\r\n	<div id=\"translations\">\r\n		<a href=\"language/en\">English</a> | <a href=\"language/es\">Spanish</a>\r\n	</div><!-- #translations -->\r\n	<h1 class=\"tagline\">Get Paid for Having FUN!!</h1>\r\n	<p>We\'d like your help today by participating in a stock investing game. In this game we\'ll present you with several new design concepts. Once you\'ve reviewed each concept, you\'ll be given the opportunity to buy shares in them using a stock trading tool. Don’t worry, we won’t ask for your money! We’re giving you $1,000 virtual dollars to invest.</p>\r\n	<p>This exercise represents a new way for you to help companies predict which designs will intrigue people and which will make no impact. In addition to the reward you\'ll be receiving for participating, by investing in the correct concept, you\'ll be able to win up to an additional $10!</p>\r\n	<h2 id=\"intro\"> </h2>\r\n\r\n\r\n	<div id=\"centerButtons\">\r\n		<a href=\"\" class=\"styledButton navNextButton\">Let\'s Get Started!</a>\r\n	</div>\r\n</div>','2013-12-03 16:31:24','2013-12-03 22:18:55'),
	(18,4,'categories','','default','<a href=\"#intro\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n<div class=\"wrapper\" id=\"\">\r\n	<h1>Who Do You Know?</h1>\r\n	<p>For this exercise, you’ll need to get inside the mind of a specific type of person.  You’ll need to understand this person’s motivations, preferences, and attitudes in order to make the best prediction.  And remember, you’ll only earn a bonus by choosing the correct concept, so only choose the three (3) types of people you are most familiar with:</p>\r\n\r\n	<ul id=\"screenerCategories\" class=\"clearfix\">\r\n	<% _.each(display_categories, function(cat, i) { %>\r\n		<li><input class=\"category_button\" type=\"checkbox\" id=\"<%= cat.id %>\" name=\"<%= cat.name %>\" value=\"<%= cat.id %>\">\r\n			<label for=\"<%= cat.id %>\"><%= cat.name %></label>\r\n		</li>\r\n	<% }); %>\r\n	</ul>\r\n	<div id=\"centerButtons\">\r\n		<a id=\"checkCategories\" href=\"\" class=\"styledButton navNextButton\">Continue</a>\r\n	</div>\r\n</div>','2013-12-03 16:31:25','2013-12-03 16:53:57'),
	(19,4,'agreement','','default','<a href=\"#categories\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n<div id=\"nda\" align=\"center\">\r\n	<table border=\"0\" align=\"center\" width=\"1015px\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody><tr>\r\n	<td border=\"0\" height=\"11px\"><img src=\"https://surveys.infosurv.com/vovici/images/iCE/theme_01.gif\" border=\"0\"></td>\r\n	</tr>\r\n	<tr>\r\n	<td background=\"https://surveys.infosurv.com/vovici/images/iCE/theme_03.gif\">\r\n	<div style=\"position:relative;margin-left:10px;padding-left:3px;padding-right:2px;width:980px;\">\r\n\r\n	          <h1>Intengo</h1>\r\n	<div style=\"font-weight:bold;font-size:1.7em;color:gray;\">Agreement</div>\r\n		<p>This Agreement (the \"Agreement\") is made and entered into by and between Infosurv, Inc. d/b/a Intengo, a Delaware corporation (hereinafter \"Intengo\"), and a participant (hereinafter \"RESPONDENT\") in an online internet study (\"the Study\") being conducted by Intengo (collectively, the \"Parties\").</p>\r\n		<p><strong>WHEREAS</strong>, Intengo desires to share certain confidential information with the RESPONDENT in connection with the Study;</p>\r\n		<p><strong>WHEREAS</strong>, RESPONDENT desires to provide Intengo certain non-confidential information in connection with the Study;</p>\r\n		<p><strong>NOW THEREFORE</strong>, for and in consideration of the foregoing and the mutual promises and covenants contained herein, the Parties agree as follows:</p>\r\n\r\n		<strong>1. DEFINITIONS</strong>\r\n		<ul>\r\n			<li>1.1. \"Confidential Information\" shall mean all non-public information that Intengo provides to RESPONDENT. \"Confidential Information\" shall include, but not be limited to, any images, ideas, descriptions, or media related to the concepts found within the Study.</li>\r\n			<li>1.2. Confidential Information shall not include that information included within the definition of Confidential Information above which:</li>\r\n				<ul>\r\n					<li>1.2a entered the public domain without RESPONDENT\'s breach of any obligation owed Intengo, or</li>\r\n					<li>1.2b became known to RESPONDENT prior to Intengo\'s disclosure of such information to RESPONDENT, or</li>\r\n					<li>1.2c became known to RESPONDENT from a source other than Intengo other than by the breach of an obligation of confidentiality owed to Intengo, or</li>\r\n					<li>1.2d was independently developed by RESPONDENT.</li>\r\n				</ul>\r\n\r\n			<li>RESPONDENT must establish that information falls into categories 1.2a, 1.2b, 1.2c, or 1.2d with contemporaneous documentary evidence.</li>\r\n			<li>1.3. \"Confidential Materials\" shall mean all tangible materials in any media containing Confidential Information, including without limitation, written or printed documents, product samples, software, machines, prototypes, designs, specifications, articles of manufacture, drawings, and computer disks or tapes, whether machine-readable or user-readable.</li>\r\n		</ul>\r\n\r\n		<strong>2. RESTRICTIONS</strong>\r\n		<ul>\r\n			<li>2.1. RESPONDENT agrees that it will not use the Confidential Information or Confidential Materials for any purpose whatsoever except as necessary for the performance of its duties in connection with the Study.</li>\r\n			<li>2.2. RESPONDENT shall take all reasonable steps necessary to preserve the confidentiality of the Confidential Information and Confidential Materials and to prevent such Confidential Information and Confidential Materials from falling into the public domain or into the possession of other persons, including without limitation those steps that RESPONDENT takes to protect the confidentiality of its own confidential information.</li>\r\n			<li>2.3. RESPONDENT shall not (i) disclose any Confidential Information to any person, or (ii) use the Confidential Information or Confidential Materials for any reason or purpose other than to evaluate said Confidential Materials within the Study.</li>\r\n			<li>2.4. RESPONDENT may not reverse engineer, recreate, reconstruct, deconstruct, decompile, disassemble, or analyze any Confidential Materials or any substantial part thereof, nor create derivative works similar to any Confidential Materials without the express written permission of Intengo. RESPONDENT acknowledges its obligation to control access to technical data under the U.S. Export Laws and Regulations and agrees to adhere to such laws and regulations with regard to any technical data received under this Agreement.</li>\r\n			<li>2.5. RESPONDENT may disclose Confidential Information as required by government or judicial order, provided RESPONDENT gives Intengo prompt notice of such order and complies with any protective order (or equivalent) imposed on such disclosure.</li>\r\n			<li>2.6. RESPONDENT agrees that any and all information provided by RESPONDENT to Intengo in connection with the Study shall be considered non-confidential information by both Parties and such information may be used and/or disclosed by Intengo without restriction.  In addition, both Parties agree that Intengo may transfer any of its rights to use and disclose such information to any third party. Notwithstanding the foregoing, Intengo agrees that it shall not disclose the RESPONDENT’S name or residence address to any third party.  RESPONDENT further agrees that all title, ownership rights, and other intellectual and proprietary rights in any an idea or concept embodied in the information provided by RESPONDENT to Intengo shall be the property of Intengo.  If necessary RESPONDENT agrees that it will sign all paperwork required to transfer all title, ownership rights, and other intellectual and proprietary rights in any such idea or concept to Intengo.</li>\r\n		</ul>\r\n\r\n		<strong>3. RIGHTS AND REMEDIES</strong>\r\n		<ul>\r\n			<li>3.1. RESPONDENT shall notify Intengo promptly upon discovery of any unauthorized use or disclosure of Confidential Information or Confidential Materials, or any other breach of this Agreement by RESPONDENT, and will cooperate with Intengo in every reasonable way to help Intengo regain possession of the Confidential Information or Confidential Materials and prevent its future unauthorized use.</li>\r\n			<li>3.2. RESPONDENT shall return all originals, copies, reproductions, and summaries of Confidential Information and Confidential Materials at Intengo\'s request or, at Intengo\'s option, certify destruction of the same.</li>\r\n			<li>3.3. RESPONDENT acknowledges that monetary damages may not be a sufficient remedy for unauthorized disclosure or use of Confidential Information or Confidential Materials and that Intengo shall be entitle to, without waiving any other rights or remedies, such injunctive or equitable relief as may deemed proper by a court of competent jurisdiction.</li>\r\n		</ul>\r\n\r\n		<strong>4. MISCELLANEOUS</strong>\r\n		<ul>\r\n			<li>4.1. All Confidential Information and Confidential Materials are and shall remain the property of Intengo. By disclosing information to RESPONDENT, Intengo does not grant any express or implied right or license to RESPONDENT to use the Confidential Information and Confidential Materials or to any of Intengo\'s patents, copyrights, trademarks, trade secret information or other intellectual property.</li>\r\n			<li>4.2. This Agreement constitutes the entire agreement between the Parties with respect to the subject matter hereof and merges all prior discussions between them regarding the Confidential Information and Confidential Materials. This Agreement shall not be modified except by a written agreement dated subsequent to the date of this Agreement and signed by both Parties. None of the provisions of this Agreement shall be deemed to have been waived by any act or acquiescence on the part of Intengo, its agents, or employees, but only by an instrument in writing signed by an authorized officer of Intengo. No waiver of any provision of this Agreement shall constitute a waiver of any other provision(s) or of the same provision on another occasion.</li>\r\n			<li>4.3. If Intengo employs attorneys to enforce any rights arising out of or in relation to this Agreement, and prevails in such matter, Intengo shall be entitled to recover reasonable attorney\'s fees. This Agreement shall be construed and controlled by the laws of the State of Georgia, and both Parties consent to jurisdiction by the state and federal courts sitting in the State of Georgia. Process may be served on either party by U.S. Mail, postage prepaid, certified or registered, return receipt requested. If any provision of this Agreement shall be held by a court of competent jurisdiction to be illegal, invalid or unenforceable, the remaining provisions shall remain in full force and effect.</li>\r\n			<li>4.4. This Agreement will inure to the benefit of and be binding upon the Parties, their successors and assigns. All obligations created by this Agreement shall survive termination of the Parties\' business relationship.</li>\r\n		</ul>\r\n\r\n	<br>\r\n	<table cellspacing=\"0\" cellpadding=\"0\" width=\"900\" border=\"0\" class=\"copyright-text\">\r\n	<tbody>\r\n	<tr>\r\n	<td align=\"left\" width=\"33%\"></td>\r\n	<td align=\"center\" width=\"33%\"><span class=\"copyright-text\"><font color=\"#777777\">© 2013 Intengo. (Infosurv, Inc. d/b/a Intengo). All rights reserved.</font></span></td>\r\n	<td align=\"right\" width=\"34%\"></td></tr></tbody></table>\r\n	</div>\r\n	</td></tr>\r\n	<tr>\r\n	<td><img src=\"https://surveys.infosurv.com/vovici/images/iCE/theme_05.gif\"></td></tr></tbody></table>\r\n</div>\r\n\r\n<div class=\"wrapper\" id=\"\">\r\n	<h1>Agreement</h1>\r\n	<p>A new educational based and career planning company would like your feedback! <strong>Your job is to predict which logo is most likely to capture the attention of Millennials who are looking to find information and career insights on opportunities within a particular industry (primarily ages 18-24)</strong>. If you predict the right one, you can earn up to an additional $10!</p>\r\n\r\n<p>For this scenario you will be reviewing 3 logo concepts. The concepts you are about to review are the confidential intellectual property of our client. In order to proceed, you must agree to the terms of our <a href=\"#nda\" class=\"fancybox\">NDA (non-disclosure agreement)</a>, which specifies how you must treat this confidential information.</p>\r\n\r\n	<ul id=\"agreementPage\">\r\n		<li><a href=\"#thank_you_fail\" class=\"styledButton do-not-agree\">I Do Not Agree</a></li>\r\n		<li><a href=\"\" class=\"styledButton agree navNextButton\">I Agree</a></li>\r\n	</ul>\r\n</div>','2013-12-03 16:31:25','2013-12-03 17:06:26'),
	(20,4,'background','','default','<a href=\"#agreement\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n<div class=\"wrapper\" id=\"\">\r\n	<h1>Background</h1>\r\n	<p>Before we show you the logo concepts, we want to tell you a bit about what this company stands for and the type of \r\n	person they are trying to attract.</p>\r\n\r\n	<h4 class=\"underline\">The Challenge</h4>\r\n	<p>We have been asked to select a logo for a business that wants to launch a targeted service offering that aspires to become the go-to resource for insights, career pathing, and general education on opportunities in the insurance industry.  The logo should be exciting and inviting – to motivate people to want to be a part of the insurance industry.</p>\r\n\r\n	<h4 class=\"underline\">Who We Want to Attract</h4>\r\n	<p>The logo should most importantly capture the attention of Millennials who are starting out their careers (primarily ages 18-24).  It should inspire them to want to learn more about potential opportunities available within the insurance field, how their interests and skills could translate to various positions/roles, and to change their perception of the industry overall in a favorable way.</p>\r\n\r\n	<p>Remember, Millennials are tech savvy and entrepreneurial.  They are well-educated, diverse, non-conformists, confident and accepting.  With social media ever-present, they are well-connected.  They believe that hard work should feel good, meaning they believe in it.  And they are self-advocates, believing they can have what they want if they work hard.</p>\r\n\r\n	<p>You should only “invest” in logos that will intrigue these people.</p>\r\n\r\n	<div id=\"centerButtons\">\r\n		<a href=\"\" class=\"styledButton navNextButton\">Continue</a>\r\n	</div>\r\n</div>','2013-12-03 16:31:25','2013-12-04 15:54:41'),
	(21,4,'instructions','','default','<a href=\"#instructions\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	<div class=\"wrapper\" id=\"instructions\">\r\n		<h1>Instructions</h1>\r\n		<p>\r\n			Now, thinking about what this company stands for, and the people they plan to serve, we’re going to show you a few potential logo concepts for the company. As you make your predictions regarding the strongest concept(s), think carefully about the company’s purpose, and the personality of the people they’d like to attract.</p>\r\n\r\n<p>To make your predictions, you’ll be asked to invest $1,000 virtual dollars among the available concepts. Think of it as making a bet or investing in the stock market.</p>\r\n\r\n<p>On the next page, we’re going to show you the first concept. If you think you’d like to buy shares in this concept, just click “Add to Portfolio.” If you don’t think the concept will be successful, just click “No Thanks.”</p>\r\n\r\n<p>Once you’ve chosen all of the concepts you’d like to buy shares in, we’ll tell you the cost of each concept’s shares and then let you decide how you’d like to invest. You can always remove concepts from your portfolio if you decide not to purchase shares.</p>\r\n\r\n		<div id=\"centerButtons\">\r\n			<a href=\"\" class=\"styledButton navNextButton\">Show me the Concepts</a>\r\n		</div>\r\n	</div>','2013-12-03 16:31:25','2013-12-04 15:56:43'),
	(22,4,'concept',NULL,'default','<a href=\"#instructions\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	<div class=\"wrapper\" id=\"conceptsPage\">\n		<h1><%= this.model.get(\'name\') %></h1>\r\n\r\n		<div id=\"conceptHTML\">\r\n			<%= this.model.get(\'html\') %>\r\n\r\n			<div id=\"portfolioButtons\">\r\n				<div style=\"display:inline;margin:0px 10px;\">\r\n					<a href=\"#next\" data-concept_id=\"<%= this.model.get(\'id\') %>\" class=\"styledButton reject\">No Thanks</a>\r\n				</div>\r\n\r\n				<div style=\"display:inline;margin:0px 10px;\">\r\n					<a href=\"#next\" class=\"styledButton add\" data-concept_id=\"<%= this.model.get(\'id\') %>\">Add To Portfolio</a>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(23,4,'buy','','default','<div class=\"wrapper\" id=\"buy\">\r\n		<h1>Your Logos</h1>\r\n		<p>Alright, it\'s time to check out. Below, you\'ll see the logos you have selected and their current share price. You have $1,000 virtual dollars to invest in shares. If you buy shares in the logo <strong>that correctly answers the following question</strong>, those shares will be converted to real money (USD)!</p>\r\n\r\n		<div class=\'concept-question\'>Which logo is most likely to capture the attention of Millennials who are starting their careers (primarily ages 18-24)?</div>\r\n\r\n		<form action=\"\">\r\n			<table width=\"100%\" id=\"market\">\r\n				<tr>\r\n					<th class=\'removeFromCart\'></th>\r\n					<th>Concept Name</th>\r\n					<th id=\"priceth\">Current Price</th>\r\n					<th id=\"ati\" colspan=\"2\" >Amount to Invest</th>\r\n					<th id=\"pic\">Payout if Correct</th>\r\n				</tr>\r\n				<%\r\n					concepts.each(function(concept, idx){\r\n				%>\r\n					<tr class=\'<%= (idx % 2 == 0) ? \"even\" : \"odd\" %> concept\' id=\"concept_<%= idx %>\" data-id=\"<%= concept.get(\'id\') %>\">\r\n						<td class=\'removeFromCart\'><a href=\"#removeFromCart\" class=\"remove\">╳</a></td>\r\n						<td class=\"conceptName\" data-id=\"<%= concept.get(\'id\') %>\">\r\n							<a href=\"#<%= concept.get(\'id\') %>\" class=\"inline\"><%= concept.get(\'name\') %></a>\r\n						</td>\r\n						<td class=\'price\'>$<%= concept.get(\'marketPrice\') %></td>\r\n						<td class=\"atislider\">\r\n							<input type=\"range\" class=\"stock_selection\" id=\"stock_<%= idx %>\" value=\'0\' min=\'0\' max=\'1000\' step=\"1\">\r\n						</td>\r\n						<td class=\"amountToInvest\">$<input class=\"ati\" type=\"text\" value=\"0\"></td>\r\n\r\n						<td class=\'payout\'>$0.00</td>\r\n					</tr>\r\n				<% }); %>\r\n			</table>\r\n		</form>\r\n\r\n		<div id=\"balanceWrapper\">\r\n			Remaining Balance: <span id=\"remainingBalance\">$1000.00</span>\r\n		</div>\r\n\r\n		<div id=\"buyFooter\">\r\n			<a href=\"#concept/0\" class=\"styledButton reset\">Reset</a>\r\n			<a href=\"\" class=\"styledButton purchase navNextButton\">Purchase</a>\r\n		</div>\r\n		\r\n		<div class=\"popups hidden\">\r\n			<% concepts.each(function(concept, idx){ %>\r\n				<div id=\"<%= concept.get(\'id\') %>\">\r\n					<h4><%= concept.get(\'name\') %></h4>\r\n					<p><%= concept.get(\'thumb_html\') %></p>\r\n				</div>\r\n			<% }); %>\r\n		</div>\r\n</div>','2013-12-03 16:31:25','2013-12-04 18:31:03'),
	(24,4,'best_concept','','default','<a href=\"\" class=\"next navNextButton\"><img src=\"http://intengoresearch.com/img/next.png\" alt=\"next\"></a>\r\n\r\n<div class=\"wrapper\" id=\"best_concept\">\r\n	<h1 id=\"notietitle\">Best Logo</h1>\r\n	<h1 id=\"tietitle\" style=\"display:none;\">Best Concept Tie</h1>\r\n	<section id=\"tie\">\r\n		<p>If we were to offer you 10 additional shares in <strong>one</strong> of the following concepts, which would you choose?</p>\r\n		<div id=\"concepts\"></div>\r\n	</section>\r\n\r\n	<section id=\"winner\">\r\n		<div id=\"concept\"></div>\r\n		<div id=\"questions\"></div>\r\n	</section>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 19:37:00'),
	(25,4,'worst_concept','','default','<a href=\"#best_concept\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	\r\n<a href=\"\" class=\"next navNextButton\"><img src=\"http://intengoresearch.com/img/next.png\" alt=\"next\"></a>\r\n<div class=\"wrapper\" id=\"worst_concept\">\r\n	<h1 id=\"notietitle\">Worst Logo</h1>\r\n	<h1 id=\"tietitle\" style=\"display:none;\">Worst Concept Tie</h1>\r\n	<section id=\"tie\">\r\n		<p>Let\'s replace the text on #worst_concept with this: \"Which of these logos is <strong>LEAST LIKELY</strong> to capture the attention of Millennials who are looking for work or just starting out their careers (primarily ages 18-24)?</p>\r\n		<div id=\"concepts\"></div>\r\n	</section>\r\n\r\n	<section id=\"winner\" class=\"result\">\r\n		<div id=\"concept\"></div>\r\n		<div id=\"questions\"></div>\r\n	</section>\r\n	</div>','2013-12-03 16:31:25','2013-12-05 16:27:40'),
	(26,4,'suggestions','','default','<a href=\"#worst_concept\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	\r\n<a href=\"\" class=\"next navNextButton\"><img src=\"http://intengoresearch.com/img/next.png\" alt=\"next\"></a>\r\n<div class=\"wrapper\" id=\"suggestions\">\r\n	<h1>Help Improve This Logo!</h1>\r\n	<section>\r\n		<div id=\"concepts\"></div>\r\n		<div id=\"votes\">\r\n			<p style=\"margin-top:0px;\">\r\n				Here are some suggestions for improving this product. Use the \"thumbs up\" or \"thumbs down\" buttons to indicate if you agree with the suggestion. You can also add a suggestion of your own using the space provided at the bottom.</p>\r\n\r\n<b>If you could change one thing about this logo to make it more appealing to Millennials, what would that be?</b>\r\n\r\n			<div id=\"suggestions_wrapper\"></div>\r\n\r\n		</div>\r\n	</section>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 19:43:23'),
	(27,4,'demographics',NULL,'default','<a href=\"#suggestions\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	\r\n<a href=\"\"  class=\"next navNextButton\"><img src=\"http://intengoresearch.com/img/next.png\" alt=\"next\"></a>\r\n\r\n<div class=\"wrapper\" id=\"demographics\">\n	<h1>Tell us a little about yourself.</h1>\r\n\r\n	<section>\r\n		<p></p>\r\n		<ul id=\"questions\"></ul>\r\n	</section>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(28,4,'finish','','default','<div class=\"wrapper\" id=\"finish\">\r\n<h1>Thank You!</h1><p>Your thoughts are very valuable as this organization pursues a visual identity. Thank you so much for participating in the process!</p><p>Your confirmation code is: <b>INTLOGO127</b></p><p>Please submit this code in Mturk to receive credit for this HIT.</p>\r\n</div>','2013-12-03 16:31:25','2013-12-05 19:30:30'),
	(29,4,'buy_fail',NULL,'optional','<div class=\"wrapper\" id=\"buy_fail\">\n	<h1>Uh oh!</h1>\r\n	<p>You must add at least one concept to your portfolio. Please click the button below to try again.</p>\r\n\r\n	<div id=\"centerButtons\">\r\n			<a href=\"#concept/0\" class=\"styledButton reset\">Try Again</a>\r\n	</div>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(30,4,'category_fail','','optional','<div class=\"wrapper\" id=\"category_fail\">\r\n     <h1>Thanks for your interest</h1><p>Unfortunately, you do not qualify for today\'s HIT. Keep your eyes open for more interesting opportunities from Intengo in the future.</p>\r\n</div>','2013-12-03 16:31:25','2013-12-05 19:21:30'),
	(31,4,'thank_you_fail','','optional','<div class=\"wrapper\" id=\"thank_you_fail\">\r\n<h1>Thanks for your interest</h1><p>Unfortunately, you must agree to the terms of our NDA in order to qualify for today’s HIT. Keep your eyes open for more interesting opportunities from Intengo in the future.</p>\r\n </div>','2013-12-03 16:31:25','2013-12-05 19:23:46'),
	(32,4,'quota_met',NULL,'optional','<div class=\"wrapper\" id=\"quota_met\">\n	<h1>Uh oh!</h1>\r\n	<p>This survey has already been completed by the maximum number of participants. Thank you for your interest!</p>\r\n\r\n\r\n	</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(33,4,'mechanicalturk','#mt','default','<div class=\"wrapper\" id=\"\">\r\n<h1 id=\"mturkid\">MTurk ID</h1>\r\n\r\n<p>Before we begin, please enter your Mechanical Turk worker ID.</p>\r\n\r\n<form action=\"#\" id=\"mtid\">\r\n<input type=\"text\" placeholder=\"Mechanical Turk ID\">\r\n<input type=\"submit\" value=\"proceed\">\r\n</form>\r\n</div>\r\n\r\n<script type=\"text/javascript\">\r\n$(\'#mtid\').on(\'submit\', function(e){\r\n    e.preventDefault();\r\n    var id = $(this).find(\'input[type=\"text\"]\').val()\r\n    $.ajax({\r\n          url: \'/users/data\',\r\n          type: \'POST\',\r\n          data: { \"mtid\": id }\r\n    }).done(function(){\r\n       window.location.hash = \'intro\';\r\n    });\r\n});\r\n</script>','2013-12-05 16:47:12','2013-12-05 19:18:40'),
	(35,4,'followup','','default','<div class=\"wrapper\" id=\"\">\n<a href=\"#suggestions\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	<div class=\"wrapper\" id=\"followup\">\r\n		<h1>Follow Up</h1>\r\n\r\n		<div id=\"questions\"></div>\r\n\r\n<div id=\"centerButtons\">\r\n	<a id=\"saveQuestions\" href=\"finish\" class=\"styledButton navNextButton\">Finish</a>\r\n</div>\r\n	</div></div>','2013-12-18 21:35:57','2013-12-18 21:35:57'),
	(36,5,'intro','','default','<div class=\"wrapper\" id=\"intro\">\r\n	<div id=\"translations\">\r\n		<a href=\"language/en\">English</a> | <a href=\"language/es\">Spanish</a>\r\n	</div><!-- #translations -->\r\n	<h1 class=\"tagline\">Get Paid for Having FUN!!</h1>\r\n	<p>We\'d like your help today by participating in a stock investing game. In this game we\'ll present you with several new design concepts. Once you\'ve reviewed each concept, you\'ll be given the opportunity to buy shares in them using a stock trading tool. Don’t worry, we won’t ask for your money! We’re giving you $1,000 virtual dollars to invest.</p>\r\n	<p>This exercise represents a new way for you to help companies predict which designs will intrigue people and which will make no impact. In addition to the reward you\'ll be receiving for participating, by investing in the correct concept, you\'ll be able to win up to an additional $10!</p>\r\n	<h2 id=\"intro\"> </h2>\r\n\r\n\r\n	<div id=\"centerButtons\">\r\n		<a href=\"\" class=\"styledButton navNextButton\">Let\'s Get Started!</a>\r\n	</div>\r\n</div>','2013-12-03 16:31:24','2013-12-03 22:18:55'),
	(37,5,'categories','','default','<a href=\"#intro\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n<div class=\"wrapper\" id=\"\">\r\n	<h1>Who Do You Know?</h1>\r\n	<p>For this exercise, you’ll need to get inside the mind of a specific type of person.  You’ll need to understand this person’s motivations, preferences, and attitudes in order to make the best prediction.  And remember, you’ll only earn a bonus by choosing the correct concept, so only choose the three (3) types of people you are most familiar with:</p>\r\n\r\n	<ul id=\"screenerCategories\" class=\"clearfix\">\r\n	<% _.each(display_categories, function(cat, i) { %>\r\n		<li><input class=\"category_button\" type=\"checkbox\" id=\"<%= cat.id %>\" name=\"<%= cat.name %>\" value=\"<%= cat.id %>\">\r\n			<label for=\"<%= cat.id %>\"><%= cat.name %></label>\r\n		</li>\r\n	<% }); %>\r\n	</ul>\r\n	<div id=\"centerButtons\">\r\n		<a id=\"checkCategories\" href=\"\" class=\"styledButton navNextButton\">Continue</a>\r\n	</div>\r\n</div>','2013-12-03 16:31:25','2013-12-03 16:53:57'),
	(38,5,'agreement','','default','<a href=\"#categories\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n<div id=\"nda\" align=\"center\">\r\n	<table border=\"0\" align=\"center\" width=\"1015px\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody><tr>\r\n	<td border=\"0\" height=\"11px\"><img src=\"https://surveys.infosurv.com/vovici/images/iCE/theme_01.gif\" border=\"0\"></td>\r\n	</tr>\r\n	<tr>\r\n	<td background=\"https://surveys.infosurv.com/vovici/images/iCE/theme_03.gif\">\r\n	<div style=\"position:relative;margin-left:10px;padding-left:3px;padding-right:2px;width:980px;\">\r\n\r\n	          <h1>Intengo</h1>\r\n	<div style=\"font-weight:bold;font-size:1.7em;color:gray;\">Agreement</div>\r\n		<p>This Agreement (the \"Agreement\") is made and entered into by and between Infosurv, Inc. d/b/a Intengo, a Delaware corporation (hereinafter \"Intengo\"), and a participant (hereinafter \"RESPONDENT\") in an online internet study (\"the Study\") being conducted by Intengo (collectively, the \"Parties\").</p>\r\n		<p><strong>WHEREAS</strong>, Intengo desires to share certain confidential information with the RESPONDENT in connection with the Study;</p>\r\n		<p><strong>WHEREAS</strong>, RESPONDENT desires to provide Intengo certain non-confidential information in connection with the Study;</p>\r\n		<p><strong>NOW THEREFORE</strong>, for and in consideration of the foregoing and the mutual promises and covenants contained herein, the Parties agree as follows:</p>\r\n\r\n		<strong>1. DEFINITIONS</strong>\r\n		<ul>\r\n			<li>1.1. \"Confidential Information\" shall mean all non-public information that Intengo provides to RESPONDENT. \"Confidential Information\" shall include, but not be limited to, any images, ideas, descriptions, or media related to the concepts found within the Study.</li>\r\n			<li>1.2. Confidential Information shall not include that information included within the definition of Confidential Information above which:</li>\r\n				<ul>\r\n					<li>1.2a entered the public domain without RESPONDENT\'s breach of any obligation owed Intengo, or</li>\r\n					<li>1.2b became known to RESPONDENT prior to Intengo\'s disclosure of such information to RESPONDENT, or</li>\r\n					<li>1.2c became known to RESPONDENT from a source other than Intengo other than by the breach of an obligation of confidentiality owed to Intengo, or</li>\r\n					<li>1.2d was independently developed by RESPONDENT.</li>\r\n				</ul>\r\n\r\n			<li>RESPONDENT must establish that information falls into categories 1.2a, 1.2b, 1.2c, or 1.2d with contemporaneous documentary evidence.</li>\r\n			<li>1.3. \"Confidential Materials\" shall mean all tangible materials in any media containing Confidential Information, including without limitation, written or printed documents, product samples, software, machines, prototypes, designs, specifications, articles of manufacture, drawings, and computer disks or tapes, whether machine-readable or user-readable.</li>\r\n		</ul>\r\n\r\n		<strong>2. RESTRICTIONS</strong>\r\n		<ul>\r\n			<li>2.1. RESPONDENT agrees that it will not use the Confidential Information or Confidential Materials for any purpose whatsoever except as necessary for the performance of its duties in connection with the Study.</li>\r\n			<li>2.2. RESPONDENT shall take all reasonable steps necessary to preserve the confidentiality of the Confidential Information and Confidential Materials and to prevent such Confidential Information and Confidential Materials from falling into the public domain or into the possession of other persons, including without limitation those steps that RESPONDENT takes to protect the confidentiality of its own confidential information.</li>\r\n			<li>2.3. RESPONDENT shall not (i) disclose any Confidential Information to any person, or (ii) use the Confidential Information or Confidential Materials for any reason or purpose other than to evaluate said Confidential Materials within the Study.</li>\r\n			<li>2.4. RESPONDENT may not reverse engineer, recreate, reconstruct, deconstruct, decompile, disassemble, or analyze any Confidential Materials or any substantial part thereof, nor create derivative works similar to any Confidential Materials without the express written permission of Intengo. RESPONDENT acknowledges its obligation to control access to technical data under the U.S. Export Laws and Regulations and agrees to adhere to such laws and regulations with regard to any technical data received under this Agreement.</li>\r\n			<li>2.5. RESPONDENT may disclose Confidential Information as required by government or judicial order, provided RESPONDENT gives Intengo prompt notice of such order and complies with any protective order (or equivalent) imposed on such disclosure.</li>\r\n			<li>2.6. RESPONDENT agrees that any and all information provided by RESPONDENT to Intengo in connection with the Study shall be considered non-confidential information by both Parties and such information may be used and/or disclosed by Intengo without restriction.  In addition, both Parties agree that Intengo may transfer any of its rights to use and disclose such information to any third party. Notwithstanding the foregoing, Intengo agrees that it shall not disclose the RESPONDENT’S name or residence address to any third party.  RESPONDENT further agrees that all title, ownership rights, and other intellectual and proprietary rights in any an idea or concept embodied in the information provided by RESPONDENT to Intengo shall be the property of Intengo.  If necessary RESPONDENT agrees that it will sign all paperwork required to transfer all title, ownership rights, and other intellectual and proprietary rights in any such idea or concept to Intengo.</li>\r\n		</ul>\r\n\r\n		<strong>3. RIGHTS AND REMEDIES</strong>\r\n		<ul>\r\n			<li>3.1. RESPONDENT shall notify Intengo promptly upon discovery of any unauthorized use or disclosure of Confidential Information or Confidential Materials, or any other breach of this Agreement by RESPONDENT, and will cooperate with Intengo in every reasonable way to help Intengo regain possession of the Confidential Information or Confidential Materials and prevent its future unauthorized use.</li>\r\n			<li>3.2. RESPONDENT shall return all originals, copies, reproductions, and summaries of Confidential Information and Confidential Materials at Intengo\'s request or, at Intengo\'s option, certify destruction of the same.</li>\r\n			<li>3.3. RESPONDENT acknowledges that monetary damages may not be a sufficient remedy for unauthorized disclosure or use of Confidential Information or Confidential Materials and that Intengo shall be entitle to, without waiving any other rights or remedies, such injunctive or equitable relief as may deemed proper by a court of competent jurisdiction.</li>\r\n		</ul>\r\n\r\n		<strong>4. MISCELLANEOUS</strong>\r\n		<ul>\r\n			<li>4.1. All Confidential Information and Confidential Materials are and shall remain the property of Intengo. By disclosing information to RESPONDENT, Intengo does not grant any express or implied right or license to RESPONDENT to use the Confidential Information and Confidential Materials or to any of Intengo\'s patents, copyrights, trademarks, trade secret information or other intellectual property.</li>\r\n			<li>4.2. This Agreement constitutes the entire agreement between the Parties with respect to the subject matter hereof and merges all prior discussions between them regarding the Confidential Information and Confidential Materials. This Agreement shall not be modified except by a written agreement dated subsequent to the date of this Agreement and signed by both Parties. None of the provisions of this Agreement shall be deemed to have been waived by any act or acquiescence on the part of Intengo, its agents, or employees, but only by an instrument in writing signed by an authorized officer of Intengo. No waiver of any provision of this Agreement shall constitute a waiver of any other provision(s) or of the same provision on another occasion.</li>\r\n			<li>4.3. If Intengo employs attorneys to enforce any rights arising out of or in relation to this Agreement, and prevails in such matter, Intengo shall be entitled to recover reasonable attorney\'s fees. This Agreement shall be construed and controlled by the laws of the State of Georgia, and both Parties consent to jurisdiction by the state and federal courts sitting in the State of Georgia. Process may be served on either party by U.S. Mail, postage prepaid, certified or registered, return receipt requested. If any provision of this Agreement shall be held by a court of competent jurisdiction to be illegal, invalid or unenforceable, the remaining provisions shall remain in full force and effect.</li>\r\n			<li>4.4. This Agreement will inure to the benefit of and be binding upon the Parties, their successors and assigns. All obligations created by this Agreement shall survive termination of the Parties\' business relationship.</li>\r\n		</ul>\r\n\r\n	<br>\r\n	<table cellspacing=\"0\" cellpadding=\"0\" width=\"900\" border=\"0\" class=\"copyright-text\">\r\n	<tbody>\r\n	<tr>\r\n	<td align=\"left\" width=\"33%\"></td>\r\n	<td align=\"center\" width=\"33%\"><span class=\"copyright-text\"><font color=\"#777777\">© 2013 Intengo. (Infosurv, Inc. d/b/a Intengo). All rights reserved.</font></span></td>\r\n	<td align=\"right\" width=\"34%\"></td></tr></tbody></table>\r\n	</div>\r\n	</td></tr>\r\n	<tr>\r\n	<td><img src=\"https://surveys.infosurv.com/vovici/images/iCE/theme_05.gif\"></td></tr></tbody></table>\r\n</div>\r\n\r\n<div class=\"wrapper\" id=\"\">\r\n	<h1>Agreement</h1>\r\n	<p>A new educational based and career planning company would like your feedback! <strong>Your job is to predict which logo is most likely to capture the attention of Millennials who are looking to find information and career insights on opportunities within a particular industry (primarily ages 18-24)</strong>. If you predict the right one, you can earn up to an additional $10!</p>\r\n\r\n<p>For this scenario you will be reviewing 3 logo concepts. The concepts you are about to review are the confidential intellectual property of our client. In order to proceed, you must agree to the terms of our <a href=\"#nda\" class=\"fancybox\">NDA (non-disclosure agreement)</a>, which specifies how you must treat this confidential information.</p>\r\n\r\n	<ul id=\"agreementPage\">\r\n		<li><a href=\"#thank_you_fail\" class=\"styledButton do-not-agree\">I Do Not Agree</a></li>\r\n		<li><a href=\"\" class=\"styledButton agree navNextButton\">I Agree</a></li>\r\n	</ul>\r\n</div>','2013-12-03 16:31:25','2013-12-03 17:06:26'),
	(39,5,'background','','default','<a href=\"#agreement\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n<div class=\"wrapper\" id=\"\">\r\n	<h1>Background</h1>\r\n	<p>Before we show you the logo concepts, we want to tell you a bit about what this company stands for and the type of \r\n	person they are trying to attract.</p>\r\n\r\n	<h4 class=\"underline\">The Challenge</h4>\r\n	<p>We have been asked to select a logo for a business that wants to launch a targeted service offering that aspires to become the go-to resource for insights, career pathing, and general education on opportunities in the insurance industry.  The logo should be exciting and inviting – to motivate people to want to be a part of the insurance industry.</p>\r\n\r\n	<h4 class=\"underline\">Who We Want to Attract</h4>\r\n	<p>The logo should most importantly capture the attention of Millennials who are starting out their careers (primarily ages 18-24).  It should inspire them to want to learn more about potential opportunities available within the insurance field, how their interests and skills could translate to various positions/roles, and to change their perception of the industry overall in a favorable way.</p>\r\n\r\n	<p>Remember, Millennials are tech savvy and entrepreneurial.  They are well-educated, diverse, non-conformists, confident and accepting.  With social media ever-present, they are well-connected.  They believe that hard work should feel good, meaning they believe in it.  And they are self-advocates, believing they can have what they want if they work hard.</p>\r\n\r\n	<p>You should only “invest” in logos that will intrigue these people.</p>\r\n\r\n	<div id=\"centerButtons\">\r\n		<a href=\"\" class=\"styledButton navNextButton\">Continue</a>\r\n	</div>\r\n</div>','2013-12-03 16:31:25','2013-12-04 15:54:41'),
	(40,5,'instructions','','default','<a href=\"#instructions\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	<div class=\"wrapper\" id=\"instructions\">\r\n		<h1>Instructions</h1>\r\n		<p>\r\n			Now, thinking about what this company stands for, and the people they plan to serve, we’re going to show you a few potential logo concepts for the company. As you make your predictions regarding the strongest concept(s), think carefully about the company’s purpose, and the personality of the people they’d like to attract.</p>\r\n\r\n<p>To make your predictions, you’ll be asked to invest $1,000 virtual dollars among the available concepts. Think of it as making a bet or investing in the stock market.</p>\r\n\r\n<p>On the next page, we’re going to show you the first concept. If you think you’d like to buy shares in this concept, just click “Add to Portfolio.” If you don’t think the concept will be successful, just click “No Thanks.”</p>\r\n\r\n<p>Once you’ve chosen all of the concepts you’d like to buy shares in, we’ll tell you the cost of each concept’s shares and then let you decide how you’d like to invest. You can always remove concepts from your portfolio if you decide not to purchase shares.</p>\r\n\r\n		<div id=\"centerButtons\">\r\n			<a href=\"\" class=\"styledButton navNextButton\">Show me the Concepts</a>\r\n		</div>\r\n	</div>','2013-12-03 16:31:25','2013-12-04 15:56:43'),
	(41,5,'concept',NULL,'default','<a href=\"#instructions\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	<div class=\"wrapper\" id=\"conceptsPage\">\n		<h1><%= this.model.get(\'name\') %></h1>\r\n\r\n		<div id=\"conceptHTML\">\r\n			<%= this.model.get(\'html\') %>\r\n\r\n			<div id=\"portfolioButtons\">\r\n				<div style=\"display:inline;margin:0px 10px;\">\r\n					<a href=\"#next\" data-concept_id=\"<%= this.model.get(\'id\') %>\" class=\"styledButton reject\">No Thanks</a>\r\n				</div>\r\n\r\n				<div style=\"display:inline;margin:0px 10px;\">\r\n					<a href=\"#next\" class=\"styledButton add\" data-concept_id=\"<%= this.model.get(\'id\') %>\">Add To Portfolio</a>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(42,5,'buy','','default','<div class=\"wrapper\" id=\"buy\">\r\n		<h1>Your Logos</h1>\r\n		<p>Alright, it\'s time to check out. Below, you\'ll see the logos you have selected and their current share price. You have $1,000 virtual dollars to invest in shares. If you buy shares in the logo <strong>that correctly answers the following question</strong>, those shares will be converted to real money (USD)!</p>\r\n\r\n		<div class=\'concept-question\'>Which logo is most likely to capture the attention of Millennials who are starting their careers (primarily ages 18-24)?</div>\r\n\r\n		<form action=\"\">\r\n			<table width=\"100%\" id=\"market\">\r\n				<tr>\r\n					<th class=\'removeFromCart\'></th>\r\n					<th>Concept Name</th>\r\n					<th id=\"priceth\">Current Price</th>\r\n					<th id=\"ati\" colspan=\"2\" >Amount to Invest</th>\r\n					<th id=\"pic\">Payout if Correct</th>\r\n				</tr>\r\n				<%\r\n					concepts.each(function(concept, idx){\r\n				%>\r\n					<tr class=\'<%= (idx % 2 == 0) ? \"even\" : \"odd\" %> concept\' id=\"concept_<%= idx %>\" data-id=\"<%= concept.get(\'id\') %>\">\r\n						<td class=\'removeFromCart\'><a href=\"#removeFromCart\" class=\"remove\">╳</a></td>\r\n						<td class=\"conceptName\" data-id=\"<%= concept.get(\'id\') %>\">\r\n							<a href=\"#<%= concept.get(\'id\') %>\" class=\"inline\"><%= concept.get(\'name\') %></a>\r\n						</td>\r\n						<td class=\'price\'>$<%= concept.get(\'marketPrice\') %></td>\r\n						<td class=\"atislider\">\r\n							<input type=\"range\" class=\"stock_selection\" id=\"stock_<%= idx %>\" value=\'0\' min=\'0\' max=\'1000\' step=\"1\">\r\n						</td>\r\n						<td class=\"amountToInvest\">$<input class=\"ati\" type=\"text\" value=\"0\"></td>\r\n\r\n						<td class=\'payout\'>$0.00</td>\r\n					</tr>\r\n				<% }); %>\r\n			</table>\r\n		</form>\r\n\r\n		<div id=\"balanceWrapper\">\r\n			Remaining Balance: <span id=\"remainingBalance\">$1000.00</span>\r\n		</div>\r\n\r\n		<div id=\"buyFooter\">\r\n			<a href=\"#concept/0\" class=\"styledButton reset\">Reset</a>\r\n			<a href=\"\" class=\"styledButton purchase navNextButton\">Purchase</a>\r\n		</div>\r\n		\r\n		<div class=\"popups hidden\">\r\n			<% concepts.each(function(concept, idx){ %>\r\n				<div id=\"<%= concept.get(\'id\') %>\">\r\n					<h4><%= concept.get(\'name\') %></h4>\r\n					<p><%= concept.get(\'thumb_html\') %></p>\r\n				</div>\r\n			<% }); %>\r\n		</div>\r\n</div>','2013-12-03 16:31:25','2013-12-04 18:31:03'),
	(43,5,'best_concept','','default','<a href=\"\" class=\"next navNextButton\"><img src=\"http://intengoresearch.com/img/next.png\" alt=\"next\"></a>\r\n\r\n<div class=\"wrapper\" id=\"best_concept\">\r\n	<h1 id=\"notietitle\">Best Logo</h1>\r\n	<h1 id=\"tietitle\" style=\"display:none;\">Best Concept Tie</h1>\r\n	<section id=\"tie\">\r\n		<p>If we were to offer you 10 additional shares in <strong>one</strong> of the following concepts, which would you choose?</p>\r\n		<div id=\"concepts\"></div>\r\n	</section>\r\n\r\n	<section id=\"winner\">\r\n		<div id=\"concept\"></div>\r\n		<div id=\"questions\"></div>\r\n	</section>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 19:37:00'),
	(44,5,'worst_concept','','default','<a href=\"#best_concept\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	\r\n<a href=\"\" class=\"next navNextButton\"><img src=\"http://intengoresearch.com/img/next.png\" alt=\"next\"></a>\r\n<div class=\"wrapper\" id=\"worst_concept\">\r\n	<h1 id=\"notietitle\">Worst Logo</h1>\r\n	<h1 id=\"tietitle\" style=\"display:none;\">Worst Concept Tie</h1>\r\n	<section id=\"tie\">\r\n		<p>Let\'s replace the text on #worst_concept with this: \"Which of these logos is <strong>LEAST LIKELY</strong> to capture the attention of Millennials who are looking for work or just starting out their careers (primarily ages 18-24)?</p>\r\n		<div id=\"concepts\"></div>\r\n	</section>\r\n\r\n	<section id=\"winner\" class=\"result\">\r\n		<div id=\"concept\"></div>\r\n		<div id=\"questions\"></div>\r\n	</section>\r\n	</div>','2013-12-03 16:31:25','2013-12-05 16:27:40'),
	(45,5,'suggestions','','default','<a href=\"#worst_concept\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	\r\n<a href=\"\" class=\"next navNextButton\"><img src=\"http://intengoresearch.com/img/next.png\" alt=\"next\"></a>\r\n<div class=\"wrapper\" id=\"suggestions\">\r\n	<h1>Help Improve This Logo!</h1>\r\n	<section>\r\n		<div id=\"concepts\"></div>\r\n		<div id=\"votes\">\r\n			<p style=\"margin-top:0px;\">\r\n				Here are some suggestions for improving this product. Use the \"thumbs up\" or \"thumbs down\" buttons to indicate if you agree with the suggestion. You can also add a suggestion of your own using the space provided at the bottom.</p>\r\n\r\n<b>If you could change one thing about this logo to make it more appealing to Millennials, what would that be?</b>\r\n\r\n			<div id=\"suggestions_wrapper\"></div>\r\n\r\n		</div>\r\n	</section>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 19:43:23'),
	(46,5,'demographics',NULL,'default','<a href=\"#suggestions\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	\r\n<a href=\"\"  class=\"next navNextButton\"><img src=\"http://intengoresearch.com/img/next.png\" alt=\"next\"></a>\r\n\r\n<div class=\"wrapper\" id=\"demographics\">\n	<h1>Tell us a little about yourself.</h1>\r\n\r\n	<section>\r\n		<p></p>\r\n		<ul id=\"questions\"></ul>\r\n	</section>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(47,5,'finish','','default','<div class=\"wrapper\" id=\"finish\">\r\n<h1>Thank You!</h1><p>Your thoughts are very valuable as this organization pursues a visual identity. Thank you so much for participating in the process!</p><p>Your confirmation code is: <b>INTLOGO127</b></p><p>Please submit this code in Mturk to receive credit for this HIT.</p>\r\n</div>','2013-12-03 16:31:25','2013-12-05 19:30:30'),
	(48,5,'buy_fail',NULL,'optional','<div class=\"wrapper\" id=\"buy_fail\">\n	<h1>Uh oh!</h1>\r\n	<p>You must add at least one concept to your portfolio. Please click the button below to try again.</p>\r\n\r\n	<div id=\"centerButtons\">\r\n			<a href=\"#concept/0\" class=\"styledButton reset\">Try Again</a>\r\n	</div>\r\n	</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(49,5,'category_fail','','optional','<div class=\"wrapper\" id=\"category_fail\">\r\n     <h1>Thanks for your interest</h1><p>Unfortunately, you do not qualify for today\'s HIT. Keep your eyes open for more interesting opportunities from Intengo in the future.</p>\r\n</div>','2013-12-03 16:31:25','2013-12-05 19:21:30'),
	(50,5,'thank_you_fail','','optional','<div class=\"wrapper\" id=\"thank_you_fail\">\r\n<h1>Thanks for your interest</h1><p>Unfortunately, you must agree to the terms of our NDA in order to qualify for today’s HIT. Keep your eyes open for more interesting opportunities from Intengo in the future.</p>\r\n </div>','2013-12-03 16:31:25','2013-12-05 19:23:46'),
	(51,5,'quota_met',NULL,'optional','<div class=\"wrapper\" id=\"quota_met\">\n	<h1>Uh oh!</h1>\r\n	<p>This survey has already been completed by the maximum number of participants. Thank you for your interest!</p>\r\n\r\n\r\n	</div>','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(52,5,'mechanicalturk','#mt','default','<div class=\"wrapper\" id=\"\">\r\n<h1 id=\"mturkid\">MTurk ID</h1>\r\n\r\n<p>Before we begin, please enter your Mechanical Turk worker ID.</p>\r\n\r\n<form action=\"#\" id=\"mtid\">\r\n<input type=\"text\" placeholder=\"Mechanical Turk ID\">\r\n<input type=\"submit\" value=\"proceed\">\r\n</form>\r\n</div>\r\n\r\n<script type=\"text/javascript\">\r\n$(\'#mtid\').on(\'submit\', function(e){\r\n    e.preventDefault();\r\n    var id = $(this).find(\'input[type=\"text\"]\').val()\r\n    $.ajax({\r\n          url: \'/users/data\',\r\n          type: \'POST\',\r\n          data: { \"mtid\": id }\r\n    }).done(function(){\r\n       window.location.hash = \'intro\';\r\n    });\r\n});\r\n</script>','2013-12-05 16:47:12','2013-12-05 19:18:40'),
	(53,5,'followup','','default','<a href=\"#suggestions\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	<div class=\"wrapper\" id=\"followup\">\r\n		<h1>Follow Up</h1>\r\n\r\n		<div id=\"questions\"></div>\r\n\r\n<div id=\"centerButtons\">\r\n	<a id=\"saveQuestions\" href=\"followup2\" class=\"styledButton navNextButton\">Next</a>\r\n</div>\r\n	</div>','2013-12-18 21:35:57','2014-01-08 21:26:29'),
	(54,5,'followup1a','','optional','<a href=\"#suggestions\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	<div class=\"wrapper\" id=\"followup1a\">\r\n		<h1>Follow Up</h1>\r\n\r\n		<div id=\"questions\"></div>\r\n\r\n<div id=\"centerButtons\">\r\n	<a id=\"saveQuestions\" href=\"followup2\" class=\"styledButton navNextButton\">Next</a>\r\n</div>\r\n	</div>','2014-01-08 20:02:19','2014-01-08 21:26:48'),
	(55,5,'followup2','','default','<a href=\"#suggestions\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	<div class=\"wrapper\" id=\"followup2\">\r\n		<h1>Follow Up</h1>\r\n\r\n		<div id=\"questions\"></div>\r\n\r\n<div id=\"centerButtons\">\r\n	<a id=\"saveQuestions\" href=\"followup3\" class=\"styledButton navNextButton\">Next</a>\r\n</div>\r\n	</div>','2014-01-08 20:02:50','2014-01-08 21:27:25'),
	(56,5,'followup2a','','optional','<a href=\"#suggestions\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	<div class=\"wrapper\" id=\"followup2a\">\r\n		<h1>Follow Up</h1>\r\n\r\n		<div id=\"questions\"></div>\r\n\r\n<div id=\"centerButtons\">\r\n	<a id=\"saveQuestions\" href=\"followup3\" class=\"styledButton navNextButton\">Next</a>\r\n</div>\r\n	</div>','2014-01-08 20:03:13','2014-01-08 21:27:50'),
	(57,5,'followup3','','default','<a href=\"#suggestions\" class=\"prev\"><img src=\"http://intengoresearch.com/img/prev.png\" alt=\"back\"></a>\r\n\r\n	<div class=\"wrapper\" id=\"followup3\">\r\n		<h1>Follow Up</h1>\r\n\r\n		<div id=\"questions\"></div>\r\n\r\n<div id=\"centerButtons\">\r\n	<a id=\"saveQuestions\" href=\"finish\" class=\"styledButton navNextButton\">Next</a>\r\n</div>\r\n	</div>','2014-01-08 20:03:35','2014-01-08 21:28:36');

/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table questions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `question_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `keys` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `branching_data` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;

INSERT INTO `questions` (`id`, `survey_id`, `question_type`, `category`, `description`, `options`, `keys`, `created_at`, `updated_at`, `branching_data`)
VALUES
	(1,1,'text','demographic_questions','What is your favorite hardware stores?','','','2013-12-03 16:31:25','2013-12-03 16:31:25',''),
	(2,1,'textarea','best_questions','Why do you feel that <strong>this concept is most likely to be purchased by women aged 28 - 52? </strong> Please cite specific attributes, emotional appeals, etc. We want to know why this <strong>concept</strong> will succeed!','','','2013-12-03 16:31:25','2013-12-03 16:31:25',''),
	(3,1,'textarea','worst_questions','Why do you feel this <strong>this concept is least likely to be purchased by women aged 28-52?</strong> Please cite specific attributes, deficiencies, missing features, benefits, etc. We want to know why this <strong>concept</strong> will fail.','','','2013-12-03 16:31:25','2013-12-03 16:31:25',''),
	(4,1,'radio','demographic_questions','What is your age range?','[\"0-12\", \"13-45\"]','','2013-12-03 16:31:25','2013-12-03 16:31:25',''),
	(5,1,'select','demographic_questions','What is your gender?','[\"male\", \"female\" ]','','2013-12-03 16:31:25','2013-12-03 16:31:25',''),
	(6,2,'textarea','best_questions','Why do you feel that <strong>this concept is most likely to be purchased by women aged 28 - 52? </strong> Please cite specific attributes, emotional appeals, etc. We want to know why this <strong>concept</strong> will succeed!','','','2013-12-03 16:31:25','2013-12-03 16:31:25',''),
	(7,2,'textarea','worst_questions','Why do you feel this <strong>this concept is least likely to be purchased by women aged 28-52?</strong> Please cite specific attributes, deficiencies, missing features, benefits, etc. We want to know why this <strong>concept</strong> will fail.','','','2013-12-03 16:31:25','2013-12-03 16:31:25',''),
	(8,2,'text','demographic_questions','What are your favorite politicians?','','','2013-12-03 16:31:25','2013-12-03 16:31:25',''),
	(9,3,'text','demographic_questions','What are your favorite laundry detergent brands?','[]','[]','2013-12-03 16:31:25','2013-12-05 15:44:27',''),
	(10,3,'textarea','best_questions','Why do you feel that <strong>this concept is most likely to be purchased by women aged 28 - 52? </strong> Please cite specific attributes, emotional appeals, etc. We want to know why this <strong>concept</strong> will succeed!','','','2013-12-03 16:31:25','2013-12-03 16:31:25',''),
	(11,3,'textarea','worst_questions','Why do you feel this <strong>this concept is least likely to be purchased by women aged 28-52?</strong> Please cite specific attributes, deficiencies, missing features, benefits, etc. We want to know why this <strong>concept</strong> will fail.','','','2013-12-03 16:31:25','2013-12-03 16:31:25',''),
	(12,3,'radio','demographic_questions','What is your age?','[\"18-24\", \"25-34\", \"35-44\", \"45-54\", \"55+\"]','','2013-12-03 16:31:25','2013-12-03 16:31:25',''),
	(13,3,'select','demographic_questions','What is your gender?','[\"male\", \"female\"]','','2013-12-03 16:31:25','2013-12-03 16:31:25',''),
	(15,4,'textarea','best_concept','Why do you feel that this logo is most likely to capture the attention of Millennials who are looking for work or just starting out their careers (primarily ages 18-24)? Please cite specific connotations, imagery, associations, etc. that influenced','[]','[]','2013-12-03 16:35:03','2013-12-18 21:10:30',''),
	(16,4,'textarea','worst_concept','Why do you feel this logo is least likely to capture the attention of Millennials? Please cite specific connotations, imagery, associations, etc. that influenced your decision.','[]','[]','2013-12-03 16:35:03','2013-12-18 21:10:38',''),
	(17,4,'radio','demographics','What is your age range?','[\"18-24\",\"25-29\",\"30-34\",\"35-39\",\"40-44\",\"45-49\",\"50-54\",\"55+\"]','[]','2013-12-03 16:35:03','2013-12-18 21:10:49',''),
	(18,4,'select','demographics','What is your gender?','[\"male\", \"female\" ]','','2013-12-03 16:35:03','2013-12-18 21:11:04',''),
	(19,4,'radio','demographics','Ethnicity','[\"American Indian\",\"Asian\",\"Black\\/African American\",\"Hispanic\",\"White\\/Caucasian\",\"Other\",\"Prefer Not To Answer\"]','[]','2013-12-04 16:08:46','2013-12-18 21:10:57',''),
	(20,4,'textarea','followup','Before we conclude, we\'d like to ask you a few questions about this research method.  First, if you found any part of the exercise to be confusing or unclear, please tell us about that.','[]','[]','2013-12-18 21:37:16','2013-12-18 21:37:16',''),
	(21,4,'radio','followup','As you were making your prediction, whose behavior did you consider? (check all that apply)','[\"Myself\",\"My son\\/daughter\",\"My niece\\/nephew\",\"A different family member\",\"A friend\\/friend\'s child\",\"Someone I know\",\"Millennials in general\",\"Other\"]','[]','2013-12-18 21:38:00','2013-12-18 21:41:37',''),
	(22,5,'text','demographic_questions','What is your favorite hardware stores?','','','2014-01-08 20:00:25','2014-01-08 20:00:25',''),
	(23,5,'textarea','best_questions','Why do you feel that <strong>this concept is most likely to be purchased by women aged 28 - 52? </strong> Please cite specific attributes, emotional appeals, etc. We want to know why this <strong>concept</strong> will succeed!','','','2014-01-08 20:00:25','2014-01-08 20:00:25',''),
	(24,5,'textarea','worst_questions','Why do you feel this <strong>this concept is least likely to be purchased by women aged 28-52?</strong> Please cite specific attributes, deficiencies, missing features, benefits, etc. We want to know why this <strong>concept</strong> will fail.','','','2014-01-08 20:00:25','2014-01-08 20:00:25',''),
	(25,5,'radio','demographic_questions','What is your age range?','[\"0-12\", \"13-45\"]','','2014-01-08 20:00:25','2014-01-08 20:00:25',''),
	(26,5,'select','demographic_questions','What is your gender?','[\"male\", \"female\" ]','','2014-01-08 20:00:25','2014-01-08 20:00:25',''),
	(27,5,'radio','followup','Before we conclude, we\'d like to ask you a few questions about this research method.  First, was the task easy to understand?','[\"Yes\",\"No\"]','[]','2014-01-08 20:04:48','2014-01-08 20:05:35','{\"1\":{\"branching_action\":\"redirect_to\",\"branching_target\":\"followup1a\"}}'),
	(28,5,'textarea','followup1a','We\'re sorry to hear that.  Can you tell us which part of the exercise was confusing or unclear?','[]','[]','2014-01-08 20:14:06','2014-01-08 20:14:06',''),
	(29,5,'radio','followup2','As you were making your prediction, did you think about how a specific person you know might react or did you try to think about Millennials in general?','[\"A specific person\",\"Millennials in general\"]','[]','2014-01-08 20:15:51','2014-01-08 21:05:12','{\"0\":{\"branching_action\":\"redirect_to\",\"branching_target\":\"followup2a\"}}'),
	(30,5,'radio','followup2a','Who did you have in mind?','[\"Myself\",\"My son\\/daughter\",\"My niece\\/nephew\",\"A different family member\",\"A friend\\/friend\'s child\",\"Someone I know\",\"Other\"]','[]','2014-01-08 20:20:10','2014-01-08 20:22:00',''),
	(31,5,'textarea','followup3','Do you have any other comments or suggestions regarding this research method?','[]','[]','2014-01-08 20:22:41','2014-01-08 20:22:41','');

/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table suggestion_votes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `suggestion_votes`;

CREATE TABLE `suggestion_votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `suggestion_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `up_or_down` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `suggestion_votes` WRITE;
/*!40000 ALTER TABLE `suggestion_votes` DISABLE KEYS */;

INSERT INTO `suggestion_votes` (`id`, `suggestion_id`, `user_id`, `up_or_down`, `created_at`, `updated_at`)
VALUES
	(2,5,13,1,'2013-12-06 15:18:31','2013-12-06 15:18:31'),
	(3,5,20,0,'2013-12-06 15:18:49','2013-12-06 15:18:49'),
	(4,5,38,0,'2013-12-06 15:19:26','2013-12-06 15:19:26'),
	(6,6,38,1,'2013-12-06 15:19:51','2013-12-06 15:19:51'),
	(7,6,39,0,'2013-12-06 15:20:56','2013-12-06 15:20:56'),
	(8,5,39,1,'2013-12-06 15:21:02','2013-12-06 15:21:02'),
	(9,5,60,1,'2013-12-06 15:22:40','2013-12-06 15:22:40'),
	(10,6,60,0,'2013-12-06 15:22:42','2013-12-06 15:22:42'),
	(11,5,35,1,'2013-12-06 15:23:05','2013-12-06 15:23:05'),
	(12,6,35,0,'2013-12-06 15:23:07','2013-12-06 15:23:07'),
	(15,5,48,1,'2013-12-06 15:24:19','2013-12-06 15:24:19'),
	(16,5,59,1,'2013-12-06 15:24:20','2013-12-06 15:24:20'),
	(20,6,59,0,'2013-12-06 15:24:26','2013-12-06 15:24:26'),
	(23,7,64,1,'2013-12-06 15:24:32','2013-12-06 15:24:32'),
	(24,5,28,1,'2013-12-06 15:24:36','2013-12-06 15:24:36'),
	(25,6,28,0,'2013-12-06 15:24:37','2013-12-06 15:24:37'),
	(26,5,56,1,'2013-12-06 15:25:26','2013-12-06 15:25:26'),
	(27,6,56,1,'2013-12-06 15:25:27','2013-12-06 15:25:27'),
	(28,7,15,1,'2013-12-06 15:26:16','2013-12-06 15:26:16'),
	(29,7,14,1,'2013-12-06 15:28:05','2013-12-06 15:28:05'),
	(30,8,14,1,'2013-12-06 15:29:25','2013-12-06 15:29:25'),
	(31,6,65,1,'2013-12-06 15:30:40','2013-12-06 15:30:40'),
	(32,7,74,1,'2013-12-06 15:31:49','2013-12-06 15:31:49'),
	(33,8,74,0,'2013-12-06 15:31:51','2013-12-06 15:31:51'),
	(34,7,73,0,'2013-12-06 15:33:52','2013-12-06 15:33:52'),
	(35,8,73,0,'2013-12-06 15:33:53','2013-12-06 15:33:53'),
	(39,5,57,1,'2013-12-06 15:36:53','2013-12-06 15:36:53'),
	(40,6,57,0,'2013-12-06 15:36:54','2013-12-06 15:36:54'),
	(41,9,85,1,'2013-12-10 17:40:42','2013-12-10 17:40:42'),
	(43,9,88,1,'2013-12-11 15:20:50','2013-12-11 15:20:50'),
	(44,10,88,1,'2013-12-11 15:21:03','2013-12-11 15:21:03');

/*!40000 ALTER TABLE `suggestion_votes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table suggestions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `suggestions`;

CREATE TABLE `suggestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `concept_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `votes` int(11) NOT NULL,
  `vote_tally` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `suggestions` WRITE;
/*!40000 ALTER TABLE `suggestions` DISABLE KEYS */;

INSERT INTO `suggestions` (`id`, `user_id`, `concept_id`, `description`, `votes`, `vote_tally`, `created_at`, `updated_at`)
VALUES
	(1,1,5,'Make it bigger!',0,'','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(2,1,5,'Can it be cheaper?',0,'','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(3,1,7,'Make it sturdier.',0,'','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(4,1,7,'Can it be used for painting.',0,'','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(5,13,14,'Nothing.',0,'','2013-12-06 15:18:23','2013-12-06 15:18:23'),
	(6,38,14,'change the colour of the dotted curve',0,'','2013-12-06 15:19:47','2013-12-06 15:19:47'),
	(7,64,12,'BRIGHT COLOR',0,'','2013-12-06 15:24:11','2013-12-06 15:24:11'),
	(8,14,12,'The \"my\" could be orange and would contrast well with the \"path\". Change it up from the two shades of green.',0,'','2013-12-06 15:29:25','2013-12-06 15:29:25'),
	(9,85,3,'I\'d make the cap green',0,'','2013-12-10 17:40:42','2013-12-10 17:40:42'),
	(10,88,3,'Make the bottle easier to hold',0,'','2013-12-11 15:21:03','2013-12-11 15:21:03');

/*!40000 ALTER TABLE `suggestions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table surveys
# ------------------------------------------------------------

DROP TABLE IF EXISTS `surveys`;

CREATE TABLE `surveys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quota` int(11) NOT NULL DEFAULT '100',
  `completes` int(11) NOT NULL DEFAULT '0',
  `displayed_categories` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `required_categories` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `acceptable_categories` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unique_param` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `other_params` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `votingType` text COLLATE utf8_unicode_ci NOT NULL,
  `study_type` text COLLATE utf8_unicode_ci NOT NULL,
  `page_order` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `background_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `surveys` WRITE;
/*!40000 ALTER TABLE `surveys` DISABLE KEYS */;

INSERT INTO `surveys` (`id`, `name`, `quota`, `completes`, `displayed_categories`, `required_categories`, `acceptable_categories`, `unique_param`, `other_params`, `votingType`, `study_type`, `page_order`, `created_at`, `updated_at`, `background_image`)
VALUES
	(1,'gardening is the greatest',100,0,'[1,2,3,4,5,6,7,8,9,10]','[1,3,5]','[]','u','[\"ftouch\",\"randomparam\"]','best','default','[]','2013-12-03 16:31:24','2013-12-03 16:31:24',NULL),
	(2,'politics is political',100,0,'[1,2,3,4,5,6,7,8,9,10]','[1,2,3]','[]','u','','best','default','[]','2013-12-03 16:31:24','2013-12-03 16:31:24',NULL),
	(3,'Laundry Survey',100,11,'[1,2,3,4,5,6,7,8]','[2]','[]','u','[]','best','default','[\"intro\",\"categories\",\"agreement\",\"background\",\"instructions\",\"concept\",\"buy\",\"best_concept\",\"worst_concept\",\"suggestions\",\"demographics\",\"finish\"]','2013-12-03 16:31:24','2013-12-03 16:31:24',NULL),
	(4,'Sapient',100,32,'[9,10,11,12,13,14,15,16]','[11]','[]','u','[]','best','default','[\"mechanicalturk\",\"intro\",\"categories\",\"background\",\"agreement\",\"instructions\",\"concept\",\"buy\",\"best_concept\",\"worst_concept\",\"suggestions\",\"demographics\",\"followup\",\"finish\"]','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL),
	(5,'Sapient2',100,5,'[9,10,11,12,13,14,15,16]','[11]','[]','u','[]','','default','[\"mechanicalturk\",\"intro\",\"categories\",\"background\",\"agreement\",\"instructions\",\"concept\",\"buy\",\"best_concept\",\"worst_concept\",\"suggestions\",\"demographics\",\"followup\",\"followup1a\",\"followup2\",\"followup2a\",\"followup3\",\"finish\"]','0000-00-00 00:00:00','0000-00-00 00:00:00','');

/*!40000 ALTER TABLE `surveys` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table target_demographic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `target_demographic`;

CREATE TABLE `target_demographic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `age` int(11) NOT NULL,
  `range` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `male` tinyint(1) NOT NULL,
  `female` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templates`;

CREATE TABLE `templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `original` tinyint(1) NOT NULL,
  `template` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;

INSERT INTO `templates` (`id`, `name`, `locale`, `original`, `template`, `created_at`, `updated_at`)
VALUES
	(1,'agreement','en',1,'','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(2,'background','en',1,'','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(3,'best_concept','en',1,'','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(4,'buy','en',1,'','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(5,'categories','en',1,'','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(6,'category_fail','en',1,'','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(7,'concept','en',1,'','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(8,'demographics','en',1,'','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(9,'finish','en',1,'','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(10,'instructions','en',1,'','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(11,'intro','en',1,'','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(12,'suggestions','en',1,'','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(13,'worst_concept','en',1,'','2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(14,'thank_you_fail','en',1,'','2013-12-03 16:31:25','2013-12-03 16:31:25');

/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `survey_id` int(11) NOT NULL,
  `concept_order` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unique_param` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `other_params` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `haveBought` tinyint(1) NOT NULL DEFAULT '0',
  `termniated` tinyint(1) NOT NULL DEFAULT '0',
  `agreed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `first_name`, `last_name`, `password`, `survey_id`, `concept_order`, `unique_param`, `other_params`, `completed`, `haveBought`, `termniated`, `agreed`, `created_at`, `updated_at`)
VALUES
	(1,'pursual@gmail.com','Tony','Danza','$2y$08$Fs73GsbemAVHtyl03xoA1O1O6l04doCvewLoNIP3uqwTGAl1b22hm',0,NULL,'','',0,0,0,0,'2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(2,'peb7268@gmail.com','Paul','Barrick','$2y$08$y3EjfMRZFSt8eIzuAsbepuOKEDRmQqBA2OIM/t5A//HXJmpyB9cNW',0,NULL,'','',0,0,0,0,'2013-12-03 16:31:25','2013-12-03 16:31:25'),
	(4,NULL,NULL,NULL,NULL,4,'[12,13,14]','8635835','{\"mtid\":\"TEST\"}',0,0,0,0,'2013-12-06 14:59:46','2013-12-06 14:59:58'),
	(5,NULL,NULL,NULL,NULL,4,'[12,13,14]','1026021','[]',0,0,0,0,'2013-12-06 15:10:03','2013-12-06 15:10:03'),
	(6,NULL,NULL,NULL,NULL,4,'[12,13,14]','8919119','{\"mtid\":\"A1G7CIQUDEPGEO\"}',1,1,0,1,'2013-12-06 15:12:11','2013-12-06 15:17:41'),
	(7,NULL,NULL,NULL,NULL,4,'[12,14,13]','1778695','{\"mtid\":\"A7R7KJDX64U61\"}',1,1,0,1,'2013-12-06 15:12:14','2013-12-06 15:15:42'),
	(8,NULL,NULL,NULL,NULL,4,'[14,12,13]','1847398','{\"mtid\":\"AHH59H2CPMBWV\"}',0,0,0,0,'2013-12-06 15:12:16','2013-12-06 15:12:33'),
	(9,NULL,NULL,NULL,NULL,4,'[12,13,14]','5615658','{\"mtid\":\"A6JKKANO7F4KD\"}',0,0,1,0,'2013-12-06 15:12:19','2013-12-06 15:13:24'),
	(10,NULL,NULL,NULL,NULL,4,NULL,'1760710','[]',0,0,0,0,'2013-12-06 15:12:19','2013-12-06 15:12:19'),
	(11,NULL,NULL,NULL,NULL,4,'[13,12,14]','7412132','{\"mtid\":\"AZBM5GUEV7N77\"}',1,1,0,1,'2013-12-06 15:12:30','2013-12-06 15:24:19'),
	(12,NULL,NULL,NULL,NULL,4,'[12,13,14]','4937041','[]',0,0,0,0,'2013-12-06 15:12:36','2013-12-06 15:12:36'),
	(13,NULL,NULL,NULL,NULL,4,'[12,14,13]','7726861','{\"mtid\":\"A1VR0MYJJQ1G5Y\"}',1,1,0,1,'2013-12-06 15:12:38','2013-12-06 15:18:49'),
	(14,NULL,NULL,NULL,NULL,4,'[13,14,12]','4106594','{\"mtid\":\"A188ZZIEW2E5U4\"}',1,1,0,1,'2013-12-06 15:12:43','2013-12-06 15:29:43'),
	(15,NULL,NULL,NULL,NULL,4,'[12,13,14]','4304751','{\"mtid\":\"A19P28OVWF54XB\"}',1,1,0,1,'2013-12-06 15:12:44','2013-12-06 15:26:50'),
	(16,NULL,NULL,NULL,NULL,4,NULL,'9596435','[]',0,0,0,0,'2013-12-06 15:12:45','2013-12-06 15:12:45'),
	(17,NULL,NULL,NULL,NULL,4,NULL,'8902101','[]',0,0,0,0,'2013-12-06 15:12:45','2013-12-06 15:12:45'),
	(18,NULL,NULL,NULL,NULL,4,NULL,'9362698','[]',0,0,0,0,'2013-12-06 15:12:46','2013-12-06 15:12:46'),
	(19,NULL,NULL,NULL,NULL,4,'[13,12,14]','1569034','{\"mtid\":\"ADJ9I7ZBFYFH7\"}',1,1,0,1,'2013-12-06 15:12:51','2013-12-06 15:21:05'),
	(20,NULL,NULL,NULL,NULL,4,'[13,14,12]','9581587','{\"mtid\":\"ASQWF9CJ1ZWFL\"}',1,1,0,1,'2013-12-06 15:12:53','2013-12-06 15:19:34'),
	(21,NULL,NULL,NULL,NULL,4,'[13,14,12]','8968562','{\"mtid\":\"A1YJKLVJW1FE33\"}',0,0,1,0,'2013-12-06 15:12:54','2013-12-06 15:14:29'),
	(22,NULL,NULL,NULL,NULL,4,'[12,14,13]','9213766','{\"mtid\":\"A21XD6CWE1JNMQ\"}',1,1,0,1,'2013-12-06 15:12:55','2013-12-06 15:16:22'),
	(23,NULL,NULL,NULL,NULL,4,NULL,'3298556','[]',0,0,0,0,'2013-12-06 15:12:59','2013-12-06 15:12:59'),
	(24,NULL,NULL,NULL,NULL,4,'[12,14,13]','7799212','{\"mtid\":\"A1A9MUU7XM4LHX\"}',1,1,0,1,'2013-12-06 15:13:07','2013-12-06 15:26:47'),
	(25,NULL,NULL,NULL,NULL,4,'[13,14,12]','1222917','{\"mtid\":\"A71Y5ICXKEMJL\"}',1,1,0,1,'2013-12-06 15:13:15','2013-12-06 15:23:12'),
	(26,NULL,NULL,NULL,NULL,4,'[13,12,14]','8893164','{\"mtid\":\"A37FR57D4F0Q87\"}',0,0,0,0,'2013-12-06 15:13:16','2013-12-06 15:13:30'),
	(27,NULL,NULL,NULL,NULL,4,'[14,13,12]','4811270','{\"mtid\":\"AFUUPNBIKHRFZ\"}',0,0,1,0,'2013-12-06 15:13:17','2013-12-06 15:15:43'),
	(28,NULL,NULL,NULL,NULL,4,'[13,12,14]','7806867','{\"mtid\":\"ALLRDNLLV5MTY\"}',1,1,0,1,'2013-12-06 15:13:20','2013-12-06 15:25:15'),
	(29,NULL,NULL,NULL,NULL,4,NULL,'1070770','[]',0,0,0,0,'2013-12-06 15:13:21','2013-12-06 15:13:21'),
	(30,NULL,NULL,NULL,NULL,4,'[13,12,14]','3980503','{\"mtid\":\" A13S7M2Z6N4KPW\"}',0,0,1,0,'2013-12-06 15:13:21','2013-12-06 15:16:00'),
	(31,NULL,NULL,NULL,NULL,4,NULL,'6889876','[]',0,0,0,0,'2013-12-06 15:13:26','2013-12-06 15:13:26'),
	(32,NULL,NULL,NULL,NULL,4,NULL,'3674552','[]',0,0,0,0,'2013-12-06 15:13:29','2013-12-06 15:13:29'),
	(33,NULL,NULL,NULL,NULL,4,'[12,14,13]','5848752','{\"mtid\":\"A1UTBDKOQ2MKUD\"}',1,1,0,1,'2013-12-06 15:13:30','2013-12-06 15:18:44'),
	(34,NULL,NULL,NULL,NULL,4,NULL,'9023034','[]',0,0,0,0,'2013-12-06 15:13:31','2013-12-06 15:13:31'),
	(35,NULL,NULL,NULL,NULL,4,'[12,14,13]','3472516','{\"mtid\":\"A1IQZMAPFSP9S0\"}',1,1,0,1,'2013-12-06 15:13:33','2013-12-06 15:23:40'),
	(36,NULL,NULL,NULL,NULL,4,'[13,14,12]','6377585','{\"mtid\":\"A2E3TO92MCQ9XU\"}',1,1,0,1,'2013-12-06 15:13:35','2013-12-06 15:18:16'),
	(37,NULL,NULL,NULL,NULL,4,'[13,14,12]','7363491','{\"mtid\":\"AHOA0NDN9TK2W\"}',0,0,1,0,'2013-12-06 15:13:37','2013-12-06 15:18:16'),
	(38,NULL,NULL,NULL,NULL,4,'[14,12,13]','1691833','{\"mtid\":\"A3V7PZKF0VJS4R\"}',1,1,0,1,'2013-12-06 15:13:39','2013-12-06 15:20:10'),
	(39,NULL,NULL,NULL,NULL,4,'[14,13,12]','8550589','{\"mtid\":\"AR218VDZDV9L7\"}',1,1,0,1,'2013-12-06 15:13:45','2013-12-06 15:21:28'),
	(40,NULL,NULL,NULL,NULL,4,'[12,13,14]','9133330','{\"mtid\":\"A1QOPE5YZYWKHE\"}',1,1,0,1,'2013-12-06 15:13:54','2013-12-06 15:22:58'),
	(41,NULL,NULL,NULL,NULL,4,NULL,'9108474','[]',0,0,0,0,'2013-12-06 15:13:54','2013-12-06 15:13:54'),
	(42,NULL,NULL,NULL,NULL,4,NULL,'4326997','[]',0,0,0,0,'2013-12-06 15:13:54','2013-12-06 15:13:54'),
	(43,NULL,NULL,NULL,NULL,4,'[14,13,12]','4680940','{\"mtid\":\"A7SJJTVRXJTV\"}',0,0,0,1,'2013-12-06 15:13:56','2013-12-06 15:15:08'),
	(44,NULL,NULL,NULL,NULL,4,'[14,12,13]','1834283','[]',0,0,0,0,'2013-12-06 15:14:19','2013-12-06 15:14:19'),
	(45,NULL,NULL,NULL,NULL,4,'[14,12,13]','2530560','{\"mtid\":\"A1RC2PD0YJFCU8\"}',0,0,1,0,'2013-12-06 15:14:22','2013-12-06 15:15:27'),
	(46,NULL,NULL,NULL,NULL,4,NULL,'4520276','[]',0,0,0,0,'2013-12-06 15:14:25','2013-12-06 15:14:25'),
	(47,NULL,NULL,NULL,NULL,4,NULL,'8965000','[]',0,0,0,0,'2013-12-06 15:14:37','2013-12-06 15:14:37'),
	(48,NULL,NULL,NULL,NULL,4,'[14,12,13]','2091982','{\"mtid\":\"A2B8HPIZDKYKDR\"}',1,1,0,1,'2013-12-06 15:14:50','2013-12-06 15:25:27'),
	(49,NULL,NULL,NULL,NULL,4,'[14,13,12]','5054585','[]',0,0,0,0,'2013-12-06 15:14:58','2013-12-06 15:14:58'),
	(50,NULL,NULL,NULL,NULL,4,'[12,14,13]','3541713','{\"mtid\":\"A2STG331R3P3FK\"}',0,0,0,0,'2013-12-06 15:15:17','2013-12-06 15:15:46'),
	(51,NULL,NULL,NULL,NULL,4,NULL,'3019858','[]',0,0,0,0,'2013-12-06 15:15:21','2013-12-06 15:15:21'),
	(52,NULL,NULL,NULL,NULL,4,NULL,'5227683','[]',0,0,0,0,'2013-12-06 15:15:33','2013-12-06 15:15:33'),
	(53,NULL,NULL,NULL,NULL,4,NULL,'8523301','[]',0,0,0,0,'2013-12-06 15:15:50','2013-12-06 15:15:50'),
	(54,NULL,NULL,NULL,NULL,4,'[14,12,13]','4245479','{\"mtid\":\"AFUUPNBIKHRFZ\"}',0,0,1,0,'2013-12-06 15:16:07','2013-12-06 15:16:32'),
	(55,NULL,NULL,NULL,NULL,4,'[14,12,13]','2331109','{\"mtid\":\" A13S7M2Z6N4KPW\"}',0,0,1,0,'2013-12-06 15:16:24','2013-12-06 15:17:12'),
	(56,NULL,NULL,NULL,NULL,4,'[14,13,12]','5039524','{\"mtid\":\"AFUUPNBIKHRFZ\"}',1,1,0,1,'2013-12-06 15:16:42','2013-12-06 15:26:06'),
	(57,NULL,NULL,NULL,NULL,4,'[14,13,12]','8790930','{\"mtid\":\"A2HHKBW8HQWI66\"}',1,1,0,1,'2013-12-06 15:17:02','2013-12-06 15:37:02'),
	(58,NULL,NULL,NULL,NULL,4,NULL,'7263060','[]',0,0,0,0,'2013-12-06 15:17:11','2013-12-06 15:17:11'),
	(59,NULL,NULL,NULL,NULL,4,'[12,13,14]','1726341','{\"mtid\":\"A34DWBBWZRLO1X\"}',1,1,0,1,'2013-12-06 15:17:22','2013-12-06 15:24:45'),
	(60,NULL,NULL,NULL,NULL,4,'[14,13,12]','4143860','{\"mtid\":\"A2E593S4Y9C3Z6\"}',1,1,0,1,'2013-12-06 15:17:36','2013-12-06 15:23:16'),
	(61,NULL,NULL,NULL,NULL,4,'[12,14,13]','8956800','{\"mtid\":\"APBXL9N9RF18V\"}',0,0,0,0,'2013-12-06 15:17:57','2013-12-06 15:18:04'),
	(62,NULL,NULL,NULL,NULL,4,'[13,12,14]','6807166','{\"mtid\":\"A3GMA5G92AGWJW\"}',0,0,1,0,'2013-12-06 15:18:08','2013-12-06 15:19:28'),
	(63,NULL,NULL,NULL,NULL,4,'[12,13,14]','5618068','{\"mtid\":\"A5DTMMW81L4N5\"}',1,1,0,1,'2013-12-06 15:18:09','2013-12-06 15:28:04'),
	(64,NULL,NULL,NULL,NULL,4,'[13,12,14]','7466458','{\"mtid\":\"AHOA0NDN9TK2W\"}',1,1,0,1,'2013-12-06 15:18:29','2013-12-06 15:24:47'),
	(65,NULL,NULL,NULL,NULL,4,'[13,12,14]','9837186','{\"mtid\":\"A33KTU8KJ5CP2T\"}',1,1,0,1,'2013-12-06 15:18:57','2013-12-06 15:34:49'),
	(66,NULL,NULL,NULL,NULL,4,'[13,12,14]','5166141','{\"mtid\":\"A28I79QOYVQOFG\"}',0,0,1,0,'2013-12-06 15:19:26','2013-12-06 15:20:07'),
	(67,NULL,NULL,NULL,NULL,4,'[12,13,14]','8720639','[]',0,0,0,0,'2013-12-06 15:19:35','2013-12-06 15:19:35'),
	(68,NULL,NULL,NULL,NULL,4,NULL,'6199062','[]',0,0,0,0,'2013-12-06 15:21:57','2013-12-06 15:21:57'),
	(69,NULL,NULL,NULL,NULL,4,'[13,14,12]','6114641','{\"mtid\":\"A1HK7CR71C8BCA\"}',0,0,1,0,'2013-12-06 15:22:38','2013-12-06 15:24:35'),
	(70,NULL,NULL,NULL,NULL,4,'[12,13,14]','3554938','{\"mtid\":\"A12FLH397SU1KI\"}',1,1,0,1,'2013-12-06 15:22:47','2013-12-06 15:26:49'),
	(71,NULL,NULL,NULL,NULL,4,'[12,13,14]','3160810','{\"mtid\":\"A14ATQ0J5B0VOX\"}',0,0,1,0,'2013-12-06 15:24:56','2013-12-06 15:26:31'),
	(72,NULL,NULL,NULL,NULL,4,'[14,12,13]','1192923','{\"mtid\":\"A1SZWGFNS2IJUP\"}',1,1,0,1,'2013-12-06 15:25:00','2013-12-06 15:30:23'),
	(73,NULL,NULL,NULL,NULL,4,'[13,12,14]','1582447','{\"mtid\":\"A2L8PCBX21Y9W8\"}',1,1,0,1,'2013-12-06 15:25:03','2013-12-06 15:34:11'),
	(74,NULL,NULL,NULL,NULL,4,'[13,12,14]','4544557','{\"mtid\":\"A26NBIMTE4L16C\"}',1,1,0,1,'2013-12-06 15:25:11','2013-12-06 15:33:17'),
	(75,NULL,NULL,NULL,NULL,4,'[12,13,14]','8942784','{\"mtid\":\"A28N96WLXXZXZ2\"}',1,1,0,1,'2013-12-06 15:27:57','2013-12-06 15:38:22'),
	(76,NULL,NULL,NULL,NULL,4,NULL,'7030710','[]',0,0,0,0,'2013-12-06 15:46:54','2013-12-06 15:46:54'),
	(77,NULL,NULL,NULL,NULL,4,NULL,'5539558','[]',0,0,0,0,'2013-12-06 15:47:15','2013-12-06 15:47:15'),
	(78,NULL,NULL,NULL,NULL,4,'[14,13,12]','2446549','{\"mtid\":\"A34FJBQDKVH8SR\"}',1,1,0,1,'2013-12-06 15:48:08','2013-12-06 15:54:46'),
	(79,NULL,NULL,NULL,NULL,4,'[13,14,12]','1297141','{\"mtid\":\"TESTING\"}',0,0,0,1,'2013-12-06 18:13:32','2013-12-06 18:13:53'),
	(80,NULL,NULL,NULL,NULL,4,'[12,14,13]','9024469','{\"mtid\":\"TESTING\"}',0,0,0,1,'2013-12-06 23:00:07','2013-12-06 23:01:21'),
	(81,NULL,NULL,NULL,NULL,4,'[14,12,13]','9985178','[]',0,0,0,0,'2013-12-09 18:00:43','2013-12-09 18:00:43'),
	(84,NULL,NULL,NULL,NULL,4,'[12,14,13]','8851756','[]',0,0,0,0,'2013-12-10 15:34:46','2013-12-10 15:34:46'),
	(85,NULL,NULL,NULL,NULL,3,'[4,2,3,5,1]','1735724','[]',1,1,0,1,'2013-12-10 17:01:38','2013-12-11 14:58:24'),
	(86,NULL,NULL,NULL,NULL,4,'[12,14,13]','1493315','[]',0,0,0,0,'2013-12-11 14:58:09','2013-12-11 14:58:09'),
	(87,NULL,NULL,NULL,NULL,3,'[3,5,4,1,2]','1409558','[]',0,0,0,0,'2013-12-11 14:58:37','2013-12-11 14:58:37'),
	(88,NULL,NULL,NULL,NULL,3,'[3,4,1,2,5]','6459125','[]',1,1,0,1,'2013-12-11 14:58:51','2013-12-11 15:22:29'),
	(89,NULL,NULL,NULL,NULL,3,'[1,3,4,2,5]','5469657','[]',0,1,0,1,'2013-12-11 14:58:57','2013-12-11 14:59:22'),
	(90,NULL,NULL,NULL,NULL,4,'[13,12,14]','00980987','[]',0,0,0,0,'2013-12-18 02:46:34','2013-12-18 02:46:34'),
	(91,NULL,NULL,NULL,NULL,3,'[4,1,2,5,3]','XXUNIQUEXX','[]',0,0,0,1,'2013-12-21 20:46:51','2014-01-03 14:56:24'),
	(92,NULL,NULL,NULL,NULL,4,'[13,14,12]','XXUNIQUEXX','{\"mtid\":\"1234\"}',0,0,0,0,'2013-12-26 16:50:23','2013-12-26 17:11:41'),
	(93,NULL,NULL,NULL,NULL,4,'[12,14,13]','2541234','[]',0,0,0,0,'2014-01-03 14:46:53','2014-01-03 14:46:53'),
	(94,NULL,NULL,NULL,NULL,3,'[2,4,3,5,1]','5864415','[]',0,0,0,0,'2014-01-03 14:47:27','2014-01-03 14:47:27'),
	(95,NULL,NULL,NULL,NULL,3,'[1,3,5,2,4]','6785906','[]',0,1,0,1,'2014-01-03 14:47:48','2014-01-03 14:50:55'),
	(96,NULL,NULL,NULL,NULL,3,'[3,5,4,2,1]','9935298','[]',0,0,0,0,'2014-01-03 15:16:23','2014-01-03 15:16:23'),
	(97,NULL,NULL,NULL,NULL,3,'[4,3,2,1,5]','6855182','[]',0,0,0,0,'2014-01-03 15:16:27','2014-01-03 15:16:27'),
	(98,NULL,NULL,NULL,NULL,3,'[5,4,1,3,2]','6108909','[]',0,0,0,0,'2014-01-03 15:16:40','2014-01-03 15:16:40'),
	(99,NULL,NULL,NULL,NULL,3,'[2,4,1,5,3]','7238107','[]',0,0,0,1,'2014-01-03 15:28:25','2014-01-03 15:28:42'),
	(100,NULL,NULL,NULL,NULL,3,'[4,2,5,3,1]','4276814','[]',0,0,0,1,'2014-01-03 15:30:26','2014-01-03 15:30:35'),
	(101,NULL,NULL,NULL,NULL,5,'[17,16,15]','XXUNIQUEXX','{\"mtid\":\"rasf\"}',1,1,0,1,'2014-01-08 20:23:05','2014-01-08 20:24:47'),
	(102,NULL,NULL,NULL,NULL,5,'[15,16,17]','asc','{\"mtid\":\"adcv\"}',1,1,0,1,'2014-01-08 20:26:31','2014-01-08 21:29:19');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
