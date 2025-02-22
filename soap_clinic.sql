-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2025 at 06:19 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

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
  `patient_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `contact_info` varchar(100) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `last_visit` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `first_name`, `last_name`, `age`, `gender`, `contact_info`, `address`, `last_visit`, `created_at`) VALUES
(5, 'Juan JUNIOR', 'Dela Cruz', 35, 'Male', '092134567823232', '123 Rizal St., Manila', '2025-02-15', '2025-02-20 12:37:41'),
(6, 'Fidel', 'Reyes', 55, 'Male', '09058336240', 'Southville', '2025-02-21', '2025-02-21 14:25:44'),
(7, 'John', 'Doe', 30, 'Male', '123-456-7890', '123 Main St, Cityville', '2024-01-10', '2025-02-22 05:09:42'),
(8, 'Jane', 'Smith', 25, 'Female', '987-654-3210', '456 Elm St, Townsville', '2024-02-15', '2025-02-22 05:09:42'),
(9, 'Alice', 'Johnson', 40, 'Female', '555-123-4567', '789 Oak St, Villageton', '2024-03-05', '2025-02-22 05:09:42'),
(10, 'Bob', 'Brown', 35, 'Male', '444-987-6543', '321 Pine St, Hamletown', '2024-01-22', '2025-02-22 05:09:42'),
(11, 'Charlie', 'Davis', 50, 'Male', '333-222-1111', '159 Birch St, Metropolis', '2024-02-28', '2025-02-22 05:09:42'),
(12, 'Emma', 'Wilson', 28, 'Female', '666-555-4444', '753 Cedar St, Countryside', '2024-01-18', '2025-02-22 05:09:42'),
(13, 'Liam', 'Miller', 45, 'Male', '777-888-9999', '852 Maple St, Downtown', '2024-03-10', '2025-02-22 05:09:42'),
(14, 'Olivia', 'Anderson', 32, 'Female', '999-000-1111', '951 Walnut St, Uptown', '2024-02-20', '2025-02-22 05:09:42'),
(15, 'Noah', 'Thomas', 38, 'Male', '888-777-6666', '357 Cherry St, Baytown', '2024-03-01', '2025-02-22 05:09:42'),
(16, 'Sophia', 'Martinez', 29, 'Female', '111-222-3333', '654 Spruce St, Lakeside', '2024-01-25', '2025-02-22 05:09:42');

-- --------------------------------------------------------

--
-- Table structure for table `soap_notes`
--

CREATE TABLE `soap_notes` (
  `soap_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `symptoms` text NOT NULL,
  `medical_history` text NOT NULL,
  `blood_pressure` varchar(10) DEFAULT NULL,
  `heart_rate` int(11) DEFAULT NULL,
  `physical_exam_notes` text DEFAULT NULL,
  `diagnosis_summary` text DEFAULT NULL,
  `treatment_plan` text DEFAULT NULL,
  `follow_up_instructions` text DEFAULT NULL,
  `appointment_date` datetime DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soap_notes`
--

INSERT INTO `soap_notes` (`soap_id`, `patient_id`, `symptoms`, `medical_history`, `blood_pressure`, `heart_rate`, `physical_exam_notes`, `diagnosis_summary`, `treatment_plan`, `follow_up_instructions`, `appointment_date`, `file_path`, `created_at`) VALUES
(1, 5, 'Fever, cough, sore throat', 'Hypertension, diabetes', '130/85', 78, 'Slight fever, inflamed throat', 'Upper respiratory infection, mild dehydration', 'Prescribed antibiotics and hydration therapy', 'Return after one week for reassessment', '2025-02-23 20:20:00', 'uploads/Juan_JUNIOR_Dela_Cruz/', '2025-02-20 12:37:41'),
(2, 6, 'test', 'test', '130/85', 75, 'test', 'test', 'test', 'test', '2025-02-27 22:25:00', 'uploads/FidelReyes/ART-APP-PRELIM-REVIEWER.pdf', '2025-02-21 14:25:44'),
(3, 7, 'Cough, fever', 'No chronic conditions', '120/80', 72, 'Lungs clear, no wheezing', 'Upper respiratory infection', 'Rest, fluids, paracetamol', 'Follow up in 1 week if no improvement', '2024-03-10 10:00:00', '/files/record1.pdf', '2025-02-22 05:18:05'),
(4, 8, 'Headache, dizziness', 'Migraines', '118/76', 68, 'Neurological exam normal', 'Migraine attack', 'Ibuprofen, rest in dark room', 'Keep a headache diary, follow up in 2 weeks', '2024-03-12 14:30:00', '/files/record2.pdf', '2025-02-22 05:18:05'),
(5, 9, 'Chest pain', 'Hypertension', '140/90', 80, 'Normal heart sounds, no murmurs', 'Mild angina', 'Aspirin, lifestyle modifications', 'Monitor BP daily, return in 1 month', '2024-03-15 09:00:00', '/files/record3.pdf', '2025-02-22 05:18:05'),
(6, 10, 'Back pain', 'History of muscle strain', '122/78', 75, 'Tender lower back muscles', 'Lumbar strain', 'Physical therapy, ibuprofen', 'Stretch daily, avoid heavy lifting', '2024-03-18 11:00:00', '/files/record4.pdf', '2025-02-22 05:18:05'),
(7, 11, 'Shortness of breath', 'Asthma', '110/70', 78, 'Mild wheezing in lungs', 'Asthma exacerbation', 'Inhaler, corticosteroids', 'Use inhaler as directed, avoid triggers', '2024-03-20 16:00:00', '/files/record5.pdf', '2025-02-22 05:18:05'),
(8, 12, 'Abdominal pain', 'No prior GI issues', '115/75', 70, 'Mild tenderness in lower abdomen', 'Gastritis', 'Antacids, bland diet', 'Avoid spicy food, return if worsens', '2024-03-22 13:00:00', '/files/record6.pdf', '2025-02-22 05:18:05'),
(9, 13, 'Fatigue', 'Anemia', '118/74', 72, 'Pale skin, normal heart sounds', 'Iron deficiency anemia', 'Iron supplements, diet changes', 'Follow up in 3 months', '2024-03-25 10:30:00', '/files/record7.pdf', '2025-02-22 05:18:05'),
(10, 14, 'Joint pain', 'Osteoarthritis', '130/85', 74, 'Swollen knee joint', 'Osteoarthritis flare-up', 'NSAIDs, physical therapy', 'Maintain joint mobility, follow up in 6 weeks', '2024-03-28 15:00:00', '/files/record8.pdf', '2025-02-22 05:18:05'),
(11, 15, 'Sore throat', 'No chronic conditions', '120/80', 70, 'Red throat, no swelling', 'Viral pharyngitis', 'Saltwater gargles, rest', 'Increase hydration, follow up if worsens', '2024-03-30 12:00:00', '/files/record9.pdf', '2025-02-22 05:18:05'),
(12, 16, 'Skin rash', 'No known allergies', '110/65', 68, 'Red, itchy rash on arms', 'Contact dermatitis', 'Topical steroid cream', 'Avoid irritants, follow up if no improvement', '2024-04-02 09:45:00', '/files/record10.pdf', '2025-02-22 05:18:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `full_name`, `created_at`) VALUES
(1, 'docJane', '482c811da5d5b4bc6d497ffa98491e38', 'Dr. Jane Smith', '2025-02-21 22:59:59'),
(2, 'sample1', '$2y$10$1rPym3dq0xrywrxhbwPhhkjImfgn6eObb0.OHugIoxsX5I9hP9V9S', 'Dr. John Doe', '2025-02-21 22:59:59'),
(3, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', '2025-02-21 23:04:06');

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
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `soap_notes`
--
ALTER TABLE `soap_notes`
  MODIFY `soap_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
