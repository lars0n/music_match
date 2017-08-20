-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 14 Août 2017 à 13:13
-- Version du serveur :  10.1.13-MariaDB
-- Version de PHP :  5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bdd_projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id_category` int(3) NOT NULL,
  `genre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id_category`, `genre`) VALUES
	(1, 'acoustic'),
	(2, 'afrobeat'),
	(3, 'alt-rock'),
	(4, 'alternative'),
	(5, 'ambient'),
	(6, 'anime'),
	(7, 'black-metal'),
	(8, 'bluegrass'),
	(9, 'blues'),
	(10, 'bossanova'),
	(11, 'brazil'),
	(12, 'breakbeat'),
	(13, 'british'),
	(14, 'cantopop'),
	(15, 'chicago-house'),
	(16, 'children'),
	(17, 'chill'),
	(18, 'classical'),
	(19, 'club'),
	(20, 'comedy'),
	(21, 'country'),
	(22, 'dance'),
	(23, 'dancehall'),
	(24, 'death-metal'),
	(25, 'deep-house'),
	(26, 'detroit-techno'),
	(27, 'disco'),
	(28, 'disney'),
	(29, 'drum-and-bass'),
	(30, 'dub'),
	(31, 'dubstep'),
	(32, 'edm'),
	(33, 'electro'),
	(34, 'electronic'),
	(35, 'emo'),
	(36, 'folk'),
	(37, 'forro'),
	(38, 'french'),
	(39, 'funk'),
	(40, 'garage'),
	(41, 'german'),
	(42, 'gospel'),
	(43, 'goth'),
	(44, 'grindcore'),
	(45, 'groove'),
	(46, 'grunge'),
	(47, 'guitar'),
	(48, 'happy'),
	(49, 'hard-rock'),
	(50, 'hardcore'),
	(51, 'hardstyle'),
	(52, 'heavy-metal'),
	(53, 'hip-hop'),
	(54, 'holidays'),
	(55, 'honky-tonk'),
	(56, 'house'),
	(57, 'idm'),
	(58, 'indian'),
	(59, 'indie'),
	(60, 'indie-pop'),
	(61, 'industrial'),
	(62, 'iranian'),
	(63, 'j-dance'),
	(64, 'j-idol'),
	(65, 'j-pop'),
	(66, 'j-rock'),
	(67, 'jazz'),
	(68, 'k-pop'),
	(69, 'kids'),
	(70, 'latin'),
	(71, 'latino'),
	(72, 'malay'),
	(73, 'mandopop'),
	(74, 'metal'),
	(75, 'metal-misc'),
	(76, 'metalcore'),
	(77, 'minimal-techno'),
	(78, 'movies'),
	(79, 'mpb'),
	(80, 'new-age'),
	(81, 'new-release'),
	(82, 'opera'),
	(83, 'pagode'),
	(84, 'party'),
	(85, 'philippines-opm'),
	(86, 'piano'),
	(87, 'pop'),
	(88, 'pop-film'),
	(89, 'post-dubstep'),
	(90, 'power-pop'),
	(91, 'progressive-house'),
	(92, 'psych-rock'),
	(93, 'punk'),
	(94, 'punk-rock'),
	(95, 'r-n-b'),
	(96, 'rainy-day'),
	(97, 'reggae'),
	(98, 'reggaeton'),
	(99, 'road-trip'),
	(100, 'rock'),
	(101, 'rock-n-roll'),
	(102, 'rockabilly'),
	(103, 'romance'),
	(104, 'sad'),
	(105, 'salsa'),
	(106, 'samba'),
	(107, 'sertanejo'),
	(108, 'show-tunes'),
	(109, 'singer-songwriter'),
	(110, 'ska'),
	(111, 'sleep'),
	(112, 'songwriter'),
	(113, 'soul'),
	(114, 'soundtracks'),
	(115, 'spanish'),
	(116, 'study'),
	(117, 'summer'),
	(118, 'swedish'),
	(119, 'synth-pop'),
	(120, 'tango'),
	(121, 'techno'),
	(122, 'trance'),
	(123, 'trip-hop'),
	(124, 'turkish'),
	(125, 'work-out'),
	(126, 'world-music');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` int(3) NOT NULL,
  `pseudo` varchar(20) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `email` varchar(30) NOT NULL,
  `role` varchar(50) NOT NULL,
  `register_date` datetime NOT NULL,
  `picture` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id_user`, `pseudo`, `mdp`, `email`, `role`, `register_date`, `picture`) VALUES
(16, 'larson', '$2y$10$U8C7ES3ob6Pk8', 'mail@mail.fr', 'ROLE_USER', '2017-08-16 06:06:53', 'http://i.f1g.fr/media/figaro/805x453/2016/05/04/XVMef720894-11e4-11e6-ae46-577acce3d9ab-805x500.jpg'),
(17, 'larson', '$2y$10$B7kGWT/k8PWIS', 'luront@yopmail.com', 'ROLE_USER', '0000-00-00 00:00:00', ''),
(19, 'tristan', '$2y$10$iQhtb/XYw7DuVSo799KRy.S.BcR6VJl8VReBgrdP8g1SXGsxSQ6Jq', 'luront@gmail.com', 'ROLE_USER', '0000-00-00 00:00:00', 'https://secure.parksandresorts.wdpromedia.com/resize/mwImage/1/630/354/75/wdpromedia.disney.go.com/media/wdpro-assets/parks-and-tickets/tours-and-experiences/star-wars-guided-tour/star-wars-guided-tour-00.jpg'),
(22, 'pilouououo', '$2y$10$hTsOqjiUaQ/mKEeqLMprtunNtAsuIjAs1iNI3c/OaJ62oCfpghawK', 'mail@mail.fr', 'ROLE_USER', '0000-00-00 00:00:00', NULL),
(23, 'davydfd', '$2y$10$b8ug3MWIcrAD2vUM1dsWlu8KvnYIt6x0IQ.0FZNEia1dFW9f1HA5G', 'luront@yopmail.com', 'ROLE_USER', '0000-00-00 00:00:00', NULL),
(24, 'Admin', '$2y$10$DAdjYZonB43fbGB/VGL6SOVFJsr48Jq6sfM3ot0LwPXmK8wZvgu5.', 'admin@admin.com', 'ROLE_USER', '2017-08-14 12:15:53', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_categories`
--

CREATE TABLE `user_categories` (
  `id_user_category` int(3) NOT NULL,
  `id_user` int(3) NOT NULL,
  `id_category` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user_categories`
--

INSERT INTO `user_categories` (`id_user_category`, `id_user`, `id_category`) VALUES
(1, 16, 1),
(2, 16, 23);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Index pour la table `user_categories`
--
ALTER TABLE `user_categories`
  ADD PRIMARY KEY (`id_user_category`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_category` (`id_category`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1521;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT pour la table `user_categories`
--
ALTER TABLE `user_categories`
  MODIFY `id_user_category` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `user_categories`
--
ALTER TABLE `user_categories`
  ADD CONSTRAINT `user_categories_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_categories_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
