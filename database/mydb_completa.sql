-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 23-08-2023 a las 07:11:47
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda_compras`
--

DROP TABLE IF EXISTS `agenda_compras`;
CREATE TABLE IF NOT EXISTS `agenda_compras` (
  `id_agenda` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_vehiculo` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `status` tinyint(1) NOT NULL,
  `entrega_local` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_agenda`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_vehiculo` (`id_vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `agenda_compras`
--

INSERT INTO `agenda_compras` (`id_agenda`, `id_usuario`, `id_vehiculo`, `fecha`, `hora`, `status`, `entrega_local`) VALUES
(7, 1, 23, '2023-07-31', '05:38:00', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicasvsvehiculoventa`
--

DROP TABLE IF EXISTS `caracteristicasvsvehiculoventa`;
CREATE TABLE IF NOT EXISTS `caracteristicasvsvehiculoventa` (
  `IdCaracteristica` int NOT NULL,
  `IdVehiculoVenta` int NOT NULL,
  KEY `vehiculo_idx` (`IdVehiculoVenta`),
  KEY `caracteristica_idx` (`IdCaracteristica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `caracteristicasvsvehiculoventa`
--

INSERT INTO `caracteristicasvsvehiculoventa` (`IdCaracteristica`, `IdVehiculoVenta`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(1, 3),
(2, 3),
(5, 4),
(6, 4),
(7, 5),
(8, 5),
(9, 6),
(10, 6),
(11, 7),
(12, 7),
(13, 8),
(14, 8),
(15, 9),
(16, 9),
(17, 10),
(18, 10),
(6, 23),
(7, 23),
(8, 23),
(12, 23),
(13, 23),
(14, 23),
(15, 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `idPersona` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `persona_idx` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `idPersona`, `nombre`, `apellido`) VALUES
(1, 1, 'Juan', 'Pérez'),
(2, 2, 'María', 'Gómez'),
(3, 3, 'Pedro', 'Ramírez'),
(4, 4, 'Ana', 'Santos'),
(5, 5, 'Carlos', 'González'),
(6, 6, 'Sofía', 'Hernández'),
(7, 7, 'Luis', 'López'),
(8, 8, 'Laura', 'Torres'),
(9, 9, 'José', 'Mendoza'),
(10, 10, 'Isabel', 'Fernández'),
(11, 11, 'Raúl', 'Jiménez'),
(12, 12, 'Marta', 'Castillo'),
(13, 13, 'Jorge', 'Cruz'),
(14, 14, 'Rosa', 'Méndez'),
(15, 15, 'Francisco', 'García'),
(16, 16, 'Elena', 'Reyes'),
(17, 17, 'Daniel', 'Rojas'),
(18, 18, 'Gabriela', 'Acosta'),
(19, 19, 'Mario', 'Sánchez'),
(20, 20, 'Carmen', 'Mora');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correos`
--

DROP TABLE IF EXISTS `correos`;
CREATE TABLE IF NOT EXISTS `correos` (
  `idcorreos` int NOT NULL AUTO_INCREMENT,
  `correo` varchar(45) NOT NULL,
  PRIMARY KEY (`idcorreos`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `correos`
--

INSERT INTO `correos` (`idcorreos`, `correo`) VALUES
(1, 'cliente1@example.com'),
(2, 'cliente2@example.com'),
(3, 'empleado1@example.com'),
(4, 'empleado2@example.com'),
(5, 'proveedor1@example.com'),
(6, 'proveedor2@example.com'),
(7, 'admin@example.com'),
(8, 'vendedor1@example.com'),
(9, 'vendedor2@example.com'),
(10, 'visitante@example.com'),
(11, 'otro1@example.com'),
(12, 'otro2@example.com'),
(13, 'otro3@example.com'),
(14, 'otro4@example.com'),
(15, 'otro5@example.com'),
(16, 'otro6@example.com'),
(17, 'otro7@example.com'),
(18, 'otro8@example.com'),
(19, 'otro9@example.com'),
(20, 'otro10@example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

DROP TABLE IF EXISTS `cursos`;
CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE IF NOT EXISTS `departamento` (
  `idDepartamento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`idDepartamento`, `nombre`, `ubicacion`, `descripcion`) VALUES
(1, 'Ventas', 'Piso 5, Edificio Principal', 'Departamento encargado de las ventas de vehículos.'),
(2, 'Recursos Humanos', 'Piso 2, Edificio Administrativo', 'Departamento de recursos humanos encargado de la gestión del personal.'),
(3, 'Mantenimiento', 'Taller 1, Área de Servicio', 'Departamento de mantenimiento y reparación de vehículos.'),
(4, 'Contabilidad', 'Piso 3, Edificio Administrativo', 'Departamento de contabilidad y finanzas.'),
(5, 'Servicio al Cliente', 'Piso 1, Edificio Principal', 'Departamento de atención al cliente y soporte postventa.'),
(6, 'Marketing', 'Piso 4, Edificio Principal', 'Departamento de marketing y publicidad.'),
(7, 'Compras', 'Piso 2, Edificio Administrativo', 'Departamento encargado de las compras y adquisiciones.'),
(8, 'Desarrollo de Producto', 'Laboratorio 1, Área de Ingeniería', 'Departamento de desarrollo de nuevos productos y prototipos.'),
(9, 'Sistemas de Información', 'Piso 5, Edificio Tecnológico', 'Departamento de sistemas de información y tecnología.'),
(10, 'Logística', 'Almacén 1, Área de Logística', 'Departamento de logística y distribución de vehículos.'),
(11, 'Calidad', 'Laboratorio 2, Área de Ingeniería', 'Departamento de control de calidad y pruebas.'),
(12, 'Recursos Educativos', 'Biblioteca, Edificio Educativo', 'Departamento de recursos educativos y capacitación.'),
(13, 'Investigación y Desarrollo', 'Laboratorio 3, Área de Investigación', 'Departamento de investigación y desarrollo de nuevas tecnologías.'),
(14, 'Relaciones Públicas', 'Piso 4, Edificio Principal', 'Departamento de relaciones públicas y eventos.'),
(15, 'Recursos Físicos', 'Piso 6, Edificio Administrativo', 'Departamento de recursos físicos y mantenimiento de instalaciones.'),
(16, 'Producción', 'Fábrica, Área de Producción', 'Departamento de producción de vehículos.'),
(17, 'Comunicaciones', 'Piso 7, Edificio Tecnológico', 'Departamento de comunicaciones y redes.'),
(18, 'Auditoría', 'Piso 3, Edificio Administrativo', 'Departamento de auditoría interna.'),
(19, 'Legal', 'Piso 2, Edificio Administrativo', 'Departamento legal y asuntos jurídicos.'),
(20, 'Gestión de Proyectos', 'Piso 4, Edificio Administrativo', 'Departamento de gestión de proyectos y planificación.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

DROP TABLE IF EXISTS `direccion`;
CREATE TABLE IF NOT EXISTS `direccion` (
  `idDireccion` int NOT NULL AUTO_INCREMENT,
  `idPersona` int NOT NULL,
  `direccion1` varchar(45) NOT NULL,
  `direccion2` varchar(45) NOT NULL,
  `idProvincia` int NOT NULL,
  `idSector` int NOT NULL,
  `tipoDireccion` int NOT NULL,
  PRIMARY KEY (`idDireccion`),
  KEY `provinca_idx` (`idProvincia`),
  KEY `sector_idx` (`idSector`),
  KEY `tipodir_idx` (`tipoDireccion`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`idDireccion`, `idPersona`, `direccion1`, `direccion2`, `idProvincia`, `idSector`, `tipoDireccion`) VALUES
(1, 1, 'Calle Principal #123', 'Apt 5A', 1, 1, 2),
(2, 2, 'Av. Duarte #456', 'Ofic. 305', 2, 2, 3),
(3, 3, 'Calle El Sol #789', 'Local 2B', 3, 3, 4),
(4, 4, 'Calle La Luna #1011', 'Bodega 7', 4, 4, 5),
(5, 5, 'Calle San Miguel #1213', 'Terreno A', 5, 5, 6),
(6, 6, 'Calle Las Flores #1415', 'Otro 1', 6, 6, 7),
(7, 7, 'Calle Los Pinos #1617', 'Otro 2', 7, 7, 7),
(8, 8, 'Calle Las Palmas #1819', 'Otro 3', 8, 8, 7),
(9, 9, 'Calle Los Jardines #2021', 'Otro 4', 9, 9, 7),
(10, 10, 'Calle Las Mariposas #2223', 'Otro 5', 10, 10, 7),
(11, 11, 'Calle Los Rios #2425', 'Otro 6', 11, 11, 7),
(12, 12, 'Calle Las Montañas #2627', 'Otro 7', 12, 12, 7),
(13, 13, 'Calle Los Lagos #2829', 'Otro 8', 13, 13, 7),
(14, 14, 'Calle Las Aves #3031', 'Otro 9', 14, 14, 7),
(15, 15, 'Calle Los Bosques #3233', 'Otro 10', 15, 15, 7),
(16, 16, 'Calle Las Playas #3435', 'Otro 11', 16, 16, 7),
(17, 17, 'Calle Los Campos #3637', 'Otro 12', 17, 17, 7),
(18, 18, 'Calle Las Monturas #3839', 'Otro 13', 18, 18, 7),
(19, 19, 'Calle Los Vientos #4041', 'Otro 14', 19, 19, 7),
(20, 20, 'Calle Las Nubes #4243', 'Otro 15', 20, 20, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `idempleado` int NOT NULL AUTO_INCREMENT,
  `idPersona` int NOT NULL,
  `codEmpleado` int NOT NULL,
  `Departamento` int NOT NULL,
  `salario` float NOT NULL,
  `FechaContratacion` date NOT NULL,
  `tipoEmpleado` int DEFAULT NULL,
  `empleadocol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idempleado`),
  KEY `persona_idx` (`idPersona`),
  KEY `tipoEmpl_idx` (`tipoEmpleado`),
  KEY `departamento_idx` (`Departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idempleado`, `idPersona`, `codEmpleado`, `Departamento`, `salario`, `FechaContratacion`, `tipoEmpleado`, `empleadocol`) VALUES
(1, 1, 1001, 1, 2000, '2022-01-10', 1, NULL),
(2, 2, 1002, 3, 1800, '2021-05-15', 2, NULL),
(3, 3, 1003, 4, 3000, '2020-03-02', 3, NULL),
(4, 4, 1004, 5, 2200, '2023-02-20', 4, NULL),
(5, 5, 1005, 2, 1500, '2023-04-05', 5, NULL),
(6, 6, 1006, 1, 1900, '2023-06-12', 1, NULL),
(7, 7, 1007, 3, 2100, '2022-11-22', 2, NULL),
(8, 8, 1008, 4, 3200, '2021-08-16', 3, NULL),
(9, 9, 1009, 5, 2400, '2022-09-30', 4, NULL),
(10, 10, 1010, 2, 1600, '2023-01-25', 5, NULL),
(11, 11, 1011, 1, 2300, '2023-05-02', 1, NULL),
(12, 12, 1012, 3, 2000, '2023-03-18', 2, NULL),
(13, 13, 1013, 4, 3500, '2022-07-14', 3, NULL),
(14, 14, 1014, 5, 2600, '2021-09-29', 4, NULL),
(15, 15, 1015, 2, 1700, '2023-06-30', 5, NULL),
(16, 16, 1016, 1, 2400, '2022-12-05', 1, NULL),
(17, 17, 1017, 3, 1900, '2023-02-28', 2, NULL),
(18, 18, 1018, 4, 3300, '2021-10-15', 3, NULL),
(19, 19, 1019, 5, 2500, '2023-03-10', 4, NULL),
(20, 20, 1020, 2, 1800, '2023-04-20', 5, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadospagos`
--

DROP TABLE IF EXISTS `estadospagos`;
CREATE TABLE IF NOT EXISTS `estadospagos` (
  `idEstadosPagos` int NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idEstadosPagos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `estadospagos`
--

INSERT INTO `estadospagos` (`idEstadosPagos`, `descripcion`) VALUES
(1, 'Pendiente'),
(2, 'Pagado'),
(3, 'Atrasado'),
(4, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
CREATE TABLE IF NOT EXISTS `favoritos` (
  `idFavorito` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int DEFAULT NULL,
  `idVehiculo` int DEFAULT NULL,
  PRIMARY KEY (`idFavorito`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idVehiculo` (`idVehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `favoritos`
--

INSERT INTO `favoritos` (`idFavorito`, `idUsuario`, `idVehiculo`) VALUES
(1, 1, 1),
(2, 1, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagoscli`
--

DROP TABLE IF EXISTS `pagoscli`;
CREATE TABLE IF NOT EXISTS `pagoscli` (
  `idPagosCli` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `idVehiculoVendido` int NOT NULL,
  `EstadoPago` int NOT NULL,
  `UltimaFechPago` date NOT NULL,
  `FechaLimPago` date NOT NULL,
  `MontoActual` float NOT NULL,
  PRIMARY KEY (`idPagosCli`),
  KEY `cliente_idx` (`idCliente`),
  KEY `vehiculoVendido_idx` (`idVehiculoVendido`),
  KEY `estadosPago_idx` (`EstadoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `pagoscli`
--

INSERT INTO `pagoscli` (`idPagosCli`, `idCliente`, `idVehiculoVendido`, `EstadoPago`, `UltimaFechPago`, `FechaLimPago`, `MontoActual`) VALUES
(1, 1, 1, 2, '2023-08-01', '2023-08-10', 1500),
(2, 2, 2, 2, '2023-08-02', '2023-08-12', 1800),
(3, 3, 3, 1, '2023-08-03', '2023-08-15', 1320),
(4, 4, 4, 1, '2023-08-04', '2023-08-16', 1680),
(5, 5, 5, 3, '2023-08-05', '2023-08-18', 1200),
(6, 6, 6, 3, '2023-08-06', '2023-08-20', 1560),
(7, 7, 7, 2, '2023-08-07', '2023-08-22', 1440),
(8, 8, 8, 2, '2023-08-08', '2023-08-24', 1920),
(9, 9, 9, 4, '2023-08-09', '2023-08-26', 1260),
(10, 10, 10, 4, '2023-08-10', '2023-08-28', 1620);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

DROP TABLE IF EXISTS `paises`;
CREATE TABLE IF NOT EXISTS `paises` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `idPersona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `doc_identidad` varchar(45) NOT NULL,
  `idDireccion` int NOT NULL,
  `idcorreo` int NOT NULL,
  `TipoPersona` int NOT NULL,
  `idtelefono` int NOT NULL,
  PRIMARY KEY (`idPersona`),
  KEY `tipoPersoa_idx` (`TipoPersona`),
  KEY `correo_idx` (`idcorreo`),
  KEY `telefono_idx` (`idtelefono`),
  KEY `direccion_idx` (`idDireccion`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idPersona`, `nombre`, `apellido`, `sexo`, `doc_identidad`, `idDireccion`, `idcorreo`, `TipoPersona`, `idtelefono`) VALUES
(1, 'Juan', 'Pérez', 'M', '001-0000000-0', 1, 1, 1, 1),
(2, 'María', 'Gómez', 'F', '002-1111111-1', 2, 2, 1, 2),
(3, 'Pedro', 'Ramírez', 'M', '003-2222222-2', 3, 3, 2, 3),
(4, 'Ana', 'Santos', 'F', '004-3333333-3', 4, 4, 2, 4),
(5, 'Carlos', 'González', 'M', '005-4444444-4', 5, 5, 3, 5),
(6, 'Sofía', 'Hernández', 'F', '006-5555555-5', 6, 6, 3, 6),
(7, 'Luis', 'López', 'M', '007-6666666-6', 7, 7, 4, 7),
(8, 'Laura', 'Torres', 'F', '008-7777777-7', 8, 8, 5, 8),
(9, 'José', 'Mendoza', 'M', '009-8888888-8', 9, 9, 5, 9),
(10, 'Isabel', 'Fernández', 'F', '010-9999999-9', 10, 10, 6, 10),
(11, 'Raúl', 'Jiménez', 'M', '011-1010101-0', 11, 11, 6, 11),
(12, 'Marta', 'Castillo', 'F', '012-1212121-1', 12, 12, 7, 12),
(13, 'Jorge', 'Cruz', 'M', '013-1313131-2', 13, 13, 7, 13),
(14, 'Rosa', 'Méndez', 'F', '014-1414141-3', 14, 14, 7, 14),
(15, 'Francisco', 'García', 'M', '015-1515151-4', 15, 15, 7, 15),
(16, 'Elena', 'Reyes', 'F', '016-1616161-5', 16, 16, 7, 16),
(17, 'Daniel', 'Rojas', 'M', '017-1717171-6', 17, 17, 7, 17),
(18, 'Gabriela', 'Acosta', 'F', '018-1818181-7', 18, 18, 7, 18),
(19, 'Mario', 'Sánchez', 'M', '019-1919191-8', 19, 19, 7, 19),
(20, 'Carmen', 'Mora', 'F', '020-2020202-9', 20, 20, 7, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `polizasseguros`
--

DROP TABLE IF EXISTS `polizasseguros`;
CREATE TABLE IF NOT EXISTS `polizasseguros` (
  `idPolizasSeguros` int NOT NULL AUTO_INCREMENT,
  `vehiculo` int NOT NULL,
  `aseguradora` int NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaRenovacion` date NOT NULL,
  `cuotaPagMensual` float NOT NULL,
  PRIMARY KEY (`idPolizasSeguros`),
  KEY `vehiculo_idx` (`vehiculo`),
  KEY `aseguradora_idx` (`aseguradora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferenciasclientes`
--

DROP TABLE IF EXISTS `preferenciasclientes`;
CREATE TABLE IF NOT EXISTS `preferenciasclientes` (
  `idPreferenciasClientes` int NOT NULL AUTO_INCREMENT,
  `CaractVehiculoP` int NOT NULL,
  `IdCliente` int NOT NULL,
  PRIMARY KEY (`idPreferenciasClientes`),
  KEY `IdCliPrefClie_idx` (`IdCliente`),
  KEY `PrefCliVehi_idx` (`CaractVehiculoP`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `preferenciasclientes`
--

INSERT INTO `preferenciasclientes` (`idPreferenciasClientes`, `CaractVehiculoP`, `IdCliente`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 1, 3),
(6, 2, 3),
(7, 3, 4),
(8, 4, 4),
(9, 1, 5),
(10, 2, 5),
(11, 3, 6),
(12, 4, 6),
(13, 1, 7),
(14, 2, 7),
(15, 3, 8),
(16, 4, 8),
(17, 1, 9),
(18, 2, 9),
(19, 3, 10),
(20, 4, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestvehiculo`
--

DROP TABLE IF EXISTS `prestvehiculo`;
CREATE TABLE IF NOT EXISTS `prestvehiculo` (
  `idPrestVehiculo` int NOT NULL AUTO_INCREMENT,
  `vehiculo` int NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaCulminacion` date NOT NULL,
  `pagosMensAcordados` float NOT NULL,
  PRIMARY KEY (`idPrestVehiculo`),
  KEY `vehiculo_idx` (`vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

DROP TABLE IF EXISTS `provincia`;
CREATE TABLE IF NOT EXISTS `provincia` (
  `idprovincia` int NOT NULL AUTO_INCREMENT,
  `nomProv` varchar(45) NOT NULL,
  PRIMARY KEY (`idprovincia`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`idprovincia`, `nomProv`) VALUES
(1, 'Santo Domingo'),
(2, 'Santiago'),
(3, 'La Romana'),
(4, 'Puerto Plata'),
(5, 'San Cristóbal'),
(6, 'La Vega'),
(7, 'San Pedro de Macorís'),
(8, 'Duarte'),
(9, 'Espaillat'),
(10, 'San Juan'),
(11, 'Monte Plata'),
(12, 'Peravia'),
(13, 'Azua'),
(14, 'Barahona'),
(15, 'La Altagracia'),
(16, 'Samana'),
(17, 'Sanchez Ramirez'),
(18, 'Hato Mayor'),
(19, 'Dajabon'),
(20, 'Elias Pina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

DROP TABLE IF EXISTS `registro`;
CREATE TABLE IF NOT EXISTS `registro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_sub_categoria` int DEFAULT NULL,
  `meta_fecha` int DEFAULT NULL,
  `que` text,
  `porque` text,
  `como` text,
  `cuando` text,
  `donde` text,
  `conquien` text,
  `costo` text,
  PRIMARY KEY (`id`),
  KEY `asd_idx` (`id_sub_categoria`),
  KEY `registro_usuario_idx` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sector`
--

DROP TABLE IF EXISTS `sector`;
CREATE TABLE IF NOT EXISTS `sector` (
  `idSector` int NOT NULL AUTO_INCREMENT,
  `nomSector` varchar(45) NOT NULL,
  PRIMARY KEY (`idSector`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `sector`
--

INSERT INTO `sector` (`idSector`, `nomSector`) VALUES
(1, 'Zona Colonial'),
(2, 'Bella Vista'),
(3, 'Piantini'),
(4, 'Ensanche Naco'),
(5, 'Mirador Norte'),
(6, 'Los Alcarrizos'),
(7, 'La Fe'),
(8, 'Villa Juana'),
(9, 'Villa Consuelo'),
(10, 'Santiago de los Caballeros'),
(11, 'Villa Olga'),
(12, 'Cienfuegos'),
(13, 'Barrio Obrero'),
(14, 'Villa Duarte'),
(15, 'Gualey'),
(16, 'Ensanche Espaillat'),
(17, 'Las Caobas'),
(18, 'Urbanización del Este'),
(19, 'Buenos Aires'),
(20, 'Las Mercedes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguros`
--

DROP TABLE IF EXISTS `seguros`;
CREATE TABLE IF NOT EXISTS `seguros` (
  `idSeguros` int NOT NULL AUTO_INCREMENT,
  `nomSeguro` varchar(45) NOT NULL,
  PRIMARY KEY (`idSeguros`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sub_categorias`
--

DROP TABLE IF EXISTS `sub_categorias`;
CREATE TABLE IF NOT EXISTS `sub_categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_catecogia_categoria_idx` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

DROP TABLE IF EXISTS `telefono`;
CREATE TABLE IF NOT EXISTS `telefono` (
  `idtelefono` int NOT NULL AUTO_INCREMENT,
  `tipoTel` int NOT NULL,
  `numTel` varchar(45) NOT NULL,
  PRIMARY KEY (`idtelefono`),
  KEY `tipoTel_idx` (`tipoTel`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `telefono`
--

INSERT INTO `telefono` (`idtelefono`, `tipoTel`, `numTel`) VALUES
(1, 1, '555-1234'),
(2, 1, '555-5678'),
(3, 2, '777-9876'),
(4, 2, '777-5432'),
(5, 3, '444-8765'),
(6, 3, '444-2345'),
(7, 4, '666-5678'),
(8, 4, '666-1234'),
(9, 5, '888-4321'),
(10, 5, '888-8765'),
(11, 1, '555-1111'),
(12, 2, '777-2222'),
(13, 3, '444-3333'),
(14, 4, '666-4444'),
(15, 5, '888-5555'),
(16, 1, '555-6666'),
(17, 2, '777-7777'),
(18, 3, '444-8888'),
(19, 4, '666-9999'),
(20, 5, '888-0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodireccion`
--

DROP TABLE IF EXISTS `tipodireccion`;
CREATE TABLE IF NOT EXISTS `tipodireccion` (
  `idtipoDireccion` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoDireccion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tipodireccion`
--

INSERT INTO `tipodireccion` (`idtipoDireccion`, `descripcion`) VALUES
(1, 'Casa'),
(2, 'Apartamento'),
(3, 'Oficina'),
(4, 'Local Comercial'),
(5, 'Bodega'),
(6, 'Terreno'),
(7, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoempleado`
--

DROP TABLE IF EXISTS `tipoempleado`;
CREATE TABLE IF NOT EXISTS `tipoempleado` (
  `idtipoEmpleado` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tipoempleado`
--

INSERT INTO `tipoempleado` (`idtipoEmpleado`, `descripcion`) VALUES
(1, 'Vendedor'),
(2, 'Mecánico'),
(3, 'Gerente'),
(4, 'Administrativo'),
(5, 'Lavador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopersona`
--

DROP TABLE IF EXISTS `tipopersona`;
CREATE TABLE IF NOT EXISTS `tipopersona` (
  `idTipoPersona` int NOT NULL AUTO_INCREMENT,
  `TipoPersonaDescrip` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tipopersona`
--

INSERT INTO `tipopersona` (`idTipoPersona`, `TipoPersonaDescrip`) VALUES
(1, 'Cliente'),
(2, 'Empleado'),
(3, 'Proveedor'),
(4, 'Administrador'),
(5, 'Vendedor'),
(6, 'Visitante'),
(7, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipotelefono`
--

DROP TABLE IF EXISTS `tipotelefono`;
CREATE TABLE IF NOT EXISTS `tipotelefono` (
  `idtipoTelefono` int NOT NULL AUTO_INCREMENT,
  `tipoTel` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoTelefono`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tipotelefono`
--

INSERT INTO `tipotelefono` (`idtipoTelefono`, `tipoTel`) VALUES
(1, 'Móvil'),
(2, 'Casa'),
(3, 'Trabajo'),
(4, 'Fax'),
(5, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuairos`
--

DROP TABLE IF EXISTS `usuairos`;
CREATE TABLE IF NOT EXISTS `usuairos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `contraseña` varchar(80) DEFAULT NULL,
  `id_curso` int DEFAULT NULL,
  `id_rol` int DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '1',
  `pais` int DEFAULT NULL,
  `vision` text,
  PRIMARY KEY (`id`),
  KEY `usuario_curso_idx` (`id_curso`),
  KEY `usuario_rol_idx` (`id_rol`),
  KEY `usuario_pais_idx` (`pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `NombreUser` varchar(45) NOT NULL,
  `PasswUser` varchar(45) NOT NULL,
  `idPersona` int NOT NULL,
  `isInterno` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idUsuario`),
  KEY `persona_idx` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `NombreUser`, `PasswUser`, `idPersona`, `isInterno`) VALUES
(1, 'admin', 'admin', 1, 1),
(2, 'user', 'user', 2, 0),
(3, 'pedro_ramirez', 'password3', 3, 1),
(4, 'ana_santos', 'password4', 4, 1),
(5, 'carlos_gonzalez', 'password5', 5, 1),
(6, 'sofia_hernandez', 'password6', 6, 1),
(7, 'luis_lopez', 'password7', 7, 1),
(8, 'laura_torres', 'password8', 8, 1),
(9, 'jose_mendoza', 'password9', 9, 1),
(10, 'isabel_fernandez', 'password10', 10, 1),
(11, 'raul_jimenez', 'password11', 11, 1),
(12, 'marta_castillo', 'password12', 12, 1),
(13, 'jorge_cruz', 'password13', 13, 1),
(14, 'rosa_mendez', 'password14', 14, 1),
(15, 'francisco_garcia', 'password15', 15, 1),
(16, 'elena_reyes', 'password16', 16, 1),
(17, 'daniel_rojas', 'password17', 17, 1),
(18, 'gabriela_acosta', 'password18', 18, 1),
(19, 'mario_sanchez', 'password19', 19, 1),
(20, 'carmen_mora', 'password20', 20, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos_marcas`
--

DROP TABLE IF EXISTS `vehiculos_marcas`;
CREATE TABLE IF NOT EXISTS `vehiculos_marcas` (
  `idVehiculos_Marca` int NOT NULL AUTO_INCREMENT,
  `marca_nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idVehiculos_Marca`),
  UNIQUE KEY `marca_nombre_UNIQUE` (`marca_nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `vehiculos_marcas`
--

INSERT INTO `vehiculos_marcas` (`idVehiculos_Marca`, `marca_nombre`) VALUES
(4, 'Chevrolet'),
(8, 'Ferrari'),
(3, 'Ford'),
(2, 'Honda'),
(5, 'Nissan'),
(1, 'Toyota');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos_modelos`
--

DROP TABLE IF EXISTS `vehiculos_modelos`;
CREATE TABLE IF NOT EXISTS `vehiculos_modelos` (
  `idVehiculos_Modelos` int NOT NULL AUTO_INCREMENT,
  `Modelo_nombre` varchar(45) NOT NULL,
  `marca` int NOT NULL,
  PRIMARY KEY (`idVehiculos_Modelos`),
  UNIQUE KEY `idVehiculos_Modelos_UNIQUE` (`idVehiculos_Modelos`),
  UNIQUE KEY `Modelo_nombre_UNIQUE` (`Modelo_nombre`),
  KEY `marca` (`marca`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `vehiculos_modelos`
--

INSERT INTO `vehiculos_modelos` (`idVehiculos_Modelos`, `Modelo_nombre`, `marca`) VALUES
(1, 'Corolla', 1),
(2, 'Civic', 2),
(3, 'F-150', 3),
(4, 'Silverado', 4),
(5, 'Altima', 5),
(6, 'Camry', 1),
(7, 'Accord', 2),
(8, 'Mustang', 3),
(9, 'Cruze', 4),
(10, 'Sentra', 5),
(11, 'Rav4', 1),
(12, 'Fit', 2),
(13, 'Focus', 3),
(14, 'Equinox', 4),
(15, 'Maxima', 5),
(16, 'Highlander', 1),
(17, 'HR-V', 2),
(18, 'Explorer', 3),
(19, 'Traverse', 4),
(20, 'Rogue', 5),
(24, 'LaFerrari', 8),
(25, 'SF90', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos_vendidos`
--

DROP TABLE IF EXISTS `vehiculos_vendidos`;
CREATE TABLE IF NOT EXISTS `vehiculos_vendidos` (
  `idVehiculos_Vendidos` int NOT NULL AUTO_INCREMENT,
  `idVehiculoVenta` int NOT NULL,
  `id_usuario` int NOT NULL,
  `idCliente` int NOT NULL,
  `PrecioAcordado` float NOT NULL,
  `fechaVenta` date NOT NULL,
  `MontoPagoMensual` float NOT NULL,
  PRIMARY KEY (`idVehiculos_Vendidos`),
  KEY `id_usuario` (`id_usuario`),
  KEY `idCliente` (`idCliente`),
  KEY `idVehiculoVenta` (`idVehiculoVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `vehiculos_vendidos`
--

INSERT INTO `vehiculos_vendidos` (`idVehiculos_Vendidos`, `idVehiculoVenta`, `id_usuario`, `idCliente`, `PrecioAcordado`, `fechaVenta`, `MontoPagoMensual`) VALUES
(1, 1, 1, 1, 25000, '2023-07-01', 1500),
(2, 2, 1, 1, 30000, '2023-07-02', 1800),
(3, 3, 1, 2, 22000, '2023-07-03', 1320),
(4, 4, 2, 2, 28000, '2023-07-04', 1680),
(5, 5, 2, 3, 20000, '2023-07-05', 1200),
(6, 6, 2, 3, 26000, '2023-07-06', 1560),
(7, 7, 3, 4, 24000, '2023-07-07', 1440),
(8, 8, 3, 4, 32000, '2023-07-08', 1920),
(9, 9, 3, 5, 21000, '2023-07-09', 1260),
(10, 10, 4, 5, 27000, '2023-07-10', 1620),
(21, 23, 1, 1, 56, '2023-08-23', 0),
(23, 23, 1, 1, 56, '2023-08-23', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos_venta`
--

DROP TABLE IF EXISTS `vehiculos_venta`;
CREATE TABLE IF NOT EXISTS `vehiculos_venta` (
  `idVehiculos_Venta` int NOT NULL AUTO_INCREMENT,
  `vehiculo_matricula` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `precio` float NOT NULL,
  `millage` float NOT NULL,
  `fecha_adquisicion` date NOT NULL,
  `year` varchar(45) NOT NULL,
  `vehiculo_modelo` int DEFAULT NULL,
  `vehiculo_Categoria` int NOT NULL,
  `nuevo` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(100) NOT NULL,
  `puertas` varchar(20) NOT NULL,
  `motor` varchar(20) NOT NULL,
  `trasmision` varchar(20) NOT NULL,
  `traccion` varchar(20) NOT NULL,
  `pasajeros` varchar(20) NOT NULL,
  `color` varchar(20) NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  PRIMARY KEY (`idVehiculos_Venta`),
  KEY `categoria_idx` (`vehiculo_Categoria`),
  KEY `vehiculo_modelo_UNIQUE` (`vehiculo_modelo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `vehiculos_venta`
--

INSERT INTO `vehiculos_venta` (`idVehiculos_Venta`, `vehiculo_matricula`, `precio`, `millage`, `fecha_adquisicion`, `year`, `vehiculo_modelo`, `vehiculo_Categoria`, `nuevo`, `image`, `puertas`, `motor`, `trasmision`, `traccion`, `pasajeros`, `color`, `disponible`) VALUES
(1, 'ABC123', 25000, 20000, '2023-01-01', '2022', 1, 1, 1, 'corolla.jpg', '', '', '', '', '', '', 0),
(2, 'DEF456', 28000, 15000, '2023-01-02', '2022', 2, 1, 1, 'civic.jpg', '', '', '', '', '', '', 0),
(3, 'GHI789', 32000, 10000, '2023-01-03', '2022', 3, 2, 1, 'f150.jpg', '', '', '', '', '', '', 0),
(4, 'JKL012', 35000, 12000, '2023-01-04', '2022', 4, 2, 1, 'silverado.jpg', '', '', '', '', '', '', 0),
(5, 'MNO345', 26000, 18000, '2023-01-05', '2022', 5, 3, 1, 'altima.jpg', '', '', '', '', '', '', 0),
(6, 'PQR678', 34000, 8000, '2023-01-06', '2022', 6, 1, 1, '3series.jpg', '', '', '', '', '', '', 0),
(7, 'STU901', 39000, 7000, '2023-01-07', '2022', 7, 1, 1, 'cclass.jpg', '', '', '', '', '', '', 0),
(8, 'VWX234', 42000, 5000, '2023-01-08', '2022', 8, 2, 1, 'a4.jpg', '', '', '', '', '', '', 0),
(9, 'YZA567', 28000, 12000, '2023-01-09', '2022', 9, 2, 1, 'elantra.jpg', '', '', '', '', '', '', 0),
(10, 'BCD890', 31000, 9000, '2023-01-10', '2022', 10, 3, 1, 'sorento.jpg', '', '', '', '', '', '', 0),
(11, 'EFG123', 28000, 17000, '2023-01-11', '2022', 11, 3, 1, 'golf.jpg', '', '', '', '', '', '', 1),
(12, 'HIJ456', 33000, 15000, '2023-01-12', '2022', 12, 1, 1, 'cx5.jpg', '', '', '', '', '', '', 1),
(13, 'KLM789', 38000, 12000, '2023-01-13', '2022', 13, 1, 1, 'outback.jpg', '', '', '', '', '', '', 1),
(14, 'NOP012', 39000, 18000, '2023-01-14', '2022', 14, 2, 1, 'wrangler.jpg', '', '', '', '', '', '', 1),
(15, 'QRS345', 45000, 8000, '2023-01-15', '2022', 15, 2, 1, 'rx.jpg', '', '', '', '', '', '', 1),
(16, 'TUV678', 32000, 20000, '2023-01-16', '2022', 16, 3, 1, 'xc60.jpg', '', '', '', '', '', '', 1),
(17, 'WXY901', 49000, 7000, '2023-01-17', '2022', 17, 3, 1, '488gtb.jpg', '', '', '', '', '', '', 1),
(18, 'ZAB234', 52000, 6000, '2023-01-18', '2022', 18, 1, 1, '911.jpg', '', '', '', '', '', '', 1),
(19, 'CDE567', 80000, 3000, '2023-01-19', '2022', 19, 1, 1, 'models.jpg', '', '', '', '', '', '', 1),
(20, 'FGH890', 85000, 5000, '2023-01-20', '2022', 20, 2, 1, 'rangerover.jpg', '', '', '', '', '', '', 1),
(23, 'ASDQ', 56222000, 0, '0000-00-00', '2035', 24, 9, 1, '', '2', 'V12', 'semi-auto', 'AWD', '2', '2', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_caracteristicas`
--

DROP TABLE IF EXISTS `vehiculo_caracteristicas`;
CREATE TABLE IF NOT EXISTS `vehiculo_caracteristicas` (
  `idVehiculo_Caracteristicas` int NOT NULL AUTO_INCREMENT,
  `Vehiculo_Caracteristica` varchar(45) NOT NULL,
  PRIMARY KEY (`idVehiculo_Caracteristicas`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `vehiculo_caracteristicas`
--

INSERT INTO `vehiculo_caracteristicas` (`idVehiculo_Caracteristicas`, `Vehiculo_Caracteristica`) VALUES
(1, 'Airbags'),
(2, 'Cámara de retroceso'),
(3, 'Sistema de navegación'),
(4, 'Asientos de cuero'),
(5, 'Techo panorámico'),
(6, 'Bluetooth'),
(7, 'Control de crucero'),
(8, 'Sistema de audio premium'),
(9, 'Faros LED'),
(10, 'Asientos calefactados'),
(11, 'Sistema de asistencia al conductor'),
(12, 'Sistema de arranque sin llave'),
(13, 'Sistema de alerta de cambio de carril'),
(14, 'Sistema de frenado de emergencia'),
(15, 'Sensores de estacionamiento'),
(16, 'Control de clima dual'),
(17, 'Pantalla táctil'),
(18, 'Puerto USB'),
(19, 'Ruedas de aleación'),
(20, 'Control por voz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_categoria`
--

DROP TABLE IF EXISTS `vehiculo_categoria`;
CREATE TABLE IF NOT EXISTS `vehiculo_categoria` (
  `idVehiculo_Categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_Categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`idVehiculo_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `vehiculo_categoria`
--

INSERT INTO `vehiculo_categoria` (`idVehiculo_Categoria`, `nombre_Categoria`) VALUES
(1, 'Sedan'),
(2, 'SUV'),
(3, 'Pickup'),
(4, 'Deportivo'),
(5, 'Camioneta'),
(6, 'Hatchback'),
(7, 'Convertible'),
(9, 'Coupé'),
(13, 'Compacto');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agenda_compras`
--
ALTER TABLE `agenda_compras`
  ADD CONSTRAINT `agenda_compras_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `agenda_compras_ibfk_2` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos_venta` (`idVehiculos_Venta`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `caracteristicasvsvehiculoventa`
--
ALTER TABLE `caracteristicasvsvehiculoventa`
  ADD CONSTRAINT `caracteristica` FOREIGN KEY (`IdCaracteristica`) REFERENCES `vehiculo_caracteristicas` (`idVehiculo_Caracteristicas`),
  ADD CONSTRAINT `vehiculo` FOREIGN KEY (`IdVehiculoVenta`) REFERENCES `vehiculos_venta` (`idVehiculos_Venta`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `personaCliente` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`);

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `provincia` FOREIGN KEY (`idProvincia`) REFERENCES `provincia` (`idprovincia`),
  ADD CONSTRAINT `sector` FOREIGN KEY (`idSector`) REFERENCES `sector` (`idSector`),
  ADD CONSTRAINT `tipodir` FOREIGN KEY (`tipoDireccion`) REFERENCES `tipodireccion` (`idtipoDireccion`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_Departamento` FOREIGN KEY (`Departamento`) REFERENCES `departamento` (`idDepartamento`),
  ADD CONSTRAINT `personaEmpleado` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`),
  ADD CONSTRAINT `tipoEmpl` FOREIGN KEY (`tipoEmpleado`) REFERENCES `tipoempleado` (`idtipoEmpleado`);

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculos_venta` (`idVehiculos_Venta`);

--
-- Filtros para la tabla `pagoscli`
--
ALTER TABLE `pagoscli`
  ADD CONSTRAINT `estadosPago` FOREIGN KEY (`EstadoPago`) REFERENCES `estadospagos` (`idEstadosPagos`),
  ADD CONSTRAINT `pagoscliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `vehiculoVendido` FOREIGN KEY (`idVehiculoVendido`) REFERENCES `vehiculos_vendidos` (`idVehiculos_Vendidos`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `correo` FOREIGN KEY (`idcorreo`) REFERENCES `correos` (`idcorreos`),
  ADD CONSTRAINT `direccion` FOREIGN KEY (`idDireccion`) REFERENCES `direccion` (`idDireccion`),
  ADD CONSTRAINT `telefono` FOREIGN KEY (`idtelefono`) REFERENCES `telefono` (`idtelefono`),
  ADD CONSTRAINT `tipoPersoa` FOREIGN KEY (`TipoPersona`) REFERENCES `tipopersona` (`idTipoPersona`);

--
-- Filtros para la tabla `polizasseguros`
--
ALTER TABLE `polizasseguros`
  ADD CONSTRAINT `aseguradora` FOREIGN KEY (`aseguradora`) REFERENCES `seguros` (`idSeguros`),
  ADD CONSTRAINT `polizavehiculo` FOREIGN KEY (`vehiculo`) REFERENCES `vehiculos_vendidos` (`idVehiculos_Vendidos`);

--
-- Filtros para la tabla `preferenciasclientes`
--
ALTER TABLE `preferenciasclientes`
  ADD CONSTRAINT `IdCliPrefClie` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `PrefCliVehi` FOREIGN KEY (`CaractVehiculoP`) REFERENCES `vehiculo_caracteristicas` (`idVehiculo_Caracteristicas`);

--
-- Filtros para la tabla `prestvehiculo`
--
ALTER TABLE `prestvehiculo`
  ADD CONSTRAINT `prestvehiculo` FOREIGN KEY (`vehiculo`) REFERENCES `vehiculos_vendidos` (`idVehiculos_Vendidos`);

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_sub_categoria` FOREIGN KEY (`id_sub_categoria`) REFERENCES `sub_categorias` (`id`),
  ADD CONSTRAINT `registro_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuairos` (`id`);

--
-- Filtros para la tabla `sub_categorias`
--
ALTER TABLE `sub_categorias`
  ADD CONSTRAINT `sub_catecogia_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE RESTRICT;

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `tipoTel` FOREIGN KEY (`tipoTel`) REFERENCES `tipotelefono` (`idtipoTelefono`);

--
-- Filtros para la tabla `usuairos`
--
ALTER TABLE `usuairos`
  ADD CONSTRAINT `usuario_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `usuario_pais` FOREIGN KEY (`pais`) REFERENCES `paises` (`id`),
  ADD CONSTRAINT `usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `personaUser` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`);

--
-- Filtros para la tabla `vehiculos_modelos`
--
ALTER TABLE `vehiculos_modelos`
  ADD CONSTRAINT `marca` FOREIGN KEY (`marca`) REFERENCES `vehiculos_marcas` (`idVehiculos_Marca`);

--
-- Filtros para la tabla `vehiculos_vendidos`
--
ALTER TABLE `vehiculos_vendidos`
  ADD CONSTRAINT `vehiculos_vendidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `vehiculos_vendidos_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `vehiculos_vendidos_ibfk_3` FOREIGN KEY (`idVehiculoVenta`) REFERENCES `vehiculos_venta` (`idVehiculos_Venta`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `vehiculos_venta`
--
ALTER TABLE `vehiculos_venta`
  ADD CONSTRAINT `categoria` FOREIGN KEY (`vehiculo_Categoria`) REFERENCES `vehiculo_categoria` (`idVehiculo_Categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `vehiculos_venta_FK` FOREIGN KEY (`vehiculo_modelo`) REFERENCES `vehiculos_modelos` (`idVehiculos_Modelos`) ON DELETE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
