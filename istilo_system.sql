-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2026 at 03:24 PM
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
-- Database: `istilo_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_invoices`
--

CREATE TABLE `admin_invoices` (
  `invoice_id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `customer_address` varchar(50) NOT NULL,
  `landmarks` varchar(100) DEFAULT NULL,
  `services` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` varchar(50) NOT NULL,
  `completion_date` date NOT NULL,
  `notes` text DEFAULT NULL,
  `file` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_invoices`
--

INSERT INTO `admin_invoices` (`invoice_id`, `customer_name`, `contact_number`, `customer_address`, `landmarks`, `services`, `quantity`, `price`, `completion_date`, `notes`, `file`) VALUES
(2, 'Zedrick', '12352324', 'Roxaco', 'Work', 'asdasdsa', 20, '15000', '2026-11-21', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `completed_for_shipping`
--

CREATE TABLE `completed_for_shipping` (
  `jo_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `completed_for_shipping`
--

INSERT INTO `completed_for_shipping` (`jo_id`, `invoice_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `customer_address` varchar(50) NOT NULL,
  `landmarks` varchar(100) DEFAULT NULL,
  `services` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` varchar(50) NOT NULL,
  `completion_date` date NOT NULL,
  `notes` text DEFAULT NULL,
  `file` longblob NOT NULL,
  `pass_admin` varchar(20) NOT NULL,
  `pass_layout` varchar(20) NOT NULL,
  `pass_production` varchar(20) NOT NULL,
  `pass_qa` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`invoice_id`, `customer_name`, `contact_number`, `customer_address`, `landmarks`, `services`, `quantity`, `price`, `completion_date`, `notes`, `file`, `pass_admin`, `pass_layout`, `pass_production`, `pass_qa`) VALUES
(1, 'Zedrick', '1234567890', 'Roxaco', 'Near Court', 'Shirting Printing', 50, '15000', '2026-11-30', '', 0x39616263333861333932353932646638343761323334343665626238356137622e6a7067, 'PASS', 'PASS', 'PASS', 'PASS'),
(2, 'Zedrick', '12352324', 'Roxaco', 'Work', 'asdasdsa', 20, '15000', '2026-11-21', '', '', 'PASS', '', '', 'PASS');

-- --------------------------------------------------------

--
-- Table structure for table `layout_artist_incoming`
--

CREATE TABLE `layout_artist_incoming` (
  `layout_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `layout_artist_work`
--

CREATE TABLE `layout_artist_work` (
  `layout_work_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `layout_materials_holder`
--

CREATE TABLE `layout_materials_holder` (
  `materials_id` int(11) NOT NULL,
  `material` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `production_attendance`
--

CREATE TABLE `production_attendance` (
  `attenfance_id` int(11) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `task` text NOT NULL,
  `time_int` timestamp NULL DEFAULT NULL,
  `time_out` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `production_attendance`
--

INSERT INTO `production_attendance` (`attenfance_id`, `emp_name`, `task`, `time_int`, `time_out`) VALUES
(2, 'Zedrick', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `production_incoming`
--

CREATE TABLE `production_incoming` (
  `production_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `file` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `production_work`
--

CREATE TABLE `production_work` (
  `production_work_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `work_file` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qa_incoming`
--

CREATE TABLE `qa_incoming` (
  `qa_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qa_work`
--

CREATE TABLE `qa_work` (
  `qa_work_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `role` varchar(20) NOT NULL,
  `department` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `encrypted_password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `role`, `department`, `fullname`, `username`, `encrypted_password`, `created_at`) VALUES
(2, 'layout', '', 'Zedrick V. Rol', 'rolz@gmail.com', '$2y$10$ZtIRfEYd389DirY3hVx61OR6QpZfNu1gH/j.kdaizw3OwOYlPzENW', '2026-11-09 14:15:11'),
(4, 'admin', '', 'admin', 'admin@gmail.com', '$2y$10$O6ZNXWiwHWy4HiAQJJhSleTPcpCRUItswpWzLmwOrj4ODFlwqEm9G', '2026-11-11 16:33:14'),
(5, 'layout', '', 'layout', 'layout@gmail.com', '$2y$10$C7VNvtu4Cswq5fgET.QWEeOVU4/iJVswCvclDPDERS5XrKeumZcWS', '2026-11-11 16:33:30'),
(6, 'production', '', 'production', 'production@gmail.com', '$2y$10$ohj9k2ViL2z3Bin2EDGMEeZfJ0/Tm/YFLsF7tEiU2aWqu01orZ1zi', '2026-11-11 16:33:58'),
(7, 'qa', '', 'qa', 'qa@gmail.com', '$2y$10$XAiNIrZALdtbNM9eQtcJC.jC23Aw38mCx0KAS37JZ6HiAt4oikEUa', '2026-11-11 16:34:14'),
(8, 'owner', '', 'zedrick', 'zedrick@gmail.com', '$2y$10$BZM2yqU7MEkFG.WLI46lHexS7KOYw3NuDQDIor4OMe3C2A9LNs8yq', '2026-11-15 16:17:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_invoices`
--
ALTER TABLE `admin_invoices`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `completed_for_shipping`
--
ALTER TABLE `completed_for_shipping`
  ADD PRIMARY KEY (`jo_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `layout_artist_incoming`
--
ALTER TABLE `layout_artist_incoming`
  ADD PRIMARY KEY (`layout_id`);

--
-- Indexes for table `layout_artist_work`
--
ALTER TABLE `layout_artist_work`
  ADD PRIMARY KEY (`layout_work_id`);

--
-- Indexes for table `layout_materials_holder`
--
ALTER TABLE `layout_materials_holder`
  ADD PRIMARY KEY (`materials_id`);

--
-- Indexes for table `production_attendance`
--
ALTER TABLE `production_attendance`
  ADD PRIMARY KEY (`attenfance_id`);

--
-- Indexes for table `production_incoming`
--
ALTER TABLE `production_incoming`
  ADD PRIMARY KEY (`production_id`);

--
-- Indexes for table `production_work`
--
ALTER TABLE `production_work`
  ADD PRIMARY KEY (`production_work_id`);

--
-- Indexes for table `qa_incoming`
--
ALTER TABLE `qa_incoming`
  ADD PRIMARY KEY (`qa_id`);

--
-- Indexes for table `qa_work`
--
ALTER TABLE `qa_work`
  ADD PRIMARY KEY (`qa_work_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_invoices`
--
ALTER TABLE `admin_invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `completed_for_shipping`
--
ALTER TABLE `completed_for_shipping`
  MODIFY `jo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `layout_artist_incoming`
--
ALTER TABLE `layout_artist_incoming`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `layout_artist_work`
--
ALTER TABLE `layout_artist_work`
  MODIFY `layout_work_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `layout_materials_holder`
--
ALTER TABLE `layout_materials_holder`
  MODIFY `materials_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `production_attendance`
--
ALTER TABLE `production_attendance`
  MODIFY `attenfance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `production_incoming`
--
ALTER TABLE `production_incoming`
  MODIFY `production_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `production_work`
--
ALTER TABLE `production_work`
  MODIFY `production_work_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qa_incoming`
--
ALTER TABLE `qa_incoming`
  MODIFY `qa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qa_work`
--
ALTER TABLE `qa_work`
  MODIFY `qa_work_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
