-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 03, 2016 at 08:51 AM
-- Server version: 5.1.33
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `GHC`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE IF NOT EXISTS `booking` (
  `BOOKINGID` int(11) NOT NULL,
  `BOOKINGDATE` date NOT NULL,
  `AVAILABLESTATUS` varchar(150) NOT NULL,
  `SPECIALISTID` int(11) NOT NULL,
  `ROOMID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BOOKINGID`, `BOOKINGDATE`, `AVAILABLESTATUS`, `SPECIALISTID`, `ROOMID`) VALUES
(1, '2016-11-03', 'Y', 1, 1),
(2, '2016-11-02', 'Y', 2, 1),
(3, '2016-11-01', 'N', 1, 1),
(4, '2016-10-03', 'Y', 3, 1),
(5, '2016-10-03', 'Y', 1, 2),
(6, '2016-09-03', 'Y', 4, 1),
(7, '2016-08-02', 'Y', 1, 3),
(8, '2016-10-07', 'Y', 2, 1),
(9, '2016-10-08', 'Y', 1, 1),
(10, '2016-10-09', 'N', 5, 2),
(11, '2016-10-12', 'Y', 1, 1),
(12, '2016-10-23', 'Y', 6, 2),
(13, '2016-10-25', 'Y', 1, 1),
(14, '2016-10-22', 'N', 7, 3),
(15, '2016-10-21', 'Y', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE IF NOT EXISTS `patient` (
  `PATIENTID` int(11) NOT NULL,
  `FULLNAME` varchar(100) NOT NULL,
  `ADDRESS` varchar(150) NOT NULL,
  `GENDER` char(1) NOT NULL,
  `PHONE` varchar(50) NOT NULL,
  `EMAIL` int(30) NOT NULL,
  `STATE` varchar(30) NOT NULL,
  `ZIP` varchar(30) NOT NULL,
  `REGISTERID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`PATIENTID`, `FULLNAME`, `ADDRESS`, `GENDER`, `PHONE`, `EMAIL`, `STATE`, `ZIP`, `REGISTERID`) VALUES
(1, 'Jackulin', 'New York', 'M', '882-123-4563', 0, 'NY', '25631', 1),
(2, 'Janet', '203 Rupert Drive', 'M', '882-123-4563', 0, 'NY', '25631', 1),
(3, 'James', 'New York', 'M', '882-123-4563', 0, 'NY', '25631', 1),
(4, 'Lamb', '78 The Trees', 'M', '882-123-4563', 0, 'NY', '25631', 1),
(5, 'Frances', 'New York', 'M', '882-123-4563', 0, 'NY', '25631', 1),
(6, 'Glew', 'New York', 'M', '882-123-4563', 0, 'NY', '25631', 1),
(7, 'Gallimore', 'New York', 'M', '882-123-4563', 0, 'NY', '25631', 1),
(8, 'Julie', '55 Penny Lane', 'M', '882-123-4563', 0, 'NY', '25631', 1),
(9, 'Evans', 'New York', 'M', '882-123-4563', 0, 'NY', '25631', 1),
(10, 'Duncan', 'New York', 'M', '882-123-4563', 0, 'NY', '25631', 1),
(11, 'Hayter', '707 Oxford Road', 'M', '882-123-4563', 0, 'NY', '25631', 1),
(12, 'Arthur', 'New York', 'M', '882-123-4563', 0, 'NY', '25631', 1),
(13, 'Everard', '22 Rudding Park View', 'M', '882-123-4563', 0, 'NY', '25631', 1),
(14, 'Donald', 'New York', 'M', '882-123-4563', 0, 'NY', '25631', 1),
(15, 'Dennison', '29 Gelder Street', 'M', '882-123-4563', 0, 'NY', '25631', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `PAYMENTID` int(11) NOT NULL,
  `PAYMENTDATE` date NOT NULL,
  `CHARGE` decimal(10,0) NOT NULL,
  `PAYMENTTYPE` varchar(50) NOT NULL,
  `PATIENTID` int(11) NOT NULL,
  `SPECIALISTID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PAYMENTID`, `PAYMENTDATE`, `CHARGE`, `PAYMENTTYPE`, `PATIENTID`, `SPECIALISTID`) VALUES
(1, '2016-11-03', 200, '1', 1, 1),
(2, '2016-11-02', 300, '2', 3, 2),
(3, '2016-11-01', 400, '1', 1, 4),
(4, '2016-11-04', 500, '1', 2, 3),
(5, '2016-11-05', 200, '2', 7, 9),
(6, '2016-11-06', 600, '1', 8, 10),
(7, '2016-11-08', 700, '1', 1, 5),
(8, '2016-11-07', 800, '1', 9, 12),
(9, '2016-11-09', 900, '2', 4, 11),
(10, '2016-11-10', 1200, '1', 1, 6),
(11, '2016-11-11', 2200, '1', 1, 13),
(12, '2016-11-12', 2000, '1', 5, 7),
(13, '2016-11-13', 350, '2', 10, 15),
(14, '2016-11-14', 250, '1', 6, 8),
(15, '2016-11-15', 120, '1', 11, 14);

-- --------------------------------------------------------

--
-- Table structure for table `paymenttype`
--

CREATE TABLE IF NOT EXISTS `paymenttype` (
  `PAYMENTTYPEID` int(11) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymenttype`
--

INSERT INTO `paymenttype` (`PAYMENTTYPEID`, `DESCRIPTION`) VALUES
(1, 'Crdit Card'),
(2, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE IF NOT EXISTS `register` (
  `REGISTERID` int(11) NOT NULL,
  `REGISTERDATE` date NOT NULL,
  `SPECIALISTID` int(11) NOT NULL,
  `FULLNAME` varchar(100) NOT NULL,
  `MARITALSTATUS` char(1) NOT NULL,
  `SEX` char(1) NOT NULL,
  `DATEOFBIRTH` date NOT NULL,
  `CONTACTADDRESS` varchar(150) NOT NULL,
  `CONTACTNUMBER` varchar(30) NOT NULL,
  `EMERGENCYCONTACTDETAILS` varchar(150) NOT NULL,
  `HIGHESTEDUCATIONS` varchar(150) NOT NULL,
  `SPECIALIZATIONAREA` varchar(150) NOT NULL,
  `TRAININGCERTIFICATES` varchar(150) NOT NULL,
  `MEMBERSHIPOFPROFESSIONAL` varchar(150) NOT NULL,
  `VALIDDOCUMENTS` varchar(150) NOT NULL,
  `PHOTOGRAPHS` blob NOT NULL,
  `VALIDCRB` varchar(100) NOT NULL,
  `REFERENCES` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`REGISTERID`, `REGISTERDATE`, `SPECIALISTID`, `FULLNAME`, `MARITALSTATUS`, `SEX`, `DATEOFBIRTH`, `CONTACTADDRESS`, `CONTACTNUMBER`, `EMERGENCYCONTACTDETAILS`, `HIGHESTEDUCATIONS`, `SPECIALIZATIONAREA`, `TRAININGCERTIFICATES`, `MEMBERSHIPOFPROFESSIONAL`, `VALIDDOCUMENTS`, `PHOTOGRAPHS`, `VALIDCRB`, `REFERENCES`) VALUES
(1, '2016-11-03', 1, 'Mikasa ', 'M', 'F', '2000-11-02', '65, Jackson Height', '852-236-5632', '001-256-5632', 'University Certificate', 'Gastroenterology', 'Medical Council', 'Medical Council', 'Yes', '', 'Yes', 'Dr. Jaccky'),
(2, '2016-11-03', 1, 'Frances', 'M', 'F', '2000-11-03', '65, Jackson Height', '852-236-5633', '001-256-5632', 'University Certificate', 'ENT', 'Medical Council', 'Medical Council', 'Yes', '', 'Yes', 'Dr. Robin'),
(3, '2016-11-03', 1, 'Glew', 'M', 'F', '2000-11-01', '65, Jackson Height', '852-236-5634', '001-256-5632', 'Training Certificate', 'Orthopedic', 'Medical Council', 'Medical Council', 'Yes', '', 'Yes', 'Dr. Jaccky'),
(4, '2016-11-03', 1, 'Julie', 'M', 'F', '2000-11-04', '65, Jackson Height', '852-236-5635', '001-256-5632', 'University Certificate', 'Cardiology', 'Medical Council', 'Medical Council', 'Yes', '', 'Yes', 'Dr. Jaccky'),
(5, '2016-11-03', 1, 'Evans', 'M', 'F', '2000-11-05', '65, Jackson Height', '852-236-5636', '001-256-5632', 'Medical Board Certificate', 'Endocrinology', 'Medical Council', 'Medical Council', 'Yes', '', 'Yes', 'Dr. Jaccky'),
(6, '2016-11-03', 1, 'Hayter', 'M', 'F', '2000-11-05', '65, Jackson Height', '852-236-5637', '001-256-5632', 'Training Certificate', 'Gastroenterology', 'Medical Council', 'Medical Council', 'Yes', '', 'Yes', 'Dr. Evans'),
(7, '2016-11-03', 1, 'Duncan', 'M', 'F', '2000-11-06', '65, Jackson Height', '852-236-5638', '001-256-5632', 'University Certificate', 'Neurology', 'Medical Council', 'Medical Council', 'Yes', '', 'Yes', 'Dr. Jaccky'),
(8, '2016-11-03', 1, 'Arthur', 'M', 'F', '2000-11-07', '65, Jackson Height', '852-236-5639', '001-256-5632', 'Medical Board Certificate', 'Urology', 'Medical Council', 'Medical Council', 'Yes', '', 'Yes', 'Dr. Jaccky'),
(9, '2016-11-03', 1, 'Harris', 'M', 'F', '2000-11-07', '65, Jackson Height', '852-236-5620', '001-256-5632', 'University Certificate', 'Paediatrics', 'Medical Council', 'Medical Council', 'Yes', '', 'Yes', 'Dr. Jaccky'),
(10, '2016-11-03', 1, 'Cartright', 'M', 'F', '2000-11-09', '65, Jackson Height', '852-236-5642', '001-256-5632', 'University Certificate', 'Rheumatology', 'Medical Council', 'Medical Council', 'Yes', '', 'Yes', 'Dr. Evans'),
(11, '2016-11-03', 1, 'Barry', 'M', 'F', '2000-11-10', '65, Jackson Height', '852-236-5652', '001-256-5632', 'Training Certificate', 'Cardiology', 'Medical Council', 'Medical Council', 'Yes', '', 'Yes', 'Dr. Jaccky'),
(12, '2016-11-03', 1, 'Everard', 'M', 'F', '2000-11-11', '65, Jackson Height', '852-236-5644', '001-256-5632', 'University Certificate', 'Cardiology', 'Medical Council', 'Medical Council', 'Yes', '', 'Yes', 'Dr. Jaccky'),
(13, '2016-11-03', 1, 'Roberts', 'M', 'F', '2000-11-12', '65, Jackson Height', '852-236-5732', '001-256-5632', 'Medical Board Certificate', 'Rheumatology', 'Medical Council', 'Medical Council', 'Yes', '', 'Yes', 'Dr. Jaccky'),
(14, '2016-11-03', 1, 'John', 'M', 'F', '2000-11-13', '65, Jackson Height', '852-236-5332', '001-256-5632', 'University Certificate', 'Urology', 'Medical Council', 'Medical Council', 'Yes', '', 'Yes', 'Dr. Jaccky'),
(15, '2016-11-03', 1, 'Mika', 'M', 'F', '2000-11-14', '65, Jackson Height', '852-236-5232', '001-256-5632', 'University Certificate', 'Gastroenterology', 'Medical Council', 'Medical Council', 'Yes', '', 'Yes', 'Dr. Evans');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `ROOMID` int(11) NOT NULL,
  `DESCRIPTION` varchar(100) NOT NULL,
  `AVAILABLESTATUS` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`ROOMID`, `DESCRIPTION`, `AVAILABLESTATUS`) VALUES
(1, 'Single', 'Y'),
(2, 'Double', 'Y'),
(3, 'Master', 'Y'),
(4, 'Classic', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `SESSIONID` int(11) NOT NULL,
  `SESSIONNAME` varchar(150) NOT NULL,
  `TIMESLOT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ROOMID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`SESSIONID`, `SESSIONNAME`, `TIMESLOT`, `ROOMID`) VALUES
(1, 'Morning Session', '0000-00-00 00:00:00', 1),
(2, 'Afternoon Session', '0000-00-00 00:00:00', 2),
(3, 'Evening Session', '0000-00-00 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

CREATE TABLE IF NOT EXISTS `specialist` (
  `SPECIALISTID` int(11) NOT NULL,
  `FULLNAME` varchar(100) NOT NULL,
  `ADDRESS` varchar(150) NOT NULL,
  `GENDER` char(1) NOT NULL,
  `PHONE` varchar(50) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `STATE` varchar(30) NOT NULL,
  `ZIP` varchar(30) NOT NULL,
  `REGISTERID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specialist`
--

INSERT INTO `specialist` (`SPECIALISTID`, `FULLNAME`, `ADDRESS`, `GENDER`, `PHONE`, `EMAIL`, `STATE`, `ZIP`, `REGISTERID`) VALUES
(1, 'Adam', 'California', 'M', '882-123-4563', 'robin@yahoo.com', 'CA', '41256', 1),
(2, 'Hazel', 'California', 'M', '882-123-4563', 'hazel@yahoo.com', 'CA', '41256', 2),
(3, 'Lambert', 'California', 'M', '882-123-4563', 'lambert@yahoo.com', 'CA', '41256', 3),
(4, 'Christopher', 'California', 'M', '882-123-4563', 'chrisp@yahoo.com', 'CA', '41256', 4),
(5, 'Fuller', 'California', 'F', '882-123-4563', 'fuller@yahoo.com', 'CA', '41256', 5),
(6, 'Gabrielle', 'California', 'M', '882-123-4563', 'gabrile@yahoo.com', 'CA', '41256', 6),
(7, 'Becks', 'California', 'M', '882-123-4563', 'beck@yahoo.com', 'CA', '41256', 7),
(8, 'Ian', 'California', 'M', '882-123-4563', 'ian@yahoo.com', 'CA', '41256', 8),
(9, 'Hamley', 'California', 'M', '882-123-4563', 'hamley@yahoo.com', 'CA', '41256', 9),
(10, 'Everard', 'California', 'M', '882-123-4563', 'everad@yahoo.com', 'CA', '41256', 10),
(11, 'Cartright', 'California', 'M', '882-123-4563', 'catridge@yahoo.com', 'CA', '41256', 11),
(12, 'Barry', 'California', 'M', '882-123-4563', 'barry@yahoo.com', 'CA', '41256', 12),
(13, 'Roberts', 'California', 'M', '882-123-4563', 'robert@yahoo.com', 'CA', '41256', 13),
(14, 'Julie', 'California', 'F', '882-123-4563', 'julie@yahoo.com', 'CA', '41256', 14),
(15, 'Mart', 'California', 'M', '882-123-4563', 'mart@yahoo.com', 'CA', '41256', 15);
