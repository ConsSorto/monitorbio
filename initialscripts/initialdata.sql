-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para monitorbio
CREATE DATABASE IF NOT EXISTS `monitorbio` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `monitorbio`;

-- Volcando estructura para tabla monitorbio.catalogs
CREATE TABLE IF NOT EXISTS `catalogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `catalog_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogs_name_unique` (`name`,`catalog_id`),
  UNIQUE KEY `catalogs_code_unique` (`code`,`catalog_id`),
  KEY `catalogs_catalog_id_foreign` (`catalog_id`),
  CONSTRAINT `catalogs_catalog_id_foreign` FOREIGN KEY (`catalog_id`) REFERENCES `catalogs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla monitorbio.catalogs: ~13 rows (aproximadamente)
DELETE FROM `catalogs`;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` (`id`, `catalog_id`, `code`, `name`, `active`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'PER', 'Periodo LDSF', 1, NULL, NULL),
	(2, 1, 'PER1', 'Primera Colecta Mensual', 1, NULL, NULL),
	(3, 1, 'PER2', 'Segunda Colecta Mensual', 1, NULL, NULL),
	(4, NULL, 'SEXO', 'Sexo', 1, NULL, NULL),
	(5, 4, 'SEXO1', 'Macho', 1, NULL, NULL),
	(6, 4, 'SEXO2', 'Hembra', 1, NULL, NULL),
	(7, 4, 'SEXO3', 'Sin Genitalia', 1, NULL, NULL),
	(8, 4, 'SEXO4', 'n/a', 1, NULL, NULL),
	(9, NULL, 'COLOR', 'Color', 1, NULL, NULL),
	(10, 9, 'COLOR1', 'Café claro', 1, NULL, NULL),
	(11, 9, 'COLOR2', 'Negro', 1, NULL, NULL),
	(12, 9, 'COLOR3', 'Café oscuro', 1, NULL, NULL),
	(16, 9, 'COLOR4', 'n/a', 1, NULL, NULL);
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;

-- Volcando estructura para tabla monitorbio.departments
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departments_code_unique` (`code`),
  UNIQUE KEY `departments_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla monitorbio.departments: ~18 rows (aproximadamente)
DELETE FROM `departments`;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
	(1, '01', 'ATLANTIDA', NULL, NULL),
	(2, '02', 'COLON', NULL, NULL),
	(3, '03', 'COMAYAGUA', NULL, NULL),
	(4, '04', 'COPAN', NULL, NULL),
	(5, '05', 'CORTES', NULL, NULL),
	(6, '06', 'CHOLUTECA', NULL, NULL),
	(7, '07', 'EL PARAISO', NULL, NULL),
	(8, '08', 'FRANCISCO MORAZAN', NULL, NULL),
	(9, '09', 'GRACIAS A DIOS', NULL, NULL),
	(10, '10', 'INTIBUCA', NULL, NULL),
	(11, '11', 'ISLAS DE LA BAHIA', NULL, NULL),
	(12, '12', 'LA PAZ', NULL, NULL),
	(13, '13', 'LEMPIRA', NULL, NULL),
	(14, '14', 'OCOTEPEQUE', NULL, NULL),
	(15, '15', 'OLANCHO', NULL, NULL),
	(16, '16', 'SANTA BARBARA', NULL, NULL),
	(17, '17', 'VALLE', NULL, NULL),
	(18, '18', 'YORO', NULL, NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;

-- Volcando estructura para tabla monitorbio.forest_regions
CREATE TABLE IF NOT EXISTS `forest_regions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `forest_regions_code_unique` (`code`),
  UNIQUE KEY `forest_regions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla monitorbio.forest_regions: ~7 rows (aproximadamente)
DELETE FROM `forest_regions`;
/*!40000 ALTER TABLE `forest_regions` DISABLE KEYS */;
INSERT INTO `forest_regions` (`id`, `code`, `name`, `active`, `created_at`, `updated_at`) VALUES
	(1, 'RFNO', 'Región Forestal Noroccidente', 1, NULL, NULL),
	(2, 'RFFM', 'Región Forestal Francisco Morazán', 1, NULL, NULL),
	(3, 'RFO', 'Región Forestal Olancho', 1, NULL, NULL),
	(4, 'RFCO', 'Región Forestal Comayagua', 1, NULL, NULL),
	(5, 'RFNEO', 'Región Forestal Olancho Noreste', 1, NULL, NULL),
	(6, 'RFEP', 'Región Forestal El Paraíso', 1, NULL, NULL),
	(7, 'RFY', 'Región Forestal Yoro', 1, NULL, NULL);
/*!40000 ALTER TABLE `forest_regions` ENABLE KEYS */;

-- Volcando estructura para tabla monitorbio.municipalities
CREATE TABLE IF NOT EXISTS `municipalities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `municipalities_code_unique` (`code`),
  UNIQUE KEY `municipalities_name_unique` (`name`),
  UNIQUE KEY `municipalities_id_department_id_unique` (`id`,`department_id`),
  KEY `municipalities_department_id_foreign` (`department_id`),
  CONSTRAINT `municipalities_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla monitorbio.municipalities: ~270 rows (aproximadamente)
DELETE FROM `municipalities`;
/*!40000 ALTER TABLE `municipalities` DISABLE KEYS */;
INSERT INTO `municipalities` (`id`, `department_id`, `code`, `name`, `created_at`, `updated_at`) VALUES
	(1, 1, '0101', 'LA CEIBA', NULL, NULL),
	(3, 1, '0103', 'ESPARTA', NULL, NULL),
	(4, 1, '0104', 'JUTIAPA', NULL, NULL),
	(5, 1, '0105', 'LA MASICA', NULL, NULL),
	(7, 1, '0107', 'TELA', NULL, NULL),
	(8, 1, '0108', 'ARIZONA', NULL, NULL),
	(9, 2, '0201', 'TRUJILLO', NULL, NULL),
	(10, 2, '0210', 'BONITO ORIENTAL', NULL, NULL),
	(11, 2, '0202', 'BALFATE', NULL, NULL),
	(12, 2, '0203', 'IRIONA', NULL, NULL),
	(13, 2, '0204', 'LIMON', NULL, NULL),
	(14, 2, '0205', 'SABA', NULL, NULL),
	(16, 2, '0207', 'SANTA ROSA DE AGUAN', NULL, NULL),
	(17, 2, '0208', 'SONAGUERA', NULL, NULL),
	(18, 2, '0209', 'TOCOA', NULL, NULL),
	(19, 3, '0301', 'COMAYAGUA', NULL, NULL),
	(20, 3, '0310', 'MEAMBAR', NULL, NULL),
	(21, 3, '0311', 'MINAS DE ORO', NULL, NULL),
	(22, 3, '0312', 'OJOS DE AGUA', NULL, NULL),
	(24, 3, '0314', 'SAN JOSE DE COMAYAGUA', NULL, NULL),
	(25, 3, '0315', 'SAN JOSE DEL POTRERO', NULL, NULL),
	(28, 3, '0318', 'SIGUATEPEQUE', NULL, NULL),
	(29, 3, '0319', 'VILLA DE SAN ANTONIO', NULL, NULL),
	(30, 3, '0302', 'AJUTERIQUE', NULL, NULL),
	(31, 3, '0320', 'LAS LAJAS', NULL, NULL),
	(32, 3, '0321', 'TAULABE', NULL, NULL),
	(34, 3, '0304', 'ESQUIAS', NULL, NULL),
	(35, 3, '0305', 'HUMUYA', NULL, NULL),
	(37, 3, '0307', 'LAMANI', NULL, NULL),
	(38, 3, '0308', 'LA TRINIDAD', NULL, NULL),
	(39, 3, '0309', 'LEJAMANI', NULL, NULL),
	(40, 3, '0322', 'FLORES', NULL, NULL),
	(41, 4, '0401', 'SANTA ROSA DE COPAN', NULL, NULL),
	(42, 4, '0410', 'FLORIDA', NULL, NULL),
	(43, 4, '0411', 'LA JIGUA', NULL, NULL),
	(45, 4, '0413', 'NUEVA ARCADIA', NULL, NULL),
	(46, 4, '0414', 'SAN AGUSTIN', NULL, NULL),
	(48, 4, '0416', 'SAN JERONIMO', NULL, NULL),
	(50, 4, '0418', 'SAN JUAN DE OPOA', NULL, NULL),
	(53, 4, '0420', 'SAN PEDRO DE COPAN', NULL, NULL),
	(55, 4, '0422', 'TRINIDAD DE COPAN', NULL, NULL),
	(56, 4, '0423', 'VERACRUZ', NULL, NULL),
	(58, 4, '0404', 'COPAN RUINAS', NULL, NULL),
	(59, 4, '0405', 'CORQUIN', NULL, NULL),
	(60, 4, '0406', 'CUCUYAGUA', NULL, NULL),
	(62, 4, '0408', 'DULCE NOMBRE', NULL, NULL),
	(65, 5, '0501', 'SAN PEDRO SULA', NULL, NULL),
	(66, 5, '0510', 'SANTA CRUZ DE YOJOA', NULL, NULL),
	(67, 5, '0511', 'VILLANUEVA', NULL, NULL),
	(68, 5, '0512', 'LA LIMA', NULL, NULL),
	(69, 5, '0502', 'CHOLOMA', NULL, NULL),
	(70, 5, '0503', 'OMOA', NULL, NULL),
	(71, 5, '0504', 'PIMIENTA', NULL, NULL),
	(73, 5, '0506', 'PUERTO CORTES', NULL, NULL),
	(74, 5, '0507', 'SAN ANTONIO DE CORTES', NULL, NULL),
	(75, 5, '0508', 'SAN FRANCISCO DE YOJOA', NULL, NULL),
	(76, 5, '0509', 'SAN MANUEL', NULL, NULL),
	(77, 6, '0601', 'CHOLUTECA', NULL, NULL),
	(78, 6, '0610', 'OROCUINA', NULL, NULL),
	(79, 6, '0611', 'PESPIRE', NULL, NULL),
	(83, 6, '0615', 'SAN MARCOS DE COLON', NULL, NULL),
	(84, 6, '0616', 'SANTA ANA DE YUSGUARE', NULL, NULL),
	(85, 6, '0602', 'APACILAGUA', NULL, NULL),
	(86, 6, '0603', 'CONCEPCION DE MARIA', NULL, NULL),
	(87, 6, '0604', 'DUYURE', NULL, NULL),
	(88, 6, '0605', 'EL CORPUS', NULL, NULL),
	(89, 6, '0606', 'EL TRIUNFO', NULL, NULL),
	(90, 6, '0607', 'MARCOVIA', NULL, NULL),
	(91, 6, '0608', 'MOROLICA', NULL, NULL),
	(92, 6, '0609', 'NAMASIGUE', NULL, NULL),
	(93, 7, '0701', 'YUSCARAN', NULL, NULL),
	(94, 7, '0710', 'POTRERILLOS', NULL, NULL),
	(95, 7, '0711', 'SAN ANTONIO DE FLORES', NULL, NULL),
	(96, 7, '0712', 'SAN LUCAS', NULL, NULL),
	(97, 7, '0713', 'SAN MATIAS', NULL, NULL),
	(98, 7, '0714', 'SOLEDAD', NULL, NULL),
	(99, 7, '0715', 'TEUPASENTI', NULL, NULL),
	(100, 7, '0716', 'TEXIGUAT', NULL, NULL),
	(101, 7, '0717', 'VADO ANCHO', NULL, NULL),
	(102, 7, '0718', 'YAUYUPE', NULL, NULL),
	(103, 7, '0719', 'TROJES', NULL, NULL),
	(104, 7, '0702', 'ALAUCA', NULL, NULL),
	(105, 7, '0703', 'DANLI', NULL, NULL),
	(106, 7, '0704', 'EL PARAISO', NULL, NULL),
	(107, 7, '0705', 'GUINOPE', NULL, NULL),
	(108, 7, '0706', 'JACALEAPA', NULL, NULL),
	(109, 7, '0707', 'LIURE', NULL, NULL),
	(110, 7, '0708', 'MOROCELI', NULL, NULL),
	(111, 7, '0709', 'OROPOLI', NULL, NULL),
	(112, 8, '0801', 'DISTRITO CENTRAL', NULL, NULL),
	(113, 8, '0810', 'MARAITA', NULL, NULL),
	(114, 8, '0811', 'MARALE', NULL, NULL),
	(115, 8, '0812', 'NUEVA ARMENIA', NULL, NULL),
	(116, 8, '0813', 'OJOJONA', NULL, NULL),
	(117, 8, '0814', 'ORICA', NULL, NULL),
	(118, 8, '0815', 'REITOCA', NULL, NULL),
	(119, 8, '0816', 'SABANAGRANDE', NULL, NULL),
	(120, 8, '0817', 'SAN ANTONIO DE ORIENTE', NULL, NULL),
	(121, 8, '0818', 'SAN BUENAVENTURA', NULL, NULL),
	(122, 8, '0819', 'SAN IGNACIO', NULL, NULL),
	(123, 8, '0802', 'ALUBAREN', NULL, NULL),
	(124, 8, '0820', 'SAN JUAN DE FLORES', NULL, NULL),
	(128, 8, '0824', 'TALANGA', NULL, NULL),
	(129, 8, '0825', 'TATUMBLA', NULL, NULL),
	(130, 8, '0826', 'VALLE DE ANGELES', NULL, NULL),
	(131, 8, '0827', 'VILLA DE SAN FRANCISCO', NULL, NULL),
	(132, 8, '0828', 'VALLECILLO', NULL, NULL),
	(133, 8, '0803', 'CEDROS', NULL, NULL),
	(134, 8, '0804', 'CURAREN', NULL, NULL),
	(135, 8, '0805', 'EL PORVENIR', NULL, NULL),
	(136, 8, '0806', 'GUAIMACA', NULL, NULL),
	(137, 8, '0807', 'LA LIBERTAD', NULL, NULL),
	(138, 8, '0808', 'LA VENTA', NULL, NULL),
	(139, 8, '0809', 'LEPATERIQUE', NULL, NULL),
	(140, 9, '0901', 'PUERTO LEMPIRA', NULL, NULL),
	(141, 9, '0902', 'BRUS LAGUNA', NULL, NULL),
	(142, 9, '0903', 'AHUAS', NULL, NULL),
	(143, 9, '0904', 'JUAN FRANCISCO BULNES', NULL, NULL),
	(144, 9, '0905', 'VILLEDA MORALES', NULL, NULL),
	(145, 9, '0906', 'WAMPUSIRPI', NULL, NULL),
	(146, 10, '1001', 'LA ESPERANZA', NULL, NULL),
	(147, 10, '1010', 'SAN ANTONIO', NULL, NULL),
	(148, 10, '1011', 'SAN ISIDRO', NULL, NULL),
	(150, 10, '1013', 'SAN MARCOS DE LA SIERRA', NULL, NULL),
	(151, 10, '1014', 'SAN MIGUELITO', NULL, NULL),
	(152, 10, '1015', 'SANTA LUCIA', NULL, NULL),
	(153, 10, '1016', 'YAMARANGUILA', NULL, NULL),
	(154, 10, '1017', 'SAN FRANCISCO DE OPALACA', NULL, NULL),
	(155, 10, '1002', 'CAMASCA', NULL, NULL),
	(156, 10, '1003', 'COLOMONCAGUA', NULL, NULL),
	(158, 10, '1005', 'DOLORES', NULL, NULL),
	(159, 10, '1006', 'INTIBUCA', NULL, NULL),
	(160, 10, '1007', 'JESUS DE OTORO', NULL, NULL),
	(161, 10, '1008', 'MAGDALENA', NULL, NULL),
	(162, 10, '1009', 'MASAGUARA', NULL, NULL),
	(163, 11, '1101', 'ROATAN', NULL, NULL),
	(164, 11, '1102', 'GUANAJA', NULL, NULL),
	(165, 11, '1103', 'JOSE SANTOS GUARDIOLA', NULL, NULL),
	(166, 11, '1104', 'UTILA', NULL, NULL),
	(167, 12, '1201', 'LA PAZ', NULL, NULL),
	(168, 12, '1210', 'OPATORO', NULL, NULL),
	(169, 12, '1211', 'SAN ANTONIO DEL NORTE', NULL, NULL),
	(170, 12, '1212', 'SAN JOSE', NULL, NULL),
	(171, 12, '1213', 'SAN JUAN', NULL, NULL),
	(172, 12, '1214', 'SAN PEDRO DE TUTULE', NULL, NULL),
	(173, 12, '1215', 'SANTA ANA', NULL, NULL),
	(174, 12, '1216', 'SANTA ELENA', NULL, NULL),
	(175, 12, '1217', 'SANTA MARIA', NULL, NULL),
	(176, 12, '1218', 'SANTIAGO DE PURINGLA', NULL, NULL),
	(177, 12, '1219', 'YARULA', NULL, NULL),
	(178, 12, '1202', 'AGUANQUETERIQUE', NULL, NULL),
	(179, 12, '1203', 'CABAÑAS', NULL, NULL),
	(180, 12, '1204', 'CANE', NULL, NULL),
	(181, 12, '1205', 'CHINACLA', NULL, NULL),
	(182, 12, '1206', 'GUAJIQUIRO', NULL, NULL),
	(183, 12, '1207', 'LAUTERIQUE', NULL, NULL),
	(184, 12, '1208', 'MARCALA', NULL, NULL),
	(185, 12, '1209', 'MERCEDES DE ORIENTE', NULL, NULL),
	(186, 13, '1301', 'GRACIAS', NULL, NULL),
	(187, 13, '1310', 'LAS FLORES', NULL, NULL),
	(189, 13, '1312', 'LA VIRTUD', NULL, NULL),
	(190, 13, '1313', 'LEPAERA', NULL, NULL),
	(191, 13, '1314', 'MAPULACA', NULL, NULL),
	(192, 13, '1315', 'PIRAERA', NULL, NULL),
	(193, 13, '1316', 'SAN ANDRES', NULL, NULL),
	(194, 13, '1317', 'SAN FRANCISCO', NULL, NULL),
	(195, 13, '1318', 'SAN JUAN GUARITA', NULL, NULL),
	(196, 13, '1319', 'SAN MANUEL COLOHETE', NULL, NULL),
	(197, 13, '1302', 'BELEN', NULL, NULL),
	(198, 13, '1320', 'SAN RAFAEL', NULL, NULL),
	(199, 13, '1321', 'SAN SEBASTIAN', NULL, NULL),
	(200, 13, '1322', 'SANTA CRUZ', NULL, NULL),
	(201, 13, '1323', 'TALGUA', NULL, NULL),
	(202, 13, '1324', 'TAMBLA', NULL, NULL),
	(203, 13, '1325', 'TOMALA', NULL, NULL),
	(204, 13, '1326', 'VALLADOLID', NULL, NULL),
	(205, 13, '1327', 'VIRGINIA', NULL, NULL),
	(206, 13, '1328', 'SAN MARCOS DE CAIQUIN', NULL, NULL),
	(207, 13, '1303', 'CANDELARIA', NULL, NULL),
	(208, 13, '1304', 'COLOLACA', NULL, NULL),
	(209, 13, '1305', 'ERANDIQUE', NULL, NULL),
	(210, 13, '1306', 'GUALCINCE', NULL, NULL),
	(211, 13, '1307', 'GUARITA', NULL, NULL),
	(212, 13, '1308', 'LA CAMPA', NULL, NULL),
	(213, 13, '1309', 'LA IGUALA', NULL, NULL),
	(214, 14, '1401', 'OCOTEPEQUE', NULL, NULL),
	(215, 14, '1410', 'SAN FERNANDO', NULL, NULL),
	(216, 14, '1411', 'SAN FRANCISCO DEL VALLE', NULL, NULL),
	(217, 14, '1412', 'SAN JORGE', NULL, NULL),
	(219, 14, '1414', 'SANTA FE', NULL, NULL),
	(220, 14, '1415', 'SENSENTI', NULL, NULL),
	(221, 14, '1416', 'SINUAPA', NULL, NULL),
	(222, 14, '1402', 'BELEN GUALCHO', NULL, NULL),
	(223, 14, '1403', 'CONCEPCION', NULL, NULL),
	(224, 14, '1404', 'DOLORES MERENDON', NULL, NULL),
	(225, 14, '1405', 'FRATERNIDAD', NULL, NULL),
	(226, 14, '1406', 'LA ENCARNACION', NULL, NULL),
	(227, 14, '1407', 'LA LABOR', NULL, NULL),
	(228, 14, '1408', 'LUCERNA', NULL, NULL),
	(229, 14, '1409', 'MERCEDES', NULL, NULL),
	(230, 15, '1501', 'JUTICALPA', NULL, NULL),
	(231, 15, '1510', 'GUATA', NULL, NULL),
	(232, 15, '1511', 'GUAYAPE', NULL, NULL),
	(233, 15, '1512', 'JANO', NULL, NULL),
	(234, 15, '1513', 'LA UNION', NULL, NULL),
	(235, 15, '1514', 'MANGULILE', NULL, NULL),
	(236, 15, '1515', 'MANTO', NULL, NULL),
	(237, 15, '1516', 'SALAMA', NULL, NULL),
	(238, 15, '1517', 'SAN ESTEBAN', NULL, NULL),
	(239, 15, '1518', 'SAN FRANCISCO DE BECERRA', NULL, NULL),
	(240, 15, '1519', 'SAN FRANCISCO DE LA PAZ', NULL, NULL),
	(241, 15, '1502', 'CAMPAMENTO', NULL, NULL),
	(242, 15, '1520', 'SANTA MARIA DEL REAL', NULL, NULL),
	(243, 15, '1521', 'SILCA', NULL, NULL),
	(244, 15, '1522', 'YOCON', NULL, NULL),
	(245, 15, '1523', 'PATUCA', NULL, NULL),
	(246, 15, '1503', 'CATACAMAS', NULL, NULL),
	(247, 15, '1504', 'CONCORDIA', NULL, NULL),
	(248, 15, '1505', 'DULCE NOMBRE DE CULMI', NULL, NULL),
	(249, 15, '1506', 'EL ROSARIO', NULL, NULL),
	(250, 15, '1507', 'ESQUIPULAS DEL NORTE', NULL, NULL),
	(251, 15, '1508', 'GUALACO', NULL, NULL),
	(252, 15, '1509', 'GUARIZAMA', NULL, NULL),
	(253, 16, '1601', 'SANTA BARBARA', NULL, NULL),
	(254, 16, '1611', 'GUALALA', NULL, NULL),
	(255, 16, '1612', 'ILAMA', NULL, NULL),
	(256, 16, '1613', 'MACUELIZO', NULL, NULL),
	(257, 16, '1614', 'NARANJITO', NULL, NULL),
	(258, 16, '1615', 'NUEVO CELILAC', NULL, NULL),
	(259, 16, '1616', 'PETOA', NULL, NULL),
	(260, 16, '1617', 'PROTECCION', NULL, NULL),
	(261, 16, '1618', 'QUIMISTAN', NULL, NULL),
	(262, 16, '1619', 'SAN FRANCISCO DE OJUERA', NULL, NULL),
	(263, 16, '1606', 'SAN JOSE DE COLINAS', NULL, NULL),
	(264, 16, '1602', 'ARADA', NULL, NULL),
	(265, 16, '1620', 'SAN LUIS', NULL, NULL),
	(266, 16, '1621', 'SAN MARCOS', NULL, NULL),
	(267, 16, '1622', 'SAN NICOLAS', NULL, NULL),
	(268, 16, '1623', 'SAN PEDRO ZACAPA', NULL, NULL),
	(269, 16, '1625', 'SAN VICENTE CENTENARIO', NULL, NULL),
	(271, 16, '1626', 'TRINIDAD', NULL, NULL),
	(272, 16, '1627', 'LAS VEGAS', NULL, NULL),
	(273, 16, '1628', 'NUEVA FRONTERA', NULL, NULL),
	(274, 16, '1603', 'ATIMA', NULL, NULL),
	(275, 16, '1604', 'AZACUALPA', NULL, NULL),
	(276, 16, '1605', 'CEGUACA', NULL, NULL),
	(277, 16, '1607', 'CONCEPCION DEL NORTE', NULL, NULL),
	(278, 16, '1608', 'CONCEPCION DEL SUR', NULL, NULL),
	(279, 16, '1609', 'CHINDA', NULL, NULL),
	(280, 16, '1610', 'EL NISPERO', NULL, NULL),
	(281, 17, '1701', 'NACAOME', NULL, NULL),
	(282, 17, '1702', 'ALIANZA', NULL, NULL),
	(283, 17, '1703', 'AMAPALA', NULL, NULL),
	(284, 17, '1704', 'ARAMECINA', NULL, NULL),
	(285, 17, '1705', 'CARIDAD', NULL, NULL),
	(286, 17, '1706', 'GOASCORAN', NULL, NULL),
	(287, 17, '1707', 'LANGUE', NULL, NULL),
	(288, 17, '1708', 'SAN FRANCISCO DE CORAY', NULL, NULL),
	(289, 17, '1709', 'SAN LORENZO', NULL, NULL),
	(290, 18, '1801', 'YORO', NULL, NULL),
	(291, 18, '1810', 'VICTORIA', NULL, NULL),
	(292, 18, '1811', 'YORITO', NULL, NULL),
	(293, 18, '1802', 'ARENAL', NULL, NULL),
	(294, 18, '1803', 'EL NEGRITO', NULL, NULL),
	(295, 18, '1804', 'EL PROGRESO', NULL, NULL),
	(296, 18, '1805', 'JOCON', NULL, NULL),
	(297, 18, '1806', 'MORAZAN', NULL, NULL),
	(298, 18, '1807', 'OLANCHITO', NULL, NULL),
	(299, 18, '1808', 'SANTA RITA', NULL, NULL),
	(300, 18, '1809', 'SULACO', NULL, NULL);
/*!40000 ALTER TABLE `municipalities` ENABLE KEYS */;

-- Volcando estructura para tabla monitorbio.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla monitorbio.users: ~0 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Cons', 'cos.sorto@gmail.com', NULL, '$2y$10$DjaioaYwYm85FBcE00gjaeW8SP1EMczUJWq59LJtRxDMn0gzGFnnm', 'rhT15r4eg3kGTb4krM1fZHmekCZJe5YOMHPJS7zzeVcKN4lPsmXi38dqwSLi', '2023-09-01 01:18:22', '2023-09-01 01:18:22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
