-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 02 juin 2019 à 20:37
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
(1, '00100000-0000-4000-a000-000000000000', 'annonce', 'posted', 'O:15:\"App\\Entity\\User\":11:{s:19:\"\0App\\Entity\\User\0id\";i:1;s:25:\"\0App\\Entity\\User\0username\";s:10:\"userActive\";s:30:\"\0App\\Entity\\User\0plainPassword\";N;s:28:\"\0App\\Entity\\User\0newPassword\";N;s:25:\"\0App\\Entity\\User\0password\";s:60:\"$2y$13$stmTunLUamotWX2Y95Q7.O0OvIi7yuRMyfSI73jTvMqNNtT6xBK72\";s:22:\"\0App\\Entity\\User\0email\";s:19:\"userActive@mail.com\";s:26:\"\0App\\Entity\\User\0lastLogin\";N;s:32:\"\0App\\Entity\\User\0lastFailedLogin\";N;s:29:\"\0App\\Entity\\User\0registerDate\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2019-06-02 20:36:57.413372\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:23:\"\0App\\Entity\\User\0active\";b:1;s:22:\"\0App\\Entity\\User\0roles\";a:0:{}}', '2019-06-02', '{\"price\": 525, \"title\": \"Nous avons eu pour notre arrondissement de la pharmacie, je m\'étais mis en poudre au moyen.\", \"description\": [[\"Lefrançois n\'arrivât tout effarée en s\'écriant: -- Charles, prends garde à toi! Alors la mère Bovary en appliquant son doigt les terrines de lait dans la cuisine. De temps à autre. Une grande.\"]], \"nbPersonMax\": 5, \"annonce_category\": \"maison\"}'),
(2, '00200000-0000-4000-a000-000000000000', 'annonce', 'public', 'O:15:\"App\\Entity\\User\":11:{s:19:\"\0App\\Entity\\User\0id\";i:1;s:25:\"\0App\\Entity\\User\0username\";s:10:\"userActive\";s:30:\"\0App\\Entity\\User\0plainPassword\";N;s:28:\"\0App\\Entity\\User\0newPassword\";N;s:25:\"\0App\\Entity\\User\0password\";s:60:\"$2y$13$stmTunLUamotWX2Y95Q7.O0OvIi7yuRMyfSI73jTvMqNNtT6xBK72\";s:22:\"\0App\\Entity\\User\0email\";s:19:\"userActive@mail.com\";s:26:\"\0App\\Entity\\User\0lastLogin\";N;s:32:\"\0App\\Entity\\User\0lastFailedLogin\";N;s:29:\"\0App\\Entity\\User\0registerDate\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2019-06-02 20:36:57.413372\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:23:\"\0App\\Entity\\User\0active\";b:1;s:22:\"\0App\\Entity\\User\0roles\";a:0:{}}', '2019-06-02', '{\"price\": 288, \"title\": \"Mais, à présent, veulent des blouses étroites et des considérations plus relevées. Ainsi, l\'éloge.\", \"description\": [[\"Et il descendit confier à l\'ecclésiastique un gros châle pour qu\'il prît au moins que la futaille fut bien placée; il indiqua une méchante masure sise à Barneville, près d\'Aumale, qui ne l\'avait.\"]], \"nbPersonMax\": 7, \"annonce_category\": \"maison\"}'),
(3, '00300000-0000-4000-a000-000000000000', 'annonce', 'public', 'O:15:\"App\\Entity\\User\":11:{s:19:\"\0App\\Entity\\User\0id\";i:3;s:25:\"\0App\\Entity\\User\0username\";s:13:\"userForbidden\";s:30:\"\0App\\Entity\\User\0plainPassword\";N;s:28:\"\0App\\Entity\\User\0newPassword\";N;s:25:\"\0App\\Entity\\User\0password\";s:60:\"$2y$13$E2xhTykNu92yauiKV9eYn.Ps63CQgUey4FwzrGpRyx3GTTvtiTBBi\";s:22:\"\0App\\Entity\\User\0email\";s:22:\"userForbidden@mail.com\";s:26:\"\0App\\Entity\\User\0lastLogin\";N;s:32:\"\0App\\Entity\\User\0lastFailedLogin\";N;s:29:\"\0App\\Entity\\User\0registerDate\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2019-06-02 20:36:58.271620\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:23:\"\0App\\Entity\\User\0active\";b:1;s:22:\"\0App\\Entity\\User\0roles\";a:0:{}}', '2019-06-02', '{\"price\": 574, \"title\": \"Il confondit l\'avant-scène avec les cheveux gras de pommade à la haine nombreuse qui résultait de.\", \"description\": [[\"Cependant vous parlez bien, dit Emma, que vous offraient des femmes qui tenaient des paniers sur la lèvre qu\'une irréalisable envie d\'une volupté plus haute. Un râle métallique se traîna dans les.\"]], \"nbPersonMax\": 6, \"annonce_category\": \"maison\"}'),
(4, '00100000-0000-5000-a000-000000000000', 'reservation', 'posted', 'O:15:\"App\\Entity\\User\":11:{s:19:\"\0App\\Entity\\User\0id\";i:5;s:25:\"\0App\\Entity\\User\0username\";s:11:\"userActive2\";s:30:\"\0App\\Entity\\User\0plainPassword\";N;s:28:\"\0App\\Entity\\User\0newPassword\";N;s:25:\"\0App\\Entity\\User\0password\";s:60:\"$2y$13$bGhiwnjs1YYjtZaa8Ep4Nunvx5QdTtdomzUcLLZvFuZBXD8PnYkEi\";s:22:\"\0App\\Entity\\User\0email\";s:20:\"userActive2@mail.com\";s:26:\"\0App\\Entity\\User\0lastLogin\";N;s:32:\"\0App\\Entity\\User\0lastFailedLogin\";N;s:29:\"\0App\\Entity\\User\0registerDate\";O:8:\"DateTime\":3:{s:4:\"date\";s:26:\"2019-06-02 20:36:59.106665\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:23:\"\0App\\Entity\\User\0active\";b:1;s:22:\"\0App\\Entity\\User\0roles\";a:0:{}}', '2019-06-02', '{\"annonce\": {\"uuid\": \"00200000-0000-4000-a000-000000000000\", \"owner\": 1}, \"date_end\": {\"date\": \"2019-08-10 00:00:00.000000\", \"timezone\": \"UTC\", \"timezone_type\": 3}, \"nbPerson\": \"1\", \"date_begin\": {\"date\": \"2019-08-01 00:00:00.000000\", \"timezone\": \"UTC\", \"timezone_type\": 3}}');

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
(1, 'userActive', '$2y$13$stmTunLUamotWX2Y95Q7.O0OvIi7yuRMyfSI73jTvMqNNtT6xBK72', 'userActive@mail.com', NULL, NULL, '2019-06-02 20:36:57', 1, '[]'),
(2, 'userInactive', '$2y$13$ngyq1Y3ewyd5Gm6ZsT1WbOur9.rAjtPdP0H5o0RlAojDbPr1F2jgu', 'userInactive@mail.com', NULL, NULL, '2019-06-02 20:36:57', 0, '[]'),
(3, 'userForbidden', '$2y$13$E2xhTykNu92yauiKV9eYn.Ps63CQgUey4FwzrGpRyx3GTTvtiTBBi', 'userForbidden@mail.com', NULL, NULL, '2019-06-02 20:36:58', 1, '[]'),
(4, 'userAdmin', '$2y$13$sMnsLfpjbgAh16vAjpfXcucPb2rIRN/ZTE9UaD7UMMo6j7vC2k2Ga', 'userAdmin@mail.com', NULL, NULL, '2019-06-02 20:36:58', 1, '[\"ROLE_ADMIN\"]'),
(5, 'userActive2', '$2y$13$bGhiwnjs1YYjtZaa8Ep4Nunvx5QdTtdomzUcLLZvFuZBXD8PnYkEi', 'userActive2@mail.com', NULL, NULL, '2019-06-02 20:36:59', 1, '[]');

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
