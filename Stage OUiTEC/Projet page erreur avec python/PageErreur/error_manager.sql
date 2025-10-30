-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 28 oct. 2025 à 15:12
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `error_manager`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` enum('admin','editor') DEFAULT 'editor',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password_hash`, `email`, `role`, `created_at`) VALUES
(1, 'Cedric', '159357', 'cedricadmin@localhost.com', 'admin', '2025-10-27 23:00:00'),
(2, 'Amine', '357258', 'amineadmin@localhost.com', 'admin', '2025-10-27 23:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `error_page`
--

CREATE TABLE `error_page` (
  `id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `suggestion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `error_page`
--

INSERT INTO `error_page` (`id`, `code`, `title`, `message`, `suggestion`) VALUES
(1, '404', 'Page introuvable', 'La page demandée est introuvable ou a été déplacée', NULL),
(2, '403', 'Accès interdit', 'Vous n\'avez pas l\'autorisation requise pour voir cette page', NULL),
(3, '400', 'Mauvaise requête', 'Requête mal formulée (URL/params/JSON non valides).', 'Vérifier URL/les paramètres, corriger le corps de texte, vider le cache/cookies puis réessayer.'),
(4, '401', 'Non autorisé', 'Authentification requise ou invalide.', 'Se connecter, renouveler le token, vérifier identifiants/expiration.'),
(5, '429', 'Trop de requêtes', 'Trop de requêtes (rate-limit/WAF).', 'Patienter, réduire la fréquence, appliquer un backoff exponentiel.'),
(6, '500', 'Erreur serveur interne', 'Erreur inattendue côté application.', 'Réessayer, si récurrent, prévenir le support.'),
(7, '502', 'Bad gateway', 'La passerelle (proxy/WAF) a reçu une mauvaise réponse du backend.', 'Réessayer, si fréquent, le signaler (panne possible).'),
(8, '503', 'Service indisponnible', 'Service indisponible (maintenance/surcharge).', 'Attendre et réessayer plus tard, vérifier le statut si disponible.');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `error_page`
--
ALTER TABLE `error_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `error_page`
--
ALTER TABLE `error_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

