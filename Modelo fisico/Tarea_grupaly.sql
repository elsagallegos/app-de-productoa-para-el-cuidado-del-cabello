CREATE DATABASE Tarea_grupaly;
USE Tarea_grupaly;

CREATE TABLE IF NOT EXISTS `alimentacion` (
  `idALIMENTACION` INT AUTO_INCREMENT NOT NULL,
  `idusuario` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `comida` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `calorias` INT NOT NULL,
  `macronutrientes` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idALIMENTACION`),
  FOREIGN KEY (`idusuario`) REFERENCES `usuario`(`idusuario`) ON DELETE CASCADE
);
INSERT INTO alimentacion (idusuario, fecha, comida, descripcion, calorias, macronutrientes) VALUES
(1, '2025-01-30', 'Desayuno', 'Avena con frutas y miel', 350, 'Carbohidratos, Proteínas'),
(2, '2025-01-30', 'Almuerzo', 'Pechuga de pollo con ensalada', 600, 'Proteínas, Grasas saludables'),
(3, '2025-01-30', 'Cena', 'Ensalada de atún con aguacate', 450, 'Proteínas, Grasas saludables');
SELECT * FROM alimentacion;


CREATE TABLE IF NOT EXISTS `categoria` (
  `ID_Categoria` INT AUTO_INCREMENT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_Categoria`)
);
INSERT INTO categoria (Nombre) VALUES
('Lácteos'),
('Carnes y embutidos'),
('Frutas y verduras'),
('Cereales y harinas');
SELECT * FROM categoria;


CREATE TABLE IF NOT EXISTS `producto` (
  `idPRODUCTO` VARCHAR(4) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Descripción` VARCHAR(100) NOT NULL,
  `CATEGORIA_ID_Categoria` INT NOT NULL,
  PRIMARY KEY (`idPRODUCTO`),
  FOREIGN KEY (`CATEGORIA_ID_Categoria`) REFERENCES `categoria`(`ID_Categoria`) ON DELETE CASCADE
);
INSERT INTO producto (idPRODUCTO, Nombre, Marca, Descripción, CATEGORIA_ID_Categoria) VALUES
('P001', 'Leche Deslactosada', 'La Vaquita', 'Leche sin lactosa en envase de 1L', 1),
('P002', 'Pechuga de Pollo', 'Pollo Rico', 'Pechuga de pollo fresca 500g', 2),
('P003', 'Manzana Roja', 'Natural', 'Manzanas rojas frescas por kg', 3),
('P004', 'Avena Instantánea', 'Granero', 'Avena en hojuelas 400g', 4);
SELECT * FROM producto;


CREATE TABLE IF NOT EXISTS `proveedor` (
  `ID_Proveedor` INT AUTO_INCREMENT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(100) NOT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(20) NOT NULL,
  `Correo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_Proveedor`)
);
INSERT INTO proveedor (Nombre, Direccion, Ciudad, Telefono, Correo) VALUES
('Distribuidora Láctea', 'Av. Central 123', 'Guayaquil', '0991234567', 'contacto@lactea.com'),
('Carnicería San Juan', 'Calle 45 Norte', 'Quito', '0987654321', 'ventas@sanjuan.com'),
('Frutiverde', 'Km 5 vía Daule', 'Guayaquil', '0961122334', 'info@frutiverde.com');
SELECT * FROM proveedor;


CREATE TABLE IF NOT EXISTS `valoracion` (
  `idVALORACION` INT AUTO_INCREMENT NOT NULL,
  `idusuario` INT NOT NULL,
  `id_ejercicios` VARCHAR(45) NOT NULL,
  `comentarios` VARCHAR(100) NOT NULL,
  `valoracion_rutina` TEXT NOT NULL,
  PRIMARY KEY (`idVALORACION`),
  FOREIGN KEY (`idusuario`) REFERENCES `usuario`(`idusuario`) ON DELETE CASCADE
);
INSERT INTO valoracion (idusuario, id_ejercicios, comentarios, valoracion_rutina) VALUES
(1, 'EJ001', 'Buena rutina de fuerza', 'La rutina me ayudó a mejorar mi resistencia y fuerza.'),
(2, 'EJ002', 'Ejercicio intenso', 'Sentí que el cardio fue efectivo para mejorar mi resistencia.'),
(3, 'EJ003', 'Muy fácil', 'Esperaba un nivel más avanzado en la rutina de yoga.');
SELECT * FROM valoracion;


CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` INT AUTO_INCREMENT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Edad` INT NOT NULL,
  `Correo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idusuario`)
);
INSERT INTO usuario (Nombre, Edad, Correo) VALUES
('Juan Pérez', 25, 'juan.perez@email.com'),
('María Arboleda', 30, 'maria.arboleda@email.com'),
('Carlos Gómez', 28, 'carlos.gomez@email.com');
SELECT * FROM usuario;
