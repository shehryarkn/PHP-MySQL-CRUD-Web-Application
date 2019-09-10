SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
-- Database: `hospital_db`
--
-- --------------------------------------------------------
--
-- Table structure for table `admins`
--
CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------
--
-- Table structure for table `doctors`
--
CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `gender` int(11) NOT NULL,
  `specialist` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Dumping data for table `doctors`
--
INSERT INTO `doctors` (`id`, `name`, `email`, `password`, `phone`, `gender`, `specialist`, `created`) VALUES
(1, 'Ahsan Saeed', 'ahsansaeed067@gmail.com', 'Vm0xMFlWbFdWWGhVYmxKWFltdHdVRlpzV21GWFJscHlWV3RLVUZWVU1Eaz0=', '03218878961', 0, 'Heart', '2018-05-01 13:07:24');
-- --------------------------------------------------------
--
-- Table structure for table `nurses`
--
CREATE TABLE `nurses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Dumping data for table `nurses`
--
INSERT INTO `nurses` (`id`, `name`, `email`, `password`, `phone`, `created`) VALUES
(1, 'Ahsan', 'ahsansaeed067@gmail.com', 'MTIzNDU=', '03218878961', '2018-06-27 13:39:31'),
(2, '2', 'ABC', 'WFla', '123456789', '2018-07-06 13:50:24'),
(3, 'Shehryar khan', 'shehryar@appryx.com', 'YXBwcnl4', '3433243243', '2018-07-06 18:12:35');
-- --------------------------------------------------------
--
-- Table structure for table `patients`
--
CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `gender` int(11) NOT NULL,
  `health_condition` varchar(255) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `nurse_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Dumping data for table `patients`
--
INSERT INTO `patients` (`id`, `name`, `phone`, `gender`, `health_condition`, `doctor_id`, `nurse_id`, `created`) VALUES
(6, 'hjj', '9988596666', 1, 'vbjbb', 1, 1, '2018-06-26 13:12:18'),
(9, '2', '123456789', 1, 'OK', 1, 1, '2018-07-06 13:59:25'),
(10, '2', '123456789', 1, 'OK', 1, 1, '2018-07-06 14:13:13'),
(11, 'shehryar', '123456789', 1, 'OK', 1, 1, '2018-07-06 17:36:08'),
(14, 'Coding Infinite', '3433243243', 0, 'asd', 1, 1, '2018-07-06 18:39:42'),
(15, 'Coding Infinite', '3433243243', 0, 'asd', 1, 1, '2018-07-06 18:40:07'),
(16, 'Coding Infinite', '3433243243', 0, 'asd', 1, 1, '2018-07-06 18:40:59');
--
-- Indexes for dumped tables
--
--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);
--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);
--
-- Indexes for table `nurses`
--
ALTER TABLE `nurses`
  ADD PRIMARY KEY (`id`);
--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `nurse_id` (`nurse_id`);
--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `nurses`
--
ALTER TABLE `nurses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--
--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `patients_ibfk_2` FOREIGN KEY (`nurse_id`) REFERENCES `nurses` (`id`);
COMMIT;