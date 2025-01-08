-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 08-01-2025 a las 14:06:19
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vehiculos`
--
CREATE DATABASE IF NOT EXISTS `vehiculos` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `vehiculos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `ID_empleado` int(11) NOT NULL,
  `usuarios` varchar(50) NOT NULL,
  `contrasenia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`ID_empleado`, `usuarios`, `contrasenia`) VALUES
(1, 'francisco', '$2y$10$jVg5A7ic8AAb9HgUlMajQuNMrdSl/xElrdS2rHz66uW6W4/xwq7w6'),
(2, 'Franchesco1', '$2y$10$Xx5P1ntyCFHMhWVkrjPKLuTzk1Dj8lFdJyALYoqroGK3W2Ok53jAy'),
(3, 'jose', '$2y$10$D1PnsrNNrcZXBjZEEkeDve9qYM701eS4SABE492gYhqeyQP2/LfaK'),
(4, 'Francis', '$2y$10$DJVPY90MmodykQU0j9gxMOkvdYaFnQqiKCsjQsIh.nDGzi/7X97F.'),
(5, '1600719882', '$2y$10$pgRdoVCT8sD/2DCrlC9rfuk2c4d5XqPT11FJ5Crq5ImGKhvH3NkGq'),
(6, 'carlos', '$2y$10$g8k31/Wo9PJ98wfJwrUDiesbsD4qFCMp5QtJsuJYM7em19Ct/hU36'),
(20, 'Pietro', '$2y$10$Bmm9EkOrJOjlQBZQyF37gu63Cvvc/pDNOsnuuzGp9C5PU6Cf1z2r2'),
(21, 'holii', '$2y$10$dEsN50veHfyvG.jlcqpjc.QqYer0SfXsz2.ElyNdDqPntu7OxQurq'),
(22, 'guason', '$2y$10$yWPdBbDRCrnQHh5Ey96etePGYj5AMxqNAFJqzGej9T7L6yzZ11jh2'),
(23, 'guasi', '$2y$10$oFLWzQCbrCwQ68lWzNXr1ut70MEfVqtSe39qkqNkHhB3CIEy3KUrC'),
(24, 'peter', '$2y$10$Uuebph5KQT73AyZ2K5NbKevPb055k/uXoAXbGMKk64d99vDvIihWm'),
(25, 'peter', '$2y$10$rStw2R4dXpJL5Eajscr4UuTkRM8BxgU..sxTJ.RIJ/of4bFDsEhD6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `ID_vehiculo` int(11) NOT NULL,
  `Placa` varchar(50) NOT NULL,
  `Modelo` varchar(50) NOT NULL,
  `Hora_ingreso` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Hora_salida` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`ID_vehiculo`, `Placa`, `Modelo`, `Hora_ingreso`, `Hora_salida`) VALUES
(1, 'HKC190', 'spark', '2025-01-08 15:15:31', '2025-01-08 08:15:31'),
(2, 'PBY234', 'soluto', '2025-01-23 02:26:22', '2025-01-08 04:08:22');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`ID_empleado`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`ID_vehiculo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `ID_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `ID_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
