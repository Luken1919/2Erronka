-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 03-03-2024 a las 20:30:26
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Erronka2_Rugby`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Egon`
--

CREATE TABLE `Egon` (
  `Taldea_Kod` tinyint NOT NULL,
  `Taldea_Kategoria_Kod1` tinyint NOT NULL,
  `Txapelketa_Kod` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Erabiltzailea`
--

CREATE TABLE `Erabiltzailea` (
  `Kod` int NOT NULL,
  `Izena` varchar(20) NOT NULL,
  `Abizena` varchar(20) NOT NULL,
  `ErabiltzaileIzena` varchar(20) NOT NULL,
  `HelbideElektronikoa` varchar(50) NOT NULL,
  `Pasahitza` varchar(20) NOT NULL,
  `Mota` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Erabiltzailea`
--

INSERT INTO `Erabiltzailea` (`Kod`, `Izena`, `Abizena`, `ErabiltzaileIzena`, `HelbideElektronikoa`, `Pasahitza`, `Mota`) VALUES
(2, 'Admin', 'Admin', 'Admin', 'Admin@gmail.com', '1234', 'Admin'),
(4, 'Luken', 'Franco', 'Luka', 'lukenfranco@gmail.com', '1234', 'Arrunta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inkesta`
--

CREATE TABLE `inkesta` (
  `id` int NOT NULL,
  `aukera_diseinua` varchar(20) NOT NULL,
  `ekitaldi_mota` text NOT NULL,
  `hobekuntza_oharra` text NOT NULL,
  `hobekuntza_entrenamenduak` varchar(50) NOT NULL,
  `beste_ideiak` text NOT NULL,
  `izena` varchar(50) NOT NULL,
  `abizena` varchar(50) NOT NULL,
  `korreoa` varchar(100) NOT NULL,
  `dni` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `inkesta`
--

INSERT INTO `inkesta` (`id`, `aukera_diseinua`, `ekitaldi_mota`, `hobekuntza_oharra`, `hobekuntza_entrenamenduak`, `beste_ideiak`, `izena`, `abizena`, `korreoa`, `dni`) VALUES
(1, 'aukera3', 'bilkura', 'Kaixo', 'material_berriak', 'Asas', 'Luken', 'Franco', 'apofiuasfsf@gmail.com', '34092858G'),
(2, 'aukera3', 'bilkura', 'Kaixo', 'material_berriak', 'Asas', 'Luken', 'Franco', 'apofiuasfsf@gmail.com', '34092858G'),
(3, 'aukera3', 'bilkura', 'Kaixo', 'material_berriak', 'Asas', 'Luken', 'Franco', 'apofiuasfsf@gmail.com', '34092858G'),
(4, 'aukera3', 'bilkura', 'Kaixo', 'material_berriak', 'Asas', 'Luken', 'Franco', 'apofiuasfsf@gmail.com', '34092858G');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Izan`
--

CREATE TABLE `Izan` (
  `Jokalaria_Nan` char(9) NOT NULL,
  `Taldea_Kod` tinyint NOT NULL,
  `Taldea_Kategoria_Kod1` tinyint NOT NULL,
  `Hasiera_data` date DEFAULT NULL,
  `Amaiera_data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Jokalaria`
--

CREATE TABLE `Jokalaria` (
  `Nan` char(9) NOT NULL,
  `Izena` varchar(25) NOT NULL,
  `Abizena` varchar(25) NOT NULL,
  `Adina` tinyint NOT NULL,
  `Sexua` varchar(20) NOT NULL,
  `Posizioa` varchar(20) DEFAULT NULL,
  `Dortsala` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Jolastu`
--

CREATE TABLE `Jolastu` (
  `Jokalaria_Nan` char(9) NOT NULL,
  `Partidoa_Kod` int NOT NULL,
  `Partidoa_Txapelketa_Kod1` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Kategoria`
--

CREATE TABLE `Kategoria` (
  `Kod` tinyint NOT NULL,
  `Izena` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Kategoria`
--

INSERT INTO `Kategoria` (`Kod`, `Izena`) VALUES
(1, 'Gizonezkoa'),
(2, 'Emakumezkoa'),
(3, 'Sub-18'),
(4, 'Sub-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Partidoa`
--

CREATE TABLE `Partidoa` (
  `Kod` int NOT NULL,
  `Lokala` varchar(50) NOT NULL,
  `Bisitaria` varchar(50) NOT NULL,
  `Pts_lokala` varchar(3) DEFAULT NULL,
  `Pts_bisitaria` varchar(3) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Hasiera_ordua` time DEFAULT NULL,
  `Txapelketa_Kod1` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Partidoa`
--

INSERT INTO `Partidoa` (`Kod`, `Lokala`, `Bisitaria`, `Pts_lokala`, `Pts_bisitaria`, `Data`, `Hasiera_ordua`, `Txapelketa_Kod1`) VALUES
(52, 'Tolosa Union Rugby', 'SilverStorm El Salvador', '33', '32', NULL, NULL, 1),
(53, 'Ampo Ordizia', 'Real Sociedad Rugby', NULL, NULL, NULL, NULL, 1),
(54, 'Athletic Rugby', 'Real Ciencias Enerside', NULL, NULL, NULL, NULL, 1),
(55, 'Barsa Rugby', 'Pozuelo RU', NULL, NULL, NULL, NULL, 1),
(56, 'Complutense Cisneros', 'Pasek Belenos RC', NULL, NULL, NULL, NULL, 1),
(57, 'Les Abelles', 'Madrid Rugby', NULL, NULL, NULL, NULL, 1),
(58, 'Tolosa Union Rugby', 'Real Sociedad Rugby', NULL, NULL, NULL, NULL, 1),
(59, 'SilverStorm El Salvador', 'Real Ciencias Enerside', NULL, NULL, NULL, NULL, 1),
(60, 'Ampo Ordizia', 'Pozuelo RU', NULL, NULL, NULL, NULL, 1),
(61, 'Athletic Rugby', 'Pasek Belenos RC', NULL, NULL, NULL, NULL, 1),
(62, 'Barsa Rugby', 'Madrid Rugby', NULL, NULL, NULL, NULL, 1),
(63, 'Complutense Cisneros', 'Les Abelles', NULL, NULL, NULL, NULL, 1),
(64, 'Tolosa Union Rugby', 'Real Ciencias Enerside', NULL, NULL, NULL, NULL, 1),
(65, 'Real Sociedad Rugby', 'Pozuelo RU', NULL, NULL, NULL, NULL, 1),
(66, 'SilverStorm El Salvador', 'Pasek Belenos RC', NULL, NULL, NULL, NULL, 1),
(67, 'Ampo Ordizia', 'Madrid Rugby', NULL, NULL, NULL, NULL, 1),
(68, 'Athletic Rugby', 'Les Abelles', NULL, NULL, NULL, NULL, 1),
(69, 'Barsa Rugby', 'Complutense Cisneros', NULL, NULL, NULL, NULL, 1),
(70, 'Tolosa Union Rugby', 'Pozuelo RU', NULL, NULL, NULL, NULL, 1),
(71, 'Real Ciencias Enerside', 'Pasek Belenos RC', NULL, NULL, NULL, NULL, 1),
(72, 'Real Sociedad Rugby', 'Madrid Rugby', NULL, NULL, NULL, NULL, 1),
(73, 'SilverStorm El Salvador', 'Les Abelles', NULL, NULL, NULL, NULL, 1),
(74, 'Ampo Ordizia', 'Complutense Cisneros', NULL, NULL, NULL, NULL, 1),
(75, 'Athletic Rugby', 'Barsa Rugby', NULL, NULL, NULL, NULL, 1),
(76, 'Tolosa Union Rugby', 'Pasek Belenos RC', NULL, NULL, NULL, NULL, 1),
(77, 'Pozuelo RU', 'Madrid Rugby', NULL, NULL, NULL, NULL, 1),
(78, 'Real Ciencias Enerside', 'Les Abelles', NULL, NULL, NULL, NULL, 1),
(79, 'Real Sociedad Rugby', 'Complutense Cisneros', NULL, NULL, NULL, NULL, 1),
(80, 'SilverStorm El Salvador', 'Barsa Rugby', NULL, NULL, NULL, NULL, 1),
(81, 'Ampo Ordizia', 'Athletic Rugby', NULL, NULL, NULL, NULL, 1),
(82, 'Tolosa Union Rugby', 'Madrid Rugby', NULL, NULL, NULL, NULL, 1),
(83, 'Pasek Belenos RC', 'Les Abelles', NULL, NULL, NULL, NULL, 1),
(84, 'Pozuelo RU', 'Complutense Cisneros', NULL, NULL, NULL, NULL, 1),
(85, 'Real Ciencias Enerside', 'Barsa Rugby', NULL, NULL, NULL, NULL, 1),
(86, 'Real Sociedad Rugby', 'Athletic Rugby', NULL, NULL, NULL, NULL, 1),
(87, 'SilverStorm El Salvador', 'Ampo Ordizia', NULL, NULL, NULL, NULL, 1),
(88, 'Tolosa Union Rugby', 'Les Abelles', NULL, NULL, NULL, NULL, 1),
(89, 'Madrid Rugby', 'Complutense Cisneros', NULL, NULL, NULL, NULL, 1),
(90, 'Pasek Belenos RC', 'Barsa Rugby', NULL, NULL, NULL, NULL, 1),
(91, 'Pozuelo RU', 'Athletic Rugby', NULL, NULL, NULL, NULL, 1),
(92, 'Real Ciencias Enerside', 'Ampo Ordizia', NULL, NULL, NULL, NULL, 1),
(93, 'Real Sociedad Rugby', 'SilverStorm El Salvador', NULL, NULL, NULL, NULL, 1),
(94, 'Tolosa Union Rugby', 'Complutense Cisneros', NULL, NULL, NULL, NULL, 1),
(95, 'Les Abelles', 'Barsa Rugby', NULL, NULL, NULL, NULL, 1),
(96, 'Madrid Rugby', 'Athletic Rugby', NULL, NULL, NULL, NULL, 1),
(97, 'Pasek Belenos RC', 'Ampo Ordizia', NULL, NULL, NULL, NULL, 1),
(98, 'Pozuelo RU', 'SilverStorm El Salvador', NULL, NULL, NULL, NULL, 1),
(99, 'Real Ciencias Enerside', 'Real Sociedad Rugby', NULL, NULL, NULL, NULL, 1),
(100, 'Tolosa Union Rugby', 'Barsa Rugby', NULL, NULL, NULL, NULL, 1),
(101, 'Complutense Cisneros', 'Athletic Rugby', NULL, NULL, NULL, NULL, 1),
(102, 'Les Abelles', 'Ampo Ordizia', NULL, NULL, NULL, NULL, 1),
(103, 'Madrid Rugby', 'SilverStorm El Salvador', NULL, NULL, NULL, NULL, 1),
(104, 'Pasek Belenos RC', 'Real Sociedad Rugby', NULL, NULL, NULL, NULL, 1),
(105, 'Pozuelo RU', 'Real Ciencias Enerside', NULL, NULL, NULL, NULL, 1),
(106, 'Tolosa Union Rugby', 'Athletic Rugby', NULL, NULL, NULL, NULL, 1),
(107, 'Barsa Rugby', 'Ampo Ordizia', NULL, NULL, NULL, NULL, 1),
(108, 'Complutense Cisneros', 'SilverStorm El Salvador', NULL, NULL, NULL, NULL, 1),
(109, 'Les Abelles', 'Real Sociedad Rugby', NULL, NULL, NULL, NULL, 1),
(110, 'Madrid Rugby', 'Real Ciencias Enerside', NULL, NULL, NULL, NULL, 1),
(111, 'Pasek Belenos RC', 'Pozuelo RU', NULL, NULL, NULL, NULL, 1),
(112, 'Tolosa Union Rugby', 'Ampo Ordizia', NULL, NULL, NULL, NULL, 1),
(113, 'Athletic Rugby', 'SilverStorm El Salvador', NULL, NULL, NULL, NULL, 1),
(114, 'Barsa Rugby', 'Real Sociedad Rugby', NULL, NULL, NULL, NULL, 1),
(115, 'Complutense Cisneros', 'Real Ciencias Enerside', NULL, NULL, NULL, NULL, 1),
(116, 'Les Abelles', 'Pozuelo RU', NULL, NULL, NULL, NULL, 1),
(117, 'Madrid Rugby', 'Pasek Belenos RC', NULL, NULL, NULL, NULL, 1),
(118, 'Barsa Rugby', 'Tolosa Union Rugby', NULL, NULL, NULL, NULL, 2),
(119, 'Eibar RT', 'Silicius Majadahonda', NULL, NULL, NULL, NULL, 2),
(120, 'Les Abelles', 'Real Sociedad Rugby', NULL, NULL, NULL, NULL, 2),
(121, 'Madrid Rugby', 'Pozuelo RU', NULL, NULL, NULL, NULL, 2),
(122, 'Barsa Rugby', 'Silicius Majadahonda', NULL, NULL, NULL, NULL, 2),
(123, 'Tolosa Union Rugby', 'Real Sociedad Rugby', NULL, NULL, NULL, NULL, 2),
(124, 'Eibar RT', 'Pozuelo RU', NULL, NULL, NULL, NULL, 2),
(125, 'Les Abelles', 'Madrid Rugby', NULL, NULL, NULL, NULL, 2),
(126, 'Barsa Rugby', 'Real Sociedad Rugby', NULL, NULL, NULL, NULL, 2),
(127, 'Silicius Majadahonda', 'Pozuelo RU', NULL, NULL, NULL, NULL, 2),
(128, 'Tolosa Union Rugby', 'Madrid Rugby', NULL, NULL, NULL, NULL, 2),
(129, 'Eibar RT', 'Les Abelles', NULL, NULL, NULL, NULL, 2),
(130, 'Barsa Rugby', 'Pozuelo RU', NULL, NULL, NULL, NULL, 2),
(131, 'Real Sociedad Rugby', 'Madrid Rugby', NULL, NULL, NULL, NULL, 2),
(132, 'Silicius Majadahonda', 'Les Abelles', NULL, NULL, NULL, NULL, 2),
(133, 'Tolosa Union Rugby', 'Eibar RT', NULL, NULL, NULL, NULL, 2),
(134, 'Barsa Rugby', 'Madrid Rugby', NULL, NULL, NULL, NULL, 2),
(135, 'Pozuelo RU', 'Les Abelles', NULL, NULL, NULL, NULL, 2),
(136, 'Real Sociedad Rugby', 'Eibar RT', NULL, NULL, NULL, NULL, 2),
(137, 'Silicius Majadahonda', 'Tolosa Union Rugby', NULL, NULL, NULL, NULL, 2),
(138, 'Barsa Rugby', 'Les Abelles', NULL, NULL, NULL, NULL, 2),
(139, 'Madrid Rugby', 'Eibar RT', NULL, NULL, NULL, NULL, 2),
(140, 'Pozuelo RU', 'Tolosa Union Rugby', NULL, NULL, NULL, NULL, 2),
(141, 'Real Sociedad Rugby', 'Silicius Majadahonda', NULL, NULL, NULL, NULL, 2),
(142, 'Barsa Rugby', 'Eibar RT', NULL, NULL, NULL, NULL, 2),
(143, 'Les Abelles', 'Tolosa Union Rugby', NULL, NULL, NULL, NULL, 2),
(144, 'Madrid Rugby', 'Silicius Majadahonda', NULL, NULL, NULL, NULL, 2),
(145, 'Pozuelo RU', 'Real Sociedad Rugby', NULL, NULL, NULL, NULL, 2),
(146, 'Ampo Ordizia', 'Tolosa Union Rugby', NULL, NULL, NULL, NULL, 3),
(147, 'Arrasate Rugby', 'Real Sociedad Rugby', NULL, NULL, NULL, NULL, 3),
(148, 'Athletic Rugby', 'Hernani Club Rugby', NULL, NULL, NULL, NULL, 3),
(149, 'Durango Rugby', 'Gernika RE', NULL, NULL, NULL, NULL, 3),
(150, 'Ampo Ordizia', 'Real Sociedad Rugby', NULL, NULL, NULL, NULL, 3),
(151, 'Tolosa Union Rugby', 'Hernani Club Rugby', NULL, NULL, NULL, NULL, 3),
(152, 'Arrasate Rugby', 'Gernika RE', NULL, NULL, NULL, NULL, 3),
(153, 'Athletic Rugby', 'Durango Rugby', NULL, NULL, NULL, NULL, 3),
(154, 'Ampo Ordizia', 'Hernani Club Rugby', NULL, NULL, NULL, NULL, 3),
(155, 'Real Sociedad Rugby', 'Gernika RE', NULL, NULL, NULL, NULL, 3),
(156, 'Tolosa Union Rugby', 'Durango Rugby', NULL, NULL, NULL, NULL, 3),
(157, 'Arrasate Rugby', 'Athletic Rugby', NULL, NULL, NULL, NULL, 3),
(158, 'Ampo Ordizia', 'Gernika RE', NULL, NULL, NULL, NULL, 3),
(159, 'Hernani Club Rugby', 'Durango Rugby', NULL, NULL, NULL, NULL, 3),
(160, 'Real Sociedad Rugby', 'Athletic Rugby', NULL, NULL, NULL, NULL, 3),
(161, 'Tolosa Union Rugby', 'Arrasate Rugby', NULL, NULL, NULL, NULL, 3),
(162, 'Ampo Ordizia', 'Durango Rugby', NULL, NULL, NULL, NULL, 3),
(163, 'Gernika RE', 'Athletic Rugby', NULL, NULL, NULL, NULL, 3),
(164, 'Hernani Club Rugby', 'Arrasate Rugby', NULL, NULL, NULL, NULL, 3),
(165, 'Real Sociedad Rugby', 'Tolosa Union Rugby', NULL, NULL, NULL, NULL, 3),
(166, 'Ampo Ordizia', 'Athletic Rugby', NULL, NULL, NULL, NULL, 3),
(167, 'Durango Rugby', 'Arrasate Rugby', NULL, NULL, NULL, NULL, 3),
(168, 'Gernika RE', 'Tolosa Union Rugby', NULL, NULL, NULL, NULL, 3),
(169, 'Hernani Club Rugby', 'Real Sociedad Rugby', NULL, NULL, NULL, NULL, 3),
(170, 'Ampo Ordizia', 'Arrasate Rugby', NULL, NULL, NULL, NULL, 3),
(171, 'Athletic Rugby', 'Tolosa Union Rugby', NULL, NULL, NULL, NULL, 3),
(172, 'Durango Rugby', 'Real Sociedad Rugby', NULL, NULL, NULL, NULL, 3),
(173, 'Gernika RE', 'Hernani Club Rugby', NULL, NULL, NULL, NULL, 3),
(174, 'Ampo Ordizia', 'Tolosa Union Rugby', NULL, NULL, NULL, NULL, 4),
(175, 'Athletic Rugby', 'Real Sociedad Rugby', NULL, NULL, NULL, NULL, 4),
(176, 'Durango Rugby', 'Gernika RE', NULL, NULL, NULL, NULL, 4),
(177, 'Ampo Ordizia', 'Real Sociedad Rugby', NULL, NULL, NULL, NULL, 4),
(178, 'Tolosa Union Rugby', 'Gernika RE', NULL, NULL, NULL, NULL, 4),
(179, 'Athletic Rugby', 'Durango Rugby', NULL, NULL, NULL, NULL, 4),
(180, 'Ampo Ordizia', 'Gernika RE', NULL, NULL, NULL, NULL, 4),
(181, 'Real Sociedad Rugby', 'Durango Rugby', NULL, NULL, NULL, NULL, 4),
(182, 'Tolosa Union Rugby', 'Athletic Rugby', NULL, NULL, NULL, NULL, 4),
(183, 'Ampo Ordizia', 'Durango Rugby', NULL, NULL, NULL, NULL, 4),
(184, 'Gernika RE', 'Athletic Rugby', NULL, NULL, NULL, NULL, 4),
(185, 'Real Sociedad Rugby', 'Tolosa Union Rugby', NULL, NULL, NULL, NULL, 4),
(186, 'Ampo Ordizia', 'Athletic Rugby', NULL, NULL, NULL, NULL, 4),
(187, 'Durango Rugby', 'Tolosa Union Rugby', NULL, NULL, NULL, NULL, 4),
(188, 'Gernika RE', 'Real Sociedad Rugby', NULL, NULL, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Taldea`
--

CREATE TABLE `Taldea` (
  `Kod` tinyint NOT NULL,
  `Izena` varchar(25) NOT NULL,
  `Herrialdea` varchar(30) NOT NULL,
  `Jokalari_kop` tinyint NOT NULL,
  `Fundazioa` date NOT NULL,
  `Zelaia` varchar(30) DEFAULT NULL,
  `Kategoria_Kod1` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Taldea`
--

INSERT INTO `Taldea` (`Kod`, `Izena`, `Herrialdea`, `Jokalari_kop`, `Fundazioa`, `Zelaia`, `Kategoria_Kod1`) VALUES
(1, 'Tolosa Union Rugby', 'Tolosa', 15, '1994-01-15', 'Tolosa Arena Park', 1),
(2, 'Ampo Ordizia', 'Ordizia', 15, '1995-07-17', NULL, 1),
(3, 'Athletic Rugby', 'Bilbao', 15, '1998-03-05', 'San Mames', 1),
(4, 'Barsa Rugby', 'Barcelona', 15, '2006-11-22', 'Montjuic', 1),
(5, 'Complutense Cisneros', 'Madrid', 15, '1983-05-14', NULL, 1),
(6, 'Les Abelles', 'Valencia', 15, '2010-09-09', 'Mestalla', 1),
(7, 'Madrid Rugby', 'Madrid', 15, '1976-02-28', 'Valdebebas', 1),
(8, 'Pasek Belenos RC', 'Aviles', 15, '1992-12-11', NULL, 1),
(10, 'Real Ciencias Enerside', 'Sevilla', 15, '1989-08-20', 'Sanchez Pijuan', 1),
(11, 'Real Sociedad Rugby', 'San Sebastian', 15, '1996-04-30', 'Zubieta', 1),
(12, 'SilverStorm El Salvador', 'Valladolid', 15, '2005-08-17', NULL, 1),
(13, 'Barsa Rugby', 'Barcelona', 15, '2001-09-05', 'Montjuic', 2),
(14, 'Eibar RT', 'Eibar', 15, '2003-07-18', NULL, 2),
(15, 'Les Abelles', 'Valencia', 15, '2005-04-22', 'Mestalla', 2),
(16, 'Madrid Rugby', 'Madrid', 15, '2006-11-30', 'Valdebebas', 2),
(17, 'Pozuelo RU', 'Madrid', 15, '2008-02-14', NULL, 2),
(18, 'Real Sociedad Rugby', 'San Sebastian', 15, '2002-10-09', 'Zubieta', 2),
(19, 'Silicius Majadahonda', 'Madrid', 15, '2007-06-25', NULL, 2),
(20, 'Tolosa Union Rugby', 'Tolosa', 15, '1999-12-07', 'Tolosa Arena Park', 2),
(21, 'Ampo Ordizia', 'Ordizia', 15, '2012-08-31', NULL, 3),
(22, 'Arrasate Rugby', 'Arrasate', 15, '2014-03-17', NULL, 3),
(23, 'Athletic Rugby', 'Bilbao', 15, '2016-10-22', 'San Mames', 3),
(24, 'Durango Rugby', 'Durango', 15, '2018-05-09', NULL, 3),
(25, 'Gernika RE', 'Gernika', 15, '2011-11-26', NULL, 3),
(26, 'Hernani Club Rugby', 'Hernani', 15, '2013-07-03', NULL, 3),
(27, 'Real Sociedad Rugby', 'San Sebastian', 15, '2015-01-18', 'Zubieta', 3),
(28, 'Tolosa Union Rugby', 'Tolosa', 15, '2019-09-06', 'Tolosa Arena Park', 3),
(29, 'Ampo Ordizia', 'Ordizia', 15, '2020-11-08', NULL, 4),
(30, 'Athletic Rugby', 'Bilbao', 15, '2021-03-22', 'San Mames', 4),
(31, 'Durango Rugby', 'Durango', 15, '2022-07-11', NULL, 4),
(32, 'Gernika RE', 'Gernika', 15, '2022-12-29', NULL, 4),
(33, 'Real Sociedad Rugby', 'San Sebastian', 15, '2023-04-05', 'Zubieta', 4),
(34, 'Tolosa Union Rugby', 'Tolosa', 15, '2023-08-19', 'Tolosa Arena Park', 4),
(35, 'Pozuelo RU', 'Madrid', 15, '2001-10-03', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Txapelketa`
--

CREATE TABLE `Txapelketa` (
  `Kod` tinyint NOT NULL,
  `Izena` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Hasiera_data` date DEFAULT NULL,
  `Amaiera_data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Txapelketa`
--

INSERT INTO `Txapelketa` (`Kod`, `Izena`, `Hasiera_data`, `Amaiera_data`) VALUES
(1, 'Gizonezkoen Ohorezko Maila', '2023-09-01', '2024-05-19'),
(2, 'Emakumezkoen Ohorezko Maila', '2023-09-01', '2024-05-19'),
(3, 'Euskadi Sub-18 Liga', '2023-09-01', '2024-05-19'),
(4, 'Euskadi Sub-16 Liga', '2023-09-01', '2024-05-19'),
(5, 'Errege Kopa', '2024-01-09', '2024-04-27'),
(6, 'Erreginaren Kopa', '2024-01-09', '2024-04-27');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Egon`
--
ALTER TABLE `Egon`
  ADD PRIMARY KEY (`Taldea_Kod`,`Taldea_Kategoria_Kod1`,`Txapelketa_Kod`),
  ADD KEY `fk_Taldea_has_Txapelketa_Txapelketa1_idx` (`Txapelketa_Kod`),
  ADD KEY `fk_Taldea_has_Txapelketa_Taldea1_idx` (`Taldea_Kod`,`Taldea_Kategoria_Kod1`);

--
-- Indices de la tabla `Erabiltzailea`
--
ALTER TABLE `Erabiltzailea`
  ADD PRIMARY KEY (`Kod`);

--
-- Indices de la tabla `inkesta`
--
ALTER TABLE `inkesta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Izan`
--
ALTER TABLE `Izan`
  ADD PRIMARY KEY (`Jokalaria_Nan`,`Taldea_Kod`,`Taldea_Kategoria_Kod1`),
  ADD KEY `fk_Jokalaria_has_Taldea_Taldea1_idx` (`Taldea_Kod`,`Taldea_Kategoria_Kod1`),
  ADD KEY `fk_Jokalaria_has_Taldea_Jokalaria1_idx` (`Jokalaria_Nan`);

--
-- Indices de la tabla `Jokalaria`
--
ALTER TABLE `Jokalaria`
  ADD PRIMARY KEY (`Nan`);

--
-- Indices de la tabla `Jolastu`
--
ALTER TABLE `Jolastu`
  ADD PRIMARY KEY (`Jokalaria_Nan`,`Partidoa_Kod`,`Partidoa_Txapelketa_Kod1`),
  ADD KEY `fk_Jokalaria_has_Partidoa_Partidoa1_idx` (`Partidoa_Kod`,`Partidoa_Txapelketa_Kod1`),
  ADD KEY `fk_Jokalaria_has_Partidoa_Jokalaria1_idx` (`Jokalaria_Nan`);

--
-- Indices de la tabla `Kategoria`
--
ALTER TABLE `Kategoria`
  ADD PRIMARY KEY (`Kod`);

--
-- Indices de la tabla `Partidoa`
--
ALTER TABLE `Partidoa`
  ADD PRIMARY KEY (`Kod`,`Txapelketa_Kod1`),
  ADD KEY `fk_Partidoa_Txapelketa1_idx` (`Txapelketa_Kod1`);

--
-- Indices de la tabla `Taldea`
--
ALTER TABLE `Taldea`
  ADD PRIMARY KEY (`Kod`,`Kategoria_Kod1`),
  ADD KEY `fk_Taldea_Kategoria1_idx` (`Kategoria_Kod1`);

--
-- Indices de la tabla `Txapelketa`
--
ALTER TABLE `Txapelketa`
  ADD PRIMARY KEY (`Kod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Erabiltzailea`
--
ALTER TABLE `Erabiltzailea`
  MODIFY `Kod` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `inkesta`
--
ALTER TABLE `inkesta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Kategoria`
--
ALTER TABLE `Kategoria`
  MODIFY `Kod` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `Partidoa`
--
ALTER TABLE `Partidoa`
  MODIFY `Kod` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT de la tabla `Taldea`
--
ALTER TABLE `Taldea`
  MODIFY `Kod` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `Txapelketa`
--
ALTER TABLE `Txapelketa`
  MODIFY `Kod` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Egon`
--
ALTER TABLE `Egon`
  ADD CONSTRAINT `fk_Taldea_has_Txapelketa_Taldea1` FOREIGN KEY (`Taldea_Kod`,`Taldea_Kategoria_Kod1`) REFERENCES `Taldea` (`Kod`, `Kategoria_Kod1`),
  ADD CONSTRAINT `fk_Taldea_has_Txapelketa_Txapelketa1` FOREIGN KEY (`Txapelketa_Kod`) REFERENCES `Txapelketa` (`Kod`);

--
-- Filtros para la tabla `Izan`
--
ALTER TABLE `Izan`
  ADD CONSTRAINT `fk_Jokalaria_has_Taldea_Jokalaria1` FOREIGN KEY (`Jokalaria_Nan`) REFERENCES `Jokalaria` (`Nan`),
  ADD CONSTRAINT `fk_Jokalaria_has_Taldea_Taldea1` FOREIGN KEY (`Taldea_Kod`,`Taldea_Kategoria_Kod1`) REFERENCES `Taldea` (`Kod`, `Kategoria_Kod1`);

--
-- Filtros para la tabla `Jolastu`
--
ALTER TABLE `Jolastu`
  ADD CONSTRAINT `fk_Jokalaria_has_Partidoa_Jokalaria1` FOREIGN KEY (`Jokalaria_Nan`) REFERENCES `Jokalaria` (`Nan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Jokalaria_has_Partidoa_Partidoa1` FOREIGN KEY (`Partidoa_Kod`,`Partidoa_Txapelketa_Kod1`) REFERENCES `Partidoa` (`Kod`, `Txapelketa_Kod1`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Partidoa`
--
ALTER TABLE `Partidoa`
  ADD CONSTRAINT `fk_Partidoa_Txapelketa1` FOREIGN KEY (`Txapelketa_Kod1`) REFERENCES `Txapelketa` (`Kod`);

--
-- Filtros para la tabla `Taldea`
--
ALTER TABLE `Taldea`
  ADD CONSTRAINT `fk_Taldea_Kategoria1` FOREIGN KEY (`Kategoria_Kod1`) REFERENCES `Kategoria` (`Kod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
