/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `master` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `master`;
DROP TABLE IF EXISTS `Clientes_ativos`;
/*!50001 DROP VIEW IF EXISTS `Clientes_ativos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Clientes_ativos` AS SELECT
                                              1 AS `tenant_id`,
                                              1 AS `name`,
                                              1 AS `data_criação`,
                                              1 AS `Quantidade_de_alunos_ativos`*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `admin_promises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_promises` (
                                  `user_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `promise` varchar(1050) COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
                          `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                          `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                          `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                          `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                          `genre` tinyint(1) DEFAULT NULL,
                          `birth` date DEFAULT NULL,
                          `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          `auth` int NOT NULL DEFAULT '0',
                          `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
                          `email_verified_at` timestamp NULL DEFAULT NULL,
                          `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                          `last_login_at` datetime DEFAULT NULL,
                          `last_login_ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          `created_at` timestamp NULL DEFAULT NULL,
                          `updated_at` timestamp NULL DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ads_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_settings` (
                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                `display_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL,
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `advanced_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advanced_settings` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `tenant_id` bigint unsigned NOT NULL,
                                     `use_terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                                     `use_terms_required` tinyint(1) DEFAULT '0',
                                     `privacy_terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                                     `url_checkout` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     `pixel_fbads` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `pixel_tagManager` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `brand-description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `url_facebook` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `url_instagram` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `url_youtube` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `advanced_settings_tenant_id_foreign` (`tenant_id`),
                                     CONSTRAINT `advanced_settings_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `alter_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alter_domains` (
                                 `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `tenant_id` bigint unsigned NOT NULL,
                                 `current_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `new_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `alter_domains_tenant_id_foreign` (`tenant_id`),
                                 CONSTRAINT `alter_domains_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `app_credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_credit_card` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `customer_iugu_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `holder_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `month` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `year` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `brand` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `last_digits` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `cvv` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `hash` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `default` tinyint(1) DEFAULT '0',
                                   `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `app_credit_card_user_id_foreign` (`user_id`),
                                   CONSTRAINT `app_credit_card_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `plataforma`.`users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3276 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `app_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_plans` (
                             `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                             `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                             `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                             `period` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                             `price` decimal(10,2) NOT NULL,
                             `payments` int DEFAULT '1',
                             `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL,
                             `trialDays` decimal(5,0) NOT NULL DEFAULT '0',
                             `identifier` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `plan_iugu_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `storage_limit` bigint DEFAULT NULL,
                             `free` tinyint(1) NOT NULL DEFAULT '0',
                             `storage` tinyint(1) NOT NULL DEFAULT '0',
                             `publish` tinyint(1) NOT NULL DEFAULT '1',
                             `parent_id` bigint unsigned DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             KEY `app_plans_parent_id_foreign` (`parent_id`),
                             CONSTRAINT `app_plans_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `app_plans` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5703 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `app_subscription_storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_subscription_storages` (
                                             `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                             `tenant_id` bigint unsigned NOT NULL,
                                             `plan_id` bigint unsigned NOT NULL,
                                             `card_id` bigint unsigned NOT NULL,
                                             `price` decimal(10,2) DEFAULT NULL,
                                             `storage_limit` bigint DEFAULT NULL,
                                             `next_due` date NOT NULL,
                                             `customer_iugu_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                             `subscription_iugu_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                             `identifier_app_subscriptions_storage` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                             `payable_with` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                             `status_pay_iugu` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                             `status` tinyint(1) NOT NULL DEFAULT '1',
                                             `created_at` timestamp NULL DEFAULT NULL,
                                             `updated_at` timestamp NULL DEFAULT NULL,
                                             PRIMARY KEY (`id`),
                                             KEY `app_subscription_storages_tenant_id_foreign` (`tenant_id`),
                                             KEY `app_subscription_storages_plan_id_foreign` (`plan_id`),
                                             KEY `app_subscription_storages_card_id_foreign` (`card_id`),
                                             CONSTRAINT `app_subscription_storages_card_id_foreign` FOREIGN KEY (`card_id`) REFERENCES `app_credit_card` (`id`) ON DELETE CASCADE,
                                             CONSTRAINT `app_subscription_storages_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `app_plans` (`id`) ON DELETE CASCADE,
                                             CONSTRAINT `app_subscription_storages_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `app_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_subscriptions` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `tenant_id` bigint unsigned DEFAULT NULL,
                                     `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `organization_id` bigint unsigned DEFAULT NULL,
                                     `plan_id` bigint unsigned NOT NULL,
                                     `card_id` bigint unsigned DEFAULT NULL,
                                     `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `pay_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `started` datetime NOT NULL,
                                     `due_day` int NOT NULL,
                                     `next_due` date NOT NULL,
                                     `last_charge` date NOT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     `start_trial_at` datetime DEFAULT NULL,
                                     `end_trial_at` datetime DEFAULT NULL,
                                     `canceled_at` datetime DEFAULT NULL,
                                     `customer_iugu_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `identifier_app_subscriptions` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `external_reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `iugu_invoice_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `attempts` int DEFAULT NULL,
                                     `installments` int DEFAULT NULL,
                                     `accepted_terms` tinyint(1) DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `app_subscriptions_tenant_id_foreign` (`tenant_id`),
                                     KEY `app_subscriptions_card_id_foreign` (`card_id`),
                                     KEY `app_subscriptions_plan_id_foreign` (`plan_id`),
                                     KEY `app_subscriptions_user_id_foreign` (`user_id`),
                                     KEY `app_subscriptions_organization_id_foreign` (`organization_id`),
                                     CONSTRAINT `app_subscriptions_card_id_foreign` FOREIGN KEY (`card_id`) REFERENCES `app_credit_card` (`id`) ON DELETE CASCADE,
                                     CONSTRAINT `app_subscriptions_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE,
                                     CONSTRAINT `app_subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `app_plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                     CONSTRAINT `app_subscriptions_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE,
                                     CONSTRAINT `app_subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `plataforma`.`users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93503 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_account` (
                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `agency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `account` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `account_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `bank` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                KEY `master_bank_account_user_id_foreign` (`user_id`),
                                CONSTRAINT `master_bank_account_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `plataforma`.`users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `checkout_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkout_offers` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `checkout_plan_id` bigint unsigned NOT NULL,
                                   `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `price` double(10,2) NOT NULL,
                                   `split_percentage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `checkout_offers_checkout_plan_id_foreign` (`checkout_plan_id`),
                                   CONSTRAINT `checkout_offers_checkout_plan_id_foreign` FOREIGN KEY (`checkout_plan_id`) REFERENCES `checkout_plans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `checkout_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkout_plans` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `checkout_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkout_users` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `checkout_offer_id` bigint unsigned NOT NULL,
                                  `split_percentage` double(8,2) NOT NULL,
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `checkout_users_user_id_foreign` (`user_id`),
                                  KEY `checkout_users_checkout_offer_id_foreign` (`checkout_offer_id`),
                                  CONSTRAINT `checkout_users_checkout_offer_id_foreign` FOREIGN KEY (`checkout_offer_id`) REFERENCES `checkout_offers` (`id`),
                                  CONSTRAINT `checkout_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `plataforma`.`users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `daily_platform_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_platform_logins` (
                                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                         `tenant_id` int NOT NULL,
                                         `logins` bigint NOT NULL DEFAULT '0',
                                         `created_at` timestamp NULL DEFAULT NULL,
                                         `updated_at` timestamp NULL DEFAULT NULL,
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `master_daily_platform_logins_tenant_id_unique` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `dashboard_daily_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_daily_values` (
                                          `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                          `tenant_id` bigint unsigned NOT NULL,
                                          `date` datetime NOT NULL,
                                          `sale_amount_win` decimal(10,2) NOT NULL,
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL,
                                          PRIMARY KEY (`id`),
                                          KEY `dashboard_daily_values_tenant_id_foreign` (`tenant_id`),
                                          CONSTRAINT `dashboard_daily_values_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `dashboard_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_roles` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `dashboard_sales_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_sales_statistics` (
                                              `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                              `tenant_id` bigint unsigned NOT NULL,
                                              `date` date NOT NULL,
                                              `value_avaliable` decimal(10,2) NOT NULL,
                                              `value_antacipable` decimal(10,2) NOT NULL DEFAULT '0.00',
                                              `created_at` timestamp NULL DEFAULT NULL,
                                              `updated_at` timestamp NULL DEFAULT NULL,
                                              PRIMARY KEY (`id`),
                                              KEY `dashboard_sales_statistics_tenant_id_foreign` (`tenant_id`),
                                              CONSTRAINT `dashboard_sales_statistics_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `dashboard_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_users_roles` (
                                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                         `organization_id` bigint unsigned NOT NULL,
                                         `dashboard_role_id` bigint unsigned NOT NULL,
                                         `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `created_at` timestamp NULL DEFAULT NULL,
                                         `updated_at` timestamp NULL DEFAULT NULL,
                                         PRIMARY KEY (`id`),
                                         KEY `dashboard_users_roles_organization_id_foreign` (`organization_id`),
                                         KEY `dashboard_users_roles_dashboard_role_id_foreign` (`dashboard_role_id`),
                                         KEY `dashboard_users_roles_user_id_foreign` (`user_id`),
                                         CONSTRAINT `dashboard_users_roles_dashboard_role_id_foreign` FOREIGN KEY (`dashboard_role_id`) REFERENCES `dashboard_roles` (`id`) ON DELETE CASCADE,
                                         CONSTRAINT `dashboard_users_roles_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE,
                                         CONSTRAINT `dashboard_users_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `plataforma`.`users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `dashboard_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_values` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `tenant_id` bigint unsigned NOT NULL,
                                    `date` date NOT NULL,
                                    `sale_amount_win` decimal(10,2) NOT NULL,
                                    `created_at` timestamp NULL DEFAULT NULL,
                                    `updated_at` timestamp NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`),
                                    KEY `dashboard_values_tenant_id_foreign` (`tenant_id`),
                                    CONSTRAINT `dashboard_values_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `default_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_language` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `word` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                    `word_spanish` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                    `word_english` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                    `created_at` timestamp NULL DEFAULT NULL,
                                    `updated_at` timestamp NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `developers_integration_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developers_integration_data` (
                                               `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                               `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                               `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                               `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                               `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                               `corporation_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                               `corporation_cnpj` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                               `corporation_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                               `app_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                               `app_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                               `token` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                               `token_status` tinyint(1) NOT NULL DEFAULT '0',
                                               `created_at` timestamp NULL DEFAULT NULL,
                                               `updated_at` timestamp NULL DEFAULT NULL,
                                               PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ead_package_registration_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ead_package_registration_link` (
                                                 `package_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                                 `registration_link_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                                 KEY `ead_package_registration_link_package_id_foreign` (`package_id`),
                                                 KEY `ead_package_registration_link_registration_link_id_foreign` (`registration_link_id`),
                                                 CONSTRAINT `ead_package_registration_link_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `plataforma`.`ead_subscription_package` (`id`) ON DELETE CASCADE,
                                                 CONSTRAINT `ead_package_registration_link_registration_link_id_foreign` FOREIGN KEY (`registration_link_id`) REFERENCES `registration_links` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `email_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_logs` (
                              `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                              `tenant_id` bigint unsigned DEFAULT NULL,
                              `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                              `event_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                              `destination` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                              `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                              `timestamp` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                              `created_at` timestamp NULL DEFAULT NULL,
                              `updated_at` timestamp NULL DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              KEY `email_logs_tenant_id_foreign` (`tenant_id`),
                              KEY `email_logs_user_id_foreign` (`user_id`),
                              CONSTRAINT `email_logs_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE,
                              CONSTRAINT `email_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `plataforma`.`users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3171585 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `email_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_queue` (
                               `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                               `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL,
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=424919 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
                          `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                          `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                          `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                          `created_at` timestamp NULL DEFAULT NULL,
                          `updated_at` timestamp NULL DEFAULT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
                               `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                               `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                               PRIMARY KEY (`id`),
                               UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=10040 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `filas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filas` (
                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                         `tenant_id` bigint unsigned NOT NULL,
                         `total_itens` int NOT NULL,
                         `email_notification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         KEY `master_filas_tenant_id_foreign` (`tenant_id`),
                         CONSTRAINT `master_filas_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11938 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `import_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_history` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `tenant_id` bigint unsigned NOT NULL,
                                  `source_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `status` tinyint(1) NOT NULL,
                                  `date_import` datetime NOT NULL,
                                  `size` int NOT NULL,
                                  `fails` int NOT NULL,
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `import_history_tenant_id_foreign` (`tenant_id`),
                                  CONSTRAINT `import_history_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `integration_activecampaign_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integration_activecampaign_settings` (
                                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                       `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                       `organization_id` bigint unsigned DEFAULT NULL,
                                                       `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                       `api_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                       `created_at` timestamp NULL DEFAULT NULL,
                                                       `updated_at` timestamp NULL DEFAULT NULL,
                                                       PRIMARY KEY (`id`),
                                                       KEY `integration_activecampaign_settings_user_id_foreign` (`user_id`),
                                                       KEY `integration_activecampaign_settings_organization_id_foreign` (`organization_id`),
                                                       CONSTRAINT `integration_activecampaign_settings_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE,
                                                       CONSTRAINT `integration_activecampaign_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `plataforma`.`users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `integration_braip_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integration_braip_settings` (
                                              `id` int unsigned NOT NULL AUTO_INCREMENT,
                                              `tenant_id` bigint unsigned NOT NULL,
                                              `unique_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                              `api_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                              `created_at` timestamp NULL DEFAULT NULL,
                                              `updated_at` timestamp NULL DEFAULT NULL,
                                              PRIMARY KEY (`id`),
                                              KEY `integration_braip_settings_tenant_id_foreign` (`tenant_id`),
                                              CONSTRAINT `integration_braip_settings_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `integration_cloudflare_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integration_cloudflare_settings` (
                                                   `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                   `tenant_id` bigint unsigned NOT NULL,
                                                   `token_client` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                                   `account_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                                   `status` tinyint(1) NOT NULL DEFAULT '1',
                                                   `created_at` timestamp NULL DEFAULT NULL,
                                                   `updated_at` timestamp NULL DEFAULT NULL,
                                                   PRIMARY KEY (`id`),
                                                   KEY `integration_cloudflare_settings_tenant_id_foreign` (`tenant_id`),
                                                   CONSTRAINT `integration_cloudflare_settings_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `integration_hotmart_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integration_hotmart_settings` (
                                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                `tenant_id` bigint unsigned NOT NULL,
                                                `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                `client_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                `client_secret` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                `basic_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                `created_at` timestamp NULL DEFAULT NULL,
                                                `updated_at` timestamp NULL DEFAULT NULL,
                                                PRIMARY KEY (`id`),
                                                KEY `integration_hotmart_settings_tenant_id_foreign` (`tenant_id`),
                                                CONSTRAINT `integration_hotmart_settings_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=477 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `integration_leadlovers_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integration_leadlovers_settings` (
                                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                   `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                   `organization_id` bigint unsigned DEFAULT NULL,
                                                   `api_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                   `created_at` timestamp NULL DEFAULT NULL,
                                                   `updated_at` timestamp NULL DEFAULT NULL,
                                                   PRIMARY KEY (`id`),
                                                   KEY `integration_leadlovers_settings_user_id_foreign` (`user_id`),
                                                   KEY `integration_leadlovers_settings_organization_id_foreign` (`organization_id`),
                                                   CONSTRAINT `integration_leadlovers_settings_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE,
                                                   CONSTRAINT `integration_leadlovers_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `plataforma`.`users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `integration_monetizze_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integration_monetizze_settings` (
                                                  `id` int unsigned NOT NULL AUTO_INCREMENT,
                                                  `tenant_id` bigint unsigned NOT NULL,
                                                  `unique_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                  `api_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                  `created_at` timestamp NULL DEFAULT NULL,
                                                  `updated_at` timestamp NULL DEFAULT NULL,
                                                  PRIMARY KEY (`id`),
                                                  KEY `integration_monetizze_settings_tenant_id_foreign` (`tenant_id`),
                                                  CONSTRAINT `integration_monetizze_settings_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `integration_pandavideo_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integration_pandavideo_settings` (
                                                   `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                   `tenant_id` bigint unsigned NOT NULL,
                                                   `token_client` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                                   `status` tinyint(1) NOT NULL DEFAULT '1',
                                                   `created_at` timestamp NULL DEFAULT NULL,
                                                   `updated_at` timestamp NULL DEFAULT NULL,
                                                   PRIMARY KEY (`id`),
                                                   KEY `integration_pandavideo_settings_tenant_id_foreign` (`tenant_id`),
                                                   CONSTRAINT `integration_pandavideo_settings_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `integration_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integration_settings` (
                                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                        `tenant_id` bigint unsigned NOT NULL,
                                        `API_KEY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `ORIGIN_KEY` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `EMAIL_EDUZZ` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `PUBLIC_KEY` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL,
                                        PRIMARY KEY (`id`),
                                        KEY `integration_settings_tenant_id_foreign` (`tenant_id`),
                                        CONSTRAINT `integration_settings_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `integration_vimeo_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integration_vimeo_settings` (
                                              `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                              `tenant_id` bigint unsigned DEFAULT NULL,
                                              `token_client` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                              `status` tinyint(1) NOT NULL DEFAULT '1',
                                              `user_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                              `created_at` timestamp NULL DEFAULT NULL,
                                              `updated_at` timestamp NULL DEFAULT NULL,
                                              PRIMARY KEY (`id`),
                                              KEY `integration_vimeo_settings_tenant_id_foreign` (`tenant_id`),
                                              CONSTRAINT `integration_vimeo_settings_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invites` (
                           `id` char(26) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `tenant_id` bigint unsigned NOT NULL,
                           `old_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `slug_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `description` text COLLATE utf8mb4_unicode_ci,
                           `has_voucher` tinyint(1) NOT NULL DEFAULT '0',
                           `voucher` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `used_quantity_limit` int NOT NULL,
                           `used_quantity` int NOT NULL DEFAULT '0',
                           `status` enum('Ativo','Indisponível','Expirado','Cancelado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Ativo',
                           `expired_at` timestamp NULL DEFAULT NULL,
                           `created_at` timestamp NULL DEFAULT NULL,
                           `updated_at` timestamp NULL DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           UNIQUE KEY `invites_old_uuid_unique` (`old_uuid`),
                           KEY `invites_tenant_id_foreign` (`tenant_id`),
                           CONSTRAINT `invites_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `invites_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invites_packages` (
                                    `invite_id` char(26) COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `package_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
                                    KEY `invites_packages_invite_id_foreign` (`invite_id`),
                                    KEY `invites_packages_package_id_foreign` (`package_id`),
                                    CONSTRAINT `invites_packages_invite_id_foreign` FOREIGN KEY (`invite_id`) REFERENCES `invites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                    CONSTRAINT `invites_packages_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `plataforma`.`ead_subscription_package` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `invites_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invites_user` (
                                `invite_id` char(26) COLLATE utf8mb4_unicode_ci NOT NULL,
                                `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
                                KEY `invites_user_invite_id_foreign` (`invite_id`),
                                KEY `invites_user_user_id_foreign` (`user_id`),
                                CONSTRAINT `invites_user_invite_id_foreign` FOREIGN KEY (`invite_id`) REFERENCES `invites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                CONSTRAINT `invites_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `plataforma`.`users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                        `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                        `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                        `attempts` tinyint unsigned NOT NULL,
                        `reserved_at` int unsigned DEFAULT NULL,
                        `available_at` int unsigned NOT NULL,
                        `created_at` int unsigned NOT NULL,
                        PRIMARY KEY (`id`),
                        KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=13806 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
                              `id` int unsigned NOT NULL AUTO_INCREMENT,
                              `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                              `batch` int NOT NULL,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=588 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                 `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `owner_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `customer_iugu_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `active` tinyint(1) NOT NULL DEFAULT '1',
                                 `accepted_term` tinyint(1) NOT NULL DEFAULT '0',
                                 `transactional_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `organizations_owner_id_foreign` (`owner_id`),
                                 CONSTRAINT `organizations_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `plataforma`.`users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3686 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `pandavideo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pandavideo_groups` (
                                     `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `id_panda` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `secret_panda` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `user_id_panda` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `status` tinyint(1) NOT NULL DEFAULT '1',
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `master_pandavideo_groups_user_id_foreign` (`user_id`),
                                     CONSTRAINT `master_pandavideo_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `plataforma`.`users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
                                   `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `plan_split_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_split_rule` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `plan_id` bigint unsigned NOT NULL,
                                   `split_rule_id` bigint unsigned NOT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `plan_split_rule_plan_id_foreign` (`plan_id`),
                                   KEY `plan_split_rule_split_rule_id_foreign` (`split_rule_id`),
                                   CONSTRAINT `plan_split_rule_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `app_plans` (`id`),
                                   CONSTRAINT `plan_split_rule_split_rule_id_foreign` FOREIGN KEY (`split_rule_id`) REFERENCES `sub_account_default_split_rules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `queue_errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue_errors` (
                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                `fila_id` bigint unsigned NOT NULL,
                                `log` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                KEY `master_queue_errors_fila_id_foreign` (`fila_id`),
                                CONSTRAINT `master_queue_errors_fila_id_foreign` FOREIGN KEY (`fila_id`) REFERENCES `filas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `registration_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_links` (
                                      `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `tenant_id` bigint unsigned NOT NULL,
                                      `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `slug_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                                      `cupom_status` tinyint(1) NOT NULL DEFAULT '1',
                                      `cupom` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `text_action_btn` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cadastrar',
                                      `access_limit` int DEFAULT NULL,
                                      `expired_at` datetime DEFAULT NULL,
                                      `banner` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `registration_links_tenant_id_foreign` (`tenant_id`),
                                      CONSTRAINT `registration_links_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `reset_code_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reset_code_passwords` (
                                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                        `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        PRIMARY KEY (`id`),
                                        KEY `reset_code_passwords_email_index` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=107379 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `segmentation_activecampaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segmentation_activecampaign` (
                                               `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                               `integration_id` bigint unsigned NOT NULL,
                                               `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                               `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                               `organization_id` bigint unsigned DEFAULT NULL,
                                               `event` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                               `add_to_list` tinyint(1) NOT NULL DEFAULT '0',
                                               `add_tag` tinyint(1) NOT NULL DEFAULT '0',
                                               `remove_lead` tinyint(1) NOT NULL DEFAULT '0',
                                               `remove_tag` tinyint(1) NOT NULL DEFAULT '0',
                                               `remove_tag_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                               `list_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                               `tag_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                               `send_name` tinyint(1) NOT NULL DEFAULT '0',
                                               `send_phone` tinyint(1) NOT NULL DEFAULT '0',
                                               `active` tinyint(1) NOT NULL DEFAULT '1',
                                               `created_at` timestamp NULL DEFAULT NULL,
                                               `updated_at` timestamp NULL DEFAULT NULL,
                                               PRIMARY KEY (`id`),
                                               KEY `segmentation_activecampaign_integration_id_foreign` (`integration_id`),
                                               KEY `segmentation_activecampaign_user_id_foreign` (`user_id`),
                                               KEY `segmentation_activecampaign_product_id_foreign` (`product_id`),
                                               KEY `segmentation_activecampaign_organization_id_foreign` (`organization_id`),
                                               CONSTRAINT `segmentation_activecampaign_integration_id_foreign` FOREIGN KEY (`integration_id`) REFERENCES `integration_activecampaign_settings` (`id`) ON DELETE CASCADE,
                                               CONSTRAINT `segmentation_activecampaign_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE,
                                               CONSTRAINT `segmentation_activecampaign_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `plataforma`.`ead_subscription_package` (`id`) ON DELETE CASCADE,
                                               CONSTRAINT `segmentation_activecampaign_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `plataforma`.`users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `segmentation_leadlovers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segmentation_leadlovers` (
                                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                           `integration_id` bigint unsigned NOT NULL,
                                           `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `organization_id` bigint unsigned DEFAULT NULL,
                                           `event` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `add_to_machine_and_sequence` tinyint(1) NOT NULL DEFAULT '0',
                                           `add_tag` tinyint(1) NOT NULL DEFAULT '0',
                                           `remove_lead` tinyint(1) NOT NULL DEFAULT '0',
                                           `machine_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `email_sequence_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `level_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `tag_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `send_name` tinyint(1) NOT NULL DEFAULT '0',
                                           `send_phone` tinyint(1) NOT NULL DEFAULT '0',
                                           `move_lead` tinyint(1) NOT NULL DEFAULT '0',
                                           `move_from_machine` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `move_from_sequence` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `move_to_machine` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `move_to_sequence` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `active` tinyint(1) NOT NULL DEFAULT '1',
                                           `created_at` timestamp NULL DEFAULT NULL,
                                           `updated_at` timestamp NULL DEFAULT NULL,
                                           PRIMARY KEY (`id`),
                                           KEY `segmentation_leadlovers_integration_id_foreign` (`integration_id`),
                                           KEY `segmentation_leadlovers_user_id_foreign` (`user_id`),
                                           KEY `segmentation_leadlovers_product_id_foreign` (`product_id`),
                                           KEY `segmentation_leadlovers_organization_id_foreign` (`organization_id`),
                                           CONSTRAINT `segmentation_leadlovers_integration_id_foreign` FOREIGN KEY (`integration_id`) REFERENCES `integration_leadlovers_settings` (`id`) ON DELETE CASCADE,
                                           CONSTRAINT `segmentation_leadlovers_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE,
                                           CONSTRAINT `segmentation_leadlovers_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `plataforma`.`ead_subscription_package` (`id`) ON DELETE CASCADE,
                                           CONSTRAINT `segmentation_leadlovers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `plataforma`.`users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `settings_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings_tokens` (
                                   `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `tenant_id` bigint unsigned NOT NULL,
                                   `api_token` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `status` tinyint(1) NOT NULL DEFAULT '1',
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `settings_tokens_tenant_id_foreign` (`tenant_id`),
                                   CONSTRAINT `settings_tokens_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sub_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_account` (
                               `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                               `account_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
                               `organization_id` bigint unsigned DEFAULT NULL,
                               `account_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `live_api_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `test_api_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `user_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `active` tinyint(1) NOT NULL DEFAULT '1',
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `sub_account_account_id_index` (`account_id`),
                               KEY `sub_account_organization_id_foreign` (`organization_id`),
                               CONSTRAINT `sub_account_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=545 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sub_account_custom_split_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_account_custom_split_rules` (
                                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                  `organization_id` bigint unsigned DEFAULT NULL,
                                                  `sub_account_id` bigint unsigned NOT NULL,
                                                  `cents` int unsigned DEFAULT NULL,
                                                  `percent` double(8,2) unsigned DEFAULT NULL,
                                                  `bank_slip_cents` int unsigned DEFAULT NULL,
                                                  `bank_slip_percent` double(8,2) unsigned DEFAULT NULL,
                                                  `credit_card_cents` int unsigned DEFAULT NULL,
                                                  `credit_card_percent` double(8,2) unsigned DEFAULT NULL,
                                                  `pix_cents` int unsigned DEFAULT NULL,
                                                  `pix_percent` double(8,2) unsigned DEFAULT NULL,
                                                  `permit_aggregated` tinyint(1) NOT NULL DEFAULT '1',
                                                  `credit_card_1x_cents` int unsigned DEFAULT NULL,
                                                  `credit_card_2x_cents` int unsigned DEFAULT NULL,
                                                  `credit_card_3x_cents` int unsigned DEFAULT NULL,
                                                  `credit_card_4x_cents` int unsigned DEFAULT NULL,
                                                  `credit_card_5x_cents` int unsigned DEFAULT NULL,
                                                  `credit_card_6x_cents` int unsigned DEFAULT NULL,
                                                  `credit_card_7x_cents` int unsigned DEFAULT NULL,
                                                  `credit_card_8x_cents` int unsigned DEFAULT NULL,
                                                  `credit_card_9x_cents` int unsigned DEFAULT NULL,
                                                  `credit_card_10x_cents` int unsigned DEFAULT NULL,
                                                  `credit_card_11x_cents` int unsigned DEFAULT NULL,
                                                  `credit_card_12x_cents` int unsigned DEFAULT NULL,
                                                  `credit_card_1x_percent` double(8,2) unsigned DEFAULT NULL,
                                                  `credit_card_2x_percent` double(8,2) unsigned DEFAULT NULL,
                                                  `credit_card_3x_percent` double(8,2) unsigned DEFAULT NULL,
                                                  `credit_card_4x_percent` double(8,2) unsigned DEFAULT NULL,
                                                  `credit_card_5x_percent` double(8,2) unsigned DEFAULT NULL,
                                                  `credit_card_6x_percent` double(8,2) unsigned DEFAULT NULL,
                                                  `credit_card_7x_percent` double(8,2) unsigned DEFAULT NULL,
                                                  `credit_card_8x_percent` double(8,2) unsigned DEFAULT NULL,
                                                  `credit_card_9x_percent` double(8,2) unsigned DEFAULT NULL,
                                                  `credit_card_10x_percent` double(8,2) unsigned DEFAULT NULL,
                                                  `credit_card_11x_percent` double(8,2) unsigned DEFAULT NULL,
                                                  `credit_card_12x_percent` double(8,2) unsigned DEFAULT NULL,
                                                  `created_at` timestamp NULL DEFAULT NULL,
                                                  `updated_at` timestamp NULL DEFAULT NULL,
                                                  PRIMARY KEY (`id`),
                                                  KEY `master_sub_account_custom_split_rules_sub_account_id_foreign` (`sub_account_id`),
                                                  KEY `master_sub_account_custom_split_rules_user_id_foreign` (`user_id`),
                                                  KEY `sub_account_custom_split_rules_organization_id_foreign` (`organization_id`),
                                                  CONSTRAINT `master_sub_account_custom_split_rules_sub_account_id_foreign` FOREIGN KEY (`sub_account_id`) REFERENCES `sub_account` (`id`) ON DELETE CASCADE,
                                                  CONSTRAINT `master_sub_account_custom_split_rules_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `plataforma`.`users` (`id`) ON DELETE CASCADE,
                                                  CONSTRAINT `sub_account_custom_split_rules_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sub_account_default_split_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_account_default_split_rules` (
                                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                   `split_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                                   `cents` int unsigned DEFAULT NULL,
                                                   `percent` double(8,2) unsigned DEFAULT NULL,
                                                   `bank_slip_cents` int unsigned DEFAULT NULL,
                                                   `bank_slip_percent` double(8,2) unsigned DEFAULT NULL,
                                                   `credit_card_cents` int unsigned DEFAULT NULL,
                                                   `credit_card_percent` double(8,2) unsigned DEFAULT NULL,
                                                   `pix_cents` int unsigned DEFAULT NULL,
                                                   `pix_percent` double(8,2) unsigned DEFAULT NULL,
                                                   `permit_aggregated` tinyint(1) NOT NULL DEFAULT '1',
                                                   `credit_card_1x_cents` int unsigned DEFAULT NULL,
                                                   `credit_card_2x_cents` int unsigned DEFAULT NULL,
                                                   `credit_card_3x_cents` int unsigned DEFAULT NULL,
                                                   `credit_card_4x_cents` int unsigned DEFAULT NULL,
                                                   `credit_card_5x_cents` int unsigned DEFAULT NULL,
                                                   `credit_card_6x_cents` int unsigned DEFAULT NULL,
                                                   `credit_card_7x_cents` int unsigned DEFAULT NULL,
                                                   `credit_card_8x_cents` int unsigned DEFAULT NULL,
                                                   `credit_card_9x_cents` int unsigned DEFAULT NULL,
                                                   `credit_card_10x_cents` int unsigned DEFAULT NULL,
                                                   `credit_card_11x_cents` int unsigned DEFAULT NULL,
                                                   `credit_card_12x_cents` int unsigned DEFAULT NULL,
                                                   `credit_card_1x_percent` double(8,2) unsigned DEFAULT NULL,
                                                   `credit_card_2x_percent` double(8,2) unsigned DEFAULT NULL,
                                                   `credit_card_3x_percent` double(8,2) unsigned DEFAULT NULL,
                                                   `credit_card_4x_percent` double(8,2) unsigned DEFAULT NULL,
                                                   `credit_card_5x_percent` double(8,2) unsigned DEFAULT NULL,
                                                   `credit_card_6x_percent` double(8,2) unsigned DEFAULT NULL,
                                                   `credit_card_7x_percent` double(8,2) unsigned DEFAULT NULL,
                                                   `credit_card_8x_percent` double(8,2) unsigned DEFAULT NULL,
                                                   `credit_card_9x_percent` double(8,2) unsigned DEFAULT NULL,
                                                   `credit_card_10x_percent` double(8,2) unsigned DEFAULT NULL,
                                                   `credit_card_11x_percent` double(8,2) unsigned DEFAULT NULL,
                                                   `credit_card_12x_percent` double(8,2) unsigned DEFAULT NULL,
                                                   `created_at` timestamp NULL DEFAULT NULL,
                                                   `updated_at` timestamp NULL DEFAULT NULL,
                                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `superadmin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `superadmin_users` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `auth` smallint NOT NULL,
                                    `last_login_at` datetime DEFAULT NULL,
                                    `created_at` timestamp NULL DEFAULT NULL,
                                    `updated_at` timestamp NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `system_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_orders` (
                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                 `tenant_id` bigint unsigned NOT NULL,
                                 `card_id` bigint unsigned NOT NULL,
                                 `subscription_id` bigint unsigned NOT NULL,
                                 `transaction` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `amount` decimal(10,2) NOT NULL,
                                 `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `system_orders_tenant_id_foreign` (`tenant_id`),
                                 CONSTRAINT `system_orders_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `template_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_settings` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `tenant_id` bigint unsigned NOT NULL,
                                     `logo_square` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `logo_horizontal` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `favicon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `primary_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `text_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `login_theme` bigint unsigned NOT NULL DEFAULT '1',
                                     `login_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                                     `banner_custom_transition_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `overlay_banner_login` int DEFAULT '50',
                                     `login_banner` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `background_color_primary` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `background_color_secondary` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `shadow_size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `font_primary` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `showcase_url_redirect` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `overlay_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `overlay_intensity` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `comment` tinyint(1) NOT NULL DEFAULT '1',
                                     `banner_custom_autoplay_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `banner_custom_autoplay` tinyint(1) DEFAULT '0',
                                     `showcase` tinyint(1) DEFAULT '0',
                                     `login_theme_placement` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `theme_classes` int DEFAULT NULL,
                                     `sidebar` int DEFAULT NULL,
                                     `show_blocked_content` tinyint(1) NOT NULL DEFAULT '1',
                                     `master_password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `direct_login_time_measure` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `direct_login_expires_in` int unsigned DEFAULT '0',
                                     `direct_login_single_access` tinyint(1) DEFAULT '0',
                                     `direct_login` tinyint(1) DEFAULT '0',
                                     `login_banner_vertical` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `footer_visible` tinyint(1) DEFAULT '1',
                                     `cta_login` tinyint(1) DEFAULT '0',
                                     `show_carrousel_continue_course` tinyint(1) DEFAULT '0',
                                     `show_carrousel_continue_module` tinyint(1) DEFAULT '0',
                                     `show_carrousel_continue_class` tinyint(1) DEFAULT '0',
                                     `show_carrousel_highlight` tinyint(1) DEFAULT '0',
                                     `course_page_indicator` tinyint(1) NOT NULL DEFAULT '1',
                                     `module_page_indicator` tinyint(1) NOT NULL DEFAULT '1',
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     `title_cta_login` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `link_cta_login` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `reward_id` int DEFAULT NULL,
                                     `await_comment_approval` tinyint(1) NOT NULL DEFAULT '0',
                                     `header_position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'standard',
                                     `header_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'solid',
                                     `fix_header_on_scroll` tinyint(1) NOT NULL DEFAULT '0',
                                     PRIMARY KEY (`id`),
                                     KEY `template_settings_tenant_id_foreign` (`tenant_id`),
                                     CONSTRAINT `template_settings_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tenant_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_domains` (
                                  `id` int unsigned NOT NULL AUTO_INCREMENT,
                                  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `verify` tinyint(1) NOT NULL DEFAULT '0',
                                  `tenant_id` bigint unsigned NOT NULL,
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  UNIQUE KEY `tenant_domains_domain_unique` (`domain`),
                                  KEY `tenant_domains_tenant_id_foreign` (`tenant_id`),
                                  CONSTRAINT `tenant_domains_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78946680 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tenant_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_users` (
                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                `organization_id` bigint unsigned DEFAULT NULL,
                                `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                                `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `template_id` bigint unsigned DEFAULT NULL,
                                `active` tinyint(1) NOT NULL DEFAULT '1',
                                `redirect_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL,
                                `deleted_at` timestamp NULL DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                KEY `master_tenant_users_template_id_foreign` (`template_id`),
                                KEY `tenant_users_organization_id_foreign` (`organization_id`),
                                CONSTRAINT `master_tenant_users_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `template_settings` (`id`),
                                CONSTRAINT `tenant_users_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3965 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_bankaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_bankaccount` (
                                    `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `user_tenant_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                    `tenant_id` bigint unsigned NOT NULL,
                                    `account_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `live_api_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `test_api_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `user_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                    `feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                                    `active` tinyint(1) NOT NULL DEFAULT '0',
                                    `created_at` timestamp NULL DEFAULT NULL,
                                    `updated_at` timestamp NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`),
                                    KEY `user_bankaccount_user_id_foreign` (`user_id`),
                                    KEY `user_bankaccount_user_tenant_id_foreign` (`user_tenant_id`),
                                    CONSTRAINT `user_bankaccount_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `plataforma`.`users` (`id`) ON DELETE CASCADE,
                                    CONSTRAINT `user_bankaccount_user_tenant_id_foreign` FOREIGN KEY (`user_tenant_id`) REFERENCES `user_tenant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tenant` (
                               `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `tenant_id` bigint unsigned NOT NULL,
                               `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `genre` tinyint(1) DEFAULT NULL,
                               `birth` date DEFAULT NULL,
                               `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `auth` int NOT NULL DEFAULT '0',
                               `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
                               `email_verified_at` timestamp NULL DEFAULT NULL,
                               `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `last_login_at` datetime DEFAULT NULL,
                               `last_login_ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               UNIQUE KEY `user_tenant_email_unique` (`email`),
                               KEY `user_tenant_tenant_id_foreign` (`tenant_id`),
                               CONSTRAINT `user_tenant_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                         `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `email_verified_at` timestamp NULL DEFAULT NULL,
                         `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `withdrawal_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawal_history` (
                                      `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                      `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `bank_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `bank_agency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `bank_account` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `amount` int NOT NULL,
                                      `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `withdrawal_history_user_id_foreign` (`user_id`),
                                      CONSTRAINT `withdrawal_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `plataforma`.`users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `plataforma` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `plataforma`;
DROP TABLE IF EXISTS `Table_size_Master`;
/*!50001 DROP VIEW IF EXISTS `Table_size_Master`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Table_size_Master` AS SELECT
                                                1 AS `Tabela`,
                                                1 AS `Tamanho da tabela (Kbyte)`*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `Table_size_Plataforma`;
/*!50001 DROP VIEW IF EXISTS `Table_size_Plataforma`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Table_size_Plataforma` AS SELECT
                                                    1 AS `Tabela`,
                                                    1 AS `Tamanho da tabela (Kbyte)`*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `abandoned_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abandoned_carts` (
                                   `id` int unsigned NOT NULL AUTO_INCREMENT,
                                   `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `offer_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `second_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `region_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `region` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `longitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `latitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `method_payment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `abandoned_carts_offer_id_foreign` (`offer_id`),
                                   KEY `abandoned_carts_product_id_foreign` (`product_id`),
                                   CONSTRAINT `abandoned_carts_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers_frequent_payment` (`id`) ON DELETE CASCADE,
                                   CONSTRAINT `abandoned_carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ad_community_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_community_tenant` (
                                       `ad_id` bigint unsigned NOT NULL,
                                       `community_id` bigint unsigned NOT NULL,
                                       KEY `plataforma_ad_community_tenant_ad_id_foreign` (`ad_id`),
                                       KEY `plataforma_ad_community_tenant_community_id_foreign` (`community_id`),
                                       CONSTRAINT `plataforma_ad_community_tenant_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                       CONSTRAINT `plataforma_ad_community_tenant_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `community_tenants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ad_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_section` (
                              `ad_id` bigint unsigned NOT NULL,
                              `section_id` bigint unsigned NOT NULL,
                              KEY `plataforma_ad_section_ad_id_foreign` (`ad_id`),
                              KEY `plataforma_ad_section_section_id_foreign` (`section_id`),
                              CONSTRAINT `plataforma_ad_section_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                              CONSTRAINT `plataforma_ad_section_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                       `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                       `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                       `button_text` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                       `button_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                       `small_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                       `large_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                       `created_at` timestamp NULL DEFAULT NULL,
                       `updated_at` timestamp NULL DEFAULT NULL,
                       PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ads_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_history` (
                               `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                               `tenant_id` bigint unsigned NOT NULL,
                               `ad_id` bigint unsigned NOT NULL,
                               `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `section` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `interacted` tinyint(1) NOT NULL DEFAULT '0',
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `plataforma_ads_history_tenant_id_foreign` (`tenant_id`),
                               KEY `plataforma_ads_history_ad_id_foreign` (`ad_id`),
                               KEY `plataforma_ads_history_user_id_foreign` (`user_id`),
                               CONSTRAINT `plataforma_ads_history_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                               CONSTRAINT `plataforma_ads_history_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                               CONSTRAINT `plataforma_ads_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `advance_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advance_requests` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `subaccount_id` bigint unsigned NOT NULL,
                                    `amount` double(8,2) NOT NULL,
                                    `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
                                    `created_at` timestamp NULL DEFAULT NULL,
                                    `updated_at` timestamp NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`),
                                    KEY `advance_requests_subaccount_id_foreign` (`subaccount_id`),
                                    CONSTRAINT `advance_requests_subaccount_id_foreign` FOREIGN KEY (`subaccount_id`) REFERENCES `master`.`sub_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `answers_profile_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers_profile_points` (
                                          `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                          `points` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                          `answer_id` bigint unsigned DEFAULT NULL,
                                          `question_id` bigint unsigned DEFAULT NULL,
                                          `profile_id` bigint unsigned DEFAULT NULL,
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL,
                                          PRIMARY KEY (`id`),
                                          KEY `plataforma_answers_profile_points_answer_id_foreign` (`answer_id`),
                                          KEY `plataforma_answers_profile_points_question_id_foreign` (`question_id`),
                                          KEY `plataforma_answers_profile_points_profile_id_foreign` (`profile_id`),
                                          CONSTRAINT `plataforma_answers_profile_points_answer_id_foreign` FOREIGN KEY (`answer_id`) REFERENCES `quiz_question_answer` (`id`) ON DELETE CASCADE,
                                          CONSTRAINT `plataforma_answers_profile_points_profile_id_foreign` FOREIGN KEY (`profile_id`) REFERENCES `quiz_profile` (`id`) ON DELETE CASCADE,
                                          CONSTRAINT `plataforma_answers_profile_points_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `quiz_question` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `banlist_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banlist_users` (
                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                 `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `post_id` bigint unsigned DEFAULT NULL,
                                 `motivation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `tenant_id` bigint unsigned DEFAULT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `plataforma_banlist_users_post_id_foreign` (`post_id`),
                                 KEY `plataforma_banlist_users_tenant_id_foreign` (`tenant_id`),
                                 KEY `plataforma_banlist_users_user_id_foreign` (`user_id`),
                                 CONSTRAINT `plataforma_banlist_users_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `community_posts` (`id`) ON DELETE CASCADE,
                                 CONSTRAINT `plataforma_banlist_users_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                                 CONSTRAINT `plataforma_banlist_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `carousels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carousels` (
                             `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                             `tenant_id` bigint unsigned NOT NULL,
                             `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                             `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                             `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                             `order` int DEFAULT NULL,
                             `published` tinyint(1) NOT NULL DEFAULT '1',
                             `card_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `autoplay_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `autoplay` tinyint(1) DEFAULT '0',
                             `hover_type` tinyint(1) DEFAULT '0',
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL,
                             `cards_per_group` int DEFAULT NULL,
                             `cards_per_group_mobile` int DEFAULT NULL,
                             `carousel_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `weight_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `weight_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `size_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `size_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `font_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `font_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `custom` tinyint(1) DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             KEY `carousels_tenant_id_foreign` (`tenant_id`),
                             CONSTRAINT `carousels_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `carousels_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carousels_items` (
                                   `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `carousel_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `tenant_id` bigint unsigned NOT NULL,
                                   `course_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `module_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `class_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `ebook_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `order` int DEFAULT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `carousels_items_tenant_id_foreign` (`tenant_id`),
                                   KEY `carousels_items_carousel_id_foreign` (`carousel_id`),
                                   KEY `carousels_items_course_id_foreign` (`course_id`),
                                   KEY `carousels_items_module_id_foreign` (`module_id`),
                                   KEY `carousels_items_class_id_foreign` (`class_id`),
                                   KEY `carousels_items_ebook_id_foreign` (`ebook_id`),
                                   CONSTRAINT `carousels_items_carousel_id_foreign` FOREIGN KEY (`carousel_id`) REFERENCES `carousels` (`id`) ON DELETE CASCADE,
                                   CONSTRAINT `carousels_items_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `ead_classes` (`id`) ON DELETE CASCADE,
                                   CONSTRAINT `carousels_items_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `ead_courses` (`id`) ON DELETE CASCADE,
                                   CONSTRAINT `carousels_items_ebook_id_foreign` FOREIGN KEY (`ebook_id`) REFERENCES `ead_ebooks` (`id`) ON DELETE CASCADE,
                                   CONSTRAINT `carousels_items_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `ead_modules` (`id`) ON DELETE CASCADE,
                                   CONSTRAINT `carousels_items_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `chargeback_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chargeback_messages` (
                                       `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `chargeback_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `private` tinyint(1) NOT NULL DEFAULT '0',
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `chargeback_messages_user_id_foreign` (`user_id`),
                                       KEY `chargeback_messages_chargeback_id_foreign` (`chargeback_id`),
                                       CONSTRAINT `chargeback_messages_chargeback_id_foreign` FOREIGN KEY (`chargeback_id`) REFERENCES `chargebacks` (`id`) ON DELETE CASCADE,
                                       CONSTRAINT `chargeback_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `chargebacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chargebacks` (
                               `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `tenant_id` bigint unsigned NOT NULL,
                               `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `fatura_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `subscription_id` bigint unsigned DEFAULT NULL,
                               `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `chargebacks_tenant_id_foreign` (`tenant_id`),
                               KEY `chargebacks_user_id_foreign` (`user_id`),
                               KEY `chargebacks_subscription_id_foreign` (`subscription_id`),
                               CONSTRAINT `chargebacks_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `user_subscription` (`id`) ON DELETE CASCADE,
                               CONSTRAINT `chargebacks_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                               CONSTRAINT `chargebacks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `checkouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkouts` (
                             `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                             `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                             `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                             `default` tinyint(1) NOT NULL DEFAULT '0',
                             `state` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                             `template` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                             `chatContent` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `chatOption` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `chat` tinyint(1) DEFAULT NULL,
                             `popupVideoUrl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `popupVideoTitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `popupText` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `popupTitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `popupImage` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `popupUrl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `popupButtonText` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `popupAction` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `popupContent` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `exitPopUp` tinyint(1) DEFAULT NULL,
                             `lastWeekPurchases` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `lastDayPurchases` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `recentInterest` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `lastWeekInterest` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `lastDayInterest` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `font_family` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `background_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `img_fixed` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `img_repeat` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `img_expand` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `hideTopContainer` tinyint(1) DEFAULT '0',
                             `hideSideContainer` tinyint(1) DEFAULT '0',
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             KEY `checkouts_product_id_foreign` (`product_id`),
                             CONSTRAINT `checkouts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `checkouts_available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkouts_available` (
                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                       `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `url_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `manageable` tinyint(1) NOT NULL,
                                       `recurrent` tinyint(1) NOT NULL,
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL,
                                       `deleted_at` timestamp NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`),
                                       UNIQUE KEY `checkouts_available_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=123124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `community_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_comments` (
                                      `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                      `community_id` bigint unsigned NOT NULL,
                                      `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                                      `gif` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `community_comments_community_id_foreign` (`community_id`),
                                      KEY `plataforma_community_comments_user_id_foreign` (`user_id`),
                                      CONSTRAINT `community_comments_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `community_tenants` (`id`) ON DELETE CASCADE,
                                      CONSTRAINT `plataforma_community_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106778 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `community_comments_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_comments_data` (
                                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                           `comment_id` bigint unsigned NOT NULL,
                                           `post_id` bigint unsigned NOT NULL,
                                           `likes` int DEFAULT '0',
                                           `replies` int DEFAULT '0',
                                           `created_at` timestamp NULL DEFAULT NULL,
                                           `updated_at` timestamp NULL DEFAULT NULL,
                                           PRIMARY KEY (`id`),
                                           KEY `community_comments_data_post_id_foreign` (`post_id`),
                                           KEY `community_comments_data_comment_id_foreign` (`comment_id`),
                                           CONSTRAINT `community_comments_data_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `community_comments` (`id`) ON DELETE CASCADE,
                                           CONSTRAINT `community_comments_data_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `community_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106777 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `community_permissions_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_permissions_access` (
                                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                `community_id` bigint unsigned NOT NULL,
                                                `tenant_id` bigint unsigned NOT NULL,
                                                `plan_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                `created_at` timestamp NULL DEFAULT NULL,
                                                `updated_at` timestamp NULL DEFAULT NULL,
                                                PRIMARY KEY (`id`),
                                                KEY `plataforma_community_permissions_access_tenant_id_foreign` (`tenant_id`),
                                                KEY `community_permissions_access_community_id_foreign` (`community_id`),
                                                KEY `community_permissions_access_plan_id_foreign` (`plan_id`),
                                                CONSTRAINT `community_permissions_access_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `community_tenants` (`id`) ON DELETE CASCADE,
                                                CONSTRAINT `community_permissions_access_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE,
                                                CONSTRAINT `plataforma_community_permissions_access_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3441 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `community_permissions_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_permissions_content` (
                                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                 `community_id` bigint unsigned NOT NULL,
                                                 `tenant_id` bigint unsigned NOT NULL,
                                                 `publications` tinyint(1) NOT NULL DEFAULT '0',
                                                 `comments` tinyint(1) NOT NULL DEFAULT '0',
                                                 `likes` tinyint(1) NOT NULL DEFAULT '0',
                                                 `text` tinyint(1) NOT NULL DEFAULT '0',
                                                 `created_at` timestamp NULL DEFAULT NULL,
                                                 `updated_at` timestamp NULL DEFAULT NULL,
                                                 PRIMARY KEY (`id`),
                                                 KEY `plataforma_community_permissions_content_tenant_id_foreign` (`tenant_id`),
                                                 KEY `community_permissions_content_community_id_foreign` (`community_id`),
                                                 CONSTRAINT `community_permissions_content_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `community_tenants` (`id`) ON DELETE CASCADE,
                                                 CONSTRAINT `plataforma_community_permissions_content_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1288 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `community_permissions_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_permissions_media` (
                                               `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                               `community_id` bigint unsigned NOT NULL,
                                               `tenant_id` bigint unsigned NOT NULL,
                                               `files` tinyint(1) NOT NULL DEFAULT '0',
                                               `videos` tinyint(1) NOT NULL DEFAULT '0',
                                               `images` tinyint(1) NOT NULL DEFAULT '0',
                                               `carousels` tinyint(1) NOT NULL DEFAULT '0',
                                               `created_at` timestamp NULL DEFAULT NULL,
                                               `updated_at` timestamp NULL DEFAULT NULL,
                                               PRIMARY KEY (`id`),
                                               KEY `plataforma_community_permissions_media_tenant_id_foreign` (`tenant_id`),
                                               KEY `community_permissions_media_community_id_foreign` (`community_id`),
                                               CONSTRAINT `community_permissions_media_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `community_tenants` (`id`) ON DELETE CASCADE,
                                               CONSTRAINT `plataforma_community_permissions_media_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1284 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `community_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_posts` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `community_id` bigint unsigned NOT NULL,
                                   `tenant_id` bigint unsigned NOT NULL,
                                   `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                                   `embed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL,
                                   `post_blocked` tinyint(1) DEFAULT '0',
                                   `aprooved` tinyint DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `plataforma_community_posts_tenant_id_foreign` (`tenant_id`),
                                   KEY `community_posts_community_id_foreign` (`community_id`),
                                   KEY `community_posts_user_id_foreign` (`user_id`),
                                   CONSTRAINT `community_posts_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `community_tenants` (`id`) ON DELETE CASCADE,
                                   CONSTRAINT `community_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
                                   CONSTRAINT `plataforma_community_posts_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40933 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `community_posts_carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_posts_carousel` (
                                            `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                            `tenant_id` bigint unsigned NOT NULL,
                                            `community_id` bigint unsigned NOT NULL,
                                            `post_id` bigint unsigned NOT NULL,
                                            `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                            `created_at` timestamp NULL DEFAULT NULL,
                                            `updated_at` timestamp NULL DEFAULT NULL,
                                            PRIMARY KEY (`id`),
                                            KEY `plataforma_community_posts_carousel_tenant_id_foreign` (`tenant_id`),
                                            KEY `community_posts_carousel_community_id_foreign` (`community_id`),
                                            KEY `community_posts_carousel_post_id_foreign` (`post_id`),
                                            CONSTRAINT `community_posts_carousel_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `community_tenants` (`id`) ON DELETE CASCADE,
                                            CONSTRAINT `community_posts_carousel_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `community_posts` (`id`) ON DELETE CASCADE,
                                            CONSTRAINT `plataforma_community_posts_carousel_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12687 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `community_posts_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_posts_data` (
                                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                        `post_id` bigint unsigned NOT NULL,
                                        `fixed` tinyint(1) NOT NULL DEFAULT '0',
                                        `likes` int NOT NULL DEFAULT '0',
                                        `comments` int NOT NULL DEFAULT '0',
                                        `filed` tinyint(1) NOT NULL DEFAULT '0',
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL,
                                        PRIMARY KEY (`id`),
                                        KEY `community_posts_data_post_id_foreign` (`post_id`),
                                        CONSTRAINT `community_posts_data_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `community_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40931 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `community_posts_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_posts_material` (
                                            `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                            `post_id` bigint unsigned NOT NULL,
                                            `tenant_id` bigint unsigned NOT NULL,
                                            `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                            `size` int DEFAULT NULL,
                                            `material_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                            `created_at` timestamp NULL DEFAULT NULL,
                                            `updated_at` timestamp NULL DEFAULT NULL,
                                            PRIMARY KEY (`id`),
                                            KEY `plataforma_community_posts_material_tenant_id_foreign` (`tenant_id`),
                                            KEY `community_posts_material_post_id_foreign` (`post_id`),
                                            CONSTRAINT `community_posts_material_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `community_posts` (`id`) ON DELETE CASCADE,
                                            CONSTRAINT `plataforma_community_posts_material_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=566 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `community_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_replies` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `community_id` bigint unsigned NOT NULL,
                                     `comment_id` bigint unsigned NOT NULL,
                                     `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `gif` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `plataforma_community_replies_user_id_foreign` (`user_id`),
                                     KEY `community_replies_community_id_foreign` (`community_id`),
                                     KEY `community_replies_comment_id_foreign` (`comment_id`),
                                     CONSTRAINT `community_replies_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `community_comments` (`id`) ON DELETE CASCADE,
                                     CONSTRAINT `community_replies_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `community_tenants` (`id`) ON DELETE CASCADE,
                                     CONSTRAINT `plataforma_community_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116904 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `community_replies_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_replies_data` (
                                          `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                          `community_replies_id` bigint unsigned NOT NULL,
                                          `likes` int DEFAULT NULL,
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL,
                                          PRIMARY KEY (`id`),
                                          KEY `community_replies_data_community_replies_id_foreign` (`community_replies_id`),
                                          CONSTRAINT `community_replies_data_community_replies_id_foreign` FOREIGN KEY (`community_replies_id`) REFERENCES `community_replies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=116887 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `community_standard_score_ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_standard_score_ranking` (
                                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                    `tenant_id` bigint unsigned NOT NULL,
                                                    `custom_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                    `score_posts` int NOT NULL,
                                                    `score_comments` int NOT NULL,
                                                    `score_replies` int NOT NULL,
                                                    `score_likes` int NOT NULL,
                                                    `created_at` timestamp NULL DEFAULT NULL,
                                                    `updated_at` timestamp NULL DEFAULT NULL,
                                                    PRIMARY KEY (`id`),
                                                    KEY `plataforma_community_standard_score_ranking_tenant_id_foreign` (`tenant_id`),
                                                    CONSTRAINT `plataforma_community_standard_score_ranking_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `community_templates_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_templates_settings` (
                                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                `tenant_id` bigint unsigned NOT NULL,
                                                `active` tinyint(1) NOT NULL DEFAULT '1',
                                                `show_communities_page` tinyint(1) NOT NULL DEFAULT '1',
                                                `created_at` timestamp NULL DEFAULT NULL,
                                                `updated_at` timestamp NULL DEFAULT NULL,
                                                PRIMARY KEY (`id`),
                                                KEY `plataforma_community_templates_settings_tenant_id_foreign` (`tenant_id`),
                                                CONSTRAINT `plataforma_community_templates_settings_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `community_tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_tenants` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `tenant_id` bigint unsigned NOT NULL,
                                     `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                                     `links` json DEFAULT NULL,
                                     `active` tinyint(1) NOT NULL DEFAULT '1',
                                     `show_ranking` tinyint(1) NOT NULL DEFAULT '1',
                                     `principal` tinyint(1) NOT NULL DEFAULT '0',
                                     `show_continue_watching` tinyint(1) NOT NULL DEFAULT '0',
                                     `background_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `shadow_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `primary_text_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `secondary_text_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `font_family` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `sales_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `button_sales_text` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `order` int DEFAULT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     `hasPublicMod` tinyint DEFAULT '0',
                                     PRIMARY KEY (`id`),
                                     KEY `plataforma_community_tenants_tenant_id_foreign` (`tenant_id`),
                                     CONSTRAINT `plataforma_community_tenants_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `community_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_user_info` (
                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                       `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `tenant_id` bigint unsigned NOT NULL,
                                       `score` int NOT NULL DEFAULT '0',
                                       `posts` int NOT NULL DEFAULT '0',
                                       `comments` int NOT NULL DEFAULT '0',
                                       `replies` int NOT NULL DEFAULT '0',
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL,
                                       `community_id` bigint unsigned DEFAULT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `plataforma_community_user_info_tenant_id_foreign` (`tenant_id`),
                                       KEY `community_user_info_user_id_foreign` (`user_id`),
                                       KEY `community_user_info_community_id_foreign` (`community_id`),
                                       CONSTRAINT `community_user_info_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `community_tenants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                       CONSTRAINT `community_user_info_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
                                       CONSTRAINT `plataforma_community_user_info_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=276439 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `complaint_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaint_post` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `denounced_tenant_id` bigint unsigned DEFAULT NULL,
                                  `post_id` bigint unsigned DEFAULT NULL,
                                  `author_user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                  `denounced_user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                  `author_tenant_id` bigint unsigned DEFAULT NULL,
                                  `motivation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
                                  `resolved` tinyint(1) NOT NULL DEFAULT '0',
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `plataforma_complaint_post_denounced_tenant_id_foreign` (`denounced_tenant_id`),
                                  KEY `plataforma_complaint_post_author_tenant_id_foreign` (`author_tenant_id`),
                                  KEY `plataforma_complaint_post_denounced_user_id_foreign` (`denounced_user_id`),
                                  KEY `plataforma_complaint_post_author_user_id_foreign` (`author_user_id`),
                                  KEY `plataforma_complaint_post_post_id_foreign` (`post_id`),
                                  CONSTRAINT `plataforma_complaint_post_author_tenant_id_foreign` FOREIGN KEY (`author_tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                                  CONSTRAINT `plataforma_complaint_post_author_user_id_foreign` FOREIGN KEY (`author_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
                                  CONSTRAINT `plataforma_complaint_post_denounced_tenant_id_foreign` FOREIGN KEY (`denounced_tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                                  CONSTRAINT `plataforma_complaint_post_denounced_user_id_foreign` FOREIGN KEY (`denounced_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
                                  CONSTRAINT `plataforma_complaint_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `community_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `config_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_players` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `tenant_id` bigint unsigned NOT NULL,
                                  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `cor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                  `control_velocity` tinyint(1) NOT NULL DEFAULT '1',
                                  `fullscreen` tinyint(1) NOT NULL DEFAULT '1',
                                  `miniature` tinyint(1) NOT NULL DEFAULT '1',
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `config_players_tenant_id_foreign` (`tenant_id`),
                                  KEY `config_players_user_id_foreign` (`user_id`),
                                  CONSTRAINT `config_players_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                                  CONSTRAINT `config_players_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `custom_html_embeddables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_html_embeddables` (
                                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                           `custom_html_id` bigint unsigned NOT NULL,
                                           `embeddable_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `embeddable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `created_at` timestamp NULL DEFAULT NULL,
                                           `updated_at` timestamp NULL DEFAULT NULL,
                                           PRIMARY KEY (`id`),
                                           KEY `custom_html_embeddables_custom_html_id_foreign` (`custom_html_id`),
                                           CONSTRAINT `custom_html_embeddables_custom_html_id_foreign` FOREIGN KEY (`custom_html_id`) REFERENCES `custom_htmls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `custom_htmls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_htmls` (
                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                `tenant_id` bigint unsigned NOT NULL,
                                `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                `platform_page` enum('homepage','course','module','lesson','community','favorite','product','profile','search') COLLATE utf8mb4_unicode_ci NOT NULL,
                                `page` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                KEY `plataforma_custom_htmls_tenant_id_foreign` (`tenant_id`),
                                CONSTRAINT `plataforma_custom_htmls_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=525 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `custom_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_links` (
                                `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `tenant_id` bigint unsigned NOT NULL,
                                `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `order` int DEFAULT NULL,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL,
                                `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'header',
                                PRIMARY KEY (`id`),
                                KEY `custom_links_tenant_id_foreign` (`tenant_id`),
                                CONSTRAINT `custom_links_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `deliverable_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverable_classes` (
                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                       `deliverable_module_id` bigint unsigned DEFAULT NULL,
                                       `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `module_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `course_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `class_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `blocked` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `release_date` datetime DEFAULT NULL,
                                       `wait_days` int unsigned DEFAULT NULL,
                                       `upsell_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `upsell_text` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL,
                                       `deleted_at` timestamp NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `plataforma_deliverable_classes_product_id_foreign` (`product_id`),
                                       KEY `plataforma_deliverable_classes_module_id_foreign` (`module_id`),
                                       KEY `plataforma_deliverable_classes_course_id_foreign` (`course_id`),
                                       KEY `deliverable_classes_deliverable_module_id_foreign` (`deliverable_module_id`),
                                       KEY `deliverable_classes_class_id_index` (`class_id`),
                                       CONSTRAINT `deliverable_classes_deliverable_module_id_foreign` FOREIGN KEY (`deliverable_module_id`) REFERENCES `deliverable_modules` (`id`) ON DELETE CASCADE,
                                       CONSTRAINT `plataforma_deliverable_classes_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `ead_classes` (`id`) ON DELETE CASCADE,
                                       CONSTRAINT `plataforma_deliverable_classes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `ead_courses` (`id`) ON DELETE CASCADE,
                                       CONSTRAINT `plataforma_deliverable_classes_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `ead_modules` (`id`) ON DELETE CASCADE,
                                       CONSTRAINT `plataforma_deliverable_classes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=631892 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `deliverable_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverable_files` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `plataforma_deliverable_files_product_id_foreign` (`product_id`),
                                     CONSTRAINT `plataforma_deliverable_files_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `deliverable_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverable_modules` (
                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                       `deliverable_course_id` bigint unsigned DEFAULT NULL,
                                       `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `module_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `course_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `blocked` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `release_date` datetime DEFAULT NULL,
                                       `wait_days` int unsigned DEFAULT NULL,
                                       `upsell_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `upsell_text` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `plataforma_deliverable_modules_product_id_foreign` (`product_id`),
                                       KEY `plataforma_deliverable_modules_course_id_foreign` (`course_id`),
                                       KEY `deliverable_modules_deliverable_course_id_foreign` (`deliverable_course_id`),
                                       KEY `deliverable_modules_module_id_index` (`module_id`),
                                       CONSTRAINT `deliverable_modules_deliverable_course_id_foreign` FOREIGN KEY (`deliverable_course_id`) REFERENCES `ead_class_module_subscription` (`id`) ON DELETE CASCADE,
                                       CONSTRAINT `plataforma_deliverable_modules_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `ead_courses` (`id`) ON DELETE CASCADE,
                                       CONSTRAINT `plataforma_deliverable_modules_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `ead_modules` (`id`) ON DELETE CASCADE,
                                       CONSTRAINT `plataforma_deliverable_modules_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106554 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `deliverable_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverable_platform` (
                                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                        `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `tenant_id` bigint unsigned NOT NULL,
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL,
                                        PRIMARY KEY (`id`),
                                        KEY `deliverable_platform_product_id_foreign` (`product_id`),
                                        KEY `deliverable_platform_tenant_id_foreign` (`tenant_id`),
                                        CONSTRAINT `deliverable_platform_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE,
                                        CONSTRAINT `deliverable_platform_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8294 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `devices_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devices_tokens` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `tenant_id` bigint unsigned NOT NULL,
                                  `device_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `device_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `plataforma_device_token_tenant_id_foreign` (`tenant_id`),
                                  KEY `devices_tokens_user_id_foreign` (`user_id`),
                                  CONSTRAINT `devices_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
                                  CONSTRAINT `plataforma_device_token_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2779 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `dynamic_marquee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dynamic_marquee` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `text` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `timer` int NOT NULL,
                                   `tenant_id` bigint unsigned NOT NULL,
                                   `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `dynamic_marquee_tenant_id_foreign` (`tenant_id`),
                                   KEY `dynamic_marquee_product_id_foreign` (`product_id`),
                                   CONSTRAINT `dynamic_marquee_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                   CONSTRAINT `dynamic_marquee_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ead_banner_customs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ead_banner_customs` (
                                      `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                      `tenant_id` bigint unsigned NOT NULL,
                                      `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `category` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `url_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `url_image_vertical` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `url_video` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `url_primary` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `url_secondary` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `url_video_vertical` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `size_text_button` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `size_headline` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `size_subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `size_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `weight_text_button` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `weight_headline` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `weight_subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `font_button` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `font_headline` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `font_subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `font_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `video_playing_time` int DEFAULT NULL,
                                      `text_button` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `headline_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `weight_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL,
                                      `order` int DEFAULT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `ead_banner_customs_tenant_id_foreign` (`tenant_id`),
                                      CONSTRAINT `ead_banner_customs_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4698 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ead_certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ead_certificates` (
                                    `id` int unsigned NOT NULL AUTO_INCREMENT,
                                    `tenant_id` bigint unsigned NOT NULL,
                                    `course_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `certificate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `show` int DEFAULT NULL,
                                    `created_at` timestamp NULL DEFAULT NULL,
                                    `updated_at` timestamp NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`),
                                    KEY `ead_certificates_tenant_id_foreign` (`tenant_id`),
                                    KEY `ead_certificates_course_id_foreign` (`course_id`),
                                    CONSTRAINT `ead_certificates_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `ead_courses` (`id`) ON DELETE CASCADE,
                                    CONSTRAINT `ead_certificates_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1758 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ead_certificates_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ead_certificates_users` (
                                          `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `tenant_id` bigint unsigned NOT NULL,
                                          `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `certificate_id` int unsigned NOT NULL,
                                          `course_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL,
                                          PRIMARY KEY (`id`),
                                          KEY `ead_certificates_users_tenant_id_foreign` (`tenant_id`),
                                          KEY `ead_certificates_users_user_id_foreign` (`user_id`),
                                          KEY `ead_certificates_users_certificate_id_foreign` (`certificate_id`),
                                          CONSTRAINT `ead_certificates_users_certificate_id_foreign` FOREIGN KEY (`certificate_id`) REFERENCES `ead_certificates` (`id`) ON DELETE CASCADE,
                                          CONSTRAINT `ead_certificates_users_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                                          CONSTRAINT `ead_certificates_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ead_class_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ead_class_comments` (
                                      `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `comment_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `tenant_id` bigint unsigned NOT NULL,
                                      `message_type` tinyint(1) NOT NULL DEFAULT '0',
                                      `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `class_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL,
                                      `deleted_at` timestamp NULL DEFAULT NULL,
                                      `read` tinyint(1) NOT NULL DEFAULT '0',
                                      `approved` tinyint(1) NOT NULL DEFAULT '0',
                                      PRIMARY KEY (`id`),
                                      KEY `ead_class_comments_tenant_id_foreign` (`tenant_id`),
                                      KEY `ead_class_comments_user_id_foreign` (`user_id`),
                                      KEY `ead_class_comments_class_id_foreign` (`class_id`),
                                      KEY `ead_class_comments_comment_id` (`comment_id`) USING BTREE,
                                      CONSTRAINT `ead_class_comments_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `ead_classes` (`id`) ON DELETE CASCADE,
                                      CONSTRAINT `ead_class_comments_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                                      CONSTRAINT `ead_class_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ead_class_module_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ead_class_module_subscription` (
                                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                 `tenant_id` bigint unsigned DEFAULT NULL,
                                                 `deliverable_id` bigint unsigned DEFAULT NULL,
                                                 `package_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                 `course_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                                 `module_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
                                                 `class_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '(DC2Type:guid)',
                                                 `blocked` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                                 `release_date` datetime DEFAULT NULL,
                                                 `wait_days` int DEFAULT NULL,
                                                 `upsell_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                                 `upsell_text` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                                 `created_at` timestamp NULL DEFAULT NULL,
                                                 `updated_at` timestamp NULL DEFAULT NULL,
                                                 PRIMARY KEY (`id`),
                                                 KEY `ead_class_module_subscription_tenant_id_foreign` (`tenant_id`),
                                                 KEY `ead_class_module_subscription_package_id_foreign` (`package_id`),
                                                 KEY `ead_class_module_subscription_module_id_foreign` (`module_id`),
                                                 KEY `ead_class_module_subscription_course_id_foreign` (`course_id`),
                                                 KEY `plataforma_ead_class_module_subscription_deliverable_id_foreign` (`deliverable_id`),
                                                 CONSTRAINT `ead_class_module_subscription_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `ead_courses` (`id`) ON DELETE CASCADE,
                                                 CONSTRAINT `ead_class_module_subscription_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `ead_modules` (`id`) ON DELETE CASCADE,
                                                 CONSTRAINT `ead_class_module_subscription_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE,
                                                 CONSTRAINT `ead_class_module_subscription_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                                                 CONSTRAINT `plataforma_ead_class_module_subscription_deliverable_id_foreign` FOREIGN KEY (`deliverable_id`) REFERENCES `deliverable_platform` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111926 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ead_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ead_classes` (
                               `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `module_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                               `text_upsell` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_upsell` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `status` tinyint(1) NOT NULL DEFAULT '1',
                               `blocked` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `published` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `release_date` datetime DEFAULT NULL,
                               `wait_days` int DEFAULT NULL,
                               `url_video` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_video_s3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `url_banner` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_thumb` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `url_ebook` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                               `host` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'vimeo',
                               `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `url_external` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_image_free` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_image_square` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_image_triangle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_image_circle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `time_total` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `created_at` timestamp NULL DEFAULT NULL,
                               `order` int DEFAULT '0',
                               `quiz_id` bigint unsigned DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL,
                               `tenant_id` bigint unsigned DEFAULT NULL,
                               `template_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `ead_classes_module_id_foreign` (`module_id`),
                               KEY `ead_classes_quiz_id_foreign` (`quiz_id`),
                               KEY `ead_classes_course_id_foreign` (`course_id`),
                               CONSTRAINT `ead_classes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `ead_courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                               CONSTRAINT `ead_classes_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `ead_modules` (`id`) ON DELETE CASCADE,
                               CONSTRAINT `ead_classes_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ead_classes_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ead_classes_histories` (
                                         `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `tenant_id` bigint unsigned NOT NULL,
                                         `course_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `module_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `class_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `time` time DEFAULT NULL,
                                         `time_total` time DEFAULT NULL,
                                         `rate_up` tinyint(1) DEFAULT NULL,
                                         `to_total` int DEFAULT NULL,
                                         `finished` tinyint(1) NOT NULL DEFAULT '0',
                                         `created_at` timestamp NULL DEFAULT NULL,
                                         `updated_at` timestamp NULL DEFAULT NULL,
                                         PRIMARY KEY (`id`),
                                         KEY `ead_classes_histories_module_id_foreign` (`module_id`),
                                         KEY `ead_classes_histories_class_id_foreign` (`class_id`),
                                         KEY `ead_classes_histories_tenant_id_foreign` (`tenant_id`),
                                         KEY `ead_classes_histories_user_id_foreign` (`user_id`),
                                         KEY `ead_classes_histories_course_id_foreign` (`course_id`),
                                         CONSTRAINT `ead_classes_histories_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `ead_classes` (`id`) ON DELETE CASCADE,
                                         CONSTRAINT `ead_classes_histories_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `ead_courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                         CONSTRAINT `ead_classes_histories_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `ead_modules` (`id`) ON DELETE CASCADE,
                                         CONSTRAINT `ead_classes_histories_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                                         CONSTRAINT `ead_classes_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ead_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ead_courses` (
                               `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `tenant_id` bigint unsigned NOT NULL,
                               `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `status` tinyint(1) NOT NULL,
                               `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                               `url_upsell` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `text_upsell` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `blocked` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `published` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `release_date` datetime DEFAULT NULL,
                               `wait_days` int DEFAULT NULL,
                               `url_cover_retangulo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_cover_vertical` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `view_mode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_image_free` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_image_square` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_image_triangle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_image_circle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `certificado_progress` tinyint(1) DEFAULT NULL,
                               `certificado_publich` tinyint(1) DEFAULT NULL,
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `ead_courses_tenant_id_foreign` (`tenant_id`),
                               CONSTRAINT `ead_courses_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ead_courses_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ead_courses_histories` (
                                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                         `tenant_id` bigint unsigned NOT NULL,
                                         `course_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `finished` tinyint(1) NOT NULL DEFAULT '1',
                                         `created_at` timestamp NULL DEFAULT NULL,
                                         `updated_at` timestamp NULL DEFAULT NULL,
                                         PRIMARY KEY (`id`),
                                         KEY `plataforma_gamification_courses_historical_tenant_id_foreign` (`tenant_id`),
                                         KEY `ead_courses_histories_course_id_foreign` (`course_id`),
                                         KEY `ead_courses_histories_user_id_foreign` (`user_id`),
                                         CONSTRAINT `ead_courses_histories_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `ead_courses` (`id`) ON DELETE CASCADE,
                                         CONSTRAINT `ead_courses_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
                                         CONSTRAINT `plataforma_gamification_courses_historical_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80272 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ead_ebooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ead_ebooks` (
                              `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                              `tenant_id` bigint unsigned NOT NULL,
                              `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                              `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                              `url_book_cover` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                              `url_s3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                              `published` tinyint(1) NOT NULL DEFAULT '0',
                              `size` decimal(20,6) DEFAULT NULL,
                              `created_at` timestamp NULL DEFAULT NULL,
                              `updated_at` timestamp NULL DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              KEY `ead_ebooks_tenant_id_foreign` (`tenant_id`),
                              CONSTRAINT `ead_ebooks_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ead_linked_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ead_linked_courses` (
                                      `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `tenant_id` bigint unsigned NOT NULL,
                                      `course_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `package_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `ead_class_module_subscription_id` bigint DEFAULT NULL,
                                      `blocked` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `release_date` datetime DEFAULT NULL,
                                      `wait_days` int DEFAULT NULL,
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `ead_linked_courses_user_id_foreign` (`user_id`),
                                      KEY `ead_linked_courses_package_id_foreign` (`package_id`),
                                      KEY `ead_linked_courses_course_id_foreign` (`course_id`),
                                      KEY `ead_linked_courses_tenant_id_foreign` (`tenant_id`),
                                      CONSTRAINT `ead_linked_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `ead_courses` (`id`) ON DELETE CASCADE,
                                      CONSTRAINT `ead_linked_courses_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE,
                                      CONSTRAINT `ead_linked_courses_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                                      CONSTRAINT `ead_linked_courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ead_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ead_modules` (
                               `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `course_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `tenant_id` bigint unsigned NOT NULL,
                               `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                               `text_upsell` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_upsell` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_video` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_cover_vertical` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `url_cover_retangulo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `view_mode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'normal',
                               `url_image_free` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_image_square` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_image_triangle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `url_image_circle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `blocked` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `published` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `wait_days` int DEFAULT NULL,
                               `release_date` datetime DEFAULT NULL,
                               `order` int DEFAULT '0',
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `ead_modules_course_id_foreign` (`course_id`),
                               KEY `ead_modules_tenant_id_foreign` (`tenant_id`),
                               CONSTRAINT `ead_modules_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `ead_courses` (`id`) ON DELETE CASCADE,
                               CONSTRAINT `ead_modules_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ead_modules_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ead_modules_histories` (
                                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                         `tenant_id` bigint unsigned NOT NULL,
                                         `module_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `finished` tinyint(1) NOT NULL DEFAULT '1',
                                         `created_at` timestamp NULL DEFAULT NULL,
                                         `updated_at` timestamp NULL DEFAULT NULL,
                                         PRIMARY KEY (`id`),
                                         KEY `plataforma_gamification_modules_historical_tenant_id_foreign` (`tenant_id`),
                                         KEY `ead_modules_histories_module_id_foreign` (`module_id`),
                                         KEY `ead_modules_histories_user_id_foreign` (`user_id`),
                                         CONSTRAINT `ead_modules_histories_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `ead_modules` (`id`) ON DELETE CASCADE,
                                         CONSTRAINT `ead_modules_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
                                         CONSTRAINT `plataforma_gamification_modules_historical_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=417048 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ead_my_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ead_my_list` (
                               `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                               `tenant_id` bigint unsigned NOT NULL,
                               `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `class_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `module_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `ead_my_list_tenant_id_foreign` (`tenant_id`),
                               KEY `ead_my_list_user_id_foreign` (`user_id`),
                               KEY `ead_my_list_class_id_foreign` (`class_id`),
                               KEY `ead_my_list_module_id_foreign` (`module_id`),
                               CONSTRAINT `ead_my_list_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `ead_classes` (`id`) ON DELETE CASCADE,
                               CONSTRAINT `ead_my_list_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `ead_modules` (`id`) ON DELETE CASCADE,
                               CONSTRAINT `ead_my_list_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                               CONSTRAINT `ead_my_list_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=422111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ead_ranking_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ead_ranking_general` (
                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                       `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `points` int NOT NULL,
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `ead_ranking_general_user_id_foreign` (`user_id`),
                                       CONSTRAINT `ead_ranking_general_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=916273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ead_subscription_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ead_subscription_package` (
                                            `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                            `tenant_id` bigint unsigned DEFAULT NULL,
                                            `organization_id` bigint unsigned DEFAULT NULL,
                                            `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                            `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                                            `type` enum('Venda única','Recorrente') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                            `checkout` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                            `checkout_id` bigint unsigned DEFAULT NULL,
                                            `sales_page_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                            `period` int DEFAULT NULL,
                                            `value` decimal(10,2) DEFAULT NULL,
                                            `trial` int DEFAULT NULL,
                                            `product_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                            `support_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                            `image_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                            `timer` tinyint(1) NOT NULL DEFAULT '0',
                                            `salesInSite` int DEFAULT NULL,
                                            `typePaymentPlan` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                            `sugestionPurchaseIdPlan` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                            `plan_iugu_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                            `form_of_payment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                            `qtd_parcelas` int DEFAULT NULL,
                                            `pix` tinyint(1) DEFAULT '0',
                                            `lifetime` tinyint(1) DEFAULT NULL,
                                            `boleto` tinyint(1) DEFAULT '0',
                                            `reimbursement` int DEFAULT NULL,
                                            `limit_cobrancas` int DEFAULT NULL,
                                            `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                            `checkout_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                            `external_checkout_product` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                            `upsell` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                            `upsell_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                            `pixel_tiktok_event_when_generate_bank_slip` tinyint(1) DEFAULT NULL,
                                            `pixel_tiktok_custom_conversion_value` int DEFAULT NULL,
                                            `pixel_facebook_event_when_generate_bank_slip` tinyint(1) DEFAULT NULL,
                                            `pixel_facebook_custom_conversion_value` int DEFAULT NULL,
                                            `solicitation_date` timestamp NULL DEFAULT NULL,
                                            `interval_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                            `interval` int DEFAULT NULL,
                                            `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                            `sub_account_id` bigint unsigned DEFAULT NULL,
                                            `created_at` timestamp NULL DEFAULT NULL,
                                            `updated_at` timestamp NULL DEFAULT NULL,
                                            PRIMARY KEY (`id`),
                                            KEY `ead_subscription_package_tenant_id_foreign` (`tenant_id`),
                                            KEY `ead_subscription_package_sub_account_id_foreign` (`sub_account_id`),
                                            KEY `ead_subscription_package_user_id_foreign` (`user_id`),
                                            KEY `ead_subscription_package_organization_id_foreign` (`organization_id`),
                                            KEY `ead_subscription_package_checkout_id_foreign` (`checkout_id`),
                                            CONSTRAINT `ead_subscription_package_checkout_id_foreign` FOREIGN KEY (`checkout_id`) REFERENCES `checkouts_available` (`id`),
                                            CONSTRAINT `ead_subscription_package_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `master`.`organizations` (`id`) ON DELETE CASCADE,
                                            CONSTRAINT `ead_subscription_package_sub_account_id_foreign` FOREIGN KEY (`sub_account_id`) REFERENCES `master`.`sub_account` (`id`) ON DELETE CASCADE,
                                            CONSTRAINT `ead_subscription_package_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                                            CONSTRAINT `ead_subscription_package_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ead_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ead_videos` (
                              `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                              `tenant_id` bigint unsigned NOT NULL,
                              `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                              `encoded_video_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                              `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                              `select` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                              `size` decimal(20,6) DEFAULT NULL,
                              `created_at` timestamp NULL DEFAULT NULL,
                              `updated_at` timestamp NULL DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              KEY `ead_videos_tenant_id_foreign` (`tenant_id`),
                              CONSTRAINT `ead_videos_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `gamification_cm_cmt_likes_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamification_cm_cmt_likes_hist` (
                                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                  `community_id` bigint unsigned NOT NULL,
                                                  `tenant_id` bigint unsigned NOT NULL,
                                                  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                  `comment_id` bigint unsigned NOT NULL,
                                                  `created_at` timestamp NULL DEFAULT NULL,
                                                  `updated_at` timestamp NULL DEFAULT NULL,
                                                  PRIMARY KEY (`id`),
                                                  KEY `gamification_cm_cmt_likes_hist_community_id_foreign` (`community_id`),
                                                  KEY `gamification_cm_cmt_likes_hist_comment_id_foreign` (`comment_id`),
                                                  KEY `plataforma_gamification_cm_cmt_likes_hist_tenant_id_foreign` (`tenant_id`),
                                                  KEY `gamification_cm_cmt_likes_hist_user_id_foreign` (`user_id`),
                                                  CONSTRAINT `gamification_cm_cmt_likes_hist_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `community_comments` (`id`) ON DELETE CASCADE,
                                                  CONSTRAINT `gamification_cm_cmt_likes_hist_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `community_tenants` (`id`) ON DELETE CASCADE,
                                                  CONSTRAINT `gamification_cm_cmt_likes_hist_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
                                                  CONSTRAINT `plataforma_gamification_cm_cmt_likes_hist_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=266085 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `gamification_cm_comments_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamification_cm_comments_hist` (
                                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                 `community_id` bigint unsigned NOT NULL,
                                                 `tenant_id` bigint unsigned NOT NULL,
                                                 `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                 `post_id` bigint unsigned NOT NULL,
                                                 `created_at` timestamp NULL DEFAULT NULL,
                                                 `updated_at` timestamp NULL DEFAULT NULL,
                                                 PRIMARY KEY (`id`),
                                                 KEY `plataforma_gamification_cm_comments_hist_tenant_id_foreign` (`tenant_id`),
                                                 KEY `gamification_cm_comments_hist_community_id_foreign` (`community_id`),
                                                 KEY `gamification_cm_comments_hist_post_id_foreign` (`post_id`),
                                                 KEY `gamification_cm_comments_hist_user_id_foreign` (`user_id`),
                                                 CONSTRAINT `gamification_cm_comments_hist_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `community_tenants` (`id`) ON DELETE CASCADE,
                                                 CONSTRAINT `gamification_cm_comments_hist_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `community_posts` (`id`) ON DELETE CASCADE,
                                                 CONSTRAINT `gamification_cm_comments_hist_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
                                                 CONSTRAINT `plataforma_gamification_cm_comments_hist_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `gamification_cm_post_likes_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamification_cm_post_likes_hist` (
                                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                   `community_id` bigint unsigned NOT NULL,
                                                   `tenant_id` bigint unsigned NOT NULL,
                                                   `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                                   `post_id` bigint unsigned NOT NULL,
                                                   `created_at` timestamp NULL DEFAULT NULL,
                                                   `updated_at` timestamp NULL DEFAULT NULL,
                                                   PRIMARY KEY (`id`),
                                                   KEY `plataforma_gamification_cm_post_likes_hist_tenant_id_foreign` (`tenant_id`),
                                                   KEY `plataforma_gamification_cm_post_likes_hist_user_id_foreign` (`user_id`),
                                                   KEY `gamification_cm_post_likes_hist_community_id_foreign` (`community_id`),
                                                   KEY `gamification_cm_post_likes_hist_post_id_foreign` (`post_id`),
                                                   CONSTRAINT `gamification_cm_post_likes_hist_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `community_tenants` (`id`) ON DELETE CASCADE,
                                                   CONSTRAINT `gamification_cm_post_likes_hist_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `community_posts` (`id`) ON DELETE CASCADE,
                                                   CONSTRAINT `plataforma_gamification_cm_post_likes_hist_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`),
                                                   CONSTRAINT `plataforma_gamification_cm_post_likes_hist_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=303143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `gamification_cm_rep_likes_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamification_cm_rep_likes_hist` (
                                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                  `community_id` bigint unsigned NOT NULL,
                                                  `tenant_id` bigint unsigned NOT NULL,
                                                  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                  `reply_id` bigint unsigned NOT NULL,
                                                  `created_at` timestamp NULL DEFAULT NULL,
                                                  `updated_at` timestamp NULL DEFAULT NULL,
                                                  PRIMARY KEY (`id`),
                                                  KEY `plataforma_gamification_cm_rep_likes_hist_tenant_id_foreign` (`tenant_id`),
                                                  KEY `plataforma_gamification_cm_rep_likes_hist_user_id_foreign` (`user_id`),
                                                  KEY `gamification_cm_rep_likes_hist_community_id_foreign` (`community_id`),
                                                  KEY `gamification_cm_rep_likes_hist_reply_id_foreign` (`reply_id`),
                                                  CONSTRAINT `gamification_cm_rep_likes_hist_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `community_tenants` (`id`) ON DELETE CASCADE,
                                                  CONSTRAINT `gamification_cm_rep_likes_hist_reply_id_foreign` FOREIGN KEY (`reply_id`) REFERENCES `community_replies` (`id`) ON DELETE CASCADE,
                                                  CONSTRAINT `plataforma_gamification_cm_rep_likes_hist_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`),
                                                  CONSTRAINT `plataforma_gamification_cm_rep_likes_hist_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `gamification_cm_replies_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamification_cm_replies_hist` (
                                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                `community_id` bigint unsigned NOT NULL,
                                                `tenant_id` bigint unsigned NOT NULL,
                                                `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                `comment_id` bigint unsigned NOT NULL,
                                                `created_at` timestamp NULL DEFAULT NULL,
                                                `updated_at` timestamp NULL DEFAULT NULL,
                                                PRIMARY KEY (`id`),
                                                KEY `plataforma_gamification_cm_replies_hist_tenant_id_foreign` (`tenant_id`),
                                                KEY `plataforma_gamification_cm_replies_hist_user_id_foreign` (`user_id`),
                                                KEY `gamification_cm_replies_hist_community_id_foreign` (`community_id`),
                                                KEY `gamification_cm_replies_hist_comment_id_foreign` (`comment_id`),
                                                CONSTRAINT `gamification_cm_replies_hist_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `community_comments` (`id`) ON DELETE CASCADE,
                                                CONSTRAINT `gamification_cm_replies_hist_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `community_tenants` (`id`) ON DELETE CASCADE,
                                                CONSTRAINT `plataforma_gamification_cm_replies_hist_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`),
                                                CONSTRAINT `plataforma_gamification_cm_replies_hist_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105661 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `gamification_permissions_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamification_permissions_plans` (
                                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                  `tenant_id` bigint unsigned NOT NULL,
                                                  `plan_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                  `created_at` timestamp NULL DEFAULT NULL,
                                                  `updated_at` timestamp NULL DEFAULT NULL,
                                                  PRIMARY KEY (`id`),
                                                  KEY `plataforma_gamification_permissions_plans_plan_id_foreign` (`plan_id`),
                                                  KEY `plataforma_gamification_permissions_plans_tenant_id_foreign` (`tenant_id`),
                                                  CONSTRAINT `plataforma_gamification_permissions_plans_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE,
                                                  CONSTRAINT `plataforma_gamification_permissions_plans_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1032 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `gamification_pl_comments_historical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamification_pl_comments_historical` (
                                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                       `tenant_id` bigint unsigned NOT NULL,
                                                       `class_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                       `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                       `created_at` timestamp NULL DEFAULT NULL,
                                                       `updated_at` timestamp NULL DEFAULT NULL,
                                                       PRIMARY KEY (`id`),
                                                       KEY `plataforma_gamification_pl_comments_historical_tenant_id_foreign` (`tenant_id`),
                                                       KEY `gamification_pl_comments_historical_class_id_foreign` (`class_id`),
                                                       KEY `gamification_pl_comments_historical_user_id_foreign` (`user_id`),
                                                       CONSTRAINT `gamification_pl_comments_historical_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `ead_classes` (`id`) ON DELETE CASCADE,
                                                       CONSTRAINT `gamification_pl_comments_historical_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
                                                       CONSTRAINT `plataforma_gamification_pl_comments_historical_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85548 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `gamification_pl_likes_historical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamification_pl_likes_historical` (
                                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                    `tenant_id` bigint unsigned NOT NULL,
                                                    `class_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                    `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                    `created_at` timestamp NULL DEFAULT NULL,
                                                    `updated_at` timestamp NULL DEFAULT NULL,
                                                    PRIMARY KEY (`id`),
                                                    KEY `plataforma_gamification_pl_likes_historical_tenant_id_foreign` (`tenant_id`),
                                                    KEY `gamification_pl_likes_historical_class_id_foreign` (`class_id`),
                                                    KEY `gamification_pl_likes_historical_user_id_foreign` (`user_id`),
                                                    CONSTRAINT `gamification_pl_likes_historical_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `ead_classes` (`id`) ON DELETE CASCADE,
                                                    CONSTRAINT `gamification_pl_likes_historical_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
                                                    CONSTRAINT `plataforma_gamification_pl_likes_historical_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=710444 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `invoices_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices_attempts` (
                                     `id` int unsigned NOT NULL AUTO_INCREMENT,
                                     `tenant_id` bigint unsigned NOT NULL,
                                     `iugu_invoice_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `subscription_id` bigint unsigned NOT NULL,
                                     `date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `invoices_attempts_subscription_id_foreign` (`subscription_id`),
                                     KEY `invoices_attempts_tenant_id_foreign` (`tenant_id`),
                                     CONSTRAINT `invoices_attempts_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `user_subscription` (`id`) ON DELETE CASCADE,
                                     CONSTRAINT `invoices_attempts_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
                            `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                            `word` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `word_spanish` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `word_english` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `tenant_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `language_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_config` (
                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                   `active` tinyint(1) DEFAULT '0',
                                   `default` tinyint(1) DEFAULT '0',
                                   `current_language` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `tenant_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `language_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_user` (
                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                 `language_default` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `tenant_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `plataforma_language_user_user_id_foreign` (`user_id`),
                                 CONSTRAINT `plataforma_language_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materials` (
                             `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                             `tenant_id` bigint unsigned NOT NULL,
                             `class_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                             `module_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                             `material_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `material_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             KEY `materials_tenant_id_foreign` (`tenant_id`),
                             KEY `materials_class_id_foreign` (`class_id`),
                             KEY `materials_module_id_foreign` (`module_id`),
                             CONSTRAINT `materials_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `ead_classes` (`id`) ON DELETE CASCADE,
                             CONSTRAINT `materials_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `ead_modules` (`id`) ON DELETE CASCADE,
                             CONSTRAINT `materials_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `metrics_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_progress` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `tenant_id` bigint unsigned NOT NULL,
                                    `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                                    `created_at` timestamp NULL DEFAULT NULL,
                                    `updated_at` timestamp NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=662 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `notes_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes_classes` (
                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                 `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `note` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `class_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `notes_classes_class_id_foreign` (`class_id`),
                                 KEY `notes_classes_user_id_foreign` (`user_id`),
                                 CONSTRAINT `notes_classes_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `ead_classes` (`id`),
                                 CONSTRAINT `notes_classes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `offers_frequent_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_frequent_payment` (
                                           `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `price` decimal(10,2) DEFAULT NULL,
                                           `period` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'frequent_payment_offer',
                                           `refund_days` int NOT NULL,
                                           `unlimited_payment` tinyint(1) NOT NULL DEFAULT '0',
                                           `payment_limit` int DEFAULT NULL,
                                           `enable_trial_period` tinyint(1) NOT NULL DEFAULT '0',
                                           `trial_days` int DEFAULT NULL,
                                           `enable_entry_fee` tinyint(1) NOT NULL DEFAULT '0',
                                           `entry_fee_value` double DEFAULT NULL,
                                           `invoice_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `payable_by_credit_card` tinyint(1) NOT NULL DEFAULT '0',
                                           `payable_by_pix` tinyint(1) NOT NULL DEFAULT '0',
                                           `payable_by_bank_slip` tinyint(1) NOT NULL DEFAULT '0',
                                           `two_credit_card_payment` tinyint(1) NOT NULL DEFAULT '0',
                                           `confirmation_email` tinyint(1) NOT NULL DEFAULT '0',
                                           `bank_slip_expiration_days` int DEFAULT NULL,
                                           `created_at` timestamp NULL DEFAULT NULL,
                                           `updated_at` timestamp NULL DEFAULT NULL,
                                           PRIMARY KEY (`id`),
                                           KEY `offers_frequent_payment_product_id_foreign` (`product_id`),
                                           CONSTRAINT `offers_frequent_payment_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `order_bump`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_bump` (
                              `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                              `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                              `origin_product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                              `offer_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                              `offer_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                              `call_to_action` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                              `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                              `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                              `order` int DEFAULT NULL,
                              `show_img` tinyint(1) NOT NULL DEFAULT '0',
                              `img_one` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                              `img_two` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                              `created_at` timestamp NULL DEFAULT NULL,
                              `updated_at` timestamp NULL DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              KEY `order_bump_product_id_foreign` (`product_id`),
                              KEY `order_bump_origin_product_id_foreign` (`origin_product_id`),
                              CONSTRAINT `order_bump_origin_product_id_foreign` FOREIGN KEY (`origin_product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE,
                              CONSTRAINT `order_bump_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
                          `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                          `tenant_id` bigint unsigned NOT NULL,
                          `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                          `user_subscription_id` bigint unsigned NOT NULL,
                          `iugu_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          `iugu_payment_method_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          `iugu_invoice_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          `iugu_invoice_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          `iugu_assinatura_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          `iugu_qtd_installments` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          `iugu_assinatura_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          `type_payment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          `created_at` timestamp NULL DEFAULT NULL,
                          `updated_at` timestamp NULL DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          KEY `plataforma_orders_tenant_id_foreign` (`tenant_id`),
                          KEY `plataforma_orders_user_id_foreign` (`user_id`),
                          KEY `plataforma_orders_user_subscription_id_foreign` (`user_subscription_id`),
                          CONSTRAINT `plataforma_orders_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                          CONSTRAINT `plataforma_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
                          CONSTRAINT `plataforma_orders_user_subscription_id_foreign` FOREIGN KEY (`user_subscription_id`) REFERENCES `user_subscription` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
                                   `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
                               `id` int unsigned NOT NULL AUTO_INCREMENT,
                               `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL,
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `platform_standard_score_ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_standard_score_ranking` (
                                                   `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                   `tenant_id` bigint unsigned NOT NULL,
                                                   `watch_class` int DEFAULT NULL,
                                                   `like_class` int DEFAULT NULL,
                                                   `comment_class` int DEFAULT NULL,
                                                   `finish_class` int DEFAULT NULL,
                                                   `finish_module` int DEFAULT NULL,
                                                   `finish_course` int DEFAULT NULL,
                                                   `login` int DEFAULT NULL,
                                                   `created_at` timestamp NULL DEFAULT NULL,
                                                   `updated_at` timestamp NULL DEFAULT NULL,
                                                   PRIMARY KEY (`id`),
                                                   KEY `plataforma_platform_standard_score_ranking_tenant_id_foreign` (`tenant_id`),
                                                   CONSTRAINT `plataforma_platform_standard_score_ranking_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `points_reward_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `points_reward_material` (
                                          `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                          `reward_id` bigint unsigned NOT NULL,
                                          `tenant_id` bigint unsigned NOT NULL,
                                          `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL,
                                          PRIMARY KEY (`id`),
                                          KEY `plataforma_points_reward_material_tenant_id_foreign` (`tenant_id`),
                                          KEY `points_reward_material_reward_id_foreign` (`reward_id`),
                                          CONSTRAINT `plataforma_points_reward_material_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`),
                                          CONSTRAINT `points_reward_material_reward_id_foreign` FOREIGN KEY (`reward_id`) REFERENCES `points_rewards` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `points_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `points_rewards` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `tenant_id` bigint unsigned NOT NULL,
                                  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                  `needed_score` int NOT NULL,
                                  `url_img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                  `links` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                                  `embed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                                  `animation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `plataforma_points_rewards_tenant_id_foreign` (`tenant_id`),
                                  CONSTRAINT `plataforma_points_rewards_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=672 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `points_rewards_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `points_rewards_history` (
                                          `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                          `reward_id` bigint unsigned NOT NULL,
                                          `tenant_id` bigint unsigned NOT NULL,
                                          `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL,
                                          PRIMARY KEY (`id`),
                                          KEY `plataforma_points_rewards_history_tenant_id_foreign` (`tenant_id`),
                                          KEY `points_rewards_history_reward_id_foreign` (`reward_id`),
                                          KEY `points_rewards_history_user_id_foreign` (`user_id`),
                                          CONSTRAINT `plataforma_points_rewards_history_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`),
                                          CONSTRAINT `points_rewards_history_reward_id_foreign` FOREIGN KEY (`reward_id`) REFERENCES `points_rewards` (`id`) ON DELETE CASCADE,
                                          CONSTRAINT `points_rewards_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1732 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `points_rewards_permissions_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `points_rewards_permissions_plans` (
                                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                    `reward_id` bigint unsigned NOT NULL,
                                                    `tenant_id` bigint unsigned NOT NULL,
                                                    `plan_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                    `created_at` timestamp NULL DEFAULT NULL,
                                                    `updated_at` timestamp NULL DEFAULT NULL,
                                                    PRIMARY KEY (`id`),
                                                    KEY `plataforma_points_rewards_permissions_plans_plan_id_foreign` (`plan_id`),
                                                    KEY `plataforma_points_rewards_permissions_plans_tenant_id_foreign` (`tenant_id`),
                                                    KEY `points_rewards_permissions_plans_reward_id_foreign` (`reward_id`),
                                                    CONSTRAINT `plataforma_points_rewards_permissions_plans_reward_id_foreign` FOREIGN KEY (`reward_id`) REFERENCES `points_rewards` (`id`) ON DELETE CASCADE,
                                                    CONSTRAINT `plataforma_points_rewards_permissions_plans_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                                                    CONSTRAINT `points_rewards_permissions_plans_reward_id_foreign` FOREIGN KEY (`reward_id`) REFERENCES `points_rewards` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1723 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `category_id` bigint unsigned NOT NULL,
                                    `created_at` timestamp NULL DEFAULT NULL,
                                    `updated_at` timestamp NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`),
                                    KEY `product_category_product_id_foreign` (`product_id`),
                                    CONSTRAINT `product_category_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `product_offers_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_offers_links` (
                                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                        `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `offer_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `checkout_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `offer_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `active` tinyint(1) NOT NULL DEFAULT '1',
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL,
                                        PRIMARY KEY (`id`),
                                        UNIQUE KEY `plataforma_product_offers_links_offer_id_checkout_id_unique` (`offer_id`,`checkout_id`),
                                        KEY `product_offers_links_checkout_id_foreign` (`checkout_id`),
                                        KEY `product_offers_links_product_id_foreign` (`product_id`),
                                        CONSTRAINT `product_offers_links_checkout_id_foreign` FOREIGN KEY (`checkout_id`) REFERENCES `checkouts` (`id`) ON DELETE CASCADE,
                                        CONSTRAINT `product_offers_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
                            `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                            `tenant_id` bigint unsigned NOT NULL,
                            `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                            `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                            `checkout` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `sales_page_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `price` double(8,2) NOT NULL,
                            `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                            `image_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `support_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
                            `upsell` tinyint(1) DEFAULT NULL,
                            `upsell_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `pixel_tiktok_event_when_generate_bank_slip` tinyint(1) NOT NULL DEFAULT '0',
                            `pixel_tiktok_custom_conversion_value` int DEFAULT NULL,
                            `pixel_facebook_event_when_generate_bank_slip` tinyint(1) NOT NULL DEFAULT '0',
                            `pixel_facebook_custom_conversion_value` int DEFAULT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            KEY `plataforma_products_tenant_id_foreign` (`tenant_id`),
                            CONSTRAINT `plataforma_products_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `products_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_categories` (
                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                       `category` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `tenant_id` bigint unsigned NOT NULL,
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `plataforma_products_categories_tenant_id_foreign` (`tenant_id`),
                                       CONSTRAINT `plataforma_products_categories_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `products_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_coupons` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `current_use` int NOT NULL DEFAULT '0',
                                    `current_limit` int DEFAULT NULL,
                                    `expiration_date` date DEFAULT NULL,
                                    `discount` int NOT NULL,
                                    `active` tinyint(1) NOT NULL DEFAULT '1',
                                    `created_at` timestamp NULL DEFAULT NULL,
                                    `updated_at` timestamp NULL DEFAULT NULL,
                                    PRIMARY KEY (`id`),
                                    KEY `products_coupons_product_id_foreign` (`product_id`),
                                    CONSTRAINT `products_coupons_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `products_deliverables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_deliverables` (
                                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                         `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `deliverable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `deliverable_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `created_at` timestamp NULL DEFAULT NULL,
                                         `updated_at` timestamp NULL DEFAULT NULL,
                                         PRIMARY KEY (`id`),
                                         KEY `plataforma_products_deliverables_product_id_foreign` (`product_id`),
                                         CONSTRAINT `plataforma_products_deliverables_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `products_pixel_analytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_pixel_analytics` (
                                            `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                            `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                            `tracking_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                            `created_at` timestamp NULL DEFAULT NULL,
                                            `updated_at` timestamp NULL DEFAULT NULL,
                                            PRIMARY KEY (`id`),
                                            KEY `products_pixel_analytics_product_id_foreign` (`product_id`),
                                            CONSTRAINT `products_pixel_analytics_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `products_pixel_facebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_pixel_facebook` (
                                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                           `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `pixel_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `domain` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                           `created_at` timestamp NULL DEFAULT NULL,
                                           `updated_at` timestamp NULL DEFAULT NULL,
                                           PRIMARY KEY (`id`),
                                           KEY `products_pixel_facebook_product_id_foreign` (`product_id`),
                                           CONSTRAINT `products_pixel_facebook_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `products_pixel_google_ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_pixel_google_ads` (
                                             `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                             `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                             `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                             `pixel_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                             `conversion_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                             `event_when_visit_checkout` tinyint(1) NOT NULL DEFAULT '0',
                                             `event_when_approve_card_pix` tinyint(1) NOT NULL DEFAULT '0',
                                             `event_when_generate_bank_slip` tinyint(1) NOT NULL DEFAULT '0',
                                             `created_at` timestamp NULL DEFAULT NULL,
                                             `updated_at` timestamp NULL DEFAULT NULL,
                                             PRIMARY KEY (`id`),
                                             KEY `products_pixel_google_ads_product_id_foreign` (`product_id`),
                                             CONSTRAINT `products_pixel_google_ads_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `products_pixel_outbrain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_pixel_outbrain` (
                                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                           `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `pixel_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                           `event_when_visit_checkout` tinyint(1) NOT NULL DEFAULT '0',
                                           `event_when_approve_card_pix` tinyint(1) NOT NULL DEFAULT '0',
                                           `event_when_generate_bank_slip` tinyint(1) NOT NULL DEFAULT '0',
                                           `created_at` timestamp NULL DEFAULT NULL,
                                           `updated_at` timestamp NULL DEFAULT NULL,
                                           PRIMARY KEY (`id`),
                                           KEY `products_pixel_outbrain_product_id_foreign` (`product_id`),
                                           CONSTRAINT `products_pixel_outbrain_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `products_pixel_tiktok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_pixel_tiktok` (
                                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                         `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `pixel_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `created_at` timestamp NULL DEFAULT NULL,
                                         `updated_at` timestamp NULL DEFAULT NULL,
                                         PRIMARY KEY (`id`),
                                         KEY `products_pixel_tiktok_product_id_foreign` (`product_id`),
                                         CONSTRAINT `products_pixel_tiktok_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `profiles_conections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles_conections` (
                                       `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                       `quiz_id` bigint unsigned DEFAULT NULL,
                                       `profile_id` bigint unsigned DEFAULT NULL,
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `plataforma_profiles_conections_quiz_id_foreign` (`quiz_id`),
                                       KEY `plataforma_profiles_conections_profile_id_foreign` (`profile_id`),
                                       CONSTRAINT `plataforma_profiles_conections_profile_id_foreign` FOREIGN KEY (`profile_id`) REFERENCES `quiz_profile` (`id`) ON DELETE CASCADE,
                                       CONSTRAINT `plataforma_profiles_conections_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz` (
                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                        `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        `goal_points` int DEFAULT '0',
                        `blocked_next` tinyint(1) DEFAULT '0',
                        `repeat` tinyint(1) DEFAULT '0',
                        `time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        `time_limit` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                        `goal` int DEFAULT '0',
                        `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        `published` tinyint(1) DEFAULT NULL,
                        `stopwatch` tinyint(1) DEFAULT '0',
                        `url_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        `url_image_vertical` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        `tenant_id` bigint unsigned NOT NULL,
                        `created_at` timestamp NULL DEFAULT NULL,
                        `updated_at` timestamp NULL DEFAULT NULL,
                        `behavior_points` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        `type_avaliation` tinyint(1) DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        KEY `plataforma_quiz_tenant_id_foreign` (`tenant_id`),
                        CONSTRAINT `plataforma_quiz_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1691 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `quiz_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_profile` (
                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `tenant_id` bigint unsigned NOT NULL,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                KEY `plataforma_quiz_profile_tenant_id_foreign` (`tenant_id`),
                                CONSTRAINT `plataforma_quiz_profile_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `quiz_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_question` (
                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                 `question` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                                 `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `url_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `url_image_vertical` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `value` int DEFAULT '0',
                                 `quiz_id` bigint unsigned NOT NULL,
                                 `order` int DEFAULT '0',
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `plataforma_quiz_question_quiz_id_foreign` (`quiz_id`),
                                 CONSTRAINT `plataforma_quiz_question_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6942 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `quiz_question_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_question_answer` (
                                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                        `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                                        `is_correct` tinyint(1) DEFAULT '0',
                                        `order` int DEFAULT '0',
                                        `quiz_question_id` bigint unsigned NOT NULL,
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL,
                                        PRIMARY KEY (`id`),
                                        KEY `plataforma_quiz_question_answer_quiz_question_id_foreign` (`quiz_question_id`),
                                        CONSTRAINT `plataforma_quiz_question_answer_quiz_question_id_foreign` FOREIGN KEY (`quiz_question_id`) REFERENCES `quiz_question` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23616 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `quiz_user_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_user_answer` (
                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                    `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `approved` tinyint(1) DEFAULT '0',
                                    `quiz_id` bigint unsigned NOT NULL,
                                    `class_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `performance` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                    `created_at` timestamp NULL DEFAULT NULL,
                                    `updated_at` timestamp NULL DEFAULT NULL,
                                    `tenant_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                    `awaiting_evaluation` tinyint(1) DEFAULT '0',
                                    PRIMARY KEY (`id`),
                                    KEY `plataforma_quiz_user_answer_user_id_foreign` (`user_id`),
                                    KEY `plataforma_quiz_user_answer_quiz_id_foreign` (`quiz_id`),
                                    KEY `quiz_user_answer_class_id_foreign` (`class_id`),
                                    CONSTRAINT `plataforma_quiz_user_answer_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE CASCADE,
                                    CONSTRAINT `plataforma_quiz_user_answer_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
                                    CONSTRAINT `quiz_user_answer_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `ead_classes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40059 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ranking_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ranking_levels` (
                                  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                  `tenant_id` bigint unsigned NOT NULL,
                                  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `url_img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                  `needed_score` int NOT NULL,
                                  `color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                  `animation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                  `show_level_on_profile` tinyint(1) NOT NULL DEFAULT '1',
                                  `show_score_on_profile` tinyint(1) NOT NULL DEFAULT '1',
                                  `created_at` timestamp NULL DEFAULT NULL,
                                  `updated_at` timestamp NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `plataforma_ranking_levels_tenant_id_foreign` (`tenant_id`),
                                  CONSTRAINT `plataforma_ranking_levels_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=984 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ranking_levels_permissions_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ranking_levels_permissions_plans` (
                                                    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                                    `tenant_id` bigint unsigned NOT NULL,
                                                    `level_id` bigint unsigned NOT NULL,
                                                    `plan_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                                    `created_at` timestamp NULL DEFAULT NULL,
                                                    `updated_at` timestamp NULL DEFAULT NULL,
                                                    PRIMARY KEY (`id`),
                                                    KEY `plataforma_ranking_levels_permissions_plans_tenant_id_foreign` (`tenant_id`),
                                                    KEY `plataforma_ranking_levels_permissions_plans_level_id_foreign` (`level_id`),
                                                    KEY `ranking_levels_permissions_plans_plan_id_foreign` (`plan_id`),
                                                    CONSTRAINT `plataforma_ranking_levels_permissions_plans_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `ranking_levels` (`id`),
                                                    CONSTRAINT `plataforma_ranking_levels_permissions_plans_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`),
                                                    CONSTRAINT `ranking_levels_permissions_plans_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4424 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `reembolso_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reembolso_accounts` (
                                      `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                      `reembolso_id` bigint unsigned DEFAULT NULL,
                                      `banco` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `agencia` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `conta` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `nome_completo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `cpf_cnpj` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `chave_pix` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                      `created_at` timestamp NULL DEFAULT NULL,
                                      `updated_at` timestamp NULL DEFAULT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `plataforma_reembolso_accounts_reembolso_id_foreign` (`reembolso_id`),
                                      CONSTRAINT `plataforma_reembolso_accounts_reembolso_id_foreign` FOREIGN KEY (`reembolso_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refunds` (
                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                           `organization_id` bigint unsigned NOT NULL,
                           `user_subscription_id` bigint unsigned NOT NULL,
                           `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                           `created_at` timestamp NULL DEFAULT NULL,
                           `updated_at` timestamp NULL DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `plataforma_reembolsos_user_subscription_id_foreign` (`user_subscription_id`),
                           KEY `refunds_organization_id_foreign` (`organization_id`),
                           CONSTRAINT `plataforma_reembolsos_user_subscription_id_foreign` FOREIGN KEY (`user_subscription_id`) REFERENCES `user_subscription` (`id`) ON DELETE CASCADE,
                           CONSTRAINT `refunds_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `master`.`organizations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `register_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register_transactions` (
                                         `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                         `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `value_offer` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `offer_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `invoice_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `customer_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `payment_form` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `device_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `org_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `product` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                         `created_at` timestamp NULL DEFAULT NULL,
                                         `updated_at` timestamp NULL DEFAULT NULL,
                                         PRIMARY KEY (`id`),
                                         KEY `plataforma_register_transactions_product_id_foreign` (`product_id`),
                                         CONSTRAINT `plataforma_register_transactions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
                         `id` int unsigned NOT NULL AUTO_INCREMENT,
                         `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                         `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL,
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `roles_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_permissions` (
                                     `role_id` int unsigned NOT NULL,
                                     `permission_id` int unsigned NOT NULL,
                                     PRIMARY KEY (`role_id`,`permission_id`),
                                     KEY `roles_permissions_permission_id_foreign` (`permission_id`),
                                     CONSTRAINT `roles_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
                                     CONSTRAINT `roles_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `score_per_day_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score_per_day_community` (
                                           `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                           `tenant_id` bigint unsigned NOT NULL,
                                           `post` tinyint(1) NOT NULL DEFAULT '0',
                                           `comment` tinyint(1) NOT NULL DEFAULT '0',
                                           `reply` tinyint(1) NOT NULL DEFAULT '0',
                                           `like` tinyint(1) NOT NULL DEFAULT '0',
                                           `needed_interaction` int NOT NULL,
                                           `plus_user_score` int NOT NULL,
                                           `created_at` timestamp NULL DEFAULT NULL,
                                           `updated_at` timestamp NULL DEFAULT NULL,
                                           PRIMARY KEY (`id`),
                                           KEY `plataforma_score_per_day_community_tenant_id_foreign` (`tenant_id`),
                                           CONSTRAINT `plataforma_score_per_day_community_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `score_per_day_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score_per_day_platform` (
                                          `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                          `tenant_id` bigint unsigned NOT NULL,
                                          `like_class` tinyint(1) NOT NULL DEFAULT '0',
                                          `comment_class` tinyint(1) NOT NULL DEFAULT '0',
                                          `watch_class` tinyint(1) NOT NULL DEFAULT '0',
                                          `finish_class` tinyint(1) NOT NULL DEFAULT '0',
                                          `finish_module` tinyint(1) NOT NULL DEFAULT '0',
                                          `finish_course` tinyint(1) NOT NULL DEFAULT '0',
                                          `needed_interaction` int NOT NULL,
                                          `plus_user_score` int NOT NULL DEFAULT '0',
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL,
                                          PRIMARY KEY (`id`),
                                          KEY `plataforma_score_per_day_platform_tenant_id_foreign` (`tenant_id`),
                                          CONSTRAINT `plataforma_score_per_day_platform_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1951 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
                            `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                            `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `single_payment_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `single_payment_offers` (
                                         `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `product_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `price` decimal(10,2) DEFAULT NULL,
                                         `refund_days` int NOT NULL,
                                         `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'single_payment_offer',
                                         `invoice_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `payable_by_credit_card` tinyint(1) NOT NULL DEFAULT '0',
                                         `payable_by_pix` tinyint(1) NOT NULL DEFAULT '0',
                                         `payable_by_bank_slip` tinyint(1) NOT NULL DEFAULT '0',
                                         `two_credit_card_payment` tinyint(1) NOT NULL DEFAULT '0',
                                         `confirmation_email` tinyint(1) NOT NULL DEFAULT '0',
                                         `bank_slip_expiration_days` int DEFAULT NULL,
                                         `max_installments` int NOT NULL DEFAULT '0',
                                         `allow_installments` tinyint(1) NOT NULL DEFAULT '0',
                                         `created_at` timestamp NULL DEFAULT NULL,
                                         `updated_at` timestamp NULL DEFAULT NULL,
                                         PRIMARY KEY (`id`),
                                         KEY `single_payment_offers_product_id_foreign` (`product_id`),
                                         CONSTRAINT `single_payment_offers_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `testimony`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimony` (
                             `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                             `content` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `url_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `approved` tinyint(1) DEFAULT NULL,
                             `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `tenant_id` bigint unsigned DEFAULT NULL,
                             `created_at` timestamp NULL DEFAULT NULL,
                             `updated_at` timestamp NULL DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             KEY `plataforma_testimony_tenant_id_foreign` (`tenant_id`),
                             KEY `plataforma_testimony_user_id_foreign` (`user_id`),
                             CONSTRAINT `plataforma_testimony_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                             CONSTRAINT `plataforma_testimony_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ticket_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_items` (
                                `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `ticket_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                KEY `ticket_items_ticket_id_foreign` (`ticket_id`),
                                KEY `ticket_items_user_id_foreign` (`user_id`),
                                CONSTRAINT `ticket_items_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
                                CONSTRAINT `ticket_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
                           `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                           `tenant_id` bigint unsigned NOT NULL,
                           `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                           `community_tenant_id` bigint unsigned DEFAULT NULL,
                           `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                           `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                           `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                           `created_at` timestamp NULL DEFAULT NULL,
                           `updated_at` timestamp NULL DEFAULT NULL,
                           `closed_at` datetime DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `tickets_tenant_id_foreign` (`tenant_id`),
                           KEY `tickets_user_id_foreign` (`user_id`),
                           KEY `tickets_community_tenant_id_foreign` (`community_tenant_id`),
                           CONSTRAINT `tickets_community_tenant_id_foreign` FOREIGN KEY (`community_tenant_id`) REFERENCES `community_tenants` (`id`) ON DELETE CASCADE,
                           CONSTRAINT `tickets_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                           CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_address` (
                                `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                `tenant_id` bigint unsigned DEFAULT NULL,
                                `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `cep` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `street` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `complement` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `neighborhood` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `created_at` timestamp NULL DEFAULT NULL,
                                `updated_at` timestamp NULL DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                KEY `user_address_tenant_id_foreign` (`tenant_id`),
                                KEY `user_address_user_id_foreign` (`user_id`),
                                CONSTRAINT `user_address_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                                CONSTRAINT `user_address_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9915 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_answer` (
                               `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                               `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `quiz_id` bigint unsigned NOT NULL,
                               `quiz_question_id` bigint unsigned NOT NULL,
                               `answer_id` bigint unsigned DEFAULT NULL,
                               `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
                               `is_correct` tinyint(1) DEFAULT '0',
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL,
                               `awaiting_evaluation` tinyint(1) DEFAULT '0',
                               PRIMARY KEY (`id`),
                               KEY `plataforma_user_answer_user_id_foreign` (`user_id`),
                               KEY `plataforma_user_answer_quiz_id_foreign` (`quiz_id`),
                               KEY `plataforma_user_answer_quiz_question_id_foreign` (`quiz_question_id`),
                               KEY `plataforma_user_answer_answer_id_foreign` (`answer_id`),
                               CONSTRAINT `plataforma_user_answer_answer_id_foreign` FOREIGN KEY (`answer_id`) REFERENCES `quiz_question_answer` (`id`) ON DELETE CASCADE,
                               CONSTRAINT `plataforma_user_answer_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE CASCADE,
                               CONSTRAINT `plataforma_user_answer_quiz_question_id_foreign` FOREIGN KEY (`quiz_question_id`) REFERENCES `quiz_question` (`id`) ON DELETE CASCADE,
                               CONSTRAINT `plataforma_user_answer_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211621 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_answers_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_answers_profile` (
                                        `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                        `points` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                        `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `answer_id` bigint unsigned DEFAULT NULL,
                                        `profile_id` int DEFAULT NULL,
                                        `question_id` bigint unsigned DEFAULT NULL,
                                        `quiz_id` bigint unsigned NOT NULL,
                                        `created_at` timestamp NULL DEFAULT NULL,
                                        `updated_at` timestamp NULL DEFAULT NULL,
                                        PRIMARY KEY (`id`),
                                        KEY `plataforma_user_answers_profile_answer_id_foreign` (`answer_id`),
                                        KEY `plataforma_user_answers_profile_question_id_foreign` (`question_id`),
                                        KEY `plataforma_user_answers_profile_quiz_id_foreign` (`quiz_id`),
                                        KEY `plataforma_user_answers_profile_user_id_foreign` (`user_id`),
                                        CONSTRAINT `plataforma_user_answers_profile_answer_id_foreign` FOREIGN KEY (`answer_id`) REFERENCES `quiz_question_answer` (`id`) ON DELETE CASCADE,
                                        CONSTRAINT `plataforma_user_answers_profile_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `quiz_question` (`id`) ON DELETE CASCADE,
                                        CONSTRAINT `plataforma_user_answers_profile_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE CASCADE,
                                        CONSTRAINT `plataforma_user_answers_profile_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_personal_list_blocked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_personal_list_blocked` (
                                              `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                              `author_user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                              `blocked_user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                              `blocked_tenant_id` bigint unsigned DEFAULT NULL,
                                              `author_tenant_id` bigint unsigned DEFAULT NULL,
                                              `created_at` timestamp NULL DEFAULT NULL,
                                              `updated_at` timestamp NULL DEFAULT NULL,
                                              PRIMARY KEY (`id`),
                                              KEY `plataforma_user_personal_list_blocked_author_user_id_foreign` (`author_user_id`),
                                              KEY `plataforma_user_personal_list_blocked_blocked_user_id_foreign` (`blocked_user_id`),
                                              KEY `plataforma_user_personal_list_blocked_blocked_tenant_id_foreign` (`blocked_tenant_id`),
                                              KEY `plataforma_user_personal_list_blocked_author_tenant_id_foreign` (`author_tenant_id`),
                                              CONSTRAINT `plataforma_user_personal_list_blocked_author_tenant_id_foreign` FOREIGN KEY (`author_tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                                              CONSTRAINT `plataforma_user_personal_list_blocked_author_user_id_foreign` FOREIGN KEY (`author_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
                                              CONSTRAINT `plataforma_user_personal_list_blocked_blocked_tenant_id_foreign` FOREIGN KEY (`blocked_tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                                              CONSTRAINT `plataforma_user_personal_list_blocked_blocked_user_id_foreign` FOREIGN KEY (`blocked_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_personal_posts_blocked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_personal_posts_blocked` (
                                               `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                               `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                               `post_id` bigint unsigned DEFAULT NULL,
                                               `created_at` timestamp NULL DEFAULT NULL,
                                               `updated_at` timestamp NULL DEFAULT NULL,
                                               PRIMARY KEY (`id`),
                                               KEY `plataforma_user_personal_posts_blocked_user_id_foreign` (`user_id`),
                                               KEY `plataforma_user_personal_posts_blocked_post_id_foreign` (`post_id`),
                                               CONSTRAINT `plataforma_user_personal_posts_blocked_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `community_posts` (`id`) ON DELETE CASCADE,
                                               CONSTRAINT `plataforma_user_personal_posts_blocked_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_subscription` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `organization_id` bigint unsigned DEFAULT NULL,
                                     `tenant_id` bigint unsigned DEFAULT NULL,
                                     `active` tinyint(1) NOT NULL,
                                     `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'active',
                                     `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `sub_account_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `package_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `customer_iugu_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `offer_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `iugu_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `contract_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `credit_brand` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `last_digits` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `contract_invoice` bigint DEFAULT NULL,
                                     `payment_last_date` datetime DEFAULT NULL,
                                     `expiration_date` date DEFAULT NULL,
                                     `cancel_date` date DEFAULT NULL,
                                     `iugu_payment_method_id` bigint unsigned DEFAULT NULL,
                                     `iugu_invoice_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `iugu_invoice_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `iugu_assinatura_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `iugu_qtd_installments` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `iugu_assinatura_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `type_payment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                     `attempts` int DEFAULT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     `accepted_terms` tinyint(1) DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `user_subscription_tenant_id_foreign` (`tenant_id`),
                                     KEY `user_subscription_user_id_foreign` (`user_id`),
                                     KEY `user_subscription_package_id_foreign` (`package_id`),
                                     KEY `user_subscription_iugu_payment_method_id_foreign` (`iugu_payment_method_id`),
                                     KEY `user_subscription_sub_account_id_foreign` (`sub_account_id`),
                                     KEY `user_subscription_organization_id_foreign` (`organization_id`),
                                     CONSTRAINT `user_subscription_iugu_payment_method_id_foreign` FOREIGN KEY (`iugu_payment_method_id`) REFERENCES `master`.`app_credit_card` (`id`),
                                     CONSTRAINT `user_subscription_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `master`.`organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                     CONSTRAINT `user_subscription_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `ead_subscription_package` (`id`) ON DELETE CASCADE,
                                     CONSTRAINT `user_subscription_sub_account_id_foreign` FOREIGN KEY (`sub_account_id`) REFERENCES `master`.`sub_account` (`account_id`) ON DELETE CASCADE,
                                     CONSTRAINT `user_subscription_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                                     CONSTRAINT `user_subscription_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5300040 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_terms_accept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_terms_accept` (
                                     `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                     `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `term_id` bigint unsigned NOT NULL,
                                     `tenant_id` bigint unsigned NOT NULL,
                                     `created_at` timestamp NULL DEFAULT NULL,
                                     `updated_at` timestamp NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `plataforma_user_terms_accept_tenant_id_foreign` (`tenant_id`),
                                     KEY `plataforma_user_terms_accept_user_id_foreign` (`user_id`),
                                     KEY `plataforma_user_terms_accept_term_id_foreign` (`term_id`),
                                     CONSTRAINT `plataforma_user_terms_accept_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                     CONSTRAINT `plataforma_user_terms_accept_term_id_foreign` FOREIGN KEY (`term_id`) REFERENCES `master`.`advanced_settings` (`id`) ON DELETE CASCADE,
                                     CONSTRAINT `plataforma_user_terms_accept_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
                         `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                         `tenant_id` bigint unsigned DEFAULT NULL,
                         `registration_link_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                         `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `photo_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
                         `person_type` enum('fisica','juridica') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fisica',
                         `cpf_cnpj` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `resp_cpf` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `correntista` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `business_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `bank` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `bank_ag` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `bank_cc` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `account_type` enum('Corrente','Poupança') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `genre` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `birth` date DEFAULT NULL,
                         `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `auth` int NOT NULL DEFAULT '1',
                         `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
                         `email_verified_at` timestamp NULL DEFAULT NULL,
                         `reference_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                         `last_login_at` datetime DEFAULT NULL,
                         `last_login_ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `storage_use` decimal(20,6) DEFAULT NULL,
                         `storage_limit` bigint DEFAULT NULL,
                         `website` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `tiktok` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `youtube` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `linkedIn` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `instagram` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `twitter` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `facebook` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL,
                         `deleted_at` timestamp NULL DEFAULT NULL,
                         `user_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `role_id` int DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         KEY `users_tenant_id_foreign` (`tenant_id`),
                         KEY `users_email` (`email`) USING BTREE,
                         CONSTRAINT `users_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_blacklist` (
                                   `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `tenant_id` bigint unsigned NOT NULL,
                                   `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `block_commentary` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `unlock_commentary_date` datetime DEFAULT NULL,
                                   `block_access` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `unlock_access_date` datetime DEFAULT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL,
                                   `updated_at` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `users_blacklist_user_id_foreign` (`user_id`),
                                   KEY `users_blacklist_tenant_id_foreign` (`tenant_id`),
                                   CONSTRAINT `users_blacklist_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                                   CONSTRAINT `users_blacklist_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_deleted` (
                                 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                                 `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `tenant_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `registration_link_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `photo_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `person_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `cpf_cnpj` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `resp_cpf` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `correntista` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `business_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `bank` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `bank_ag` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `bank_cc` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `account_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `genre` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `birth` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `auth` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `reference_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `last_login_at` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `last_login_ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `storage_use` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `storage_limit` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `website` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `tiktok` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `youtube` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `linkedIn` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `instagram` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `twitter` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `facebook` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=982 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_permissions` (
                                     `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `permission_id` int unsigned NOT NULL,
                                     `tenant_id` bigint unsigned NOT NULL,
                                     PRIMARY KEY (`user_id`,`permission_id`),
                                     KEY `users_permissions_permission_id_foreign` (`permission_id`),
                                     KEY `plataforma_users_permissions_tenant_id_foreign` (`tenant_id`),
                                     CONSTRAINT `plataforma_users_permissions_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`),
                                     CONSTRAINT `users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
                                     CONSTRAINT `users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
                               `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                               `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                               `role_id` int unsigned NOT NULL,
                               `tenant_id` bigint unsigned NOT NULL,
                               `created_at` timestamp NULL DEFAULT NULL,
                               `updated_at` timestamp NULL DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               UNIQUE KEY `plataforma_users_roles_user_id_role_id_tenant_id_unique` (`user_id`,`role_id`,`tenant_id`),
                               KEY `plataforma_users_roles_role_id_foreign` (`role_id`),
                               KEY `plataforma_users_roles_tenant_id_foreign` (`tenant_id`),
                               CONSTRAINT `plataforma_users_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
                               CONSTRAINT `plataforma_users_roles_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `master`.`tenant_users` (`id`) ON DELETE CASCADE,
                               CONSTRAINT `plataforma_users_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=541566 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `vw_Base_Geral`;
/*!50001 DROP VIEW IF EXISTS `vw_Base_Geral`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_Base_Geral` AS SELECT
                                            1 AS `user_id`,
                                            1 AS `tenant_id`,
                                            1 AS `Email`,
                                            1 AS `Nome_Aluno`,
                                            1 AS `role_id`,
                                            1 AS `Data_Entrada`*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `vw_Info_Plataformas`;
/*!50001 DROP VIEW IF EXISTS `vw_Info_Plataformas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_Info_Plataformas` AS SELECT
                                                  1 AS `id`,
                                                  1 AS `organization_id`,
                                                  1 AS `Plataforma`,
                                                  1 AS `Status`,
                                                  1 AS `Plano`,
                                                  1 AS `Qtd_Total`,
                                                  1 AS `Qtd_Alunos`,
                                                  1 AS `Qtd_Admins`,
                                                  1 AS `Data_Entrada`*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `vw_admins`;
/*!50001 DROP VIEW IF EXISTS `vw_admins`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_admins` AS SELECT
                                        1 AS `user_id`,
                                        1 AS `Nome_Admin`,
                                        1 AS `Email`,
                                        1 AS `Telefone`,
                                        1 AS `Plano`,
                                        1 AS `status`,
                                        1 AS `started`,
                                        1 AS `due_day`,
                                        1 AS `next_due`*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `vw_conclusao_curso`;
/*!50001 DROP VIEW IF EXISTS `vw_conclusao_curso`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_conclusao_curso` AS SELECT
                                                 1 AS `tenant_id`,
                                                 1 AS `course_id`,
                                                 1 AS `Nome_Curso`,
                                                 1 AS `user_id`,
                                                 1 AS `Nome_Aluno`,
                                                 1 AS `Email`,
                                                 1 AS `Status_Conclusao`,
                                                 1 AS `Data_Acesso`*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `vw_metricas_alunos_ead`;
/*!50001 DROP VIEW IF EXISTS `vw_metricas_alunos_ead`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_metricas_alunos_ead` AS SELECT
                                                     1 AS `Nome_aluno`,
                                                     1 AS `email`,
                                                     1 AS `document`,
                                                     1 AS `tenant_id`,
                                                     1 AS `name`,
                                                     1 AS `Curso`,
                                                     1 AS `Módulo`,
                                                     1 AS `Aula`,
                                                     1 AS `Tempo_assistido`,
                                                     1 AS `to_total`*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `vw_metricas_alunos_ead_acessos`;
/*!50001 DROP VIEW IF EXISTS `vw_metricas_alunos_ead_acessos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_metricas_alunos_ead_acessos` AS SELECT
                                                             1 AS `tenant_id`,
                                                             1 AS `name`,
                                                             1 AS `Nome_Curso`,
                                                             1 AS `Acessos`*/;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS `vw_validade_assinaturas_admins`;
/*!50001 DROP VIEW IF EXISTS `vw_validade_assinaturas_admins`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_validade_assinaturas_admins` AS SELECT
                                                             1 AS `Nome_Admin`,
                                                             1 AS `Email`,
                                                             1 AS `Telefone`,
                                                             1 AS `user_id`,
                                                             1 AS `Plano`,
                                                             1 AS `status`,
                                                             1 AS `started`,
                                                             1 AS `due_day`,
                                                             1 AS `next_due`*/;
SET character_set_client = @saved_cs_client;

USE `master`;
/*!50001 DROP VIEW IF EXISTS `Clientes_ativos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
    /*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
    /*!50001 VIEW `Clientes_ativos` AS select `us`.`tenant_id` AS `tenant_id`,`tu`.`name` AS `name`,cast(`tu`.`created_at` as date) AS `data_criação`,count(`us`.`active`) AS `Quantidade_de_alunos_ativos` from ((`plataforma`.`user_subscription` `us` left join `tenant_users` `tu` on((`us`.`tenant_id` = `tu`.`organization_id`))) left join `plataforma`.`users` `ur` on((`us`.`user_id` = `ur`.`id`))) where ((`us`.`status` = 'active') and (`us`.`tenant_id` is not null)) group by `us`.`tenant_id` order by `Quantidade_de_alunos_ativos` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

USE `plataforma`;
/*!50001 DROP VIEW IF EXISTS `Table_size_Master`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
    /*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
    /*!50001 VIEW `Table_size_Master` AS select `information_schema`.`TABLES`.`TABLE_NAME` AS `Tabela`,round(((`information_schema`.`TABLES`.`DATA_LENGTH` + `information_schema`.`TABLES`.`INDEX_LENGTH`) / 1024),0) AS `Tamanho da tabela (Kbyte)` from `information_schema`.`TABLES` where (`information_schema`.`TABLES`.`TABLE_SCHEMA` = 'master') order by (`information_schema`.`TABLES`.`DATA_LENGTH` + `information_schema`.`TABLES`.`INDEX_LENGTH`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `Table_size_Plataforma`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
    /*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
    /*!50001 VIEW `Table_size_Plataforma` AS select `information_schema`.`TABLES`.`TABLE_NAME` AS `Tabela`,round(((`information_schema`.`TABLES`.`DATA_LENGTH` + `information_schema`.`TABLES`.`INDEX_LENGTH`) / 1024),0) AS `Tamanho da tabela (Kbyte)` from `information_schema`.`TABLES` where (`information_schema`.`TABLES`.`TABLE_SCHEMA` = 'plataforma') order by (`information_schema`.`TABLES`.`DATA_LENGTH` + `information_schema`.`TABLES`.`INDEX_LENGTH`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `vw_Base_Geral`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
    /*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
    /*!50001 VIEW `vw_Base_Geral` AS select `r`.`user_id` AS `user_id`,`r`.`tenant_id` AS `tenant_id`,`u`.`email` AS `Email`,`u`.`name` AS `Nome_Aluno`,`r`.`role_id` AS `role_id`,cast(`r`.`created_at` as date) AS `Data_Entrada` from (`users_roles` `r` join `users` `u` on((`r`.`user_id` = `u`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `vw_Info_Plataformas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
    /*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
    /*!50001 VIEW `vw_Info_Plataformas` AS select `u`.`id` AS `id`,`u`.`organization_id` AS `organization_id`,`u`.`name` AS `Plataforma`,`s`.`status` AS `Status`,`ap`.`name` AS `Plano`,count(`vbg`.`user_id`) AS `Qtd_Total`,count((case when (`vbg`.`role_id` = '4') then 'Alunos' end)) AS `Qtd_Alunos`,count((case when (`vbg`.`role_id` <> '4') then 'Admins' end)) AS `Qtd_Admins`,cast(`u`.`created_at` as date) AS `Data_Entrada` from (((`vw_Base_Geral` `vbg` join `master`.`tenant_users` `u` on((`vbg`.`tenant_id` = `u`.`id`))) join `master`.`app_subscriptions` `s` on((`u`.`id` = `s`.`tenant_id`))) join `master`.`app_plans` `ap` on((`s`.`plan_id` = `ap`.`id`))) group by `vbg`.`tenant_id` order by `Qtd_Total` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `vw_admins`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
    /*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
    /*!50001 VIEW `vw_admins` AS select `s`.`user_id` AS `user_id`,`u`.`name` AS `Nome_Admin`,`u`.`email` AS `Email`,`u`.`phone` AS `Telefone`,`ap`.`name` AS `Plano`,`s`.`status` AS `status`,`s`.`started` AS `started`,`s`.`due_day` AS `due_day`,cast(`s`.`next_due` as date) AS `next_due` from ((`master`.`app_subscriptions` `s` join `users` `u` on((`s`.`user_id` = `u`.`id`))) join `master`.`app_plans` `ap` on((`s`.`plan_id` = `ap`.`id`))) order by `s`.`next_due` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `vw_conclusao_curso`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
    /*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
    /*!50001 VIEW `vw_conclusao_curso` AS select `ch`.`tenant_id` AS `tenant_id`,`ch`.`course_id` AS `course_id`,`ec`.`title` AS `Nome_Curso`,`ch`.`user_id` AS `user_id`,`u`.`name` AS `Nome_Aluno`,`u`.`email` AS `Email`,`ch`.`finished` AS `Status_Conclusao`,cast(`ch`.`updated_at` as date) AS `Data_Acesso` from ((`ead_courses_histories` `ch` join `users` `u` on((`ch`.`user_id` = `u`.`id`))) join `ead_courses` `ec` on((`ch`.`course_id` = `ec`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `vw_metricas_alunos_ead`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
    /*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
    /*!50001 VIEW `vw_metricas_alunos_ead` AS select `u`.`name` AS `Nome_aluno`,`u`.`email` AS `email`,`u`.`document` AS `document`,`ch`.`tenant_id` AS `tenant_id`,`O`.`name` AS `name`,`ec`.`title` AS `Curso`,`em`.`title` AS `Módulo`,`h`.`title` AS `Aula`,`ch`.`time` AS `Tempo_assistido`,`ch`.`to_total` AS `to_total` from (((((`ead_classes_histories` `ch` join `users` `u` on((`ch`.`user_id` = `u`.`id`))) join `ead_courses` `ec` on((`ch`.`course_id` = `ec`.`id`))) join `ead_modules` `em` on((`ch`.`module_id` = `em`.`id`))) join `ead_classes` `h` on((`ch`.`class_id` = `h`.`id`))) join `master`.`organizations` `O` on((`ch`.`tenant_id` = `O`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `vw_metricas_alunos_ead_acessos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
    /*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
    /*!50001 VIEW `vw_metricas_alunos_ead_acessos` AS select `c`.`tenant_id` AS `tenant_id`,`o`.`name` AS `name`,`c`.`title` AS `Nome_Curso`,count(`h`.`finished`) AS `Acessos` from ((`ead_courses` `c` join `ead_courses_histories` `h` on((`c`.`id` = `h`.`course_id`))) join `master`.`organizations` `o` on((`c`.`tenant_id` = `o`.`id`))) group by `c`.`title` order by `Acessos` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `vw_validade_assinaturas_admins`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
    /*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
    /*!50001 VIEW `vw_validade_assinaturas_admins` AS select `u`.`name` AS `Nome_Admin`,`u`.`email` AS `Email`,`u`.`phone` AS `Telefone`,`s`.`user_id` AS `user_id`,`ap`.`name` AS `Plano`,`s`.`status` AS `status`,`s`.`started` AS `started`,`s`.`due_day` AS `due_day`,cast(`s`.`next_due` as date) AS `next_due` from ((`master`.`app_subscriptions` `s` join `users` `u` on((`s`.`user_id` = `u`.`id`))) join `master`.`app_plans` `ap` on((`s`.`plan_id` = `ap`.`id`))) where ((`s`.`next_due` < '2023-09-30') and (`s`.`status` in ('past_due','active'))) order by `s`.`next_due` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

INSERT INTO master.migrations (migration, batch)
VALUES ('master-schema.sql', 1);
