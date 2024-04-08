
--
-- Host: localhost:3306
-- 
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `HospitalSupportSystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `acc_id` int NOT NULL,
  `acc_name` varchar(200) DEFAULT NULL,
  `acc_desc` text,
  `acc_type` varchar(200) DEFAULT NULL,
  `acc_number` varchar(200) DEFAULT NULL,
  `acc_amount` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`acc_id`, `acc_name`, `acc_desc`, `acc_type`, `acc_number`, `acc_amount`) VALUES
(1, 'Individual Retirement Account', '<p>IRA&rsquo;s are simply an account where you stash your money for retirement. The concept is pretty simple, your account balance is not taxed UNTIL you withdraw, at which point you pay the taxes there. This allows you to grow your account with interest without taxes taking away from the balance. The net result is you earn more money.</p>', 'Payable Account', '518703294', '25000'),
(2, 'Equity Bank', '<p>Find <em>bank account</em> stock <em>images</em> in HD and millions of other royalty-free stock photos, illustrations and vectors in the Shutterstock collection. Thousands of new</p>', 'Receivable Account', '753680912', '12566'),
(3, 'Test Account Name', '<p>This is a demo test</p>', 'Payable Account', '620157843', '1100');

-- --------------------------------------------------------

--
-- Table structure for table `hss_admin`
--

CREATE TABLE `hss_admin` (
  `ad_id` int NOT NULL,
  `ad_fname` varchar(200) DEFAULT NULL,
  `ad_lname` varchar(200) DEFAULT NULL,
  `ad_email` varchar(200) DEFAULT NULL,
  `ad_pwd` varchar(200) DEFAULT NULL,
  `ad_dpic` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hss_admin`
--

INSERT INTO `hss_admin` (`ad_id`, `ad_fname`, `ad_lname`, `ad_email`, `ad_pwd`, `ad_dpic`) VALUES
(1, 'Keshav', 'Administrator', 'admin@gmail.com', '4c7f5919e957f354d57243d37f223cf31e9e7181', 'defaultimg.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appt_id` int NOT NULL,
  `doc_dept` varchar(255) DEFAULT NULL,
  `doc_id` int DEFAULT NULL, 
  `pat_id` int DEFAULT NULL,
  `appointmentDate` varchar(255) DEFAULT NULL,
  `appointmentTime` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `userStatus` int DEFAULT NULL,
  `doctorStatus` int DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appt_id`, `doc_dept`, `doc_id`, `pat_id`,  `appointmentDate`, `appointmentTime`, `postingDate`, `userStatus`, `doctorStatus`, `updationDate`) VALUES
(1, 'Laborotory', 1, 1, '2023-11-10', '12:45 PM', '2022-11-06 12:21:48', 1, 0, '2022-11-06 12:23:35'),
(2, 'Surgery | Theatre', 1, 2, '2023-11-17', '7:00 PM', '2022-11-06 13:16:18', 1, 1,'2022-11-06 12:24:35' );

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `asst_id` int NOT NULL,
  `asst_name` varchar(200) DEFAULT NULL,
  `asst_desc` longtext,
  `asst_vendor` varchar(200) DEFAULT NULL,
  `asst_status` varchar(200) DEFAULT NULL,
  `asst_dept` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `docs`
--

CREATE TABLE `docs` (
  `doc_id` int NOT NULL,
  `doc_fname` varchar(200) DEFAULT NULL,
  `doc_lname` varchar(200) DEFAULT NULL,
  `doc_email` varchar(200) DEFAULT NULL,
  `doc_pwd` varchar(200) DEFAULT NULL,
  `doc_dept` varchar(200) DEFAULT NULL,
  `doc_number` varchar(200) DEFAULT NULL,
  `doc_dpic` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `docs`
--

INSERT INTO `docs` (`doc_id`, `doc_fname`, `doc_lname`, `doc_email`, `doc_pwd`, `doc_dept`, `doc_number`, `doc_dpic`) VALUES
(1, 'Surya', 'Lamsal', 'surya@gmail.com', '4c7f5919e957f354d57243d37f223cf31e9e7181', 'Laboratory', 'BKTWQ', 'defaultimg.jpg'),
(2, 'Roshan', 'Paudel', 'roshan@gmail.com', '4c7f5919e957f354d57243d37f223cf31e9e7181', 'Surgery | Theatre', 'AKTWQ', 'defaultimg.jpg'),
(3, 'Menaka', 'Pun', 'menaka@gmail.com', '4c7f5919e957f354d57243d37f223cf31e9e7181', 'Surgery | Theatre', 'MKTWQ', 'defaultimg.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `equipments`
--

CREATE TABLE `equipments` (
  `eqp_id` int NOT NULL,
  `eqp_code` varchar(200) DEFAULT NULL,
  `eqp_name` varchar(200) DEFAULT NULL,
  `eqp_vendor` varchar(200) DEFAULT NULL,
  `eqp_desc` longtext,
  `eqp_dept` varchar(200) DEFAULT NULL,
  `eqp_status` varchar(200) DEFAULT NULL,
  `eqp_qty` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipments`
--

INSERT INTO `equipments` (`eqp_id`, `eqp_code`, `eqp_name`, `eqp_vendor`, `eqp_desc`, `eqp_dept`, `eqp_status`, `eqp_qty`) VALUES
(1, '178640239', 'TestTubes', 'Casio', '<p>Testtubes are used to perform lab tests--</p>', 'Laboratory', 'Functioning', '700000'),
(2, '052367981', 'Surgical Robot', 'Nexus', '<p>Surgical Robots aid in surgey process.</p>', 'Surgical | Theatre', 'Functioning', '100');

-- --------------------------------------------------------

--
-- Table structure for table `laboratory`
--

CREATE TABLE `laboratory` (
  `lab_id` int NOT NULL,
  `lab_pat_name` varchar(200) DEFAULT NULL,
  `lab_pat_ailment` varchar(200) DEFAULT NULL,
  `lab_pat_number` varchar(200) DEFAULT NULL,
  `lab_pat_tests` longtext,
  `lab_pat_results` longtext,
  `lab_number` varchar(200) DEFAULT NULL,
  `lab_date_rec` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laboratory`
--

INSERT INTO `laboratory` (`lab_id`, `lab_pat_name`, `lab_pat_ailment`, `lab_pat_number`, `lab_pat_tests`, `lab_pat_results`, `lab_number`, `lab_date_rec`) VALUES
(1, 'Jagat Archarya ', 'Malaria', 'DCRI8', '<ul><li><a href=\"https://www.medicalnewstoday.com/articles/179211.php\">Non-steroidal anti-inflammatory drugs</a> (NSAIDs) such as <a href=\"https://www.medicalnewstoday.com/articles/161255.php\">aspirin</a> or ibuprofen can help bring a fever down. These are available to purchase over-the-counter or <a target=\"_blank\" href=\"https://amzn.to/2qp3d0b\">online</a>. However, a mild fever may be helping combat the bacterium or virus that is causing the infection. It may not be ideal to bring it down.</li><li>If the fever has been caused by a bacterial infection, the doctor may prescribe an <a href=\"https://www.medicalnewstoday.com/articles/10278.php\">antibiotic</a>.</li><li>If a fever has been caused by a cold, which is caused by a viral infection, NSAIDs may be used to relieve uncomfortable symptoms. Antibiotics have no effect against viruses and will not be prescribed by your doctor for a viral infection.</li></ul>', '<ul><li>If the fever has been caused by a bacterial infection, the doctor may prescribe an <a href=\"https://www.medicalnewstoday.com/articles/10278.php\">antibiotic</a>.</li><li>If a fever has been caused by a cold, which is caused by a viral infection, NSAIDs may be used to relieve uncomfortable symptoms. Antibiotics have no effect against viruses and will not be prescribed by your doctor for a viral infection.</li></ul>', 'K67PL', '2023-11-12 13:32:07'),
(2, 'Deepak Dhahal ', 'Demo Test', 'ISL1E', '<ul><li>Body temperature</li><li>Blood</li><li>Stool</li><li>Urine</li></ul>', '<ul><li>Body Temperature 67 Degree Celcious(Abnormal)</li><li>Blood - Malaria Bacterial Tested Postive</li><li>Stool - Mucus tested postive</li><li>Urine -Urea Level were 20% higher than normal</li></ul><p><strong>Fever Tested Positive</strong></p>', '9DMN5', '2023-11-12 13:41:07'),
(3, 'Sushath Regmi', 'Demo Test', '3Z14K', '<p><strong>Pain areas: </strong>in the abdomen or muscles</p><p><strong>Whole body: </strong>chills, fatigue, fever, night sweats, shivering, or sweating</p><p><strong>Gastrointestinal: </strong>diarrhoea, nausea, or vomiting</p><p><strong>Also common: </strong>fast heart rate, headache, mental confusion, or pallor</p>', '<p><strong>Pain areas: </strong>in the abdomen or muscles -Tested Positive</p><p><strong>Whole body: </strong>chills, fatigue, fever, night sweats, shivering, or sweating - Tested Positive</p><p><strong>Gastrointestinal: </strong>diarrhoea, nausea, or vomiting - Tested Positive</p><p>&nbsp;</p>', '90ZNX', '2023-11-13 12:31:48'),
(4, 'Ankit Pageni', 'Demo Test', 'KU8W4', '<p>demo demo demo demo</p>', '<p>54545</p>', 'G0VZU', '2023-11-14 17:48:05');

-- --------------------------------------------------------

--
-- Table structure for table `medical_records`
--

CREATE TABLE `medical_records` (
  `mdr_id` int NOT NULL,
  `mdr_number` varchar(200) DEFAULT NULL,
  `mdr_pat_name` varchar(200) DEFAULT NULL,
  `mdr_pat_adr` varchar(200) DEFAULT NULL,
  `mdr_pat_age` varchar(200) DEFAULT NULL,
  `mdr_pat_ailment` varchar(200) DEFAULT NULL,
  `mdr_pat_number` varchar(200) DEFAULT NULL,
  `mdr_pat_prescr` longtext,
  `mdr_date_rec` timestamp(4) NOT NULL DEFAULT CURRENT_TIMESTAMP(4) ON UPDATE CURRENT_TIMESTAMP(4)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medical_records`
--

INSERT INTO `medical_records` (`mdr_id`, `mdr_number`, `mdr_pat_name`, `mdr_pat_adr`, `mdr_pat_age`, `mdr_pat_ailment`, `mdr_pat_number`, `mdr_pat_prescr`, `mdr_date_rec`) VALUES
(1, 'ZNXI4', 'Jagat Acharya', 'pokhara', '22', 'Malaria', 'RAV6C', '<ul><li>Combination of atovaquone and proguanil (Malarone)</li><li>Quinine sulfate (Qualaquin) with doxycycline (Vibramycin, Monodox, others)</li><li>Mefloquine.</li><li>Primaquine phosphate.</li></ul>', '2023-11-11 5:03:05.9839'),
(2, 'MIA9P', 'Deepak Dhahal', 'pokhara', '22', 'Demo Test', '3Z14K', NULL, '2023-11-11 17:07:46.7306'),
(3, 'F1ZHQ', 'Sushath Regmi', 'sangja', '22', 'Demo Test', 'DCRI8', NULL, '2023-11-11 17:08:35.7938'),
(4, 'ZLN0Q', 'Ankit Pageni', 'sangja', '22', 'Demo Test', 'ISL1E', '<ol><li>sample</li><li>sampl</li><li>sample</li><li>sample</li></ol>', '2023-11-11 17:22:15.7034');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `pat_id` int NOT NULL,
  `pat_fname` varchar(200) DEFAULT NULL,
  `pat_lname` varchar(200) DEFAULT NULL,
  `pat_dob` varchar(200) DEFAULT NULL,
  `pat_age` varchar(200) DEFAULT NULL,
  `pat_number` varchar(200) DEFAULT NULL,
  `pat_addr` varchar(200) DEFAULT NULL,
  `pat_phone` varchar(200) DEFAULT NULL,
  `pat_type` varchar(200) DEFAULT NULL,
  `pat_date_joined` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `pat_ailment` varchar(200) DEFAULT NULL,
  `pat_discharge_status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`pat_id`, `pat_fname`, `pat_lname`, `pat_dob`, `pat_age`, `pat_number`, `pat_addr`, `pat_phone`, `pat_type`, `pat_date_joined`, `pat_ailment`, `pat_discharge_status`) VALUES
(1, 'Jagat', 'Acharya', '02/02/2001', '22', 'DCRI8', 'pokhara', '1458887854', 'InPatient', '2023-11-18 16:28:51.469431', 'Demo Test', NULL),
(2, 'Depak', 'Dhahal', '01/19/2001', '22', 'ISL1E', 'pokhara', '7412225698', 'InPatient', '2023-11-18 16:53:26.210951', 'Demo Test', NULL),
(3, 'Susanth', 'Regmi', '10/11/2001', '22', '3Z14K', 'sangja', '1478885458', 'InPatient', '2023-11-18 16:54:53.104490', 'Demo Test', NULL),
(4, 'Ankit', 'Pageni', '01/01/2001', '22', 'KU8W4', 'sangja', '1458889655', 'OutPatient', '2023-11-20 17:26:45.256878', 'Test Test', NULL),
(5, 'Manika', 'Gurung', '11/06/2001', '22', '4TLG0', 'pokhara', '7412569698', 'InPatient', '2023-11-22 10:38:30.937516', 'Demo Test', NULL),
(6, 'Pradip', 'Adhikari', '13/01/2001', '22', '85NFV', 'pokhara', '01608445456', 'InPatient', '2023-11-24 12:33:05.095935', 'A01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient_transfers`
--

CREATE TABLE `patient_transfers` (
  `t_id` int NOT NULL,
  `t_hospital` varchar(200) DEFAULT NULL,
  `t_date` varchar(200) DEFAULT NULL,
  `t_pat_name` varchar(200) DEFAULT NULL,
  `t_pat_number` varchar(200) DEFAULT NULL,
  `t_status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_transfers`
--

INSERT INTO `patient_transfers` (`t_id`, `t_hospital`, `t_date`, `t_pat_name`, `t_pat_number`, `t_status`) VALUES
(1, 'Monipal Hospital', '2022-01-11', 'Suman Pun', '9KXPM', 'Success');

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `pay_id` int NOT NULL,
  `pay_number` varchar(200) DEFAULT NULL,
  `pay_doc_name` varchar(200) DEFAULT NULL,
  `pay_doc_number` varchar(200) DEFAULT NULL,
  `pay_doc_email` varchar(200) DEFAULT NULL,
  `pay_emp_salary` varchar(200) DEFAULT NULL,
  `pay_date_generated` timestamp(4) NOT NULL DEFAULT CURRENT_TIMESTAMP(4) ON UPDATE CURRENT_TIMESTAMP(4),
  `pay_status` varchar(200) DEFAULT NULL,
  `pay_descr` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payrolls`
--

INSERT INTO `payrolls` (`pay_id`, `pay_number`, `pay_doc_name`, `pay_doc_number`, `pay_doc_email`, `pay_emp_salary`, `pay_date_generated`, `pay_status`, `pay_descr`) VALUES
(1, 'HUT1B', 'Surya Lamsal', 'BKTWQ', 'surya@gmail.com', '75000', '2023-11-20 17:14:18.3708', 'Paid', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a,</p>'),
(2, 'T294L', 'Roshan Paudel', 'AKTWQ', 'roshan@gmail.com', '70000', '2023-11-20 17:14:50.5588', 'Paid', '<p>demo demo demo demo demo</p>'),
(3, '3UOXY', 'Menaka Pun', 'MKTWQ', 'menaka@gmail.com', '4150', '2023-11-22 11:04:36.9626', NULL, '<p>This is a demo payroll description for test!!</p>');

-- --------------------------------------------------------

--
-- Table structure for table `pharmaceuticals`
--

CREATE TABLE `pharmaceuticals` (
  `phar_id` int NOT NULL,
  `phar_name` varchar(200) DEFAULT NULL,
  `phar_bcode` varchar(200) DEFAULT NULL,
  `phar_desc` longtext,
  `phar_qty` varchar(200) DEFAULT NULL,
  `phar_cat` varchar(200) DEFAULT NULL,
  `phar_vendor` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmaceuticals`
--

INSERT INTO `pharmaceuticals` (`phar_id`, `phar_name`, `phar_bcode`, `phar_desc`, `phar_qty`, `phar_cat`, `phar_vendor`) VALUES
(1, 'Paracetamol', '134057629', '<ul><li><strong>Paracetamol</strong>, also known as <strong>acetaminophen</strong> and <strong>APAP</strong>, is a medication used to treat <a href=\"https://en.wikipedia.org/wiki/Pain\">pain</a> and <a href=\"https://en.wikipedia.org/wiki/Fever\">fever</a>. It is typically used for mild to moderate pain relief. There is mixed evidence for its use to relieve fever in children.&nbsp; It is often sold in combination with other medications, such as in many <a href=\"https://en.wikipedia.org/wiki/Cold_medication\">cold medications</a> Paracetamol is also used for severe pain, such as <a href=\"https://en.wikipedia.org/wiki/Cancer_pain\">cancer pain</a> and pain after surgery, in combination with <a href=\"https://en.wikipedia.org/wiki/Opioid_analgesic\">opioid pain medication</a>. It is typically used either by mouth or <a href=\"https://en.wikipedia.org/wiki/Rectally\">rectally</a>, but is also available by <a href=\"https://en.wikipedia.org/wiki/Intravenous\">injection into a vein</a>. Effects last between two and four hours.</li><li>Paracetamol is generally safe at recommended doses.The recommended maximum daily dose for an adult is three to four grams. Higher doses may lead to toxicity, including <a href=\"https://en.wikipedia.org/wiki/Liver_failure\">liver failure</a> Serious skin rashes may rarely occur. It appears to be safe during <a href=\"https://en.wikipedia.org/wiki/Pregnancy\">pregnancy</a> and when <a href=\"https://en.wikipedia.org/wiki/Breastfeeding\">breastfeeding</a>.In those with liver disease, it may still be used, but in lower doses. It is classified as a mild <a href=\"https://en.wikipedia.org/wiki/Analgesic\">analgesic</a>. It does not have significant <a href=\"https://en.wikipedia.org/wiki/Anti-inflammatory\">anti-inflammatory</a> activity. How it works is not entirely clear.</li><li>Paracetamol was first made in 1877. It is the most commonly used medication for pain and fever in both the United States and Europe. It is on the <a href=\"https://en.wikipedia.org/wiki/World_Health_Organization%27s_List_of_Essential_Medicines\">World Health Organization&#39;s List of Essential Medicines</a>, the safest and most effective medicines needed in a <a href=\"https://en.wikipedia.org/wiki/Health_system\">health system</a>.<a href=\"https://en.wikipedia.org/wiki/Paracetamol#cite_note-WHO21st-24\">[24]</a> Paracetamol is available as a <a href=\"https://en.wikipedia.org/wiki/Generic_medication\">generic medication</a> with trade names including <a href=\"https://en.wikipedia.org/wiki/Tylenol_(brand)\">Tylenol</a> and <a href=\"https://en.wikipedia.org/wiki/Panadol_(brand)\">Panadol</a>, among others.The wholesale price in the <a href=\"https://en.wikipedia.org/wiki/Developing_world\">developing world</a> is less than US$0.01 per dose. In the United States, it costs about US$0.04 per dose. In 2019, it was the 17th most prescribed medication in the United States, with more than 29&nbsp;million prescriptions.</li></ul>', '500', 'Antipyretics', 'Test Pharma Limited-1'),
(2, 'Aspirin', '452760813', '<ul><li><strong>Aspirin</strong>, also known as <strong>acetylsalicylic acid</strong> (<strong>ASA</strong>), is a <a href=\"https://en.wikipedia.org/wiki/Medication\">medication</a> used to reduce <a href=\"https://en.wikipedia.org/wiki/Pain\">pain</a>, <a href=\"https://en.wikipedia.org/wiki/Fever\">fever</a>, or <a href=\"https://en.wikipedia.org/wiki/Inflammation\">inflammation</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> Specific inflammatory conditions which aspirin is used to treat include <a href=\"https://en.wikipedia.org/wiki/Kawasaki_disease\">Kawasaki disease</a>, <a href=\"https://en.wikipedia.org/wiki/Pericarditis\">pericarditis</a>, and <a href=\"https://en.wikipedia.org/wiki/Rheumatic_fever\">rheumatic fever</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> Aspirin given shortly after a <a href=\"https://en.wikipedia.org/wiki/Myocardial_infarction\">heart attack</a> decreases the risk of death.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> Aspirin is also used long-term to help prevent further heart attacks, <a href=\"https://en.wikipedia.org/wiki/Ischaemic_stroke\">ischaemic strokes</a>, and <a href=\"https://en.wikipedia.org/wiki/Thrombus\">blood clots</a> in people at high risk.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> It may also decrease the risk of certain types of <a href=\"https://en.wikipedia.org/wiki/Cancer\">cancer</a>, particularly <a href=\"https://en.wikipedia.org/wiki/Colorectal_cancer\">colorectal cancer</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-6\">[6]</a> For pain or fever, effects typically begin within 30 minutes.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> Aspirin is a <a href=\"https://en.wikipedia.org/wiki/Nonsteroidal_anti-inflammatory_drug\">nonsteroidal anti-inflammatory drug</a> (NSAID) and works similarly to other NSAIDs but also suppresses the normal functioning of <a href=\"https://en.wikipedia.org/wiki/Platelet\">platelets</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a></li><li>One common <a href=\"https://en.wikipedia.org/wiki/Adverse_effect\">adverse effect</a> is an <a href=\"https://en.wikipedia.org/wiki/Upset_stomach\">upset stomach</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> More significant side effects include <a href=\"https://en.wikipedia.org/wiki/Stomach_ulcer\">stomach ulcers</a>, <a href=\"https://en.wikipedia.org/wiki/Stomach_bleeding\">stomach bleeding</a>, and worsening <a href=\"https://en.wikipedia.org/wiki/Asthma\">asthma</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> Bleeding risk is greater among those who are older, drink <a href=\"https://en.wikipedia.org/wiki/Alcohol_(drug)\">alcohol</a>, take other NSAIDs, or are on other <a href=\"https://en.wikipedia.org/wiki/Anticoagulants\">blood thinners</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> Aspirin is not recommended in the last part of <a href=\"https://en.wikipedia.org/wiki/Pregnancy\">pregnancy</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> It is not generally recommended in children with <a href=\"https://en.wikipedia.org/wiki/Infection\">infections</a> because of the risk of <a href=\"https://en.wikipedia.org/wiki/Reye_syndrome\">Reye syndrome</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> High doses may result in <a href=\"https://en.wikipedia.org/wiki/Tinnitus\">ringing in the ears</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a></li></ul>', '500', 'Analgesics', 'Test Pharma Limited-2'),
(3, 'Test Pharma', '465931288', '<p>This is a demo test.&nbsp;This is a demo test.&nbsp;This is a demo test.</p>', '36', 'Antibiotics', 'Test Pharma Limited-3');

-- --------------------------------------------------------

--
-- Table structure for table `pharmaceuticals_categories`
--

CREATE TABLE `pharmaceuticals_categories` (
  `pharm_cat_id` int NOT NULL,
  `pharm_cat_name` varchar(200) DEFAULT NULL,
  `pharm_cat_vendor` varchar(200) DEFAULT NULL,
  `pharm_cat_desc` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmaceuticals_categories`
--

INSERT INTO `pharmaceuticals_categories` (`pharm_cat_id`, `pharm_cat_name`, `pharm_cat_vendor`, `pharm_cat_desc`) VALUES
(1, 'Antipyretics', 'Test Pharma Limited-1', '<ul><li>An <strong>antipyretic</strong> (<a href=\"https://en.wikipedia.org/wiki/Help:IPA/English\">/ËŒ&aelig;ntipaÉªËˆrÉ›tÉªk/</a>, from <em>anti-</em> &#39;against&#39; and <em><a href=\"https://en.wiktionary.org/wiki/pyretic\">pyretic</a></em> &#39;feverish&#39;) is a substance that reduces <a href=\"https://en.wikipedia.org/wiki/Fever\">fever</a>. Antipyretics cause the <a href=\"https://en.wikipedia.org/wiki/Hypothalamus\">hypothalamus</a> to override a <a href=\"https://en.wikipedia.org/wiki/Prostaglandin\">prostaglandin</a>-induced increase in <a href=\"https://en.wikipedia.org/wiki/Thermoregulation\">temperature</a>. The body then works to lower the temperature, which results in a reduction in fever.</li><li>Most antipyretic medications have other purposes. The most common antipyretics in the United States are <a href=\"https://en.wikipedia.org/wiki/Ibuprofen\">ibuprofen</a> and <a href=\"https://en.wikipedia.org/wiki/Aspirin\">aspirin</a>, which are <a href=\"https://en.wikipedia.org/wiki/Nonsteroidal_anti-inflammatory_drugs\">nonsteroidal anti-inflammatory drugs</a> (NSAIDs) used primarily as <a href=\"https://en.wikipedia.org/wiki/Analgesics\">analgesics</a> (pain relievers), but which also have antipyretic properties; and <a href=\"https://en.wikipedia.org/wiki/Acetaminophen\">acetaminophen</a> (paracetamol), an analgesic with weak anti-inflammatory properties.<a href=\"https://en.wikipedia.org/wiki/Antipyretic#cite_note-2\">[2]</a></li></ul>'),
(2, 'Analgesics', 'Test Pharma Limited-2', '<ul><li><p>An <strong>analgesic</strong> or <strong>painkiller</strong> is any member of the group of <a href=\"https://en.wikipedia.org/wiki/Pharmaceutical_drug\">drugs</a> used to achieve analgesia, relief from <a href=\"https://en.wikipedia.org/wiki/Pain\">pain</a>.</p><p>Analgesic drugs act in various ways on the <a href=\"https://en.wikipedia.org/wiki/Peripheral_nervous_system\">peripheral</a> and <a href=\"https://en.wikipedia.org/wiki/Central_nervous_system\">central</a> nervous systems. They are distinct from <a href=\"https://en.wikipedia.org/wiki/Anesthetic\">anesthetics</a>, which temporarily affect, and in some instances completely eliminate, <a href=\"https://en.wikipedia.org/wiki/Sense\">sensation</a>. Analgesics include <a href=\"https://en.wikipedia.org/wiki/Paracetamol\">paracetamol</a> (known in North America as <a href=\"https://en.wikipedia.org/wiki/Acetaminophen\">acetaminophen</a> or simply APAP), the <a href=\"https://en.wikipedia.org/wiki/Nonsteroidal_anti-inflammatory_drug\">nonsteroidal anti-inflammatory drugs</a> (NSAIDs) such as the <a href=\"https://en.wikipedia.org/wiki/Salicylate\">salicylates</a>, and <a href=\"https://en.wikipedia.org/wiki/Opioid\">opioid</a> drugs such as <a href=\"https://en.wikipedia.org/wiki/Morphine\">morphine</a> and <a href=\"https://en.wikipedia.org/wiki/Oxycodone\">oxycodone</a>.</p></li></ul>'),
(3, 'Antibiotics', 'Test Pharma Limited-3', '<p>Antibiotics</p>');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `pres_id` int NOT NULL,
  `pres_pat_name` varchar(200) DEFAULT NULL,
  `pres_pat_age` varchar(200) DEFAULT NULL,
  `pres_pat_number` varchar(200) DEFAULT NULL,
  `pres_number` varchar(200) DEFAULT NULL,
  `pres_pat_addr` varchar(200) DEFAULT NULL,
  `pres_pat_type` varchar(200) DEFAULT NULL,
  `pres_date` timestamp(4) NOT NULL DEFAULT CURRENT_TIMESTAMP(4) ON UPDATE CURRENT_TIMESTAMP(4),
  `pres_pat_ailment` varchar(200) DEFAULT NULL,
  `pres_ins` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`pres_id`, `pres_pat_name`, `pres_pat_age`, `pres_pat_number`, `pres_number`, `pres_pat_addr`, `pres_pat_type`, `pres_date`, `pres_pat_ailment`, `pres_ins`) VALUES
(1, 'Jagat Archarya', '22', 'DCRI8', 'J9DC6', 'pokhara', 'InPatient', '2023-11-20 12:32:39.6963', 'Fever', '<ul><li><a href=\"https://www.medicalnewstoday.com/articles/179211.php\">Non-steroidal anti-inflammatory drugs</a> (NSAIDs) such as <a href=\"https://www.medicalnewstoday.com/articles/161255.php\">aspirin</a> or ibuprofen can help bring a fever down. These are available to purchase over-the-counter or <a target=\"_blank\" href=\"https://amzn.to/2qp3d0b\">online</a>. However, a mild fever may be helping combat the bacterium or virus that is causing the infection. It may not be ideal to bring it down.</li><li>If the fever has been caused by a bacterial infection, the doctor may prescribe an <a href=\"https://www.medicalnewstoday.com/articles/10278.php\">antibiotic</a>.</li><li>If a fever has been caused by a cold, which is caused by a viral infection, NSAIDs may be used to relieve uncomfortable symptoms. Antibiotics have no effect against viruses and will not be prescribed by your doctor for a viral infection.</li></ul>'),
(2, 'Depak Dhahal', '22', 'ISL1E', 'HZQ8J', 'pokhara', 'InPatient', '2023-11-20 13:08:46.7368', 'Malaria', '<ul><li>Combination of atovaquone and proguanil (Malarone)</li><li>Quinine sulfate (Qualaquin) with doxycycline (Vibramycin, Monodox, others)</li><li>Mefloquine.</li><li>Primaquine phosphate.</li></ul>'),
(3, 'Ankit Pangeni', '22', 'KU8W4', 'HQC3D', 'sangja', 'OutPatient', '2023-11-20 12:19:30.3702', 'Flu', '<ul><li><a href=\"https://www.google.com/search?client=firefox-b-e&amp;sxsrf=ACYBGNRW3vlJoag6iJInWVOTtTG_HUTedA:1578917913108&amp;q=flu+decongestant&amp;stick=H4sIAAAAAAAAAOMQFeLQz9U3SK5MTlbiBLGMktNzcnYxMRosYhVIyylVSElNzs9LTy0uScwrAQBMMnd5LgAAAA&amp;sa=X&amp;ved=2ahUKEwjRhNzKx4DnAhUcBGMBHYs1A24Q0EAwFnoECAwQHw\">Decongestant</a></li><li>Relieves nasal congestion, swelling and runny nose.</li><li><a href=\"https://www.google.com/search?client=firefox-b-e&amp;sxsrf=ACYBGNRW3vlJoag6iJInWVOTtTG_HUTedA:1578917913108&amp;q=flu+cough+medicine&amp;stick=H4sIAAAAAAAAAOMQFeLQz9U3SK5MTlbiBLEM89IsLHYxMRosYhVKyylVSM4vTc9QyE1NyUzOzEsFAA_gu9IwAAAA&amp;sa=X&amp;ved=2ahUKEwjRhNzKx4DnAhUcBGMBHYs1A24Q0EAwFnoECAwQIA\">Cough medicine</a></li><li>Blocks the cough reflex. Some may thin and loosen mucus, making it easier to clear from the airways.</li><li><a href=\"https://www.google.com/search?client=firefox-b-e&amp;sxsrf=ACYBGNRW3vlJoag6iJInWVOTtTG_HUTedA:1578917913108&amp;q=flu+nonsteroidal+anti-inflammatory+drug&amp;stick=H4sIAAAAAAAAAOMQFeLQz9U3SK5MTlYCs0yzCit3MTEaLGJVT8spVcjLzysuSS3Kz0xJzFFIzCvJ1M3MS8tJzM1NLMkvqlRIKSpNBwByUiYhRAAAAA&amp;sa=X&amp;ved=2ahUKEwjRhNzKx4DnAhUcBGMBHYs1A24Q0EAwFnoECAwQIQ\">Nonsteroidal anti-inflammatory drug</a></li><li>Relieves pain, decreases inflammation and reduces fever.</li><li><a href=\"https://www.google.com/search?client=firefox-b-e&amp;sxsrf=ACYBGNRW3vlJoag6iJInWVOTtTG_HUTedA:1578917913108&amp;q=flu+analgesic&amp;stick=H4sIAAAAAAAAAOMQFeLQz9U3SK5MTlZiB7EqDSx3MTEaLGLlTcspVUjMS8xJTy3OTAYAbecS9ikAAAA&amp;sa=X&amp;ved=2ahUKEwjRhNzKx4DnAhUcBGMBHYs1A24Q0EAwFnoECAwQIg\">Analgesic</a></li><li>Relieves pain.</li><li><a href=\"https://www.google.com/search?client=firefox-b-e&amp;sxsrf=ACYBGNRW3vlJoag6iJInWVOTtTG_HUTedA:1578917913108&amp;q=flu+antiviral+drug&amp;stick=H4sIAAAAAAAAAOMQFeLQz9U3SK5MTlYCs1KMC0x2MTEaLGIVSsspVUjMK8ksyyxKzFFIKSpNBwDBFxlOLwAAAA&amp;sa=X&amp;ved=2ahUKEwjRhNzKx4DnAhUcBGMBHYs1A24Q0EAwFnoECAwQIw\">Antiviral drug</a></li><li>Reduces viruses&#39; ability to replicate.</li></ul>'),
(4, 'Pradip Adhikari', '22', '85NFV', '09Y2P', 'pokara', 'InPatient', '2023-11-22 10:57:10.7496', 'Demo Test', '<ol><li>This is a demo prescription.</li><li>This is a second demo prescription.</li><li>And this one&#39;s third!</li></ol>');

-- --------------------------------------------------------

--
-- Table structure for table `pwdresets`
--

CREATE TABLE `pwdresets` (
  `id` int NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surgery`
--

CREATE TABLE `surgery` (
  `s_id` int NOT NULL,
  `s_number` varchar(200) DEFAULT NULL,
  `s_doc` varchar(200) DEFAULT NULL,
  `s_pat_number` varchar(200) DEFAULT NULL,
  `s_pat_name` varchar(200) DEFAULT NULL,
  `s_pat_ailment` varchar(200) DEFAULT NULL,
  `s_pat_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `s_pat_status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surgery`
--

INSERT INTO `surgery` (`s_id`, `s_number`, `s_doc`, `s_pat_number`, `s_pat_name`, `s_pat_ailment`, `s_pat_date`, `s_pat_status`) VALUES
(1, 'BKTWQ', 'Surya Lamsal', 'DCRI8', 'Jagat Acharya', 'Fever', '2023-11-18 08:50:10.649889', 'Successful'),
(2, 'AKTWQ', 'Roshan Paudel', '85NFV', 'Pradip Adhikari', 'Demo Test', '2023-11-18 17:26:44.053571', 'Successful'),
(3, 'MKTWQ', 'Menaka Pun', 'ISL1E', 'Depak Dhahal', 'Maleria', '2023-11-18 11:03:33.765255', 'Successful');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int NOT NULL,
  `u_name` varchar(200) DEFAULT NULL,
  `u_email` varchar(200) DEFAULT NULL,
  `u_phone` varchar(200) DEFAULT NULL,
  `u_password` varchar(200) DEFAULT NULL,
  'pat_number' varchar(200) DEFAULT NULL,
  'u_pic' varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- 
-- Dumping data table 'user'  
--  
INSERT INTO 'users' ('u_id','u_name', 'u_email','u_phone', 'u_password', 'pat_number','u_pic') VALUES (1,'user','user@gmail.com','9843012398','Passeord@123','TWQ12','defaultimg.jpg');
-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `v_id` int NOT NULL,
  `v_number` varchar(200) DEFAULT NULL,
  `v_name` varchar(200) DEFAULT NULL,
  `v_adr` varchar(200) DEFAULT NULL,
  `v_mobile` varchar(200) DEFAULT NULL,
  `v_email` varchar(200) DEFAULT NULL,
  `v_phone` varchar(200) DEFAULT NULL,
  `v_desc` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`v_id`, `v_number`, `v_name`, `v_adr`, `v_mobile`, `v_email`, `v_phone`, `v_desc`) VALUES
(1, '6ISKC', 'Test Pharma Limited-1', 'P.O. Box 123, Pokhara, Nepal', '', 'info@testpharmalimited.com', '+123456', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `vitals`
--

CREATE TABLE `vitals` (
  `vit_id` int NOT NULL,
  `vit_number` varchar(200) DEFAULT NULL,
  `vit_pat_number` varchar(200) DEFAULT NULL,
  `vit_bodytemp` varchar(200) DEFAULT NULL,
  `vit_heartpulse` varchar(200) DEFAULT NULL,
  `vit_resprate` varchar(200) DEFAULT NULL,
  `vit_bloodpress` varchar(200) DEFAULT NULL,
  `vit_daterec` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vitals`
--

INSERT INTO `vitals` (`vit_id`, `vit_number`, `vit_pat_number`, `vit_bodytemp`, `vit_heartpulse`, `vit_resprate`, `vit_bloodpress`, `vit_daterec`) VALUES
(1, '1KB9V', 'DCRI8', '38', '77', '12', '90/60', '2023-11-18 17:10:16.904915'),
(2, 'ELYOM', 'ISL1E', '38', '88', '12', '110/80', '2023-11-18 01:49:55.814783'),
(3, 'AL0J8', 'KU8W4', '36', '72', '15', '90/60', '2023-11-18 17:42:17.500662'),
(4, 'MS2OJ', '4TLG0', '37', '70', '15', '120/80', '2023-11-22 11:01:52.148658');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`acc_id`);

--
-- Indexes for table `hss_admin`
--
ALTER TABLE `hss_admin`
  ADD PRIMARY KEY (`ad_id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appt_id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`asst_id`);

--
-- Indexes for table `docs`
--
ALTER TABLE `docs`
  ADD PRIMARY KEY (`doc_id`);

--
-- Indexes for table `equipments`
--
ALTER TABLE `equipments`
  ADD PRIMARY KEY (`eqp_id`);

--
-- Indexes for table `laboratory`
--
ALTER TABLE `laboratory`
  ADD PRIMARY KEY (`lab_id`);

--
-- Indexes for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD PRIMARY KEY (`mdr_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`pat_id`);

--
-- Indexes for table `patient_transfers`
--
ALTER TABLE `patient_transfers`
  ADD PRIMARY KEY (`t_id`);

  

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`pay_id`);

--
-- Indexes for table `pharmaceuticals`
--
ALTER TABLE `pharmaceuticals`
  ADD PRIMARY KEY (`phar_id`);

--
-- Indexes for table `pharmaceuticals_categories`
--
ALTER TABLE `pharmaceuticals_categories`
  ADD PRIMARY KEY (`pharm_cat_id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`pres_id`);

--
-- Indexes for table `pwdresets`
--
ALTER TABLE `pwdresets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surgery`
--
ALTER TABLE `surgery`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`v_id`);

--
-- Indexes for table `vitals`
--
ALTER TABLE `vitals`
  ADD PRIMARY KEY (`vit_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `acc_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hss_admin`
--
ALTER TABLE `hss_admin`
  MODIFY `ad_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appt_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `asst_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `docs`
--
ALTER TABLE `docs`
  MODIFY `doc_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `equipments`
--
ALTER TABLE `equipments`
  MODIFY `eqp_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `laboratory`
--
ALTER TABLE `laboratory`
  MODIFY `lab_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `medical_records`
--
ALTER TABLE `medical_records`
  MODIFY `mdr_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `pat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `patient_transfers`
--
ALTER TABLE `patient_transfers`
  MODIFY `t_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `pay_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pharmaceuticals`
--
ALTER TABLE `pharmaceuticals`
  MODIFY `phar_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pharmaceuticals_categories`
--
ALTER TABLE `pharmaceuticals_categories`
  MODIFY `pharm_cat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `pres_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `_pwdresets`
--
ALTER TABLE `pwdresets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `surgery`
--
ALTER TABLE `surgery`
  MODIFY `s_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
-- 
-- AUTO_INCREMENT for table  `users`


ALTER TABLE `users`
  MODIFY `u_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `v_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vitals`
--
ALTER TABLE `vitals`
  MODIFY `vit_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



-- CREATE TABLE invoice (
--   invoice_id int(11) NOT NULL AUTO_INCREMENT,
--   pat_number varchar(200) NOT NULL,
--   title longtext COLLATE latin1_general_ci NOT NULL,
--   description longtext COLLATE utf8_unicode_ci NOT NULL,
--   amount int(11) NOT NULL,
--   creation_timestamp int(11) NOT NULL,
--   status longtext COLLATE latin1_general_ci NOT NULL COMMENT 'paid or unpaid',
--   invoice_date DATE NOT NULL,
--   PRIMARY KEY (invoice_id)
-- )  ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE invoice (
  invoice_id int(11) NOT NULL AUTO_INCREMENT,
  pat_id int(11) NOT NULL,
  title longtext COLLATE latin1_general_ci NOT NULL,
  description longtext COLLATE latin1_general_ci NOT NULL,
  amount int(11) NOT NULL,
  creation_timestamp int(11) NOT NULL,
  status longtext COLLATE latin1_general_ci NOT NULL COMMENT 'paid or unpaid',
  invoice_date DATE NOT NULL,
  PRIMARY KEY (invoice_id)
)  ENGINE=InnoDB DEFAULT CHARSET=latin1;
