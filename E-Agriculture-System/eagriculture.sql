-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2022 at 05:30 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eagriculture`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(100) DEFAULT NULL,
  `address` varchar(400) DEFAULT NULL,
  `uname` varchar(100) DEFAULT NULL,
  `upass` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `full_name`, `email_id`, `mobile_no`, `address`, `uname`, `upass`, `created_at`, `updated_at`) VALUES
(102, 'ASDF', 'asf@d.fd', '3425346345', '346345', 'adminsdfg', 'java@1991sdf', '2022-08-18 03:17:51', '2022-08-18 08:47:51'),
(438, 'Govind Raut', 'govind@rautgmail.com', '9555555555', 'Beed', 'govind', '222222222222', '2022-04-12 02:20:00', '2022-04-12 13:20:00'),
(4376, 'vrushaladmin', 'vrushaladmin@mail.com', '9139848902', 'deosade', 'vrushaladmin', 'vrushaladmin', '2022-08-18 02:57:48', '2022-08-18 08:27:48'),
(4561, 'Sagar Prakash Kharmale', 'sagarkharmale@gmail.com', '8456571542', 'Bhandgaon, Ahmednagar, Maharashtra.', 'sagar', 'sagar@123', '2022-02-22 01:34:05', '2022-02-22 12:34:05'),
(5787, 'Kishor Kadam', 'kadamk33@gmail.com', '7276763516', 'Pune, Maharashtra, India.', 'admin', 'java@1991', '2022-01-25 01:19:01', '2022-03-06 12:17:23');

-- --------------------------------------------------------

--
-- Table structure for table `tblcaptcha`
--

CREATE TABLE `tblcaptcha` (
  `captcha` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcaptcha`
--

INSERT INTO `tblcaptcha` (`captcha`) VALUES
('16554');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontact`
--

CREATE TABLE `tblcontact` (
  `contact_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcontact`
--

INSERT INTO `tblcontact` (`contact_id`, `name`, `email`, `mobile`, `subject`, `message`, `created_at`) VALUES
(1, 'Sushil Pawar', 'sushilpawar@gmail.com', '9841230145', 'Information regarding crops', 'I want a wheat regarding details information.', '2022-01-25 10:58:32'),
(2, 'Sagar Prakash Kharmale', 'sagarkharmale@gmail.com', '8456571542', 'Information about pesticides', 'Want a deep information about pesticides.', '2022-01-25 10:59:34');

-- --------------------------------------------------------

--
-- Table structure for table `tblcrops`
--

CREATE TABLE `tblcrops` (
  `id` int(11) NOT NULL,
  `crop_name` varchar(100) DEFAULT NULL,
  `month` varchar(100) DEFAULT NULL,
  `description` varchar(900) DEFAULT NULL,
  `crop_image_name` varchar(100) DEFAULT NULL,
  `crop_image` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcrops`
--

INSERT INTO `tblcrops` (`id`, `crop_name`, `month`, `description`, `crop_image_name`, `crop_image`, `created_at`, `updated_at`) VALUES
(3169, 'Chickpea Crop', 'Agust-December', 'The name chickpea comes from the Latin word cicer, referring to the plant family of legumes, Fabaceae. It is also known by its popular Spanish-derived name, the garbanzo bean. Kidney beans, black beans, lima beans, and peanuts are other familiar foods found in this legume family.', 'harbara.jpg', 'F:/project-workspace/E-Agriculture-System/WebContent/uploads/harbara.jpg', '2022-02-20 05:00:01', '2022-03-02 21:21:35'),
(4935, 'Sorgum Crop', 'September-February', 'Sorghum is a genus of about 25 species of flowering plants in the grass family. Some of these species are grown as cereals for human consumption and some in pastures for animals.', 'Sorghum.jpg', 'F:/project-workspace/E-Agriculture-System/WebContent/uploads/Sorghum.jpg', '2022-02-22 09:16:23', '2022-02-24 08:54:51'),
(5607, 'dgdfgs', 'dfgs', 'dfsg', 'SVG.png', 'C:/Users/VD/Downloads/New folder (2)/E-AgriculturalSystem/E-Agriculture-System/WebContent/uploadsSVG.png', '2022-08-18 04:21:08', '2022-08-18 09:51:08'),
(5937, 'Tomato Crop', 'September-December', 'Tomato is a rapidly growing crop with a growing period of 90 to 150 days. It is a daylength neutral plant. Optimum mean daily temperature for growth is 18 to 25ºC with night temperatures between 10 and 20ºC. ', 'tomato.jpg', 'F:/project-workspace/E-Agriculture-System/WebContent/uploads/tomato.jpg', '2022-02-22 07:54:50', '2022-02-22 13:28:57'),
(6771, 'Potato Crop', 'March-July', 'Potato (Solanum tuberosum) is the most important food crop of the world. Potato is a temperate crop grown under subtropical conditions in India.', 'potato-farming.jpg', 'F:/project-workspace/E-Agriculture-System/WebContent/uploads/potato-farming.jpg', '2022-02-22 07:51:10', '2022-02-22 13:29:16'),
(7077, 'Wheat Crop', 'December-March', 'Wheat is a grass widely cultivated for its seed, a cereal grain which is a worldwide staple food.The many species of wheat together make up the genus Triticum; the most widely grown is common wheat (T. aestivum). The archaeological record suggests that wheat was first cultivated in the regions of the Fertile Crescent around 9600 BCE. Botanically, the wheat kernel is a type of fruit called a caryopsis.', 'wheat.jpg', 'F:/project-workspace/E-Agriculture-System/WebContent/uploads/wheat.jpg', '2022-02-18 10:04:50', '2022-02-22 13:29:23');

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomer`
--

CREATE TABLE `tblcustomer` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(100) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `uname` varchar(100) DEFAULT NULL,
  `upass` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcustomer`
--

INSERT INTO `tblcustomer` (`id`, `full_name`, `email_id`, `mobile_no`, `gender`, `city`, `state`, `country`, `pincode`, `uname`, `upass`, `created_at`, `updated_at`) VALUES
(839, 'Kishor Balasaheb Kadam', 'kadamk329@yahoo.com', '9404308673', 'Male', 'Bhalawani, Ahmednagar', 'Maharashtra', 'India', '414103', 'kishor', '12345', '2022-01-25 06:11:52', '2022-04-05 22:04:44'),
(1678, 'Javed Tamboli', 'javed.tamboli@gmail.com', '8369651475', 'Male', 'Pune', 'Maharashtra', 'India', '411305', 'javed', 'javed@123', '2022-02-22 06:53:54', '2022-02-22 12:23:54'),
(2542, 'Sanket Kadam', 'sanketkadam@gmail.com', '7565869576', 'Male', 'Bhalawani', 'Maharashtra', 'India', '414103', 'sanket', 'sanket@123', '2022-04-12 07:34:51', '2022-04-12 13:04:51'),
(7448, 'Arun Pandit', '30arunpandit@gmail.com', '8265686325', 'Male', 'Ahmednagar', 'Maharashtra', 'India', '411055', 'arun', 'arun@123', '2022-01-25 06:13:14', '2022-01-25 11:43:14'),
(8882, 'vd', 'vrushalcust@mail.com', '9139848902', 'Male', 'adsf', 'asdf', 'dsaf', '1234', 'vrushalcust', 'vrushalcust', '2022-08-18 04:56:48', '2022-08-18 10:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `tblequipements`
--

CREATE TABLE `tblequipements` (
  `id` int(11) NOT NULL,
  `equipement_name` varchar(100) DEFAULT NULL,
  `equipement_cost_range` varchar(100) DEFAULT NULL,
  `description` varchar(900) DEFAULT NULL,
  `equipement_image_name` varchar(100) DEFAULT NULL,
  `equipement_image` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblequipements`
--

INSERT INTO `tblequipements` (`id`, `equipement_name`, `equipement_cost_range`, `description`, `equipement_image_name`, `equipement_image`, `created_at`, `updated_at`) VALUES
(8074, 'Hand Weeder', '450 Rs - 500 Rs', 'Useful for removing weeds in any field.\r\nLightweight and easy to operate for all ages.\r\nHand-held product, no power, and maintenance required.\r\nHardened Bolts for heavy-duty It can be used for all vegetables and other high spacing crops like Cotton, Sugarcane, Banana, Sunflower, etc.\r\n', 'Hand-Weeder.JPG', 'F:/project-workspace/E-Agriculture-System/WebContent/uploads/Hand-Weeder.JPG', '2022-02-18 13:26:17', '2022-02-22 19:52:35'),
(9300, 'Steel Spades', '799 Rs - 950 Rs', 'Agriculture Tool Primarily Used for Digging. It Contain a Blade Attached with a Long Handle. The Handle is Very Strong & Spade were Made with Sharper Tips of Metal. Heavy Duty Gardening Spade with Strong Wooden Handle Suitable for digging, balancing, forming hard/raw ground soil. like as a kassi fawda khurpi spade or hor shovel.', 'Steel-Spade.JPG', 'F:/project-workspace/E-Agriculture-System/WebContent/uploads/Steel-Spade.JPG', '2022-02-22 14:23:56', '2022-02-22 19:53:56');

-- --------------------------------------------------------

--
-- Table structure for table `tblinsecticide`
--

CREATE TABLE `tblinsecticide` (
  `id` int(11) NOT NULL,
  `insecticide_name` varchar(100) DEFAULT NULL,
  `insecticide_cost_range` varchar(100) DEFAULT NULL,
  `description` varchar(900) DEFAULT NULL,
  `insecticide_image_name` varchar(100) DEFAULT NULL,
  `insecticide_image` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblinsecticide`
--

INSERT INTO `tblinsecticide` (`id`, `insecticide_name`, `insecticide_cost_range`, `description`, `insecticide_image_name`, `insecticide_image`, `created_at`, `updated_at`) VALUES
(1490, 'Aldrin Insecticide', '230 Rs - 490 Rs', 'Exposure of Aldrin to the environment leads to the localization of the chemical compound in the air, soil, and water.', 'aldrin.jpg', 'F:/project-workspace/E-Agriculture-System/WebContent/uploads/aldrin.jpg', '2022-02-22 09:19:14', '2022-02-22 14:49:14'),
(2432, 'Profex Super Insecticide', '650 Rs - 700 Rs', 'Profex Super is a combination product for the control of bollworm complex.\r\nIt has strong contact, stomach and ovicidal action.\r\nIt is having excellent translaminar action,when sprayed on the upper surface of leaf,it immediately percolates down to lower surface of the leaf.', 'PROFEX-SUPER-INSECTICIDE.JPG', 'F:/project-workspace/E-Agriculture-System/WebContent/uploads/PROFEX-SUPER-INSECTICIDE.JPG', '2022-02-22 08:19:23', '2022-02-22 13:49:23'),
(3822, 'CVC', 'sdffsd', 'asdf', 'SVG.png', 'C:/Users/VD/Downloads/New folder (2)/E-AgriculturalSystem/E-Agriculture-System/WebContent/uploads/SVG.png', '2022-08-18 04:27:41', '2022-08-18 10:12:53'),
(5080, 'grommer', 'rawfasdfwer', 'gromeer', 'SVG.png', 'C://Users//VD//Downloads//New folder (2)//E-AgriculturalSystem//E-Agriculture-System//WebContent//uploads/SVG.png', '2022-08-18 04:40:56', '2022-08-18 10:10:56'),
(7117, 'sF', 'SDAF', 'ASDF', 'Screenshot (63).png', 'C://Users//VD//Downloads//New folder (2)//E-AgriculturalSystem//E-Agriculture-System//WebContent//uploads/Screenshot (63).png', '2022-08-18 04:41:45', '2022-08-18 10:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `tblpesticide`
--

CREATE TABLE `tblpesticide` (
  `id` int(11) NOT NULL,
  `pesticide_name` varchar(100) DEFAULT NULL,
  `pesticide_cost_range` varchar(100) DEFAULT NULL,
  `description` varchar(900) DEFAULT NULL,
  `pesticide_image_name` varchar(100) DEFAULT NULL,
  `pesticide_image` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblpesticide`
--

INSERT INTO `tblpesticide` (`id`, `pesticide_name`, `pesticide_cost_range`, `description`, `pesticide_image_name`, `pesticide_image`, `created_at`, `updated_at`) VALUES
(1941, 'Boric Powder', '175 Rs - 190 Rs', 'Boric acid is another good source for boron and is often used in clear liquid boron-based foliar fertilizers.It is used in clear liquid spray when dissolved properly.', 'Boric-Powder.JPG', 'F:/project-workspace/E-Agriculture-System/WebContent/uploads/Boric-Powder.JPG', '2022-02-22 14:35:27', '2022-02-22 20:05:27');

-- --------------------------------------------------------

--
-- Table structure for table `tblsellcrops`
--

CREATE TABLE `tblsellcrops` (
  `sell_id` int(11) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(100) DEFAULT NULL,
  `address` varchar(400) DEFAULT NULL,
  `crop_name` varchar(100) DEFAULT NULL,
  `crop_description` varchar(500) DEFAULT NULL,
  `crop_quantity` varchar(100) DEFAULT NULL,
  `admin_name` varchar(100) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblsellcrops`
--

INSERT INTO `tblsellcrops` (`sell_id`, `customer_name`, `email_id`, `mobile_no`, `address`, `crop_name`, `crop_description`, `crop_quantity`, `admin_name`, `status`, `created_at`, `updated_at`) VALUES
(98, 'vd', 'vrushalcust@mail.com', '9139848902', 'adsf,asdf,dsaf,1234', 'gova', 'gova', '400kg', 'vrushaladmin', 'Accept Crop', '2022-08-18 04:59:28', '2022-08-18 10:30:57'),
(3399, 'Kishor Kadam', 'kadamk329@yahoo.com', '9404308673', 'Bhalawani, Ahmednagar,Maharashtra,India,414103', 'Wheat Crop', 'Its an sarbati wheat, Its an awesome wheat quality to daily eating.', '650 KG', 'Sagar Prakash Kharmale', 'Accept Crop', '2022-03-20 13:44:19', '2022-03-20 19:17:24'),
(7210, 'vd', 'vrushalcust@mail.com', '9139848902', 'adsf,asdf,dsaf,1234', 'Sweetcorn', 'Yellow Sweetcorn ', '800kg', 'vrushaladmin', 'Accept Crop', '2022-08-18 12:55:46', '2022-08-18 18:26:36'),
(7426, 'Kishor Kadam', 'kadamk329@yahoo.com', '9404308673', 'Bhalawani, Ahmednagar,Maharashtra,India,414103', 'Chickpea Crop', 'Testy for eating.', '800 KG', 'Sagar Prakash Kharmale', 'Pending', '2022-03-20 13:45:35', '2022-03-20 19:15:35'),
(8884, 'Kishor Kadam', 'kadamk329@yahoo.com', '9404308673', 'Bhalawani, Ahmednagar,Maharashtra,India,414103', 'Jwar Crop', 'Its a awesome quality.', '1200 KG', 'Kishor Kadam', 'Reject Crop', '2022-03-20 13:44:58', '2022-03-20 19:16:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontact`
--
ALTER TABLE `tblcontact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `tblcrops`
--
ALTER TABLE `tblcrops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblequipements`
--
ALTER TABLE `tblequipements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblinsecticide`
--
ALTER TABLE `tblinsecticide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpesticide`
--
ALTER TABLE `tblpesticide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsellcrops`
--
ALTER TABLE `tblsellcrops`
  ADD PRIMARY KEY (`sell_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8033;

--
-- AUTO_INCREMENT for table `tblcontact`
--
ALTER TABLE `tblcontact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblcrops`
--
ALTER TABLE `tblcrops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8317;

--
-- AUTO_INCREMENT for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8883;

--
-- AUTO_INCREMENT for table `tblequipements`
--
ALTER TABLE `tblequipements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9301;

--
-- AUTO_INCREMENT for table `tblinsecticide`
--
ALTER TABLE `tblinsecticide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7118;

--
-- AUTO_INCREMENT for table `tblpesticide`
--
ALTER TABLE `tblpesticide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5198;

--
-- AUTO_INCREMENT for table `tblsellcrops`
--
ALTER TABLE `tblsellcrops`
  MODIFY `sell_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8885;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
