-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/10/2025 às 20:44
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
-- Banco de dados: `viacep`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `ceps`
--

CREATE TABLE `ceps` (
  `cep` char(8) NOT NULL,
  `logradouro` varchar(200) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `ddd` char(2) DEFAULT NULL,
  `cidade_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `ceps`
--

INSERT INTO `ceps` (`cep`, `logradouro`, `complemento`, `bairro`, `ddd`, `cidade_id`) VALUES
('01001000', 'Praça da Sé', '', 'Sé', '11', 1),
('01002000', 'Rua Direita', '', 'Sé', '11', 1),
('01003000', 'Rua 15 de Novembro', '', 'Centro', '11', 1),
('01004000', 'Avenida São João', '', 'Centro', '11', 1),
('01005000', 'Rua Boa Vista', '', 'Centro', '11', 1),
('01006000', 'Rua Líbero Badaró', '', 'Centro', '11', 1),
('01007000', 'Rua São Bento', '', 'Sé', '11', 1),
('01008000', 'Rua Vinte e Quatro de Maio', '', 'Centro', '11', 1),
('01009000', 'Rua Conselheiro Crispiniano', '', 'Centro', '11', 1),
('01010000', 'Rua Augusta', '', 'Consolação', '11', 1),
('13000000', 'Avenida Barão de Itapura', '', 'Centro', '19', 2),
('13001000', 'Rua XV de Novembro', '', 'Centro', '19', 2),
('13002000', 'Rua 13 de Maio', '', 'Centro', '19', 2),
('13003000', 'Avenida Benjamin Constant', '', 'Centro', '19', 2),
('13004000', 'Rua Duque de Caxias', '', 'Centro', '19', 2),
('13005000', 'Rua Carlos Gomes', '', 'Centro', '19', 2),
('13006000', 'Avenida Andrade Neves', '', 'Centro', '19', 2),
('13007000', 'Rua Conselheiro Lafaiete', '', 'Centro', '19', 2),
('13008000', 'Rua Padre Anchieta', '', 'Centro', '19', 2),
('13009000', 'Rua Visconde de Indaiatuba', '', 'Centro', '19', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidades`
--

CREATE TABLE `cidades` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `ibge` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cidades`
--

INSERT INTO `cidades` (`id`, `nome`, `ibge`, `estado_id`) VALUES
(1, 'São Paulo', 3550308, 1),
(2, 'Campinas', 3509502, 1),
(3, 'Santos', 3548500, 1),
(4, 'Sorocaba', 3552205, 1),
(5, 'Ribeirão Preto', 3543402, 1),
(6, 'Rio de Janeiro', 3304557, 2),
(7, 'Niterói', 3303302, 2),
(8, 'Petrópolis', 3303908, 2),
(9, 'Duque de Caxias', 3301702, 2),
(10, 'Nova Iguaçu', 3303500, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estados`
--

CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `uf` char(2) NOT NULL,
  `regiao` varchar(50) NOT NULL,
  `ibge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estados`
--

INSERT INTO `estados` (`id`, `nome`, `uf`, `regiao`, `ibge`) VALUES
(1, 'São Paulo', 'SP', 'Sudeste', 35),
(2, 'Rio de Janeiro', 'RJ', 'Sudeste', 33),
(3, 'Minas Gerais', 'MG', 'Sudeste', 31),
(4, 'Bahia', 'BA', 'Nordeste', 29),
(5, 'Paraná', 'PR', 'Sul', 41),
(6, 'Acre', 'AC', 'Norte', 12),
(7, 'Alagoas', 'AL', 'Nordeste', 27),
(8, 'Amapá', 'AP', 'Norte', 16),
(9, 'Amazonas', 'AM', 'Norte', 13),
(10, 'Ceará', 'CE', 'Nordeste', 23),
(11, 'Distrito Federal', 'DF', 'Centro-Oeste', 53),
(12, 'Espírito Santo', 'ES', 'Sudeste', 32),
(13, 'Goiás', 'GO', 'Centro-Oeste', 52),
(14, 'Maranhão', 'MA', 'Nordeste', 21),
(15, 'Mato Grosso', 'MT', 'Centro-Oeste', 51),
(16, 'Mato Grosso do Sul', 'MS', 'Centro-Oeste', 50),
(17, 'Pará', 'PA', 'Norte', 15),
(18, 'Paraíba', 'PB', 'Nordeste', 25),
(19, 'Pernambuco', 'PE', 'Nordeste', 26),
(20, 'Piauí', 'PI', 'Nordeste', 22),
(21, 'Rio Grande do Norte', 'RN', 'Nordeste', 24),
(22, 'Rio Grande do Sul', 'RS', 'Sul', 43),
(23, 'Rondônia', 'RO', 'Norte', 11),
(24, 'Roraima', 'RR', 'Norte', 14),
(25, 'Santa Catarina', 'SC', 'Sul', 42),
(26, 'Sergipe', 'SE', 'Nordeste', 28),
(27, 'Tocantins', 'TO', 'Norte', 17);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `ceps`
--
ALTER TABLE `ceps`
  ADD PRIMARY KEY (`cep`),
  ADD KEY `cidade_id` (`cidade_id`);

--
-- Índices de tabela `cidades`
--
ALTER TABLE `cidades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ibge` (`ibge`),
  ADD KEY `estado_id` (`estado_id`);

--
-- Índices de tabela `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ibge` (`ibge`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cidades`
--
ALTER TABLE `cidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `ceps`
--
ALTER TABLE `ceps`
  ADD CONSTRAINT `ceps_ibfk_1` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`);

--
-- Restrições para tabelas `cidades`
--
ALTER TABLE `cidades`
  ADD CONSTRAINT `cidades_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
