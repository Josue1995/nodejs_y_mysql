-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2018 a las 18:58:52
-- Versión del servidor: 10.1.33-MariaDB
-- Versión de PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `directorio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `event`
--

CREATE TABLE `event` (
  `event_id` smallint(6) NOT NULL,
  `user_id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `start` date NOT NULL,
  `end` date DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  `allDay` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `event`
--

INSERT INTO `event` (`event_id`, `user_id`, `title`, `start`, `end`, `start_time`, `end_time`, `allDay`) VALUES
(1, 33, 'wa', '0000-00-00', '0000-00-00', '00:00:00', NULL, NULL),
(2, 31, 'cumpleaños', '2018-09-27', NULL, '06:00:00', NULL, NULL),
(5, 35, 'cumple', '2018-07-11', '2018-07-12', '00:00:00', NULL, 1),
(6, 35, 'fiesta', '2018-09-12', '2018-09-13', '00:00:00', NULL, 1),
(7, 35, 'asueto', '2018-11-02', '2018-11-02', '00:00:00', NULL, 1),
(8, 33, 'salida', '2018-11-01', '0000-00-00', '00:00:00', '00:00:00', 7),
(9, 33, 'navidad', '2018-12-25', '1970-01-01', '00:00:00', '00:00:00', 1),
(10, 33, 'aÃ±o nuevo', '2018-12-31', '2019-01-01', '07:00:00', '23:30:00', 0),
(11, 33, 'parcial COS', '2018-10-06', '2018-10-06', '10:00:00', '12:00:00', 0),
(12, 33, 'parcial contables', '2018-10-05', '2018-10-05', '06:30:00', '08:00:00', 0),
(13, 40, 'cumpleanio', '2014-10-09', '2014-10-09', '05:00:00', '23:00:00', 0),
(14, 40, 'hoy', '2018-10-30', '0000-00-00', '00:00:00', '00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `birthday`) VALUES
(2, 'josue torres', 'josue@gmail.com', 'fuck', '1995-06-09'),
(21, 'josue', 'josue@gmail', 'fuckyou', '1995-06-09'),
(22, 'Josue Alfonso Torres Artiaga', 'josude@gmail.com', '$2y$10$p1IqXaTB1RFoB5N6rRnml.av1QpcmnKkJuDSApBNFKHWh7UuaG.Lu', '0000-00-00'),
(29, 'Josue Alfonso Torres Artiaga', 'josufde@gmail.com', '$2y$10$st./C6f3qezSq0fnrDD.g.WwVRWE8iYv18HSH0S9jqfZfTv4TgAWy', '0000-00-00'),
(30, 'Josue Alfonso Torres Artiaga', 'josufddfe@gmail.com', '$2y$10$vMqApZf1xfyyLBgvY6jh6.paG5xRtVeTtLQHiQ3Qc5UHU/G8feVwa', '1995-06-09'),
(31, 'Rodrigo Torres', 'rodmayi_@hotmail.com', '$2y$10$63tAqJZRp783LOoiR/nWvOZEvvMA.DAt6ZC/LXRFVSASsxX7O.bpO', '1996-09-27'),
(33, 'Pupie Torres', 'pupete@gmail.com', '$2y$10$coso9YY08z7Z0pjCCodd2OSg9zgwbmzd31vHKzX7fIWLOP8.cnnG2', '2016-11-05'),
(34, '', '', '$2y$10$BXYif8ZZKvE3DfGyQCWlee0UZ4uljrflmkmNJ.HxXLpVe82BWPW6q', '1970-01-01'),
(35, 'Alma Saenz', 'bellaluna@gmail.com', '$2y$10$0IU61F/dimSteqXg0G0H8.twf6jauUMmLJ919hWeIaK812gmML4Wm', '1972-07-11'),
(36, 'Coquete Torres', 'coquete@gmail.com', '$2y$10$dzm6SoTbzXINI0IhNDCFy.BKVbUFYYa0ZGfWWQ7/81sf13VvPqNt6', '2013-10-09'),
(37, 'Pacman', 'mrpacman@hotmail.com', '$2y$10$RpZLKVzQzYldFpFPerGp4eCPCZGnkLOp/dbQ8YAyy7qnFeRJjjoTS', '2018-12-20'),
(38, 'josue alfonso torres', 'josue12@hotmail.com', '$2y$10$S14GLh.t785hBryxXaKEtOn1zgVwMKLgkNPj6/WktTolXSWMQ17oG', '1995-06-09'),
(39, 'rodrigo mauricio torres', 'rod12@hotmail.com', '$2y$10$vsHWA6a0xEkOlZD4Snfj6ecv22Gbw0SJ2cGwvC55vzFZiILuIYOR6', '1996-09-27'),
(40, 'coco torres', 'coco@hotmail.com', '$2y$10$9Dl5G1Lepcw6DfjGJF/a9es/grfxFEGCC0v7S4OhAUlJdaOC3vJ7K', '2014-10-09');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `foreign_key` (`user_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `event`
--
ALTER TABLE `event`
  MODIFY `event_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `foreign_key` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
