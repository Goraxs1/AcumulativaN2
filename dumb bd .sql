-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 24-06-2021 a las 16:50:54
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `test`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apunte`
--

CREATE TABLE IF NOT EXISTS `apunte` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `contenido_id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `tipo` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CONTENIDO_APUNTE_FK` (`contenido_id`),
  KEY `apunte_tipo_fk` (`tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `apunte`
--

INSERT INTO `apunte` (`ID`, `contenido_id`, `nombre`, `url`, `tipo`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(5, 1, 'primer apunte', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fdesarrolloweb.com%2Farticulos%2Fque-es-mvc.html&psig=AOvVaw3A_-fF9AS8XL1qWgXmTQnA&ust=1623379178163000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPCb8b6Ej', 1, '2021-06-09 22:38:28', '2021-06-09 22:38:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apunte_tipo`
--

CREATE TABLE IF NOT EXISTS `apunte_tipo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `apunte_tipo`
--

INSERT INTO `apunte_tipo` (`ID`, `nombre`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 'imagen', '2021-06-09 11:53:05', '2021-06-09 12:29:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenido`
--

CREATE TABLE IF NOT EXISTS `contenido` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `contenido`
--

INSERT INTO `contenido` (`ID`, `nombre`, `descripcion`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 'Primera Clase', 'PresentaciÃ³n,estructura de mÃ³dulo , etc.', '2021-06-09 22:33:06', '2021-06-09 22:33:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(300) NOT NULL,
  `codigo` varchar(300) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  `fecha_codigo` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `email`, `codigo`, `fecha_creacion`, `fecha_actualizacion`, `fecha_codigo`) VALUES
(1, 'pancholeiva12@gmail.com', '1234', '2021-06-04 00:00:00', '2021-06-04 00:00:00', '2021-06-04 00:00:00');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apunte`
--
ALTER TABLE `apunte`
  ADD CONSTRAINT `CONTENIDO_APUNTE_FK` FOREIGN KEY (`contenido_id`) REFERENCES `contenido` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
