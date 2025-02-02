-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 06:15 AM
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
-- Database: `store_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `acc_id` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `con_num` varchar(15) DEFAULT NULL,
  `stud_num` varchar(15) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`acc_id`, `firstname`, `lastname`, `email`, `con_num`, `stud_num`, `username`, `password`, `role`) VALUES
(1, 'Admin', 'User', 'admin@example.com', '1234567890', '00112233', 'admin', 'admin123', 'admin'),
(2, 'Regular', 'User', 'user@example.com', '0987654321', '00443322', 'user', 'user123', 'user'),
(3, 'sa', 'sa', 'sa@a.a', NULL, NULL, 'sa', 'sa', 'user'),
(4, 'Alice', 'Smith', 'alice@example.com', '1234567890', '00112233', 'alice', 'alice', 'admin'),
(5, 'Bob', 'Johnson', 'bob@example.com', '0987654321', '00443322', 'bob', 'bob', 'user'),
(6, 'Charlie', 'Brown', 'charlie@example.com', '1122334455', '00556677', 'charlie', 'charlie', 'user'),
(7, 'David', 'Miller', 'david@example.com', '1231231234', '11122233', 'david', 'david', 'user'),
(8, 'Evaaaaaaaaaa', 'Williams', 'eva@example.com', '3213214321', '22233344', 'eva', 'eva', 'user'),
(9, 'Frank', 'Clark', 'frank@example.com', '2132132134', '33344455', 'frank', 'frank', 'user'),
(10, 'Grace', 'Davis', 'grace@example.com', '4324325432', '44455566', 'grace', 'grace', 'user'),
(11, 'Hank', 'Lee', 'hank@example.com', '5435436543', '55566677', 'hank', 'hank', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `acc_id` int(11) DEFAULT NULL,
  `prod_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `size` enum('small','medium','large') DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `payment` varchar(50) DEFAULT NULL,
  `receive_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`cart_id`, `acc_id`, `prod_id`, `quantity`, `size`, `total`, `payment`, `receive_type`) VALUES
(1, 1, 1, 2, 'small', 6.00, 'cash', 'pickup'),
(2, 2, 2, 1, 'medium', 5.00, 'e-wallet', 'delivery'),
(3, 3, 3, 3, 'large', 21.00, 'cash', 'pickup'),
(4, 4, 4, 1, 'small', 3.00, 'e-wallet', 'delivery'),
(6, 6, 6, 1, 'large', 8.00, 'e-wallet', 'delivery'),
(7, 7, 7, 4, 'small', 12.00, 'cash', 'pickup'),
(24, 8, 6, 6, 'large', 42.00, 'e-wallet', 'pickup'),
(29, 5, 12, 6, 'small', 84.00, 'cash', 'pickup'),
(36, 5, 18, 6, 'small', 78.00, 'cash', 'pickup'),
(37, 5, 23, 8, 'small', 88.00, 'cash', 'pickup'),
(38, 8, 27, 3, 'small', 4.50, 'cash', 'pickup'),
(39, 8, 29, 3, 'small', 10.50, 'cash', 'pickup'),
(40, 8, 5, 5, 'small', 22.50, 'cash', 'pickup');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `fav_id` int(11) NOT NULL,
  `acc_id` int(11) DEFAULT NULL,
  `prod_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`fav_id`, `acc_id`, `prod_id`) VALUES
(1, 1, 4),
(2, 2, 5),
(3, 3, 6),
(4, 4, 7),
(8, 8, 11),
(15, 8, 7),
(18, 8, 1),
(25, 8, 28),
(26, 5, 21),
(27, 5, 23);

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `feed_id` int(11) NOT NULL,
  `acc_id` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`feed_id`, `acc_id`, `comment`) VALUES
(1, 1, 'Great product!'),
(2, 2, 'Really enjoyed this!'),
(3, 3, 'Would buy again.'),
(4, 4, 'Absolutely loved the product, will definitely recommend it to my friends and family! The taste was exquisite and the packaging was excellent.'),
(5, 5, 'The product exceeded my expectations. I was really happy with the quality and the delivery was prompt. Will order again.'),
(6, 6, 'A truly delightful experience from start to finish. The product arrived on time and the quality was exceptional.'),
(7, 7, 'Fantastic product! The flavors were spot on and it was just what I was looking for. The customer service was also top-notch.'),
(8, 8, 'The best product I have ever purchased. The quality is amazing and the taste is out of this world. Highly recommend this to everyone.');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `tran_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `tran_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(9, 6),
(10, 7),
(11, 8),
(12, 9),
(13, 10),
(14, 11),
(15, 19),
(16, 20),
(17, 21),
(18, 22),
(19, 23),
(20, 24),
(21, 29),
(22, 32),
(23, 48),
(24, 49),
(25, 50),
(26, 51),
(27, 52),
(28, 53),
(29, 54),
(30, 55),
(31, 56),
(32, 57),
(33, 58);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prod_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `s_price` decimal(10,2) DEFAULT NULL,
  `m_price` decimal(10,2) DEFAULT NULL,
  `l_price` decimal(10,2) DEFAULT NULL,
  `s_stock` int(11) DEFAULT NULL,
  `m_stock` int(11) DEFAULT NULL,
  `l_stock` int(11) DEFAULT NULL,
  `image_url` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prod_id`, `name`, `desc`, `category`, `s_price`, `m_price`, `l_price`, `s_stock`, `m_stock`, `l_stock`, `image_url`) VALUES
(1, 'Sunset Spritzer', 'A refreshing spritzer with a hint of citrus', 'Drinks', 3.00, 5.00, 6.00, 100, 200, 300, 'https://i.ibb.co/fSXPwpy/Sunset-Spritzer.png'),
(2, 'Charcoal Detox', 'A detoxifying drink with activated charcoal', 'Drinks', 4.00, 6.00, 8.00, 100, 200, 300, 'https://i.ibb.co/RytXmb4/Charcoal-Detox.png'),
(3, 'Vanilla Latte', 'Creamy latte with a touch of vanilla', 'Drinks', 3.50, 5.50, 7.50, 100, 200, 300, 'https://i.ibb.co/wdydVTQ/Vanilla-Latte.png'),
(4, 'Mint Lemonade', 'Cool lemonade with a hint of mint', 'Drinks', 2.50, 4.50, 6.50, 100, 200, 300, 'https://i.ibb.co/nsWpFGp/Mint-Lemonade.png'),
(5, 'Mocha Frost', 'Frozen mocha drink', 'Drinks', 4.50, 6.50, 8.50, 100, 200, 300, 'https://i.ibb.co/XJRKWYG/Mocha-Frost.png'),
(6, 'Cold Brew Bliss', 'Smooth cold brew coffee', 'Drinks', 3.00, 5.00, 7.00, 100, 200, 300, 'https://i.ibb.co/v1NFcw6/Cold-Brew-Bliss.png'),
(7, 'Spicy Tuna Roll', 'Tuna roll with a spicy kick', 'Sushi', 8.00, 12.00, 16.00, 50, 100, 150, 'https://i.ibb.co/52N93jg/Spicy-Tuna-Roll.png'),
(8, 'Hamachi', 'Fresh yellowtail sushi', 'Sushi', 10.00, 14.00, 18.00, 50, 100, 150, 'https://i.ibb.co/BnrLc3H/Hamachi.png'),
(9, 'Sake Nigiri', 'Classic salmon nigiri', 'Sushi', 7.00, 11.00, 15.00, 50, 100, 150, 'https://i.ibb.co/j64rfcy/Sake-Nigiri.png'),
(10, 'Dragon Roll', 'Roll with eel and avocado', 'Sushi', 12.00, 16.00, 20.00, 50, 100, 150, 'https://i.ibb.co/rGswjdL/Dragon-Roll.png'),
(11, 'California Roll', 'Crab and avocado roll', 'Sushi', 6.00, 10.00, 14.00, 50, 100, 150, 'https://i.ibb.co/3d5zsv3/California-Roll.png'),
(12, 'Chirashi', 'Bowl of assorted sashimi over rice', 'Sushi', 14.00, 18.00, 22.00, 50, 100, 150, 'https://i.ibb.co/nzWxBMC/Chirashi.png'),
(13, 'Garden Fresh Pesto', 'Pesto pizza with fresh vegetables', 'Pizza', 10.00, 15.00, 20.00, 20, 40, 60, 'https://i.ibb.co/7RbtVdK/Garden-Fresh-Pesto.jpg'),
(14, 'Margherita Bliss', 'Classic Margherita pizza', 'Pizza', 9.00, 14.00, 19.00, 20, 40, 60, 'https://i.ibb.co/Twr14V3/Margherita-Bliss.png'),
(15, 'Southwest Veggie', 'Spicy pizza with southwestern veggies', 'Pizza', 11.00, 16.00, 21.00, 20, 40, 60, 'https://i.ibb.co/h2Kzt6Y/Southwest-Veggie.jpg'),
(16, 'Four Cheese Feast', 'Pizza with four types of cheese', 'Pizza', 12.00, 17.00, 22.00, 20, 40, 60, 'https://i.ibb.co/zrmg4db/Four-Cheese-Feast.jpg'),
(17, 'Spicy Inferno', 'Extra spicy pizza', 'Pizza', 11.00, 16.00, 21.00, 20, 40, 60, 'https://i.ibb.co/2MPp2q4/Spicy-Inferno.jpg'),
(18, 'Taco Veggie Explosion', 'Pizza with taco toppings', 'Pizza', 13.00, 18.00, 23.00, 20, 40, 60, 'https://i.ibb.co/SXRchSn/Taco-Veggie-Explosion.jpg'),
(19, 'Plant Power Burger', 'Vegetarian burger with a plant-based patty', 'Burger', 8.00, 10.00, 12.00, 50, 100, 150, 'https://i.ibb.co/Kbpppy4/Plant-Power-Burger.png'),
(20, 'Bunzilla', 'Burger with an extra-large bun', 'Burger', 9.00, 11.00, 13.00, 50, 100, 150, 'https://i.ibb.co/DYyjgLK/Bunzilla.png'),
(21, 'The Beefinator', 'Double beef patty burger', 'Burger', 10.00, 12.00, 14.00, 50, 100, 150, 'https://i.ibb.co/qkSw9NH/The-Beefinator.png'),
(22, 'Cheesy Avalanche', 'Burger with extra cheese', 'Burger', 9.50, 11.50, 13.50, 50, 100, 150, 'https://i.ibb.co/chfQnh2/Cheesy-Avalanche.png'),
(23, 'Tower of Flavor', 'Multi-layered burger', 'Burger', 11.00, 13.00, 15.00, 50, 100, 150, 'https://i.ibb.co/4tRfrmj/Tower-of-Flavor.png'),
(24, 'Tropical Hawaiian Heat', 'Burger with pineapple and spicy sauce', 'Burger', 10.00, 12.00, 14.00, 50, 100, 150, 'https://i.ibb.co/K5bpZL7/Tropical-Hawaiian-Heat.png'),
(25, 'BUTTER CROISSANT', 'Flaky butter croissant', 'Pastry', 2.50, 4.50, 6.50, 50, 100, 150, 'https://i.ibb.co/hZJD5yy/BUTTER-CROISSANT.png'),
(26, 'DOUBLE CHOCOLATE COOKIE', 'Rich chocolate cookie', 'Pastry', 3.00, 5.00, 7.00, 50, 100, 150, 'https://i.ibb.co/zPVc7fh/DOUBLE-CHOCOLATE-COOKIE.png'),
(27, 'GLAZZED DONUT', 'Classic glazed donut', 'Pastry', 1.50, 3.50, 5.50, 50, 100, 150, 'https://i.ibb.co/R9np9B4/GLAZZED-DONUT.png'),
(28, 'CRISPY CHURRO', 'Crunchy churro with cinnamon sugar', 'Pastry', 2.00, 4.00, 6.00, 50, 100, 150, 'https://i.ibb.co/wK55pkF/CRISPY-CHURRO.png'),
(29, 'CARROT CUPCAKE', 'Cupcake with carrot and cream cheese frosting', 'Pastry', 3.50, 5.50, 7.50, 50, 100, 150, 'https://i.ibb.co/sjpmDwt/CARROT-CUPCAKE.png'),
(30, 'CHOCO DUST CAKE', 'Chocolate cake with chocolate dusting', 'Pastry', 4.00, 6.00, 8.00, 50, 100, 150, 'https://i.ibb.co/nRmNXg4/CHOCO-DUST-CAKE.png'),
(31, 'Classic Spaghetti Bolognese', 'Traditional spaghetti with Bolognese sauce', 'Pasta', 10.00, 14.00, 18.00, 30, 60, 90, 'https://i.ibb.co/tDPv5Yr/Classic-Spaghetti-Bolognese.jpg'),
(32, 'Carbonara Alla Romana', 'Creamy carbonara with pancetta', 'Pasta', 11.00, 15.00, 19.00, 30, 60, 90, 'https://i.ibb.co/YDZ50bV/Carbonara-Alla-Romana.jpg'),
(33, 'Beefy Lasagna Supreme', 'Layered lasagna with beef and cheese', 'Pasta', 12.00, 16.00, 20.00, 30, 60, 90, 'https://i.ibb.co/BBmCgZc/Beefy-Lasagna-Supreme.jpg'),
(34, 'Spicy Arrabbiata Rigatoni', 'Spicy tomato sauce with rigatoni', 'Pasta', 10.50, 14.50, 18.50, 30, 60, 90, 'https://i.ibb.co/353GSRv/Spicy-Arrabbiata-Rigatoni.jpg'),
(35, 'Roasted Vegetable Fusilli', 'Fusilli pasta with roasted veggies', 'Pasta', 9.00, 13.00, 17.00, 30, 60, 90, 'https://i.ibb.co/BtKNSvG/Roasted-Vegetable-Fusilli.jpg'),
(36, 'Mushroom Truffle Fettuccine', 'Fettuccine with mushrooms and truffle oil', 'Pasta', 13.00, 17.00, 21.00, 30, 60, 90, 'https://i.ibb.co/ScmjCbn/Mushroom-Truffle-Fettuccine.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `tran_id` int(11) NOT NULL,
  `acc_id` int(11) DEFAULT NULL,
  `prod_id` int(11) DEFAULT NULL,
  `time_order` timestamp NOT NULL DEFAULT current_timestamp(),
  `quantity` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `payment` enum('cash','e-wallet') DEFAULT NULL,
  `receive_type` enum('pickup','delivery') DEFAULT 'pickup',
  `size` enum('small','medium','large') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`tran_id`, `acc_id`, `prod_id`, `time_order`, `quantity`, `total`, `payment`, `receive_type`, `size`) VALUES
(1, 1, 1, '2024-01-01 02:00:00', 2, 14.00, 'cash', 'pickup', 'small'),
(2, 2, 2, '2024-01-02 03:00:00', 1, 16.00, 'e-wallet', 'delivery', 'medium'),
(3, 3, 3, '2024-01-03 04:00:00', 3, 22.50, 'cash', 'pickup', 'large'),
(4, 4, 4, '2024-01-04 06:00:00', 1, 4.50, 'cash', 'pickup', 'small'),
(5, 5, 5, '2024-01-05 07:00:00', 2, 13.00, 'e-wallet', 'delivery', 'medium'),
(6, 6, 6, '2024-01-06 08:00:00', 1, 7.00, 'cash', 'pickup', 'large'),
(7, 7, 7, '2024-01-07 09:00:00', 3, 48.00, 'e-wallet', 'delivery', 'small'),
(8, 8, 8, '2024-01-08 10:00:00', 2, 28.00, 'cash', 'pickup', 'medium'),
(9, 8, 2, '2024-12-16 05:16:59', 2, 12.00, 'e-wallet', 'delivery', 'medium'),
(10, 8, 2, '2024-12-16 05:17:31', 1, 4.00, 'cash', 'pickup', 'small'),
(11, 8, 2, '2024-12-16 05:22:35', 1, 4.00, 'cash', 'pickup', 'small'),
(19, 8, 8, '2024-12-16 15:37:55', 3, 9.00, 'cash', 'pickup', 'medium'),
(20, 8, 8, '2024-12-16 15:44:49', 3, 9.00, 'cash', 'pickup', 'medium'),
(21, 8, 8, '2024-12-16 15:49:21', 3, 9.00, 'cash', 'pickup', 'medium'),
(22, 8, 8, '2024-12-16 15:50:09', 3, 9.00, 'cash', 'pickup', 'medium'),
(23, 8, 1, '2024-12-16 15:50:10', 5, 25.00, 'cash', 'pickup', 'medium'),
(24, 5, 23, '2024-12-17 20:11:51', 4, 44.00, 'cash', 'pickup', 'small'),
(29, 5, 5, '2024-12-17 20:24:30', 2, 10.00, 'cash', 'pickup', 'medium'),
(32, 5, 27, '2024-12-17 20:26:59', 3, 4.50, 'cash', 'pickup', 'small'),
(48, 5, 20, '2024-12-17 20:47:34', 3, 27.00, 'cash', 'pickup', 'small'),
(49, 5, 23, '2024-12-17 20:51:50', 5, 55.00, '', '', 'small'),
(50, 5, 27, '2024-12-17 20:51:51', 3, 4.50, 'cash', 'pickup', 'small'),
(51, 8, 11, '2024-12-17 21:13:03', 3, 18.00, 'cash', 'pickup', 'small'),
(52, 8, 11, '2024-12-17 21:13:31', 5, 30.00, 'cash', 'pickup', 'small'),
(53, 8, 1, '2024-12-17 21:14:14', 26, 78.00, 'cash', 'pickup', 'small'),
(54, 5, 22, '2024-12-17 21:50:14', 4, 38.00, 'cash', 'pickup', 'small'),
(55, 5, 22, '2024-12-17 21:50:41', 4, 38.00, 'cash', 'pickup', 'small'),
(56, 5, 24, '2024-12-17 21:51:31', 2, 20.00, 'cash', 'pickup', 'small'),
(57, 5, 22, '2024-12-17 21:54:31', 1, 9.50, 'cash', 'pickup', 'small'),
(58, 5, 17, '2024-12-17 21:54:31', 6, 66.00, 'cash', 'pickup', 'small');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`acc_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `acc_id` (`acc_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`fav_id`),
  ADD KEY `acc_id` (`acc_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`feed_id`),
  ADD KEY `acc_id` (`acc_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `tran_id` (`tran_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`tran_id`),
  ADD KEY `acc_id` (`acc_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `acc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `fav_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `feed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `tran_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`acc_id`) REFERENCES `accounts` (`acc_id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`);

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`acc_id`) REFERENCES `accounts` (`acc_id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`);

--
-- Constraints for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`acc_id`) REFERENCES `accounts` (`acc_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`tran_id`) REFERENCES `transaction` (`tran_id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`acc_id`) REFERENCES `accounts` (`acc_id`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
