-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 22 nov. 2024 à 16:57
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e-commerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(20) NOT NULL,
  `zipCode` int NOT NULL,
  `apartmentNumber` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `city`, `zipCode`, `apartmentNumber`) VALUES
(1, 'Grenier', 6750, 6),
(2, 'Godard', 63504, 70),
(3, 'Schneiderboeuf', 56544, 2),
(4, 'Bertin', 76774, 93),
(5, 'Vasseur', 94408, 82),
(6, 'Launay-sur-Richard', 51195, 3),
(7, 'Vidal', 84184, 97),
(8, 'Hardy', 7177, 54),
(9, 'PhilippeBourg', 92246, 20),
(10, 'PerrierVille', 86696, 94);

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_users` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_users` (`id_users`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`id`, `id_users`) VALUES
(1, 9),
(2, 1),
(3, 9),
(4, 4),
(5, 7),
(6, 4),
(7, 5),
(8, 4),
(9, 1),
(10, 3);

-- --------------------------------------------------------

--
-- Structure de la table `command`
--

DROP TABLE IF EXISTS `command`;
CREATE TABLE IF NOT EXISTS `command` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cart` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cart` (`id_cart`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `command`
--

INSERT INTO `command` (`id`, `id_cart`) VALUES
(1, 5),
(2, 8),
(3, 4),
(4, 2),
(5, 7),
(6, 5),
(7, 6),
(8, 5),
(9, 9),
(10, 5);

-- --------------------------------------------------------

--
-- Structure de la table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_command` int NOT NULL,
  `id_adresse` int NOT NULL,
  `id_payment` int NOT NULL,
  `total` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_commande` (`id_command`,`id_adresse`,`id_payment`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `invoice`
--

INSERT INTO `invoice` (`id`, `id_command`, `id_adresse`, `id_payment`, `total`) VALUES
(1, 7, 6, 8, 5244),
(2, 10, 9, 7, 6897),
(3, 6, 10, 8, 2053),
(4, 5, 7, 9, 6548),
(5, 2, 9, 8, 8364),
(6, 10, 8, 8, 3178),
(7, 7, 8, 3, 1315),
(8, 7, 3, 4, 8937),
(9, 2, 9, 9, 8678),
(10, 1, 8, 7, 4346);

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paymentType` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `payment`
--

INSERT INTO `payment` (`id`, `paymentType`) VALUES
(1, 'JCB'),
(2, 'MasterCard'),
(3, 'Visa'),
(4, 'American Express'),
(5, 'MasterCard'),
(6, 'Visa'),
(7, 'American Express'),
(8, 'JCB'),
(9, 'MasterCard'),
(10, 'Visa');

-- --------------------------------------------------------

--
-- Structure de la table `price`
--

DROP TABLE IF EXISTS `price`;
CREATE TABLE IF NOT EXISTS `price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_product` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `price`
--

INSERT INTO `price` (`id`, `id_product`) VALUES
(1, 8);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `laptop` varchar(20) NOT NULL,
  `computer` varchar(20) NOT NULL,
  `screen` varchar(20) NOT NULL,
  `mouse` varchar(20) NOT NULL,
  `keyboard` varchar(20) NOT NULL,
  `id_photo_produit` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_photo_produit` (`id_photo_produit`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `laptop`, `computer`, `screen`, `mouse`, `keyboard`, `id_photo_produit`) VALUES
(1, 'Asus', 'Asus', 'Dell', 'Logitech', 'corsair', 0),
(2, 'MacBook', 'MacBook', 'Acer', 'razer', 'Asus', 0),
(3, 'Asus', 'MacBook', 'Asus', 'Asus', 'Asus', 0),
(4, 'MacBook', 'Asus', 'Dell', 'Logitech', 'apple', 0),
(5, 'Asus', 'MacBook', 'LG', 'apple', 'Logitech', 0),
(6, 'Dell', 'Lenovo', 'Lenovo', 'Asus', 'HP', 0),
(7, 'Asus', 'HP', 'Dell', 'corsair', 'apple', 0),
(8, 'Asus', 'HP', 'Dell', 'Logitech', 'razer', 0),
(9, 'Dell', 'MacBook', 'Acer', 'razer', 'Asus', 0),
(10, 'HP', 'HP', 'Acer', 'apple', 'corsair', 0);

-- --------------------------------------------------------

--
-- Structure de la table `productincart`
--

DROP TABLE IF EXISTS `productincart`;
CREATE TABLE IF NOT EXISTS `productincart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_product` int NOT NULL,
  `id_cart` int NOT NULL,
  `id_price` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`,`id_cart`,`id_price`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `productincart`
--

INSERT INTO `productincart` (`id`, `id_product`, `id_cart`, `id_price`, `quantity`) VALUES
(1, 4, 6, 9, 2);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `phone` int NOT NULL,
  `email` varchar(30) NOT NULL,
  `id_adresse` int NOT NULL,
  `id_phot_utilisateur` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_phot_utilisateur` (`id_phot_utilisateur`),
  KEY `id_adresse` (`id_adresse`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `phone`, `email`, `id_adresse`, `id_phot_utilisateur`) VALUES
(1, 'dominique59', 'michelle18', 2147483647, 'nlemaitre@dbmail.com', 0, 0),
(2, 'theodore.normand', 'ilegrand', 2147483647, 'emilie.joseph@noos.fr', 0, 0),
(3, 'therese.boulay', 'paul10', 2147483647, 'thibault27@berthelot.fr', 0, 0),
(4, 'lucie70', 'dacosta.bernadette', 2147483647, 'edias@lefebvre.com', 0, 0),
(5, 'diaz.denise', 'bcamus', 2147483647, 'alphonse.fouquet@sanchez.com', 0, 0),
(6, 'capucine45', 'tristan.rodrigues', 2147483647, 'charles56@jacques.fr', 0, 0),
(7, 'sauvage.roger', 'masse.gilles', 2147483647, 'william.blanchard@gmail.com', 0, 0),
(8, 'nguyen.nathalie', 'olivie.dupont', 2147483647, 'gilbert.guillou@salmon.com', 0, 0),
(9, 'lucas.guichard', 'sophie.brunet', 2147483647, 'suzanne95@tele2.fr', 0, 0),
(10, 'isabelle.maurice', 'madeleine89', 2147483647, 'potier.sebastien@yahoo.fr', 0, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
