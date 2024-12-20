-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2024 at 06:16 PM
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
-- Database: `gem`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `adresse` text NOT NULL,
  `tel` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `telcontact` varchar(20) NOT NULL,
  `valsync` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `nom`, `adresse`, `tel`, `fax`, `email`, `contact`, `telcontact`, `valsync`) VALUES
(1, 'Client A', '123 Rue Exemple', '1234567890', '0987654321', 'clienta@example.com', 'Contact A', '1122334455', 0),
(2, 'Client B', '456 Avenue Exemple', '1234567891', '0987654322', 'clientb@example.com', 'Contact B', '1122334456', 0);

-- --------------------------------------------------------

--
-- Table structure for table `contrats`
--

CREATE TABLE `contrats` (
  `id` int(11) NOT NULL,
  `datedebut` date NOT NULL,
  `datefin` date NOT NULL,
  `redevence` decimal(10,0) NOT NULL,
  `client_id` int(11) NOT NULL,
  `valsync` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contrats`
--

INSERT INTO `contrats` (`id`, `datedebut`, `datefin`, `redevence`, `client_id`, `valsync`) VALUES
(1, '2024-12-02', '2024-12-07', 1000, 1, 0),
(2, '2024-12-03', '2024-12-08', 1500, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employes`
--

CREATE TABLE `employes` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `actif` tinyint(1) NOT NULL,
  `valsync` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employes`
--

INSERT INTO `employes` (`id`, `login`, `pwd`, `prenom`, `nom`, `email`, `actif`, `valsync`) VALUES
(1, 'ztattaher', '123456789', 'ZTAT', 'Taher', 'ztattaher@gmail.com', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employes_interventions`
--

CREATE TABLE `employes_interventions` (
  `id` int(11) NOT NULL,
  `employe_id` int(11) NOT NULL,
  `intervention_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employes_interventions`
--

INSERT INTO `employes_interventions` (`id`, `employe_id`, `intervention_id`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `nom` text NOT NULL,
  `img` longblob NOT NULL,
  `dateCapture` date NOT NULL,
  `intervention_id` int(11) NOT NULL,
  `valsync` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `nom`, `img`, `dateCapture`, `intervention_id`, `valsync`) VALUES
(1, 'Serveur AVANT', 0x696d675f736572766575725f6176616e742e6a7067, '2024-12-02', 1, 0),
(2, 'Routeur INSTALLE', 0x696d675f726f75746575725f696e7374616c6c652e6a7067, '2024-12-03', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `interventions`
--

CREATE TABLE `interventions` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `datedebut` date NOT NULL,
  `datefin` date NOT NULL,
  `heuredebutplan` time NOT NULL,
  `heurefinplan` time NOT NULL,
  `commentaires` text NOT NULL,
  `dateplanification` date NOT NULL,
  `heuredebuteffect` time NOT NULL,
  `heurefineffect` time NOT NULL,
  `terminee` tinyint(1) NOT NULL,
  `dateterminaison` date NOT NULL,
  `validee` tinyint(1) NOT NULL,
  `datevalidation` date NOT NULL,
  `priorite_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `valsync` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interventions`
--

INSERT INTO `interventions` (`id`, `titre`, `datedebut`, `datefin`, `heuredebutplan`, `heurefinplan`, `commentaires`, `dateplanification`, `heuredebuteffect`, `heurefineffect`, `terminee`, `dateterminaison`, `validee`, `datevalidation`, `priorite_id`, `site_id`, `valsync`) VALUES
(1, 'Intervention 1', '2024-12-02', '2024-12-04', '08:00:00', '12:00:00', 'Initial setup', '2024-12-01', '08:15:00', '12:10:00', 1, '2024-12-04', 1, '2024-12-04', 1, 1, 0),
(2, 'Intervention 2*5', '2024-12-03', '2024-12-05', '10:00:00', '14:00:00', 'Follow-up', '2024-12-02', '10:05:00', '13:55:00', 1, '2024-12-05', 1, '2024-12-05', 2, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `priorites`
--

CREATE TABLE `priorites` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `valsync` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `priorites`
--

INSERT INTO `priorites` (`id`, `nom`, `valsync`) VALUES
(1, 'Urgente', 0),
(2, 'Normale', 0),
(3, 'Basse', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `longitude` decimal(10,0) NOT NULL,
  `latitude` decimal(10,0) NOT NULL,
  `adresse` text NOT NULL,
  `rue` varchar(255) NOT NULL,
  `codepostal` int(4) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `telcontact` varchar(20) NOT NULL,
  `client_id` int(11) NOT NULL,
  `valsync` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `longitude`, `latitude`, `adresse`, `rue`, `codepostal`, `ville`, `contact`, `telcontact`, `client_id`, `valsync`) VALUES
(1, 41, -74, '10 Rue Centrale', 'Central Street', 75001, 'Paris', 'Jean Dupont', '0123456789', 1, 0),
(2, 49, 2, '50 Avenue Montaigne', 'Montaigne Avenue', 75008, 'Paris', 'Marie Curie', '0987654321', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `taches`
--

CREATE TABLE `taches` (
  `id` int(11) NOT NULL,
  `refernce` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `duree` decimal(10,0) NOT NULL,
  `prixheure` decimal(10,0) NOT NULL,
  `dateaction` date NOT NULL,
  `intervention_id` int(11) NOT NULL,
  `valsync` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `taches`
--

INSERT INTO `taches` (`id`, `refernce`, `nom`, `duree`, `prixheure`, `dateaction`, `intervention_id`, `valsync`) VALUES
(1, 'T001', 'Configurer le serveur', 2, 50, '2024-12-02', 1, 0),
(2, 'T002', 'Installer les câbles', 3, 60, '2024-12-03', 2, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contrats`
--
ALTER TABLE `contrats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employes`
--
ALTER TABLE `employes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employes_interventions`
--
ALTER TABLE `employes_interventions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interventions`
--
ALTER TABLE `interventions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `priorites`
--
ALTER TABLE `priorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taches`
--
ALTER TABLE `taches`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contrats`
--
ALTER TABLE `contrats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employes`
--
ALTER TABLE `employes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employes_interventions`
--
ALTER TABLE `employes_interventions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `interventions`
--
ALTER TABLE `interventions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `priorites`
--
ALTER TABLE `priorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `taches`
--
ALTER TABLE `taches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
