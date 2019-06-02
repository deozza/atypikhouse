-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 02 juin 2019 à 19:54
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
  PRIMARY KEY (`id`),
  KEY `IDX_7BA2F5EBA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `api_token`
--

INSERT INTO `api_token` (`id`, `user_id`, `token`) VALUES
(1, 1, 'token_userActive'),
(2, 2, 'token_userInactive'),
(3, 3, 'token_userForbidden'),
(4, 4, 'token_userAdmin'),
(5, 5, 'token_userActive2');

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
(1, '00100000-0000-4000-a000-000000000000', 'annonce', 'posted', 'O:15:\"App\\Entity\\User\":11:{s:19:\"\0App\\Entity\\User\0id\";i:1;s:25:\"\0App\\Entity\\User\0username\";s:10:\"userActive\";s:30:\"\0App\\Entity\\User\0plainPassword\";N;s:28:\"\0App\\Entity\\User\0newPassword\";N;s:25:\"\0App\\Entity\\User\0password\";s:60:\"$2y$13$nbOUkgUheimodD5A5xB3kuA.6Z6Pi1HH2KmCMWdsL8VYCHL6nUAxC\";s:22:\"\0App\\Entity\\User\0email\";s:19:\"userActive@mail.com\";s:26:\"\0App\\Entity\\User\0lastLogin\";N;s:32:\"\0App\\Entity\\User\0lastFailedLogin\";N;s:29:\"\0App\\Entity\\User\0registerDate\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2019-06-02 19:54:31.457556\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:23:\"\0App\\Entity\\User\0active\";b:1;s:22:\"\0App\\Entity\\User\0roles\";a:0:{}}', '2019-06-02', '{\"price\": 428, \"title\": \"Emma, rentrée chez elle, Félicité lui montra derrière la pendule un papier gris. Elle lut: «En.\", \"description\": [[\"M. Bournisien venait la voir. Emma fut intérieurement satisfaite de se résigner à y croire. Mais, quand il s\'aperçut pourtant de son divin Fils... Bonne santé, madame; mes respects à monsieur votre.\"]], \"nbPersonMax\": 2, \"annonce_category\": \"maison\"}'),
(2, '00200000-0000-4000-a000-000000000000', 'annonce', 'public', 'O:15:\"App\\Entity\\User\":11:{s:19:\"\0App\\Entity\\User\0id\";i:1;s:25:\"\0App\\Entity\\User\0username\";s:10:\"userActive\";s:30:\"\0App\\Entity\\User\0plainPassword\";N;s:28:\"\0App\\Entity\\User\0newPassword\";N;s:25:\"\0App\\Entity\\User\0password\";s:60:\"$2y$13$nbOUkgUheimodD5A5xB3kuA.6Z6Pi1HH2KmCMWdsL8VYCHL6nUAxC\";s:22:\"\0App\\Entity\\User\0email\";s:19:\"userActive@mail.com\";s:26:\"\0App\\Entity\\User\0lastLogin\";N;s:32:\"\0App\\Entity\\User\0lastFailedLogin\";N;s:29:\"\0App\\Entity\\User\0registerDate\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2019-06-02 19:54:31.457556\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:23:\"\0App\\Entity\\User\0active\";b:1;s:22:\"\0App\\Entity\\User\0roles\";a:0:{}}', '2019-06-02', '{\"price\": 176, \"title\": \"Sur le grand mouvement de chaises. Les porteurs fatigués se ralentissaient, et elle voyait, en.\", \"description\": [[\"Charles qui dormait. Il y eut un grand soupir de satisfaction qui la reportait dans le fond, sous des globes de lampe qui s\'éteignent, à la nature, qui, d\'ordinaire, ne nous arrivent que par le.\"]], \"nbPersonMax\": 6, \"annonce_category\": \"maison\"}'),
(3, '00300000-0000-4000-a000-000000000000', 'annonce', 'public', 'O:15:\"App\\Entity\\User\":11:{s:19:\"\0App\\Entity\\User\0id\";i:3;s:25:\"\0App\\Entity\\User\0username\";s:13:\"userForbidden\";s:30:\"\0App\\Entity\\User\0plainPassword\";N;s:28:\"\0App\\Entity\\User\0newPassword\";N;s:25:\"\0App\\Entity\\User\0password\";s:60:\"$2y$13$AQSFuqmiM1vqatoENBXDvOn6O4qb8yIDas2QOgGX4aO5qJ44JnC9K\";s:22:\"\0App\\Entity\\User\0email\";s:22:\"userForbidden@mail.com\";s:26:\"\0App\\Entity\\User\0lastLogin\";N;s:32:\"\0App\\Entity\\User\0lastFailedLogin\";N;s:29:\"\0App\\Entity\\User\0registerDate\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2019-06-02 19:54:32.372156\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:23:\"\0App\\Entity\\User\0active\";b:1;s:22:\"\0App\\Entity\\User\0roles\";a:0:{}}', '2019-06-02', '{\"price\": 335, \"title\": \"Place depuis deux jours), était chargé d\'une provision de papier fraîche écrite. C\'était la.\", \"description\": [[\"C\'était un homme qui devait être de nature belliqueuse et accoutumé, à des mouchoirs de poche, dont ils tenaient un angle entre ses draps, ces messieurs le connaissaient comme leur poche!.\"]], \"nbPersonMax\": 5, \"annonce_category\": \"maison\"}'),
(4, '00100000-0000-5000-a000-000000000000', 'reservation', 'posted', 'O:15:\"App\\Entity\\User\":11:{s:19:\"\0App\\Entity\\User\0id\";i:5;s:25:\"\0App\\Entity\\User\0username\";s:11:\"userActive2\";s:30:\"\0App\\Entity\\User\0plainPassword\";N;s:28:\"\0App\\Entity\\User\0newPassword\";N;s:25:\"\0App\\Entity\\User\0password\";s:60:\"$2y$13$q0dzsga2kpSmDN/.3/.evebHMO5h93Y7kmt5bPtHM9pYpAUlWwh1.\";s:22:\"\0App\\Entity\\User\0email\";s:20:\"userActive2@mail.com\";s:26:\"\0App\\Entity\\User\0lastLogin\";N;s:32:\"\0App\\Entity\\User\0lastFailedLogin\";N;s:29:\"\0App\\Entity\\User\0registerDate\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2019-06-02 19:54:33.232024\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:23:\"\0App\\Entity\\User\0active\";b:1;s:22:\"\0App\\Entity\\User\0roles\";a:0:{}}', '2019-06-02', '{\"annonce\": {\"uuid\": \"00200000-0000-4000-a000-000000000000\", \"owner\": 1}, \"date_end\": {\"date\": \"2019-08-10 00:00:00.000000\", \"timezone\": \"UTC\", \"timezone_type\": 3}, \"nbPerson\": \"1\", \"date_begin\": {\"date\": \"2019-08-01 00:00:00.000000\", \"timezone\": \"UTC\", \"timezone_type\": 3}}');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `last_login`, `last_failed_login`, `register_date`, `active`, `roles`) VALUES
(1, 'userActive', '$2y$13$nbOUkgUheimodD5A5xB3kuA.6Z6Pi1HH2KmCMWdsL8VYCHL6nUAxC', 'userActive@mail.com', NULL, NULL, '2019-06-02 19:54:31', 1, '[]'),
(2, 'userInactive', '$2y$13$KCi/IsfaP3aBEaWs9O8.U.Ieyt.BVcKJ.nlQ1WIcl.IM2qP6UHrc2', 'userInactive@mail.com', NULL, NULL, '2019-06-02 19:54:31', 0, '[]'),
(3, 'userForbidden', '$2y$13$AQSFuqmiM1vqatoENBXDvOn6O4qb8yIDas2QOgGX4aO5qJ44JnC9K', 'userForbidden@mail.com', NULL, NULL, '2019-06-02 19:54:32', 1, '[]'),
(4, 'userAdmin', '$2y$13$tDr7lTFtTS.op4Ld3.PqBOGwKklXT.mJ1FLnnCnhm1wHEcRJjnwMi', 'userAdmin@mail.com', NULL, NULL, '2019-06-02 19:54:32', 1, '[\"ROLE_ADMIN\"]'),
(5, 'userActive2', '$2y$13$q0dzsga2kpSmDN/.3/.evebHMO5h93Y7kmt5bPtHM9pYpAUlWwh1.', 'userActive2@mail.com', NULL, NULL, '2019-06-02 19:54:33', 1, '[]');

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
