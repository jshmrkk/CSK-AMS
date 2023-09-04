-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.11:3306
-- Generation Time: Aug 04, 2023 at 12:11 AM
-- Server version: 10.6.14-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u879258463_attendancesys`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `id` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `department` enum('HR','Marketing','Accounting','IT','Admin') NOT NULL,
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`id`, `date_created`, `name`, `department`, `body`) VALUES
(1, '2023-07-21', 'Ichiji Seika', 'HR', 'We are delighted to express our gratitude to our incredible team members who consistently go above and beyond.'),
(2, '2023-07-11', 'Otogi Aruto', 'Marketing', 'We are excited to announce the launch of our latest product, XYZ! With its cutting-edge features and innovative design, XYZ sets a new standard in the industry.'),
(3, '2023-07-21', 'Saito Miyako', 'IT', 'We are thrilled to announce that [company name] is moving to a new, state-of-the-art office space!'),
(0, '2023-07-25', 'admin', 'Admin', '\r\nTesting new announcement'),
(0, '2023-07-26', 'admin', '', 'July 26, 2023'),
(0, '2023-07-26', 'Viejay Abad', '', 'Test'),
(0, '2023-07-26', 'admin', 'Admin', 'test 2'),
(0, '2023-07-26', 'admin', '', 'Test 3'),
(0, '2023-07-31', 'admin', '', 'July 31, 2023 Announcement');

-- --------------------------------------------------------

--
-- Table structure for table `copy_of_list_of_departments_list_of_teams____intern_management`
--

CREATE TABLE `copy_of_list_of_departments_list_of_teams____intern_management` (
  `COL 1` varchar(27) DEFAULT NULL,
  `COL 2` varchar(5) DEFAULT NULL,
  `COL 3` varchar(21) DEFAULT NULL,
  `COL 4` varchar(21) DEFAULT NULL,
  `COL 5` varchar(10) DEFAULT NULL,
  `COL 6` varchar(26) DEFAULT NULL,
  `COL 7` varchar(27) DEFAULT NULL,
  `COL 8` varchar(8) DEFAULT NULL,
  `COL 9` varchar(21) DEFAULT NULL,
  `COL 10` varchar(10) DEFAULT NULL,
  `COL 11` varchar(27) DEFAULT NULL,
  `COL 12` varchar(25) DEFAULT NULL,
  `COL 13` varchar(8) DEFAULT NULL,
  `COL 14` varchar(21) DEFAULT NULL,
  `COL 15` varchar(10) DEFAULT NULL,
  `COL 16` varchar(27) DEFAULT NULL,
  `COL 17` varchar(25) DEFAULT NULL,
  `COL 18` varchar(15) DEFAULT NULL,
  `COL 19` varchar(21) DEFAULT NULL,
  `COL 20` varchar(10) DEFAULT NULL,
  `COL 21` varchar(23) DEFAULT NULL,
  `COL 22` varchar(5) DEFAULT NULL,
  `COL 23` varchar(8) DEFAULT NULL,
  `COL 24` varchar(21) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `copy_of_list_of_departments_list_of_teams____intern_management`
--

INSERT INTO `copy_of_list_of_departments_list_of_teams____intern_management` (`COL 1`, `COL 2`, `COL 3`, `COL 4`, `COL 5`, `COL 6`, `COL 7`, `COL 8`, `COL 9`, `COL 10`, `COL 11`, `COL 12`, `COL 13`, `COL 14`, `COL 15`, `COL 16`, `COL 17`, `COL 18`, `COL 19`, `COL 20`, `COL 21`, `COL 22`, `COL 23`, `COL 24`) VALUES
('DEPARTMENT:  ADMINISTRATIVE', '', '', '', '', 'HUMAN RESOURCES DEPARTMENT', '', '', '', '', 'DEPARTMENT:  ADMINISTRATIVE', '', '', '', '', 'DEPARTMENT:  ADMINISTRATIVE', '', '', '', '', 'DEPARTMENT:  ACCOUNTING', '', '', ''),
('TEAM:  BATCH MANAGEMENT', '', '', '', '', 'TEAM: HR', '', '', '', '', 'TEAM:  MARKETING', '', '', '', '', 'TEAM:  IT', '', '', '', '', 'TEAM:  MARKETING', '', '', ''),
('BATCH ', 'NAMES', 'R - HOURS', 'NAME OF TEAM IF 50/50', '', 'BATCH ', 'NAMES', 'R- HOURS', 'NAME OF TEAM IF 50/50', '', 'BATCH ', 'NAMES', 'R- HOURS', 'NAME OF TEAM IF 50/50', '', 'BATCH ', 'NAMES', 'REMAINING HOURS', 'NAME OF TEAM IF 50/50', '', 'BATCH ', 'NAMES', 'R- HOURS', 'NAME OF TEAM IF 50/50'),
('', '', '', '', '', '19-B', 'Dela Pena, Chriscel N. (TM)', '262.5', '', '', '18-B', 'Dimaculangan, Iverson M. ', '318', '', '', '18 A', 'Aingeal Ocampo', '0', '', '', '', '', '', ''),
('', '', '', '', '', '19-B', 'Agustin, Mark Ariel C.(TL)', '362', '', '', '19-B', 'Moreno, Janicalie B.', '241', '', '', '18 A', 'Piolo Cabarlo', '0', '', '', '', '', '', ''),
('', '', '', '', '', '19-C', 'Esguerra, Trisha Gail D.P.', '0', '', '', '', 'Christian Sabong', '208', '', '', '18 A', 'John Paul Mendoza', '0', '', '', '', '', '', ''),
('', '', '', '', '', '19-C', 'Beltran, Latrell A.', '0', '', '', '', 'Jay Ar Geroquia', '208', '', '', '18 C', 'Kenshee Okko', '0', '', '', '', '', '', ''),
('', '', '', '', '', '20-A', 'Publico, Mariel', '326.50', '', '', '', 'Mikhail Punzalan', '208', '', '', '18 C', 'Ronald John Yabut', '0', '', '', '', '', '', ''),
('', '', '', '', '', '20-A', 'San Jose, Roanne', '339', '', '', '', 'Allen Cedric Dimapilis', '208', '', '', '19 A', ' Kyle Christian Quinones', '0', '', '', '', '', '', ''),
('', '', '', '', '', '20-A', 'Belardo, Alexa Sasha B.', '310.5', '', '', '', 'John William Mariquina', '128', '', '', '19 B', 'Janus Regal', '0', '', '', '', '', '', ''),
('', '', 'automatically updated', '', '', '20-D', 'Hualde, Keiko Angeli ', '510', '', '', '', 'Edilberto Sus', '128', '', '', '19 B', 'Jayrald Palmaria', '14', '', '', '', '', '', ''),
('', '', '', '', '', '20-D', 'Salarioza, James Ericson F.', '255', '', '', '', 'Jham Dapadap', '88', '', '', '19 B', 'JM Pedroso Doria', '-', '', '', '', '', '', ''),
('', '  ', '', '', '', '', '', '', '', '', '', '', '', '', '', '19 B', 'Gerald Domingo', '20', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '19 C', 'Marc Eduard Malana', '0', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '19 C', 'Oliver Dela Cruz', '156', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '19 C', 'Rachelle Vargas Malaga', '156', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'B19CG2', 'Albrecht Carl P. Chavez', '520', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'B19CG2', 'Patrick Almeda Bacabis', '168', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'B19CG2', 'Rena Mae Manuel', '152', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '19C', 'Ava Ciara Lacambra', '96', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'B19CG2', 'Janvin Coley Alde', '86', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'B19CG2', 'Joshua Mark Bulanon', '209', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'B19CG2', 'Shawn Española', '222', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'B19CG2', 'Jonathan Manio', '68', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'B19DG1', 'Jicel Ann Iyog', '240', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '-', 'Paul Yap', '-', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'B19DG1', 'Gabriel Terrence Garcia', '80', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'B19GD1', 'Meryiel Joelelen Cordero', '240', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'B19GD1', 'Christian Kenneth Calzada', '336', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '19D', 'Xyrel Genio', '336', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '20A', 'Rommel Acob', '280', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '20A', 'Kenjie Villamater', '248', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'B20AG1', 'Louise Akira Nieva', '282', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'B20AG1', 'Rene Letegio', '280', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '20A', 'Cj Navarra', '486', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'B20AG1', 'Mark Jay Clemente', '356', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '20B', 'Mark Garong', '392', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '20B', 'Nicko Reanzares', '312', '', '', '', '', '', ''),
('', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '20C', 'John Estrada Jr.', '480', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `emp_info`
--

CREATE TABLE `emp_info` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `department` enum('HR','Marketing','Accounting','IT','Admin','Management','N/A') NOT NULL,
  `position` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `work_days` varchar(255) NOT NULL,
  `work_hrs` varchar(255) NOT NULL,
  `age` int(3) DEFAULT NULL,
  `gender` varchar(12) NOT NULL DEFAULT 'Not Set',
  `address` varchar(60) NOT NULL DEFAULT 'Not Set'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emp_info`
--

INSERT INTO `emp_info` (`id`, `name`, `department`, `position`, `start_date`, `work_days`, `work_hrs`, `age`, `gender`, `address`) VALUES
(1, 'Ichiji Seika', 'HR', 'HR Admin', '2023-06-02', 'Monday to Friday', '8am - 5pm', NULL, 'Not Set', 'Not Set'),
(2, 'Viejay Abad', 'Management', 'Quality Control Manager/Operations Manager', '2023-05-05', 'N/A', 'N/A', NULL, 'Not Set', 'Not Set'),
(3, 'admin', 'Admin', 'Admin Test', '2023-07-07', 'Monday to Friday', '8am to 5pm', NULL, 'Not Set', 'Not Set'),
(8, 'Cherizza Grace G. Peñafiel', 'Accounting', 'President', '2019-01-01', 'Subject to change.', 'Subject to change.', NULL, 'Not Set', 'Not Set'),
(9, 'Jazz Jan D. Gregorio ', 'Admin', 'Admin Officer', '2019-01-01', 'Subject to change.', 'Subject to change.', NULL, 'Not Set', 'Not Set'),
(10, 'John Leonard D. Gregorio', 'Accounting', 'Treasury', '2019-01-01', 'Subject to change.', 'Subject to change.', NULL, 'Not Set', 'Not Set'),
(11, 'Cecilia D. Gregorio', 'Management', 'Chairman', '2019-01-01', 'Subject to change.', 'Subject to change.', NULL, 'Not Set', 'Not Set'),
(12, 'Julich Enduma', 'HR', 'HR Supervisor', '2019-01-01', 'Subject to change.', 'Subject to change.', NULL, 'Not Set', 'Not Set'),
(13, 'Justine Grace Rosarda', 'Accounting', 'Accounting Supervisor', '2019-01-01', 'Subject to change.', 'Subject to change.', NULL, 'Not Set', 'Not Set'),
(14, 'Veronica Joyce Gabucan', 'Management', 'Junior Bookkeeper / Admin ', '2019-01-01', 'Subject to change', 'Subject to change', NULL, 'Not Set', 'Not Set'),
(15, 'Karla Barja Alindayo', 'Management', 'Senior Bookkeeper', '2019-01-01', 'Subject to change', 'Subject to change', NULL, 'Not Set', 'Not Set'),
(16, 'Alexandra Jenn Perjes Yap', 'Management', 'Junior Bookkeeper', '2019-01-01', 'Subject to change', 'Subject to change', NULL, 'Not Set', 'Not Set'),
(17, 'John Michael V. De Jose', 'Management', 'IT Manager', '2019-01-01', 'Subject to change', 'Subject to change', NULL, 'Not Set', 'Not Set'),
(18, 'Patricia M. Sayco', 'Management', 'Junior Bookkeeper', '2019-01-01', 'Subject to change', 'Subject to change', NULL, 'Not Set', 'Not Set'),
(19, 'Jennifer Edangan Onnon', 'Management', 'Junior Bookkeeper', '2019-01-01', 'Subject to change', 'Subject to change', NULL, 'Not Set', 'Not Set'),
(20, 'Christine N. Calditaran', 'Management', 'Junior Bookkeeper', '2019-01-01', 'Subject to change', 'Subject to change', NULL, 'Not Set', 'Not Set'),
(21, 'Rubelyn De Jose', 'Accounting', 'Account Receivable Clerk', '2019-01-01', 'Subject to change.', 'Subject to change.', NULL, 'Not Set', 'Not Set'),
(22, 'John Herald Gallego', 'Accounting', 'Junior Bookkeeper', '2019-01-01', 'Subject to change.', 'Subject to change.', NULL, 'Not Set', 'Not Set'),
(23, 'Charichelle V. Laureles', 'Management', 'Subject to change.', '2019-01-01', 'Subject to change.', 'Subject to change.', NULL, 'Not Set', 'Not Set'),
(24, 'Frincez Devillez Convento', 'Management', 'Subject to change.', '2019-01-01', 'Subject to change.', 'Subject to change.', NULL, 'Not Set', 'Not Set'),
(25, 'Milky N. Pagobo', 'Accounting', 'Junior Bookkeeper', '2019-01-01', 'Subject to change.', 'Subject to change.', NULL, 'Not Set', 'Not Set'),
(26, 'Richard A. Araña', 'Accounting', 'Junior Bookkeeper', '2019-01-01', 'Subject to change.', 'Subject to change.', NULL, 'Not Set', 'Not Set'),
(27, 'Rosyl Vallente Perez', 'Accounting', 'Junior Bookkeeper', '2019-01-01', 'Subject to change.', 'Subject to change.', NULL, 'Not Set', 'Not Set'),
(28, 'Casandra M. Santos', 'Marketing', 'Team Leader', '2023-05-29', 'Monday to Friday', '8:00 AM to 5:00 PM', NULL, 'Not Set', 'Not Set'),
(29, 'Rosemary D. Buendicho', 'Accounting', 'Senior Bookkeeper', '2023-07-20', 'Monday to Friday', '8:30AM to 5:30PM', NULL, 'Not Set', 'Not Set'),
(30, 'Anna Maria Rogelia T. Almogil', 'Accounting', 'Junior Bookkeeper', '2023-07-20', 'Monday to Friday', '8:30AM to 5:30PM', NULL, 'Not Set', 'Not Set');

-- --------------------------------------------------------

--
-- Table structure for table `int_info`
--

CREATE TABLE `int_info` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `department` enum('HR','Marketing','Accounting','IT','Admin','Management','N/A') NOT NULL,
  `position` varchar(255) NOT NULL DEFAULT 'Intern',
  `start_date` date NOT NULL,
  `work_days` varchar(255) NOT NULL,
  `work_hrs` varchar(255) NOT NULL,
  `hr_req` int(3) NOT NULL,
  `hr_ren` int(3) NOT NULL DEFAULT 0,
  `hr_left` int(3) NOT NULL DEFAULT 0,
  `age` int(3) DEFAULT NULL,
  `gender` varchar(12) NOT NULL DEFAULT 'Not Set',
  `address` varchar(60) NOT NULL DEFAULT 'Not Set',
  `school` varchar(60) NOT NULL DEFAULT 'Not Set'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `int_info`
--

INSERT INTO `int_info` (`id`, `name`, `department`, `position`, `start_date`, `work_days`, `work_hrs`, `hr_req`, `hr_ren`, `hr_left`, `age`, `gender`, `address`, `school`) VALUES
(1, 'Gabriel Terrence Garcia', 'IT', 'Intern', '2023-03-27', 'Monday to Friday', '8am - 5pm', 486, -21, 507, NULL, 'Not Set', 'Not Set', 'Not Set'),
(2, 'Ava Ciara Lacambra', 'IT', 'Intern', '2023-03-20', 'Monday to Friday', '8am - 5pm', 486, -9, 495, NULL, 'Not Set', 'Not Set', 'Not Set'),
(3, 'Shawn Danielle Espanola', 'IT', 'Intern', '2023-03-22', 'Monday to Friday', '8am - 5pm', 486, -10, 496, NULL, 'Not Set', 'Not Set', 'Not Set'),
(4, 'Louise Akira S. Nieva', 'IT', 'Intern', '2023-04-03', 'Monday to Friday', '8am to 5pm', 600, 441, 159, NULL, 'Not Set', 'Not Set', 'Not Set'),
(5, 'Joshua Esguerra', 'IT', 'Intern', '2019-01-01', 'Monday to Friday', '8am to 5pm', 150, 136, 14, NULL, 'Not Set', 'Not Set', 'Not Set'),
(6, 'Ma. Jhamille Ann M. Dapadap', 'Marketing', 'Intern', '2019-01-01', 'Subject to change', 'Subject to change', 0, 0, 0, NULL, 'Not Set', 'Not Set', 'Not Set'),
(7, 'Cassandra Santos', 'Marketing', 'Intern', '2019-01-01', 'Subject to change', 'Subject to change', 0, 0, 0, NULL, 'Not Set', 'Not Set', 'Not Set'),
(8, 'John William Mariquina', 'Marketing', 'Intern', '2019-01-01', 'Subject to change', 'Subject to change', 0, 0, 0, NULL, 'Not Set', 'Not Set', 'Not Set'),
(9, 'Lina Hezarsa', 'Marketing', 'Intern', '2019-01-01', 'Subject to change', 'Subject to change', 0, 0, 0, NULL, 'Not Set', 'Not Set', 'Not Set'),
(14, 'Rena Mae Manuel', 'IT', 'Intern', '2019-01-01', 'Subject to change', 'Subject to change', 200, 0, 0, NULL, 'Not Set', 'Not Set', 'Not Set'),
(15, 'Jerene Beatrice Talatala', 'IT', 'Intern', '2019-01-01', 'Subject to change', 'Subject to change', 200, 87, 113, NULL, 'Not Set', 'Not Set', 'Not Set'),
(16, 'Juspher Pedrozo', 'IT', 'Intern', '2019-01-01', 'Subject to change', 'Subject to change', 200, 103, 97, NULL, 'Not Set', 'Not Set', 'Not Set'),
(17, 'Eugene Gueta', 'IT', 'Intern', '2019-01-01', 'Subject to change', 'Subject to change', 200, 104, 96, NULL, 'Not Set', 'Not Set', 'Not Set'),
(18, 'Patrick Lirom', 'IT', 'Intern', '2019-01-01', 'Subject to change', 'Subject to change', 200, 119, 81, NULL, 'Not Set', 'Not Set', 'Not Set'),
(19, 'Daniella Langres', 'IT', 'Intern', '2019-01-01', 'Subject to change', 'Subject to change', 200, 24, 176, NULL, 'Not Set', 'Not Set', 'Not Set'),
(21, 'Jicel Ann V. Iyog', 'IT', 'Intern', '2019-01-01', 'Subject to change', 'Subject to change', 200, 0, 0, NULL, 'Not Set', 'Not Set', 'Not Set'),
(22, 'Xyrel D. Genio', 'IT', 'Intern', '2019-01-01', 'Subject to change', 'Subject to change', 200, 0, 0, NULL, 'Not Set', 'Not Set', 'Not Set'),
(23, 'Christian Kenneth Calzada', 'IT', 'Intern', '2019-01-01', 'Subject to change', 'Subject to change', 200, 0, 0, NULL, 'Not Set', 'Not Set', 'Not Set'),
(24, 'Mark Anthony O. Garong', 'IT', 'Intern', '2019-01-01', 'Subject to change', 'Subject to change', 200, 16, 184, NULL, 'Not Set', 'Not Set', 'Not Set'),
(25, 'Meryiel Joelelen D. Cordero', 'IT', 'Intern', '2019-01-01', 'Subject to change', 'Subject to change', 200, 0, 0, NULL, 'Not Set', 'Not Set', 'Not Set'),
(26, 'Joshua Mark Bulanon', 'IT', 'Intern', '2019-01-01', 'Subject to change', 'Subject to change', 200, 0, 0, NULL, 'Not Set', 'Not Set', 'Not Set'),
(27, 'Rommel Acob', 'IT', 'Intern', '2019-01-01', 'Subject to change', 'Subject to change', 200, 87, 113, NULL, 'Not Set', 'Not Set', 'Not Set'),
(30, 'Patrick Shane A. Bacabis', 'IT', 'Intern', '2019-01-01', 'Subject to change', 'Subject to change', 200, 0, 0, NULL, 'Not Set', 'Not Set', 'Not Set'),
(31, 'Karl Adrian H. Garcia', 'IT', 'Intern', '2023-07-11', 'Monday to Friday', '8:00 AM to 5:00 PM', 208, 88, 120, NULL, 'Not Set', 'Not Set', 'Not Set'),
(32, 'Rene Q. Letegio', 'IT', 'Intern', '2023-04-03', 'Monday to Friday', '8:00 AM to 5:00 PM', 16, 8, 8, NULL, 'Not Set', 'Not Set', 'Not Set'),
(33, 'Mark Jay G. Clemente', 'IT', 'Intern', '2023-04-03', 'Monday to Friday', '8:00 AM to 5:00 PM', 21, 39, -18, NULL, 'Not Set', 'Not Set', 'Not Set'),
(34, 'Lei Anne V. Agbuya', 'HR', 'Intern', '2023-07-03', 'Monday to Saturday', '8:00 AM to 5:00 PM', 14, 0, 0, NULL, 'Not Set', 'Not Set', 'Not Set'),
(35, 'John Carlo Sano', 'HR', 'Intern', '2023-05-08', 'Monday to Friday', '8:00 AM to 5:00 PM', 182, 0, 0, NULL, 'Not Set', 'Not Set', 'Not Set'),
(36, 'Kimberly May L. Sustal', 'Accounting', 'Intern', '2023-07-11', 'Monday to Saturday', '8:00 AM to 5:00 PM', 450, 216, 234, NULL, 'Not Set', 'Not Set', 'Not Set'),
(37, 'Kathrine Nicole S. Fernan', 'Accounting', 'Intern', '2023-07-11', 'Monday to Saturday', '8:00 AM to 5:00 PM', 450, 216, 234, NULL, 'Not Set', 'Not Set', 'Not Set'),
(38, 'Patricia Jamellin V. Bautista', 'Accounting', 'Intern', '2023-07-11', 'Monday to Saturday', '8:00 AM to 5:00 PM', 450, 216, 234, NULL, 'Not Set', 'Not Set', 'Not Set'),
(39, 'Lina E Hesarza', 'Marketing', 'Intern', '2023-06-29', 'Monday to Friday', '8:00 AM to 5:00 PM', 168, 40, 128, NULL, 'Not Set', 'Not Set', 'Not Set'),
(40, 'Nicko V. Reanzares', 'IT', 'Intern', '2023-04-09', 'Monday to Friday', '8:00 AM to 5:00 PM', 68, 8, 60, NULL, 'Not Set', 'Not Set', 'Not Set'),
(41, 'Shenna Mae A. Dela Fuente', 'Admin', 'Intern', '2023-07-10', '5', '8 am to 5 pm', 200, 199, 1, NULL, 'Not Set', 'Not Set', 'Not Set'),
(42, 'Denber Abuan', 'Accounting', 'Intern', '2023-07-18', 'Monday to Friday', '8:00 AM to 5:00 PM', 73, 67, 6, NULL, 'Not Set', 'Not Set', 'Not Set'),
(43, 'Elizabeth T. de la Rosa', 'Accounting', 'Intern', '2023-03-20', 'Monday to Friday', '8:00 AM to 5:00 PM', 64, 0, 0, NULL, 'Not Set', 'Not Set', 'Not Set'),
(44, 'Milky N. Pagobo', 'Accounting', 'Intern', '2023-03-27', 'Monday to Friday', '8:00 AM to 5:00 PM', 40, 8, -8, NULL, 'Not Set', 'Not Set', 'Not Set'),
(45, 'Millicent Joie Gamboa', 'Accounting', 'Intern', '2023-07-24', ' Mon to Fri', '8AM to 5PM', 400, 32, 368, NULL, 'Not Set', 'Not Set', 'Not Set'),
(46, 'Maru B. Cunag', 'Accounting', 'Intern', '2023-07-24', ' Mon to Fri', '8AM to 5PM', 519, 40, 479, NULL, 'Not Set', 'Not Set', 'Not Set');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `leave_type` enum('Planned Leave','School Initiated Leave','Emergency Leave','Sick Leave','Birthday Leave','Vacation Leave') NOT NULL,
  `date_req` datetime NOT NULL,
  `date_app` datetime NOT NULL,
  `status` enum('Approved','Rejected') NOT NULL,
  `remarks` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `name`, `leave_type`, `date_req`, `date_app`, `status`, `remarks`) VALUES
(1, 'Gabriel Terrence Garcia', 'School Initiated Leave', '2023-06-07 07:00:00', '2023-06-07 04:45:00', 'Approved', 'ok'),
(2, 'Viejay Abad', 'School Initiated Leave', '2023-07-12 07:24:00', '2023-07-12 07:24:00', 'Approved', 'ok');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('Late','Absent without Leave','Reminder','Late - No time in','Unidentified') NOT NULL,
  `date` date NOT NULL,
  `remarks` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `department` enum('HR','Marketing','Accounting','IT','Admin') NOT NULL,
  `body` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `name`, `department`, `body`, `date`) VALUES
(1, 'Ichiji Seika', 'Admin', 'You have received a new message from [Sender Name]. Click here to read it.', '2023-03-16'),
(2, 'Otogi Aruto', 'HR', '[Sender Name] has sent you a friend request. Click here to view and respond.', '2023-03-20'),
(3, 'Saito Miyako', 'HR', 'A new version of [Product Name] is now available. Click here to learn more and download the update.', '2023-04-12'),
(0, 'Ava Ciara Lacambra', 'IT', '', '2023-07-26');

-- --------------------------------------------------------

--
-- Table structure for table `tasks_activities`
--

CREATE TABLE `tasks_activities` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `task_date_assigned` datetime NOT NULL,
  `task_deadline` datetime NOT NULL,
  `task_from` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks_activities`
--

INSERT INTO `tasks_activities` (`id`, `name`, `department`, `task_name`, `task_date_assigned`, `task_deadline`, `task_from`) VALUES
(1, 'Gotou Hitori', 'IT', 'AMS Development', '2023-07-12 00:00:00', '2023-07-17 11:24:51', 'Admin Department'),
(2, 'Ichiji Nijika', 'HR', 'Monitor IT Department', '2023-07-01 14:23:48', '2023-07-07 14:23:48', 'HR Department'),
(3, '', 'All Departments', 'Attend Weekly Meeting', '2023-07-01 14:26:54', '2023-07-14 14:26:54', 'Admin Department'),
(4, '', 'HR', 'List down Intern Names', '2023-07-13 10:24:48', '2023-07-13 10:24:48', 'HR Department'),
(5, 'Ichiji Nijika', 'HR', 'Test', '2023-05-01 16:37:02', '2023-07-13 10:37:02', ''),
(6, 'Ryo Yamada ', 'Accounting', 'Check Payroll', '2023-07-13 11:15:42', '2023-07-13 11:15:42', ''),
(0, 'Ava Ciara Lacambra', 'IT', '', '2023-07-26 00:00:00', '0000-00-00 00:00:00', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `time_in`
--

CREATE TABLE `time_in` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL,
  `location` varchar(255) NOT NULL,
  `photo_loc` varchar(255) NOT NULL,
  `approval` enum('Approved','Reviewing','Denied','No Time-out') NOT NULL DEFAULT 'No Time-out',
  `token` varchar(255) NOT NULL DEFAULT 'no token generated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `time_in`
--

INSERT INTO `time_in` (`id`, `name`, `datetime`, `location`, `photo_loc`, `approval`, `token`) VALUES
(29, 'Gabriel Terrence Garcia', '2023-06-26 08:00:00', 'WFH', 'photo_loc', 'Reviewing', '23c3063a10950661'),
(30, 'Louise Akira S. Nieva', '2023-06-26 08:00:00', 'WFH', 'photo_loc', 'Reviewing', '9d759268e16f9f9c'),
(31, 'Louise Akira S. Nieva', '2023-07-01 13:57:26', 'WFH', 'timein_photos/Sketchpad.png', 'Reviewing', '649fc046344ab472262'),
(32, 'Louise Akira S. Nieva', '2023-07-19 09:04:29', 'WFH', 'photo_loc', 'Reviewing', '64b7369d81fcc370201'),
(33, 'Louise Akira S. Nieva', '2023-07-19 17:55:14', 'WFH', 'photo_loc', 'Reviewing', '64b7b30257d58850875'),
(34, 'Louise Akira S. Nieva', '2023-07-19 17:55:40', 'WFH', 'photo_loc', 'Reviewing', '64b7b31c28c3a997041'),
(35, 'Joshua Esguerra', '2023-07-20 07:53:54', 'WFH', 'photo_loc', 'Reviewing', '64b8779275c93199182'),
(36, 'Jerene Beatrice Talatala', '2023-07-20 07:55:41', 'WFH', 'photo_loc', 'Reviewing', '64b877fdb99b8356257'),
(37, 'Rena Mae Manuel', '2023-07-20 07:57:15', 'WFH', 'photo_loc', 'Reviewing', '64b8785bb2368341235'),
(38, 'Rommel Acob', '2023-07-20 08:01:53', 'WFH', 'photo_loc', 'Reviewing', '64b879714caa6593322'),
(39, 'Daniella Langres', '2023-07-20 08:03:16', 'WFH', 'photo_loc', 'Reviewing', '64b879c422cec157468'),
(40, 'Juspher Pedrozo', '2023-07-20 08:04:15', 'WFH', 'photo_loc', 'Reviewing', '64b879ff6b497206044'),
(41, 'Patrick Lirom', '2023-07-20 08:04:33', 'WFH', 'photo_loc', 'Reviewing', '64b87a1149247895223'),
(42, 'Joshua Esguerra', '2023-07-21 07:46:43', 'WFH', 'photo_loc', 'Reviewing', '64b9c7633ae5d607445'),
(43, 'Daniella Langres', '2023-07-21 07:50:03', 'WFH', 'photo_loc', 'Reviewing', '64b9c82b6778d842897'),
(44, 'Jerene Beatrice Talatala', '2023-07-21 07:55:53', 'WFH', 'photo_loc', 'Reviewing', '64b9c98986422358683'),
(45, 'Juspher Pedrozo', '2023-07-21 07:56:26', 'WFH', 'photo_loc', 'Reviewing', '64b9c9aad8b61706931'),
(46, 'Rommel Acob', '2023-07-21 08:03:53', 'WFH', 'photo_loc', 'Reviewing', '64b9cb698f168653408'),
(47, 'Viejay Abad', '2023-07-21 12:27:37', 'WFH', 'photo_loc', 'Reviewing', '64ba093933c03764313'),
(48, 'Viejay Abad', '2023-07-21 12:39:09', 'WFH', 'photo_loc', 'Reviewing', '64ba0bedceab1748222'),
(49, 'Cherizza Grace G. Peñafiel', '2023-07-21 12:44:20', 'WFH', 'photo_loc', 'Reviewing', '64ba0d24e4741503305'),
(50, 'Richard A. Araña', '2023-07-21 13:53:47', 'WFH', 'photo_loc', 'Reviewing', '64ba1d6b64137625968'),
(52, 'Richard A. Araña', '2023-07-21 15:49:36', 'WFH', 'photo_loc', 'Reviewing', '64ba38903c2a1470775'),
(56, 'Viejay Abad', '2023-07-21 17:55:52', 'WFH', 'photo_loc', 'Reviewing', '64ba56288f557160655'),
(57, 'Viejay Abad', '2023-07-21 17:56:09', 'WFH', 'photo_loc', 'Reviewing', '64ba56392f364347380'),
(59, 'Joshua Esguerra', '2023-07-24 07:46:54', 'WFH', 'photo_loc', 'Reviewing', '64bdbbee6ead4738291'),
(60, 'Juspher Pedrozo', '2023-07-24 07:47:40', 'WFH', 'photo_loc', 'Reviewing', '64bdbc1cd9b55598371'),
(61, 'Jerene Beatrice Talatala', '2023-07-24 07:49:23', 'WFH', 'photo_loc', 'Reviewing', '64bdbc83cbd9b442613'),
(62, 'Patricia Jamellin V. Bautista', '2023-07-24 07:50:24', 'WFH', 'photo_loc', 'Reviewing', '64bdbcc0a482d454574'),
(63, 'Daniella Langres', '2023-07-24 07:53:00', 'WFH', 'photo_loc', 'Reviewing', '64bdbd5cf1496976579'),
(64, 'Kimberly May L. Sustal', '2023-07-24 07:53:04', 'WFH', 'photo_loc', 'Reviewing', '64bdbd6071962111845'),
(65, 'Mark Jay G. Clemente', '2023-07-24 07:53:43', 'WFH', 'photo_loc', 'Reviewing', '64bdbd8729202693107'),
(66, 'Karl Adrian H. Garcia', '2023-07-24 07:54:39', 'WFH', 'photo_loc', 'Reviewing', '64bdbdbf85f45160011'),
(67, 'Justine Grace Rosarda', '2023-07-24 07:57:35', 'WFH', 'photo_loc', 'Reviewing', '64bdbe6f4534a890326'),
(68, 'Kathrine Nicole S. Fernan', '2023-07-24 07:58:46', 'WFH', 'photo_loc', 'Reviewing', '64bdbeb6f123b823180'),
(69, 'Rene Q. Letegio', '2023-07-24 08:02:31', 'WFH', 'photo_loc', 'Reviewing', '64bdbf9786fef400565'),
(70, 'Louise Akira S. Nieva', '2023-07-24 08:02:50', 'WFH', 'photo_loc', 'Reviewing', '64bdbfaab8e2d126404'),
(71, 'Rommel Acob', '2023-07-24 08:11:19', 'WFH', 'photo_loc', 'Reviewing', '64bdc1a78ccee752144'),
(72, 'Patrick Lirom', '2023-07-24 08:15:47', 'WFH', 'photo_loc', 'Reviewing', '64bdc2b34d8e5614523'),
(73, 'Viejay Abad', '2023-07-24 08:28:17', 'WFH', 'photo_loc', 'No Time-out', '64bdc5a1b48b8954751'),
(74, 'Jazz Jan Gregorio', '2023-07-24 08:42:48', 'WFH', 'photo_loc', 'Reviewing', '64bdc908a3dd3556405'),
(75, 'Casandra M. Santos', '2023-07-24 09:00:18', 'WFH', 'photo_loc', 'Reviewing', '64bdcd22d698f953960'),
(76, 'Julich Enduma', '2023-07-24 09:12:02', 'WFH', 'photo_loc', 'No Time-out', '64bdcfe2c25f5883377'),
(77, 'John Michael V. De Jose', '2023-07-24 11:29:55', 'WFH', 'photo_loc', 'Reviewing', '64bdf03369658325342'),
(78, 'Eugene Gueta', '2023-07-24 17:01:43', 'WFH', 'photo_loc', 'Reviewing', '64be3df7254cb902437'),
(79, 'Charichelle V. Laureles', '2023-07-24 17:12:30', 'WFH', 'photo_loc', 'Reviewing', '64be407ed32e8823156'),
(80, 'Joshua Esguerra', '2023-07-25 07:46:44', 'WFH', 'photo_loc', 'Reviewing', '64bf0d642c83d365617'),
(81, 'Karl Adrian H. Garcia', '2023-07-25 07:47:11', 'WFH', 'photo_loc', 'Reviewing', '64bf0d7f37ff7656191'),
(82, 'Jerene Beatrice Talatala', '2023-07-25 07:47:29', 'WFH', 'photo_loc', 'Reviewing', '64bf0d912daad387318'),
(83, 'Mark Jay G. Clemente', '2023-07-25 07:48:08', 'WFH', 'photo_loc', 'Reviewing', '64bf0db8db535758116'),
(84, 'Eugene Gueta', '2023-07-25 07:48:28', 'WFH', 'photo_loc', 'Reviewing', '64bf0dcc22e5b777937'),
(85, 'Juspher Pedrozo', '2023-07-25 07:49:53', 'WFH', 'photo_loc', 'Reviewing', '64bf0e2145dda611680'),
(86, 'Casandra M. Santos', '2023-07-25 07:51:23', 'WFH', 'photo_loc', 'Reviewing', '64bf0e7b432b1118946'),
(87, 'Daniella Langres', '2023-07-25 07:51:32', 'WFH', 'photo_loc', 'Reviewing', '64bf0e84956a8458012'),
(88, 'Patricia Jamellin V. Bautista', '2023-07-25 07:52:24', 'WFH', 'photo_loc', 'Reviewing', '64bf0eb819438911453'),
(89, 'Patrick Lirom', '2023-07-25 07:52:53', 'WFH', 'photo_loc', 'Reviewing', '64bf0ed58ffa1176857'),
(90, 'Justine Grace Rosarda', '2023-07-25 07:53:55', 'WFH', 'photo_loc', 'Reviewing', '64bf0f13959de427782'),
(91, 'Daniella Langres', '2023-07-25 07:54:30', 'WFH', 'photo_loc', 'No Time-out', '64bf0f362b908361127'),
(92, 'Charichelle V. Laureles', '2023-07-25 07:58:12', 'WFH', 'photo_loc', 'Reviewing', '64bf1014de9a9980370'),
(93, 'Kimberly May L. Sustal', '2023-07-25 07:58:16', 'WFH', 'photo_loc', 'Reviewing', '64bf10189879e331453'),
(94, 'Kathrine Nicole S. Fernan', '2023-07-25 07:58:53', 'WFH', 'photo_loc', 'Reviewing', '64bf103de6c31708179'),
(95, 'Rene Q. Letegio', '2023-07-25 07:59:33', 'WFH', 'photo_loc', 'No Time-out', '64bf1065ada57625845'),
(96, 'Patrick Lirom', '2023-07-25 08:00:26', 'WFH', 'photo_loc', 'Reviewing', '64bf109a46503895133'),
(97, 'Shenna Mae A. Dela Fuente', '2023-07-25 08:57:43', 'WFH', 'photo_loc', 'Reviewing', '64bf1e072f39b258011'),
(98, 'Rubelyn De Jose', '2023-07-25 09:03:23', 'WFH', 'photo_loc', 'Reviewing', '64bf1f5b67249104315'),
(99, 'John Michael V. De Jose', '2023-07-25 09:53:32', 'WFH', 'photo_loc', 'Reviewing', '64bf2b1c480dd744700'),
(100, 'Jazz Jan Gregorio', '2023-07-25 10:48:19', 'WFH', 'photo_loc', 'No Time-out', '64bf37f320141433442'),
(101, 'John Leonard D. Gregorio', '2023-07-25 10:50:04', 'WFH', 'photo_loc', 'No Time-out', '64bf385cb517d826842'),
(102, 'Ichiji Seika', '2023-07-25 08:30:00', 'WFH', 'photo_loc', 'Approved', '64bf88242cc64216590'),
(103, 'Viejay Abad', '2023-07-25 08:02:00', 'WFH', 'photo_loc', 'Reviewing', '64bf88477cc9c218590'),
(104, 'Viejay Abad', '2023-07-25 17:58:06', 'WFH', 'photo_loc', 'Reviewing', '64bf9cae1f868356302'),
(105, 'Joshua Esguerra', '2023-07-26 07:49:09', 'WFH', 'photo_loc', 'Reviewing', '64c05f7516533616757'),
(106, 'Mark Jay G. Clemente', '2023-07-26 07:55:34', 'WFH', 'photo_loc', 'Reviewing', '64c060f673b8b212962'),
(107, 'Juspher Pedrozo', '2023-07-26 07:56:37', 'WFH', 'photo_loc', 'Reviewing', '64c06135cab8b640354'),
(108, 'Patrick Lirom', '2023-07-26 07:59:30', 'WFH', 'photo_loc', 'Reviewing', '64c061e262fb1626422'),
(109, 'Jerene Beatrice Talatala', '2023-07-26 08:08:41', 'WFH', 'photo_loc', 'Reviewing', '64c064091c7ed867150'),
(110, 'Louise Akira S. Nieva', '2023-07-26 08:33:20', 'WFH', 'photo_loc', 'Reviewing', '64c069d018ced479255'),
(111, 'Denber Abuan', '2023-07-26 12:06:00', 'WFH', 'photo_loc', 'Reviewing', '64c09ba853ade540640'),
(116, 'admin', '2023-07-26 16:18:00', 'WFH', 'photo_loc', 'Approved', '64c0d6c001372790763'),
(117, 'Viejay Abad', '2023-07-26 08:00:00', 'WFH', 'photo_loc', 'Approved', '64c0d84ff0a53790003'),
(118, 'Jerene Beatrice Talatala', '2023-07-27 07:43:57', 'WFH', 'photo_loc', 'Reviewing', '64c1afbd210b7147543'),
(119, 'Denber Abuan', '2023-07-27 07:46:43', 'WFH', 'photo_loc', 'Reviewing', '64c1b063c9067415190'),
(120, 'Joshua Esguerra', '2023-07-27 07:47:29', 'WFH', 'photo_loc', 'Reviewing', '64c1b091b0055669629'),
(121, 'Juspher Pedrozo', '2023-07-27 07:51:04', 'WFH', 'photo_loc', 'Reviewing', '64c1b1685e871400681'),
(122, 'Patrick Lirom', '2023-07-27 07:54:07', 'WFH', 'photo_loc', 'Reviewing', '64c1b21f6ef35499086'),
(123, 'Charichelle V. Laureles', '2023-07-27 08:06:50', 'WFH', 'photo_loc', 'Reviewing', '64c1b51a76e05210157'),
(124, 'Karl Adrian H. Garcia', '2023-07-27 08:10:08', 'WFH', 'photo_loc', 'Reviewing', '64c1b5e06b490913695'),
(125, 'Justine Grace Rosarda', '2023-07-27 08:11:44', 'WFH', 'photo_loc', 'Reviewing', '64c1b6405eecc303900'),
(126, 'Julich Enduma', '2023-07-27 09:00:00', 'WFH', 'photo_loc', 'Reviewing', '64c1ec9a1b05d657927'),
(127, 'Richard A. Araña', '2023-07-27 13:34:38', 'WFH', 'photo_loc', 'Reviewing', '64c201eea6261131099'),
(128, 'Cherizza Grace G. Peñafiel', '2023-07-26 07:45:00', 'WFH', 'photo_loc', 'Approved', '64c2026ec84fe845903'),
(129, 'Lina E Hesarza', '2023-07-27 16:49:03', 'WFH', 'photo_loc', 'Reviewing', '64c22f7faff0b201799'),
(130, 'John Michael V. De Jose', '2023-07-27 19:01:42', 'WFH', 'photo_loc', 'Reviewing', '64c24e9640bff570615'),
(131, 'Jerene Beatrice Talatala', '2023-07-28 07:45:42', 'WFH', 'photo_loc', 'Reviewing', '64c301a692d99522341'),
(132, 'Joshua Esguerra', '2023-07-28 07:46:28', 'WFH', 'photo_loc', 'Reviewing', '64c301d4c2667155670'),
(133, 'Lina E Hesarza', '2023-07-28 07:47:16', 'WFH', 'photo_loc', 'Reviewing', '64c302049b9d4666041'),
(134, 'Justine Grace Rosarda', '2023-07-28 07:50:24', 'WFH', 'photo_loc', 'Reviewing', '64c302c0e37ef272265'),
(135, 'Juspher Pedrozo', '2023-07-28 07:51:15', 'WFH', 'photo_loc', 'Reviewing', '64c302f39d907328326'),
(136, 'Denber Abuan', '2023-07-28 07:52:06', 'WFH', 'photo_loc', 'Reviewing', '64c30326633ac276229'),
(137, 'Karl Adrian H. Garcia', '2023-07-28 07:53:06', 'WFH', 'photo_loc', 'Reviewing', '64c303629a02f255551'),
(138, 'Shenna Mae A. Dela Fuente', '2023-07-28 07:53:20', 'WFH', 'photo_loc', 'Reviewing', '64c30370755ce836406'),
(139, 'Charichelle V. Laureles', '2023-07-28 07:53:47', 'WFH', 'photo_loc', 'Reviewing', '64c3038be15a9692923'),
(140, 'Kimberly May L. Sustal', '2023-07-28 07:54:00', 'WFH', 'photo_loc', 'Reviewing', '64c30398c14ed728999'),
(141, 'Patricia Jamellin V. Bautista', '2023-07-28 07:54:53', 'WFH', 'photo_loc', 'Reviewing', '64c303cdc883c189065'),
(142, 'Kathrine Nicole S. Fernan', '2023-07-28 07:57:03', 'WFH', 'photo_loc', 'Reviewing', '64c3044f6b6f6185110'),
(143, 'Patrick Lirom', '2023-07-28 08:00:51', 'WFH', 'photo_loc', 'Reviewing', '64c305337751c897242'),
(144, 'Anna Maria Rogelia T. Almogil', '2023-07-28 08:12:31', 'WFH', 'photo_loc', 'Reviewing', '64c307ef13b0e252403'),
(145, 'Julich Enduma', '2023-07-28 08:58:00', 'WFH', 'photo_loc', 'Approved', '64c313d516ff7760436'),
(146, 'John Michael V. De Jose', '2023-07-28 09:04:27', 'WFH', 'photo_loc', 'Reviewing', '64c3141b1725e883246'),
(147, 'Richard A. Araña', '2023-07-28 09:55:31', 'WFH', 'photo_loc', 'No Time-out', '64c3201340762189991'),
(149, 'admin', '2023-07-28 11:33:44', 'WFH', 'photo_loc', 'Reviewing', '64c3371892581458296'),
(150, 'Viejay Abad', '2023-07-28 12:05:39', 'WFH', 'photo_loc', 'No Time-out', '64c33e939c04f443307'),
(151, 'Rubelyn De Jose', '2023-07-28 12:31:35', 'WFH', 'photo_loc', 'Reviewing', '64c344a7634d7755714'),
(152, 'Maru B. Cunag', '2023-07-28 16:51:45', 'WFH', 'photo_loc', 'Reviewing', '64c381a16fea5241598'),
(153, 'Millicent Joie Gamboa', '2023-07-28 17:01:03', 'WFH', 'photo_loc', 'Reviewing', '64c383cff09be928133'),
(154, 'Milky N. Pagobo', '2023-07-28 17:01:32', 'WFH', 'photo_loc', 'Reviewing', '64c383ec46732772824'),
(155, 'Justine Grace Rosarda', '2023-07-28 17:04:08', 'WFH', 'photo_loc', 'Reviewing', '64c38488c67a5278914'),
(156, 'Patricia Jamellin V. Bautista', '2023-07-29 07:54:36', 'WFH', 'photo_loc', 'Reviewing', '64c4553cc48e6922830'),
(157, 'Maru B. Cunag', '2023-07-29 07:57:48', 'WFH', 'photo_loc', 'Reviewing', '64c455fc0b24d107451'),
(158, 'Kimberly May L. Sustal', '2023-07-29 07:58:41', 'WFH', 'photo_loc', 'Reviewing', '64c4563167828781980'),
(159, 'Kathrine Nicole S. Fernan', '2023-07-29 08:00:16', 'WFH', 'photo_loc', 'Reviewing', '64c456905edee857156'),
(160, 'Milky N. Pagobo', '2023-07-31 06:52:58', 'WFH', 'photo_loc', 'Reviewing', '64c6e9cad481e352290'),
(161, 'Eugene Gueta', '2023-07-31 07:40:31', 'WFH', 'photo_loc', 'Reviewing', '64c6f4ef58087656949'),
(162, 'Jerene Beatrice Talatala', '2023-07-31 07:45:44', 'WFH', 'photo_loc', 'Reviewing', '64c6f6283d88a874610'),
(163, 'Lina E Hesarza', '2023-07-31 07:46:26', 'WFH', 'photo_loc', 'Reviewing', '64c6f65236aaf202456'),
(164, 'Joshua Esguerra', '2023-07-31 07:47:19', 'WFH', 'photo_loc', 'Reviewing', '64c6f68788297123657'),
(165, 'Karl Adrian H. Garcia', '2023-07-31 07:50:22', 'WFH', 'photo_loc', 'Reviewing', '64c6f73e5696f499620'),
(166, 'Kimberly May L. Sustal', '2023-07-31 07:51:45', 'WFH', 'photo_loc', 'Reviewing', '64c6f79126939471302'),
(167, 'Justine Grace Rosarda', '2023-07-31 07:52:13', 'WFH', 'photo_loc', 'Reviewing', '64c6f7ad8adb9290131'),
(168, 'Shenna Mae A. Dela Fuente', '2023-07-31 07:52:24', 'WFH', 'photo_loc', 'Reviewing', '64c6f7b859f2c393328'),
(169, 'Patricia Jamellin V. Bautista', '2023-07-31 07:52:50', 'WFH', 'photo_loc', 'Reviewing', '64c6f7d26051c120660'),
(170, 'Denber Abuan', '2023-07-31 07:53:03', 'WFH', 'photo_loc', 'Reviewing', '64c6f7dfbedd8921716'),
(171, 'Kathrine Nicole S. Fernan', '2023-07-31 07:53:41', 'WFH', 'photo_loc', 'Reviewing', '64c6f805d2436601484'),
(172, 'Patrick Lirom', '2023-07-31 07:55:37', 'WFH', 'photo_loc', 'Reviewing', '64c6f8798741f208797'),
(173, 'Charichelle V. Laureles', '2023-07-31 07:55:55', 'WFH', 'photo_loc', 'Reviewing', '64c6f88b47f80204265'),
(174, 'Maru B. Cunag', '2023-07-31 08:00:02', 'WFH', 'photo_loc', 'Reviewing', '64c6f98272df6362197'),
(175, 'Millicent Joie Gamboa', '2023-07-31 08:00:18', 'WFH', 'photo_loc', 'Reviewing', '64c6f992d029a667121'),
(177, 'Juspher Pedrozo', '2023-07-31 08:09:03', 'WFH', 'photo_loc', 'Reviewing', '64c6fb9f91276119912'),
(178, 'Anna Maria Rogelia T. Almogil', '2023-07-31 08:15:29', 'WFH', 'photo_loc', 'Reviewing', '64c6fd21d3fb4419028'),
(179, 'Nicko V. Reanzares', '2023-07-31 08:23:04', 'WFH', 'photo_loc', 'Reviewing', '64c6fee8824d2192480'),
(180, 'John Michael V. De Jose', '2023-07-31 09:00:45', 'WFH', 'photo_loc', 'Reviewing', '64c707bdc898e832084'),
(181, 'Julich Enduma', '2023-07-31 09:03:28', 'WFH', 'photo_loc', 'Reviewing', '64c70860d6918366280'),
(182, 'Rubelyn De Jose', '2023-07-31 12:54:55', 'WFH', 'photo_loc', 'Reviewing', '64c73e9f3b6b3144666'),
(186, 'Mark Anthony O. Garong', '2023-08-01 07:47:29', 'WFH', 'photo_loc', 'Reviewing', '64c8481123c4d373678'),
(187, 'Lina E Hesarza', '2023-08-01 07:47:39', 'WFH', 'photo_loc', 'Reviewing', '64c8481b87a2b867447'),
(188, 'Joshua Esguerra', '2023-08-01 07:47:50', 'WFH', 'photo_loc', 'Reviewing', '64c8482691649323522'),
(189, 'Patrick Lirom', '2023-08-01 07:48:51', 'WFH', 'photo_loc', 'Reviewing', '64c848632d0c4902269'),
(190, 'Patricia Jamellin V. Bautista', '2023-08-01 07:52:01', 'WFH', 'photo_loc', 'Reviewing', '64c8492175315692620'),
(191, 'Kathrine Nicole S. Fernan', '2023-08-01 07:52:39', 'WFH', 'photo_loc', 'Reviewing', '64c84947e36ce185904'),
(192, 'Jerene Beatrice Talatala', '2023-08-01 07:53:51', 'WFH', 'photo_loc', 'Reviewing', '64c8498fc0c6c495844'),
(193, 'Justine Grace Rosarda', '2023-08-01 07:54:03', 'WFH', 'photo_loc', 'Reviewing', '64c8499bdfd21217578'),
(194, 'Millicent Joie Gamboa', '2023-08-01 07:55:32', 'WFH', 'photo_loc', 'Reviewing', '64c849f42d0e7687605'),
(195, 'Karl Adrian H. Garcia', '2023-08-01 07:58:46', 'WFH', 'photo_loc', 'Reviewing', '64c84ab63c196973021'),
(196, 'Shenna Mae A. Dela Fuente', '2023-08-01 08:00:14', 'WFH', 'photo_loc', 'Reviewing', '64c84b0e30aa7516072'),
(197, 'Denber Abuan', '2023-08-01 08:01:46', 'WFH', 'photo_loc', 'Reviewing', '64c84b6ac1790862961'),
(198, 'Anna Maria Rogelia T. Almogil', '2023-08-01 08:05:42', 'WFH', 'photo_loc', 'Reviewing', '64c84c56e2ac4266147'),
(199, 'Juspher Pedrozo', '2023-08-01 08:07:08', 'WFH', 'photo_loc', 'Reviewing', '64c84cacd09f3469623'),
(200, 'Maru B. Cunag', '2023-08-01 08:10:18', 'WFH', 'photo_loc', 'Reviewing', '64c84d6a18ba4316112'),
(201, 'Kimberly May L. Sustal', '2023-08-01 08:11:34', 'WFH', 'photo_loc', 'Reviewing', '64c84db6c530a591047'),
(202, 'Charichelle V. Laureles', '2023-08-01 08:26:13', 'WFH', 'photo_loc', 'Reviewing', '64c85125084e4509382'),
(203, 'Julich Enduma', '2023-08-01 08:34:30', 'WFH', 'photo_loc', 'Reviewing', '64c85316b3bf0834898'),
(204, 'Rubelyn De Jose', '2023-08-01 08:53:01', 'WFH', 'photo_loc', 'Reviewing', '64c8576d5057a322775'),
(205, 'John Michael V. De Jose', '2023-08-01 09:38:27', 'WFH', 'photo_loc', 'Reviewing', '64c86213da75c212928'),
(212, 'Eugene Gueta', '2023-08-01 16:44:20', 'WFH', 'photo_loc', 'Reviewing', '64c8c5e404cc8653785'),
(213, 'admin', '2023-08-01 17:05:00', '', 'photo_loc', 'No Time-out', '64c8cad96867b553178'),
(217, 'Cherizza Grace G. Peñafiel', '2023-08-02 07:11:09', 'WFH', 'photo_loc', 'No Time-out', '64c9910d0c9ee498648'),
(219, 'Eugene Gueta', '2023-08-02 07:45:36', 'WFH', 'photo_loc', 'Reviewing', '64c999204383e716741'),
(220, 'Juspher Pedrozo', '2023-08-02 07:46:22', 'WFH', 'photo_loc', 'Reviewing', '64c9994ec6676584520'),
(221, 'Lina E Hesarza', '2023-08-02 07:48:20', 'WFH', 'photo_loc', 'Reviewing', '64c999c45c121837032'),
(222, 'Joshua Esguerra', '2023-08-02 07:48:27', 'WFH', 'photo_loc', 'Reviewing', '64c999cb2a3f1297668'),
(223, 'Karl Adrian H. Garcia', '2023-08-02 07:50:13', 'WFH', 'photo_loc', 'Reviewing', '64c99a3527728102985'),
(224, 'Mark Anthony O. Garong', '2023-08-02 07:51:26', 'WFH', 'photo_loc', 'Reviewing', '64c99a7eadb87151762'),
(225, 'Patricia Jamellin V. Bautista', '2023-08-02 07:53:09', 'WFH', 'photo_loc', 'Reviewing', '64c99ae59f7a2392408'),
(226, 'Maru B. Cunag', '2023-08-02 07:53:46', 'WFH', 'photo_loc', 'Reviewing', '64c99b0a02a02807141'),
(227, 'Charichelle V. Laureles', '2023-08-02 07:54:20', 'WFH', 'photo_loc', 'Reviewing', '64c99b2c7c6be346067'),
(228, 'Kimberly May L. Sustal', '2023-08-02 07:55:16', 'WFH', 'photo_loc', 'Reviewing', '64c99b6436aa2897464'),
(229, 'Millicent Joie Gamboa', '2023-08-02 07:55:29', 'WFH', 'photo_loc', 'Reviewing', '64c99b711e55a404573'),
(230, 'Justine Grace Rosarda', '2023-08-02 07:55:34', 'WFH', 'photo_loc', 'Reviewing', '64c99b76d6e28588955'),
(231, 'Kathrine Nicole S. Fernan', '2023-08-02 07:57:47', 'WFH', 'photo_loc', 'Reviewing', '64c99bfbb6fb6994591'),
(232, 'Denber Abuan', '2023-08-02 07:58:05', 'WFH', 'photo_loc', 'Reviewing', '64c99c0dbd5e1628530'),
(233, 'Shenna Mae A. Dela Fuente', '2023-08-02 08:00:39', 'WFH', 'photo_loc', 'Reviewing', '64c99ca73e411193178'),
(234, 'Rubelyn De Jose', '2023-08-02 08:02:07', 'WFH', 'photo_loc', 'Reviewing', '64c99cff27bdc987795'),
(235, 'Anna Maria Rogelia T. Almogil', '2023-08-02 08:10:54', 'WFH', 'photo_loc', 'No Time-out', '64c99f0e9ae15843482'),
(236, 'Jazz Jan D. Gregorio', '2023-08-02 08:15:17', 'WFH', 'photo_loc', 'Reviewing', '64c9a015daf3f906933'),
(237, 'Julich Enduma', '2023-08-02 09:02:18', 'WFH', 'photo_loc', 'No Time-out', '64c9ab1aa87f8465877'),
(238, 'John Michael V. De Jose', '2023-08-02 09:58:53', 'WFH', 'photo_loc', 'Reviewing', '64c9b85dee637323854'),
(239, 'admin', '2023-08-02 17:30:00', '', 'photo_loc', 'No Time-out', '64ca22447a90b882583'),
(240, 'Anna Maria Rogelia T. Almogil', '2023-08-03 07:42:41', 'WFH', 'photo_loc', 'Reviewing', '64cae9f16a469578438'),
(241, 'Lina E Hesarza', '2023-08-03 07:42:52', 'WFH', 'photo_loc', 'Reviewing', '64cae9fc3b29d871190'),
(242, 'Eugene Gueta', '2023-08-03 07:43:50', 'WFH', 'photo_loc', 'Reviewing', '64caea3681324442766'),
(243, 'Patrick Lirom', '2023-08-03 07:46:21', 'WFH', 'photo_loc', 'Reviewing', '64caeacd9cecd232418'),
(244, 'Juspher Pedrozo', '2023-08-03 07:46:37', 'WFH', 'photo_loc', 'Reviewing', '64caeadd58e39194032'),
(245, 'Joshua Esguerra', '2023-08-03 07:46:43', 'WFH', 'photo_loc', 'No Time-out', '64caeae341e3c696341'),
(246, 'Mark Anthony O. Garong', '2023-08-03 07:48:15', 'WFH', 'photo_loc', 'No Time-out', '64caeb3f35974671027'),
(247, 'Karl Adrian H. Garcia', '2023-08-03 07:49:39', 'WFH', 'photo_loc', 'Reviewing', '64caeb93e1944843104'),
(248, 'Denber Abuan', '2023-08-03 07:50:43', 'WFH', 'photo_loc', 'Reviewing', '64caebd3614ad854229'),
(249, 'Patricia Jamellin V. Bautista', '2023-08-03 07:51:10', 'WFH', 'photo_loc', 'Reviewing', '64caebeed8c9b658794'),
(250, 'Kimberly May L. Sustal', '2023-08-03 07:51:26', 'WFH', 'photo_loc', 'Reviewing', '64caebfe3088e150430'),
(251, 'Justine Grace Rosarda', '2023-08-03 07:52:16', 'WFH', 'photo_loc', 'Reviewing', '64caec30be768816191'),
(252, 'Maru B. Cunag', '2023-08-03 07:53:53', 'WFH', 'photo_loc', 'Reviewing', '64caec91a5141576386'),
(253, 'Millicent Joie Gamboa', '2023-08-03 07:56:07', 'WFH', 'photo_loc', 'Reviewing', '64caed171696d497004'),
(254, 'Shenna Mae A. Dela Fuente', '2023-08-03 08:00:05', 'WFH', 'photo_loc', 'Reviewing', '64caee0571fa8381086'),
(255, 'Kathrine Nicole S. Fernan', '2023-08-03 08:01:05', 'WFH', 'photo_loc', 'Reviewing', '64caee41b33d0200176'),
(256, 'Rubelyn De Jose', '2023-08-03 08:05:58', 'WFH', 'photo_loc', 'Reviewing', '64caef66c58b2618765'),
(257, 'Jazz Jan D. Gregorio', '2023-08-03 08:25:39', 'WFH', 'photo_loc', 'Reviewing', '64caf40314dd0900762'),
(258, 'Charichelle V. Laureles', '2023-08-03 08:55:20', 'WFH', 'photo_loc', 'Reviewing', '64cafaf8293e9647563'),
(259, 'Julich Enduma', '2023-08-03 08:51:00', '', 'photo_loc', 'Reviewing', '64cafea73c054788080'),
(260, 'John Michael V. De Jose', '2023-08-03 09:52:22', 'WFH', 'photo_loc', 'Reviewing', '64cb08567057a723546'),
(261, 'Eugene Gueta', '2023-08-04 07:45:42', 'WFH', 'photo_loc', 'No Time-out', '64cc3c26b1d81167951'),
(262, 'Kimberly May L. Sustal', '2023-08-04 07:45:59', 'WFH', 'photo_loc', 'No Time-out', '64cc3c3750ecc661602'),
(263, 'Joshua Esguerra', '2023-08-04 07:46:25', 'WFH', 'photo_loc', 'No Time-out', '64cc3c51b8644700283'),
(264, 'Maru B. Cunag', '2023-08-04 07:48:21', 'WFH', 'photo_loc', 'No Time-out', '64cc3cc56a100963639'),
(265, 'Charichelle V. Laureles', '2023-08-04 07:50:17', 'WFH', 'photo_loc', 'No Time-out', '64cc3d3971201437028'),
(266, 'Denber Abuan', '2023-08-04 07:50:54', 'WFH', 'photo_loc', 'No Time-out', '64cc3d5e647c9804056'),
(267, 'Patricia Jamellin V. Bautista', '2023-08-04 07:53:02', 'WFH', 'photo_loc', 'No Time-out', '64cc3dde535c7590764'),
(268, 'Juspher Pedrozo', '2023-08-04 07:53:33', 'WFH', 'photo_loc', 'No Time-out', '64cc3dfdd0095474530'),
(269, 'Justine Grace Rosarda', '2023-08-04 07:53:46', 'WFH', 'photo_loc', 'No Time-out', '64cc3e0a5dfc7751459'),
(270, 'Kathrine Nicole S. Fernan', '2023-08-04 07:55:43', 'WFH', 'photo_loc', 'No Time-out', '64cc3e7fcdb9e386509'),
(271, 'Karl Adrian H. Garcia', '2023-08-04 07:58:06', 'WFH', 'photo_loc', 'No Time-out', '64cc3f0e8556b809460'),
(272, 'Millicent Joie Gamboa', '2023-08-04 07:58:25', 'WFH', 'photo_loc', 'No Time-out', '64cc3f21ba829826944'),
(273, 'Patrick Lirom', '2023-08-04 08:00:02', 'WFH', 'photo_loc', 'No Time-out', '64cc3f826f1ba641176'),
(274, 'Shenna Mae A. Dela Fuente', '2023-08-04 08:00:08', 'WFH', 'photo_loc', 'No Time-out', '64cc3f88ed56c426194'),
(275, 'Anna Maria Rogelia T. Almogil', '2023-08-04 08:06:59', 'WFH', 'photo_loc', 'No Time-out', '64cc4123517aa880264'),
(276, 'Rubelyn De Jose', '2023-08-04 08:10:02', 'WFH', 'photo_loc', 'No Time-out', '64cc41daa6044634715');

-- --------------------------------------------------------

--
-- Table structure for table `time_out`
--

CREATE TABLE `time_out` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `overtime` int(2) NOT NULL DEFAULT 0,
  `hours` int(2) NOT NULL DEFAULT 0,
  `tasks` varchar(400) DEFAULT 'none',
  `approval` enum('Approved','Reviewing','Denied','No Time-out') NOT NULL DEFAULT 'No Time-out',
  `token` varchar(255) NOT NULL DEFAULT 'no token generated'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `time_out`
--

INSERT INTO `time_out` (`id`, `name`, `datetime`, `overtime`, `hours`, `tasks`, `approval`, `token`) VALUES
(20, 'Gabriel Terrence Garcia', '2023-06-26 17:00:00', 0, 8, 'none', 'Approved', '23c3063a10950661'),
(21, 'Louise Akira S. Nieva', '2023-06-26 17:00:00', 0, 8, 'none', 'Denied', '9d759268e16f9f9c'),
(22, 'Louise Akira S. Nieva', '2023-07-01 14:00:13', 0, -1, 'Testing this po. This field po requires a minimum of 50 characters para po hindi pwedeng minimal lang ilagay po.', 'Reviewing', '649fc046344ab472262'),
(23, 'Louise Akira S. Nieva', '2023-07-19 17:33:27', 0, 7, 'tesadfasdfasdfasdfasdfasdfasdf', 'Reviewing', '64b7369d81fcc370201'),
(24, 'Louise Akira S. Nieva', '2023-07-19 17:55:28', 0, -1, '-Testing\r\n-Testing\r\n-tesgintasdf', 'Reviewing', '64b7b30257d58850875'),
(25, 'Louise Akira S. Nieva', '2023-07-19 17:55:56', 0, -1, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa, a,a,,,a fasdfaAMASDF ,ASDFASDF AND DAetsetsadnfkad,\r\n', 'Reviewing', '64b7b31c28c3a997041'),
(26, 'Joshua Esguerra', '2023-07-20 16:48:05', 0, 8, 'pagination of admin dash, shows if announcements are available or not, shows the latest announcement', 'Reviewing', '64b8779275c93199182'),
(27, 'Jerene Beatrice Talatala', '2023-07-20 16:55:37', 0, 8, 'Posted a pubmat on Facebook, Meetup with our supervisor to be informed about being TL, Analytics for FB for the past 28 days', 'Reviewing', '64b877fdb99b8356257'),
(28, 'Rena Mae Manuel', '2023-08-02 23:00:00', 0, 0, 'none', 'No Time-out', '64b8785bb2368341235'),
(29, 'Rommel Acob', '2023-07-20 16:51:29', 0, 8, 'Passed A video for outgoing interns', 'Reviewing', '64b879714caa6593322'),
(30, 'Daniella Langres', '2023-07-20 16:59:43', 0, 8, 'Facebook posting and publication materials', 'Reviewing', '64b879c422cec157468'),
(31, 'Juspher Pedrozo', '2023-07-20 16:51:02', 0, 8, 'Posted approved pubmats before lunch. After lunch, met with our Supervisor Mr. Viejay about becoming the TM for the IT Department. Afterwards, created a pubmat for hiring of Marketing Interns while the other socmed members created the pubmat for other departments.', 'Reviewing', '64b879ff6b497206044'),
(32, 'Patrick Lirom', '2023-07-20 16:57:41', 0, 8, 'Started production of a video (What is Auditing?)\r\nProduction to be continued tomorrow.', 'Reviewing', '64b87a1149247895223'),
(33, 'Joshua Esguerra', '2023-07-21 16:47:48', 0, 8, 'fixing debugs in timein/ timeout, created account list page', 'Reviewing', '64b9c7633ae5d607445'),
(34, 'Daniella Langres', '2023-07-21 16:47:21', 0, 8, 'Attended the general weekly meeting.\r\nFB postings/pubmats', 'Reviewing', '64b9c82b6778d842897'),
(35, 'Jerene Beatrice Talatala', '2023-07-21 16:57:49', 0, 8, 'Posted a pubmat on FB, started my responsibilities as tl of it interns by starting and recording the weekly meeting. \r\n', 'Reviewing', '64b9c98986422358683'),
(36, 'Juspher Pedrozo', '2023-07-21 16:52:54', 0, 8, 'Managed the page this morning by posting a pubmat, and assisting other members of socmed team on what to do, attended the general weekly meeting as well. Volunteered for the task by Maam Cherizza, still standing by. ', 'Reviewing', '64b9c9aad8b61706931'),
(37, 'Rommel Acob', '2023-07-24 08:11:06', 0, 71, 'Testing testing testgin eteisndnfnffe sndnfndjene', 'Reviewing', '64b9cb698f168653408'),
(38, 'Viejay Abad', '2023-07-21 12:35:58', 0, -1, 'testing only Testing only  testing only Testing only testing only Testing only testing only Testing only testing only Testing only testing only Testing only testing only Testing only testing only Testing only testing only Testing only testing only Testing only testing only Testing only testing only Testing only ', 'Reviewing', '64ba093933c03764313'),
(39, 'Viejay Abad', '2023-07-21 17:39:55', 0, 4, ' TESTING ONLYTESTING ONLYTESTING ONLYTESTING ONLYTESTING ONLYTESTING ONLY', 'Reviewing', '64ba0bedceab1748222'),
(40, 'Cherizza Grace G. Peñafiel', '2023-08-02 23:00:00', 0, 0, 'none', 'No Time-out', '64ba0d24e4741503305'),
(41, 'Richard A. Araña', '2023-07-21 14:24:34', 0, 0, 'Conversation at messenger GC and checking for the other branches GL send in the messenger chat.\r\nChecking the send Excel files for Other Branches GL and reporting that there is no Other Branches file there.\r\nInform the assign personnel about the need docs for Other Branches Bank Recon.', 'Reviewing', '64ba1d6b64137625968'),
(43, 'Richard A. Araña', '2023-07-21 18:00:40', 0, 1, 'Conversation again with Ms. Justin regards about the excel file in messenger.\r\nSending Screenshot for the docs of excel that the docs is not the file that we need.\r\nCoordinating the documents that needed for Bank Recon of Other Branches.', 'Reviewing', '64ba38903c2a1470775'),
(47, 'Viejay Abad', '2023-07-21 17:55:59', 0, -1, 'testing onlytesting onlytesting onlytesting onlytesting onlytesting onlytesting onlytesting onlytesting only', 'Reviewing', '64ba56288f557160655'),
(48, 'Viejay Abad', '2023-07-21 17:56:23', 0, -1, 'testing onlytesting onlytesting onlytesting onlytesting only', 'Reviewing', '64ba56392f364347380'),
(50, 'Joshua Esguerra', '2023-07-24 16:48:52', 0, 8, 'managed pull requests and resolve merge conflicts, listed issues with AMS, researched about web hosting and domain', 'Reviewing', '64bdbbee6ead4738291'),
(51, 'Juspher Pedrozo', '2023-07-24 16:52:53', 0, 8, 'Reassigned to content creation, checked the list of topics and listed topics that I will produce before putting my name on the produced by section of the table. Presented the IT Department updates on the General Weekly Meeting. Prepared my video editor (updates and stock footage sources).', 'Reviewing', '64bdbc1cd9b55598371'),
(52, 'Jerene Beatrice Talatala', '2023-07-24 16:52:16', 0, 8, '\r\nRecorded the orientation and weekly meeting, Video production in progress', 'Reviewing', '64bdbc83cbd9b442613'),
(53, 'Patricia Jamellin V. Bautista', '2023-07-24 17:12:03', 0, 8, '- Filed 2551Q of DRF Food Cart of Team 12.\r\n- Transfer transactions from encoded receipts to CDB of Wise Coffee and AB Skyreme.\r\n- Classified the type of accounts of encoded transactions in the CDB of Wise Coffee and AB Skyreme.\r\n- Input amounts in GL-RE of Wise Coffee.\r\n- Input amounts in GL-ALE and GL-RE of AB Skyreme.\r\n- Assisted the Sir Royce auditor on-site in sorting sales records for 2022.', 'Reviewing', '64bdbcc0a482d454574'),
(54, 'Daniella Langres', '2023-07-24 16:53:36', 0, 8, 'Video production in progress..', 'Reviewing', '64bdbd5cf1496976579'),
(55, 'Kimberly May L. Sustal', '2023-07-24 16:59:50', 0, 8, '* Onsite internship at Naic, Cavite\r\n* Check available receipts in receipt encoding folder (gdrive)\r\n* Encode expense receipts to CDB of Team 7A client for the month of June.\r\n* Classify what type of expense the receipts encoded\r\n* Check working paper of Team 7A\r\n* Organized chart of account number at General Ledger\r\n* Sort receipt & assist Sir Royce in auditing', 'Reviewing', '64bdbd6071962111845'),
(56, 'Mark Jay G. Clemente', '2023-07-24 16:54:41', 0, 8, 'I did AMS development. The manual in/out part', 'Reviewing', '64bdbd8729202693107'),
(57, 'Karl Adrian H. Garcia', '2023-07-24 16:57:38', 0, 8, 'Social media team creation of publication materials for facebook', 'Reviewing', '64bdbdbf85f45160011'),
(58, 'Justine Grace Rosarda', '2023-07-24 17:04:05', 0, 8, '', 'Reviewing', '64bdbe6f4534a890326'),
(59, 'Kathrine Nicole S. Fernan', '2023-07-24 16:59:23', 0, 8, 'July 24, 2023\r\nOnsite Internship\r\n\r\n- Timed in\r\n- Checked the newly encoded receipts in the ODB files\r\n- Transferred the new receipts in the working paper of ODB\r\n- Re-organized the GL of ODB\r\n- Sort Receipts and assisted Sir Royce in auditing\r\n- Timed out', 'Reviewing', '64bdbeb6f123b823180'),
(60, 'Rene Q. Letegio', '2023-07-24 17:12:09', 0, 8, '- Checking of csk communication area for task needed to be done for the website\r\n- Memo Layout Creation\r\n- Attended the Orientation Meeting\r\n- Pubmat for posting\r\n- Attended the General Weekly Meeting', 'Reviewing', '64bdbf9786fef400565'),
(61, 'Louise Akira S. Nieva', '2023-07-24 17:08:30', 0, 8, 'AMS Development, IT Interns Concerns, Other Departments Concerns, and Researching for AMS.', 'Reviewing', '64bdbfaab8e2d126404'),
(62, 'Rommel Acob', '2023-07-24 16:48:10', 0, 8, 'Attended our weekly general meeting.', 'Reviewing', '64bdc1a78ccee752144'),
(63, 'Patrick Lirom', '2023-07-24 17:00:37', 0, 8, 'Attended two meetings.\r\nWeekly rotation was conducted and familiarization with the tasks of web development team.', 'Reviewing', '64bdc2b34d8e5614523'),
(64, 'Viejay Abad', '2023-08-02 23:00:00', 0, 0, 'none', 'No Time-out', '64bdc5a1b48b8954751'),
(65, 'Jazz Jan Gregorio', '2023-07-25 10:48:11', 0, 25, 'Evaluation of outgoing interns\r\nCOC of outgoing interns\r\nemail assist', 'Reviewing', '64bdc908a3dd3556405'),
(66, 'Casandra M. Santos', '2023-07-24 17:08:17', 0, 7, 'Task accomplished \r\n~shared csk services/ intern poster/ bookkeeping tutorial\r\n~ email the respondent for the booking tutorial\r\n~ fb page posting ( bookkeeping tutorial)\r\n~ attended weekly meeting \r\n~monitor  gform for bookkeeping tutorials ', 'Reviewing', '64bdcd22d698f953960'),
(67, 'Julich Enduma', '2023-08-02 23:00:00', 0, 0, 'none', 'No Time-out', '64bdcfe2c25f5883377'),
(68, 'John Michael V. De Jose', '2023-07-24 19:30:22', 0, 7, 'Received and checked marketing outputs', 'Reviewing', '64bdf03369658325342'),
(69, 'Eugene Gueta', '2023-07-24 17:02:34', 0, -1, 'creating edit video and attending general meeting', 'Reviewing', '64be3df7254cb902437'),
(70, 'Charichelle V. Laureles', '2023-07-25 07:58:03', 0, 14, 'Filed BIR Form 2551Q and 1601EQ of ADEOMS \r\nDeployed and Oriented two new interns in Accounting Department\r\nWorked back the deferred output of Team 11\r\nHelped Ma’am Che in tracing the source of discrepancies in June FS Review\r\nCommunicated and Updated BIR Tracker for 2551Q, 2550Q and 1601EQ\r\nTaught new intern in downloading e-BIR \r\nRechecked the output of intern in Team 12 — adjustments made\r\n', 'Reviewing', '64be407ed32e8823156'),
(71, 'Joshua Esguerra', '2023-07-25 16:57:51', 0, 8, 'exported dtr adjusted, updated files hostinger', 'Reviewing', '64bf0d642c83d365617'),
(72, 'Karl Adrian H. Garcia', '2023-07-26 16:52:04', 0, 32, 'Help the Accounting Team to have a backup for the files ad photos needed for safety as the CEO\'s account have been compromised.', 'Reviewing', '64bf0d7f37ff7656191'),
(73, 'Jerene Beatrice Talatala', '2023-07-26 08:08:37', 0, 23, 'For ulet ng time in time out at nagloloko ang a s', 'Reviewing', '64bf0d912daad387318'),
(74, 'Mark Jay G. Clemente', '2023-07-26 07:55:30', 0, 23, 'AMS development. Summary view.', 'Reviewing', '64bf0db8db535758116'),
(75, 'Eugene Gueta', '2023-07-28 16:56:38', 0, 80, 'Creating video for content creator and attending meeting', 'Reviewing', '64bf0dcc22e5b777937'),
(76, 'Juspher Pedrozo', '2023-07-26 07:56:31', 0, 23, 'Already timed out in webhost AMS, activities yesterday are started on content creation editing and started on urgent task (backing up files)', 'Reviewing', '64bf0e2145dda611680'),
(77, 'Casandra M. Santos', '2023-07-27 18:19:59', 0, 57, 'Shared csk services intern poster, bookkeeping tutorials\r\nAnswer inquiries about internship', 'Reviewing', '64bf0e7b432b1118946'),
(78, 'Daniella Langres', '2023-07-25 07:53:33', 0, -1, 'Attended weekly meeting. Video edit processing', 'Reviewing', '64bf0e84956a8458012'),
(79, 'Patricia Jamellin V. Bautista', '2023-07-27 17:02:20', 0, 56, 'July 27, 2023\r\n\r\n- Input journal entries in GJ of LMW and AB Skyreme for the month of May.\r\n- Input amounts in trial balance of LMW and AB Skyreme for May.\r\n- Updated GL-ALE and GL-RE of Wise Coffee.\r\n- Filed 1601-EQ of DRF Food Cart.\r\n- Cross-checked amounts in DRF Food Cart Database\r\n- Assist Ms. Cha on updating the Trial Balance, GL, GJ, IS, and SCOE of DRF Food Cart for 2nd Quarter.', 'Reviewing', '64bf0eb819438911453'),
(80, 'Patrick Lirom', '2023-07-25 08:00:00', 0, -1, 'Attended two weekly meetings.\r\nTeam rotation was conducted and the tasks for the web development team was familiarized.', 'Reviewing', '64bf0ed58ffa1176857'),
(81, 'Justine Grace Rosarda', '2023-07-27 08:11:12', 0, 47, '1. Download the RCBC GL of Other Branches and upload in GDrive\r\n2. Disseminate the file of GL to the Group Chat and specific assigned person to Reconcile it\r\n3. Make turnover report regarding to Team 13 email report and turnover it to Ms. Cha\r\n4. Searched and download na pdf BIR Confirmation of KTYM\r\n5. Answer and give all the needs of Ms Rosyl and Ms Cha\r\n6. Collect the files and screenshot the s', 'Reviewing', '64bf0f13959de427782'),
(82, 'Daniella Langres', '2023-08-02 23:00:00', 0, 0, 'none', 'No Time-out', '64bf0f362b908361127'),
(83, 'Charichelle V. Laureles', '2023-07-27 08:06:41', 0, 47, 'Organized files in Team 9\'s folder and communicated with old handler the missing BIR forms\r\nCoordinated with IT Department with the transfer of important files from messenger to GDrive\r\nTaught Ms. Millicent in doing PRF Forms and bank transactions for Team 11\r\nWorked back the working paper of DRF Foodcart and fixed the overstatement of Sales and Cash - 1st quarter done\r\nPrepared PRF Form for Cash ', 'Reviewing', '64bf1014de9a9980370'),
(84, 'Kimberly May L. Sustal', '2023-07-27 17:00:32', 0, 56, '* Checked Team 7A working paper\r\n* Encode May CDB receipts on ODB database\r\n*Classify what type of expense I encoded\r\n* Updates GL RE 2023\r\n* Cross checked the receipts to GL\r\n*Updates GL for the month of May\r\n', 'Reviewing', '64bf10189879e331453'),
(85, 'Kathrine Nicole S. Fernan', '2023-07-27 17:04:18', 0, 56, '- Timed in\r\n- Checked for newly encoded receipts\r\n- Opened and checked businesses under Team 7\r\n- Crossed checked the encoded receipts posted on the CRB\r\n- Checked the GL\r\n- Timed out', 'Reviewing', '64bf103de6c31708179'),
(86, 'Rene Q. Letegio', '2023-08-02 23:00:00', 0, 0, 'none', 'No Time-out', '64bf1065ada57625845'),
(87, 'Patrick Lirom', '2023-07-26 07:59:25', 0, 23, 'Timed out at the old URL yesterday', 'Reviewing', '64bf109a46503895133'),
(88, 'Shenna Mae A. Dela Fuente', '2023-07-27 17:00:14', 0, 55, '-update the monitoring records\r\n-post looking for interns ad in facebook\r\n-made an announcement regarding the new ams link in different department gcs\r\n-communicate ams concerns/problems of interns to the IT dept\r\n-sent out monitoring forms to different department\r\n', 'Reviewing', '64bf1e072f39b258011'),
(89, 'Rubelyn De Jose', '2023-07-28 12:31:28', 0, 74, 'dfddggdgddgddgdgdgdgdgdgdgdgdgdgdgdgddgdgdgd', 'Reviewing', '64bf1f5b67249104315'),
(90, 'John Michael V. De Jose', '2023-07-27 19:01:36', 0, 56, '1.) Received Outputs from mktg interns\r\n2.) Checked Outputs from mktg interns\r\n3.) Given task to mktg interns', 'Reviewing', '64bf2b1c480dd744700'),
(91, 'Jazz Jan Gregorio', '2023-08-02 23:00:00', 0, 0, 'none', 'No Time-out', '64bf37f320141433442'),
(92, 'John Leonard D. Gregorio', '2023-08-02 23:00:00', 0, 0, 'none', 'No Time-out', '64bf385cb517d826842'),
(93, 'Ichiji Seika', '2023-07-25 00:00:00', 0, -10, 'Manual time/out', 'Approved', '64bf88242cc64216590'),
(94, 'Viejay Abad', '2023-07-25 17:56:00', 0, 9, 'Testing testing testingTesting testing testingTesting testing testing', 'Reviewing', '64bf9c8da4006132586'),
(95, 'Viejay Abad', '2023-07-25 17:58:15', 0, -1, 'Testing testing testingTesting testing testingTesting testing testingTesting testing testing', 'Reviewing', '64bf9cae1f868356302'),
(96, 'Joshua Esguerra', '2023-07-26 16:55:11', 0, 8, 'fixed error in timeout, implemented new access control for admins, listed bugs and fixes', 'Reviewing', '64c05f7516533616757'),
(97, 'Mark Jay G. Clemente', '2023-07-26 17:02:37', 0, 8, 'AMS development the summary view', 'Reviewing', '64c060f673b8b212962'),
(98, 'Juspher Pedrozo', '2023-07-26 16:52:21', 0, 8, 'Before shift, assisted Ma\'am Cherizza because of the Facebook Hacked account. Posted warnings on the CSK page. Then, worked on the urgent task in uploading reports from group chats to the GDrive of respective teams and Teams chat of the said teams. After lunch, worked on emailing the other owners of files in the Gdrive and accepted some requests of transferring ownership to Ma\'am Cherizza (her gma', 'Reviewing', '64c06135cab8b640354'),
(99, 'Patrick Lirom', '2023-07-26 17:04:15', 0, 8, 'Rendered assistance for an urgent task regarding file uploads.\r\nContinued working on another urgent task regarding about file ownership transfer.', 'Reviewing', '64c061e262fb1626422'),
(100, 'Jerene Beatrice Talatala', '2023-07-26 16:57:46', 0, 8, 'Transferred the files from fb messenger gc Team 10 to google drive. Continued emailing others to request for transfer of ownership.', 'Reviewing', '64c064091c7ed867150'),
(101, 'Louise Akira S. Nieva', '2023-07-26 12:20:46', 0, 3, 'Doing minor things for the transferring of development of the AMS', 'Reviewing', '64c069d018ced479255'),
(102, 'Denber Abuan', '2023-07-27 07:46:37', 0, 19, 'Team 1\r\n- Analyzed the PACEVHAI CRB and CDB with Treasurer\'s Book for 2020\r\n- Updated the PACEVHAI CRB and CDB with Treasurer\'s Book for 2020\r\n- Started working on 2021', 'Reviewing', '64c09ba853ade540640'),
(107, 'admin', '2023-07-26 00:00:00', 0, -17, 'Manual time/out', 'Approved', '64c0d6c001372790763'),
(108, 'Viejay Abad', '2023-07-26 12:00:00', 0, 3, 'Manual time/out', 'Approved', '64c0d84ff0a53790003'),
(109, 'Jerene Beatrice Talatala', '2023-07-27 16:45:22', 0, 8, 'Assisted in downloading and transfering files from CSK drive folders.', 'Reviewing', '64c1afbd210b7147543'),
(110, 'Denber Abuan', '2023-07-27 16:50:52', 0, 8, 'Team 1 - Reconciled Cash balances of ADEOMS from Jan 2021 to Jun 2021', 'Reviewing', '64c1b063c9067415190'),
(111, 'Joshua Esguerra', '2023-07-27 16:51:38', 0, 8, 'summary view webpage filter and data retrieve', 'Reviewing', '64c1b091b0055669629'),
(112, 'Juspher Pedrozo', '2023-07-27 16:53:35', 0, 8, 'Worked on the urgent task of backing up drive. Waited for emails and accepted the transfer of ownership requests. Afterwards, assessed the file size of the whole \"CHRISIMM SENTIMO KUMON FILES\" folder so the backup towards the OneDrive can commence.', 'Reviewing', '64c1b1685e871400681'),
(113, 'Patrick Lirom', '2023-07-27 16:55:46', 0, 8, 'Assisted in checking and backing up of files in Google Drive.', 'Reviewing', '64c1b21f6ef35499086'),
(114, 'Charichelle V. Laureles', '2023-07-27 17:11:55', 0, 8, '- Computed and filled out BIR Form No. 1601EQ of Maxspeed for the second quarter - still waiting for approval\r\n- Meeting with Ms. Millicent & Mr. Maru and taught them the basic steps of BIR Filing\r\n- Reminded new interns of their requirements and daily accomplishment reports. \r\n- Finalized the quarter 1 and quarter 2 FS of DRF Foodcart - asked help from Ms. Patricia with the finalization of quarte', 'Reviewing', '64c1b51a76e05210157'),
(115, 'Karl Adrian H. Garcia', '2023-07-27 17:12:17', 0, 8, 'Social media management (posting of pubmats on facebook page)', 'Reviewing', '64c1b5e06b490913695'),
(116, 'Justine Grace Rosarda', '2023-07-27 17:12:34', 0, 8, '1. Download the RCBC Outdtanding of Leasing HO and upload in GDrive\r\n2. Disseminate the file of Outstanding Checks to the Group Chat\r\n3. Reconcile the RCBC Rental - Other Banks\r\n4. Guiding and giving all the needs of Sir Denber for Team 1\r\n5. Answer and help interns under my team regarding to their concern in their assigned teams\r\n6. Collect the files and screenshot the summary of RCBC report for ', 'Reviewing', '64c1b6405eecc303900'),
(117, 'Julich Enduma', '2023-07-27 19:13:00', 0, 9, 'Manual time/out', 'Approved', '64c2880812915299869'),
(118, 'Richard A. Araña', '2023-07-27 22:07:52', 0, 8, 'Finish the Bank Recon for CEB - JUNE 2023 (RCBC)\r\nAssisting/Helping Ms. Justin regards about the GL and BS and input on BookAdj.\r\nFinish the Bank Recon for DAG - MAY 2023 (RCBC)\r\nAnswering the Concern of Ma\'am Karla about CDO Bank Recon 2023\r\nFinish the Bank Recon for DAG - JUNE 2023 (RCBC)\r\nContinuing Bank Recon for DAV - APR 2023', 'Reviewing', '64c201eea6261131099'),
(119, 'Cherizza Grace G. Peñafiel', '2023-07-26 21:30:00', 0, 13, 'Manual time/out', 'Approved', '64c2026ec84fe845903'),
(120, 'Lina E Hesarza', '2023-07-27 16:50:55', 0, -1, 'Shared csk services\r\nShared internship post and commenting to the group of internship. \r\nComment to the client', 'Reviewing', '64c22f7faff0b201799'),
(121, 'John Michael V. De Jose', '2023-07-27 19:03:07', 0, -1, '1.) Given task to mktg interns\r\n2.) received outputs from mktg interns\r\n3.) checked outputs of mktg interns', 'Reviewing', '64c24e9640bff570615'),
(122, 'Jerene Beatrice Talatala', '2023-07-28 16:51:58', 0, 8, 'Assisted in creating an ID template for TJ kramer.', 'Reviewing', '64c301a692d99522341'),
(123, 'Joshua Esguerra', '2023-07-28 16:48:43', 0, 8, 'summary view page, adjusted database for interns, resolve time in update issue', 'Reviewing', '64c301d4c2667155670'),
(124, 'Lina E Hesarza', '2023-07-28 16:54:35', 0, 8, 'Shared and posting csk services, bookkeepong tutorial and shared internship post. ', 'Reviewing', '64c302049b9d4666041'),
(125, 'Justine Grace Rosarda', '2023-07-28 17:02:00', 0, 8, '\r\n    1. Provide all the need report of Ms. Hazel\r\n    2.Guide Sir Denber regarding to the files that he needs to update in Team 1\r\n    3.Giving Team 3 access to Ms. Millecent and guide her regarding to the team\r\n    4.Answer and help interns under my team regarding to their concern in their assigned teams\r\n    5.Collect the files and screenshot the summary of RCBC report for today and emailed it\r', 'Reviewing', '64c3894535ad6575180'),
(126, 'Juspher Pedrozo', '2023-07-28 16:58:13', 0, 8, 'Worked on uploading the GDrive Files of CSK to OneDrive. Attended General Meeting. Worked on ID of Interns and Employees. Created a Calling Card based on their design. Assigned 2 interns to create a ID Template as requested by HR Department. Talked to Marketing Dept TM/TL regarding a concern.', 'Reviewing', '64c302f39d907328326'),
(127, 'Denber Abuan', '2023-07-28 17:02:23', 0, 8, 'Team 1 - Prepared Cash Position 2Q 2023; Adjusted Cash Position 2022; Started Trial Balance 2Q 2023', 'Reviewing', '64c30326633ac276229'),
(128, 'Karl Adrian H. Garcia', '2023-07-28 16:55:43', 0, 8, 'Created a social media analytics (facebook).Uploaded some approved publication materials', 'Reviewing', '64c303629a02f255551'),
(129, 'Shenna Mae A. Dela Fuente', '2023-07-28 17:03:13', 0, 8, '-update the monitoring records\r\n-post looking for interns ad in facebook\r\n-attended the weekly friday meeting\r\n-replied to internship inquiries in fb messenger\r\n-deployment of new interns\r\n-sent out monitoring form to different dept.\r\n', 'Reviewing', '64c30370755ce836406'),
(130, 'Charichelle V. Laureles', '2023-07-28 17:24:06', 0, 9, '- Checked all clients’ database and working paper — from Team 1 to Team 12 one by one\r\n- Communicated non-updated FS to teams and assigned tasks to other interns to accomplish 2nd quarter FS\r\n- Coordinated with IT Department regarding the AMS issues \r\n- Removed former employees and interns from Teams to secure updated data and information of clients and avoid breach of confidentiality\r\n- Updated U', 'Reviewing', '64c3038be15a9692923'),
(131, 'Kimberly May L. Sustal', '2023-07-28 17:00:11', 0, 8, '* Checked working paper of Team 6\r\n* Encode June expenses receipts of Noah’s Arc.\r\n* Updates CDB, GJ, GL (ALE &RE) of Noah’s Arc. \r\n* Linked GJ to CDB and GL. \r\n* Cross checked trial balance. \r\n', 'Reviewing', '64c30398c14ed728999'),
(132, 'Patricia Jamellin V. Bautista', '2023-07-28 17:04:01', 0, 8, 'July 28, 2023\r\n\r\n- Updated the SCF and SFP of DRF Food Cart for 2nd Quarter\r\n- Re-checked the 1st and 2nd Quarter of DRF in database.\r\n- Filed 1701Q form of DRF for amendment.\r\n- Created 1st and 2nd quarter Powerpoint report for DRF Food Cart.', 'Reviewing', '64c303cdc883c189065'),
(133, 'Kathrine Nicole S. Fernan', '2023-07-28 16:55:18', 0, 8, 'July 28, 2023\r\nOnline Internship\r\n\r\n- Timed in\r\n- Checked for new receipts\r\n- Opened and checked businesses under Team 3\r\n- Re-checked all the sheets\r\n- Crossed referenced the encoded receipts on katrina\'s \r\n- Organized and edited Airish Pasig Chart of Accounts', 'Reviewing', '64c3044f6b6f6185110'),
(134, 'Patrick Lirom', '2023-07-28 17:02:38', 0, 8, 'Attended weekly meeting.\r\nCloned the repository used in AMS.\r\nOn standby for further instructions.', 'Reviewing', '64c305337751c897242'),
(135, 'Anna Maria Rogelia T. Almogil', '2023-07-28 17:41:14', 0, 8, 'Continue  data encoding ledger/dagupan', 'Reviewing', '64c307ef13b0e252403'),
(136, 'Julich Enduma', '2023-07-28 20:16:00', 0, 10, 'Manual time/out', 'Approved', '64c3b1ba5b0a9228595'),
(137, 'John Michael V. De Jose', '2023-07-28 20:03:10', 0, 10, '1.) recieved outputs from mktg intern\r\n2.) checked outputs from mktg interns', 'Reviewing', '64c3141b1725e883246'),
(138, 'Richard A. Araña', '2023-08-02 23:00:00', 0, 0, 'none', 'No Time-out', '64c3201340762189991'),
(141, 'Viejay Abad', '2023-08-02 23:00:00', 0, 0, 'none', 'No Time-out', '64c33e939c04f443307'),
(142, 'Rubelyn De Jose', '2023-07-28 17:30:55', 0, 4, 'testing testing testing testing', 'Reviewing', '64c344a7634d7755714'),
(143, 'Maru B. Cunag', '2023-07-28 17:02:02', 0, -1, 'Done with acpn, done with requesting payroll, done with receiving cheque, done with requesting paid cash of cidhi to adeoms ', 'Reviewing', '64c381a16fea5241598'),
(144, 'Millicent Joie Gamboa', '2023-07-28 17:05:33', 0, -1, 'Check the update in Union Bank if there is any transaction to update the bank statement. Watch the tutorial video to familiarize with the process.', 'Reviewing', '64c383cff09be928133'),
(145, 'Milky N. Pagobo', '2023-07-28 17:09:00', 0, 8, '- Duty in ADEOMS\r\n- Updating the DARB\r\n- Doing the reconciliation', 'Reviewing', '64c3896888455572946'),
(146, 'Justine Grace Rosarda', '2023-07-28 17:02:00', 0, 8, '1. Guide the interns on how they time in to the website\r\n2. Add the new intern in online attendance sheet and share to her the link of it\r\n3. Discuss to her how online attendance works\r\n4. Answer and help other interns regarding to their concern in their assigned teams\r\n5. Searched in gmail the tin number of clients in Team 7 2551Q and 2550Q and save their BIR Tax Confirmation\r\n    6. Consolidate ', 'Reviewing', '64c3894535ad6575180'),
(147, 'Patricia Jamellin V. Bautista', '2023-07-29 17:02:34', 0, 8, 'July 29, 2023\r\n\r\n** no pending tasks for team 9 and 12\r\n\r\n- Checked if there are encoded receipts not yet transferred in the database of Team 7, 9, and 12.\r\n- Encoded information from encoded receipts file to CDB of BT Wireless for May.\r\n- Classify the type of accounts of encoded transactions to CDB of BT Wireless for the month of May.\r\n- Create Weekly Accomplishment Report for Team 7 (July 24-29,', 'Reviewing', '64c4553cc48e6922830'),
(148, 'Maru B. Cunag', '2023-07-29 16:59:31', 0, 8, 'Done rechecking new billing statement w/o cos, Done with new sheet for penalties, in the process of finishing the new darb', 'Reviewing', '64c455fc0b24d107451'),
(149, 'Kimberly May L. Sustal', '2023-07-29 17:09:34', 0, 8, '* Checked working paper of Team 10\r\n* Made a TB monthly (C2J)\r\n* Cross cheked TB-1st Quarter (CSK)\r\n* Updates CDB of CSK & C2J\r\n* Classify what type of expense\r\n* Made weekly accomplishment for Team 7A\r\n', 'Reviewing', '64c4563167828781980'),
(150, 'Kathrine Nicole S. Fernan', '2023-07-29 17:00:08', 0, 8, 'July 29, 2023\r\nOnline Internship\r\n\r\n- Timed in\r\n- Organized and double-checked if the receipts were on the correct folder in the drive of Team 4\r\n- Checked for newly encoded receipts\r\n- Updated 3N\'s manual books\r\n- Posted on 3N GL\r\n- Timed out', 'Reviewing', '64c456905edee857156'),
(151, 'Milky N. Pagobo', '2023-07-31 17:00:56', 0, 9, '- Duty in Adeoms\r\n- Arranging the payroll of the employees', 'Reviewing', '64c6e9cad481e352290'),
(152, 'Eugene Gueta', '2023-07-31 16:52:28', 0, 8, 'updating my profile in AMS website', 'Reviewing', '64c6f4ef58087656949'),
(153, 'Jerene Beatrice Talatala', '2023-07-31 17:04:00', 0, 8, 'Continued video production, recorded weekly meeting', 'Reviewing', '64c6f6283d88a874610'),
(154, 'Lina E Hesarza', '2023-07-31 16:49:57', 0, 8, 'My accomplishments today is that I share csk services, internship post, bookkeeping tutorial and answering inquiries thru fb page and on my personal account, Also make a comment on other fb groups that needs our services, looking for a client. And  attending weekly meeting and report my accomplishment of the week', 'Reviewing', '64c6f65236aaf202456'),
(155, 'Joshua Esguerra', '2023-07-31 16:50:46', 0, 8, 'created cron job for timeouts in ams, fixed announcement issue, tested remove button in time in and out', 'Reviewing', '64c6f68788297123657'),
(156, 'Karl Adrian H. Garcia', '2023-07-31 16:56:14', 0, 8, 'Finishing and uploading of publication materials for posting in facebook account. I also attend the weekly meeting and communicate to the team for the task for this week.', 'Reviewing', '64c6f73e5696f499620'),
(157, 'Kimberly May L. Sustal', '2023-07-31 17:00:19', 0, 8, '* Onsite internship at Naic, Cavite.\r\n* Checked working paper of Team 7A\r\n* Look for receipts under receipts folder for encoding.\r\n* Encode available receipts in Team 7A working paper. \r\n* Rechecked receipts under CDB & CRB to verify accuracy\r\n', 'Reviewing', '64c6f79126939471302'),
(158, 'Justine Grace Rosarda', '2023-07-31 17:02:31', 0, 8, ' Give ledgers to Ms. Hazel\r\n2. Reconcile the RCBC Rental - Other Banks \r\n3. Guiding and giving all the needs of interns in Team 1 and Team 3\r\n4. Helping to the Reconciliation of Construction Bond Payable of Team 1\r\n5. Double checked the FS of Katrina\'s MMXXI as the intern raise a concern to this\r\n', 'Reviewing', '64c6f7ad8adb9290131'),
(159, 'Shenna Mae A. Dela Fuente', '2023-07-31 16:53:27', 0, 8, 'Update monitoring form\r\nEdit ppt\r\nAttended weekly meeting \r\nPresented in meeting\r\nSent out monitoring form', 'Reviewing', '64c6f7b859f2c393328'),
(160, 'Patricia Jamellin V. Bautista', '2023-07-31 17:01:27', 0, 8, 'July 31, 2023 (On-site)\r\n\r\n- Checked receipts folder of Team 7 for unrecorded transactions in database.\r\n- Visit client on-site in Sabang, Naic, Cavite.\r\n- Encode transactions to CDB of BT Wireless for the month of May.\r\n- Classify the type of accounts for each transaction for May.\r\n- Input amounts in GL-ALE and GL-RE of BT Wireless for May.', 'Reviewing', '64c6f7d26051c120660'),
(161, 'Denber Abuan', '2023-07-31 16:56:01', 0, 8, 'Team 1\r\n- journalized entries for bank interest and bank charges\r\n- Adjusted general ledger 2Q 2023 PACEVHAI (emphasis on Construction Bond Payable)\r\n- Adjusted trial balance 2Q 2023 PACEVHAI', 'Reviewing', '64c6f7dfbedd8921716'),
(162, 'Kathrine Nicole S. Fernan', '2023-07-31 17:00:11', 0, 8, 'July 31, 2023:\r\nOnsite Internship\r\n\r\n- Timed in\r\n- Visit onsite client\r\n- Checked the working paper of team 7\r\n- Looked for new receipts encoded\r\n- Re-checked the receipts in the CRB and CDB\r\n- Timed out\r\n', 'Reviewing', '64c6f805d2436601484'),
(163, 'Patrick Lirom', '2023-07-31 16:57:09', 0, 8, 'Attended the weekly meeting.\r\nStudied the code in the repository and how to test the AMS.', 'Reviewing', '64c6f8798741f208797'),
(164, 'Charichelle V. Laureles', '2023-07-31 17:01:15', 0, 8, '- Bank Reconciliation of UB Bank Statement vs. UB Quickbooks\r\n- Emailed Team 7 last week’s weekly reports to the CEO\r\n- Updated Bank statement — last update 07/31/2023 4:42 PM\r\n- Edited some details of Bank Deposits in Quickbooks to match the bank balances. \r\n- Journalize entries of other deposits in bank transactions. \r\n- Worked back deferred output and output tax and addressed the queries of the', 'Reviewing', '64c6f88b47f80204265'),
(165, 'Maru B. Cunag', '2023-07-31 17:03:41', 0, 8, 'Done with distributing ADEOMS payroll', 'Reviewing', '64c6f98272df6362197'),
(166, 'Millicent Joie Gamboa', '2023-07-31 17:00:01', 0, 8, 'Done watching all the tutorial videos to be familiar with the process. In the progress of balancing KATRINA’S MMXXI 2023 second quarter financial statement. ', 'Reviewing', '64c6f992d029a667121'),
(168, 'Juspher Pedrozo', '2023-07-31 17:09:30', 0, 8, 'Reassigned to AMS team. Worked on showing the table cells of the Overtime column in the View Time In/Time Out section. Presented weekly updates during the General Weekly Meeting. Accepted requests to transfer ownership to the GDrive account of CSK\'s CEO.', 'Reviewing', '64c6fb9f91276119912'),
(169, 'Anna Maria Rogelia T. Almogil', '2023-07-31 17:59:16', 0, 9, 'Continue data encoding ledger/dagupan', 'Reviewing', '64c6fd21d3fb4419028'),
(170, 'Nicko V. Reanzares', '2023-07-31 17:22:42', 0, 8, 'pubmat posting posted in gdrive and for holidays', 'Reviewing', '64c6fee8824d2192480'),
(171, 'John Michael V. De Jose', '2023-07-31 22:19:58', 0, 12, '1.) given tasks to mktg intern\r\n2.) guided and helped a mtkg intern\r\n3.) recieved outputs from mktg intern\r\n4.) checked outputs from mtkg intern\r\n', 'Reviewing', '64c707bdc898e832084'),
(172, 'Julich Enduma', '2023-07-31 19:20:03', 0, 9, 'Posted Ads\r\nIntrerview\r\nMonitored adeoms payroll\r\n', 'Reviewing', '64c70860d6918366280'),
(173, 'Rubelyn De Jose', '2023-07-31 18:47:37', 0, 5, 'update bank statement to collection report, PDC and Quickbooks. CRM', 'Reviewing', '64c73e9f3b6b3144666'),
(177, 'Mark Anthony O. Garong', '2023-08-01 16:52:00', 0, 8, 'Completing the excel file which we should transfer the data from the provided excel file into 1 excel file to sort out the dates and the category for each bank statements ', 'Reviewing', '64c8481123c4d373678'),
(178, 'Lina E Hesarza', '2023-08-01 16:51:23', 0, 8, 'My accomplishments today is that I share csk services, internship post, bookkeeping tutorial and answering inquiries thru fb page and on my personal account, Also make a comment on other fb groups that needs our services, looking for a client. And creat a lay out for business registration discount and post it to the group.', 'Reviewing', '64c8481b87a2b867447'),
(179, 'Joshua Esguerra', '2023-08-01 16:51:12', 0, 8, 'fixed manual time in and time out', 'Reviewing', '64c8482691649323522'),
(180, 'Patrick Lirom', '2023-08-02 17:01:42', 0, 32, 'Completed another task assigned by the CEO.\r\n', 'Reviewing', '64c848632d0c4902269'),
(181, 'Patricia Jamellin V. Bautista', '2023-08-01 17:04:17', 0, 8, 'August 1, 2023\r\n\r\n- Created powerpoint for Vegral Homes Decena and Medicareplus for 1st and 2nd Quarter.\r\n- Created powerpoint for E.G. Sumayao, E.G. Martin, and Vegral Homes Malibay for 2nd quarter.\r\n- Updated and adjusted the amounts in Medicareplus Database.\r\n- Computed financial ratios of businesses under Team 9 for Powerpoint file.\r\n- Checked new receipts sent by Ma’am Ambi.', 'Reviewing', '64c8492175315692620'),
(182, 'Kathrine Nicole S. Fernan', '2023-08-01 17:02:43', 0, 8, 'August 1, 2023\r\nOnline Internship\r\n\r\n- Timed in\r\n- Look for encoded receipts for team 7 (non)\r\n- Since there is no pending task for team 7, i checked my other team\'s papers\r\n- Encoded on team 3 Katrina\'s\r\n- Posted on the GL of Katrina\'s for the months of May-June\r\n- Timed out', 'Reviewing', '64c84947e36ce185904'),
(183, 'Jerene Beatrice Talatala', '2023-08-01 16:57:49', 0, 8, 'Modified TJ Kramer ID, Continued video production', 'Reviewing', '64c8498fc0c6c495844'),
(184, 'Justine Grace Rosarda', '2023-08-01 17:00:55', 0, 8, '    1. Clearing and double checking the FS of Team 1\r\n    2.Working to be balance the trial balance of Team 1\r\n    3. Answer and help interns under my team regarding to their concern in their assigned teams\r\n    4.Reaching out and talking to the previous handler of Team 3 for queries\r\n    5.Draft of RCBC PNB other banks June 2023 Reconciliation\r\n', 'Reviewing', '64c8499bdfd21217578'),
(185, 'Millicent Joie Gamboa', '2023-08-01 17:00:23', 0, 8, 'Done doing the journal entry for the collection report of the reversal of deferred for the month of July 31, 2023. Done offsetting the input tax and output tax for the month of July 2023.', 'Reviewing', '64c849f42d0e7687605'),
(186, 'Karl Adrian H. Garcia', '2023-08-01 17:02:51', 0, 8, 'Creation of content specifically the poster for wlrcoming the new interns.', 'Reviewing', '64c84ab63c196973021'),
(187, 'Shenna Mae A. Dela Fuente', '2023-08-01 17:00:17', 0, 8, 'update monitoring records\r\npost looking for intern in facebook\r\nannounced to IT, HR and Acctg dept\r\nSent out monitoring form\r\n', 'Reviewing', '64c84b0e30aa7516072'),
(188, 'Denber Abuan', '2023-08-01 17:04:08', 0, 8, 'Team 1\r\n- adjusted general ledger construction bond\r\n\r\nTeam 8\r\n- prepared BIR filings', 'Reviewing', '64c84b6ac1790862961'),
(189, 'Anna Maria Rogelia T. Almogil', '2023-08-01 18:04:16', 0, 9, 'Continue data encoding ledger/dagupan', 'Reviewing', '64c84c56e2ac4266147'),
(190, 'Juspher Pedrozo', '2023-08-01 17:07:20', 0, 8, 'Worked on AMS. Filter button on the View Time in and Time out page. Adjusted the buttons design a bit.', 'Reviewing', '64c84cacd09f3469623'),
(191, 'Maru B. Cunag', '2023-08-01 17:11:15', 0, 8, 'Finished reconciling the receivable of ADEOMS to the payments of CIDHI', 'Reviewing', '64c84d6a18ba4316112'),
(192, 'Kimberly May L. Sustal', '2023-08-01 17:00:03', 0, 8, '* Updates General Ledger ALE & IN-EXP of Team 10\r\n* Linked CDB to GL of team 10\r\n* Prepare a Trial Balace of csk\r\n* Encode available receipts for the month of  July\r\n* Updates CBD ', 'Reviewing', '64c84db6c530a591047'),
(193, 'Charichelle V. Laureles', '2023-08-01 18:14:06', 0, 9, '- Updated PPT Lapsing and journalized in quickbooks\r\n- Taught Ms. Millicent the reversals of deferred output tax and offsetting output tax and input taxes\r\n- Prepared Prepaid Expenses detail report and reconciled it with Quickbooks balances\r\n- Prepared Advances to Employees detail report and reconciled it with Quickbooks balances\r\n- Made a new file for CRB and CDB of Tiens for Manual Books recordi', 'Reviewing', '64c85125084e4509382'),
(194, 'Julich Enduma', '2023-08-01 21:13:38', 0, 12, 'Passed Maxspeed payroll\r\nInterview bookkeeper applicant\r\nchecked email\r\nposted ads', 'Reviewing', '64c85316b3bf0834898'),
(195, 'Rubelyn De Jose', '2023-08-01 18:15:48', 0, 8, 'update bankstatement tocollection report. update PDC,QB,AND CRM', 'Reviewing', '64c8576d5057a322775'),
(196, 'John Michael V. De Jose', '2023-08-01 20:37:54', 0, 10, '1.) given tasks to mktg intern\r\n2.) received outputs from mktg intern.\r\n3.) Checked outputs of mktg intern.', 'Reviewing', '64c86213da75c212928'),
(203, 'Eugene Gueta', '2023-08-01 17:10:13', 0, -1, 'Updating Profile in AMS website', 'Reviewing', '64c8c5e404cc8653785'),
(204, 'admin', '2023-08-01 17:06:00', 0, 0, 'Manual time in and out', 'Reviewing', '64c8cad96867b553178'),
(208, 'Cherizza Grace G. Peñafiel', '2023-08-02 23:00:00', 0, 0, 'none', 'No Time-out', '64c9910d0c9ee498648'),
(210, 'Eugene Gueta', '2023-08-02 16:55:14', 0, 8, 'Updating MY PROFILE IN AMS Website', 'Reviewing', '64c999204383e716741'),
(211, 'Juspher Pedrozo', '2023-08-02 16:50:40', 0, 8, 'Worked on optimizing the looks of the delete button in the View Time In/Time Out part of AMS. Assisted interns with their Intern Grading Forms and their Status Checks. Helping with the development of My Profile section in the AMS.', 'Reviewing', '64c9994ec6676584520'),
(212, 'Lina E Hesarza', '2023-08-02 16:53:29', 0, 8, 'My accomplishments today is that I share csk services, internship post, bookkeeping tutorial and answering inquiries thru fb page and on my personal account, Also make a comment on other fb groups that needs our services and message to client for their concern. And creat a lay out for internship and post it to the group.', 'Reviewing', '64c999c45c121837032'),
(213, 'Joshua Esguerra', '2023-08-02 17:04:04', 0, 8, 'Assisted in current ams issues in time in and database managrment', 'Reviewing', '64c999cb2a3f1297668'),
(214, 'Karl Adrian H. Garcia', '2023-08-02 16:55:02', 0, 8, 'Continue working on pubmats for posting, I also upload some of approved poster in facebook acount and also videos to youtube.', 'Reviewing', '64c99a3527728102985'),
(215, 'Mark Anthony O. Garong', '2023-08-02 16:56:54', 0, 8, 'Created and posted some layouts on fb then continue creating excel sheets for bank statements ', 'Reviewing', '64c99a7eadb87151762'),
(216, 'Patricia Jamellin V. Bautista', '2023-08-02 17:02:53', 0, 8, 'August 2, 2023 (On-site)\r\n\r\n- Visit on-site client in Sabang, Naic, Cavite.\r\n- Updated GL-ALE and GL-RE of BT Wireless for the month of May.\r\n- Put journal entry on GJ of BT Wireless for the month of May.\r\n- Checked receipts folder of Team 7 for unrecorded transactions in database.\r\n- Encode information for AB Skyreme, BT Wireless, MM Fastnet, Zinet in eBIR for 1601C filing.', 'Reviewing', '64c99ae59f7a2392408'),
(217, 'Maru B. Cunag', '2023-08-02 17:12:36', 0, 8, 'Meeting with the accountant of MKMV, Turnover over report of Milky and Elizabeth', 'Reviewing', '64c99b0a02a02807141'),
(218, 'Charichelle V. Laureles', '2023-08-02 17:32:20', 0, 9, '- Filed 1601C of Dr. Padecio and Medicareplus\r\n- Made a BIR Tax Filing tracker and coordinated with the Accounting Department for such forms.\r\n- Coordinated with Ms. Jazz the BIR Tax Filing list. \r\n- Updated Billing Invoices and CRB of C2J Business Solutions.\r\n- Communicated with Ms. Jazz the error found in the official receipt #30, #36 and #39 of C2J \r\n- Triple checked the GC of Team 10 to verify', 'Reviewing', '64c99b2c7c6be346067'),
(219, 'Kimberly May L. Sustal', '2023-08-02 17:02:00', 0, 8, '* Onsite internship at Naic, Cavite.\r\n* Checked if there are new receipts in receipts encoding folder for Team 7A.\r\n* Encode new available receipts. \r\n* Updates General Ledger ALE & RE of Team 7A. \r\n* Asked receipts for July receipts to clients.', 'Reviewing', '64c99b6436aa2897464'),
(220, 'Millicent Joie Gamboa', '2023-08-02 17:00:15', 0, 8, 'Done doing BIR filing of Maxspeed Autoportal Inc. Makati and Maxspeed Autoportal Inc. Pasig for the month of July 2023 - Team 11. In the process of balancing the financial statement and checking the general ledger of the first quarter from Katrina’s Mmxxi 2023 - Team 3.', 'Reviewing', '64c99b711e55a404573'),
(221, 'Justine Grace Rosarda', '2023-08-02 17:14:01', 0, 8, '1.	Answer and help interns under my team regarding to their concern in their assigned teams\r\n2.	Reaching out and talking to the previous handler of Team 7 and 8for queries\r\n3.	Helping interns to Katrina’s MMXXI FS\r\n4.	Double checked the amount that needs to reimburse in Team 1 FS\r\n5.	Draft of Other Banks Reconciliation\r\n6.	Requesting for the files to continue reconcile RCBC Other Banks', 'Reviewing', '64c99b76d6e28588955'),
(222, 'Kathrine Nicole S. Fernan', '2023-08-02 17:00:05', 0, 8, 'August 2, 2023\r\nOnsite Internship\r\n\r\n- Timed in\r\n- Went to Onsite office\r\n- Visited working papers of team 7 Corpo businesses\r\n- No tasks as well as receipts to be done in team 7, corpo\r\n- Checked my other teams (3-4)\r\n- Uploaded team 3\'s clients receipts in the drive\r\n- Renamed the uploaded receipts\r\n- Started to Encode on team 3\'s client (Airish Pasig, CRB)\r\n- Timed out\r\n', 'Reviewing', '64c99bfbb6fb6994591'),
(223, 'Denber Abuan', '2023-08-02 16:58:40', 0, 8, 'Team 1\r\n- Listed reconciliation adjustments from jan 2021 - jun 2021\r\n- Prepared Income Statement for PACEVHAI 2Q\r\n- Prepared 1702Q of PACEVHAI for 2Q\r\n', 'Reviewing', '64c99c0dbd5e1628530'),
(224, 'Shenna Mae A. Dela Fuente', '2023-08-02 17:00:43', 0, 8, 'update monitoring records\r\nreplied to internship inquiry and concern on messenger \r\npost looking for intern in facebook\r\nSent out monitoring form\r\n', 'Reviewing', '64c99ca73e411193178'),
(225, 'Rubelyn De Jose', '2023-08-02 17:48:07', 0, 9, 'update bank statement to collection report, update PDC,QB and CRM. do some Task.', 'Reviewing', '64c99cff27bdc987795'),
(226, 'Anna Maria Rogelia T. Almogil', '2023-08-02 23:00:00', 0, 0, 'none', 'No Time-out', '64c99f0e9ae15843482'),
(227, 'Jazz Jan D. Gregorio', '2023-08-02 22:25:03', 0, 13, 'updated the BIR daily monitoring list.\r\ncoordinated with Ms. Cha for BIR filings.\r\nsent the Billing invoice for c2j to Ms. Cha, updated up to Aug 2\r\naccomplished evaluation requests of interns\r\nassisted emails.', 'Reviewing', '64c9a015daf3f906933'),
(228, 'Julich Enduma', '2023-08-02 21:00:00', 0, 11, 'Manual time in and out', 'Reviewing', '64c9ab1aa87f8465877'),
(229, 'John Michael V. De Jose', '2023-08-02 20:05:48', 0, 9, '1.) received outputs from mktg intern.\r\n2.) checked outputs of mktg intern.', 'Reviewing', '64c9b85dee637323854'),
(230, 'admin', '2023-08-02 17:31:00', 0, 0, 'Manual time in and out', 'Reviewing', '64ca22447a90b882583'),
(231, 'Anna Maria Rogelia T. Almogil', '2023-08-03 18:00:28', 0, 9, 'Orientation about ambit with maam mayet Together with the ambit team', 'Reviewing', '64cae9f16a469578438'),
(232, 'Lina E Hesarza', '2023-08-03 16:51:28', 0, 8, 'My accomplishments today is that I share csk services, internship post, bookkeeping tutorial and answering inquiries thru fb page and on my personal account, Also make a comment on other fb groups that needs our services and message to client for their concern. ', 'Reviewing', '64cae9fc3b29d871190'),
(233, 'Eugene Gueta', '2023-08-03 16:51:06', 0, 8, 'updating profile in AMS Website', 'Reviewing', '64caea3681324442766'),
(234, 'Patrick Lirom', '2023-08-03 16:53:23', 0, 8, 'Tested the attendance management system and checked for bugs.', 'Reviewing', '64caeacd9cecd232418'),
(235, 'Juspher Pedrozo', '2023-08-03 16:55:00', 0, 8, 'Polished some parts of the My Profile section of the AMS and committed to the repo. Also did some small adjustments on the file itself to be uniform with other sections. (Such as navbar, sidebar)', 'Reviewing', '64caeadd58e39194032'),
(236, 'Joshua Esguerra', '2023-08-03 17:00:00', 0, 0, 'none', 'Reviewing', '64caeae341e3c696341'),
(237, 'Mark Anthony O. Garong', '2023-08-03 23:00:00', 0, 0, 'none', 'No Time-out', '64caeb3f35974671027'),
(238, 'Karl Adrian H. Garcia', '2023-08-03 16:58:14', 0, 8, 'I continue working on the publication materials, upload some approved contents in the facebook page, and also checked the analytics for youtube video that I uploaded yesterday.', 'Reviewing', '64caeb93e1944843104'),
(239, 'Denber Abuan', '2023-08-03 16:52:37', 0, 8, 'Team 1\r\n- Updated CRB and CDB July 2023 of PACEVHAI\r\n- Started on Journalizing entries for July 2023 PACEVHAI\r\n- coordinated with client in sending ORs and CVs\r\n- Shared ledgers for different accounts requested by client', 'Reviewing', '64caebd3614ad854229'),
(240, 'Patricia Jamellin V. Bautista', '2023-08-03 17:02:44', 0, 8, 'August 3, 2023\r\n\r\n- Fill up 1601C and 0619E form of AB Skyreme, BT Wireless, MM Fastnet, Zinet and waiting for ma’am Cha’s approval.\r\n- Update GJ of BT Wireless for the month of May.\r\n- Checked receipts folder of Team 7 for unrecorded transactions.\r\n- Fill up and filed 0619E form of DRF Food Cart (Team 12).\r\n- Updated Consolidated Trial Balance of Vegral Homes Malibay for July (Team 9).\r\n- Updated', 'Reviewing', '64caebeed8c9b658794'),
(241, 'Kimberly May L. Sustal', '2023-08-03 17:00:40', 0, 8, '* Filed BIR form 1601C for Team 7A (sole)\r\n* Checked if there are new receipts uploaded  for Team 7A \r\n* Linked General ledger to trial balance\r\n* Made a trial balance for May\r\n* Added a folder for 1601C BIR form in gdrive \r\n', 'Reviewing', '64caebfe3088e150430'),
(242, 'Justine Grace Rosarda', '2023-08-03 17:09:58', 0, 8, '    1. Download the Bank Statement of Branches for the month of July and disseminate it in RCBC Group chat\r\n    2.Filing the 1601C and 0619E of some clients\r\n    3.Searching all the BIR Confirmation of Biancakes in Gmail and export it in PDF\r\n    4.Download all the BIR forms of Biancakes and consolidate the BIR Confirmation of it\r\n    5.Answer and help interns under my team regarding to their conc', 'Reviewing', '64caec30be768816191'),
(243, 'Maru B. Cunag', '2023-08-03 17:07:01', 0, 8, 'Request for Funding, Preparation of Tax 1601C', 'Reviewing', '64caec91a5141576386'),
(244, 'Millicent Joie Gamboa', '2023-08-03 17:02:06', 0, 8, 'Done submitting the final BIR filing of Maxspeed Pasig 0619E. Done doing the BIR filing of Maxspeed Pasig 1601C. Waiting for the payment request form of Maxspeed Makati 0619E- Team 11. In the process of balancing the first quarter of financial statements of Katrina\'s Food Corner 2023 with the help of ma\'am cha - Team 3.', 'Reviewing', '64caed171696d497004'),
(245, 'Shenna Mae A. Dela Fuente', '2023-08-03 17:00:25', 0, 8, 'update monitoring records\r\nreplied to intern concern on messenger and communicate it to hr dept\r\ncheck youtube for content upload and edited the ppt\r\npost looking for intern in facebook\r\nSent out monitoring form\r\n', 'Reviewing', '64caee0571fa8381086'),
(246, 'Kathrine Nicole S. Fernan', '2023-08-03 17:00:05', 0, 8, 'August 3, 2023\r\nOnline Internship\r\n\r\n- Timed in\r\n- Checked the working papers of my clients\r\n- Been reminded about the BIR filings for 2nd quarter\r\n- Encoded details on 0619E BIR Forms\r\n- Sent the pdf forms in MS Teams waiting for Approval\r\n- Timed out', 'Reviewing', '64caee41b33d0200176'),
(247, 'Rubelyn De Jose', '2023-08-03 17:16:05', 0, 8, 'update bank statement to collection report, update PDC,QB, CRM', 'Reviewing', '64caef66c58b2618765'),
(248, 'Jazz Jan D. Gregorio', '2023-08-03 22:46:58', 0, 13, 'sent evaluations to ojt coordinators.\r\nupdated email confirmations for BIR', 'Reviewing', '64caf40314dd0900762');
INSERT INTO `time_out` (`id`, `name`, `datetime`, `overtime`, `hours`, `tasks`, `approval`, `token`) VALUES
(249, 'Charichelle V. Laureles', '2023-08-03 18:11:11', 0, 8, '- Helped Ms. Millicent in fixing discrepancies in Katrina’s MMXXI financial statements from first quarter\r\n- Reposted all CRB and CDB to General Ledger and updated Trial Balance \r\n- Recomputed Input Taxes of Katrina’s MMXXI — there’s an error in the formula used by the former handler\r\n- Triple checked and approves 0-filing BIR Forms due this August 10\r\n- Taught Ms. Millicent in making PRF for Tax ', 'Reviewing', '64cafaf8293e9647563'),
(250, 'Julich Enduma', '2023-08-03 22:25:54', 0, 13, 'Created FTMS\r\nDOne interview\r\nposted ads\r\nchecking email', 'Reviewing', '64cafea73c054788080'),
(251, 'John Michael V. De Jose', '2023-08-03 19:36:16', 0, 9, '1.) received outputs from mtkg intern\r\n2.) checked outputs of mtkg intern', 'Reviewing', '64cb08567057a723546'),
(252, 'Eugene Gueta', NULL, 0, 0, 'none', 'No Time-out', '64cc3c26b1d81167951'),
(253, 'Kimberly May L. Sustal', NULL, 0, 0, 'none', 'No Time-out', '64cc3c3750ecc661602'),
(254, 'Joshua Esguerra', NULL, 0, 0, 'none', 'No Time-out', '64cc3c51b8644700283'),
(255, 'Maru B. Cunag', NULL, 0, 0, 'none', 'No Time-out', '64cc3cc56a100963639'),
(256, 'Charichelle V. Laureles', NULL, 0, 0, 'none', 'No Time-out', '64cc3d3971201437028'),
(257, 'Denber Abuan', NULL, 0, 0, 'none', 'No Time-out', '64cc3d5e647c9804056'),
(258, 'Patricia Jamellin V. Bautista', NULL, 0, 0, 'none', 'No Time-out', '64cc3dde535c7590764'),
(259, 'Juspher Pedrozo', NULL, 0, 0, 'none', 'No Time-out', '64cc3dfdd0095474530'),
(260, 'Justine Grace Rosarda', NULL, 0, 0, 'none', 'No Time-out', '64cc3e0a5dfc7751459'),
(261, 'Kathrine Nicole S. Fernan', NULL, 0, 0, 'none', 'No Time-out', '64cc3e7fcdb9e386509'),
(262, 'Karl Adrian H. Garcia', NULL, 0, 0, 'none', 'No Time-out', '64cc3f0e8556b809460'),
(263, 'Millicent Joie Gamboa', NULL, 0, 0, 'none', 'No Time-out', '64cc3f21ba829826944'),
(264, 'Patrick Lirom', NULL, 0, 0, 'none', 'No Time-out', '64cc3f826f1ba641176'),
(265, 'Shenna Mae A. Dela Fuente', NULL, 0, 0, 'none', 'No Time-out', '64cc3f88ed56c426194'),
(266, 'Anna Maria Rogelia T. Almogil', NULL, 0, 0, 'none', 'No Time-out', '64cc4123517aa880264'),
(267, 'Rubelyn De Jose', NULL, 0, 0, 'none', 'No Time-out', '64cc41daa6044634715');

-- --------------------------------------------------------

--
-- Table structure for table `untitled_spreadsheet___sheet1__1_`
--

CREATE TABLE `untitled_spreadsheet___sheet1__1_` (
  `COL 3` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `untitled_spreadsheet___sheet1__1_`
--

INSERT INTO `untitled_spreadsheet___sheet1__1_` (`COL 3`) VALUES
('0'),
('0'),
('0'),
('0'),
('0'),
('0'),
('0'),
('14'),
('-'),
('20'),
('0'),
('156'),
('156'),
('520'),
('168'),
('152'),
('96'),
('86'),
('209'),
('222'),
('68'),
('240'),
('-'),
('80'),
('240'),
('336'),
('336'),
('280'),
('248'),
('282'),
('280'),
('486'),
('356'),
('392'),
('312'),
('480');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` enum('admin','regular') NOT NULL DEFAULT 'regular',
  `position` enum('intern','employee') NOT NULL,
  `status` enum('out','in') NOT NULL DEFAULT 'out'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `role`, `position`, `status`) VALUES
(1, 'amt_admin@csk.com', 'test', 'Ichiji Seika', 'admin', 'employee', 'out'),
(2, 'gab@csk.com', 'doritonijika', 'Gabriel Terrence Garcia', 'regular', 'intern', 'out'),
(3, 'ava@csk.com', 'internAva001', 'Ava Ciara Lacambra', 'regular', 'intern', 'out'),
(4, 'shawn@csk.com', 'internShawn001', 'Shawn Danielle Espanola', 'regular', 'intern', 'out'),
(5, 'qcm.chrisimm@gmail.com', 'Viaba001', 'Viejay Abad', 'admin', 'employee', 'out'),
(6, 'admin', 'admin', 'admin', 'admin', 'employee', 'out'),
(7, 'ao.chrisimm@gmail.com', 'ao001', 'Jazz Jan D. Gregorio', 'admin', 'employee', 'out'),
(8, 'csk.akiranieva@gmail.com', 'akiranieva001', 'Louise Akira S. Nieva', 'regular', 'intern', 'out'),
(9, 'hrd.chrisimm@gmail.com', 'hrd001', 'Julich Enduma', 'admin', 'employee', 'out'),
(10, 'jr.bookkeeper.csk1@gmail.com', 'acctng001', 'Justine Grace Rosarda', 'admin', 'employee', 'in'),
(11, 'ceo.c2j@gmail.com', 'ceoc2j001', 'Cecilia D. Gregorio', 'admin', 'employee', 'out'),
(12, 'johnlgregorio@gmail.com', 'ea001', 'John Leonard D. Gregorio', 'admin', 'employee', 'out'),
(13, 'ceo.chrisimm@yahoo.com', 'ceo001', 'Cherizza Grace G. Peñafiel', 'admin', 'employee', 'out'),
(14, 'csk.VeronicaJoyceGabucan@gmail.com', 'veronicajoycegabucan001', 'Veronica Joyce Gabucan', 'regular', 'employee', 'out'),
(15, 'csk.karla@gmail.com', 'karla001', 'Karla Barja Alindayo', 'regular', 'employee', 'out'),
(16, 'csk.AlexandraJennPerjesYap@gmail.com', 'alexandrajennperjesyap001', 'Alexandra Jenn Perjes Yap', 'regular', 'employee', 'out'),
(17, 'It.chrisimm.c2j@gmail.com', 'john001', 'John Michael V. De Jose', 'regular', 'employee', 'out'),
(18, 'csk.patriciasayco@gmail.com', 'patriciasayco001', 'Patricia M. Sayco', 'regular', 'employee', 'out'),
(19, 'csk.JenniferEdanganOnnon@gmail.com', 'jennifer001', 'Jennifer Edangan Onnon', 'regular', 'employee', 'out'),
(20, 'csk.ChristineCalditaran@gmail.com', 'christine001', 'Christine N. Calditaran', 'regular', 'employee', 'out'),
(21, 'csk.JoshuaEsguerra@gmail.com', 'joshuaesguerra001', 'Joshua Esguerra', 'regular', 'intern', 'in'),
(22, 'csk.MaJhamilleAnnDapadap@gmail.com', 'majhamilleanndapadap001', 'Ma. Jhamille Ann M. Dapadap', 'regular', 'intern', 'out'),
(23, 'csk.CassandraSantos@gmail.com', 'cassandrasantos001', 'Cassandra Santos', 'regular', 'intern', 'out'),
(24, 'csk.JohnWilliamMariquina', 'JohnWilliam.Mariquina039', 'John William Mariquina', 'regular', 'intern', 'out'),
(30, 'csk.RenaMaeManuel@gmail.com', 'rena001', 'Rena Mae Manuel', 'regular', 'intern', 'out'),
(31, 'csk.JereneTalatala@gmail.com', 'jerene001', 'Jerene Beatrice Talatala', 'regular', 'intern', 'out'),
(32, 'csk.JuspherPedrozo@gmail.com', 'juspher001', 'Juspher Pedrozo', 'regular', 'intern', 'in'),
(33, 'csk.EugeneGueta@gmail.com', 'eugene001', 'Eugene Gueta', 'regular', 'intern', 'in'),
(34, 'csk.PatrickLirom@gmail.com', 'patrick001', 'Patrick Lirom', 'regular', 'intern', 'in'),
(35, 'csk.DaniellaLangres@gmail.com', 'daniella001', 'Daniella Langres', 'regular', 'intern', 'out'),
(36, 'gnagcash@gmail.com', 'rubelyn001', 'Rubelyn De Jose', 'regular', 'employee', 'in'),
(37, 'gallegojohnherald@gmail.com', 'johnherald001', 'John Herald Gallego', 'regular', 'employee', 'out'),
(38, 'charichellelaureles@gmail.com', 'charichelle001', 'Charichelle V. Laureles', 'regular', 'employee', 'in'),
(39, 'cfrincez@gmail.com', 'frincez001', 'Frincez Devillez Convento', 'regular', 'employee', 'out'),
(40, 'milkypagobo9@gmail.com', 'milky001', 'Milky N. Pagobo', 'regular', 'employee', 'out'),
(41, '13jrb08.chrisimm@gmail.com', 'richard001', 'Richard A. Araña', 'regular', 'employee', 'out'),
(42, '134jbr.csk@gmail.com', 'rosyl001', 'Rosyl Vallente Perez', 'regular', 'employee', 'out'),
(44, 'csk.JicelAnnIyog@gmail.com', 'jicelanniyog001', 'Jicel Ann V. Iyog', 'regular', 'intern', 'out'),
(45, 'csk.XyrelGenio@gmail.com', 'xyrelgenio001', 'Xyrel D. Genio', 'regular', 'intern', 'out'),
(46, 'csk.ChristianKennethCalzada@gmail.com', 'christiankennethcalzada001', 'Christian Kenneth Calzada', 'regular', 'intern', 'out'),
(47, 'csk.MarkAnthonyGarong@gmail.com', 'markanthonygarong001', 'Mark Anthony O. Garong', 'regular', 'intern', 'out'),
(48, 'csk.MeryielJoelelenCordero@gmail.com', 'meryieljoelelencordero001', 'Meryiel Joelelen D. Cordero', 'regular', 'intern', 'out'),
(49, 'csk.JoshuaMarkBulanon@gmail.com', 'joshuamarkbulanon001', 'Joshua Mark Bulanon', 'regular', 'intern', 'out'),
(50, 'csk.RommelAcob@gmail.com', 'rommelacob001', 'Rommel Acob', 'regular', 'intern', 'out'),
(53, 'csk.PatrickBacabis@gmail.com', 'patrickbacabis016', 'Patrick Shane A. Bacabis', 'regular', 'intern', 'out'),
(54, 'gkh1159@dlsud.edu.ph', '12345', 'Karl Adrian H. Garcia', 'regular', 'intern', 'in'),
(55, 'csk.reneletegio@gmail.com', '67890', 'Rene Q. Letegio', 'regular', 'intern', 'out'),
(56, 'csk.markjayclemente@gmail.com', '1', 'Mark Jay G. Clemente', 'regular', 'intern', 'out'),
(57, 'leiagbuya@gmail.com', '2', 'Lei Anne V. Agbuya', 'regular', 'intern', 'out'),
(58, 'Csk.johncarlosano@gmail.com', '3', 'John Carlo Sano', 'regular', 'intern', 'out'),
(59, 'kimberlymaysustal@gmail.com', '4', 'Kimberly May L. Sustal', 'regular', 'intern', 'in'),
(60, 'fernankathrinenicole@gmail.com', '5', 'Kathrine Nicole S. Fernan', 'regular', 'intern', 'in'),
(61, 'pjvbautista30@gmail.com', '6', 'Patricia Jamellin V. Bautista', 'regular', 'intern', 'in'),
(62, 'Csk.linahesarza@gmail.com', '7', 'Lina E Hesarza', 'regular', 'intern', 'out'),
(63, 'csk.casandrasantos@gmail.com', '8', 'Casandra M. Santos', 'regular', 'employee', 'out'),
(64, 'nickoreanzares@gmail.com', '9', 'Nicko V. Reanzares', 'regular', 'intern', 'out'),
(65, 'rosebuendicho1822@gmail.com', 'rosemary001', 'Rosemary D. Buendicho', 'regular', 'employee', 'out'),
(66, 'canna7144@gmail.com', 'anna001', 'Anna Maria Rogelia T. Almogil', 'regular', 'employee', 'in'),
(67, 'shenmaeadf@gmail.com', '10', 'Shenna Mae A. Dela Fuente', 'regular', 'intern', 'in'),
(68, 'dlabuan@up.edu.ph', '11', 'Denber Abuan', 'regular', 'intern', 'in'),
(69, 'csk.elizabethdelarosa@gmail.com', '12', 'Elizabeth T. de la Rosa', 'regular', 'intern', 'out'),
(70, 'csk.milkypagobo@gmail.com', '13', 'Milky N. Pagobo', 'regular', 'intern', 'out'),
(71, 'joiegamboa02@gmail.com', 'Gamboa101', 'Millicent Joie Gamboa', 'regular', 'intern', 'in'),
(72, 'cunagmaru28@gmail.com', 'Cunag101', 'Maru B. Cunag', 'regular', 'intern', 'in');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emp_info`
--
ALTER TABLE `emp_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `int_info`
--
ALTER TABLE `int_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_in`
--
ALTER TABLE `time_in`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_out`
--
ALTER TABLE `time_out`
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
-- AUTO_INCREMENT for table `emp_info`
--
ALTER TABLE `emp_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `int_info`
--
ALTER TABLE `int_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_in`
--
ALTER TABLE `time_in`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT for table `time_out`
--
ALTER TABLE `time_out`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
