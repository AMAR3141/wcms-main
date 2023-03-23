-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2023 at 05:26 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `star_battery`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_user`
--

CREATE TABLE `api_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Address` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `api_user`
--

INSERT INTO `api_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `Phone`, `Address`, `image`) VALUES
(1, 'pbkdf2_sha256$390000$5eqUzVLGXV7vG4321BCF8f$MOCNx2jP+7Vh1gUUNBqdA3OT5QGI5yqJ+MPgM72IXS8=', '2023-03-21 18:23:09.000000', 1, 'admin', '', '', '', 1, 1, '2023-03-21 18:22:53.000000', '0000000000', '.....', ''),
(38, '1234', NULL, 0, 'ssaud', 'saud', 'shaikh', 'saud.shaikh@gmail.com', 0, 1, '2023-03-22 14:53:39.944002', '1234567890', '164bnsfshfsnffn', ''),
(39, '1234', NULL, 0, 'tparth', 'parth', 'Tawde', 'part.tawde@gmail.com', 0, 1, '2023-03-22 14:54:44.827480', '0123456789', '...', ''),
(40, '1234', NULL, 0, 'sprem', 'Prem', 'Sathe', 'prem.sathe@gmail.com', 0, 1, '2023-03-22 15:02:04.987181', '9137269347', '164bnsfshfsnffn', ''),
(43, '1234', NULL, 0, 'pamar', 'Amar ', 'Patil', 'amar.patil@gmail.com', 0, 1, '2023-03-22 16:21:14.086174', '7021162989', '164bnsfshfsnffn', 'Media/UserImg/6641-_soft.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `api_user_groups`
--

CREATE TABLE `api_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `api_user_user_permissions`
--

CREATE TABLE `api_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `api_warrenty_claims`
--

CREATE TABLE `api_warrenty_claims` (
  `Ticket_no` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Middle_Name` varchar(100) NOT NULL,
  `Last_Name` varchar(100) NOT NULL,
  `contact_no` varchar(100) NOT NULL,
  `Battery_brand` varchar(100) NOT NULL,
  `Battery_type` varchar(100) NOT NULL,
  `Battery_SerialNumber` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `api_warrenty_claims`
--

INSERT INTO `api_warrenty_claims` (`Ticket_no`, `Name`, `Middle_Name`, `Last_Name`, `contact_no`, `Battery_brand`, `Battery_type`, `Battery_SerialNumber`, `Status`) VALUES
(1, 'Saud', 'Javed', 'Shaikh', '9920190568', 'Exide', 'XLTZ4', 'M6H2B833523', 'Pending'),
(2, 'Amar', 'Ashok', 'Patil', '7021162989', 'Powerzone', '95D26L', 'CEF9648W212293', 'Approved'),
(3, 'Parth', 'blank', 'Tawde', '7021143233', 'Livguard', 'AR32', 'AA1APITCA42219C1', 'Pending'),
(4, 'Prem', 'Prakash', 'Sathe', '9137269347', 'Amaron', '40B20L', 'FEG9650W216113', 'Pending'),
(5, 'Ravi', 'blank', 'Patil', '1234567890', 'Exide', 'ML38B20L', 'M7K1T987345', 'Approved'),
(6, 'Jadu', 'Shyam', 'Pande', '0321654987', 'Livguard', 'INVERTUFF', 'FEG9650W216119', 'Approved'),
(7, 'Hari', 'kela', 'more', '7892134560', 'Amaron', 'xxxxxxx', 'M6H2B833000', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add warrenty_claims', 6, 'add_warrenty_claims'),
(22, 'Can change warrenty_claims', 6, 'change_warrenty_claims'),
(23, 'Can delete warrenty_claims', 6, 'delete_warrenty_claims'),
(24, 'Can view warrenty_claims', 6, 'view_warrenty_claims'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-03-22 09:44:35.378975', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Phone\", \"Address\", \"Image\"]}}]', 7, 1),
(2, '2023-03-22 11:04:35.661899', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Phone\", \"Image\"]}}]', 7, 1),
(3, '2023-03-22 11:20:46.792616', '3', 'pamar', 3, '', 7, 1),
(4, '2023-03-22 11:21:50.195844', '9', 'pamar', 3, '', 7, 1),
(5, '2023-03-22 11:23:29.569852', '10', 'pamar', 3, '', 7, 1),
(6, '2023-03-22 11:54:17.324447', '23', '', 3, '', 7, 1),
(7, '2023-03-22 12:46:17.347739', '11', 'pamar', 3, '', 7, 1),
(8, '2023-03-22 14:07:29.386023', '26', 'pamar', 3, '', 7, 1),
(9, '2023-03-22 14:53:07.171124', '37', 'pamar', 2, '[{\"changed\": {\"fields\": [\"First name\"]}}]', 7, 1),
(10, '2023-03-22 15:04:48.208410', '37', 'pamar', 3, '', 7, 1),
(11, '2023-03-22 15:06:33.790069', '41', 'pamar', 3, '', 7, 1),
(12, '2023-03-22 16:21:11.618455', '42', 'pamar', 3, '', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'api', 'user'),
(6, 'api', 'warrenty_claims'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-03-21 18:22:27.048246'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-03-21 18:22:27.109018'),
(3, 'auth', '0001_initial', '2023-03-21 18:22:27.329669'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-03-21 18:22:27.379355'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-03-21 18:22:27.390348'),
(6, 'auth', '0004_alter_user_username_opts', '2023-03-21 18:22:27.397344'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-03-21 18:22:27.404709'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-03-21 18:22:27.408692'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-03-21 18:22:27.415896'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-03-21 18:22:27.423219'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-03-21 18:22:27.431030'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-03-21 18:22:27.449323'),
(13, 'auth', '0011_update_proxy_permissions', '2023-03-21 18:22:27.457442'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-03-21 18:22:27.464774'),
(15, 'api', '0001_initial', '2023-03-21 18:22:27.798190'),
(16, 'admin', '0001_initial', '2023-03-21 18:22:27.924276'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-03-21 18:22:27.936268'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-21 18:22:27.946263'),
(19, 'sessions', '0001_initial', '2023-03-21 18:22:27.981965'),
(20, 'api', '0002_remove_user_name_remove_user_surname', '2023-03-21 18:29:41.844625');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('sppqlz7xl2tcquftpbp6vxy34mlaiytc', '.eJxVjDkOwjAUBe_iGlmGxBslPWew_uKPA8iW4qRC3B0ipYD2zcx7qQTrUtLa85wmVmd1VIffDYEeuW6A71BvTVOryzyh3hS9066vjfPzsrt_BwV6-daUxQIAeUbJo_VyAg9kEG12VpwZRhIazcABwXsJ0QpHH4LYyI4gqvcHMRU5bw:1pegdZ:D2t6ITc6Dk7qwb91U5LQ8eJXsEUumVx-15fxb3OW7rE', '2023-04-04 18:23:09.555956');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_user`
--
ALTER TABLE `api_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `Phone` (`Phone`);

--
-- Indexes for table `api_user_groups`
--
ALTER TABLE `api_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_user_groups_user_id_group_id_9c7ddfb5_uniq` (`user_id`,`group_id`),
  ADD KEY `api_user_groups_group_id_3af85785_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `api_user_user_permissions`
--
ALTER TABLE `api_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_user_user_permissions_user_id_permission_id_a06dd704_uniq` (`user_id`,`permission_id`),
  ADD KEY `api_user_user_permis_permission_id_305b7fea_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `api_warrenty_claims`
--
ALTER TABLE `api_warrenty_claims`
  ADD PRIMARY KEY (`Ticket_no`),
  ADD UNIQUE KEY `contact_no` (`contact_no`),
  ADD UNIQUE KEY `Battery_SerialNumber` (`Battery_SerialNumber`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_api_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_user`
--
ALTER TABLE `api_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `api_user_groups`
--
ALTER TABLE `api_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_user_user_permissions`
--
ALTER TABLE `api_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `api_user_groups`
--
ALTER TABLE `api_user_groups`
  ADD CONSTRAINT `api_user_groups_group_id_3af85785_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `api_user_groups_user_id_a5ff39fa_fk_api_user_id` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`id`);

--
-- Constraints for table `api_user_user_permissions`
--
ALTER TABLE `api_user_user_permissions`
  ADD CONSTRAINT `api_user_user_permis_permission_id_305b7fea_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `api_user_user_permissions_user_id_f3945d65_fk_api_user_id` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_api_user_id` FOREIGN KEY (`user_id`) REFERENCES `api_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
