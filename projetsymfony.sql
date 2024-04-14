-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 14 avr. 2024 à 20:34
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projetsymfony`
--

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mdp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`id`, `login`, `mdp`, `nom`, `prenom`, `statut`) VALUES
(1, 'David', '138ad57116dda0f21016f7d613381e29', 'Soeiro-Vuong', 'David', ''),
(2, 'test', '4b377d23309d4ed39c9da5791417aeff', 'Test1', 'Test1', 'Employé'),
(3, 'test2', '14e13177440e22967fe4dd9c440e0407', 'Test2', 'Test2', 'Admin'),
(4, 'test3', '82de2ba2bed2abee290199a6e22cc956', 'TEST3', 'TEST3', 'Employé'),
(5, '', '9bf31c7ff062936a96d3c8bd1f8f2ff3', 'castaing', '', '0'),
(6, '', '75e29fae68c9feec9c069ab6e11821ba', 'castaing', 'toto', '0'),
(7, '', '9bf31c7ff062936a96d3c8bd1f8f2ff3', 'castaing', 'toto', '1');

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_debut` date NOT NULL,
  `departement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leproduit_id` int DEFAULT NULL,
  `nombre_heures` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_404021BF9BB0CB11` (`leproduit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`id`, `date_debut`, `departement`, `leproduit_id`, `nombre_heures`) VALUES
(2, '2018-01-01', 'Manche', 1, 4),
(3, '2028-07-07', 'Ile de France', 1, 0),
(4, '2018-10-10', 'Val d\'Oise', 1, 10),
(7, '2029-02-01', 'moi', 1, 100000000),
(9, '2019-01-01', 'TESTETSTETS', 1, 15);

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lemploye_id` int DEFAULT NULL,
  `laformation_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5E90F6D6D3758FF7` (`lemploye_id`),
  KEY `IDX_5E90F6D68D238A59` (`laformation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id`, `statut`, `lemploye_id`, `laformation_id`) VALUES
(15, 'En attente', 2, 4),
(16, 'En attente', 2, 3),
(17, 'Acceptée', 4, 2),
(18, 'Refusée', 2, 7),
(20, 'Acceptée', 2, 2),
(22, 'Acceptée', 2, 9);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inscription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `libelle`, `inscription`) VALUES
(1, 'test', NULL),
(5, 'test2', NULL),
(6, 'test2', NULL),
(7, 'testflash', NULL),
(9, 'Word', NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `formation`
--
ALTER TABLE `formation`
  ADD CONSTRAINT `FK_404021BF9BB0CB11` FOREIGN KEY (`leproduit_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `FK_5E90F6D68D238A59` FOREIGN KEY (`laformation_id`) REFERENCES `formation` (`id`),
  ADD CONSTRAINT `FK_5E90F6D6D3758FF7` FOREIGN KEY (`lemploye_id`) REFERENCES `employe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
