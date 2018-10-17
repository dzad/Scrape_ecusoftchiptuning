-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mer 17 Octobre 2018 à 14:23
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `safar`
--

-- --------------------------------------------------------

--
-- Structure de la table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `brand` varchar(150) NOT NULL,
  `serie` varchar(150) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `cars`
--

INSERT INTO `cars` (`id`, `brand`, `serie`, `year`) VALUES
(1, 'audi', 's3', 2017);

-- --------------------------------------------------------

--
-- Structure de la table `drivers`
--

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `approuved` tinyint(1) NOT NULL DEFAULT '0',
  `line_num` varchar(250) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT '0',
  `n_rates` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `drivers`
--

INSERT INTO `drivers` (`id`, `approuved`, `line_num`, `car_id`, `rate`, `n_rates`) VALUES
(3, 0, '1', 1, 0, 0),
(11, 0, '1', 1, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `line`
--

CREATE TABLE `line` (
  `line_num` varchar(250) NOT NULL,
  `station` varchar(150) NOT NULL,
  `station_pos` point DEFAULT NULL,
  `station_index` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `line`
--

INSERT INTO `line` (`line_num`, `station`, `station_pos`, `station_index`) VALUES
('1', '2 mai', '\0\0\0\0\0\0\0\nףp=\n&@ڙٙٙ@', 6),
('1', '2 mai , boumati , eucalyptus', NULL, 0),
('1', 'boumati', '\0\0\0\0\0\0\0\nףp=\n$@\0\0\0\0\0\0@', 2),
('1', 'eucalyptus', '\0\0\0\0\0\0\0q=\nףp$@ڙٙٙ@', 0),
('2', '2 mai', '\0\0\0\0\0\0\0\nףp=\n$@ڙٙٙ@', 2),
('2', '2 mai , rouiba, lakhdaria', NULL, 0),
('2', 'boumati', '\0\0\0\0\0\0\0\nףp=\n$@\0\0\0\0\0\0@', 1),
('3', 'boumati', '\0\0\0\0\0\0\0\nףp=\n$@\0\0\0\0\0\0@', 1);

-- --------------------------------------------------------

--
-- Structure de la table `line_station`
--

CREATE TABLE `line_station` (
  `line_num` varchar(250) NOT NULL,
  `s_id` int(11) NOT NULL,
  `s_index` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `line_station`
--

INSERT INTO `line_station` (`line_num`, `s_id`, `s_index`) VALUES
('1', 1, 0),
('1', 2, 0),
('2', 3, 0),
('2', 4, 0);

-- --------------------------------------------------------

--
-- Structure de la table `passengers`
--

CREATE TABLE `passengers` (
  `id` int(11) NOT NULL,
  `line_num` varchar(100) NOT NULL,
  `sense` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `passengers`
--

INSERT INTO `passengers` (`id`, `line_num`, `sense`) VALUES
(3, '1', 1),
(3, '2', 1),
(5, '1', -1),
(6, '1', 1),
(7, '1', 1),
(8, '1', 1),
(11, '1', 1),
(12, '1', 1);

-- --------------------------------------------------------

--
-- Structure de la table `relationships`
--

CREATE TABLE `relationships` (
  `user_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `socketid`
--

CREATE TABLE `socketid` (
  `socketid` varchar(175) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `socketid`
--

INSERT INTO `socketid` (`socketid`, `id`) VALUES
('L4fMka9IwWT36jwAAAAC', 5),
('L4fMka9IwWT36jwAAAAC', 6),
('L4fMka9IwWT36jwAAAAC', 7),
('L4fMka9IwWT36jwAAAAC', 12),
('L4fMka9IwWT36jwAAAAC', 11),
('L4fMka9IwWT36jwAAAAC', 8);

-- --------------------------------------------------------

--
-- Structure de la table `stations`
--

CREATE TABLE `stations` (
  `s_id` int(11) NOT NULL,
  `s_name` varchar(50) NOT NULL,
  `s_pos` point NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `stations`
--

INSERT INTO `stations` (`s_id`, `s_name`, `s_pos`) VALUES
(1, 'boumati', '\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\0@'),
(2, '2 mai', '\0\0\0\0\0\0\0\0\0\0\0\0\0@Ό͌͌@'),
(3, 'cali', '\0\0\0\0\0\0\0333333@Ό͌͌@'),
(4, 'lak', '\0\0\0\0\0\0\0\0\0\0\0\0\0 @\0\0\0\0\0\0@'),
(5, 'kha', '\0\0\0\0\0\0\0333333@Ό͌͌@');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tel` varchar(10) NOT NULL,
  `pos` point DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `email`, `tel`, `pos`, `name`, `password`) VALUES
(3, 'mekhaid@gmail.com', '0556051772', '\0\0\0\0\0\0\0H1@IB@.筕ɇ@', 'zayd', '$2a$10$77FKQISFcAISHYWdZDT/ouj5G.BciO6sHYGPP5KvDbPe4MBdTGGB6'),
(4, 'mekhaznizayd@gmail.com', '0556051771', '\0\0\0\0\0\0\0ڙٙڙA@ڙٙٙ	@', 'za', '$2a$10$5hPiqxB7LLoj4dEb/ebxMuSc28T93FdGfgmUKduDa6hzds0TBAaJi'),
(5, 'mekhazniza0yd@gmail.com', '0556051770', '\0\0\0\0\0\0\0fffff炀ڙٙٙ	@', 'za', '$2a$10$.FPr2DMnDySW/16WFjlWKuTlDPixNrfnUTM5U3vtx38BU4Sbqe2kS'),
(6, 'mekhazniza0y2d@gmail.com', 'e', '\0\0\0\0\0\0\0H⺔ΧA@ڙٙٙ	@', 'username', '$2a$10$/I1a5B7kZKgubvQPbenf7.XFpVOfyzgdEy8h1CRQP4Rd3xJjGqCa.'),
(7, 'zzzz@g.com', 'z', '\0\0\0\0\0\0\0χ⺔ρ@ڙٙٙ	@', 'z', '$2a$10$brR0DkQbNibiLTmTFda6PeJer9Mo1rA79b3A.QOP7U2.NnZ/V0EfC'),
(8, 'ggg@gmaol.com', '8787878787', '\0\0\0\0\0\0\0{χᛁ@ڙٙٙ	@', 'zaza', '$2a$10$Sa.w0QjyV2qvGGEgvkqab.XrOxOMNgUTLpvCVshNHA8XOToFYYxi.'),
(9, 'z@z.z', '2', NULL, 'e', '$2a$10$8/kSOYHcrG5RdqBslAiWJOvBNTIVjdSDob7l7Mr0iOAiet2MpSq3W'),
(10, 'e@e.m', '2-3', NULL, 'e', '$2a$10$mTIUfeEkkwAPHh1zIiouA.42jUaho30iICbFIf7bmO5TT8ZDsWXPm'),
(11, 't@x.m', '5', '\0\0\0\0\0\0\0H⺔Ϝ'B@ڙٙٙ	@', 't', '$2a$10$rANfD2kmn7fTuNvFPI.G0us56iDCRBPTn16jdq5fdfK.pF2txT08O'),
(12, 'kk@k.c', '222', '\0\0\0\0\0\0\0=\nףp=B@ڙٙٙ	@', 'k', '$2a$10$j2UXdDHSM2CWLKQihvQZ8erSWcGo4OboTo96yW6Ptf26SMKZJkYMK');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `line_num` (`line_num`);

--
-- Index pour la table `line`
--
ALTER TABLE `line`
  ADD PRIMARY KEY (`line_num`,`station`);

--
-- Index pour la table `line_station`
--
ALTER TABLE `line_station`
  ADD PRIMARY KEY (`line_num`,`s_id`),
  ADD KEY `s_id` (`s_id`);

--
-- Index pour la table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`id`,`line_num`),
  ADD KEY `line_num` (`line_num`);

--
-- Index pour la table `relationships`
--
ALTER TABLE `relationships`
  ADD PRIMARY KEY (`user_id`,`driver_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Index pour la table `socketid`
--
ALTER TABLE `socketid`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`s_id`),
  ADD UNIQUE KEY `s_name` (`s_name`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `tel` (`tel`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `stations`
--
ALTER TABLE `stations`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `drivers_ibfk_2` FOREIGN KEY (`line_num`) REFERENCES `line_station` (`line_num`) ON DELETE NO ACTION,
  ADD CONSTRAINT `drivers_ibfk_3` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Contraintes pour la table `line_station`
--
ALTER TABLE `line_station`
  ADD CONSTRAINT `line_station_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `stations` (`s_id`);

--
-- Contraintes pour la table `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`line_num`) REFERENCES `line` (`line_num`),
  ADD CONSTRAINT `passengers_ibfk_2` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `relationships`
--
ALTER TABLE `relationships`
  ADD CONSTRAINT `relationships_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `relationships_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
