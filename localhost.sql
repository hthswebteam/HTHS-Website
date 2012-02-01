-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 01, 2012 at 05:12 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hths`
--
CREATE DATABASE `hths` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hths`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` text NOT NULL,
  `salt` text NOT NULL,
  `username` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `hash`, `salt`, `username`) VALUES
(1, '3bd42e44ed94af5419292232ac92073f', 'CnsbN9dCSmQfQwUP', 'root');

-- --------------------------------------------------------

--
-- Table structure for table `captcha`
--

CREATE TABLE IF NOT EXISTS `captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `captcha`
--

INSERT INTO `captcha` (`captcha_id`, `captcha_time`, `ip_address`, `word`) VALUES
(1, 1327703904, '127.0.0.1', 'E8SpCfxp'),
(2, 1327703913, '127.0.0.1', 'eopECV6X'),
(3, 1327703975, '127.0.0.1', 'uLMIFtig'),
(4, 1327703989, '127.0.0.1', 'EC2lNLn5'),
(5, 1327704054, '127.0.0.1', 'Ttm0BLkX'),
(6, 1327704064, '127.0.0.1', 'R8bgTKaJ'),
(7, 1327704086, '127.0.0.1', '9yw99Hx3'),
(8, 1327704094, '127.0.0.1', 'V0IwvLeh'),
(9, 1327704104, '127.0.0.1', 'DOnPvgjN'),
(10, 1327704138, '127.0.0.1', 'K0L2HAyC'),
(11, 1327704160, '127.0.0.1', 'wBWHTX8S'),
(12, 1327704181, '127.0.0.1', 'UT2jgw3q'),
(13, 1327704237, '127.0.0.1', 'YxpJ59Tn'),
(14, 1327704242, '127.0.0.1', 'HMHlYU43'),
(15, 1327704367, '127.0.0.1', 'jC0rgaC9'),
(16, 1327704588, '127.0.0.1', 'Ml7PsEbf'),
(17, 1327704598, '127.0.0.1', 'KHJFU4pT'),
(18, 1327704617, '127.0.0.1', 'Pn9YFxQV'),
(19, 1327704635, '127.0.0.1', 'CLSgMeZS'),
(20, 1327777984, '127.0.0.1', 'UJb4fHfF'),
(21, 1328035495, '127.0.0.1', 'xZxqFofV');

-- --------------------------------------------------------

--
-- Table structure for table `email_flood`
--

CREATE TABLE IF NOT EXISTS `email_flood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` text NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `email_flood`
--

INSERT INTO `email_flood` (`id`, `ip_address`, `time`) VALUES
(1, '127.0.0.1', 1327778039);

-- --------------------------------------------------------

--
-- Table structure for table `email_log`
--

CREATE TABLE IF NOT EXISTS `email_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_teacher_id` int(11) NOT NULL,
  `email_address` text NOT NULL,
  `ip_address` text NOT NULL,
  `subject` text NOT NULL,
  `contents` text NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `email_log`
--

INSERT INTO `email_log` (`id`, `target_teacher_id`, `email_address`, `ip_address`, `subject`, `contents`, `time`) VALUES
(1, 1, 'JmooneyhamHTHS@gmail.com', '127.0.0.1', 'Test Email', 'This is a test of the emailer system.\n\nPlease ignore.', 1327778039);

-- --------------------------------------------------------

--
-- Table structure for table `form_types`
--

CREATE TABLE IF NOT EXISTS `form_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `form_types`
--

INSERT INTO `form_types` (`id`, `type`) VALUES
(1, 'Type 1'),
(2, 'Type 2');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE IF NOT EXISTS `forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `filename` text NOT NULL,
  `time` int(11) NOT NULL,
  `archived` tinyint(1) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `name`, `filename`, `time`, `archived`, `type`) VALUES
(1, 'Test Form', 'test.php', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mentorship_logs`
--

CREATE TABLE IF NOT EXISTS `mentorship_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `activities` int(11) NOT NULL,
  `comments` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mentorship_users`
--

CREATE TABLE IF NOT EXISTS `mentorship_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `username` text NOT NULL,
  `hash` text NOT NULL,
  `salt` text NOT NULL,
  `firm` text NOT NULL,
  `mentor` text NOT NULL,
  `contact` text NOT NULL,
  `semester` tinyint(1) NOT NULL,
  `year` int(4) NOT NULL,
  `private_key` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mentorship_users`
--

INSERT INTO `mentorship_users` (`id`, `name`, `username`, `hash`, `salt`, `firm`, `mentor`, `contact`, `semester`, `year`, `private_key`) VALUES
(1, 'jeff', 'root', '5508c21d916cbcb8edfc2eb20191671a', 'y88ylJGmMFMVvqfI', 'some place', 'some guy', 'hello', 1, 2012, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `contents` text NOT NULL,
  `start` int(11) NOT NULL,
  `expires` int(11) NOT NULL,
  `urgent` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=168 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `contents`, `start`, `expires`, `urgent`) VALUES
(1, 'High Technology High School Takes Top Prize at Regional Science Bowl', '<img class="right" src="/img/Hi_Tech-79_thumb.jpg" alt="Science Bowl Team" />\r\n<p>On Saturday, February 23, High Technology High School of Lincroft, N.J., won first place at the New Jersey and Eastern Pennsylvania Regional Competition of the National Science BowlÂ®. The competition took place at the U.S. Department of Energy''s Princeton Plasma Physics Laboratory (PPPL) in Plainsboro.<br /><br />\r\n\r\nHigh Technology, Team A, was among 30 teams from 19 area schools who competed in the Jeopardy!-like tournament in which all the categories were disciplines of science. Teams were quizzed on biology, chemistry, physics, astronomy, earth science, general science, and mathematics. Each team was made up of four students, a student alternate, and a teacher who served as an advisor and coach.<br /><br />\r\n\r\nFinal Results of the regional competition:<br /><br />\r\n\r\n1st Place - High Technology High School (Lincroft, N.J.)<br />\r\n2nd Place - East Brunswick High School (East Brunswick, N.J.)<br />\r\n\r\n3rd Place - Millburn High School (Millburn, N.J.)<br /><br />\r\n\r\nHigh Technology High School will be representing New Jersey at the National Science BowlÂ® competition from May 1-6 in Washington, DC.</p>\r\n<p class="noindent centertext"><a href="http://www.pppl.gov/" target="_blank">Click Here For More Information</a></p>', 1203724800, 0, 0),
(2, 'HTHS Dodgeball Tournament Winners', '<a href="/img/IMG_4930.JPG" target="_blank"><img class="right" src="/img/IMG_4930.JPG" width="300" alt="HTHS Dodgeball Tournament Winners" /></a>\r\n<p>On Thursday, March 20th, the High Technology High School Key Club hosted a Dodgeball tournament in which the students competed against each other, and the top two teams had the oppurtunity to play against the HTHS Faculty and Staff. In a suspenseful final set of 3 games, the Male Faculty team played against the HTHS Student Government Association. After the 3 games were complete, the faculty won 2-1. All of the money raised during the event was donated to the WISER program through an alumnus at Duke University. Congratulations to the winners, and thank you to all who attended and donated to the cause!</p>', 1205971200, 0, 0),
(3, 'HTHS Ruckus Nation "MoovDisk" Team Update', '<a href="/img/catwinnerpic_moovdisk.gif" target="_blank"><img class="left" src="/img/catwinnerpic_moovdisk.gif" width="200" alt="MoovDisk Team" /></a>\r\n<p>HTHS''s MoovDisk Team was invited to San Francisco to present their idae to a panel of judges, as well as to have breakfast with the other finalists. During this conference they had the ability to talk to companies who would be key in developing these products. They also heard a speech from the President of Hopelabs, a non-profit organization which founded Ruckus Nation. The MoovDisk Team was named a Category Winner, and received a prize of $25,000. More information about the team can be found <a href="http://www.ruckusnation.com/category_winner_moovdisk.html" target="_blank">here</a>. Congratulations!</p>', 1205798400, 0, 0),
(6, 'Technology Student Association (TSA) National Results', '<img class="right" src="/img/IMG_1726.JPG" width="300px" alt="tsa_nationals_pic" />\r\n<p>Every year, High Tech manages to send several students to the TSA national competition. Participating at the TSA 2008 National Conference were 28 HTHS First Place winners determined from the New Jersey State TSA Conference! The extremely talented bunch flew to Orlando, Florida to participate in this year’s competition and came back with a total of 23 awards! They consisted of: 11 top ten awards, 8 top three awards, 4 third place awards, 1 second place award, and 3 first place awards. The TSA advisor of High Tech, Mr. Robert Dennis, would like to say, "This was the best final results by far for HTHS at a TSA National Conference.  We were also the top New Jersey High School Award winner - no contest…I really had a great time and I would like to congratulate ALL the participants on a job well done and once again we have proved that HTHS is number 1."</p>', 1215216000, 0, 0),
(50, 'Ruckus Nation Semi-Finalists', '<img class="left" src="/img/ruckusNation.jpg" height="200" alt="Ruckus Nation Logo" />\r\n<p>This year, High Technology High School enetered several teams into the Ruckus Nation competition, 2 of which were chosen as Semi-Finalists under the High School Category on the National Level. High Tech''s Teams submitted the products entitled "MoovDisk", and "The Blue Box". More information about the competition can be found below, and the complete list of semi-finalists can be found <a href="http://www.ruckusnation.com/semifinalists_highschool.html" target="_blank">here</a>.</p>\r\n<p>Ruckus Nation challenged entrants to imagine a new product that is fun and cool enough to make kids want to get up and move around. HopeLab, the nonprofit organization sponsoring Ruckus Nation, will support the development, testing and distribution of products based on the best ideas. Ideas will be judged in four competition categories â€“ Middle School/Junior High School, High School, College/University, and Other. At least 10 semifinalists and 2 overall winners will be named in each category. The grand prize winner will be selected from among category winners at a special in-person event. All ideas will be judged using a scorecard, and judges will include kids and adults with a diverse set of experiences and backgrounds. For more info, review the Ruckus Nation judging process.</p>', 1204848000, 0, 0),
(51, 'New Jersey Technology Student Association (NJTSA) Results', '<p>The Technology Student Association (TSA) is an international organization made up of technology education students from different schools and their advisers. Forty-eight of the U.S. states and a handful of other countries are members of the organization. Each year High Technology High School sends well over 100 students to this conference who all compete in various competitons. This year, HTHS took home a total of 25 trophies - 10 first place trophies, 10 second place trophies, and 5 third place trophies. In addition to this, 31 students will be sent to the National TSA Conference in Orlando, Fl.</p>\r\n<p>To download the complete list of winners and their respective competitions, <a href="/forms/08-TSA.New_Jersey_Technology_Student_Association_Conference_Winners.pdf">click here</a>.</p>', 1208304000, 0, 0),
(52, 'High Technology High School Claims First Place at Moody''s Mega Math Challenge', '<p><img src="/img/moodys.jpg" alt="moodys_pic" class="right" /></p>\r\n<p>Moody''s Mega Math (M3) Challenge is an applied mathematics modeling contest for high school students in the New York, Boston and Philadelphia metropolitan areas. It is sponsored by The Moody''s Foundation based in New York City and organized by the Society for Industrial and Applied Mathematics (SIAM) based in Philadelphia. The M3 Challenge awards $65,000 in scholarship prizes each year to the top teams. This year High Technology High School''s team won first prize, and a scholarship of $20,000. High school juniors and seniors presented their solutions and justified their conclusions in 15-minute presentations on Wednesday, April 30, at Moody''s Corporation headquarters in Manhattan, before being awarded scholarship prizes ranging from $2,500 to $20,000 for their efforts. High Tech''s Team concluded that, in addition to the negative economic and environmental implications of replacing gasoline with ethanol, the plan would not be cost effective until oil prices reached over $233 per barrel. They also found that corn-derived ethanol is not the best alternative form of energy, suggesting that nuclear power may actually be a better alternative for attaining national energy independence.</p>\r\n<p><u>Related Links</u></p>\r\n<ul>\r\n    <li><a href="http://m3challenge.siam.org/">More information regarding the challenge and High Tech''s Team conclusion</a></li>\r\n    <li><a href="http://m3challenge.siam.org/">Article released regarding the challenge</a></li>\r\n    <li><a href="http://www.hths.mcvsd.org/forms/08-news.MAA_HTHS_Moody_Article.pdf">Article in the College Mathematics Journal</a></li>\r\n    <li><a href="http://www.hths.mcvsd.org/forms/08-news.Moody_Winning%20Paper.pdf">The actual winning paper</a></li>\r\n</ul>', 1232490713, 0, 0),
(67, 'HTHS Site Named TechDirections.com Website of the Month', '<p>The High Tech website was just given the prestigious title of &quot;School Website of the Month&quot; from <a href="\\&quot;http://www.techdirections.com\\&quot;">TechDirections</a>. This is a great, well-deserved honor for not only HTHS, but also the HTHS Computer Club, who created and tirelessly maintain this site. The article for the &quot;Website of the Month&quot; can be read on page 22 of the <a href="\\&quot;http://www.techdirections.com/Sept_08_TD.pdf\\&quot;">TechDirections September 2008 Issue</a>.</p>', 1231539979, 0, 0),
(79, 'High Technology High School Ranked 11th Best High School in the Nation  ', '<p>\r\n	According to the latest update from U.S. News &amp; World Report, High Technology High School is ranked 11th out of over 21,000 public high schools in the continental US. Schools were judged on the number of quality-adjusted exams per test taker and college readiness - HTHS scored a remarkable 98.9 out of 100 in college readiness. Methodology was developed by School Evaluation Services run by Standard &amp; Poor&#39;s, using data from the 2007-2008 school year. The final score took into consideration reading and math scores, the performance of &quot;least-advantaged&quot; students (Blacks, Hispanics, and low income), and performance on the Collegeboard Advance Placement exams.</p>\r\n<p style="text-indent: 0.5cm;">\r\n	<u>Related Links:</u></p>\r\n<ul>\r\n	<li>\r\n		<a href="http://www.usnews.com/articles/education/high-schools/2008/12/04/best-high-schools-gold-medal-list.html" target="_blank">America&#39;s Best High Schools as ranked by US News and World Report</a></li>\r\n	<li>\r\n		<a href="http://www.usnews.com/articles/education/high-schools/2008/12/04/americas-best-high-schools-methodology.html" target="_blank">US News and World Report Scoring and Ranking Methodology</a></li>\r\n	<li>\r\n		<a href="http://www.usnews.com/listings/high-schools/new_jersey/high_technology_high_school" target="_blank">High Technology High School Ranking</a></li>\r\n</ul>', 1232490720, 0, 0),
(80, 'High Tech Students Reach Semifinals in Intel Science Talent Search 2009', '<p>Out of 1,608 entrants, 300 students have been named Semifinalists in the Intel Science Talent Search 2009, a prestigious science research competition for high school seniors. Each semifinalist will receive a $1000 award for their research, and every school will also receive $1000 for every semifinalist of the Intel STS 2009. The award money will be used to further the science, math, and engineering education at the recipient schools.</p>\r\n<p>Of the 15 semifinalists from New Jersey, four were from High Tech. Congratulations go to <strong>Steve Castellano</strong>, <strong>Jay Feldman</strong>, <strong>Tanay Gavankar</strong>, and <strong>J</strong><strong>ason Zuku</strong><strong>s</strong> for their outstanding work.</p>', 1232490731, 0, 0),
(83, 'Monmouth Junior Science Symposium Awards', '<p>Congratulations go out to the HTHS students who have been chosen to present their research papers at the Monmouth Junior Science Symposium on April 1st and 2nd, 2009. Out of the ten papers in total that were selected for presentation, four were from High Tech students:</p>\r\n<ul>\r\n    <li>Moyukh Chatterjee - Growth and Imaging of Bismuth Nanowires</li>\r\n    <li>Jeffrey Hart - Development of Criteria for Accurately Predicting Passive RFID Tag Performance in Various Metal Packing Arrangements</li>\r\n    <li>Tanay Gavankar - Utilization of Silica Nanoparticles in Shear Thickening Fluids as Liquid Ballistic Protection</li>\r\n    <li>Joshua Ma - Increasing the Speed of Target Acquisition through the Dynamic Creation of Magic Corners in a Graphical User Interface</li>\r\n</ul>\r\n<p>In addition, the following students were chosen to present their papers in poster format at the Monmouth Junior Science Symposium Banquet on April 1st, 2009:</p>\r\n<ul>\r\n    <li>Andrew Chien - Quantum Efficiencies of Different Solar Cells at Different Wavelengths</li>\r\n    <li>Janie Gu - The Effect of Modeling Atmospheric Pollution on Solar Cell Electricity Generation</li>\r\n    <li>Steven Castellano - Acupressure Induced Attention in the Teenage Brain&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n</ul>\r\n<p>The Monmouth Junior Science Symposium is sponsored by Monmouth University - this year will be the 47th annual symposium. HTHS freshman have the opportunity to attend technical sessions as a district field trip aligned with the Intro to Research and Data Analysis 1 courses.&nbsp; This allows them to view exemplary research projects and the formal presentation of findings.</p>\r\n<p><a href="http://www.monmouth.edu/academics/junior_science_symposium/default.asp">Read more about MJSS.</a></p>', 1233071110, 0, 0),
(89, 'AIME Qualifiers', '<p>The AMC scores have arrived! &nbsp;Congratulations to the following students for qualifying to participant in the American Invitational Mathematics Examination (AIME) on March 17th:</p>\r\n<p><u>AMC 12</u></p>\r\n<p>Jacob Robins - HIGH SCORER FOR HTHS</p>\r\n<p>Josh Ma</p>\r\n<p>Andrew Chien</p>\r\n<p><u>AMC 10</u></p>\r\n<p>Channing Huang<span style="white-space: pre;" class="Apple-tab-span">	</span>-&nbsp;HIGH SCORER FOR HTHS</p>\r\n<p>Alex Lew</p>\r\n<p>James Ting</p>\r\n<p>Stephen Guo</p>\r\n<p>Chris Croson</p>', 1235466059, 0, 0),
(94, 'Jersey Shore Science Fair results', '<p>Thirty seven HTHS students ventured down to Pomona to compete in the 34th annual Jersey Shore Science Fair held at The Richard Stockton College of New Jersey this past Saturday.&nbsp; Thirty one of them were recognized with awards for their projects and twenty five earned invitations to compete at Delaware Valley Regional Science Fairs in April.</p>\r\n<p>All of the HTHS entries will be available for review this coming Wednesday evening, March 25th, from 7:00 - 9:00 p.m. at our first ever Research Showcase.</p>\r\n<p>Congratulations to the following individuals:</p>\r\n<p>First Place Awards</p>\r\n<ul>\r\n    <li>Elise Backman (Botany)</li>\r\n    <li>Timothy Ng (Chemistry)</li>\r\n    <li>Joshua Ma (Computer Science - Upper level fair)</li>\r\n    <li>Sidney Buchbinder (Engineering)</li>\r\n    <li>Jeffrey Hart (Engineering - Upper level fair)</li>\r\n    <li>Janie Gu (Environmental)</li>\r\n    <li>Paul Bender (Environmental - Upper level fair)</li>\r\n    <li>Joshua Chao (Earth &amp; Space Sciences)</li>\r\n    <li>Abhi Desai (Mathematics)</li>\r\n    <li>Anca Marinescu (Microbiology)</li>\r\n    <li>Paul Jackson (Physics)</li>\r\n    <li>Moyukh Chatterjee (Physics - Upper level fair)</li>\r\n</ul>\r\n<p>Second Place Awards</p>\r\n<ul>\r\n    <li>Jane Threefoot (Botany)</li>\r\n    <li>Emily Fineberg (Behavioral and Social Science)</li>\r\n    <li>Ami Wang (Chemistry - Upper level fair)</li>\r\n    <li>John Kelly (Computer Science)</li>\r\n    <li>Brittany Ko (Engineering)</li>\r\n    <li>Amrita Mazumdar (Engineering - Upper level fair)</li>\r\n    <li>Katharine Close (Medicine &amp; Health - Upper level fair)</li>\r\n    <li>Jay Cheng (Physics)</li>\r\n    <li>Connor Janover (Physics - Upper level fair)</li>\r\n</ul>\r\n<p>Third Place Awards</p>\r\n<ul>\r\n    <li>Channing Huang (Botany)</li>\r\n    <li>Phillip Ellsworth (Computer Science)</li>\r\n    <li>Calvin Chang (Physics)</li>\r\n    <li>Matthew Warshauer (Medicine &amp; Health - Upper level fair)</li>\r\n</ul>\r\n<p>Honorable Mention Awards</p>\r\n<ul>\r\n    <li>Gregory Canal (Botany)</li>\r\n    <li>James Ting (Botany)</li>\r\n    <li>Courtney Chan (Behavioral and Social Science)</li>\r\n    <li>Kelsey Noll (Behavioral and Social Science - Upper level fair)</li>\r\n    <li>Manali Tijoriwala (Engineering)</li>\r\n    <li>Janet Qian (Environmental)</li>\r\n</ul>\r\n<p>Special Awards</p>\r\n<ul>\r\n    <li>Natural Sciences and Mathematics Department\r\n    <p>(Borders Gift Cards to projects of greatest distinction in the Upper level divisions)</p>\r\n    <p>Joshua Ma (Computer Science - Upper level fair)</p>\r\n    <p>Jeffrey Hart (Engineering - Upper level fair)</p>\r\n    <p>Paul Bender (Environmental - Upper level fair)</p>\r\n    <p>Moyukh Chatterjee (Physics - Upper level fair)</p>\r\n    </li>\r\n    <li>IEEE - Institute of Electronics and Electrical Engineers\r\n    <p>Sidney Buchbinder (Engineering)</p>\r\n    </li>\r\n    <li>The Paul Saraduke, Jr. Award\r\n    <p>(Top Physics Project)</p>\r\n    <p>Moyukh Chatterjee (Physics - Upper level fair)</p>\r\n    </li>\r\n    <li>NJ Water Environment Association (NJWEA) and the State Chapter of the Water Environment Federation (WEF)\r\n    <p>($500.00 and invitation to NJWEA Annual Conference - entry into NJ US Stockholm Junior Water Prize competition)</p>\r\n    <p>Paul Bender (Environmental - Upper level fair)</p>\r\n    </li>\r\n    <li>American Chemical Society\r\n    <p>(Top Chemistry Project - Intermediate fair level)</p>\r\n    <p>Timothy Ng (Chemistry)</p>\r\n    </li>\r\n</ul>', 1237975352, 0, 0),
(96, '2008-09 Young Epidemiology Scholars (YES) Regional Finalists', '<p>Congratulations to the 2008-09 Regional Finalists who will compete in Washington, D.C., on April 17-20, 2009:</p>\r\n<p>Katharine Close, High Technology High School, Lincroft, &quot;The Effects of Frequent iPod Use on the Perception of Sound at Different Frequencies&quot;</p>\r\n<p>Matthew Warshauer, High Technology High School, Lincroft, &quot;An Examination of Correlations Between Undergraduate Educational Attainment and Health Factors&quot;</p>\r\n<p>Kerry and Matthew were two of four students from New Jersey to achieve finalist status. Good luck in DC, Kerry &amp; Matthew!</p>\r\n<p>Read more at : <a href="http://www.collegeboard.com/yes/">http://www.collegeboard.com/yes/</a></p>', 1238752360, 0, 0),
(97, 'Class of 2010 - NMSQT Semi-Finalists', '<p>\r\n	<span style="font-family: Tahoma;">Congratulations to the following members of the Class of 2010, recently identified as National Merit Scholar Semi-Finalists:</span></p>\r\n<p style="margin: 0px; font-family: Helvetica; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: normal; font-size-adjust: none; font-stretch: normal;">\r\n	<span style="font-size: 12px;"><span class="Apple-style-span" style="font-family: Tahoma,Verdana,sans-serif;">Moyukh </span></span><span style="font-size: 12px;"><span class="Apple-style-span" style="font-family: Tahoma,Verdana,sans-serif;">Chatterjee</span></span></p>\r\n<p style="margin: 0px; font-family: Helvetica; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: normal; font-size-adjust: none; font-stretch: normal;">\r\n	<span style="font-size: 12px;"><span class="Apple-style-span" style="font-family: Tahoma,Verdana,sans-serif;">Ashley Gau<br />\r\n	</span></span></p>\r\n<p style="margin: 0px; font-family: Helvetica; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: normal; font-size-adjust: none; font-stretch: normal;">\r\n	<span style="font-size: 12px;"><span class="Apple-style-span" style="font-family: Tahoma,Verdana,sans-serif;">Benjamin </span></span><span style="font-size: 12px;"><span class="Apple-style-span" style="font-family: Tahoma,Verdana,sans-serif;">Lynch</span></span></p>\r\n<p style="margin: 0px; font-family: Helvetica; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: normal; font-size-adjust: none; font-stretch: normal;">\r\n	<span style="font-size: 12px;"><span style="font-family: Tahoma;">Joshua</span></span><span style="font-size: 12px;"><span style="font-family: Tahoma;"> Ma</span></span></p>\r\n<p style="margin: 0px; font-family: Helvetica; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: normal; font-size-adjust: none; font-stretch: normal;">\r\n	<span style="font-size: 12px;"><span class="Apple-style-span" style="font-family: Tahoma,Verdana,sans-serif;">Alexander </span></span><span style="font-size: 12px;"><span class="Apple-style-span" style="font-family: Tahoma,Verdana,sans-serif;">Pavincic</span></span></p>\r\n<p style="margin: 0px; font-family: Helvetica; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: normal; font-size-adjust: none; font-stretch: normal;">\r\n	<span style="font-size: 12px;"><span class="Apple-style-span" style="font-family: Tahoma,Verdana,sans-serif;">Ami </span></span><span style="font-size: 12px;"><span class="Apple-style-span" style="font-family: Tahoma,Verdana,sans-serif;">Wang</span></span></p>\r\n<p style="margin: 0px; font-family: Helvetica; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: normal; font-size-adjust: none; font-stretch: normal;">\r\n	<span style="font-size: 12px;"><span style="font-family: Tahoma;">Yingbo</span></span><span style="font-size: 12px;"><span class="Apple-style-span" style="font-family: Tahoma,Verdana,sans-serif;"> Wang</span></span></p>\r\n<p style="margin: 0px; font-family: Helvetica; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: normal; font-size-adjust: none; font-stretch: normal;">\r\n	<span style="font-size: 12px;"><span style="font-family: Tahoma;">Matthew </span></span><span style="font-size: 12px;"><span style="font-family: Tahoma;">Warshauer</span></span></p>\r\n<p style="margin: 0px; font-family: Helvetica; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: normal; font-size-adjust: none; font-stretch: normal;">\r\n	&nbsp;</p>\r\n<p style="margin: 0px; font-family: Helvetica; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: normal; font-size-adjust: none; font-stretch: normal;">\r\n	Good luck to all !!!</p>', 1240578837, 0, 0),
(99, 'Robotics Team - MATE ROV Winners', '<p>Last weekend the HTHS Robotics Club has won 2 first place awards, 1st place for Mission, and 1st place Overall at the MATE New England Regional ROV Contest in Massachusetts. As a result, the team advances to the International Competition June 24th in Buzzards Bay, Massachusetts. Congratulations !!!</p>\r\n<p>MATE: Marine Advanced Technology Education&nbsp;</p>\r\n<p>ROV: Remotely Operated Vehicle</p>\r\n<p>Official Websites:</p>\r\n<p><a href="http://www.marinetech.org/rov_competition/2009/index.php">http://www.marinetech.org/rov_competition/2009/index.php</a></p>\r\n<p><a href="http://www.marinetech.org/rov_competition/2009/regional_contest.php?rov_competition_id=114">http://www.marinetech.org/rov_competition/2009/regional_contest.php?rov_competition_id=114</a></p>', 1241006781, 0, 0),
(100, 'HTHS Wins Mega Math Challenge ... AGAIN !!!', '<p>That''s two in a row !!!</p>\r\n<p><a href="http://www.app.com/article/20090505/NEWS/90505146">Link</a></p>\r\n<p><a href="http://www.app.com/apps/pbcs.dll/gallery?Avis=B3&amp;Dato=20090505&amp;Kategori=MULTIMEDIA02&amp;Lopenr=905050804&amp;Ref=PH">Photo Gallery</a> of 2009 Moody winning team</p>\r\n<p>Congrats Moody''s Team (and Coach LeBlanc) !!!</p>\r\n<p>P.S. Here''s a shoutout also to Mrs. Brown for providing the statistics background that is crucial for success in this competition.</p>', 1241598219, 0, 0),
(112, 'BIG NEWS !!!', '<p>\r\n	Congrats to Oliver Song, Class of 2010, named today as a Wendy&#39;s High School Heisman National Finalist !!! National winners will be announced as part of an ESPN2 special on December 13th. We will be watching closely, rooting him on.</p>\r\n<p>\r\n	Congrats are in order as well to Holmdel HS for providing Oliver with the athletic venue to succeed at such a high level.</p>\r\n<p>\r\n	Click <a href="http://www.wendyshighschoolheisman.com/alumni/2009national/index.asp">here</a> for the Wendy&#39;s HS Heisman finalists page.</p>\r\n<p>\r\n	Click <a href="http://www.app.com/article/20091115/NEWS/911150361/1283/LOCAL07/Holmdel+teen+a+finalist+for+national+excellence+trophy">here</a> for the full article in the Asbury Park Press.</p>', 1258115936, 0, 0),
(114, 'Model UN Success at Princeton', '<p>\r\n	The Model United Nations club had some great success at the Princeton Model UN Conference this past weekend.<br />\r\n	<br />\r\n	This is a highly respected conference, attended by approximately 1200 students from about 60 schools...<br />\r\n	<br />\r\n	<u><strong>Team Award</strong></u><br />\r\n	<br />\r\n	Best Small School Delegation - High Tech High School<br />\r\n	<br />\r\n	--Moyukh Chatterjee<br />\r\n	--Amrita Mazumdar<br />\r\n	--Greg Woolston<br />\r\n	--Matthew Warshauer<br />\r\n	--Ben Lynch<br />\r\n	--Elise Backman<br />\r\n	--Robert Hale<br />\r\n	--Vinay Panjabi<br />\r\n	--Neil Rangwani<br />\r\n	--Emily Chen<br />\r\n	--Sanjana Salwi<br />\r\n	--Dan Takash<br />\r\n	<strong><u><br />\r\n	Individual Awards</u></strong><br />\r\n	<br />\r\n	Matthew Warshauer<br />\r\n	<em>Best Delegate - Special Committee on Cyber-Terrorism</em><br />\r\n	&nbsp;<br />\r\n	Moyukh Chatterjee<br />\r\n	<em>Outstanding Delegate - Red Russia: The Rise of the Bolsheviks</em><br />\r\n	&nbsp;<br />\r\n	Elise Backman<br />\r\n	<em>Delegate of Honorable Mention - Terra Nullius: Oil Exploration in the Horn of Africa</em><br />\r\n	<br />\r\n	Dan Takash &amp; Neil Rangwani<br />\r\n	<em>Delegate Commendation - Committee on Disarmament and International Security</em><br />\r\n	<br />\r\n	Congrats to all !!!</p>', 1258959975, 0, 0),
(117, 'Intel Semi-Finalists', '<p>\r\n	Congratulations to <strong>Moyukh Chatterjee</strong> and <strong>Oliver Song</strong> for achieving Semi-Finalist status in the Intel Science Talent Search !!!</p>\r\n<p>\r\n	<a href="http://www.societyforscience.org/sts/2010/semifinalists">More Information<br />\r\n	</a></p>', 1263395333, 0, 0),
(121, 'Launch of Common Standards', '<p>\r\n	The official release of the standards for English and Mathematics, as part of the Common Core State Standards Initiative, has been announced today. Read more about it <a href="http://www.corestandards.org/articles/8-national-governors-association-and-state-education-chiefs-launch-common-state-academic-standards">here</a> ...<br />\r\n	<br />\r\n	PDF downloads are available, upon request.</p>', 1275490101, 0, 0),
(122, 'National Merit Scholars FINALISTS (Class of 2011)', '<p>\r\n	Congratulations to the following members of the Class of 2011 who have achieved &quot;Finalist&quot; status for the National Merit Scholars Program:</p>\r\n<p>\r\n	<link href="file://localhost/Users/admin/Library/Caches/TemporaryItems/msoclip/0/clip_filelist.xml" rel="File-List" /> <!--[if gte mso 9]><xml>\r\n <o:DocumentProperties>\r\n  <o:Template>Normal.dotm</o:Template>\r\n  <o:Revision>0</o:Revision>\r\n  <o:TotalTime>0</o:TotalTime>\r\n  <o:Pages>1</o:Pages>\r\n  <o:Words>78</o:Words>\r\n  <o:Characters>448</o:Characters>\r\n  <o:Company>MCVSD</o:Company>\r\n  <o:Lines>3</o:Lines>\r\n  <o:Paragraphs>1</o:Paragraphs>\r\n  <o:CharactersWithSpaces>550</o:CharactersWithSpaces>\r\n  <o:Version>12.0</o:Version>\r\n </o:DocumentProperties>\r\n <o:OfficeDocumentSettings>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves>false</w:TrackMoves>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:DrawingGridHorizontalSpacing>18 pt</w:DrawingGridHorizontalSpacing>\r\n  <w:DrawingGridVerticalSpacing>18 pt</w:DrawingGridVerticalSpacing>\r\n  <w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery>\r\n  <w:DisplayVerticalDrawingGridEvery>0</w:DisplayVerticalDrawingGridEvery>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:DontGrowAutofit/>\r\n   <w:DontAutofitConstrainedTables/>\r\n   <w:DontVertAlignInTxbx/>\r\n  </w:Compatibility>\r\n </w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" LatentStyleCount="276">\r\n </w:LatentStyles>\r\n</xml><![endif]--><style>\r\n<!--{cke_protected}%3C!%2D%2D%7Bcke_protected%7D%253C!%252D%252D%257Bcke_protected%257D%25253C!%25252D%25252D%25257Bcke_protected%25257D%2525253C!%2525252D%2525252D%2525250A%25252520%2525252F*%25252520Font%25252520Definitions%25252520*%2525252F%2525250A%25252540font-face%2525250A%25252509%2525257Bfont-family%2525253ATimes%2525253B%2525250A%25252509panose-1%2525253A2%252525200%252525205%252525200%252525200%252525200%252525200%252525200%252525200%252525200%2525253B%2525250A%25252509mso-font-charset%2525253A0%2525253B%2525250A%25252509mso-generic-font-family%2525253Aauto%2525253B%2525250A%25252509mso-font-pitch%2525253Avariable%2525253B%2525250A%25252509mso-font-signature%2525253A3%252525200%252525200%252525200%252525201%252525200%2525253B%2525257D%2525250A%25252520%2525252F*%25252520Style%25252520Definitions%25252520*%2525252F%2525250Ap.MsoNormal%2525252C%25252520li.MsoNormal%2525252C%25252520div.MsoNormal%2525250A%25252509%2525257Bmso-style-parent%2525253A%25252522%25252522%2525253B%2525250A%25252509margin%2525253A0in%2525253B%2525250A%25252509margin-bottom%2525253A.0001pt%2525253B%2525250A%25252509mso-pagination%2525253Awidow-orphan%2525253B%2525250A%25252509font-size%2525253A12.0pt%2525253B%2525250A%25252509mso-bidi-font-size%2525253A10.0pt%2525253B%2525250A%25252509font-family%2525253A%25252522Times%25252520New%25252520Roman%25252522%2525253B%2525250A%25252509mso-ascii-font-family%2525253ATimes%2525253B%2525250A%25252509mso-fareast-font-family%2525253ATimes%2525253B%2525250A%25252509mso-hansi-font-family%2525253ATimes%2525253B%2525250A%25252509mso-bidi-font-family%2525253A%25252522Times%25252520New%25252520Roman%25252522%2525253B%2525257D%2525250A%25252540page%25252520Section1%2525250A%25252509%2525257Bsize%2525253A8.5in%2525252011.0in%2525253B%2525250A%25252509margin%2525253A1.0in%252525201.25in%252525201.0in%252525201.25in%2525253B%2525250A%25252509mso-header-margin%2525253A.5in%2525253B%2525250A%25252509mso-footer-margin%2525253A.5in%2525253B%2525250A%25252509mso-paper-source%2525253A0%2525253B%2525257D%2525250Adiv.Section1%2525250A%25252509%2525257Bpage%2525253ASection1%2525253B%2525257D%2525250A%2525252D%2525252D%2525253E%25252D%25252D%25253E%252D%252D%253E%2D%2D%3E-->\r\n</style> <!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\ntable.MsoNormalTable\r\n	{mso-style-name:"Table Normal";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-parent:"";\r\n	mso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n	mso-para-margin:0in;\r\n	mso-para-margin-bottom:.0001pt;\r\n	mso-pagination:widow-orphan;\r\n	font-size:12.0pt;\r\n	font-family:"Times New Roman";\r\n	mso-ascii-font-family:Cambria;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-fareast-font-family:"Times New Roman";\r\n	mso-fareast-theme-font:minor-fareast;\r\n	mso-hansi-font-family:Cambria;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:"Times New Roman";\r\n	mso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]--><!--StartFragment--></p>\r\n<p class="MsoNormal">\r\n	<span style="font-family: comic sans ms,cursive;"><span style="font-size: 12px;">Buchbinder, Sidney<br />\r\n	Croson, Christopher<br />\r\n	Gu, Janie<br />\r\n	Hale, Robert<br />\r\n	Huang, Channing<br />\r\n	Patankar, Smita<br />\r\n	Rothfuss, David<br />\r\n	Ting, James<br />\r\n	Yang, Stephanie<br />\r\n	Zheng, Andrew</span></span></p>', 1275490591, 0, 0),
(123, '2010 AFCEA National High School Science Fair', '<p>\r\n	The winners of the 2010 High School Science Fair are found <a href="http://www.afcea.org/education/scholarships/HSsciencefairwinners10.htm">here</a>.&nbsp; </p>\r\n<p>\r\n	With travel assistance provided by the Fort Monmouth Chapter, <span style="background-color: rgb(255, 255, 0);">Janie Gu, the First Honorable Mention winner, also will attend and display her project</span>.&nbsp; Every winner receives a monetary prize.<br />\r\n	&nbsp;&nbsp;&nbsp;&nbsp; <br />\r\n	First Honorable Mention:<br />\r\n	<br />\r\n	<span style="background-color: rgb(255, 255, 0);">Janie Gu </span><br />\r\n	<span style="background-color: rgb(255, 255, 0);">Junior, High Technology High School, Lincroft, NJ </span><br />\r\n	Nominated by Fort Monmouth Chapter<br />\r\n	&nbsp;<br />\r\n	Runners-Up:<br />\r\n	<br />\r\n	<span style="background-color: rgb(255, 255, 0);">James Ting</span><br />\r\n	<span style="background-color: rgb(255, 255, 0);">Junior, High Technology High School, Lincroft, NJ</span><br />\r\n	Nominated by Philadelphia (Liberty Bell) Chapter</p>', 1275933544, 0, 0),
(124, 'Newsweek Ranking', '<p>\r\n	Newsweek just published their rankings of the best High Schools in the nation. HTHS is ranked #192.<br />\r\n	<br />\r\n	See this <a href="http://www.newsweek.com/feature/2010/americas-best-high-schools/profile.html?key=JfX-YhhVCGiJwLCzD0ihZwErfkg&amp;state=NJ&amp;year=2010&amp;id=807&amp;detailsKey=QlrGooGRmxfE1VDr6ypaEw5XnH8">link</a> for more information ...</p>\r\n<p>\r\n	We are also mentioned amongst the &quot;public elites&quot;. See this <a href="http://www.newsweek.com/2010/06/13/america-s-best-high-schools-in-a-different-class.html">link</a>.</p>\r\n<p>\r\n	I&#39;m not certain when hard copies of the magazine come out, but be sure to get one.<br />\r\n	<br />\r\n	Congrats to all for this well deserved recognition !!!</p>', 1276509291, 0, 0),
(125, '2010 AP Exam results', '<p>\r\n	AP Exam results are available online for the first time, so sooner than ever, the results are here.</p>\r\n<p>\r\n	158 scores of 5 (66.4%)</p>\r\n<p>\r\n	52 scores of 4 (21.8%)</p>\r\n<p>\r\n	22 scores of 3 (9.2%)</p>\r\n<p>\r\n	A total of <u><strong>97.5%</strong></u> of 238 exams taken (by 105 students) scored 3 or better.<br />\r\n	&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <br />\r\n	Once again, congratulations on a job well done.</p>', 1278509817, 0, 0),
(128, 'Perfect SATs in October', '<p>\r\n	Four HTHS students posted perfect SAT scores in October.</p>\r\n<p>\r\n	See the article in APP <a href="http://www.app.com/article/20101115/NEWS/11150309&amp;source=rss">here</a>.</p>\r\n<p>\r\n	See the ABC video <a href="http://abclocal.go.com/wabc/video?id=7792556">here</a>.</p>', 1289837608, 0, 0),
(129, 'Mathematics Competition Achievements', '<p>\r\n	9 students represented HTHS at the 25th annual Andrushkiw math competition at Seton Hall University on Saturday, November 20th. The team finished 2nd overall (only ONE point behind the first place team) and claimed 2 of the 5 individual awards (<span style="color: rgb(255, 0, 0);">Kevin Zhou</span>, 4th and <span style="color: rgb(255, 0, 0);">David Wong</span>, 2nd). Congratulations.</p>\r\n<p>\r\n	Also, The Princeton University Mathematics Competition, PUMaC, was held on the same day. PUMaC is a mathematics competition that takes place at Princeton University and which has now gone international with about 70 teams attending, including at least six from China and one from Bulgaria. HTHS student <span style="color: rgb(255, 0, 0);">Eric Schneider</span>&rsquo;s team came in 1st place at the competition, and Eric won the 1st place individual finals award as the top scoring individual in the whole contest.&nbsp; Within the math and math competition community, this is a huge honor and an incredible accomplishment. Way to go Eric !!!</p>', 1290415111, 0, 0),
(131, 'First Research Award of 2011', '<p>\r\n	(<em>Appropriately announced on 1/11/11</em>)</p>\r\n<p>\r\n	Congratulations to <span style="font-size: 16px;"><span style="color: rgb(0, 0, 255);">Zachary Porter</span></span> !!! Named a Finalist in the MIT THINK 2011 Competition.</p>\r\n<p>\r\n	Click for the <a href="http://www.mittechfair.org/think/think2011.php">announcement</a></p>\r\n<p>\r\n	Click for details on Zach&#39;s <a href="http://www.mittechfair.org/think/idea_proposal2011.php">idea</a></p>', 1294836250, 0, 0),
(134, 'Our newest Intel Semi-Finalist ...', '<p>\r\n	Congratulations to <strong>Janie Gu</strong>, <em>Class of 2011</em>. She has recently been named as a Semi-Finalist in the prestigious Intel Science Talent Search. The Intel STS recognizes 300 students and their schools as Semifinalists each year - pulling from 1,744 applicants in 2011 - to compete for $1.25 million in awards. From that select pool, 40 Finalists are then invited to Washington, DC in March to participate in final judging, display their work to the public, meet with notable scientists, and compete for the top award of $100,000.</p>\r\n<p>\r\n	Best of luck Janie !!!</p>', 1296474548, 0, 0),
(137, 'Writing Contest Recognition', '<p>\r\n	HTHS freshman Annie Shi has been named a 2011 Golden Key Recipient in the 2011 Scholastic, Inc. Art and Writing Contest!&nbsp; Annie&#39;s short story will now be forwarded for National judging.&nbsp; Since 1923, the Awards have recognized some of America&rsquo;s most celebrated writers while they were teenagers, including: Truman Capote, Bernard Malamud, Joyce Maynard, Sherley Anne Williams, Joyce Carol Oates, and Sylvia Plath. <br />\r\n	<br />\r\n	Congratulations, Annie!</p>', 1297426544, 0, 0),
(138, 'Siemens Award', '<p>\r\n	Congratulations to James Ting, Class of 2011, for being selected as 1 of 2 state winners of the Siemens Award for Advanced Placement. More information can be found on the Siemens <a href="http://www.siemens-foundation.org">website</a>.</p>', 1297779300, 0, 0),
(139, 'Science Bowl CHAMPIONS !!!', '<p>\r\n	Our Science Bowl A team consisting of :<br />\r\n	<br />\r\n	<span style="color: rgb(255, 0, 0);">Sidney Buchbinder<br />\r\n	Channing Huang<br />\r\n	Angela Zhou<br />\r\n	Bryan Wang<br />\r\n	Kevin Zhou</span><br />\r\n	<br />\r\n	were victorious at Princeton on Saturday, winning the Regionals and beating 32 excellent teams and will be competing in the National Science Bowl competition in Washington DC in late April.</p>\r\n<p>\r\n	See <a href="http://science-education.pppl.gov/HSSB.html">http://science-education.pppl.gov/HSSB.html</a> for more information.<br />\r\n	&nbsp;</p>', 1298974091, 0, 0),
(140, 'AIME Qualifiers', '<p>\r\n	Congratulations to the following 16 students for qualifying for the American Invitational Mathematics Exam (AIME).</p>\r\n<ol>\r\n	<li>\r\n		ERIC SCHNEIDER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li>\r\n		CHANNING L HUANG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li>\r\n		DEREK P WILSON&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li>\r\n		VINAY AYYALA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li>\r\n		VINEEL A CHAKRADHAR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li>\r\n		JAKE WOOD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li>\r\n		SIDNEY D BUCHBINDER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li>\r\n		MAXWELL D FLORES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li>\r\n		STEPHEN GUO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li>\r\n		AIDAN PRESTON&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li>\r\n		KEVIN ZHOU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li>\r\n		DAVID WONG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li>\r\n		JACOB BUCKMAN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li>\r\n		ZACHARY S LIU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\r\n	<li>\r\n		DEREK LIU</li>\r\n	<li>\r\n		ALEX LEW</li>\r\n</ol>', 1299069554, 0, 0),
(141, 'HTHS Alumnus on The Daily Show', '<p>\r\n	<span class="translatable">Check out this <a href="http://www.thedailyshow.com/watch/tue-march-8-2011/brian-christian">link</a> to HTHS 2002 alumnus (and author) Brian Christian&#39;s appearance on The Daily Show. Way to go Brian ... we are all VERY proud !!!</span></p>', 1299660613, 0, 0),
(142, 'First ever HTHS member US Physics Team !!!', '<p>\r\n	<span class="translatable">First ever HTHS student named to US Physics Team. Congrats Eric Schneider !!!</span></p>\r\n<p>\r\n	<a href="http://www.aapt.org/physicsteam/2011/team.cfm?id=845&amp;year=2011"><span class="translatable"> <span><span class="update-link skin-txt1-fade">http://www.aapt.org/physicsteam/2011/team.cfm?id=845&amp;year=2011</span></span></span></a></p>\r\n<p>\r\n	Congratulations also to the following students, who have achieved Semi-Finalist status for the team:</p>\r\n<p>\r\n	<span style="color:#00f;">Vinay Ayyala</span></p>\r\n<p>\r\n	<span style="color:#00f;">Sidney Buchbinder</span></p>\r\n<p>\r\n	<span style="color:#00f;">Greg Canal</span></p>\r\n<p>\r\n	<span style="color:#00f;">Vineel Chakradhar</span></p>\r\n<p>\r\n	<span style="color:#00f;">Janie Gu</span></p>\r\n<p>\r\n	<span style="color:#00f;">Stephen Guo</span></p>\r\n<p>\r\n	<span style="color:#00f;">Channing Huang</span></p>\r\n<p>\r\n	<span style="color:#00f;">Derek Liu</span></p>\r\n<p>\r\n	<span style="color:#00f;">James Ting</span></p>\r\n<p>\r\n	<span style="color:#00f;">David Wong</span></p>\r\n<p>\r\n	<span style="color:#00f;">Kevin Zhou</span></p>\r\n<p>\r\n	For more information visit <a href="http://www.aapt.org/physicsteam/2011/index.cfm">http://www.aapt.org/physicsteam/2011/index.cfm</a></p>', 1300799277, 0, 0),
(143, 'National Merit Scholarship Semi-Finalists - Class of 2012', '<p class="MsoNormal">\r\n	<style>\r\n<!--{cke_protected}%3C!%2D%2D%7Bcke_protected%7D%253C!%252D%252D%257Bcke_protected%257D%25253C!%25252D%25252D%25250A%252520%25252F*%252520Font%252520Definitions%252520*%25252F%25250A%252540font-face%25250A%252509%25257Bfont-family%25253ATimes%25253B%25250A%252509panose-1%25253A2%2525200%2525205%2525200%2525200%2525200%2525200%2525200%2525200%2525200%25253B%25250A%252509mso-font-charset%25253A0%25253B%25250A%252509mso-generic-font-family%25253Aauto%25253B%25250A%252509mso-font-pitch%25253Avariable%25253B%25250A%252509mso-font-signature%25253A3%2525200%2525200%2525200%2525201%2525200%25253B%25257D%25250A%252540font-face%25250A%252509%25257Bfont-family%25253ATimes%25253B%25250A%252509panose-1%25253A2%2525200%2525205%2525200%2525200%2525200%2525200%2525200%2525200%2525200%25253B%25250A%252509mso-font-charset%25253A0%25253B%25250A%252509mso-generic-font-family%25253Aauto%25253B%25250A%252509mso-font-pitch%25253Avariable%25253B%25250A%252509mso-font-signature%25253A3%2525200%2525200%2525200%2525201%2525200%25253B%25257D%25250A%252520%25252F*%252520Style%252520Definitions%252520*%25252F%25250Ap.MsoNormal%25252C%252520li.MsoNormal%25252C%252520div.MsoNormal%25250A%252509%25257Bmso-style-unhide%25253Ano%25253B%25250A%252509mso-style-qformat%25253Ayes%25253B%25250A%252509mso-style-parent%25253A%252522%252522%25253B%25250A%252509margin%25253A0in%25253B%25250A%252509margin-bottom%25253A.0001pt%25253B%25250A%252509mso-pagination%25253Awidow-orphan%25253B%25250A%252509font-size%25253A12.0pt%25253B%25250A%252509mso-bidi-font-size%25253A10.0pt%25253B%25250A%252509font-family%25253ATimes%25253B%25250A%252509mso-fareast-font-family%25253ATimes%25253B%25250A%252509mso-bidi-font-family%25253A%252522Times%252520New%252520Roman%252522%25253B%25257D%25250A.MsoChpDefault%25250A%252509%25257Bmso-style-type%25253Aexport-only%25253B%25250A%252509mso-default-props%25253Ayes%25253B%25250A%252509font-size%25253A10.0pt%25253B%25250A%252509mso-ansi-font-size%25253A10.0pt%25253B%25250A%252509mso-bidi-font-size%25253A10.0pt%25253B%25250A%252509font-family%25253ATimes%25253B%25250A%252509mso-ascii-font-family%25253ATimes%25253B%25250A%252509mso-fareast-font-family%25253ATimes%25253B%25250A%252509mso-hansi-font-family%25253ATimes%25253B%25257D%25250A%252540page%252520WordSection1%25250A%252509%25257Bsize%25253A8.5in%25252011.0in%25253B%25250A%252509margin%25253A1.0in%2525201.25in%2525201.0in%2525201.25in%25253B%25250A%252509mso-header-margin%25253A.5in%25253B%25250A%252509mso-footer-margin%25253A.5in%25253B%25250A%252509mso-paper-source%25253A0%25253B%25257D%25250Adiv.WordSection1%25250A%252509%25257Bpage%25253AWordSection1%25253B%25257D%25250A%25252D%25252D%25253E%252D%252D%253E%2D%2D%3E-->\r\n</style></p>\r\n<p>\r\n	<span style="font-size:14px;"><span style="color: rgb(255, 0, 0);">Congratulations to all of the following members of the Class of 2012 who are recognized as &quot;Semi-Finalists&quot; for their performance on the PSAT/NMSQT. Good luck to all on becoming Finalists !!!<br />\r\n	</span></span></p>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Ayyala, Vinay </span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Chakradhar, Vineel </span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Flores, Maxwell </span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Gillet, Isaac </span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Guang, Stephanie </span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Guo, Stephen </span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Lew, Alex</span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Little, Kathryn </span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Liu, Grace </span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Mulvaney, James </span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Ng, Andrew </span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Porter, Zachary </span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Rangwani, Neil </span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Rathbone, Adam </span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Riordan, Samantha </span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Salwi, Sanjana </span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Tsim, Matthew </span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Wang, Bryan </span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Zhou, Angela </span></span></div>\r\n<div>\r\n	<span style="font-family:comic sans ms, cursive;"><span style="font-size: 12px;">Zhou, Patricia</span></span></div>', 1305021280, 0, 0),
(144, 'Link to Summer Packets', '<p>\r\n	Please click on the link for the appropriate &#39;pdf&#39; file that corresponds to the math summer packet.</p>\r\n<p>\r\n	<a href="https://docs.google.com/viewer?a=v&amp;pid=explorer&amp;chrome=true&amp;srcid=0B-9DKPILceBeMDI3MDM4YzEtNmM5Mi00M2YwLThmYjgtMWEyMGM2YTA0NGNi&amp;hl=en_US">Geometry<br />\r\n	</a></p>\r\n<p>\r\n	<a href="https://docs.google.com/leaf?id=0B-9DKPILceBeMmQxYTk3YjItNzQyNy00N2VkLWIwMDYtYzUwMDcyMjQ5NmE1&amp;hl=en_US">Algebra 2/Trig<br />\r\n	</a></p>\r\n<p>\r\n	<a href="https://docs.google.com/leaf?id=0B-9DKPILceBeZDVhM2Q1OWUtZDcxMC00NTMwLWI3ZTItYzk0MmIxNjFlN2Iy&amp;hl=en_US">Precalculus<br />\r\n	</a></p>\r\n<p>\r\n	<a href="https://docs.google.com/viewer?a=v&amp;pid=explorer&amp;chrome=true&amp;srcid=0B-9DKPILceBeZGZlNjNiYTktZDBiZC00ZDZmLThlMjQtYjYzNmMwZWY4NDI4&amp;hl=en_US">AP Calculus BC<br />\r\n	</a></p>\r\n<p>\r\n	<a href="https://docs.google.com/viewer?a=v&amp;pid=explorer&amp;chrome=true&amp;srcid=0B-9DKPILceBeYjE1ZDU4YzAtOTUzYy00YmZjLTkxYmYtYjFkZDU3MDgyMzRh&amp;hl=en_US">Multivariable Calculus<br />\r\n	</a></p>\r\n<p>\r\n	Please notify the main office if you have difficulty or would prefer to pick up a hard copy.</p>', 1311074858, 0, 0);
INSERT INTO `news` (`id`, `title`, `contents`, `start`, `expires`, `urgent`) VALUES
(145, 'Information Sessions - Fall 2011', '<p>\r\n	The following dates are for the 2011 Information Sessions. Attendance is mandatory for 8th grade students (Class of 2016) and a parent/guardian in order to receive an application. Students and parent/guardians must be in attendance for the entire program as the applications are distributed at the conclusion of the rotations.</p>\r\n<p>\r\n	<em>Saturday, 10/15/11 at 10:00 am<br />\r\n	</em></p>\r\n<p>\r\n	<em>Wednesday, 10/26/11 at 6:30 pm<br />\r\n	</em></p>\r\n<p>\r\n	<em>Saturday, 11/5/11 at 10:00 am<br />\r\n	</em></p>\r\n<p>\r\n	<em>Tuesday, 11/15/11 at 6:30 pm<br />\r\n	</em></p>\r\n<p>\r\n	Parking fills up quickly, as does the main auditorium. Once full, attendees will be moved to overflow rooms to watch the opening presentation on streamed video simulcast. Following the opening remarks, all attendees begin rotations at the same time.</p>', 1315988325, 0, 0),
(146, '#1 in the NATION !!!', '<p>\r\n	High Technology High School was identified as the <a href="http://education.usnews.rankingsandreviews.com/best-high-schools/rankings/math-science">#1 High School</a> in the Nation for Math &amp; Science.</p>\r\n<p>\r\n	A feature article from the US News site is also found <a href="http://education.usnews.rankingsandreviews.com/education/high-schools/articles/2011/09/27/new-jersey-high-school-challenges-the-gifted">here</a>.</p>\r\n<p>\r\n	Article in the Asbury Park Press found <a href="http://www.app.com/article/20111008/NJNEWS/310050011/High-Tech-High-gets-No-1-ranking">here</a>.</p>\r\n<p>\r\n	Congrats to the staff and students and the entire HTHS community !!!</p>', 1317113326, 0, 0),
(147, 'LIVE STREAM ... this Friday !!!', '<p>\r\n	<!--[if gte mso 9]><xml>\r\n <o:DocumentProperties>\r\n  <o:Revision>0</o:Revision>\r\n  <o:TotalTime>0</o:TotalTime>\r\n  <o:Pages>1</o:Pages>\r\n  <o:Words>164</o:Words>\r\n  <o:Characters>938</o:Characters>\r\n  <o:Company>Monmouth County Vocational School District</o:Company>\r\n  <o:Lines>7</o:Lines>\r\n  <o:Paragraphs>2</o:Paragraphs>\r\n  <o:CharactersWithSpaces>1100</o:CharactersWithSpaces>\r\n  <o:Version>14.0</o:Version>\r\n </o:DocumentProperties>\r\n <o:OfficeDocumentSettings>\r\n  <o:PixelsPerInch>96</o:PixelsPerInch>\r\n  <o:TargetScreenSize>800x600</o:TargetScreenSize>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>JA</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:EnableOpenTypeKerning/>\r\n   <w:DontFlipMirrorIndents/>\r\n   <w:OverrideTableStyleHps/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="&#45;-"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="276">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\ntable.MsoNormalTable\r\n	{mso-style-name:"Table Normal";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:"";\r\n	mso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n	mso-para-margin:0in;\r\n	mso-para-margin-bottom:.0001pt;\r\n	mso-pagination:widow-orphan;\r\n	font-size:10.0pt;\r\n	font-family:"Times New Roman";\r\n	mso-bidi-font-family:Arial;}\r\n</style>\r\n<![endif]--><!--StartFragment--></p>\r\n<p class="MsoNormal">\r\n	<span class="apple-style-span"><span style="font-size:14.0pt;\r\nline-height:115%;mso-bidi-font-family:&quot;Times New Roman&quot;;color:#002060;\r\nbackground:white">Eric Schneider was selected as a Finalist for the &ldquo;<b><i>Who Wants to Be a Mathematician Competition</i></b>&rdquo; after earning a perfect score in the qualifying round. The contest, sponsored by the American Mathematical Society, showcases ten of the nation&#39;s best high school math students who will </span></span><span style="font-size:14.0pt;line-height:115%;\r\nmso-bidi-font-family:&quot;Times New Roman&quot;;color:#002060;background:white">compete for nearly $30,000 in cash and prizes by answering multiple choice mathematics questions. T<span class="apple-style-span">he organization conducted a brief interview with Eric which can be heard here: <o:p></o:p></span></span></p>\r\n<p class="MsoNormal">\r\n	<span style="color:#0070C0"><a href="http://www.ams.org/programs/students/wwtbam/contestants-2012"><span style="color:#0070C0">http://www.ams.org/programs/students/wwtbam/contestants-2012</span></a><o:p></o:p></span></p>\r\n<p class="MsoNormal">\r\n	<span style="font-size:14.0pt;line-height:115%;color:#002060">Also, Eric&rsquo;s competition will be broadcast live at 9:30 a.m. (Eastern) on January 6 and the real time webcast link is below if anyone is available to view/play along at that time.</span><span style="font-size:14.0pt;line-height:115%;mso-bidi-font-family:\r\n&quot;Times New Roman&quot;;color:#333333;background:white"> <o:p></o:p></span></p>\r\n<p class="MsoNormal">\r\n	<span style="font-size:10.0pt;line-height:115%;color:#0070C0"><a href="http://www.ustream.tv/channel/who-wants-to-be-a-mathematician-national-contest#utm_campaign=www.ams.org&amp;utm_source=6486197&amp;utm_medium=social"><span style="color:#0070C0">http://www.ustream.tv/channel/who-wants-to-be-a-mathematician-national-contest#utm_campaign=www.ams.org&amp;utm_source=6486197&amp;utm_medium=social</span></a><o:p></o:p></span></p>\r\n<!--EndFragment-->', 1325600388, 0, 0),
(148, 'ENTRANCE EXAM POSTPONED !!!', '<p style="color: rgb(0, 0, 0); font-family: Times; text-align: -webkit-center; font-size: medium; ">\r\n	<font face="Trebuchet MS, Geneva, Arial, Helvetica, SunSans-Regular, sans-serif" size="+2">Due to inclement weather, the MCVSD Admissions Exam scheduled for January 21, 2012 will be&nbsp;</font><font color="red" face="Trebuchet MS, Geneva, Arial, Helvetica, SunSans-Regular, sans-serif" size="+2">postponed to January 28, 2012</font>.&nbsp;<font face="Trebuchet MS, Geneva, Arial, Helvetica, SunSans-Regular, sans-serif" size="+2"><br />\r\n	Report to the same building at the same time as you were scheduled for the January 21 test date.</font></p>', 1327065014, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` text NOT NULL,
  `last_updated` int(11) NOT NULL,
  `title` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `parent_emails`
--

CREATE TABLE IF NOT EXISTS `parent_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_address` text NOT NULL,
  `ip_address` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `parent_emails`
--

INSERT INTO `parent_emails` (`id`, `email_address`, `ip_address`) VALUES
(1, 'JmooneyhamHTHS@gmail.com', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('0c3a90a3a2d05056bf529108f852251a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.77 Safari/535.7', 1328073116, ''),
('9c7887152b77fe1206aea3b9bc75a574', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.77 Safari/535.7', 1328058659, 'a:5:{s:9:"user_data";s:0:"";s:5:"login";b:1;s:2:"id";s:1:"1";s:4:"area";s:5:"admin";s:8:"username";s:4:"root";}');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE IF NOT EXISTS `site_settings` (
  `setting_name` text NOT NULL,
  `setting_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`setting_name`, `setting_value`) VALUES
('online', '1'),
('offline_message', 'Our site is temporarily down for mantinance and will be back up and running again soon!');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `hash` text NOT NULL,
  `salt` text NOT NULL,
  `username` text NOT NULL,
  `subject` text NOT NULL,
  `voicemail` text NOT NULL,
  `mentorship_admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `name`, `email`, `hash`, `salt`, `username`, `subject`, `voicemail`, `mentorship_admin`) VALUES
(1, 'Test Teacher', 'JMooneyhamHTHS@gmail.com', 'Reset', 'f9e0fj3awr4fs4f4wf4qa34', 'JMooneyham', 'Computer Science', 'x1662', 0);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_blogs`
--

CREATE TABLE IF NOT EXISTS `teacher_blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `contents` text NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `teacher_blogs`
--

INSERT INTO `teacher_blogs` (`id`, `teacher_id`, `title`, `contents`, `date`) VALUES
(1, 1, 'Test', 'asdfwaefawee', 0);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_pages`
--

CREATE TABLE IF NOT EXISTS `teacher_pages` (
  `teacher_id` int(11) NOT NULL,
  `page_contents` text NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_pages`
--

INSERT INTO `teacher_pages` (`teacher_id`, `page_contents`) VALUES
(1, 'blargh');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
