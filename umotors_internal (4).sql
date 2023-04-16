-- phpMiniAdmin dump 1.9.210705
-- Datetime: 2023-04-16 04:35:19
-- Host: 
-- Database: umotors_internal

/*!40030 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

DROP TABLE IF EXISTS `all_employee_sales`;
CREATE ALGORITHM=UNDEFINED DEFINER=`UMotors_Internal`@`%` SQL SECURITY DEFINER VIEW `all_employee_sales` AS select `dealerstats`.`EmployeeId` AS `employeeId`,`useraccounts`.`LastName` AS `LastName`,count(`dealerstats`.`EmployeeId`) AS `NumSold`,sum(`dealerstats`.`Sales`) AS `TotalSales` from (`dealerstats` join `useraccounts` on((`dealerstats`.`EmployeeId` = `useraccounts`.`EmployeeID`))) group by `dealerstats`.`EmployeeId`;

DROP TABLE IF EXISTS `dealerstats`;
CREATE TABLE `dealerstats` (
  `EmployeeId` int DEFAULT NULL,
  `SalesDate` date DEFAULT NULL,
  `AutoSold` varchar(100) DEFAULT NULL,
  `Sales` int DEFAULT NULL,
  `VIN` varchar(25) DEFAULT NULL,
  KEY `EmployeeId` (`EmployeeId`),
  KEY `VIN` (`VIN`),
  CONSTRAINT `dealerstats_ibfk_1` FOREIGN KEY (`EmployeeId`) REFERENCES `useraccounts` (`EmployeeID`),
  CONSTRAINT `dealerstats_ibfk_2` FOREIGN KEY (`VIN`) REFERENCES `inventory` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*!40000 ALTER TABLE `dealerstats` DISABLE KEYS */;
INSERT INTO `dealerstats` VALUES ('1001','2023-01-24','JEEP WRANGLER','25000','1G1AS18H897131396'),('1001','2023-01-12','GMC YUKON','20000','1GNFK36Y39R225581'),('1003','2023-01-12','DODGE CHARGER','21900','1B7GG22N2YS509392'),('1002','2023-01-02','VOLKSWAGEN JETTA','23000','3VWLL7AJ7EM419484'),('1004','2023-01-28','DODGE RAM','37090','3C6UR5FJ1EG114572'),('1005','2023-01-02','JEEP CHEROKEE','50000','4T1BF1FK1DU679213'),('1004','2023-01-06','JEEP WRANGLER','15000','JTKDE167390297719'),('1003','2023-01-06','MITSUBISHI LANCER','20000','2HNYD2H26CH509996'),('1002','2023-01-09','JEEP WRANGLER','20000','WAUGFAFCXFN021872'),('1005','2023-01-12','MITSUBISHI','22000','1FAFP446X4F206981');
/*!40000 ALTER TABLE `dealerstats` ENABLE KEYS */;

DROP TABLE IF EXISTS `email`;
CREATE TABLE `email` (
  `EmployeeId` int NOT NULL,
  `Email` varchar(100) NOT NULL,
  `TO` varchar(100) NOT NULL,
  `FROM` varchar(100) NOT NULL,
  `CC` varchar(100) NOT NULL,
  `Subject` varchar(100) NOT NULL,
  `Message` varchar(255) NOT NULL,
  PRIMARY KEY (`EmployeeId`),
  CONSTRAINT `email_ibfk_1` FOREIGN KEY (`EmployeeId`) REFERENCES `useraccounts` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*!40000 ALTER TABLE `email` DISABLE KEYS */;
/*!40000 ALTER TABLE `email` ENABLE KEYS */;

DROP TABLE IF EXISTS `employee_five_sales`;
CREATE ALGORITHM=UNDEFINED DEFINER=`UMotors_Internal`@`%` SQL SECURITY DEFINER VIEW `employee_five_sales` AS select `useraccounts`.`LastName` AS `LastName`,count(`dealerstats`.`EmployeeId`) AS `NumSold`,sum(`dealerstats`.`Sales`) AS `TotalSales` from (`dealerstats` join `useraccounts` on((`dealerstats`.`EmployeeId` = `useraccounts`.`EmployeeID`))) where (`dealerstats`.`EmployeeId` = '1005');

DROP TABLE IF EXISTS `employee_four_sales`;
CREATE ALGORITHM=UNDEFINED DEFINER=`UMotors_Internal`@`%` SQL SECURITY DEFINER VIEW `employee_four_sales` AS select `useraccounts`.`LastName` AS `LastName`,count(`dealerstats`.`EmployeeId`) AS `NumSold`,sum(`dealerstats`.`Sales`) AS `TotalSales` from (`dealerstats` join `useraccounts` on((`dealerstats`.`EmployeeId` = `useraccounts`.`EmployeeID`))) where (`dealerstats`.`EmployeeId` = '1004');

DROP TABLE IF EXISTS `employee_one_sales`;
CREATE ALGORITHM=UNDEFINED DEFINER=`UMotors_Internal`@`%` SQL SECURITY DEFINER VIEW `employee_one_sales` AS select `useraccounts`.`LastName` AS `LastName`,count(`dealerstats`.`EmployeeId`) AS `NumSold`,sum(`dealerstats`.`Sales`) AS `TotalSales` from (`dealerstats` join `useraccounts` on((`dealerstats`.`EmployeeId` = `useraccounts`.`EmployeeID`))) where (`dealerstats`.`EmployeeId` = '1001');

DROP TABLE IF EXISTS `employee_three_sales`;
CREATE ALGORITHM=UNDEFINED DEFINER=`UMotors_Internal`@`%` SQL SECURITY DEFINER VIEW `employee_three_sales` AS select `useraccounts`.`LastName` AS `LastName`,count(`dealerstats`.`EmployeeId`) AS `NumSold`,sum(`dealerstats`.`Sales`) AS `TotalSales` from (`dealerstats` join `useraccounts` on((`dealerstats`.`EmployeeId` = `useraccounts`.`EmployeeID`))) where (`dealerstats`.`EmployeeId` = '1003');

DROP TABLE IF EXISTS `employee_two_sales`;
CREATE ALGORITHM=UNDEFINED DEFINER=`UMotors_Internal`@`%` SQL SECURITY DEFINER VIEW `employee_two_sales` AS select `useraccounts`.`LastName` AS `LastName`,count(`dealerstats`.`EmployeeId`) AS `NumSold`,sum(`dealerstats`.`Sales`) AS `TotalSales` from (`dealerstats` join `useraccounts` on((`dealerstats`.`EmployeeId` = `useraccounts`.`EmployeeID`))) where (`dealerstats`.`EmployeeId` = '1002');

DROP TABLE IF EXISTS `inorder`;
CREATE ALGORITHM=UNDEFINED DEFINER=`UMotors_Internal`@`%` SQL SECURITY DEFINER VIEW `inorder` AS select `inventory`.`Year` AS `Year`,`inventory`.`Make` AS `Make`,`inventory`.`Model` AS `Model`,`inventory`.`Color` AS `Color`,`inventory`.`Price` AS `Price`,`inventory`.`NewOrUsed` AS `NewOrUsed`,`inventory`.`SoldOrInStock` AS `SoldOrInStock`,`inventory`.`Doors` AS `Doors`,`inventory`.`Miles` AS `Miles`,`inventory`.`Body` AS `Body`,`inventory`.`VIN` AS `VIN` from `inventory` order by `inventory`.`SoldOrInStock`,`inventory`.`Year`;

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `Year` int DEFAULT NULL,
  `Make` varchar(30) DEFAULT NULL,
  `Model` varchar(30) DEFAULT NULL,
  `Color` varchar(30) DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `NewOrUsed` varchar(30) DEFAULT NULL,
  `SoldOrInStock` varchar(30) DEFAULT NULL,
  `Doors` int DEFAULT NULL,
  `Miles` int DEFAULT NULL,
  `Body` varchar(30) DEFAULT NULL,
  `VIN` varchar(25) NOT NULL,
  `TradeIn` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES ('2023','CHEVROLET','CAMARO','Black','55000','New','In Stock','4','10','Sedan','1B4GP44322B623954',NULL),('2008','DODGE','CHARGER','Blue','21900','Used','Sold','4','101434','SEDAN','1B7GG22N2YS509392',NULL),('2021','Mitsubishi','Outlander','Silver','28000','Used','In Stock','4','6000','SUV','1C3EJ56H6YN296416','Yes'),('2022','Volvo','S60','Gray','42000','New','In Stock','4','1000','Sedan','1FAFP4045YF186505','No'),('2010','MITSUBISHI','LANCER','White','22000','Used','Sold','4','90000','Sport','1FAFP446X4F206981',NULL),('2023','KIA','Sportage','White','27000','New','In Stock','4','51','SUV','1FMPU17586LA16301','No'),('2023','Nissan','Pathfinder','Silver','36000','New','In Stock','4','45','SUV','1FTNE2EW6BDA41972','No'),('2021','KIA','Ceed','Silver','23000','Used','In Stock','4','5000','Sport Hatchback','1FTNW21P03EC80120','Yes'),('2023','JEEP','WRANGLER','Navy Blue','55000','New','Sold','4','25','SUV','1G1AS18H897131396',NULL),('2021','Tesla','Model S','Red','84000','New','In Stock','4','7000','Sedan','1G1PH5SC7C7205749','Yes'),('2022','Nissan','Rogue','Black','28000','New','In Stock','4','3000','Sport Suv','1G1ZB5EB0A4113829','No'),('2020','GMC','Sierra','Black','52000','Used','In Stock','4','21000','Truck','1G3AG55N6P6375660','No'),('2022','Jeep','Gladiator','Orange','40000','New','In Stock','2','1150','SUV','1G4HD57237U232831','No'),('2023','Ford','Mustang','Silver','38195','New','In Stock','4','16','Sedan','1G6DM577240185165',NULL),('2016','Volvo','S90','White','30000','Used','In Stock','4','99000','Sedan','1GC4K1E84FF557404','No'),('2020','Volvo','V60','Black','49895','Used','In Stock','4','26000','Hatchback','1GCDT19XXVK180470','No'),('2019','GMC','Yukon','Silver','50000','Used','In Stock','4','39000','SUV','1GCRKSE79CZ225018','Yes'),('2023','Infiniti','QX80','Silver','72000','New','In Stock','4','16','SUV','1GCVKSEC0FZ168515','No'),('2003','CHEVROLET','TRAILBLAZER','RED','15000','Used','In Stock','4','60000','SUV','1GNDT13S132123947',NULL),('2016','GMC','YUKON','TAN','20000','Used','Sold','4','97353','SUV','1GNFK36Y39R225581',NULL),('2017','Toyota','Tacoma','Silver','28800','Used','In Stock','4','16','Truck','1HGCP2F61BA124583','No'),('2019','Honda','Odyssey','Silver','37490','Used','In Stock','4','33000','Minivan','1J4GW48N23C615618','No'),('2023','HONDA','Accord','BLUE','29500','NEW','Stock','4','17','Sport','1J4PN5GK8AW139841',NULL),('2019','JEEP','WRANGLER','Black','12000','New','In Stock','2','36000','SUV','1J8GA59198L640523','Yes'),('2018','Volkswagen','Tiguan','Silver','27800','Used','In Stock','4','43100','SUV','2B3HD46R5XH559488','No'),('2022','KIA','Stinger','Red','37000','New','In Stock','2','250','Sport','2C3KA53G88H102508','No'),('2023','Volkswagen','Atlas','White','30000','New','In Stock','4','40','SUV','2C4RDGCGXER450121','No'),('2019','Volkswagen','Golf','Black','20101','Used','In Stock','4','33000','Hatchback','2G1WC5E35E1157741','No'),('2023','Infiniti','QX50','White','40000','New','In Stock','4','21','SUV','2GNFLCEK8D6423331','No'),('2021','Mazda','Mazda3','Silver','23000','Used','In Stock','4','5000','Sport Hatchback','2HKRL1854YH532922','Yes'),('2009','MITSUBISHI','LANCER','White','20000','Used','Sold','4','120000','Sport','2HNYD2H26CH509996',NULL),('2021','Jeep','Cherokee','Black','37000','Used','In Stock','4','20000','SUV','2T2BK1BA9AC079959','Yes'),('2023','Toyota','GR86','Blue','30000','New','In Stock','2','17','Sedan','31N4AA5AP3BC838539','No'),('2023','DODGE','RAM','RED','37090','New','Sold','4','50','Truck','3C6UR5FJ1EG114572',NULL),('2022','Volvo','XC90','Silver','54800','New','In Stock','4','2100','SUV','3D6WU7ELXBG602374','No'),('2023','Tesla','Model Y','Blue','54000','New','In Stock','4','45','Sedan','3FA6P0H75DR105555','No'),('2019','GMC','Yukon','Silver','50000','Used','In Stock','4','39000','SUV','3FA6P0HD1ER250924',NULL),('2017','NISSAN','Altima','BLUE','5000','Used','In Stock','2','64000','SPORT','3GYFNCEY2AS550705','Yes'),('2023','VOLKSWAGEN','JETTA','GRAY','23000','New','Sold','4','0','SEDAN','3VWLL7AJ7EM419484',NULL),('2023','Tesla','Model 3','Silver','42800','New','In Stock','4','16','Sedan','3VWPW31C88M520847','No'),('2023','JEEP','CHEROKEE','Black','54000','New','Sold','4','0','SPORT SUV','4T1BF1FK1DU679213',NULL),('2022','Toyota','Supra','White','45000','New','In Stock','2','1000','Sport','4T3ZA3BBXEU086330','No'),('2018','HONDA','CIVIC','NAVY','19010','Used','In Stock','2','55000','Coupe','5FNRL18042B010544',NULL),('2022','Mazda','MX-5','Black','28000','New','In Stock','2','1000','Sport','5N1AL0MNXEC545061','No'),('2023','Jeep','Wagoneer','Black','59000','New','In Stock','4','50','SUV','5NPDH4AE3FH559954','No'),('2022','Tesla','Model X','White','95000','New','In Stock','4','1000','Sedan','5TEUU42NX7Z365169','No'),('2023','Volkswagen','Jetta','Gray','24150','New','In Stock','4','900','Sedan','5TFDW5F17CX231132','No'),('2023','Mazda','CX-8','White','29000','New','In Stock','4','45','SUV','5UXZW0C50BL658222','No'),('2023','Mazda','MX-30','Silver','34800','New','In Stock','4','16','SUV','5XYKUDA22BG132968','No'),('2019','Toyota','Corolla','Black','22000','Used','In Stock','4','41000','Sedan','GNES16S566121263','Yes'),('2023','Hyundai','Elantra','Gray','21000','New','In Stock','4','16','Sedan','HGCR2F77EA204476','No'),('2020','MITSUBISHI','Colt','White','23250','Used','In Stock','4','21000','Sport','JA3AU26U19U007395',NULL),('2022','Honda','Pilot','Black','35000','New','In Stock','4','1100','SUV','JA4LS21H02J041114','No'),('2021','Nissan','Z','Yellow','48000','Used','In Stock','2','9000','Sport Hatchback','JF1GG63657H808228','Yes'),('2023','Hyundai','Tucson','Blue','26000','New','In Stock','4','21','SUV','JH4CU2F43CC012085','No'),('2019','Hyundai','IONIQ 5','Silver','35000','Used','In Stock','4','43000','SUV','JNKCP11A9XT006392','Yes'),('2023','GMC','Savana','White','38000','New','In Stock','4','20','Van','JS3TD941884100040','No'),('2022','Mitsubishi','Mirage','Green','18000','New','In Stock','4','1000','Sport','JTDZN3EU3C3140200','No'),('2022','Infiniti','Q60','Black','44000','New','In Stock','2','250','Sport','JTEBU5JR7F5213820','No'),('2023','Ford','Bronco','Black','56250','New','In Stock','4','111','SUV','JTHCL46F495001531','Yes'),('2023','Ford','F-150','Black','58000','New','In Stock','4','70','Truck','JTJBT20X360101645',NULL),('2008','JEEP','WRANGLER','Black','15000','Used','Sold','2','95000','SUV','JTKDE167390297719',NULL),('2023','GMC','Hummer Ev','Silver','112000','New','In Stock','4','35','SUV','KL4CJCSB0EB560603','No'),('2020','Hyundai','Santa Fe','Black','28000','Used','In Stock','4','22050','SUV','KNAGM4AD1D5061620','No'),('2012','JEEP','WRANGLER','Blue','20000','Used','Sold','4','80000','SUV','WAUGFAFCXFN021872',NULL),('2021','Infiniti','Q50','Silver','42000','Used','In Stock','4','4000','Sport','WAURVAFD2BN017006','Yes'),('2023','Ford','Mach-E','Silver','52050','New','In Stock','2','12','Sport','WDBKK47F2WF031968','Yes'),('2021','KIA','Ceed','Silver','23000','Used','In Stock','4','5000','Sport Hatchback','WVGFK9BP5BD003759','Yes');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;

DROP TABLE IF EXISTS `monthlyjan`;
CREATE ALGORITHM=UNDEFINED DEFINER=`UMotors_Internal`@`%` SQL SECURITY DEFINER VIEW `monthlyjan` AS select sum(`dealerstats`.`Sales`) AS `WeeklySales`,count(`dealerstats`.`AutoSold`) AS `TotalNumOfAutoSold` from `dealerstats` where (`dealerstats`.`SalesDate` between '2023-01-01' and '2023-01-31');

DROP TABLE IF EXISTS `useraccounts`;
CREATE TABLE `useraccounts` (
  `EmployeeID` int NOT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `FirstName` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Password` varchar(8) DEFAULT NULL,
  `Position` varchar(30) DEFAULT NULL,
  `Salary` int DEFAULT NULL,
  `CommissionRate` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*!40000 ALTER TABLE `useraccounts` DISABLE KEYS */;
INSERT INTO `useraccounts` VALUES ('1000','Davila','Jose','davilaj05@mymail.sxu.edu','Passwrd1','Manager','100000','0.00'),('1001','Chavez','Yadira','YadiC24@mymail.sxu.edu','Passwrd2','Sales Associate','75000','20.00'),('1002','Davila','Angie','davilaAng21@mymail.sxu.edu','Passwrd3','Sales Associate','75000','20.00'),('1003','Parker','May','Mayday0128@gmail.com','Passwrd4','Sales Associate','60000','15.00'),('1004','Villa','Zima','Zimamotors07@gmail.com','Passwrd5','Sales Associate','60000','15.00'),('1005','Wick','John','MrWick01050@mymail.sxu.edu','Passwrd6','Assistant Manager','85000','0.00');
/*!40000 ALTER TABLE `useraccounts` ENABLE KEYS */;

DROP TABLE IF EXISTS `w_s_jan17_jan24`;
CREATE ALGORITHM=UNDEFINED DEFINER=`UMotors_Internal`@`%` SQL SECURITY DEFINER VIEW `w_s_jan17_jan24` AS select sum(`dealerstats`.`Sales`) AS `WeeklySales`,count(`dealerstats`.`AutoSold`) AS `TotalNumOfAutoSold` from `dealerstats` where (`dealerstats`.`SalesDate` between '2023-01-17' and '2023-01-24');

DROP TABLE IF EXISTS `w_s_jan1_jan8`;
CREATE ALGORITHM=UNDEFINED DEFINER=`UMotors_Internal`@`%` SQL SECURITY DEFINER VIEW `w_s_jan1_jan8` AS select sum(`dealerstats`.`Sales`) AS `WeeklySales`,count(`dealerstats`.`AutoSold`) AS `TotalNumOfAutoSold` from `dealerstats` where (`dealerstats`.`SalesDate` between '2023-01-01' and '2023-01-08');

DROP TABLE IF EXISTS `w_s_jan25_jan31`;
CREATE ALGORITHM=UNDEFINED DEFINER=`UMotors_Internal`@`%` SQL SECURITY DEFINER VIEW `w_s_jan25_jan31` AS select sum(`dealerstats`.`Sales`) AS `WeeklySales`,count(`dealerstats`.`AutoSold`) AS `TotalNumOfAutoSold` from `dealerstats` where (`dealerstats`.`SalesDate` between '2023-01-25' and '2023-01-31');

DROP TABLE IF EXISTS `w_s_jan9_jan16`;
CREATE ALGORITHM=UNDEFINED DEFINER=`UMotors_Internal`@`%` SQL SECURITY DEFINER VIEW `w_s_jan9_jan16` AS select sum(`dealerstats`.`Sales`) AS `WeeklySales`,count(`dealerstats`.`AutoSold`) AS `TotalNumOfAutoSold` from `dealerstats` where (`dealerstats`.`SalesDate` between '2023-01-09' and '2023-01-16');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;


-- phpMiniAdmin dump end
