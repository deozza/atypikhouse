-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 05 mai 2019 à 22:45
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `atypikhouse`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_token`
--

DROP TABLE IF EXISTS `api_token`;
CREATE TABLE IF NOT EXISTS `api_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kind` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7BA2F5EBA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `api_token`
--

INSERT INTO `api_token` (`id`, `user_id`, `token`, `kind`) VALUES
(1, 1, 'token_userActive_AUTH_TOKEN', 'AUTH_TOKEN'),
(2, 1, 'token_userActive_RESET_TOKEN', 'AUTH_TOKEN'),
(3, 2, 'token_userInactive_AUTH_TOKEN', 'AUTH_TOKEN'),
(4, 2, 'token_userInactive_RESET_TOKEN', 'AUTH_TOKEN'),
(5, 3, 'token_userForbidden_AUTH_TOKEN', 'AUTH_TOKEN'),
(6, 3, 'token_userForbidden_RESET_TOKEN', 'AUTH_TOKEN'),
(7, 4, 'token_userAdmin_AUTH_TOKEN', 'AUTH_TOKEN');

-- --------------------------------------------------------

--
-- Structure de la table `entity`
--

DROP TABLE IF EXISTS `entity`;
CREATE TABLE IF NOT EXISTS `entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `kind` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation_state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:object)',
  `date_of_creation` date NOT NULL,
  `properties` json NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E284468D17F50A6` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `entity`
--

INSERT INTO `entity` (`id`, `uuid`, `kind`, `validation_state`, `owner`, `date_of_creation`, `properties`) VALUES
(1, '00100000-0000-4000-a000-000000000000', 'annonce', 'posted', 'O:15:\"App\\Entity\\User\":11:{s:19:\"\0App\\Entity\\User\0id\";i:1;s:25:\"\0App\\Entity\\User\0username\";s:10:\"userActive\";s:30:\"\0App\\Entity\\User\0plainPassword\";N;s:28:\"\0App\\Entity\\User\0newPassword\";N;s:25:\"\0App\\Entity\\User\0password\";s:60:\"$2y$13$kIyl27gph8NXf7U1LPzysebEz5dSnnIRxiI/xJ2oISBK5yXwCvOwW\";s:22:\"\0App\\Entity\\User\0email\";s:19:\"userActive@mail.com\";s:26:\"\0App\\Entity\\User\0lastLogin\";N;s:32:\"\0App\\Entity\\User\0lastFailedLogin\";N;s:29:\"\0App\\Entity\\User\0registerDate\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2019-05-05 22:44:57.651070\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:23:\"\0App\\Entity\\User\0active\";b:1;s:22:\"\0App\\Entity\\User\0roles\";a:0:{}}', '2019-05-05', '{\"price\": 825, \"title\": \"Mais un défaut plus grave, et qu\'il eût au moins que la peau du nez se tirait vers l\'abîme le.\", \"description\": [[\"Oh! oui, bien belle! Et, s\'étant salués, on se poussa, pêle-mêle, vers le front tendu. Elle se détournait pas. Elle se laissa tomber sur ses bandeaux, la vue du sang des autres à un mois d\'échéance.\"]], \"nbPersonMax\": 3, \"annonce_category\": \"maison\"}'),
(2, '00200000-0000-4000-a000-000000000000', 'annonce', 'public', 'O:15:\"App\\Entity\\User\":11:{s:19:\"\0App\\Entity\\User\0id\";i:1;s:25:\"\0App\\Entity\\User\0username\";s:10:\"userActive\";s:30:\"\0App\\Entity\\User\0plainPassword\";N;s:28:\"\0App\\Entity\\User\0newPassword\";N;s:25:\"\0App\\Entity\\User\0password\";s:60:\"$2y$13$kIyl27gph8NXf7U1LPzysebEz5dSnnIRxiI/xJ2oISBK5yXwCvOwW\";s:22:\"\0App\\Entity\\User\0email\";s:19:\"userActive@mail.com\";s:26:\"\0App\\Entity\\User\0lastLogin\";N;s:32:\"\0App\\Entity\\User\0lastFailedLogin\";N;s:29:\"\0App\\Entity\\User\0registerDate\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2019-05-05 22:44:57.651070\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:23:\"\0App\\Entity\\User\0active\";b:1;s:22:\"\0App\\Entity\\User\0roles\";a:0:{}}', '2019-05-05', '{\"price\": 582, \"title\": \"Cependant, elle sentait le suif, le cuir des selles craquait. Au moment où Justin vint le.\", \"description\": [[\"Bovary mère, qui était posée devant le comptoir, le mot laboratoire se déroule au-dessus d\'une porte vitrée qui, à la ligne. On quitte la grande rue par les rues, tête haute, sans peur, disait.\"]], \"nbPersonMax\": 1, \"annonce_category\": \"maison\"}'),
(3, '00300000-0000-4000-a000-000000000000', 'annonce', 'public', 'O:15:\"App\\Entity\\User\":11:{s:19:\"\0App\\Entity\\User\0id\";i:3;s:25:\"\0App\\Entity\\User\0username\";s:13:\"userForbidden\";s:30:\"\0App\\Entity\\User\0plainPassword\";N;s:28:\"\0App\\Entity\\User\0newPassword\";N;s:25:\"\0App\\Entity\\User\0password\";s:60:\"$2y$13$BtX1k4el3Mca/7IcDMaWiO5ZGAzs1pHj93BRIOH8CkE9kzr3wLMQW\";s:22:\"\0App\\Entity\\User\0email\";s:22:\"userForbidden@mail.com\";s:26:\"\0App\\Entity\\User\0lastLogin\";N;s:32:\"\0App\\Entity\\User\0lastFailedLogin\";N;s:29:\"\0App\\Entity\\User\0registerDate\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2019-05-05 22:44:58.529378\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:23:\"\0App\\Entity\\User\0active\";b:1;s:22:\"\0App\\Entity\\User\0roles\";a:0:{}}', '2019-05-05', '{\"price\": 569, \"title\": \"Si son enfance se fût agi d\'une exécution capitale. On discutait chez l\'épicier sur la cheminée.\", \"description\": [[\"Les pompiers, au bas de son bonnet. Pour se mettre en pension, cela coûterait beaucoup; comment faire? Alors il regarda derrière lui, il se dit malade; ensuite il sortait; puis elle l\'entretenait de.\"]], \"nbPersonMax\": 5, \"annonce_category\": \"maison\"}'),
(4, '00100000-0000-5000-a000-000000000000', 'reservation', 'posted', 'O:15:\"App\\Entity\\User\":11:{s:19:\"\0App\\Entity\\User\0id\";i:1;s:25:\"\0App\\Entity\\User\0username\";s:10:\"userActive\";s:30:\"\0App\\Entity\\User\0plainPassword\";N;s:28:\"\0App\\Entity\\User\0newPassword\";N;s:25:\"\0App\\Entity\\User\0password\";s:60:\"$2y$13$kIyl27gph8NXf7U1LPzysebEz5dSnnIRxiI/xJ2oISBK5yXwCvOwW\";s:22:\"\0App\\Entity\\User\0email\";s:19:\"userActive@mail.com\";s:26:\"\0App\\Entity\\User\0lastLogin\";N;s:32:\"\0App\\Entity\\User\0lastFailedLogin\";N;s:29:\"\0App\\Entity\\User\0registerDate\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2019-05-05 22:44:57.651070\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:23:\"\0App\\Entity\\User\0active\";b:1;s:22:\"\0App\\Entity\\User\0roles\";a:0:{}}', '2019-05-05', '{\"annonce\": \"00200000-0000-4000-a000-000000000000\", \"date_end\": {\"date\": \"2019-08-10 00:00:00.000000\", \"timezone\": \"UTC\", \"timezone_type\": 3}, \"nbPerson\": \"1\", \"date_begin\": {\"date\": \"2019-08-01 00:00:00.000000\", \"timezone\": \"UTC\", \"timezone_type\": 3}}');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_failed_login` datetime DEFAULT NULL,
  `register_date` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `roles` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `last_login`, `last_failed_login`, `register_date`, `active`, `roles`) VALUES
(1, 'userActive', '$2y$13$kIyl27gph8NXf7U1LPzysebEz5dSnnIRxiI/xJ2oISBK5yXwCvOwW', 'userActive@mail.com', NULL, NULL, '2019-05-05 22:44:57', 1, '[]'),
(2, 'userInactive', '$2y$13$X19K87un7ho8kdmlNIIki.kHQlpWZwEDhJCGGlxJf16xY3nIZ2/yi', 'userInactive@mail.com', NULL, NULL, '2019-05-05 22:44:58', 0, '[]'),
(3, 'userForbidden', '$2y$13$BtX1k4el3Mca/7IcDMaWiO5ZGAzs1pHj93BRIOH8CkE9kzr3wLMQW', 'userForbidden@mail.com', NULL, NULL, '2019-05-05 22:44:58', 1, '[]'),
(4, 'userAdmin', '$2y$13$XevWmm.Ken8WRJjK55WFMu/tLyMyaKz80Ju5Y7JJ5Jw1kUoCY17M.', 'userAdmin@mail.com', NULL, NULL, '2019-05-05 22:44:58', 1, '[\"ROLE_ADMIN\"]');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_token`
--
ALTER TABLE `api_token`
  ADD CONSTRAINT `FK_7BA2F5EBA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
