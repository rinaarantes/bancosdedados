-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/09/2025 às 05:28
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `estacionamento`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `andar`
--

CREATE TABLE `andar` (
  `codLugar` int(11) NOT NULL,
  `capacidade` int(11) DEFAULT NULL,
  `andar` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `andar`
--

INSERT INTO `andar` (`codLugar`, `capacidade`, `andar`) VALUES
(1, 100, 'A1'),
(2, 100, 'A2');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cpf` varchar(20) NOT NULL,
  `dtnasc` datetime DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cpf`, `dtnasc`, `nome`) VALUES
('12345678900', '2009-11-12 00:00:00', 'marina'),
('12345678908', '1995-11-12 00:00:00', 'maria'),
('12345679900', '2008-08-12 00:00:00', 'Raiane'),
('16545678900', '1997-10-24 00:00:00', 'mariana'),
('78945693567', '2000-06-14 00:00:00', 'pedro');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estaciona`
--

CREATE TABLE `estaciona` (
  `cod` int(11) NOT NULL,
  `horSaida` datetime DEFAULT NULL,
  `dtEntrada` datetime DEFAULT NULL,
  `horEntrada` datetime DEFAULT NULL,
  `dtSaida` datetime DEFAULT NULL,
  `placa` int(11) DEFAULT NULL,
  `codLugar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estaciona`
--

INSERT INTO `estaciona` (`cod`, `horSaida`, `dtEntrada`, `horEntrada`, `dtSaida`, `placa`, `codLugar`) VALUES
(3, NULL, '2025-09-08 06:00:00', NULL, '2025-09-08 11:00:00', 345, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `modelo`
--

CREATE TABLE `modelo` (
  `codModelo` int(11) NOT NULL,
  `modelo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `modelo`
--

INSERT INTO `modelo` (`codModelo`, `modelo`) VALUES
(1, 'Corolla'),
(2, 'Civic'),
(3, 'Uno'),
(4, 'HB20');

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `placa` int(11) NOT NULL,
  `cor` varchar(20) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `codModelo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `veiculo`
--

INSERT INTO `veiculo` (`placa`, `cor`, `cpf`, `codModelo`) VALUES
(123, 'vermelho', '12345678900', 2),
(345, 'preto', '12345678908', 2),
(678, 'preto', '12345678908', 4);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `andar`
--
ALTER TABLE `andar`
  ADD PRIMARY KEY (`codLugar`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `estaciona`
--
ALTER TABLE `estaciona`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `placa` (`placa`),
  ADD KEY `codLugar` (`codLugar`);

--
-- Índices de tabela `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`codModelo`);

--
-- Índices de tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `cpf` (`cpf`),
  ADD KEY `codModelo` (`codModelo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `andar`
--
ALTER TABLE `andar`
  MODIFY `codLugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `estaciona`
--
ALTER TABLE `estaciona`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `veiculo`
--
ALTER TABLE `veiculo`
  MODIFY `placa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=679;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `estaciona`
--
ALTER TABLE `estaciona`
  ADD CONSTRAINT `estaciona_ibfk_1` FOREIGN KEY (`placa`) REFERENCES `veiculo` (`placa`),
  ADD CONSTRAINT `estaciona_ibfk_2` FOREIGN KEY (`codLugar`) REFERENCES `andar` (`codLugar`);

--
-- Restrições para tabelas `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `cliente` (`cpf`),
  ADD CONSTRAINT `veiculo_ibfk_2` FOREIGN KEY (`codModelo`) REFERENCES `modelo` (`codModelo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
