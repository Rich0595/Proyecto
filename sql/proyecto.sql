-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-07-2018 a las 08:57:39
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carga_horaria`
--

CREATE TABLE `carga_horaria` (
  `id_carga` char(20) NOT NULL,
  `id_turno` char(20) NOT NULL,
  `num_horas` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `id_cita` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `diagnostico` varchar(50) DEFAULT NULL,
  `tratamiento` varchar(50) DEFAULT NULL,
  `especialidad` varchar(30) DEFAULT NULL,
  `cedula` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita_historia`
--

CREATE TABLE `cita_historia` (
  `id_cita` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `id_historia` int(11) NOT NULL,
  `num_refe` int(11) NOT NULL,
  `id_clinica` int(11) NOT NULL,
  `id_trab` char(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_tipo` char(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clinicas`
--

CREATE TABLE `clinicas` (
  `id_clinica` int(11) NOT NULL,
  `nombre_cli` varchar(30) DEFAULT NULL,
  `estado` char(20) DEFAULT NULL,
  `municipio` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consulta`
--

CREATE TABLE `consulta` (
  `id_consulta` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `tipo_consulta` varchar(20) DEFAULT NULL,
  `motivo` varchar(20) DEFAULT NULL,
  `tratamiento` varchar(60) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id_espec` char(20) NOT NULL,
  `descripcion` varchar(40) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia`
--

CREATE TABLE `historia` (
  `id_historia` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `cedula` int(11) NOT NULL,
  `num_refe` int(11) NOT NULL,
  `id_clinica` int(11) NOT NULL,
  `id_trab` char(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_tipo` char(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `cedula` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `genero` char(1) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `peso` varchar(6) DEFAULT NULL,
  `altura` varchar(6) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `telefono_hab` varchar(11) DEFAULT NULL,
  `tel_hab_2` varchar(11) DEFAULT NULL,
  `celular` varchar(11) DEFAULT NULL,
  `celular2` varchar(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referencia`
--

CREATE TABLE `referencia` (
  `num_refe` int(11) NOT NULL,
  `nombre_cli` varchar(30) DEFAULT NULL,
  `fecha_ref` date DEFAULT NULL,
  `id_clinica` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_trabajador`
--

CREATE TABLE `tipo_trabajador` (
  `id_tipo` char(20) NOT NULL,
  `descripcion` varchar(40) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_tipo` char(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `cedula` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `id_trab` char(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_tipo` char(20) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `genero` char(1) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `cedula` int(11) NOT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `telefono_hab` varchar(11) DEFAULT NULL,
  `celular` varchar(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador_especialidad`
--

CREATE TABLE `trabajador_especialidad` (
  `id_trab` char(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_tipo` char(20) NOT NULL,
  `id_espec` char(20) NOT NULL,
  `cedula` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador_turno`
--

CREATE TABLE `trabajador_turno` (
  `id_trab` char(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_tipo` char(20) NOT NULL,
  `id_turno` char(20) NOT NULL,
  `cedula` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `id_turno` char(20) NOT NULL,
  `descripcion` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `cedula` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `usuario` varchar(15) NOT NULL,
  `pass` varchar(10) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`cedula`, `nombre`, `apellido`, `correo`, `usuario`, `pass`, `activo`) VALUES
(25418225, 'gus', 'zer', 'guszer@gmail.com', 'guszer', '123456', b'1'),
(25504225, 'adri', 'ace', 'adriace@gmail.com', 'adriace', '987654', b'1'),
(1234567, 'asd', 'qwe', 'asdqwe@gmail.com', 'qweasd', 'aassdd', b'1'),
(28158728, 'gaby', 'arau', 'gabarau@gmail.com', 'gabaray', '321654', b'1'),
(22134578, 'Ric', 'Pad', 'ricpad@hotmail.com', 'ricpad', 'ricpad', b'1'),
(3216549, 'lol', 'olo', 'lq@asd.com', 'lol', 'lol', b'1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carga_horaria`
--
ALTER TABLE `carga_horaria`
  ADD PRIMARY KEY (`id_carga`,`id_turno`),
  ADD KEY `id_turno` (`id_turno`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`id_cita`,`cedula`),
  ADD KEY `cedula` (`cedula`);

--
-- Indices de la tabla `cita_historia`
--
ALTER TABLE `cita_historia`
  ADD PRIMARY KEY (`id_cita`,`id_historia`,`num_refe`,`id_clinica`,`id_trab`,`id_user`,`id_tipo`,`cedula`),
  ADD KEY `id_cita` (`id_cita`,`cedula`),
  ADD KEY `id_historia` (`id_historia`,`num_refe`,`id_clinica`,`id_trab`,`id_user`,`id_tipo`,`cedula`);

--
-- Indices de la tabla `clinicas`
--
ALTER TABLE `clinicas`
  ADD PRIMARY KEY (`id_clinica`);

--
-- Indices de la tabla `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id_consulta`,`cedula`),
  ADD KEY `cedula` (`cedula`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_espec`);

--
-- Indices de la tabla `historia`
--
ALTER TABLE `historia`
  ADD PRIMARY KEY (`id_historia`,`num_refe`,`id_clinica`,`id_trab`,`id_user`,`id_tipo`,`cedula`),
  ADD KEY `cedula` (`cedula`),
  ADD KEY `num_refe` (`num_refe`,`id_clinica`),
  ADD KEY `id_trab` (`id_trab`,`id_user`,`id_tipo`,`cedula`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`cedula`);

--
-- Indices de la tabla `referencia`
--
ALTER TABLE `referencia`
  ADD PRIMARY KEY (`num_refe`,`id_clinica`),
  ADD KEY `id_clinica` (`id_clinica`);

--
-- Indices de la tabla `tipo_trabajador`
--
ALTER TABLE `tipo_trabajador`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_tipo`,`id_user`,`cedula`),
  ADD KEY `id_user` (`id_user`,`cedula`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`id_trab`,`id_user`,`id_tipo`,`cedula`),
  ADD KEY `id_user` (`id_user`,`cedula`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `trabajador_especialidad`
--
ALTER TABLE `trabajador_especialidad`
  ADD PRIMARY KEY (`id_trab`,`id_user`,`id_tipo`,`id_espec`,`cedula`),
  ADD KEY `id_trab` (`id_trab`,`id_user`,`id_tipo`,`cedula`),
  ADD KEY `id_espec` (`id_espec`);

--
-- Indices de la tabla `trabajador_turno`
--
ALTER TABLE `trabajador_turno`
  ADD PRIMARY KEY (`id_trab`,`id_user`,`id_tipo`,`id_turno`,`cedula`),
  ADD KEY `id_trab` (`id_trab`,`id_user`,`id_tipo`,`cedula`),
  ADD KEY `id_turno` (`id_turno`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id_turno`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cedula`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
