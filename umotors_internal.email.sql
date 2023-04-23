-- phpMiniAdmin dump 1.9.210705
-- Datetime: 2023-04-23 20:34:01
-- Host: 
-- Database: umotors_internal

/*!40030 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

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

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;


-- phpMiniAdmin dump end
