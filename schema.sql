-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS `petvida`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE `petvida`;

-- Tabela de usuários do sistema
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(150) NOT NULL,
  `email` VARCHAR(150) UNIQUE NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `cargo` VARCHAR(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela de tutores (donos dos animais)
CREATE TABLE IF NOT EXISTS `tutores` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome_completo` VARCHAR(150) NOT NULL,
  `cpf` VARCHAR(20) UNIQUE NOT NULL,
  `telefone` VARCHAR(30) NOT NULL,
  `email` VARCHAR(150),
  `cep` VARCHAR(15),
  `endereco` VARCHAR(200),
  `bairro` VARCHAR(100),
  `cidade` VARCHAR(100),
  `estado` VARCHAR(2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela de animais vinculados aos tutores
CREATE TABLE IF NOT EXISTS `animais` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `especie` VARCHAR(50) NOT NULL,
  `raca` VARCHAR(80),
  `sexo` VARCHAR(20),
  `data_nascimento` DATE NULL,
  `cor` VARCHAR(50),
  `peso` DECIMAL(6,2) NULL,
  `microchip` VARCHAR(80),
  `observacoes` TEXT,
  `tutor_id` INT NOT NULL,
  CONSTRAINT `fk_animais_tutor`
    FOREIGN KEY (`tutor_id`) REFERENCES `tutores`(`id`)
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela de controle de estoque
CREATE TABLE IF NOT EXISTS `estoque` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `produto` VARCHAR(150) NOT NULL,
  `categoria` VARCHAR(80),
  `quantidade` INT NOT NULL DEFAULT 0,
  `data_validade` DATE NULL,
  `fornecedor` VARCHAR(120)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserção do usuário administrador padrão (senha: admin123)
INSERT INTO `usuarios` (`nome`, `email`, `senha`, `cargo`)
VALUES (
  'Administrador Master',
  'admin@petvida.com',
  '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
  'Administrador'
);
