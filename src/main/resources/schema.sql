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
  PRIMARY KEY (`VIN`)
);


CREATE TABLE `useraccounts` (
  `EmployeeId` int NOT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `FirstName` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Password` varchar(8) DEFAULT NULL,
  `Position` varchar(30) DEFAULT NULL,
  `Salary` int DEFAULT NULL,
  `CommissionRate` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
);

CREATE TABLE `dealerstats` (
  `EmployeeId` int DEFAULT NULL,
  `SalesDate` date DEFAULT NULL,
  `AutoSold` varchar(100) DEFAULT NULL,
  `Sales` int DEFAULT NULL,
  `VIN` varchar(25) DEFAULT NULL,
  CONSTRAINT`dealerstats_ibfk_1` FOREIGN KEY (`EmployeeId`) REFERENCES `useraccounts` (`EmployeeId`),
  CONSTRAINT `dealerstats_ibfk_2` FOREIGN KEY (`VIN`) REFERENCES `inventory` (`VIN`)
);

CREATE VIEW `w_s_jan17_jan24` AS select sum(`dealerstats`.`Sales`) AS `WeeklySales`,count(`dealerstats`.`AutoSold`) AS `TotalNumOfAutoSold` from `dealerstats` where (`dealerstats`.`SalesDate` between '2023-01-17' and '2023-01-24');

CREATE VIEW `w_s_jan1_jan8` AS select sum(`dealerstats`.`Sales`) AS `WeeklySales`,count(`dealerstats`.`AutoSold`) AS `TotalNumOfAutoSold` from `dealerstats` where (`dealerstats`.`SalesDate` between '2023-01-01' and '2023-01-08');

CREATE VIEW `w_s_jan25_jan31` AS select sum(`dealerstats`.`Sales`) AS `WeeklySales`,count(`dealerstats`.`AutoSold`) AS `TotalNumOfAutoSold` from `dealerstats` where (`dealerstats`.`SalesDate` between '2023-01-25' and '2023-01-31');

CREATE VIEW `w_s_jan9_jan16` AS select sum(`dealerstats`.`Sales`) AS `WeeklySales`,count(`dealerstats`.`AutoSold`) AS `TotalNumOfAutoSold` from `dealerstats` where (`dealerstats`.`SalesDate` between '2023-01-09' and '2023-01-16');
