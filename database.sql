-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.30-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-04-25 18:39:43
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for siuv
DROP DATABASE IF EXISTS `siuv`;
CREATE DATABASE IF NOT EXISTS `siuv` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `siuv`;


-- Dumping structure for table siuv.abonos
DROP TABLE IF EXISTS `abonos`;
CREATE TABLE IF NOT EXISTS `abonos` (
  `ID_Abonos` int(11) NOT NULL,
  `Fecha_inicio` date DEFAULT NULL,
  `Fecha_termino` date DEFAULT NULL,
  `Fecha_vencimiento` date DEFAULT NULL,
  `Saldo_inicial` float DEFAULT NULL,
  `Saldo_final` float DEFAULT NULL,
  PRIMARY KEY (`ID_Abonos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.abonos: ~0 rows (approximately)
DELETE FROM `abonos`;
/*!40000 ALTER TABLE `abonos` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonos` ENABLE KEYS */;


-- Dumping structure for table siuv.acreedores
DROP TABLE IF EXISTS `acreedores`;
CREATE TABLE IF NOT EXISTS `acreedores` (
  `ID_Acreedores` int(11) NOT NULL,
  `Nom_acreedor` varchar(20) DEFAULT NULL,
  `Contacto_acreedor` varchar(30) DEFAULT NULL,
  `Domicilio` varchar(20) DEFAULT NULL,
  `Entidad_federativa` varchar(30) DEFAULT NULL,
  `Localidad` varchar(30) DEFAULT NULL,
  `Codigo_postal` int(11) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Banco` varchar(20) DEFAULT NULL,
  `Num_cuenta` varchar(20) DEFAULT NULL,
  `Clave_deposito` varchar(20) DEFAULT NULL,
  `Pagos_acumulados` float DEFAULT NULL,
  `Plazo_pagos` int(11) DEFAULT NULL,
  `Fecha_pago` date DEFAULT NULL,
  PRIMARY KEY (`ID_Acreedores`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.acreedores: ~0 rows (approximately)
DELETE FROM `acreedores`;
/*!40000 ALTER TABLE `acreedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `acreedores` ENABLE KEYS */;


-- Dumping structure for table siuv.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `ID_Categoria` int(11) NOT NULL,
  `Subcategoria` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.categoria: ~0 rows (approximately)
DELETE FROM `categoria`;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;


-- Dumping structure for table siuv.clientes
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `ID_RFC` varchar(20) NOT NULL,
  `Actividad_empresarial` varchar(30) DEFAULT NULL,
  `Razon_social` varchar(30) DEFAULT NULL,
  `Domicilio` varchar(70) DEFAULT NULL,
  `Colonia` varchar(30) DEFAULT NULL,
  `Municipio` varchar(25) DEFAULT NULL,
  `Codigo_postal` int(11) DEFAULT NULL,
  `Estado` varchar(30) DEFAULT NULL,
  `Email` varchar(25) DEFAULT NULL,
  `ID_NFacturas` int(11) DEFAULT NULL,
  `ID_Consulta` int(11) DEFAULT NULL,
  `ID_Historial` int(11) DEFAULT NULL,
  `ID_Credito` int(11) DEFAULT NULL,
  `ID_Telefonos` int(13) DEFAULT NULL,
  PRIMARY KEY (`ID_RFC`),
  KEY `ID_NFacturas` (`ID_NFacturas`),
  KEY `ID_Consulta` (`ID_Consulta`),
  KEY `ID_Historial` (`ID_Historial`),
  KEY `ID_Credito` (`ID_Credito`),
  KEY `ID_Telefonos` (`ID_Telefonos`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`ID_NFacturas`) REFERENCES `ventas` (`ID_NFacturas`),
  CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`ID_Consulta`) REFERENCES `saldo` (`ID_Consulta`),
  CONSTRAINT `clientes_ibfk_3` FOREIGN KEY (`ID_Historial`) REFERENCES `historial` (`ID_Historial`),
  CONSTRAINT `clientes_ibfk_4` FOREIGN KEY (`ID_Credito`) REFERENCES `credito` (`ID_Credito`),
  CONSTRAINT `clientes_ibfk_5` FOREIGN KEY (`ID_Telefonos`) REFERENCES `telefonos` (`ID_Telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.clientes: ~0 rows (approximately)
DELETE FROM `clientes`;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;


-- Dumping structure for table siuv.cobros
DROP TABLE IF EXISTS `cobros`;
CREATE TABLE IF NOT EXISTS `cobros` (
  `ID_Cobros` int(11) NOT NULL,
  `Descuentos` float DEFAULT NULL,
  `Intereses` float DEFAULT NULL,
  PRIMARY KEY (`ID_Cobros`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.cobros: ~0 rows (approximately)
DELETE FROM `cobros`;
/*!40000 ALTER TABLE `cobros` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobros` ENABLE KEYS */;


-- Dumping structure for table siuv.credito
DROP TABLE IF EXISTS `credito`;
CREATE TABLE IF NOT EXISTS `credito` (
  `ID_Credito` int(11) NOT NULL,
  `Tipo` varchar(30) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Cantidad` float DEFAULT NULL,
  PRIMARY KEY (`ID_Credito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.credito: ~0 rows (approximately)
DELETE FROM `credito`;
/*!40000 ALTER TABLE `credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `credito` ENABLE KEYS */;


-- Dumping structure for table siuv.cuentas_por_cobrar
DROP TABLE IF EXISTS `cuentas_por_cobrar`;
CREATE TABLE IF NOT EXISTS `cuentas_por_cobrar` (
  `ID_CC` int(11) NOT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `ID_RFC` varchar(20) DEFAULT NULL,
  `ID_NFacturas` int(11) DEFAULT NULL,
  `ID_Abonos` int(11) DEFAULT NULL,
  `ID_DPC` int(11) DEFAULT NULL,
  `ID_Credito` int(11) DEFAULT NULL,
  `ID_Cobros` int(11) DEFAULT NULL,
  `ID_Periodo_pagos` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_CC`),
  KEY `ID_RFC` (`ID_RFC`),
  KEY `ID_NFacturas` (`ID_NFacturas`),
  KEY `ID_Abonos` (`ID_Abonos`),
  KEY `ID_DPC` (`ID_DPC`),
  KEY `ID_Credito` (`ID_Credito`),
  KEY `ID_Cobros` (`ID_Cobros`),
  KEY `ID_Periodo_pagos` (`ID_Periodo_pagos`),
  CONSTRAINT `cuentas_por_cobrar_ibfk_1` FOREIGN KEY (`ID_RFC`) REFERENCES `clientes` (`ID_RFC`),
  CONSTRAINT `cuentas_por_cobrar_ibfk_2` FOREIGN KEY (`ID_NFacturas`) REFERENCES `ventas` (`ID_NFacturas`),
  CONSTRAINT `cuentas_por_cobrar_ibfk_3` FOREIGN KEY (`ID_Abonos`) REFERENCES `abonos` (`ID_Abonos`),
  CONSTRAINT `cuentas_por_cobrar_ibfk_4` FOREIGN KEY (`ID_DPC`) REFERENCES `doc_cobrar` (`ID_DPC`),
  CONSTRAINT `cuentas_por_cobrar_ibfk_5` FOREIGN KEY (`ID_Credito`) REFERENCES `credito` (`ID_Credito`),
  CONSTRAINT `cuentas_por_cobrar_ibfk_6` FOREIGN KEY (`ID_Cobros`) REFERENCES `cobros` (`ID_Cobros`),
  CONSTRAINT `cuentas_por_cobrar_ibfk_7` FOREIGN KEY (`ID_Periodo_pagos`) REFERENCES `periodos_pagos` (`ID_Periodo_Pagos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.cuentas_por_cobrar: ~0 rows (approximately)
DELETE FROM `cuentas_por_cobrar`;
/*!40000 ALTER TABLE `cuentas_por_cobrar` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentas_por_cobrar` ENABLE KEYS */;


-- Dumping structure for table siuv.cuentas_por_pagar
DROP TABLE IF EXISTS `cuentas_por_pagar`;
CREATE TABLE IF NOT EXISTS `cuentas_por_pagar` (
  `ID_CP` int(11) NOT NULL,
  `ID_Proveedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_CP`),
  KEY `ID_Proveedor` (`ID_Proveedor`),
  CONSTRAINT `cuentas_por_pagar_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedores` (`ID_Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.cuentas_por_pagar: ~0 rows (approximately)
DELETE FROM `cuentas_por_pagar`;
/*!40000 ALTER TABLE `cuentas_por_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentas_por_pagar` ENABLE KEYS */;


-- Dumping structure for table siuv.doc_cobrar
DROP TABLE IF EXISTS `doc_cobrar`;
CREATE TABLE IF NOT EXISTS `doc_cobrar` (
  `ID_DPC` int(11) NOT NULL,
  `Folio` int(11) DEFAULT NULL,
  `Fecha_documento` date DEFAULT NULL,
  `ID_Empleado` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_DPC`),
  KEY `ID_Empleado` (`ID_Empleado`),
  CONSTRAINT `doc_cobrar_ibfk_1` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.doc_cobrar: ~0 rows (approximately)
DELETE FROM `doc_cobrar`;
/*!40000 ALTER TABLE `doc_cobrar` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_cobrar` ENABLE KEYS */;


-- Dumping structure for table siuv.empleado
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `ID_Empleado` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(40) DEFAULT NULL,
  `Direccion` varchar(60) DEFAULT NULL,
  `Telefono` int(13) DEFAULT NULL,
  PRIMARY KEY (`ID_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.empleado: ~0 rows (approximately)
DELETE FROM `empleado`;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;


-- Dumping structure for table siuv.excedentes
DROP TABLE IF EXISTS `excedentes`;
CREATE TABLE IF NOT EXISTS `excedentes` (
  `ID_Excedentes` int(11) NOT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `ID_Categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Excedentes`),
  KEY `ID_Producto` (`ID_Producto`),
  KEY `ID_Categoria` (`ID_Categoria`),
  CONSTRAINT `excedentes_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`),
  CONSTRAINT `excedentes_ibfk_2` FOREIGN KEY (`ID_Categoria`) REFERENCES `categoria` (`ID_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.excedentes: ~0 rows (approximately)
DELETE FROM `excedentes`;
/*!40000 ALTER TABLE `excedentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `excedentes` ENABLE KEYS */;


-- Dumping structure for table siuv.facturas_recibidas
DROP TABLE IF EXISTS `facturas_recibidas`;
CREATE TABLE IF NOT EXISTS `facturas_recibidas` (
  `ID_Facturas_rec` int(11) NOT NULL,
  `Monto_factura` float DEFAULT NULL,
  `Estado_factura` varchar(30) DEFAULT NULL,
  `ID_Proveedor` int(11) DEFAULT NULL,
  `ID_Compras` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Facturas_rec`),
  KEY `ID_Proveedor` (`ID_Proveedor`),
  KEY `ID_Compras` (`ID_Compras`),
  CONSTRAINT `facturas_recibidas_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedores` (`ID_Proveedor`),
  CONSTRAINT `facturas_recibidas_ibfk_2` FOREIGN KEY (`ID_Compras`) REFERENCES `orden_compras` (`ID_Compras`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.facturas_recibidas: ~0 rows (approximately)
DELETE FROM `facturas_recibidas`;
/*!40000 ALTER TABLE `facturas_recibidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas_recibidas` ENABLE KEYS */;


-- Dumping structure for table siuv.faltantes
DROP TABLE IF EXISTS `faltantes`;
CREATE TABLE IF NOT EXISTS `faltantes` (
  `ID_Faltantes` int(11) NOT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `ID_Categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Faltantes`),
  KEY `ID_Producto` (`ID_Producto`),
  KEY `ID_Categoria` (`ID_Categoria`),
  CONSTRAINT `faltantes_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`),
  CONSTRAINT `faltantes_ibfk_2` FOREIGN KEY (`ID_Categoria`) REFERENCES `categoria` (`ID_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.faltantes: ~0 rows (approximately)
DELETE FROM `faltantes`;
/*!40000 ALTER TABLE `faltantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `faltantes` ENABLE KEYS */;


-- Dumping structure for table siuv.historial
DROP TABLE IF EXISTS `historial`;
CREATE TABLE IF NOT EXISTS `historial` (
  `ID_Historial` int(11) NOT NULL,
  `Fecha` int(11) DEFAULT NULL,
  `Transaccion` char(18) DEFAULT NULL,
  `Cargo` varchar(30) DEFAULT NULL,
  `Estado` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID_Historial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.historial: ~0 rows (approximately)
DELETE FROM `historial`;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;


-- Dumping structure for table siuv.orden_compras
DROP TABLE IF EXISTS `orden_compras`;
CREATE TABLE IF NOT EXISTS `orden_compras` (
  `ID_Compras` int(11) NOT NULL,
  `Cantidad` float DEFAULT NULL,
  `Fecha_compra` date DEFAULT NULL,
  `Monto_total` float DEFAULT NULL,
  `Tiempo_credito` date DEFAULT NULL,
  `ID_Proveedor` int(11) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Compras`),
  KEY `ID_Proveedor` (`ID_Proveedor`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `orden_compras_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedores` (`ID_Proveedor`),
  CONSTRAINT `orden_compras_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.orden_compras: ~0 rows (approximately)
DELETE FROM `orden_compras`;
/*!40000 ALTER TABLE `orden_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_compras` ENABLE KEYS */;


-- Dumping structure for table siuv.pago
DROP TABLE IF EXISTS `pago`;
CREATE TABLE IF NOT EXISTS `pago` (
  `ID_Pago` int(11) NOT NULL,
  `Forma_pago` varchar(20) DEFAULT NULL,
  `Num_cheque` varchar(20) DEFAULT NULL,
  `Descuento` float DEFAULT NULL,
  `Monto_descuento` float DEFAULT NULL,
  `Monto_restante` float DEFAULT NULL,
  `Monto_total_desc` float DEFAULT NULL,
  `Limite_credito` float DEFAULT NULL,
  `Pagos_acumulados` float DEFAULT NULL,
  `Plazo_pagos` int(11) DEFAULT NULL,
  `Fecha_pagos` date DEFAULT NULL,
  `ID_Facturas_rec` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Pago`),
  KEY `ID_Facturas_rec` (`ID_Facturas_rec`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`ID_Facturas_rec`) REFERENCES `facturas_recibidas` (`ID_Facturas_rec`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.pago: ~0 rows (approximately)
DELETE FROM `pago`;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;


-- Dumping structure for table siuv.periodos_pagos
DROP TABLE IF EXISTS `periodos_pagos`;
CREATE TABLE IF NOT EXISTS `periodos_pagos` (
  `ID_Periodo_Pagos` int(11) NOT NULL,
  `Num_periodo` int(3) DEFAULT NULL,
  `Periodo` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`ID_Periodo_Pagos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.periodos_pagos: ~0 rows (approximately)
DELETE FROM `periodos_pagos`;
/*!40000 ALTER TABLE `periodos_pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `periodos_pagos` ENABLE KEYS */;


-- Dumping structure for table siuv.producto
DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `ID_Producto` int(11) NOT NULL,
  `Costo_unitario` float DEFAULT NULL,
  `Precio_venta` float DEFAULT NULL,
  `Status` varchar(30) DEFAULT NULL,
  `Nom_producto` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `ID_Proveedor` int(11) DEFAULT NULL,
  `ID_Categoria` int(11) DEFAULT NULL,
  `Orden` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_Producto`),
  KEY `ID_Categoria` (`ID_Categoria`),
  KEY `ID_Proveedor` (`ID_Proveedor`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedores` (`ID_Proveedor`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`ID_Categoria`) REFERENCES `categoria` (`ID_Categoria`),
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedores` (`ID_Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.producto: ~0 rows (approximately)
DELETE FROM `producto`;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;


-- Dumping structure for table siuv.proveedores
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE IF NOT EXISTS `proveedores` (
  `ID_Proveedor` int(11) NOT NULL,
  `Entidad_fed` varchar(30) DEFAULT NULL,
  `Localidad` varchar(20) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `Nom_proveedor` varchar(40) DEFAULT NULL,
  `Contacto_proveedor` varchar(40) DEFAULT NULL,
  `Codigo_postal` int(5) DEFAULT NULL,
  `Telefono` int(13) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Num_cuenta` int(30) DEFAULT NULL,
  `Clabe` int(18) DEFAULT NULL,
  `Observaciones` varchar(60) DEFAULT NULL,
  `Direccion` varchar(40) DEFAULT NULL,
  `Colonia` varchar(40) DEFAULT NULL,
  `Banco` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_Proveedor`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.proveedores: ~0 rows (approximately)
DELETE FROM `proveedores`;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;


-- Dumping structure for table siuv.proveedor_pedidos
DROP TABLE IF EXISTS `proveedor_pedidos`;
CREATE TABLE IF NOT EXISTS `proveedor_pedidos` (
  `ID_Prov_pedido` int(11) NOT NULL,
  `Fecha_recibo` date DEFAULT NULL,
  `Cant_articulo` int(11) DEFAULT NULL,
  `Coste_pedido` float DEFAULT NULL,
  `ID_Facturas_rec` int(11) NOT NULL,
  `ID_Compras` int(11) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `ID_Proveedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Prov_pedido`),
  KEY `ID_Compras` (`ID_Compras`),
  KEY `ID_Producto` (`ID_Producto`),
  KEY `ID_Proveedor` (`ID_Proveedor`),
  CONSTRAINT `proveedor_pedidos_ibfk_1` FOREIGN KEY (`ID_Compras`) REFERENCES `orden_compras` (`ID_Compras`),
  CONSTRAINT `proveedor_pedidos_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`),
  CONSTRAINT `proveedor_pedidos_ibfk_3` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedores` (`ID_Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.proveedor_pedidos: ~0 rows (approximately)
DELETE FROM `proveedor_pedidos`;
/*!40000 ALTER TABLE `proveedor_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor_pedidos` ENABLE KEYS */;


-- Dumping structure for table siuv.saldo
DROP TABLE IF EXISTS `saldo`;
CREATE TABLE IF NOT EXISTS `saldo` (
  `ID_Consulta` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Saldo_actual` float DEFAULT NULL,
  PRIMARY KEY (`ID_Consulta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.saldo: ~0 rows (approximately)
DELETE FROM `saldo`;
/*!40000 ALTER TABLE `saldo` DISABLE KEYS */;
/*!40000 ALTER TABLE `saldo` ENABLE KEYS */;


-- Dumping structure for table siuv.salida_stock
DROP TABLE IF EXISTS `salida_stock`;
CREATE TABLE IF NOT EXISTS `salida_stock` (
  `ID_Salida` int(11) NOT NULL,
  `Total_salida` int(11) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Fecha_salida` date DEFAULT NULL,
  PRIMARY KEY (`ID_Salida`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `salida_stock_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.salida_stock: ~0 rows (approximately)
DELETE FROM `salida_stock`;
/*!40000 ALTER TABLE `salida_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `salida_stock` ENABLE KEYS */;


-- Dumping structure for table siuv.telefonos
DROP TABLE IF EXISTS `telefonos`;
CREATE TABLE IF NOT EXISTS `telefonos` (
  `ID_Telefono` int(11) NOT NULL,
  `Num_telefono` int(13) DEFAULT NULL,
  `Telefono_Movil` int(13) DEFAULT NULL,
  `Fax` int(13) DEFAULT NULL,
  `Num_extencion` int(6) DEFAULT NULL,
  PRIMARY KEY (`ID_Telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.telefonos: ~0 rows (approximately)
DELETE FROM `telefonos`;
/*!40000 ALTER TABLE `telefonos` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefonos` ENABLE KEYS */;


-- Dumping structure for table siuv.ventas
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `ID_NFacturas` int(11) NOT NULL,
  `Cant_producto` int(11) DEFAULT NULL,
  `Sub_total_ventas` float DEFAULT NULL,
  `IVA` float DEFAULT NULL,
  `Total_venta` float DEFAULT NULL,
  `Tipo_pago` varchar(20) DEFAULT NULL,
  `Banco` varchar(20) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `ID_RFC` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_NFacturas`),
  KEY `ID_Producto` (`ID_Producto`),
  KEY `ID_RFC` (`ID_RFC`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`ID_RFC`) REFERENCES `clientes` (`ID_RFC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table siuv.ventas: ~0 rows (approximately)
DELETE FROM `ventas`;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
