-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-04-2024 a las 17:06:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `dni` varchar(15) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `direccion`, `correo_electronico`, `dni`, `edad`, `fecha_creacion`, `telefono`) VALUES
(1, 'marco', 'lopez', 'jr los huertos 2256', 'marquito2662@gmail.com', '41168291', 44, '0000-00-00', '998771290'),
(2, 'Ruben', 'Layburn', '8th Floor', 'rlayburn0@wsj.com', '45', 74, '2023-10-19', '170-299-2433'),
(3, 'Maria', 'Gonzalez', 'Main Street', 'mgonzalez@example.com', '987654321', 30, '2022-05-15', '555-123-4567'),
(4, 'Juan', 'Perez', 'Oak Avenue', 'jperez@example.com', '456789123', 28, '2024-01-30', '555-987-6543'),
(5, 'John', 'Doe', '123 Main Street', 'john.doe@example.com', '123456789A', 30, '2023-01-01', '555-1234'),
(6, 'Jane', 'Smith', '456 Elm Street', 'jane.smith@example.com', '987654321B', 25, '2022-02-02', '555-5678'),
(7, 'Michael', 'Johnson', '789 Oak Street', 'michael.johnson@example.com', '234567890C', 35, '2021-03-03', '555-9012'),
(8, 'Emily', 'Williams', '1011 Pine Street', 'emily.williams@example.com', '543210987D', 28, '2020-04-04', '555-3456'),
(9, 'David', 'Brown', '1213 Cedar Street', 'david.brown@example.com', '678901234E', 40, '2019-05-05', '555-7890'),
(10, 'Emma', 'Taylor', '1415 Maple Street', 'emma.taylor@example.com', '098765432F', 22, '2018-06-06', '555-1234'),
(11, 'James', 'Anderson', '1617 Birch Street', 'james.anderson@example.com', '876543210G', 38, '2017-07-07', '555-5678'),
(12, 'Olivia', 'Martinez', '1819 Oak Street', 'olivia.martinez@example.com', '765432109H', 29, '2016-08-08', '555-9012'),
(13, 'William', 'Hernandez', '2021 Elm Street', 'william.hernandez@example.com', '654321098I', 33, '2015-09-09', '555-3456'),
(14, 'Sophia', 'Lopez', '2223 Pine Street', 'sophia.lopez@example.com', '543210987J', 27, '2014-10-10', '555-7890'),
(15, 'Alexander', 'Garcia', '2425 Cedar Street', 'alexander.garcia@example.com', '432109876K', 31, '2013-11-11', '555-1234'),
(16, 'Ava', 'Rodriguez', '2627 Maple Street', 'ava.rodriguez@example.com', '321098765L', 24, '2012-12-12', '555-5678'),
(17, 'Daniel', 'Martinez', '2829 Birch Street', 'daniel.martinez@example.com', '210987654M', 37, '2011-01-01', '555-9012'),
(18, 'Mia', 'Hernandez', '3031 Oak Street', 'mia.hernandez@example.com', '109876543N', 26, '2010-02-02', '555-3456'),
(19, 'Matthew', 'Lopez', '3233 Elm Street', 'matthew.lopez@example.com', '098765432O', 39, '2009-03-03', '555-7890'),
(20, 'Ella', 'Gonzalez', '3435 Pine Street', 'ella.gonzalez@example.com', '987654321P', 23, '2008-04-04', '555-1234'),
(21, 'Benjamin', 'Perez', '3637 Cedar Street', 'benjamin.perez@example.com', '876543210Q', 32, '2007-05-05', '555-5678'),
(22, 'Chloe', 'Sanchez', '3839 Maple Street', 'chloe.sanchez@example.com', '765432109R', 28, '2006-06-06', '555-9012'),
(23, 'Jacob', 'Ramirez', '4041 Birch Street', 'jacob.ramirez@example.com', '654321098S', 34, '2005-07-07', '555-3456'),
(24, 'Harper', 'Torres', '4243 Oak Street', 'harper.torres@example.com', '543210987T', 29, '2004-08-08', '555-7890');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
