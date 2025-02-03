-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tarea_grupaly
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alimentacion`
--

DROP TABLE IF EXISTS `alimentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alimentacion` (
  `idALIMENTACION` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `comida` varchar(45) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `calorias` int(11) NOT NULL,
  `macronutrientes` varchar(45) NOT NULL,
  PRIMARY KEY (`idALIMENTACION`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `alimentacion_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alimentacion`
--

LOCK TABLES `alimentacion` WRITE;
/*!40000 ALTER TABLE `alimentacion` DISABLE KEYS */;
INSERT INTO `alimentacion` VALUES (1,1,'2025-01-30','Desayuno','Avena con frutas y miel',350,'Carbohidratos, Proteínas'),(2,2,'2025-01-30','Almuerzo','Pechuga de pollo con ensalada',600,'Proteínas, Grasas saludables'),(3,3,'2025-01-30','Cena','Ensalada de atún con aguacate',450,'Proteínas, Grasas saludables');
/*!40000 ALTER TABLE `alimentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `ID_Categoria` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Lácteos'),(2,'Carnes y embutidos'),(3,'Frutas y verduras'),(4,'Cereales y harinas'),(5,'Lácteos'),(6,'Carnes y embutidos'),(7,'Frutas y verduras'),(8,'Cereales y harinas');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idPRODUCTO` varchar(4) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Marca` varchar(45) NOT NULL,
  `Descripción` varchar(100) NOT NULL,
  `CATEGORIA_ID_Categoria` int(11) NOT NULL,
  PRIMARY KEY (`idPRODUCTO`),
  KEY `CATEGORIA_ID_Categoria` (`CATEGORIA_ID_Categoria`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`CATEGORIA_ID_Categoria`) REFERENCES `categoria` (`ID_Categoria`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('P001','Leche Deslactosada','La Vaquita','Leche sin lactosa en envase de 1L',1),('P002','Pechuga de Pollo','Pollo Rico','Pechuga de pollo fresca 500g',2),('P003','Manzana Roja','Natural','Manzanas rojas frescas por kg',3),('P004','Avena Instantánea','Granero','Avena en hojuelas 400g',4);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `ID_Proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Ciudad` varchar(45) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Distribuidora Láctea','Av. Central 123','Guayaquil','0991234567','contacto@lactea.com'),(2,'Carnicería San Juan','Calle 45 Norte','Quito','0987654321','ventas@sanjuan.com'),(3,'Frutiverde','Km 5 vía Daule','Guayaquil','0961122334','info@frutiverde.com'),(4,'Distribuidora Láctea','Av. Central 123','Guayaquil','0991234567','contacto@lactea.com'),(5,'Carnicería San Juan','Calle 45 Norte','Quito','0987654321','ventas@sanjuan.com'),(6,'Frutiverde','Km 5 vía Daule','Guayaquil','0961122334','info@frutiverde.com');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Juan Pérez',25,'juan.perez@email.com'),(2,'María Arboleda',30,'maria.arboleda@email.com'),(3,'Carlos Gómez',28,'carlos.gomez@email.com'),(4,'Juan Pérez',25,'juan.perez@email.com'),(5,'María Arboleda',30,'maria.arboleda@email.com'),(6,'Carlos Gómez',28,'carlos.gomez@email.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valoracion`
--

DROP TABLE IF EXISTS `valoracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valoracion` (
  `idVALORACION` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `id_ejercicios` varchar(45) NOT NULL,
  `comentarios` varchar(100) NOT NULL,
  `valoracion_rutina` text NOT NULL,
  PRIMARY KEY (`idVALORACION`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `valoracion_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoracion`
--

LOCK TABLES `valoracion` WRITE;
/*!40000 ALTER TABLE `valoracion` DISABLE KEYS */;
INSERT INTO `valoracion` VALUES (1,1,'EJ001','Buena rutina de fuerza','La rutina me ayudó a mejorar mi resistencia y fuerza.'),(2,2,'EJ002','Ejercicio intenso','Sentí que el cardio fue efectivo para mejorar mi resistencia.'),(3,3,'EJ003','Muy fácil','Esperaba un nivel más avanzado en la rutina de yoga.');
/*!40000 ALTER TABLE `valoracion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-03  8:01:12
