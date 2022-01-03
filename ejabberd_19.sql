-- MySQL dump 10.13  Distrib 5.6.45, for Linux (x86_64)
--
-- Host: localhost    Database: ejabberd_19
-- ------------------------------------------------------
-- Server version	5.6.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_broadcast_users`
--

DROP TABLE IF EXISTS `admin_broadcast_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_broadcast_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `broadcast_id` int(250) NOT NULL,
  `users` varchar(250) NOT NULL,
  `chat_type` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `broadcast_id` (`broadcast_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_broadcasts`
--

DROP TABLE IF EXISTS `admin_broadcasts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_broadcasts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `title` varchar(150) NOT NULL,
  `message` varchar(250) NOT NULL,
  `media_name` varchar(150) NOT NULL,
  `media_url` varchar(250) NOT NULL,
  `broadcast_time` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_team`
--

DROP TABLE IF EXISTS `admin_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_team_members`
--

DROP TABLE IF EXISTS `admin_team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_team_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `users` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `admin_team_members_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `admin_team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive` (
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  `peer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bare_peer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xml` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `txt` text COLLATE utf8mb4_unicode_ci,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` varchar(200) CHARACTER SET utf8 NOT NULL,
  `kind` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nick` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `broadcast_id` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `broadcastmsg_id` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `message_id` (`message_id`),
  KEY `i_username` (`username`) USING BTREE,
  KEY `i_timestamp` (`timestamp`) USING BTREE,
  KEY `i_peer` (`peer`) USING BTREE,
  KEY `i_bare_peer` (`bare_peer`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=317517 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `archive_prefs`
--

DROP TABLE IF EXISTS `archive_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive_prefs` (
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `def` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `always` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `never` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backup_restore`
--

DROP TABLE IF EXISTS `backup_restore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_restore` (
  `username` varchar(45) NOT NULL,
  `file_token` varchar(500) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bosh`
--

DROP TABLE IF EXISTS `bosh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bosh` (
  `sid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `node` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `i_bosh_sid` (`sid`(75))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bot_conversation`
--

DROP TABLE IF EXISTS `bot_conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bot_conversation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_user` varchar(191) NOT NULL,
  `to_user` varchar(191) NOT NULL,
  `message_id` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `broadcast`
--

DROP TABLE IF EXISTS `broadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broadcast` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `broadcast_name` varchar(255) NOT NULL,
  `broadcast_admin` varchar(45) NOT NULL,
  `broadcast_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`broadcast_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `broadcast_users`
--

DROP TABLE IF EXISTS `broadcast_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broadcast_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `broadcast_id` varchar(255) NOT NULL,
  `users` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`broadcast_id`),
  KEY `broadcast_id` (`broadcast_id`),
  KEY `broadcast_id_2` (`broadcast_id`),
  KEY `broadcast_id_3` (`broadcast_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `call_logs`
--

DROP TABLE IF EXISTS `call_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `call_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `call_type` varchar(100) NOT NULL,
  `socket_id` varchar(252) NOT NULL,
  `from_user` varchar(255) NOT NULL,
  `to_user` varchar(255) NOT NULL,
  `call_time` bigint(20) unsigned DEFAULT '0',
  `start_time` bigint(20) unsigned DEFAULT '0',
  `end_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `call_status` tinyint(2) NOT NULL DEFAULT '0',
  `deleted_status` tinyint(4) NOT NULL DEFAULT '0',
  `deleted_by` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `caps_features`
--

DROP TABLE IF EXISTS `caps_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caps_features` (
  `node` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subnode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feature` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `i_caps_features_node_subnode` (`node`(75),`subnode`(75))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_access_tokens`
--

DROP TABLE IF EXISTS `chat_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_access_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jid` varchar(191) DEFAULT NULL,
  `username` varchar(200) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_expiry_time` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scopes` varchar(255) DEFAULT NULL,
  `device_type` varchar(255) DEFAULT NULL,
  `client_ip` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_access_tokens_index1` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=2900749 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_ack_iq`
--

DROP TABLE IF EXISTS `chat_ack_iq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_ack_iq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `from_user` varchar(255) DEFAULT NULL,
  `message_id` varchar(500) DEFAULT NULL,
  `to_user` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_ack_messages`
--

DROP TABLE IF EXISTS `chat_ack_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_ack_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from_user` varchar(300) DEFAULT NULL,
  `to_user` varchar(300) DEFAULT NULL,
  `type` varchar(300) DEFAULT NULL,
  `message_id` varchar(300) DEFAULT NULL,
  `username` varchar(300) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_api_messages`
--

DROP TABLE IF EXISTS `chat_api_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_api_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` varchar(300) DEFAULT NULL,
  `chat_message_id` varchar(300) DEFAULT NULL,
  `message` text,
  `sent_at` datetime DEFAULT NULL,
  `from_user` varchar(300) DEFAULT NULL,
  `to_user` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_api_users`
--

DROP TABLE IF EXISTS `chat_api_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_api_users` (
  `id` int(11) NOT NULL,
  `username` varchar(205) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `is_block` varchar(45) DEFAULT NULL,
  `client_ip` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `xmpp_user` varchar(145) DEFAULT NULL,
  `email_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_bot`
--

DROP TABLE IF EXISTS `chat_bot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_bot` (
  `username` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_broadcast`
--

DROP TABLE IF EXISTS `chat_broadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_broadcast` (
  `broadcast_name` varchar(255) NOT NULL,
  `broadcast_admin` varchar(45) NOT NULL,
  `broadcast_id` varchar(255) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_broadcast_users`
--

DROP TABLE IF EXISTS `chat_broadcast_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_broadcast_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `broadcast_id` varchar(255) NOT NULL,
  `users` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`broadcast_id`)
) ENGINE=InnoDB AUTO_INCREMENT=955 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_calls`
--

DROP TABLE IF EXISTS `chat_calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_calls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `call_type` varchar(45) DEFAULT NULL,
  `call_id` varchar(255) DEFAULT NULL,
  `socket_id` varchar(255) DEFAULT NULL,
  `from_user` varchar(255) DEFAULT NULL,
  `to_user` varchar(255) DEFAULT NULL,
  `call_time` bigint(20) unsigned DEFAULT '0',
  `start_time` bigint(20) unsigned DEFAULT '0',
  `call_status` varchar(255) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `from_user_deleted` int(1) DEFAULT '0',
  `to_user_deleted` int(1) DEFAULT '0',
  `end_time` bigint(20) DEFAULT '0',
  `caller_device` varchar(45) DEFAULT NULL,
  `call_attend_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127319 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_feedback`
--

DROP TABLE IF EXISTS `chat_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(194) NOT NULL,
  `device_type` varchar(15) NOT NULL,
  `device_os` varchar(50) NOT NULL,
  `device_model` varchar(50) NOT NULL,
  `app_version` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_logs`
--

DROP TABLE IF EXISTS `chat_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(194) NOT NULL,
  `device_type` varchar(15) NOT NULL,
  `device_os` varchar(50) NOT NULL,
  `device_model` varchar(50) NOT NULL,
  `app_version` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `file_token` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_media_files`
--

DROP TABLE IF EXISTS `chat_media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_media_files` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_token` varchar(500) DEFAULT NULL,
  `from_user` varchar(255) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `broadcast_id` varchar(255) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `original_file` varchar(255) DEFAULT NULL,
  `to_users` text,
  `message_id` varchar(500) DEFAULT NULL,
  `file_path` varchar(500) DEFAULT NULL,
  `is_active` int(1) DEFAULT NULL,
  `upload_success` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18420 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_otp`
--

DROP TABLE IF EXISTS `chat_otp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_otp` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `otp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `mobile_number` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14413 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_recent`
--

DROP TABLE IF EXISTS `chat_recent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_recent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_user` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `txt` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `broadcast_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `broadcast_msg_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `favourite_status` tinyint(1) DEFAULT '0',
  `recall_status` tinyint(1) NOT NULL DEFAULT '0',
  `unread` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `recent_index` (`to_user`)
) ENGINE=InnoDB AUTO_INCREMENT=15004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_servers`
--

DROP TABLE IF EXISTS `chat_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `is_turn` int(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_settings`
--

DROP TABLE IF EXISTS `chat_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(50) NOT NULL,
  `admin_user` varchar(50) NOT NULL,
  `mail_login` varchar(3) NOT NULL,
  `video_limit` int(5) NOT NULL,
  `audio_limit` int(4) NOT NULL,
  `recall_time` int(4) NOT NULL,
  `private_time` int(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `feedback_from` varchar(25) NOT NULL,
  `feedback_to` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `xmpp_server` varchar(200) DEFAULT NULL,
  `signal_server` varchar(205) DEFAULT NULL,
  `xmpp_host` varchar(200) DEFAULT NULL,
  `xmpp_domain` varchar(200) DEFAULT NULL,
  `google_translate` varchar(45) DEFAULT NULL,
  `notification_help` varchar(45) DEFAULT NULL,
  `xmpp_port` int(6) DEFAULT NULL,
  `sdk_url` varchar(255) DEFAULT NULL,
  `pin_expire_days` int(3) NOT NULL DEFAULT '0',
  `pin_timeout` int(3) NOT NULL DEFAULT '0',
  `file_size_limit` int(11) NOT NULL,
  `livestreaming_enabled` tinyint(1) DEFAULT '0',
  `livestreaming_signalserver` varchar(255) DEFAULT NULL,
  `sipcall_enabled` tinyint(1) DEFAULT '0',
  `sip_server` varchar(100) DEFAULT NULL,
  `chat_backup_type` varchar(45) DEFAULT NULL,
  `chat_backup_frequency` varchar(45) DEFAULT NULL,
  `call_routing_server` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_users`
--

DROP TABLE IF EXISTS `chat_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_users` (
  `username` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_msg` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_token` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_os_version` double DEFAULT NULL,
  `voip_device_token` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `country_code` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resource` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mode` int(1) DEFAULT '0',
  `notification` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_type` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_block` int(1) NOT NULL DEFAULT '0',
  `profile_image_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_call_logs`
--

DROP TABLE IF EXISTS `client_call_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_call_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` varchar(20) NOT NULL,
  `created_user` varchar(255) NOT NULL,
  `from_user` varchar(255) NOT NULL,
  `to_user` varchar(255) NOT NULL,
  `user_list` text,
  `invite_user_list` text,
  `call_type` varchar(45) DEFAULT NULL,
  `call_mode` varchar(45) DEFAULT NULL,
  `caller_device` varchar(45) DEFAULT NULL,
  `session_status` varchar(100) DEFAULT NULL,
  `start_time` varchar(100) DEFAULT NULL,
  `end_time` varchar(100) DEFAULT NULL,
  `call_time` varchar(100) DEFAULT NULL,
  `call_state` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1031 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contus_chat_users`
--

DROP TABLE IF EXISTS `contus_chat_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contus_chat_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(245) DEFAULT NULL,
  `name` varchar(245) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `mobile_number` varchar(45) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_chatuser` int(1) NOT NULL DEFAULT '0',
  `status_msg` varchar(250) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `idx_contus_chat_users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_token`
--

DROP TABLE IF EXISTS `email_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_token` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `token` text,
  `email_template` varchar(45) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `expired_date_time` timestamp NULL DEFAULT NULL,
  `issued_date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `confirmed_date_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `email_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(194) NOT NULL,
  `device_type` varchar(15) NOT NULL,
  `device_os` varchar(50) NOT NULL,
  `device_model` varchar(50) NOT NULL,
  `app_version` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `image` longblob NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fly_users`
--

DROP TABLE IF EXISTS `fly_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fly_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_msg` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(20) NOT NULL,
  `device_type` varchar(10) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `username` (`username`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `greeting_messages`
--

DROP TABLE IF EXISTS `greeting_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `greeting_messages` (
  `quotes_id` int(11) NOT NULL AUTO_INCREMENT,
  `quotes_message` text NOT NULL,
  `username` varchar(191) NOT NULL,
  `is_sent` tinyint(1) NOT NULL DEFAULT '0',
  `wishes_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`quotes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_update`
--

DROP TABLE IF EXISTS `group_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_update` (
  `groupid` varchar(191) NOT NULL,
  `update_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`groupid`),
  KEY `groupid` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `irc_custom`
--

DROP TABLE IF EXISTS `irc_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `irc_custom` (
  `jid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `i_irc_custom_jid_host` (`jid`(75),`host`(75)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `last`
--

DROP TABLE IF EXISTS `last`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `last` (
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `seconds` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `presence` tinyint(1) NOT NULL DEFAULT '0',
  `state` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license` (
  `license_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `sdk` varchar(45) NOT NULL,
  `expire_date` date NOT NULL,
  `activation_key` varchar(45) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company` varchar(150) NOT NULL,
  PRIMARY KEY (`license_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media_call_logs`
--

DROP TABLE IF EXISTS `media_call_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_call_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` varchar(100) DEFAULT NULL,
  `from_user` varchar(50) DEFAULT NULL,
  `to_user` varchar(50) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT '',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `called_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `called_type` enum('AUDIO','VIDEO') DEFAULT NULL,
  `call_mode` enum('ONETOONE','ONETOMANY') DEFAULT NULL,
  `caller_device` varchar(255) DEFAULT NULL,
  `call_status` enum('ENGAGED','CALLING','ENDED','BUSY','ATTENDED') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6127 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meeting_participants`
--

DROP TABLE IF EXISTS `meeting_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` varchar(15) NOT NULL,
  `participant_email` varchar(255) DEFAULT NULL,
  `participant_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `participant_name` varchar(255) DEFAULT NULL,
  `participant_call_status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_participants_index` (`meeting_id`,`participant_email`,`participant_status`),
  CONSTRAINT `meeting_participants_ibfk_1` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`meeting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6223 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meeting_socket_details`
--

DROP TABLE IF EXISTS `meeting_socket_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_socket_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` varchar(255) NOT NULL DEFAULT '',
  `socket_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`email_id`),
  KEY `meeting_socket_details_index` (`email_id`,`socket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` varchar(15) NOT NULL,
  `meeting_name` varchar(255) DEFAULT NULL,
  `organizer_email` varchar(255) DEFAULT NULL,
  `meeting_type` varchar(255) DEFAULT NULL,
  `recurring` bit(1) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time_start` bigint(20) DEFAULT NULL,
  `time_end` bigint(20) DEFAULT NULL,
  `cancelled` bit(1) DEFAULT NULL,
  `audio` bit(1) DEFAULT NULL,
  `video` bit(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`meeting_id`),
  KEY `meetings_index` (`meeting_id`,`meeting_name`,`organizer_email`,`meeting_type`,`recurring`,`date`,`cancelled`)
) ENGINE=InnoDB AUTO_INCREMENT=1116 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_delivery_status`
--

DROP TABLE IF EXISTS `message_delivery_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_delivery_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` varchar(100) DEFAULT NULL,
  `from_jid` varchar(100) DEFAULT NULL,
  `to_jid` varchar(100) DEFAULT NULL,
  `app_state` varchar(40) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `os` varchar(40) DEFAULT NULL,
  `message_type` varchar(40) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `delivered` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3479 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_favourite`
--

DROP TABLE IF EXISTS `message_favourite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_favourite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `favourite_user` varchar(180) NOT NULL,
  `message_id` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_message_favourite` (`favourite_user`,`message_id`),
  KEY `from_user` (`favourite_user`,`message_id`),
  KEY `to_user` (`favourite_user`),
  KEY `message_id` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_status`
--

DROP TABLE IF EXISTS `message_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` varchar(100) NOT NULL,
  `to_user` varchar(100) NOT NULL,
  `message_id` varchar(150) NOT NULL,
  `message_type` varchar(10) NOT NULL DEFAULT '0',
  `chat_type` varchar(10) NOT NULL,
  `broadcast_id` varchar(191) NOT NULL,
  `broadcast_msg_id` varchar(100) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `recent` tinyint(4) NOT NULL DEFAULT '0',
  `recall_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `favourite_status` tinyint(4) NOT NULL DEFAULT '0',
  `favourite_by` varchar(191) NOT NULL DEFAULT '0',
  `favourite_date` datetime DEFAULT NULL,
  `deleted_status` tinyint(4) NOT NULL DEFAULT '0',
  `deleted_by` varchar(191) NOT NULL DEFAULT '0',
  `blocked` varchar(250) NOT NULL DEFAULT '0',
  `from_notification` varchar(191) NOT NULL,
  `to_notification` varchar(100) NOT NULL,
  `message_notification` int(1) NOT NULL,
  `txt` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `received_at` datetime NOT NULL,
  `seen_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `edit_msg_id` varchar(150) NOT NULL,
  `sd_timer` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`message_id`,`from_user`,`to_user`),
  KEY `deleted_by` (`deleted_by`),
  KEY `message_status_msg_id` (`message_id`),
  KEY `from_user_to_user` (`from_user`,`to_user`)
) ENGINE=InnoDB AUTO_INCREMENT=1176669 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mix_channel`
--

DROP TABLE IF EXISTS `mix_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mix_channel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `jid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `hmac_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_mix_channel` (`channel`(191),`service`(191)),
  KEY `i_mix_channel_serv` (`service`(191))
) ENGINE=InnoDB AUTO_INCREMENT=1611 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mix_pam`
--

DROP TABLE IF EXISTS `mix_pam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mix_pam` (
  `pam_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `affiliation` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pam_id`),
  UNIQUE KEY `i_mix_pam` (`username`(191),`channel`(191),`service`(191)),
  KEY `i_mix_pam_u` (`username`(191))
) ENGINE=InnoDB AUTO_INCREMENT=6929 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mix_participant`
--

DROP TABLE IF EXISTS `mix_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mix_participant` (
  `participant_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `jid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nick` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`participant_id`),
  UNIQUE KEY `i_mix_participant` (`channel`(191),`service`(191),`username`(191),`domain`(191)),
  KEY `i_mix_participant_chan_serv` (`channel`(191),`service`(191))
) ENGINE=InnoDB AUTO_INCREMENT=6910 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mix_subscription`
--

DROP TABLE IF EXISTS `mix_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mix_subscription` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `node` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `jid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_mix_subscription` (`channel`(153),`service`(153),`username`(153),`domain`(153),`node`(153)),
  KEY `i_mix_subscription_chan_serv_ud` (`channel`(191),`service`(191),`username`(191),`domain`(191)),
  KEY `i_mix_subscription_chan_serv_node` (`channel`(191),`service`(191),`node`(191)),
  KEY `i_mix_subscription_chan_serv` (`channel`(191),`service`(191))
) ENGINE=InnoDB AUTO_INCREMENT=13813 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `motd`
--

DROP TABLE IF EXISTS `motd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motd` (
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xml` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `muc_registered`
--

DROP TABLE IF EXISTS `muc_registered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muc_registered` (
  `jid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nick` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `i_muc_registered_jid_host` (`jid`(75),`host`(75)) USING BTREE,
  KEY `i_muc_registered_nick` (`nick`(75)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `muc_room`
--

DROP TABLE IF EXISTS `muc_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muc_room` (
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `opts` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `i_muc_room_name_host` (`name`(75),`host`(75)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_token`
--

DROP TABLE IF EXISTS `oauth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_token` (
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire` bigint(20) NOT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `privacy_default_list`
--

DROP TABLE IF EXISTS `privacy_default_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privacy_default_list` (
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `privacy_list`
--

DROP TABLE IF EXISTS `privacy_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privacy_list` (
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `i_privacy_list_username_name` (`username`(75),`name`(75)) USING BTREE,
  KEY `i_privacy_list_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `privacy_list_data`
--

DROP TABLE IF EXISTS `privacy_list_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privacy_list_data` (
  `id` bigint(20) DEFAULT NULL,
  `t` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ord` decimal(10,0) NOT NULL,
  `match_all` tinyint(1) NOT NULL,
  `match_iq` tinyint(1) NOT NULL,
  `match_message` tinyint(1) NOT NULL,
  `match_presence_in` tinyint(1) NOT NULL,
  `match_presence_out` tinyint(1) NOT NULL,
  KEY `i_privacy_list_data_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `private_storage`
--

DROP TABLE IF EXISTS `private_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `private_storage` (
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namespace` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `i_private_storage_username_namespace` (`username`(75),`namespace`(75)) USING BTREE,
  KEY `i_private_storage_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proxy65`
--

DROP TABLE IF EXISTS `proxy65`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy65` (
  `sid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pid_t` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pid_i` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `node_t` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `node_i` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `jid_i` text COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `i_proxy65_sid` (`sid`(191)),
  KEY `i_proxy65_jid` (`jid_i`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pubsub_item`
--

DROP TABLE IF EXISTS `pubsub_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pubsub_item` (
  `nodeid` bigint(20) DEFAULT NULL,
  `itemid` text COLLATE utf8mb4_unicode_ci,
  `publisher` text COLLATE utf8mb4_unicode_ci,
  `creation` text COLLATE utf8mb4_unicode_ci,
  `modification` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `message_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `i_pubsub_item_tuple` (`nodeid`,`itemid`(36)),
  KEY `i_pubsub_item_itemid` (`itemid`(36)),
  KEY `pubsub_msg_id_index` (`message_id`),
  CONSTRAINT `pubsub_item_ibfk_1` FOREIGN KEY (`nodeid`) REFERENCES `pubsub_node` (`nodeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pubsub_node`
--

DROP TABLE IF EXISTS `pubsub_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pubsub_node` (
  `host` text COLLATE utf8mb4_unicode_ci,
  `node` text COLLATE utf8mb4_unicode_ci,
  `parent` text COLLATE utf8mb4_unicode_ci,
  `plugin` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci,
  `nodeid` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`nodeid`),
  UNIQUE KEY `i_pubsub_node_tuple` (`host`(20),`node`(120)),
  KEY `i_pubsub_node_parent` (`parent`(120))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pubsub_node_option`
--

DROP TABLE IF EXISTS `pubsub_node_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pubsub_node_option` (
  `nodeid` bigint(20) DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `val` text COLLATE utf8mb4_unicode_ci,
  KEY `i_pubsub_node_option_nodeid` (`nodeid`),
  CONSTRAINT `pubsub_node_option_ibfk_1` FOREIGN KEY (`nodeid`) REFERENCES `pubsub_node` (`nodeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pubsub_node_owner`
--

DROP TABLE IF EXISTS `pubsub_node_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pubsub_node_owner` (
  `nodeid` bigint(20) DEFAULT NULL,
  `owner` text COLLATE utf8mb4_unicode_ci,
  KEY `i_pubsub_node_owner_nodeid` (`nodeid`),
  CONSTRAINT `pubsub_node_owner_ibfk_1` FOREIGN KEY (`nodeid`) REFERENCES `pubsub_node` (`nodeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pubsub_state`
--

DROP TABLE IF EXISTS `pubsub_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pubsub_state` (
  `nodeid` bigint(20) DEFAULT NULL,
  `jid` text COLLATE utf8mb4_unicode_ci,
  `affiliation` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscriptions` text COLLATE utf8mb4_unicode_ci,
  `stateid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`stateid`),
  UNIQUE KEY `i_pubsub_state_tuple` (`nodeid`,`jid`(60)),
  KEY `i_pubsub_state_jid` (`jid`(60)),
  CONSTRAINT `pubsub_state_ibfk_1` FOREIGN KEY (`nodeid`) REFERENCES `pubsub_node` (`nodeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pubsub_subscription_opt`
--

DROP TABLE IF EXISTS `pubsub_subscription_opt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pubsub_subscription_opt` (
  `subid` text COLLATE utf8mb4_unicode_ci,
  `opt_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opt_value` text COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `i_pubsub_subscription_opt` (`subid`(32),`opt_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `push_session`
--

DROP TABLE IF EXISTS `push_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `push_session` (
  `username` text NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `service` text NOT NULL,
  `node` text NOT NULL,
  `xml` text NOT NULL,
  UNIQUE KEY `i_push_usn` (`username`(191),`service`(191),`node`(191)),
  UNIQUE KEY `i_push_ut` (`username`(191),`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quotes_messages`
--

DROP TABLE IF EXISTS `quotes_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes_messages` (
  `quotes_id` int(11) NOT NULL AUTO_INCREMENT,
  `quotes_message` text NOT NULL,
  `quotes_type` varchar(100) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `is_sent` tinyint(1) NOT NULL DEFAULT '0',
  `wishes_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `team_id` varchar(45) DEFAULT NULL,
  `file_duration` varchar(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`quotes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=996 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quotes_types`
--

DROP TABLE IF EXISTS `quotes_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes_types` (
  `quotestype_id` int(11) NOT NULL AUTO_INCREMENT,
  `quotes_type` varchar(200) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`quotestype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roster_version`
--

DROP TABLE IF EXISTS `roster_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roster_version` (
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rostergroups`
--

DROP TABLE IF EXISTS `rostergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rostergroups` (
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grp` text COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `pk_rosterg_user_jid` (`username`(75),`jid`(75))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rosterusers`
--

DROP TABLE IF EXISTS `rosterusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rosterusers` (
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jid_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nick` text COLLATE utf8mb4_unicode_ci,
  `subscription` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ask` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `askmessage` text COLLATE utf8mb4_unicode_ci,
  `server` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscribe` text COLLATE utf8mb4_unicode_ci,
  `type` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `i_rosteru_user_jid` (`username`(75),`jid`(75)),
  KEY `i_rosteru_username` (`username`),
  KEY `i_rosteru_jid` (`jid`),
  KEY `jid_username` (`jid_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `domain` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `server_host` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `node` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `local_hint` text COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `i_route` (`domain`(75),`server_host`(75),`node`(75),`pid`(75)),
  KEY `i_route_domain` (`domain`(75))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(50) NOT NULL,
  `admin_user` varchar(50) NOT NULL,
  `secret_key` varchar(250) NOT NULL,
  `access_key` varchar(250) NOT NULL,
  `bucket_name` varchar(50) NOT NULL,
  `bucket_region` varchar(100) NOT NULL,
  `bucket_version` varchar(100) NOT NULL,
  `google_translate` varchar(194) NOT NULL,
  `mail_login` varchar(3) NOT NULL,
  `video_limit` int(5) NOT NULL,
  `audio_limit` int(4) NOT NULL,
  `recall_time` int(4) NOT NULL,
  `private_time` int(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `feedback_from` varchar(25) NOT NULL,
  `feedback_to` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sm`
--

DROP TABLE IF EXISTS `sm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sm` (
  `usec` bigint(20) NOT NULL,
  `pid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `node` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `i_sid` (`usec`,`pid`(75)),
  KEY `i_node` (`node`(75)),
  KEY `i_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spool`
--

DROP TABLE IF EXISTS `spool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spool` (
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xml` blob NOT NULL,
  `seq` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` blob NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `seq` (`seq`),
  KEY `i_despool` (`username`) USING BTREE,
  KEY `i_spool_created_at` (`created_at`) USING BTREE,
  KEY `i_spool_message_id` (`message_id`(191))
) ENGINE=InnoDB AUTO_INCREMENT=86501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sr_group`
--

DROP TABLE IF EXISTS `sr_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sr_group` (
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opts` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sr_user`
--

DROP TABLE IF EXISTS `sr_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sr_user` (
  `jid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grp` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `i_sr_user_jid_group` (`jid`(75),`grp`(75)),
  KEY `i_sr_user_jid` (`jid`),
  KEY `i_sr_user_grp` (`grp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `room_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_index` (`id`,`team_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team_members`
--

DROP TABLE IF EXISTS `team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `call_status` varchar(255) NOT NULL,
  `online_status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `profile_image_url` varchar(255) NOT NULL,
  `room_id` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `rooms_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  KEY `team_members_index` (`id`,`team_id`,`email`,`status`,`call_status`,`online_status`),
  CONSTRAINT `team_members_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_mobile_status`
--

DROP TABLE IF EXISTS `user_mobile_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_mobile_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jid` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `os` varchar(40) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permission` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permissions` longtext COLLATE utf8_unicode_ci,
  `created_by` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_by` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deletable` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ws_password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `serverkey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `salt` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `iterationcount` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_admin`
--

DROP TABLE IF EXISTS `users_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) CHARACTER SET latin1 NOT NULL,
  `password` varchar(100) CHARACTER SET latin1 NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(200) NOT NULL,
  `mobile_number` varchar(45) DEFAULT NULL,
  `user_type` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_active` int(11) NOT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `remember_token` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  `image` text,
  `hashed_password` varchar(100) DEFAULT NULL,
  `salt_password` varchar(100) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_bot`
--

DROP TABLE IF EXISTS `users_bot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_bot` (
  `username` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_details`
--

DROP TABLE IF EXISTS `users_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_details` (
  `country_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile_number` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `otp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resource` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `device_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `device_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` tinyint(4) NOT NULL DEFAULT '0',
  `notification` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vcard`
--

DROP TABLE IF EXISTS `vcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcard` (
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vcard` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vcard_search`
--

DROP TABLE IF EXISTS `vcard_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcard_search` (
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lusername` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fn` text COLLATE utf8mb4_unicode_ci,
  `lfn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `family` text COLLATE utf8mb4_unicode_ci,
  `lfamily` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `given` text COLLATE utf8mb4_unicode_ci,
  `lgiven` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `middle` text COLLATE utf8mb4_unicode_ci,
  `lmiddle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `nickname` text COLLATE utf8mb4_unicode_ci,
  `lnickname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `bday` text COLLATE utf8mb4_unicode_ci,
  `lbday` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `ctry` text COLLATE utf8mb4_unicode_ci,
  `lctry` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `locality` text COLLATE utf8mb4_unicode_ci,
  `llocality` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `email` text COLLATE utf8mb4_unicode_ci,
  `lemail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `image` text COLLATE utf8mb4_unicode_ci,
  `limage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `imageprivacy` text COLLATE utf8mb4_unicode_ci,
  `limageprivacy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` text COLLATE utf8mb4_unicode_ci,
  `lstatus` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `mobilenumber` text COLLATE utf8mb4_unicode_ci,
  `lmobilenumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `orgname` text COLLATE utf8mb4_unicode_ci,
  `lorgname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `orgunit` text COLLATE utf8mb4_unicode_ci,
  `lorgunit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `designation` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ldesignation` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coverimg` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lcoverimg` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`username`),
  KEY `i_vcard_search_lfn` (`lfn`),
  KEY `i_vcard_search_lfamily` (`lfamily`),
  KEY `i_vcard_search_lgiven` (`lgiven`),
  KEY `i_vcard_search_lmiddle` (`lmiddle`),
  KEY `i_vcard_search_lnickname` (`lnickname`),
  KEY `i_vcard_search_lbday` (`lbday`),
  KEY `i_vcard_search_lctry` (`lctry`),
  KEY `i_vcard_search_llocality` (`llocality`),
  KEY `i_vcard_search_lemail` (`lemail`),
  KEY `i_vcard_search_lorgname` (`lorgname`),
  KEY `i_vcard_search_lorgunit` (`lorgunit`),
  KEY `i_vcard_search_lmobilenumber` (`lmobilenumber`),
  KEY `lusername` (`lusername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vcard_xupdate`
--

DROP TABLE IF EXISTS `vcard_xupdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcard_xupdate` (
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-07 18:40:32
