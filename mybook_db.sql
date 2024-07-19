-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2024 at 11:32 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mybook_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `content_i_follow`
--

CREATE TABLE `content_i_follow` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `contentid` bigint(20) NOT NULL,
  `content_type` varchar(10) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_invites`
--

CREATE TABLE `group_invites` (
  `id` bigint(20) NOT NULL,
  `groupid` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `inviter` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `groupid` bigint(20) NOT NULL,
  `role` varchar(9) NOT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_requests`
--

CREATE TABLE `group_requests` (
  `id` bigint(20) NOT NULL,
  `groupid` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) NOT NULL,
  `type` varchar(10) NOT NULL,
  `likes` text NOT NULL,
  `contentid` bigint(20) NOT NULL,
  `following` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `type`, `likes`, `contentid`, `following`) VALUES
(19, 'user', '[{\"userid\":\"81963294186925702\",\"date\":\"2024-07-16 15:23:27\"},{\"userid\":\"26125592363520280\",\"date\":\"2024-07-17 10:44:15\"},{\"userid\":\"10687491\",\"date\":\"2024-07-17 10:48:16\"}]', 26125592363520280, ''),
(20, 'user', '', 81963294186925702, '[{\"userid\":\"26125592363520280\",\"date\":\"2024-07-16 15:23:27\"}]'),
(21, 'post', '[{\"userid\":\"81963294186925702\",\"date\":\"2024-07-16 15:24:20\"},{\"userid\":\"26125592363520280\",\"date\":\"2024-07-17 11:09:36\"}]', 232838690, ''),
(22, 'user', '[{\"userid\":\"26125592363520280\",\"date\":\"2024-07-17 10:46:26\"}]', 3480419398014359, ''),
(23, 'user', '[{\"userid\":\"26125592363520280\",\"date\":\"2024-07-17 11:09:05\"}]', 10687491, ''),
(24, 'user', '', 26125592363520280, '[{\"userid\":\"10687491\",\"date\":\"2024-07-17 11:08:44\"}]'),
(25, 'user', '', 26125592363520280, '[{\"userid\":\"10687491\",\"date\":\"2024-07-17 11:08:47\"}]'),
(26, 'user', '', 26125592363520280, '[{\"userid\":\"10687491\",\"date\":\"2024-07-17 11:08:49\"}]'),
(27, 'user', '', 26125592363520280, '[{\"userid\":\"10687491\",\"date\":\"2024-07-17 11:08:57\"}]'),
(28, 'user', '', 26125592363520280, '[{\"userid\":\"10687491\",\"date\":\"2024-07-17 11:08:59\"}]'),
(29, 'user', '', 26125592363520280, '[{\"userid\":\"10687491\",\"date\":\"2024-07-17 11:09:02\"}]'),
(30, 'user', '', 26125592363520280, '[{\"userid\":\"10687491\",\"date\":\"2024-07-17 11:09:05\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL,
  `msgid` varchar(60) NOT NULL,
  `sender` bigint(20) NOT NULL,
  `receiver` bigint(20) NOT NULL,
  `message` text DEFAULT NULL,
  `file` varchar(500) DEFAULT NULL,
  `received` tinyint(1) NOT NULL DEFAULT 0,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_sender` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_receiver` tinyint(1) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `tags` varchar(2048) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `activity` varchar(10) NOT NULL,
  `contentid` bigint(20) NOT NULL,
  `content_owner` bigint(20) NOT NULL,
  `content_type` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `userid`, `activity`, `contentid`, `content_owner`, `content_type`, `date`) VALUES
(48, 81963294186925702, 'follow', 26125592363520280, 26125592363520280, 'profile', '2024-07-16 15:23:27'),
(49, 81963294186925702, 'like', 232838690, 26125592363520280, 'post', '2024-07-16 15:24:20'),
(50, 26125592363520280, 'follow', 10687491, 10687491, 'profile', '2024-07-17 11:08:44'),
(51, 26125592363520280, 'follow', 10687491, 10687491, 'profile', '2024-07-17 11:08:47'),
(52, 26125592363520280, 'follow', 10687491, 10687491, 'profile', '2024-07-17 11:08:49'),
(53, 26125592363520280, 'follow', 10687491, 10687491, 'profile', '2024-07-17 11:08:57'),
(54, 26125592363520280, 'follow', 10687491, 10687491, 'profile', '2024-07-17 11:08:59'),
(55, 26125592363520280, 'follow', 10687491, 10687491, 'profile', '2024-07-17 11:09:02'),
(56, 26125592363520280, 'follow', 10687491, 10687491, 'profile', '2024-07-17 11:09:05'),
(57, 26125592363520280, 'like', 232838690, 26125592363520280, 'post', '2024-07-17 11:09:36');

-- --------------------------------------------------------

--
-- Table structure for table `notification_seen`
--

CREATE TABLE `notification_seen` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `notification_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notification_seen`
--

INSERT INTO `notification_seen` (`id`, `userid`, `notification_id`) VALUES
(30, 81963294186925702, 0),
(31, 10687491, 0),
(32, 26125592363520280, 0),
(33, 3480419398014359, 0);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL,
  `postid` bigint(20) NOT NULL,
  `post` text NOT NULL,
  `image` varchar(500) NOT NULL,
  `has_image` tinyint(1) NOT NULL,
  `is_profile_image` tinyint(1) NOT NULL,
  `is_cover_image` tinyint(1) NOT NULL,
  `parent` bigint(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `userid` bigint(20) NOT NULL,
  `owner` bigint(20) NOT NULL,
  `likes` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  `tags` varchar(2048) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `postid`, `post`, `image`, `has_image`, `is_profile_image`, `is_cover_image`, `parent`, `date`, `userid`, `owner`, `likes`, `comments`, `tags`) VALUES
(75, 6843952, '', 'uploads/3094953462558/UBsC4I8iE1EU4nM.jpg', 1, 0, 0, 0, '2024-07-13 18:58:27', 3094953462558, 0, 0, 0, '[]'),
(76, 4901190864035757185, '', 'uploads/3094953462558/wYSVHuvfQHscfN7.jpg', 1, 0, 0, 0, '2024-07-13 18:58:38', 3094953462558, 0, 0, 0, '[]'),
(77, 485190218992, '', 'uploads/3094953462558/P9McnNcI4gQAYdY.jpg', 1, 0, 0, 0, '2024-07-13 18:59:15', 3094953462558, 0, 0, 0, '[]'),
(78, 783609062, '', 'uploads/3094953462558/U5y2u0P3ZHie8iR.jpg', 1, 0, 0, 0, '2024-07-13 19:04:59', 3094953462558, 0, 0, 0, '[]'),
(79, 8131223863, '', 'uploads/3094953462558/DIscVKuQhOM546b.jpg', 1, 0, 0, 0, '2024-07-13 19:05:11', 3094953462558, 0, 0, 0, '[]'),
(80, 666031332245160, '', 'uploads/26125592363520280/dszbJX2KveIIw7E.jpg', 1, 1, 0, 0, '2024-07-16 19:46:45', 26125592363520280, 0, 0, 0, '[]'),
(81, 8018011383737686132, 'tutor dek', 'uploads/26125592363520280/fniMRV9eDZ5lZcE.jpg', 1, 0, 0, 0, '2024-07-16 19:53:35', 26125592363520280, 0, 0, 0, '[]'),
(83, 232838690, 'lagi galau nich', 'uploads/26125592363520280/0Zoo3XA6gAdud5M.jpg', 1, 0, 0, 0, '2024-07-16 20:11:16', 26125592363520280, 0, 2, 0, '[]'),
(84, 62218, 'halo', '', 0, 0, 0, 0, '2024-07-16 20:23:01', 81963294186925702, 0, 0, 0, '[]'),
(85, 511005473, 'he', '', 0, 0, 0, 0, '2024-07-16 20:23:41', 81963294186925702, 0, 0, 0, '[]'),
(86, 30991628056054552, '', 'uploads/499347061671835624/M9lxQZurpfygvr2.jpg', 1, 1, 0, 0, '2024-07-17 15:35:20', 499347061671835624, 0, 0, 0, '[]'),
(87, 8566539877, '', 'uploads/26125592363520280/OFq6Zc4kVrQUp1e.jpg', 1, 0, 1, 0, '2024-07-17 16:09:59', 26125592363520280, 0, 0, 0, '[]'),
(88, 9223372036854775807, 'Test', '', 0, 0, 0, 0, '2024-07-17 16:11:12', 3480419398014359, 47559049655397, 0, 0, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `owner` bigint(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `type` varchar(10) NOT NULL,
  `profile_image` varchar(500) NOT NULL,
  `cover_image` varchar(500) NOT NULL,
  `date` datetime NOT NULL,
  `online` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `url_address` varchar(100) NOT NULL,
  `likes` int(11) NOT NULL,
  `about` text NOT NULL,
  `tag_name` varchar(20) NOT NULL,
  `group_type` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userid`, `owner`, `first_name`, `last_name`, `gender`, `type`, `profile_image`, `cover_image`, `date`, `online`, `email`, `password`, `url_address`, `likes`, `about`, `tag_name`, `group_type`) VALUES
(16, 26125592363520280, 0, 'Tutor', 'Dek', 'Male', 'profile', 'uploads/26125592363520280/9o9Np7LMHE2vnsD.jpg', 'uploads/26125592363520280/OFq6Zc4kVrQUp1e.jpg', '2024-07-16 14:46:02', 1721208122, 'radityathabroniromadhon@gmail.com', '6ffc1de2e65fa88501e400706c38ca253e42d62f', 'tutor.dek', 3, '', 'tutordek', ''),
(17, 81963294186925702, 0, 'Santan', 'Kara', 'Female', 'profile', '', '', '2024-07-16 15:22:12', 1721137537, 'rizkalailatur@gmail.com', 'd0a35b672f43f82f58dc9c6d9d2994c9fda473b9', 'santan.kara', 0, '', 'santankara', ''),
(18, 499347061671835624, 0, 'Tes', 'Tes', 'Male', 'profile', 'uploads/499347061671835624/M9lxQZurpfygvr2.jpg', '', '2024-07-17 10:34:43', 1721205320, 'radityaarekruby@gmail.com', 'b83c9cf2a8de1ce9a57160f3214b29b5060b416f', 'tes.tes', 0, '', 'testes', ''),
(19, 3480419398014359, 0, 'Bayu', 'Bay', 'Male', 'profile', '', '', '2024-07-17 10:42:11', 1721207522, 'Test@gmail.com', '356a192b7913b04c54574d18c28d46e6395428ab', 'bayu.bay', 1, '', 'bayubay', ''),
(20, 10687491, 0, 'Faradisa', 'Fara', 'Female', 'profile', '', '', '2024-07-17 10:42:14', 1721206096, 'ainulfaradisa2020@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'faradisa.fara', 1, '', 'faradisafara', ''),
(21, 47559049655397, 26125592363520280, 'Tutor dekkkk', '', '', 'group', '', '', '2024-07-17 11:10:28', 0, '', '', 'tutor dekkkk.7013', 0, '', '', 'Public');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `content_i_follow`
--
ALTER TABLE `content_i_follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `contentid` (`contentid`),
  ADD KEY `disabled` (`disabled`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `group_invites`
--
ALTER TABLE `group_invites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupid` (`groupid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `disabled` (`disabled`),
  ADD KEY `inviter` (`inviter`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `groupid` (`groupid`),
  ADD KEY `disabled` (`disabled`),
  ADD KEY `role` (`role`);

--
-- Indexes for table `group_requests`
--
ALTER TABLE `group_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupid` (`groupid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `disabled` (`disabled`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `contentid` (`contentid`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `msgid` (`msgid`),
  ADD KEY `sender` (`sender`),
  ADD KEY `receiver` (`receiver`),
  ADD KEY `received` (`received`),
  ADD KEY `seen` (`seen`),
  ADD KEY `deleted_sender` (`deleted_sender`),
  ADD KEY `date` (`date`),
  ADD KEY `deleted_receiver` (`deleted_receiver`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `contentid` (`contentid`),
  ADD KEY `content_owner` (`content_owner`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `notification_seen`
--
ALTER TABLE `notification_seen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `notification_id` (`notification_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postid` (`postid`),
  ADD KEY `date` (`date`),
  ADD KEY `parent` (`parent`),
  ADD KEY `userid` (`userid`),
  ADD KEY `likes` (`likes`),
  ADD KEY `comments` (`comments`),
  ADD KEY `owner` (`owner`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `date` (`date`),
  ADD KEY `online` (`online`),
  ADD KEY `email` (`email`),
  ADD KEY `url_address` (`url_address`),
  ADD KEY `likes` (`likes`),
  ADD KEY `tag_name` (`tag_name`),
  ADD KEY `type` (`type`),
  ADD KEY `owner` (`owner`),
  ADD KEY `group_type` (`group_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `content_i_follow`
--
ALTER TABLE `content_i_follow`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `group_invites`
--
ALTER TABLE `group_invites`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `group_requests`
--
ALTER TABLE `group_requests`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `notification_seen`
--
ALTER TABLE `notification_seen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
