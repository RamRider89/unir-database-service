-- unir-database-mysql/init_db.sql

-- Crear la base de datos si no existe con UTF8MB4
CREATE DATABASE IF NOT EXISTS `unir_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Usar la base de datos
USE `unir_db`;

--
-- Tabla `autores`
--
DROP TABLE IF EXISTS `autores`;
CREATE TABLE `autores` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido` VARCHAR(100) NOT NULL,
  `biografia` TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Inserción de 4 registros en `autores`
INSERT INTO `autores` (`nombre`, `apellido`, `biografia`) VALUES
('Gabriel', 'García Márquez', 'Novelista colombiano, premio Nobel de Literatura.'),
('Isabel', 'Allende', 'Escritora chilena, reconocida por su realismo mágico.'),
('Jorge Luis', 'Borges', 'Escritor argentino, maestro del cuento y el ensayo.'),
('Laura', 'Gallego', 'Escritora española de literatura juvenil y fantástica.');

--
-- Tabla `libros`
--
DROP TABLE IF EXISTS `libros`;
CREATE TABLE `libros` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `titulo` VARCHAR(255) NOT NULL,
  `isbn` VARCHAR(20) UNIQUE NOT NULL,
  `ano_publicacion` INT,
  `autor_id` INT,
  FOREIGN KEY (`autor_id`) REFERENCES `autores`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Inserción de 4 registros en `libros`
INSERT INTO `libros` (`titulo`, `isbn`, `ano_publicacion`, `autor_id`) VALUES
('Cien años de soledad', '978-0307474728', 1967, 1),
('La casa de los espíritus', '978-0345384210', 1982, 2),
('Ficciones', '978-0140186523', 1944, 3),
('Memorias de Idhún: La Resistencia', '978-8420422997', 2004, 4);

-- Crear un usuario para la aplicación si no existe y otorgar privilegios
DROP USER IF EXISTS 'app_user'@'%'; -- Opcional: descomentar si quieres forzar la eliminación para pruebas
CREATE USER IF NOT EXISTS 'app_user'@'%' IDENTIFIED BY 'app_password';
GRANT ALL PRIVILEGES ON `unir_db`.* TO 'app_user'@'%';
FLUSH PRIVILEGES;