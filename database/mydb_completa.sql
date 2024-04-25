-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2024 at 04:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `caracteristicasvsvehiculoventa`
--

CREATE TABLE `caracteristicasvsvehiculoventa` (
  `IdCaracteristica` int(11) NOT NULL,
  `IdVehiculoVenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `caracteristicasvsvehiculoventa`
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
(15, 23),
(1, 14),
(16, 14),
(3, 14),
(1, 47),
(1, 56),
(2, 56),
(4, 56),
(6, 56),
(9, 56),
(10, 56),
(1, 57),
(2, 57),
(4, 57),
(6, 57),
(9, 57),
(10, 57),
(2, 58),
(2, 59),
(2, 60);

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cliente`
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
-- Table structure for table `combustible`
--

CREATE TABLE `combustible` (
  `idcombustible` int(11) NOT NULL,
  `descripcionCb` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `combustible`
--

INSERT INTO `combustible` (`idcombustible`, `descripcionCb`) VALUES
(1, 'Gasolina'),
(2, 'Diesel'),
(3, 'Eléctrico'),
(4, 'Hibrido');

-- --------------------------------------------------------

--
-- Table structure for table `consumocombustibles`
--

CREATE TABLE `consumocombustibles` (
  `idconsumo` int(2) NOT NULL,
  `descripTipoconsumo` varchar(50) NOT NULL,
  `tc_valinicial` int(10) NOT NULL,
  `tc_valfinal` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consumocombustibles`
--

INSERT INTO `consumocombustibles` (`idconsumo`, `descripTipoconsumo`, `tc_valinicial`, `tc_valfinal`) VALUES
(1, 'Bajo', 1, 10),
(2, 'Regular', 11, 15),
(3, 'Aceptable', 16, 20),
(4, 'Bueno', 21, 30),
(5, 'Excelente', 31, 50);

-- --------------------------------------------------------

--
-- Table structure for table `correos`
--

CREATE TABLE `correos` (
  `idcorreos` int(11) NOT NULL,
  `correo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `correos`
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
-- Table structure for table `cursos`
--

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departamento`
--

CREATE TABLE `departamento` (
  `idDepartamento` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `departamento`
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
-- Table structure for table `direccion`
--

CREATE TABLE `direccion` (
  `idDireccion` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `direccion1` varchar(45) NOT NULL,
  `direccion2` varchar(45) NOT NULL,
  `idProvincia` int(11) NOT NULL,
  `idSector` int(11) NOT NULL,
  `tipoDireccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `direccion`
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
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `idempleado` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `codEmpleado` int(11) NOT NULL,
  `Departamento` int(11) NOT NULL,
  `salario` float NOT NULL,
  `FechaContratacion` date NOT NULL,
  `tipoEmpleado` int(11) DEFAULT NULL,
  `empleadocol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `empleado`
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
-- Table structure for table `estadospagos`
--

CREATE TABLE `estadospagos` (
  `idEstadosPagos` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `estadospagos`
--

INSERT INTO `estadospagos` (`idEstadosPagos`, `descripcion`) VALUES
(1, 'Pendiente'),
(2, 'Pagado'),
(3, 'Atrasado'),
(4, 'Cancelado');

-- --------------------------------------------------------

--
-- Table structure for table `favoritos`
--

CREATE TABLE `favoritos` (
  `idFavorito` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idVehiculo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `favoritos`
--

INSERT INTO `favoritos` (`idFavorito`, `idUsuario`, `idVehiculo`) VALUES
(1, 1, 1),
(2, 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `pagoscli`
--

CREATE TABLE `pagoscli` (
  `idPagosCli` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idVehiculoVendido` int(11) NOT NULL,
  `EstadoPago` int(11) NOT NULL,
  `UltimaFechPago` date NOT NULL,
  `FechaLimPago` date NOT NULL,
  `MontoActual` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pagoscli`
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
-- Table structure for table `paises`
--

CREATE TABLE `paises` (
  `id` int(11) NOT NULL,
  `pais` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE `persona` (
  `idPersona` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `doc_identidad` varchar(45) NOT NULL,
  `idDireccion` int(11) NOT NULL,
  `idcorreo` int(11) NOT NULL,
  `TipoPersona` int(11) NOT NULL,
  `idtelefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `persona`
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
-- Table structure for table `polizasseguros`
--

CREATE TABLE `polizasseguros` (
  `idPolizasSeguros` int(11) NOT NULL,
  `vehiculo` int(11) NOT NULL,
  `aseguradora` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaRenovacion` date NOT NULL,
  `cuotaPagMensual` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `preferenciasclientes`
--

CREATE TABLE `preferenciasclientes` (
  `idPreferenciasClientes` int(11) NOT NULL,
  `CaractVehiculoP` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `preferenciasclientes`
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
-- Table structure for table `prestvehiculo`
--

CREATE TABLE `prestvehiculo` (
  `idPrestVehiculo` int(11) NOT NULL,
  `vehiculo` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaCulminacion` date NOT NULL,
  `pagosMensAcordados` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provincia`
--

CREATE TABLE `provincia` (
  `idprovincia` int(11) NOT NULL,
  `nomProv` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `provincia`
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
-- Table structure for table `registro`
--

CREATE TABLE `registro` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_sub_categoria` int(11) DEFAULT NULL,
  `meta_fecha` int(11) DEFAULT NULL,
  `que` text DEFAULT NULL,
  `porque` text DEFAULT NULL,
  `como` text DEFAULT NULL,
  `cuando` text DEFAULT NULL,
  `donde` text DEFAULT NULL,
  `conquien` text DEFAULT NULL,
  `costo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sector`
--

CREATE TABLE `sector` (
  `idSector` int(11) NOT NULL,
  `nomSector` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sector`
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
-- Table structure for table `seguros`
--

CREATE TABLE `seguros` (
  `idSeguros` int(11) NOT NULL,
  `nomSeguro` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categorias`
--

CREATE TABLE `sub_categorias` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tamanobaul`
--

CREATE TABLE `tamanobaul` (
  `idTamanoBaul` int(1) NOT NULL,
  `descripBaul` varchar(50) NOT NULL,
  `capacidadMinBaul` int(10) NOT NULL,
  `capacidadMaxBaul` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tamanobaul`
--

INSERT INTO `tamanobaul` (`idTamanoBaul`, `descripBaul`, `capacidadMinBaul`, `capacidadMaxBaul`) VALUES
(1, 'Baul Pequeño', 1, 120),
(2, 'Baul Mediano', 121, 240),
(3, 'Baul Promedio', 241, 360),
(4, 'Baul Grande', 361, 480),
(5, 'Baul Extra Grande', 481, 600);

-- --------------------------------------------------------

--
-- Table structure for table `telefono`
--

CREATE TABLE `telefono` (
  `idtelefono` int(11) NOT NULL,
  `tipoTel` int(11) NOT NULL,
  `numTel` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `telefono`
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
-- Table structure for table `tipodireccion`
--

CREATE TABLE `tipodireccion` (
  `idtipoDireccion` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tipodireccion`
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
-- Table structure for table `tipoempleado`
--

CREATE TABLE `tipoempleado` (
  `idtipoEmpleado` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tipoempleado`
--

INSERT INTO `tipoempleado` (`idtipoEmpleado`, `descripcion`) VALUES
(1, 'Vendedor'),
(2, 'Mecánico'),
(3, 'Gerente'),
(4, 'Administrativo'),
(5, 'Lavador');

-- --------------------------------------------------------

--
-- Table structure for table `tipopersona`
--

CREATE TABLE `tipopersona` (
  `idTipoPersona` int(11) NOT NULL,
  `TipoPersonaDescrip` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tipopersona`
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
-- Table structure for table `tipotelefono`
--

CREATE TABLE `tipotelefono` (
  `idtipoTelefono` int(11) NOT NULL,
  `tipoTel` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tipotelefono`
--

INSERT INTO `tipotelefono` (`idtipoTelefono`, `tipoTel`) VALUES
(1, 'Móvil'),
(2, 'Casa'),
(3, 'Trabajo'),
(4, 'Fax'),
(5, 'Otro');

-- --------------------------------------------------------

--
-- Table structure for table `tracciones`
--

CREATE TABLE `tracciones` (
  `idTraccion` int(11) NOT NULL,
  `descripTraccion` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tracciones`
--

INSERT INTO `tracciones` (`idTraccion`, `descripTraccion`) VALUES
(1, 'RWD'),
(2, 'FWD'),
(3, 'AWD'),
(4, '4X4');

-- --------------------------------------------------------

--
-- Table structure for table `transmision`
--

CREATE TABLE `transmision` (
  `idtransmision` int(1) NOT NULL,
  `descripTrans` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transmision`
--

INSERT INTO `transmision` (`idtransmision`, `descripTrans`) VALUES
(1, 'Automatica'),
(2, 'Mecanica');

-- --------------------------------------------------------

--
-- Table structure for table `usuairos`
--

CREATE TABLE `usuairos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `contraseña` varchar(80) DEFAULT NULL,
  `id_curso` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(1) DEFAULT 1,
  `pais` int(11) DEFAULT NULL,
  `vision` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `NombreUser` varchar(45) NOT NULL,
  `PasswUser` varchar(45) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `permiso` int(11) NOT NULL,
  `isInterno` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `NombreUser`, `PasswUser`, `idPersona`, `permiso`, `isInterno`) VALUES
(1, 'admin', 'admin', 1, 1, 1),
(2, 'user', 'user', 2, 2, 0),
(3, 'pedro_ramirez', 'password3', 3, 2, 1),
(4, 'ana_santos', 'password4', 4, 2, 1),
(5, 'carlos_gonzalez', 'password5', 5, 2, 1),
(6, 'sofia_hernandez', 'password6', 6, 2, 1),
(7, 'luis_lopez', 'password7', 7, 2, 1),
(8, 'laura_torres', 'password8', 8, 2, 1),
(9, 'jose_mendoza', 'password9', 9, 2, 1),
(10, 'isabel_fernandez', 'password10', 10, 2, 1),
(11, 'raul_jimenez', 'password11', 11, 2, 1),
(12, 'marta_castillo', 'password12', 12, 2, 1),
(13, 'jorge_cruz', 'password13', 13, 2, 1),
(14, 'rosa_mendez', 'password14', 14, 2, 1),
(15, 'francisco_garcia', 'password15', 15, 2, 1),
(16, 'elena_reyes', 'password16', 16, 2, 1),
(17, 'daniel_rojas', 'password17', 17, 2, 1),
(18, 'gabriela_acosta', 'password18', 18, 2, 1),
(19, 'mario_sanchez', 'password19', 19, 2, 1),
(20, 'carmen_mora', 'password20', 20, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vehiculos_marcas`
--

CREATE TABLE `vehiculos_marcas` (
  `idVehiculos_Marca` int(11) NOT NULL,
  `marca_nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `vehiculos_marcas`
--

INSERT INTO `vehiculos_marcas` (`idVehiculos_Marca`, `marca_nombre`) VALUES
(4, 'Chevrolet'),
(8, 'Ferrari'),
(3, 'Ford'),
(2, 'Honda'),
(9, 'Hyundai'),
(5, 'Nissan'),
(1, 'Toyota');

-- --------------------------------------------------------

--
-- Table structure for table `vehiculos_modelos`
--

CREATE TABLE `vehiculos_modelos` (
  `idVehiculos_Modelos` int(11) NOT NULL,
  `Modelo_nombre` varchar(45) NOT NULL,
  `marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `vehiculos_modelos`
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
(25, 'SF90', 8),
(26, 'Elantra', 9);

-- --------------------------------------------------------

--
-- Table structure for table `vehiculos_vendidos`
--

CREATE TABLE `vehiculos_vendidos` (
  `idVehiculos_Vendidos` int(11) NOT NULL,
  `idVehiculoVenta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `PrecioAcordado` float NOT NULL,
  `fechaVenta` date NOT NULL,
  `MontoPagoMensual` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `vehiculos_vendidos`
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
-- Table structure for table `vehiculos_venta`
--

CREATE TABLE `vehiculos_venta` (
  `idVehiculos_Venta` int(11) NOT NULL,
  `vehiculo_matricula` varchar(10) NOT NULL,
  `precio` float NOT NULL,
  `millage` float NOT NULL,
  `fecha_adquisicion` date NOT NULL DEFAULT current_timestamp(),
  `year` varchar(45) NOT NULL,
  `vehiculo_modelo` int(11) DEFAULT NULL,
  `vehiculo_Categoria` int(11) NOT NULL,
  `nuevo` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(100) NOT NULL,
  `puertas` varchar(20) NOT NULL,
  `motor` varchar(20) NOT NULL,
  `transmision` int(1) NOT NULL,
  `traccion` int(1) NOT NULL,
  `pasajeros` varchar(20) NOT NULL,
  `color` varchar(20) NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  `tipocombustible` int(2) NOT NULL,
  `tipoconsumo` int(1) NOT NULL,
  `tamano_baul` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `vehiculos_venta`
--

INSERT INTO `vehiculos_venta` (`idVehiculos_Venta`, `vehiculo_matricula`, `precio`, `millage`, `fecha_adquisicion`, `year`, `vehiculo_modelo`, `vehiculo_Categoria`, `nuevo`, `image`, `puertas`, `motor`, `transmision`, `traccion`, `pasajeros`, `color`, `disponible`, `tipocombustible`, `tipoconsumo`, `tamano_baul`) VALUES
(1, 'ABC123', 25000, 20000, '2023-01-01', '2022', 1, 1, 1, 'corolla.jpg', '', '', 1, 2, '', '', 0, 1, 4, 2),
(2, 'DEF456', 28000, 15000, '2023-01-02', '2022', 2, 1, 1, 'civic.jpg', '', '', 1, 2, '', '', 0, 1, 4, 2),
(3, 'GHI789', 32000, 10000, '2023-01-03', '2022', 3, 2, 1, 'f150.jpg', '', '', 1, 2, '', '', 0, 1, 4, 2),
(4, 'JKL012', 35000, 12000, '2023-01-04', '2022', 4, 2, 1, 'silverado.jpg', '', '', 1, 2, '', '', 0, 1, 4, 2),
(5, 'MNO345', 26000, 18000, '2023-01-05', '2022', 5, 3, 1, 'altima.jpg', '', '', 1, 2, '', '', 0, 1, 4, 2),
(6, 'PQR678', 34000, 8000, '2023-01-06', '2022', 6, 1, 1, '3series.jpg', '', '', 1, 2, '', '', 0, 1, 4, 2),
(7, 'STU901', 39000, 7000, '2023-01-07', '2022', 7, 1, 1, 'cclass.jpg', '', '', 1, 2, '', '', 0, 1, 4, 2),
(8, 'VWX234', 42000, 5000, '2023-01-08', '2022', 8, 2, 1, 'a4.jpg', '', '', 1, 2, '', '', 0, 1, 4, 2),
(9, 'YZA567', 28000, 12000, '2023-01-09', '2022', 26, 1, 1, 'elantra.jpg', '5', '1.4 L', 1, 2, '5', 'Gris', 1, 1, 4, 2),
(10, 'BCD890', 31000, 9000, '2023-01-10', '2022', 10, 3, 1, 'sorento.jpg', '', '', 1, 2, '', '', 0, 1, 4, 2),
(11, 'EFG123', 28000, 17000, '2023-01-11', '2022', 11, 3, 1, 'golf.jpg', '', '', 1, 2, '', '', 1, 1, 4, 2),
(12, 'HIJ456', 33000, 15000, '2023-01-12', '2022', 12, 1, 1, 'cx5.jpg', '', '', 1, 2, '', '', 1, 1, 4, 2),
(13, 'KLM789', 38000, 12000, '2023-01-13', '2022', 13, 1, 1, 'outback.jpg', '', '', 1, 2, '', '', 1, 1, 4, 2),
(14, 'NOP012', 39000, 18000, '2023-01-14', '2022', 14, 2, 1, 'wrangler.jpg', '', '', 1, 2, '', '', 1, 1, 4, 2),
(15, 'QRS345', 45000, 8000, '2023-01-15', '2022', 15, 2, 1, 'rx.jpg', '', '', 1, 2, '', '', 1, 1, 4, 2),
(16, 'TUV678', 32000, 20000, '2023-01-16', '2022', 16, 3, 1, 'xc60.jpg', '', '', 1, 2, '', '', 1, 1, 4, 2),
(17, 'WXY901', 49000, 7000, '2023-01-17', '2022', 17, 3, 1, '488gtb.jpg', '', '', 1, 2, '', '', 1, 1, 4, 2),
(18, 'ZAB234', 52000, 6000, '2023-01-18', '2022', 18, 1, 1, '911.jpg', '', '', 1, 2, '', '', 1, 1, 4, 2),
(19, 'CDE567', 80000, 3000, '2023-01-19', '2022', 19, 1, 1, 'models.jpg', '', '', 1, 2, '', '', 1, 1, 4, 2),
(20, 'FGH890', 85000, 5000, '2023-01-20', '2022', 20, 2, 1, 'rangerover.jpg', '', '', 1, 2, '', '', 1, 1, 4, 2),
(23, 'ASDQ', 56222000, 0, '0000-00-00', '2035', 24, 9, 1, '', '2', 'V12', 1, 2, '2', '2', 0, 1, 4, 2),
(47, 'A21071', 700000, 127600, '2024-04-24', '2013', 1, 1, 1, '', '5', '1.4 L', 1, 2, '5', 'AZUL', 1, 1, 5, 3),
(56, 'A21071', 700000, 0, '2024-04-25', '2013', 1, 1, 0, '', '5', '1.4 L', 1, 1, '5', 'AZUL', 1, 1, 5, 3),
(57, 'A21072', 700000, 0, '2024-04-25', '2013', 1, 1, 0, 'corolla.jpeg', '5', '1.4 L', 1, 1, '5', 'AZUL', 1, 1, 5, 3),
(58, 'A21075', 350000, 0, '2024-04-25', '2015', 24, 1, 0, '', '5', '1.4 L', 1, 2, '5', 'AZUL', 1, 1, 4, 3),
(59, 'A21075', 350000, 0, '2024-04-25', '2015', 5, 1, 0, 'carro_1.png', '5', '1.4 L', 1, 2, '5', 'AZUL', 1, 1, 4, 3),
(60, 'A21075', 350000, 0, '2024-04-25', '2015', 7, 1, 0, 'Carro_', '5', '1.4 L', 1, 2, '5', 'AZUL', 1, 1, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `vehiculo_caracteristicas`
--

CREATE TABLE `vehiculo_caracteristicas` (
  `idVehiculo_Caracteristicas` int(11) NOT NULL,
  `Vehiculo_Caracteristica` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `vehiculo_caracteristicas`
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
-- Table structure for table `vehiculo_categoria`
--

CREATE TABLE `vehiculo_categoria` (
  `idVehiculo_Categoria` int(11) NOT NULL,
  `nombre_Categoria` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `vehiculo_categoria`
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
(10, 'Compacto'),
(11, 'Motocicletas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `caracteristicasvsvehiculoventa`
--
ALTER TABLE `caracteristicasvsvehiculoventa`
  ADD KEY `vehiculo_idx` (`IdVehiculoVenta`),
  ADD KEY `caracteristica_idx` (`IdCaracteristica`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `persona_idx` (`idPersona`);

--
-- Indexes for table `combustible`
--
ALTER TABLE `combustible`
  ADD PRIMARY KEY (`idcombustible`);

--
-- Indexes for table `consumocombustibles`
--
ALTER TABLE `consumocombustibles`
  ADD PRIMARY KEY (`idconsumo`);

--
-- Indexes for table `correos`
--
ALTER TABLE `correos`
  ADD PRIMARY KEY (`idcorreos`);

--
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`idDepartamento`);

--
-- Indexes for table `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`idDireccion`),
  ADD KEY `provinca_idx` (`idProvincia`),
  ADD KEY `sector_idx` (`idSector`),
  ADD KEY `tipodir_idx` (`tipoDireccion`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idempleado`),
  ADD KEY `persona_idx` (`idPersona`),
  ADD KEY `tipoEmpl_idx` (`tipoEmpleado`),
  ADD KEY `departamento_idx` (`Departamento`);

--
-- Indexes for table `estadospagos`
--
ALTER TABLE `estadospagos`
  ADD PRIMARY KEY (`idEstadosPagos`);

--
-- Indexes for table `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`idFavorito`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idVehiculo` (`idVehiculo`);

--
-- Indexes for table `pagoscli`
--
ALTER TABLE `pagoscli`
  ADD PRIMARY KEY (`idPagosCli`),
  ADD KEY `cliente_idx` (`idCliente`),
  ADD KEY `vehiculoVendido_idx` (`idVehiculoVendido`),
  ADD KEY `estadosPago_idx` (`EstadoPago`);

--
-- Indexes for table `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idPersona`),
  ADD KEY `tipoPersoa_idx` (`TipoPersona`),
  ADD KEY `correo_idx` (`idcorreo`),
  ADD KEY `telefono_idx` (`idtelefono`),
  ADD KEY `direccion_idx` (`idDireccion`);

--
-- Indexes for table `polizasseguros`
--
ALTER TABLE `polizasseguros`
  ADD PRIMARY KEY (`idPolizasSeguros`),
  ADD KEY `vehiculo_idx` (`vehiculo`),
  ADD KEY `aseguradora_idx` (`aseguradora`);

--
-- Indexes for table `preferenciasclientes`
--
ALTER TABLE `preferenciasclientes`
  ADD PRIMARY KEY (`idPreferenciasClientes`),
  ADD KEY `IdCliPrefClie_idx` (`IdCliente`),
  ADD KEY `PrefCliVehi_idx` (`CaractVehiculoP`);

--
-- Indexes for table `prestvehiculo`
--
ALTER TABLE `prestvehiculo`
  ADD PRIMARY KEY (`idPrestVehiculo`),
  ADD KEY `vehiculo_idx` (`vehiculo`);

--
-- Indexes for table `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`idprovincia`);

--
-- Indexes for table `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asd_idx` (`id_sub_categoria`),
  ADD KEY `registro_usuario_idx` (`id_usuario`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`idSector`);

--
-- Indexes for table `seguros`
--
ALTER TABLE `seguros`
  ADD PRIMARY KEY (`idSeguros`);

--
-- Indexes for table `sub_categorias`
--
ALTER TABLE `sub_categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_catecogia_categoria_idx` (`id_categoria`);

--
-- Indexes for table `tamanobaul`
--
ALTER TABLE `tamanobaul`
  ADD PRIMARY KEY (`idTamanoBaul`);

--
-- Indexes for table `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`idtelefono`),
  ADD KEY `tipoTel_idx` (`tipoTel`);

--
-- Indexes for table `tipodireccion`
--
ALTER TABLE `tipodireccion`
  ADD PRIMARY KEY (`idtipoDireccion`);

--
-- Indexes for table `tipoempleado`
--
ALTER TABLE `tipoempleado`
  ADD PRIMARY KEY (`idtipoEmpleado`);

--
-- Indexes for table `tipopersona`
--
ALTER TABLE `tipopersona`
  ADD PRIMARY KEY (`idTipoPersona`);

--
-- Indexes for table `tipotelefono`
--
ALTER TABLE `tipotelefono`
  ADD PRIMARY KEY (`idtipoTelefono`);

--
-- Indexes for table `tracciones`
--
ALTER TABLE `tracciones`
  ADD PRIMARY KEY (`idTraccion`);

--
-- Indexes for table `transmision`
--
ALTER TABLE `transmision`
  ADD PRIMARY KEY (`idtransmision`);

--
-- Indexes for table `usuairos`
--
ALTER TABLE `usuairos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_curso_idx` (`id_curso`),
  ADD KEY `usuario_rol_idx` (`id_rol`),
  ADD KEY `usuario_pais_idx` (`pais`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `persona_idx` (`idPersona`);

--
-- Indexes for table `vehiculos_marcas`
--
ALTER TABLE `vehiculos_marcas`
  ADD PRIMARY KEY (`idVehiculos_Marca`),
  ADD UNIQUE KEY `marca_nombre_UNIQUE` (`marca_nombre`);

--
-- Indexes for table `vehiculos_modelos`
--
ALTER TABLE `vehiculos_modelos`
  ADD PRIMARY KEY (`idVehiculos_Modelos`),
  ADD UNIQUE KEY `idVehiculos_Modelos_UNIQUE` (`idVehiculos_Modelos`),
  ADD UNIQUE KEY `Modelo_nombre_UNIQUE` (`Modelo_nombre`),
  ADD KEY `marca` (`marca`);

--
-- Indexes for table `vehiculos_vendidos`
--
ALTER TABLE `vehiculos_vendidos`
  ADD PRIMARY KEY (`idVehiculos_Vendidos`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idVehiculoVenta` (`idVehiculoVenta`);

--
-- Indexes for table `vehiculos_venta`
--
ALTER TABLE `vehiculos_venta`
  ADD PRIMARY KEY (`idVehiculos_Venta`),
  ADD KEY `categoria_idx` (`vehiculo_Categoria`),
  ADD KEY `vehiculo_modelo_UNIQUE` (`vehiculo_modelo`) USING BTREE,
  ADD KEY `combustible` (`tipocombustible`),
  ADD KEY `capacidadBaul` (`tamano_baul`),
  ADD KEY `transmision` (`transmision`),
  ADD KEY `tipoconsumo` (`tipoconsumo`),
  ADD KEY `traccion` (`traccion`);

--
-- Indexes for table `vehiculo_caracteristicas`
--
ALTER TABLE `vehiculo_caracteristicas`
  ADD PRIMARY KEY (`idVehiculo_Caracteristicas`);

--
-- Indexes for table `vehiculo_categoria`
--
ALTER TABLE `vehiculo_categoria`
  ADD PRIMARY KEY (`idVehiculo_Categoria`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `combustible`
--
ALTER TABLE `combustible`
  MODIFY `idcombustible` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `consumocombustibles`
--
ALTER TABLE `consumocombustibles`
  MODIFY `idconsumo` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `correos`
--
ALTER TABLE `correos`
  MODIFY `idcorreos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departamento`
--
ALTER TABLE `departamento`
  MODIFY `idDepartamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `direccion`
--
ALTER TABLE `direccion`
  MODIFY `idDireccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idempleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `idFavorito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pagoscli`
--
ALTER TABLE `pagoscli`
  MODIFY `idPagosCli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `paises`
--
ALTER TABLE `paises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `persona`
--
ALTER TABLE `persona`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `polizasseguros`
--
ALTER TABLE `polizasseguros`
  MODIFY `idPolizasSeguros` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `preferenciasclientes`
--
ALTER TABLE `preferenciasclientes`
  MODIFY `idPreferenciasClientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `prestvehiculo`
--
ALTER TABLE `prestvehiculo`
  MODIFY `idPrestVehiculo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provincia`
--
ALTER TABLE `provincia`
  MODIFY `idprovincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `registro`
--
ALTER TABLE `registro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sector`
--
ALTER TABLE `sector`
  MODIFY `idSector` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `seguros`
--
ALTER TABLE `seguros`
  MODIFY `idSeguros` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categorias`
--
ALTER TABLE `sub_categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tamanobaul`
--
ALTER TABLE `tamanobaul`
  MODIFY `idTamanoBaul` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `telefono`
--
ALTER TABLE `telefono`
  MODIFY `idtelefono` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tipodireccion`
--
ALTER TABLE `tipodireccion`
  MODIFY `idtipoDireccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tipoempleado`
--
ALTER TABLE `tipoempleado`
  MODIFY `idtipoEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tipopersona`
--
ALTER TABLE `tipopersona`
  MODIFY `idTipoPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tipotelefono`
--
ALTER TABLE `tipotelefono`
  MODIFY `idtipoTelefono` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tracciones`
--
ALTER TABLE `tracciones`
  MODIFY `idTraccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usuairos`
--
ALTER TABLE `usuairos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `vehiculos_marcas`
--
ALTER TABLE `vehiculos_marcas`
  MODIFY `idVehiculos_Marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vehiculos_modelos`
--
ALTER TABLE `vehiculos_modelos`
  MODIFY `idVehiculos_Modelos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `vehiculos_vendidos`
--
ALTER TABLE `vehiculos_vendidos`
  MODIFY `idVehiculos_Vendidos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `vehiculos_venta`
--
ALTER TABLE `vehiculos_venta`
  MODIFY `idVehiculos_Venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `vehiculo_caracteristicas`
--
ALTER TABLE `vehiculo_caracteristicas`
  MODIFY `idVehiculo_Caracteristicas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `vehiculo_categoria`
--
ALTER TABLE `vehiculo_categoria`
  MODIFY `idVehiculo_Categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `caracteristicasvsvehiculoventa`
--
ALTER TABLE `caracteristicasvsvehiculoventa`
  ADD CONSTRAINT `caracteristica` FOREIGN KEY (`IdCaracteristica`) REFERENCES `vehiculo_caracteristicas` (`idVehiculo_Caracteristicas`),
  ADD CONSTRAINT `vehiculo` FOREIGN KEY (`IdVehiculoVenta`) REFERENCES `vehiculos_venta` (`idVehiculos_Venta`);

--
-- Constraints for table `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `personaCliente` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`);

--
-- Constraints for table `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `provincia` FOREIGN KEY (`idProvincia`) REFERENCES `provincia` (`idprovincia`),
  ADD CONSTRAINT `sector` FOREIGN KEY (`idSector`) REFERENCES `sector` (`idSector`),
  ADD CONSTRAINT `tipodir` FOREIGN KEY (`tipoDireccion`) REFERENCES `tipodireccion` (`idtipoDireccion`);

--
-- Constraints for table `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_Departamento` FOREIGN KEY (`Departamento`) REFERENCES `departamento` (`idDepartamento`),
  ADD CONSTRAINT `personaEmpleado` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`),
  ADD CONSTRAINT `tipoEmpl` FOREIGN KEY (`tipoEmpleado`) REFERENCES `tipoempleado` (`idtipoEmpleado`);

--
-- Constraints for table `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculos_venta` (`idVehiculos_Venta`);

--
-- Constraints for table `pagoscli`
--
ALTER TABLE `pagoscli`
  ADD CONSTRAINT `estadosPago` FOREIGN KEY (`EstadoPago`) REFERENCES `estadospagos` (`idEstadosPagos`),
  ADD CONSTRAINT `pagoscliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `vehiculoVendido` FOREIGN KEY (`idVehiculoVendido`) REFERENCES `vehiculos_vendidos` (`idVehiculos_Vendidos`);

--
-- Constraints for table `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `correo` FOREIGN KEY (`idcorreo`) REFERENCES `correos` (`idcorreos`),
  ADD CONSTRAINT `direccion` FOREIGN KEY (`idDireccion`) REFERENCES `direccion` (`idDireccion`),
  ADD CONSTRAINT `telefono` FOREIGN KEY (`idtelefono`) REFERENCES `telefono` (`idtelefono`),
  ADD CONSTRAINT `tipoPersoa` FOREIGN KEY (`TipoPersona`) REFERENCES `tipopersona` (`idTipoPersona`);

--
-- Constraints for table `polizasseguros`
--
ALTER TABLE `polizasseguros`
  ADD CONSTRAINT `aseguradora` FOREIGN KEY (`aseguradora`) REFERENCES `seguros` (`idSeguros`),
  ADD CONSTRAINT `polizavehiculo` FOREIGN KEY (`vehiculo`) REFERENCES `vehiculos_vendidos` (`idVehiculos_Vendidos`);

--
-- Constraints for table `preferenciasclientes`
--
ALTER TABLE `preferenciasclientes`
  ADD CONSTRAINT `IdCliPrefClie` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `PrefCliVehi` FOREIGN KEY (`CaractVehiculoP`) REFERENCES `vehiculo_caracteristicas` (`idVehiculo_Caracteristicas`);

--
-- Constraints for table `prestvehiculo`
--
ALTER TABLE `prestvehiculo`
  ADD CONSTRAINT `prestvehiculo` FOREIGN KEY (`vehiculo`) REFERENCES `vehiculos_vendidos` (`idVehiculos_Vendidos`);

--
-- Constraints for table `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_sub_categoria` FOREIGN KEY (`id_sub_categoria`) REFERENCES `sub_categorias` (`id`),
  ADD CONSTRAINT `registro_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuairos` (`id`);

--
-- Constraints for table `sub_categorias`
--
ALTER TABLE `sub_categorias`
  ADD CONSTRAINT `sub_catecogia_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);

--
-- Constraints for table `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `tipoTel` FOREIGN KEY (`tipoTel`) REFERENCES `tipotelefono` (`idtipoTelefono`);

--
-- Constraints for table `usuairos`
--
ALTER TABLE `usuairos`
  ADD CONSTRAINT `usuario_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `usuario_pais` FOREIGN KEY (`pais`) REFERENCES `paises` (`id`),
  ADD CONSTRAINT `usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `personaUser` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`);

--
-- Constraints for table `vehiculos_modelos`
--
ALTER TABLE `vehiculos_modelos`
  ADD CONSTRAINT `marca` FOREIGN KEY (`marca`) REFERENCES `vehiculos_marcas` (`idVehiculos_Marca`);

--
-- Constraints for table `vehiculos_vendidos`
--
ALTER TABLE `vehiculos_vendidos`
  ADD CONSTRAINT `vehiculos_vendidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `vehiculos_vendidos_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `vehiculos_vendidos_ibfk_3` FOREIGN KEY (`idVehiculoVenta`) REFERENCES `vehiculos_venta` (`idVehiculos_Venta`);

--
-- Constraints for table `vehiculos_venta`
--
ALTER TABLE `vehiculos_venta`
  ADD CONSTRAINT `capacidadBaul` FOREIGN KEY (`tamano_baul`) REFERENCES `tamanobaul` (`idTamanoBaul`),
  ADD CONSTRAINT `categoria` FOREIGN KEY (`vehiculo_Categoria`) REFERENCES `vehiculo_categoria` (`idVehiculo_Categoria`),
  ADD CONSTRAINT `combustible` FOREIGN KEY (`tipocombustible`) REFERENCES `combustible` (`idcombustible`),
  ADD CONSTRAINT `tipoconsumo` FOREIGN KEY (`tipoconsumo`) REFERENCES `consumocombustibles` (`idconsumo`),
  ADD CONSTRAINT `traccion` FOREIGN KEY (`traccion`) REFERENCES `tracciones` (`idTraccion`),
  ADD CONSTRAINT `transmision` FOREIGN KEY (`transmision`) REFERENCES `transmision` (`idtransmision`),
  ADD CONSTRAINT `vehiculos_venta_FK` FOREIGN KEY (`vehiculo_modelo`) REFERENCES `vehiculos_modelos` (`idVehiculos_Modelos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
