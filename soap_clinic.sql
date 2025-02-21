-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2025 at 04:14 PM
-- Server version: 8.0.36
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `soap_clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `age` int NOT NULL,
  `gender` enum('Male','Female','Other') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contact_info` varchar(100) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `last_visit` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `first_name`, `last_name`, `age`, `gender`, `contact_info`, `address`, `last_visit`, `created_at`) VALUES
(5, 'Juan JUNIOR', 'Dela Cruz', 35, 'Male', '092134567823232', '123 Rizal St., Manila', '2025-02-15', '2025-02-20 12:37:41'),
(6, 'Fidel', 'Reyes', 55, 'Male', '09058336240', 'Southville', '2025-02-21', '2025-02-21 14:25:44');

-- --------------------------------------------------------

--
-- Table structure for table `soap_notes`
--

CREATE TABLE `soap_notes` (
  `soap_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `symptoms` text NOT NULL,
  `medical_history` text NOT NULL,
  `blood_pressure` varchar(10) DEFAULT NULL,
  `heart_rate` int DEFAULT NULL,
  `physical_exam_notes` text,
  `diagnosis_summary` text,
  `treatment_plan` text,
  `follow_up_instructions` text,
  `appointment_date` datetime DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `soap_notes`
--

INSERT INTO `soap_notes` (`soap_id`, `patient_id`, `symptoms`, `medical_history`, `blood_pressure`, `heart_rate`, `physical_exam_notes`, `diagnosis_summary`, `treatment_plan`, `follow_up_instructions`, `appointment_date`, `file_path`, `created_at`) VALUES
(1, 5, 'Fever, cough, sore throat', 'Hypertension, diabetes', '130/85', 78, 'Slight fever, inflamed throat', 'Upper respiratory infection, mild dehydration', 'Prescribed antibiotics and hydration therapy', 'Return after one week for reassessment', '2025-02-23 20:20:00', 'uploads/Juan_JUNIOR_Dela_Cruz/', '2025-02-20 12:37:41'),
(2, 6, 'test', 'test', '130/85', 75, 'test', 'test', 'test', 'test', '2025-02-27 22:25:00', 'uploads/FidelReyes/ART-APP-PRELIM-REVIEWER.pdf', '2025-02-21 14:25:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `soap_notes`
--
ALTER TABLE `soap_notes`
  ADD PRIMARY KEY (`soap_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `soap_notes`
--
ALTER TABLE `soap_notes`
  MODIFY `soap_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `soap_notes`
--
ALTER TABLE `soap_notes`
  ADD CONSTRAINT `soap_notes_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
