-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2025 at 09:37 AM
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
-- Database: `kanban`
--

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `name`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `detail_descrip` varchar(500) NOT NULL,
  `create_date` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `completed_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `admin_id`, `name`, `description`, `detail_descrip`, `create_date`, `due_date`, `completed_date`) VALUES
(24, 20, 'kanban', 'yyyyyyyyyyyyyyy', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy', '2025-04-09 00:00:00', '2025-04-30 00:00:00', '0000-00-00 00:00:00'),
(25, 13, '1234567', 'jjjjjjjjjjjjjjjj', 'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj', '2025-04-09 00:00:00', '2025-04-30 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `project_members`
--

CREATE TABLE `project_members` (
  `id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `project_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_members`
--

INSERT INTO `project_members` (`id`, `user_id`, `project_id`) VALUES
(68, 3, 17),
(69, 5, 17),
(70, 4, 17),
(71, 7, 17),
(72, 8, 17),
(73, 2, 17),
(74, 2, 18),
(75, 4, 18),
(76, 5, 18),
(77, 3, 18),
(78, 6, 18),
(79, 7, 18),
(80, 3, 19),
(81, 4, 19),
(82, 5, 19),
(83, 6, 19),
(84, 2, 19),
(85, 7, 19),
(102, 1, 24),
(103, 13, 24),
(104, 14, 24),
(105, 12, 25),
(106, 15, 25),
(107, 14, 25);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Member');

-- --------------------------------------------------------

--
-- Table structure for table `stages`
--

CREATE TABLE `stages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stages`
--

INSERT INTO `stages` (`id`, `name`, `project_id`) VALUES
(22, 'Planning', 17),
(23, 'Doing', 17),
(24, 'Done', 17),
(25, 'Doing', 18),
(26, 'Done', 18),
(27, 'Planning', 18),
(28, 'Doing', 19),
(29, 'Planning', 19),
(30, 'Done', 19),
(43, 'Planning', 24),
(44, 'Doing', 24),
(45, 'Done', 24),
(46, 'Doing', 25),
(47, 'Planning', 25),
(48, 'Done', 25);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(100) NOT NULL,
  `project_id` int(100) NOT NULL,
  `stage_id` int(100) NOT NULL,
  `short_description` varchar(250) NOT NULL,
  `task_name` varchar(50) NOT NULL,
  `task_priority_color` varchar(100) NOT NULL,
  `task_priority_border` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks_history`
--

CREATE TABLE `tasks_history` (
  `id` int(100) NOT NULL,
  `task_id` int(100) NOT NULL,
  `project_id` int(100) NOT NULL,
  `details` varchar(250) NOT NULL,
  `user_id` int(100) NOT NULL,
  `changed_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_members`
--

CREATE TABLE `task_members` (
  `id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `task_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task_members`
--

INSERT INTO `task_members` (`id`, `user_id`, `task_id`) VALUES
(31, 18, 20),
(32, 16, 20),
(33, 15, 20);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `img` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `role_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `img`, `name`, `email`, `password`, `gender_id`, `role_id`) VALUES
(1, 'IMG-1.jpg', 'Aung Min Khant', 'sarsuke2007@gmail.com', '123', 1, 1),
(12, 'IMG-12.jpg', 'Pyae Phyo Paing', 'PPP@gmail.com', '101', 1, 2),
(14, 'IMG-14.jpg', 'Yoon Mi Mi Hlaing', 'yoonmimihlaing000@gmail.com', '103', 2, 2),
(15, 'IMG-15.jpg', 'Ei Thinzar Lwin', 'eithinzarlwin17@gmail.com', '104', 2, 2),
(16, 'IMG-16.jpg', 'Su Myat', 'sumyataung0206@gmail.com', '105', 2, 2),
(17, 'IMG-17.jpg', 'May', 'deeaugust109@gmail.com', '106', 2, 2),
(18, 'IMG-18.jpg', 'Saung', 'saung@gmail.com', '107', 2, 2),
(19, 'IMG-19.jpg', 'Hnin', 'Hninn@gmail.com', '108', 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_members`
--
ALTER TABLE `project_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stages`
--
ALTER TABLE `stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks_history`
--
ALTER TABLE `tasks_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_members`
--
ALTER TABLE `task_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `project_members`
--
ALTER TABLE `project_members`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stages`
--
ALTER TABLE `stages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tasks_history`
--
ALTER TABLE `tasks_history`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `task_members`
--
ALTER TABLE `task_members`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
