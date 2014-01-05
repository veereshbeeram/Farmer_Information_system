-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	4.1.12a-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema farmer_db
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ farmer_db;
USE farmer_db;

--
-- Table structure for table `farmer_db`.`crop`
--

DROP TABLE IF EXISTS `crop`;
CREATE TABLE `crop` (
  `Cropid` int(10) unsigned zerofill NOT NULL auto_increment,
  `type` varchar(45) default '',
  `name` varchar(45) default '',
  `season` varchar(45) default '',
  PRIMARY KEY  (`Cropid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 3072 kB; (`Inid`) REFER `farmer_db/insurance`(`';

--
-- Dumping data for table `farmer_db`.`crop`
--

/*!40000 ALTER TABLE `crop` DISABLE KEYS */;
INSERT INTO `crop` (`Cropid`,`type`,`name`,`season`) VALUES 
 (0000000001,'rabbi','rice','rainy'),
 (0000000002,'rabbi','wheat','summer'),
 (0000000003,'rabbi','corn','autumn'),
 (0000000007,'kharif','cane','summer'),
 (0000000008,'kharif','bajra','winter'),
 (0000000010,'kharif','sugarcane','autumn'),
 (0000000012,'kharif','maize','summer'),
 (0000000021,'millets','jowar','all'),
 (0000000022,'millets','ragi','all');
/*!40000 ALTER TABLE `crop` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`crop_fertilizer`
--

DROP TABLE IF EXISTS `crop_fertilizer`;
CREATE TABLE `crop_fertilizer` (
  `Cropid` int(10) unsigned NOT NULL default '0',
  `Feid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`Cropid`,`Feid`),
  KEY `FK_crop_fertilizer_2` (`Feid`),
  CONSTRAINT `FK_crop_fertilizer_1` FOREIGN KEY (`Cropid`) REFERENCES `crop` (`Cropid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_crop_fertilizer_2` FOREIGN KEY (`Feid`) REFERENCES `fertilizer` (`Feid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; (`Cropid`) REFER `farmer_db/crop`(`Cr';

--
-- Dumping data for table `farmer_db`.`crop_fertilizer`
--

/*!40000 ALTER TABLE `crop_fertilizer` DISABLE KEYS */;
INSERT INTO `crop_fertilizer` (`Cropid`,`Feid`) VALUES 
 (1,5),
 (7,5),
 (8,5),
 (12,5),
 (21,5),
 (22,5),
 (1,6),
 (10,6),
 (12,6),
 (22,6);
/*!40000 ALTER TABLE `crop_fertilizer` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`crop_location`
--

DROP TABLE IF EXISTS `crop_location`;
CREATE TABLE `crop_location` (
  `Cropid` int(10) unsigned NOT NULL default '0',
  `Locid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`Cropid`,`Locid`),
  KEY `FK_crop_location_2` (`Locid`),
  CONSTRAINT `FK_crop_location_1` FOREIGN KEY (`Cropid`) REFERENCES `crop` (`Cropid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_crop_location_2` FOREIGN KEY (`Locid`) REFERENCES `location` (`Locid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_db`.`crop_location`
--

/*!40000 ALTER TABLE `crop_location` DISABLE KEYS */;
INSERT INTO `crop_location` (`Cropid`,`Locid`) VALUES 
 (3,3),
 (10,3);
/*!40000 ALTER TABLE `crop_location` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`crop_soil`
--

DROP TABLE IF EXISTS `crop_soil`;
CREATE TABLE `crop_soil` (
  `CropId` int(10) unsigned NOT NULL default '0',
  `Sid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`CropId`,`Sid`),
  KEY `this_sid` (`Sid`),
  CONSTRAINT `this_cropid` FOREIGN KEY (`CropId`) REFERENCES `crop` (`Cropid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `this_sid` FOREIGN KEY (`Sid`) REFERENCES `soil` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_db`.`crop_soil`
--

/*!40000 ALTER TABLE `crop_soil` DISABLE KEYS */;
INSERT INTO `crop_soil` (`CropId`,`Sid`) VALUES 
 (8,1),
 (1,2),
 (2,2),
 (3,2),
 (1,8),
 (2,8),
 (3,8),
 (7,8),
 (10,8);
/*!40000 ALTER TABLE `crop_soil` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`dependant`
--

DROP TABLE IF EXISTS `dependant`;
CREATE TABLE `dependant` (
  `Fid` int(10) unsigned default '0',
  `name` varchar(45) NOT NULL default '',
  `age` int(10) unsigned NOT NULL default '0',
  `relationship` varchar(45) NOT NULL default '',
  KEY `dep_user` (`Fid`),
  CONSTRAINT `dep_user` FOREIGN KEY (`Fid`) REFERENCES `tgmcuser` (`Fid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_db`.`dependant`
--

/*!40000 ALTER TABLE `dependant` DISABLE KEYS */;
INSERT INTO `dependant` (`Fid`,`name`,`age`,`relationship`) VALUES 
 (71,'a',1,'c'),
 (71,'b',2,'d'),
 (66,'raj',8,'son'),
 (66,'vijay',5,'son'),
 (5,'tony',5,'son'),
 (5,'tom',9,'son'),
 (74,'rahul',7,'son'),
 (74,'priya',4,'daughter');
/*!40000 ALTER TABLE `dependant` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`farmer_crop`
--

DROP TABLE IF EXISTS `farmer_crop`;
CREATE TABLE `farmer_crop` (
  `Fid` int(10) unsigned NOT NULL default '0',
  `Cropid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`Fid`,`Cropid`),
  KEY `FK_farmer_crop_2` (`Cropid`),
  CONSTRAINT `FK_farmer_crop_1` FOREIGN KEY (`Fid`) REFERENCES `tgmcuser` (`Fid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_farmer_crop_2` FOREIGN KEY (`Cropid`) REFERENCES `crop` (`Cropid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_db`.`farmer_crop`
--

/*!40000 ALTER TABLE `farmer_crop` DISABLE KEYS */;
INSERT INTO `farmer_crop` (`Fid`,`Cropid`) VALUES 
 (5,3);
/*!40000 ALTER TABLE `farmer_crop` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`farmer_insurance`
--

DROP TABLE IF EXISTS `farmer_insurance`;
CREATE TABLE `farmer_insurance` (
  `Fid` int(10) unsigned NOT NULL default '0',
  `Insid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`Fid`,`Insid`),
  KEY `this_insuranceid` (`Insid`),
  CONSTRAINT `this_farmerid` FOREIGN KEY (`Fid`) REFERENCES `tgmcuser` (`Fid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `this_insuranceid` FOREIGN KEY (`Insid`) REFERENCES `insurance` (`InsID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_db`.`farmer_insurance`
--

/*!40000 ALTER TABLE `farmer_insurance` DISABLE KEYS */;
INSERT INTO `farmer_insurance` (`Fid`,`Insid`) VALUES 
 (5,1),
 (5,3),
 (74,6);
/*!40000 ALTER TABLE `farmer_insurance` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`farmer_loan`
--

DROP TABLE IF EXISTS `farmer_loan`;
CREATE TABLE `farmer_loan` (
  `Fid` int(10) unsigned NOT NULL default '0',
  `Lid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`Fid`,`Lid`),
  KEY `this.Lid` (`Lid`),
  CONSTRAINT `this.Fid` FOREIGN KEY (`Fid`) REFERENCES `tgmcuser` (`Fid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `this.Lid` FOREIGN KEY (`Lid`) REFERENCES `loan` (`Lid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_db`.`farmer_loan`
--

/*!40000 ALTER TABLE `farmer_loan` DISABLE KEYS */;
INSERT INTO `farmer_loan` (`Fid`,`Lid`) VALUES 
 (5,1),
 (55,1),
 (5,4);
/*!40000 ALTER TABLE `farmer_loan` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`fertilizer`
--

DROP TABLE IF EXISTS `fertilizer`;
CREATE TABLE `fertilizer` (
  `Feid` int(10) unsigned zerofill NOT NULL auto_increment,
  `price` float default '0',
  `distributor` varchar(45) default '',
  `description` varchar(45) default '',
  PRIMARY KEY  (`Feid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_db`.`fertilizer`
--

/*!40000 ALTER TABLE `fertilizer` DISABLE KEYS */;
INSERT INTO `fertilizer` (`Feid`,`price`,`distributor`,`description`) VALUES 
 (0000000005,300,'K&P','phosphorus'),
 (0000000006,1000,'abc','NTP');
/*!40000 ALTER TABLE `fertilizer` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`insurance`
--

DROP TABLE IF EXISTS `insurance`;
CREATE TABLE `insurance` (
  `InsID` int(10) unsigned zerofill NOT NULL auto_increment,
  `term` int(10) unsigned default '0',
  `type` varchar(45) default '',
  `name` varchar(45) default '',
  `premium` float default '0',
  `interest` float NOT NULL default '0',
  `count` int(10) unsigned default '0',
  PRIMARY KEY  (`InsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_db`.`insurance`
--

/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` (`InsID`,`term`,`type`,`name`,`premium`,`interest`,`count`) VALUES 
 (0000000001,5000,'crop','CRI',300,2,1),
 (0000000002,5000,'equipment','EI',300,0,0),
 (0000000003,5000,'life insurance','LIC',300,0,1),
 (0000000006,8,'crop','CRI-New',900,2,1);
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`loan`
--

DROP TABLE IF EXISTS `loan`;
CREATE TABLE `loan` (
  `Lid` int(10) unsigned zerofill NOT NULL auto_increment,
  `amount` float default '0',
  `term` int(10) unsigned default '0',
  `income` text,
  `interest` float default '0',
  `name` varchar(45) default '',
  `count` int(10) unsigned default '0',
  PRIMARY KEY  (`Lid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_db`.`loan`
--

/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` (`Lid`,`amount`,`term`,`income`,`interest`,`name`,`count`) VALUES 
 (0000000001,200000,5,'1.5-3',8,'suvarna',2),
 (0000000004,120000,8,'1-1.5',7.5,'Sahyog',1);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `Locid` int(10) unsigned zerofill NOT NULL auto_increment,
  `district` varchar(45) default '',
  `state` varchar(45) default '',
  `avg_temp` float default '0',
  `rainfall` float default '0',
  `marketName` varchar(35) NOT NULL default '',
  PRIMARY KEY  (`Locid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_db`.`location`
--

/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`Locid`,`district`,`state`,`avg_temp`,`rainfall`,`marketName`) VALUES 
 (0000000003,'Coimbatore','Tamil Nadu',30.2,130,'market A'),
 (0000000004,'Cuddalore','Tamil Nadu',30.5,122,'market B'),
 (0000000005,'Dharmapuri','Tamil Nadu',32,125,'market C'),
 (0000000006,'Dindigul','Tamil Nadu',29.5,135,'market D'),
 (0000000007,'Erode','Tamil Nadu',32.2,129,'market E'),
 (0000000008,'Kancheepuram','Tamil Nadu',31.4,131,'market F'),
 (0000000009,'Kanniyakumari','Tamil Nadu',29.5,120,'market G'),
 (0000000010,'Karur','Tamil Nadu',31.7,126,'market H'),
 (0000000011,'Chikballapur','Karnataka',28,110,'market I'),
 (0000000012,'Chitradurga','Karnataka',30.2,120,'market J'),
 (0000000013,'Davanagere','Karnataka',31.7,128,'market K'),
 (0000000014,'Mahbubnagar','Andhra Pradesh',29.5,126,'market L'),
 (0000000015,'Medak','Andhra Pradesh',29.7,132,'market M'),
 (0000000016,'Uttara Kannada','Karnataka',25,100,'market N'),
 (0000000019,'Warli','Maharashtra',30,150,'market Mumbai');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`market_crop`
--

DROP TABLE IF EXISTS `market_crop`;
CREATE TABLE `market_crop` (
  `Lid` int(10) unsigned NOT NULL auto_increment,
  `Cropid` int(10) unsigned NOT NULL default '0',
  `oldPrice` float NOT NULL default '0',
  `newPrice` float NOT NULL default '0',
  PRIMARY KEY  (`Lid`,`Cropid`),
  KEY `this_cid` (`Cropid`),
  CONSTRAINT `this_cid` FOREIGN KEY (`Cropid`) REFERENCES `crop` (`Cropid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `this_loc` FOREIGN KEY (`Lid`) REFERENCES `location` (`Locid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_db`.`market_crop`
--

/*!40000 ALTER TABLE `market_crop` DISABLE KEYS */;
INSERT INTO `market_crop` (`Lid`,`Cropid`,`oldPrice`,`newPrice`) VALUES 
 (3,1,25,25),
 (3,2,21,25),
 (3,3,21,21),
 (3,7,20,22),
 (3,8,21,21),
 (3,10,28,28),
 (4,1,16,20),
 (4,2,18,24),
 (4,3,26,28),
 (4,7,25,27),
 (4,8,26,26),
 (4,10,29,29),
 (5,1,20,24),
 (5,2,20,20),
 (5,3,21,23),
 (5,7,28,25),
 (5,8,28,28),
 (5,10,25,28),
 (6,1,23,23),
 (6,2,22,23),
 (6,3,24,27),
 (6,7,26,25),
 (6,8,26,28),
 (6,10,28,28),
 (7,1,21,24),
 (7,2,22,25),
 (7,3,22,24),
 (7,7,24,26),
 (7,8,25,26),
 (7,10,26,28),
 (8,1,21,23),
 (8,2,22,23),
 (8,3,25,25),
 (8,7,25,27),
 (8,8,27,25),
 (8,10,28,29),
 (9,1,22,22),
 (9,2,22,23),
 (9,3,23,23),
 (9,7,25,26),
 (9,8,25,27),
 (9,10,27,27),
 (10,1,20,23),
 (10,2,22,23),
 (10,3,23,25),
 (10,7,25,25),
 (10,8,25,27),
 (10,10,27,27),
 (11,1,22,23),
 (11,2,23,23),
 (11,3,23,25),
 (11,7,27,25),
 (11,8,27,27),
 (11,10,27,29),
 (12,1,21,22),
 (12,2,22,24),
 (12,3,23,24),
 (12,7,25,24),
 (12,8,26,27),
 (12,10,27,27),
 (13,1,22,25),
 (13,2,25,25),
 (13,3,25,24),
 (13,7,26,27),
 (13,8,27,27);
INSERT INTO `market_crop` (`Lid`,`Cropid`,`oldPrice`,`newPrice`) VALUES 
 (13,10,29,27),
 (14,1,20,23),
 (14,2,22,23),
 (14,3,23,24),
 (14,7,26,24),
 (14,8,26,27),
 (14,10,28,29),
 (15,1,21,24),
 (15,2,25,24),
 (15,3,25,27),
 (15,7,27,27),
 (15,8,28,27),
 (15,10,28,29),
 (16,1,23,23),
 (16,2,22,23),
 (16,3,25,23),
 (16,7,25,27),
 (16,8,27,27),
 (16,10,27,29);
/*!40000 ALTER TABLE `market_crop` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`poll`
--

DROP TABLE IF EXISTS `poll`;
CREATE TABLE `poll` (
  `Pollid` int(10) unsigned NOT NULL auto_increment,
  `question` text NOT NULL,
  `option1` text NOT NULL,
  `option2` text NOT NULL,
  `option3` text NOT NULL,
  `option4` text NOT NULL,
  `count1` int(10) unsigned NOT NULL default '0',
  `count2` int(10) unsigned NOT NULL default '0',
  `count3` int(10) unsigned NOT NULL default '0',
  `count4` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`Pollid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_db`.`poll`
--

/*!40000 ALTER TABLE `poll` DISABLE KEYS */;
INSERT INTO `poll` (`Pollid`,`question`,`option1`,`option2`,`option3`,`option4`,`count1`,`count2`,`count3`,`count4`) VALUES 
 (1,'how r u?','ok','fine ','dont know','none',3,6,2,1),
 (3,'hello hello hello hello hello hello hello hello hello hello hello\r\n','a','b','c','d',3,3,2,4);
/*!40000 ALTER TABLE `poll` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`query`
--

DROP TABLE IF EXISTS `query`;
CREATE TABLE `query` (
  `Fid` int(10) unsigned default NULL,
  `queryText` text,
  `offId` int(10) unsigned default '0',
  `ans` text NOT NULL,
  `Qid` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`Qid`),
  KEY `this_user` TYPE BTREE (`Fid`),
  CONSTRAINT `this_off` FOREIGN KEY (`Fid`) REFERENCES `tgmcuser` (`Fid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `this_user` FOREIGN KEY (`Fid`) REFERENCES `tgmcuser` (`Fid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_db`.`query`
--

/*!40000 ALTER TABLE `query` DISABLE KEYS */;
INSERT INTO `query` (`Fid`,`queryText`,`offId`,`ans`,`Qid`) VALUES 
 (5,'how r u??',6,'none1',1),
 (5,'how do u do??',66,'answered',2),
 (5,'how is ur wife??',6,'she is hot',3),
 (5,'please ans',0,'ok take it',4),
 (5,'rice',0,'none1',5),
 (5,'wheat??',0,'none1',6),
 (5,'did u answer?',66,'yes i did',7);
/*!40000 ALTER TABLE `query` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`soil`
--

DROP TABLE IF EXISTS `soil`;
CREATE TABLE `soil` (
  `Sid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`Sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_db`.`soil`
--

/*!40000 ALTER TABLE `soil` DISABLE KEYS */;
INSERT INTO `soil` (`Sid`,`name`) VALUES 
 (1,'red'),
 (2,'black'),
 (8,'alluvial'),
 (9,'loamy'),
 (10,'clayey');
/*!40000 ALTER TABLE `soil` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`tool`
--

DROP TABLE IF EXISTS `tool`;
CREATE TABLE `tool` (
  `Tid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `manufacturer` varchar(45) NOT NULL default '',
  `fileName` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`Tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_db`.`tool`
--

/*!40000 ALTER TABLE `tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`training`
--

DROP TABLE IF EXISTS `training`;
CREATE TABLE `training` (
  `Tid` int(10) unsigned NOT NULL auto_increment,
  `description` text NOT NULL,
  `address` text NOT NULL,
  `maxCount` int(10) unsigned NOT NULL default '0',
  `duration` int(10) unsigned NOT NULL default '0',
  `name` text NOT NULL,
  `time` datetime default NULL,
  `regCount` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`Tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_db`.`training`
--

/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` (`Tid`,`description`,`address`,`maxCount`,`duration`,`name`,`time`,`regCount`) VALUES 
 (2,'d','ban',112,2,'Newest trends','2008-09-10 09:00:00',5),
 (3,'info on new tools/solutions','bangalore',100,2,'New trends','2009-09-09 10:00:00',5);
/*!40000 ALTER TABLE `training` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`training_reg`
--

DROP TABLE IF EXISTS `training_reg`;
CREATE TABLE `training_reg` (
  `Tid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `occupation` varchar(20) NOT NULL default '',
  `contact` int(10) unsigned default NULL,
  KEY `this_tid` (`Tid`),
  CONSTRAINT `this_tid` FOREIGN KEY (`Tid`) REFERENCES `training` (`Tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_db`.`training_reg`
--

/*!40000 ALTER TABLE `training_reg` DISABLE KEYS */;
INSERT INTO `training_reg` (`Tid`,`name`,`occupation`,`contact`) VALUES 
 (3,'ramesh','Farmer',123),
 (2,'harsha','Student',100),
 (3,'harsha','Student',6555),
 (2,'prakash','Farmer',123),
 (3,'prakash','Farmer',123),
 (2,'akshay','Farmer',521435),
 (3,'akshay','Farmer',521435),
 (3,'raj','Other',43657632),
 (3,'prakash','Farmer',NULL),
 (2,'akash','Farmer',NULL),
 (2,'rahul','Farmer',NULL);
/*!40000 ALTER TABLE `training_reg` ENABLE KEYS */;


--
-- Table structure for table `farmer_db`.`training_user`
--

DROP TABLE IF EXISTS `training_user`;
CREATE TABLE `training_user` (
  `Tid` int(10) unsigned NOT NULL default '0',
  `Fid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`Tid`,`Fid`),
  KEY `farmer_fid` (`Fid`),
  CONSTRAINT `farmer_fid` FOREIGN KEY (`Fid`) REFERENCES `tgmcuser` (`Fid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `training_tid` FOREIGN KEY (`Tid`) REFERENCES `training` (`Tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `farmer_db`.`training_user`
--

/*!40000 ALTER TABLE `training_user` DISABLE KEYS */;
INSERT INTO `training_user` (`Tid`,`Fid`) VALUES 
 (3,5),
 (2,19),
 (3,19),
 (2,74);
/*!40000 ALTER TABLE `training_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
