-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2022 at 03:11 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id`, `libelle`) VALUES
(1, 'GLRS LICENCE2'),
(2, 'LICENCE3 GLRS '),
(4, 'MAE LICENCE3'),
(11, 'Licence1'),
(13, 'Licence1 mae'),
(14, 'LICENCE2 CDSD'),
(15, 'gthyhy');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `matricule` varchar(25) NOT NULL,
  `nomComplet` varchar(25) NOT NULL,
  `tuteur` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `matricule`, `nomComplet`, `tuteur`) VALUES
(1, 'dfgngf', 'fxfgbx', 'fxfbgf'),
(2, 'cfggf', 'fhh', 'gfjjfhj'),
(3, 'hgj', 'hgfgj', 'gfjhj');

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `annee` varchar(25) NOT NULL,
  `etat` varchar(25) NOT NULL,
  `classe_id` int NOT NULL,
  `etudiant_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `classe_id` (`classe_id`),
  KEY `etudiant_id` (`etudiant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id`, `annee`, `etat`, `classe_id`, `etudiant_id`) VALUES
(2, '2020', 'Inscrit', 11, 3);

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
CREATE TABLE IF NOT EXISTS `professeur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nci` int NOT NULL,
  `nomComplet` varchar(25) NOT NULL,
  `grade` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`id`, `nci`, `nomComplet`, `grade`) VALUES
(1, 22255, 'Baila Wane', 'senior'),
(2, 22255, 'Baila Wane', 'senior'),
(3, 154185, 'fvfvfgvb', 'fvfvfg'),
(4, 11111, 'hyhj', 'thhhrh');

-- --------------------------------------------------------

--
-- Structure de la table `prof_classe`
--

DROP TABLE IF EXISTS `prof_classe`;
CREATE TABLE IF NOT EXISTS `prof_classe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prof_id` int NOT NULL,
  `classe_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prof_id` (`prof_id`),
  KEY `classe_id` (`classe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `prof_classe`
--

INSERT INTO `prof_classe` (`id`, `prof_id`, `classe_id`) VALUES
(1, 3, 1),
(2, 2, 1),
(3, 1, 4),
(4, 1, 14),
(5, 1, 14),
(6, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(25) NOT NULL,
  `login` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `nomComplet` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `role`, `login`, `password`, `nomComplet`) VALUES
(1, 'RP', 'mouhamed@gmail.com', 'matar', 'responsable'),
(2, 'AC', 'ac@gmail.com', 'passer', 'Attache'),
(3, 'ROLE_AC', 'ac', 'ac', 'Attache');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
