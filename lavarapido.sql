-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Ago-2025 às 17:45
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lavarapido`
--
CREATE DATABASE IF NOT EXISTS `lavarapido` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lavarapido`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `idcliente`
--

CREATE TABLE `idcliente` (
  `cliente` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `datadenascimento` date DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `idendereco` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `idendereco`
--

CREATE TABLE `idendereco` (
  `endereco` int(11) NOT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `num` varchar(10) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `idmodelo`
--

CREATE TABLE `idmodelo` (
  `idmodelo` int(11) NOT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `idmarca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `marca`
--

CREATE TABLE `marca` (
  `idmarca` int(11) NOT NULL,
  `marca` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `idcliente`
--
ALTER TABLE `idcliente`
  ADD PRIMARY KEY (`cliente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idendereco` (`idendereco`);

--
-- Índices para tabela `idendereco`
--
ALTER TABLE `idendereco`
  ADD PRIMARY KEY (`endereco`);

--
-- Índices para tabela `idmodelo`
--
ALTER TABLE `idmodelo`
  ADD PRIMARY KEY (`idmodelo`),
  ADD KEY `idmarca` (`idmarca`);

--
-- Índices para tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idmarca`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `idcliente`
--
ALTER TABLE `idcliente`
  MODIFY `cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `idmodelo`
--
ALTER TABLE `idmodelo`
  MODIFY `idmodelo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `marca`
--
ALTER TABLE `marca`
  MODIFY `idmarca` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `idcliente`
--
ALTER TABLE `idcliente`
  ADD CONSTRAINT `idcliente_ibfk_1` FOREIGN KEY (`idendereco`) REFERENCES `idendereco` (`endereco`);

--
-- Limitadores para a tabela `idmodelo`
--
ALTER TABLE `idmodelo`
  ADD CONSTRAINT `idmodelo_ibfk_1` FOREIGN KEY (`idmarca`) REFERENCES `marca` (`idmarca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
