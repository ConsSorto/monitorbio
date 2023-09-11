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

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla monitorbio.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla monitorbio.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla monitorbio.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla monitorbio.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla monitorbio.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla monitorbio.samples
CREATE TABLE IF NOT EXISTS `samples` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `forest_region_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `municipality_id` bigint(20) unsigned DEFAULT NULL,
  `place` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `utmx` double(18,2) NOT NULL,
  `utmy` double(18,2) NOT NULL,
  `msmn` double(18,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `samples_code_unique` (`code`),
  UNIQUE KEY `samples_name_unique` (`name`),
  KEY `samples_forest_region_id_foreign` (`forest_region_id`),
  KEY `samples_department_id_foreign` (`department_id`),
  KEY `samples_municipality_id_department_id_foreign` (`municipality_id`,`department_id`),
  CONSTRAINT `samples_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `samples_forest_region_id_foreign` FOREIGN KEY (`forest_region_id`) REFERENCES `forest_regions` (`id`),
  CONSTRAINT `samples_municipality_id_department_id_foreign` FOREIGN KEY (`municipality_id`, `department_id`) REFERENCES `municipalities` (`id`, `department_id`),
  CONSTRAINT `samples_municipality_id_foreign` FOREIGN KEY (`municipality_id`) REFERENCES `municipalities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla monitorbio.sample_details
CREATE TABLE IF NOT EXISTS `sample_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sample_id` bigint(20) unsigned DEFAULT NULL,
  `bottlenumber` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picker` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datepicker` date NOT NULL,
  `period_id` bigint(20) unsigned NOT NULL,
  `order` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subfamily` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `species` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genitaliascore` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finalscore` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex_id` bigint(20) unsigned NOT NULL,
  `quantity` double(18,2) NOT NULL,
  `size` double(18,2) NOT NULL,
  `color_id` bigint(20) unsigned NOT NULL,
  `identifier` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sample_details_sample_id_foreign` (`sample_id`),
  KEY `sample_details_period_id_foreign` (`period_id`),
  KEY `sample_details_sex_id_foreign` (`sex_id`),
  KEY `sample_details_color_id_foreign` (`color_id`),
  CONSTRAINT `sample_details_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `catalogs` (`id`),
  CONSTRAINT `sample_details_period_id_foreign` FOREIGN KEY (`period_id`) REFERENCES `catalogs` (`id`),
  CONSTRAINT `sample_details_sample_id_foreign` FOREIGN KEY (`sample_id`) REFERENCES `samples` (`id`),
  CONSTRAINT `sample_details_sex_id_foreign` FOREIGN KEY (`sex_id`) REFERENCES `catalogs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

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

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
