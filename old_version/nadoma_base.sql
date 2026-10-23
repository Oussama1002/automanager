-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2025 at 08:23 PM
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
-- Database: `nadoma_base`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessoires`
--

CREATE TABLE `accessoires` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titre` varchar(125) NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `annonces`
--

CREATE TABLE `annonces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(125) NOT NULL,
  `pack_id` bigint(20) UNSIGNED DEFAULT NULL,
  `titre` varchar(125) NOT NULL,
  `prix` int(11) NOT NULL,
  `mark` varchar(125) NOT NULL,
  `modele` varchar(125) NOT NULL,
  `matricule` varchar(125) DEFAULT NULL,
  `year` int(11) NOT NULL,
  `km` int(11) NOT NULL,
  `carburant` varchar(125) NOT NULL,
  `box` varchar(125) NOT NULL,
  `etat` varchar(125) NOT NULL,
  `city` varchar(125) NOT NULL,
  `cv` varchar(125) NOT NULL,
  `nb_Door` int(11) NOT NULL,
  `origine` varchar(125) NOT NULL,
  `premiere_main` varchar(125) NOT NULL,
  `video` varchar(125) DEFAULT NULL,
  `reel` varchar(125) DEFAULT NULL,
  `bodywork` varchar(125) DEFAULT NULL,
  `status` varchar(125) NOT NULL DEFAULT 'disponible',
  `images` text DEFAULT NULL,
  `image` varchar(125) DEFAULT NULL,
  `imgrleft` varchar(125) DEFAULT NULL,
  `imgrtop` varchar(125) DEFAULT NULL,
  `imgrmed` varchar(125) DEFAULT NULL,
  `imgrbottom` varchar(125) DEFAULT NULL,
  `imgrright` varchar(125) DEFAULT NULL,
  `imginterior` varchar(125) DEFAULT NULL,
  `imgrapport` varchar(125) DEFAULT NULL,
  `rapport` varchar(125) DEFAULT NULL,
  `co2` varchar(125) DEFAULT NULL,
  `certifie` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `particulie` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `showroom` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `finance` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `jantesA` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `airbags` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `climatisation` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gps` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `toit_ouvrant` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `double_toit_ouvrant` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `siege_cuir` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `radar_recul` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `camera_recul` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vitreselec` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `abs` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `eps` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rv` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lv` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cd` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ordinateur` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `verrouillage` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `garantie` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `active` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `featured_position` tinyint(3) UNSIGNED DEFAULT NULL COMMENT '1, 2 or 3',
  `show_in_homepage` tinyint(1) NOT NULL DEFAULT 0,
  `homepage_position` int(11) DEFAULT NULL,
  `is_homepage` tinyint(1) NOT NULL DEFAULT 0,
  `colors` varchar(255) NOT NULL,
  `esp` tinyint(1) DEFAULT 0,
  `antipatinage` tinyint(1) DEFAULT 0,
  `aide_freinage_urgence` tinyint(1) DEFAULT 0,
  `antidemarrage_electronique` tinyint(1) DEFAULT 0,
  `aide_demarrage_cote` tinyint(1) DEFAULT 0,
  `selecteur_mode_conduite` tinyint(1) DEFAULT 0,
  `detection_fatigue` tinyint(1) DEFAULT 0,
  `maintien_dans_la_voie` tinyint(1) DEFAULT 0,
  `detecteur_angle_mort` tinyint(1) DEFAULT 0,
  `detecteur_sous_gonflage` tinyint(1) DEFAULT 0,
  `fermeture_portes_auto` tinyint(1) DEFAULT 0,
  `preparation_isofix` tinyint(1) DEFAULT 0,
  `phares_antibrouillard` tinyint(1) DEFAULT 0,
  `systeme_alarme` tinyint(1) DEFAULT 0,
  `start_stop` tinyint(1) DEFAULT 0,
  `regulateur_vitesse` tinyint(1) DEFAULT 0,
  `detecteur_pluie` tinyint(1) DEFAULT 0,
  `allumage_auto_feux` tinyint(1) DEFAULT 0,
  `frein_main_electrique` tinyint(1) DEFAULT 0,
  `aide_stationnement` tinyint(1) DEFAULT 0,
  `volant_reglable` tinyint(1) DEFAULT 0,
  `retros_electriques` tinyint(1) DEFAULT 0,
  `retros_rabat_electriques` tinyint(1) DEFAULT 0,
  `coffre_electrique` tinyint(1) DEFAULT 0,
  `sieges_electriques` tinyint(1) DEFAULT 0,
  `sieges_elec_memoire` tinyint(1) DEFAULT 0,
  `banquette_rabattable` tinyint(1) DEFAULT 0,
  `ecran_tactile` tinyint(1) DEFAULT 0,
  `cockpit_digital` tinyint(1) DEFAULT 0,
  `commandes_volant` tinyint(1) DEFAULT 0,
  `commandes_vocales` tinyint(1) DEFAULT 0,
  `reconnaissance_panneaux` tinyint(1) DEFAULT 0,
  `affichage_tete_haute` tinyint(1) DEFAULT 0,
  `systeme_audio` tinyint(1) DEFAULT 0,
  `wifi_bord` tinyint(1) DEFAULT 0,
  `bluetooth` tinyint(1) DEFAULT 0,
  `compatibilite_smartphone` tinyint(1) DEFAULT 0,
  `apple_carplay_android_auto` tinyint(1) DEFAULT 0,
  `chargeur_sans_fil` tinyint(1) DEFAULT 0,
  `sellerie_similicuir_tissu` tinyint(1) DEFAULT 0,
  `volant_cuir` tinyint(1) DEFAULT 0,
  `follow_me_home` tinyint(1) DEFAULT 0,
  `lumiere_ambiance` tinyint(1) DEFAULT 0,
  `feux_jour_led` tinyint(1) DEFAULT 0,
  `phares_full_led` tinyint(1) DEFAULT 0,
  `toit_panoramique` tinyint(1) DEFAULT 0,
  `barres_de_toit` tinyint(1) DEFAULT 0,
  `vitres_surteintees` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `annonces`
--

INSERT INTO `annonces` (`id`, `phone`, `pack_id`, `titre`, `prix`, `mark`, `modele`, `matricule`, `year`, `km`, `carburant`, `box`, `etat`, `city`, `cv`, `nb_Door`, `origine`, `premiere_main`, `video`, `reel`, `bodywork`, `status`, `images`, `image`, `imgrleft`, `imgrtop`, `imgrmed`, `imgrbottom`, `imgrright`, `imginterior`, `imgrapport`, `rapport`, `co2`, `certifie`, `particulie`, `showroom`, `finance`, `jantesA`, `airbags`, `climatisation`, `gps`, `toit_ouvrant`, `double_toit_ouvrant`, `siege_cuir`, `radar_recul`, `camera_recul`, `vitreselec`, `abs`, `eps`, `rv`, `lv`, `cd`, `ordinateur`, `verrouillage`, `garantie`, `views`, `active`, `created_at`, `updated_at`, `deleted_at`, `verified`, `featured_position`, `show_in_homepage`, `homepage_position`, `is_homepage`, `colors`, `esp`, `antipatinage`, `aide_freinage_urgence`, `antidemarrage_electronique`, `aide_demarrage_cote`, `selecteur_mode_conduite`, `detection_fatigue`, `maintien_dans_la_voie`, `detecteur_angle_mort`, `detecteur_sous_gonflage`, `fermeture_portes_auto`, `preparation_isofix`, `phares_antibrouillard`, `systeme_alarme`, `start_stop`, `regulateur_vitesse`, `detecteur_pluie`, `allumage_auto_feux`, `frein_main_electrique`, `aide_stationnement`, `volant_reglable`, `retros_electriques`, `retros_rabat_electriques`, `coffre_electrique`, `sieges_electriques`, `sieges_elec_memoire`, `banquette_rabattable`, `ecran_tactile`, `cockpit_digital`, `commandes_volant`, `commandes_vocales`, `reconnaissance_panneaux`, `affichage_tete_haute`, `systeme_audio`, `wifi_bord`, `bluetooth`, `compatibilite_smartphone`, `apple_carplay_android_auto`, `chargeur_sans_fil`, `sellerie_similicuir_tissu`, `volant_cuir`, `follow_me_home`, `lumiere_ambiance`, `feux_jour_led`, `phares_full_led`, `toit_panoramique`, `barres_de_toit`, `vitres_surteintees`) VALUES
(1, '0770080009', NULL, 'Range Rover Sport SE - Voitures d\'occasion NADO.MA', 310000, 'LAND ROVER', 'Range Rover Sport SE', NULL, 2016, 137000, 'diesel', 'automatique', 'excellent', 'Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'Hyjw_VHg0Mc', 'hxG3fJcs_Iw', 'suv et 4x4', '', NULL, '', '', '', '', '', '', '', '', '', '', 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, '2024-03-05 12:48:45', '2024-03-11 12:31:57', '2024-03-11 12:31:57', 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, '0770080009', NULL, 'Hyundai Tucson 2023- Voitures d\'occasion NADO.MA', 320000, 'HYUNDAI', 'Tucson', NULL, 2023, 46000, 'diesel', 'automatique', 'excellent', 'Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'bfbvFtE87qc&t', 'GEprGIUM5hM', 'suv et 4x4', '', NULL, '', '', '', '', '', '', '', '', '', '', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, '2024-03-05 13:03:00', '2024-03-11 12:34:33', '2024-03-11 12:34:33', 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, '0770080009', NULL, 'Renault Kadjar 2021 - Voitures d\'occasion NADO.MA', 200000, 'RENAULT', 'Kadjar', NULL, 2021, 108000, 'diesel', 'automatique', 'excellent', 'Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'MIJ96sBHF8A', 'WtUX4K0I0TQ', 'suv et 4x4', '', NULL, '', '', '', '', '', '', '', '', '', '', 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, '2024-03-05 13:17:17', '2024-03-11 12:47:29', '2024-03-11 12:47:29', 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, '0770080009', NULL, 'Peugeot 208 2022- Voitures d\'occasion NADO.MA', 156000, 'PEUGEOT', '208', NULL, 2022, 56000, 'diesel', 'manuelle', 'excellent', 'Jnane Californie', '6', 5, 'WW au Maroc', 'oui', '2Rfl0uqpRz4', 'lRQ5cCE6SjA', 'compact', '', NULL, '', '', '', '', '', '', '', '', '', '', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, '2024-03-05 13:24:55', '2024-03-11 12:33:18', '2024-03-11 12:33:18', 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, '0770080009', NULL, 'BMW 2020 Série 1 Sport 118d', 280000, 'BMW', 'Série 1 Sport', NULL, 2020, 120000, 'diesel', 'automatique', 'excellent', 'Jnane Californie', '8', 5, 'WW au Maroc', 'oui', 'TPlfIcutDys', 'KNtxW1BT4K0', 'compact', 'vendu', NULL, '', '', '', '', '', '', '', '', '', '', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, '2024-03-05 13:34:51', '2024-03-15 12:18:09', '2024-03-15 12:18:09', 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, '0770080009', NULL, 'Hyundai Tucson 2022 - Voitures d\'occasion NADO.MA', 265000, 'HYUNDAI', 'Tucson', NULL, 2022, 66000, 'diesel', 'automatique', 'excellent', 'Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'k8AYr0UQCq0', 'qvg0IpbcHVc', 'suv et 4x4', 'Réserve', NULL, '', '', '', '', '', '', '', '', '', '', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, '2024-03-05 13:40:55', '2024-03-15 12:18:07', '2024-03-15 12:18:07', 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, '0770080009', NULL, 'Audi A4 2019 - Voitures d\'occasion NADO.MA', 280000, 'AUDI', 'A4', NULL, 2019, 125000, 'diesel', 'automatique', 'excellent', 'Casablanca', '6', 5, 'WW au Maroc', 'oui', 'JggUO1rxIwM', '10L5ayahsLA', 'berline', 'disponible', NULL, '', '', '', '', '', '', '', '', '', '', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, '2024-03-08 10:22:54', '2024-03-15 12:18:05', '2024-03-15 12:18:05', 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, '0770080009', NULL, 'hyundai tucson', 310000, 'FOTON', 'Forland', NULL, 2008, 231312, 'essence', 'manuelle', 'excellent', 'Marrakech', '19', 9, 'dédouané', 'non', 'MIJ96sBHF8A', 'qvg0IpbcHVc', 'suv et 4x4', '', NULL, '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '2024-03-11 16:56:33', '2024-03-11 17:12:59', '2024-03-11 17:12:59', 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, '0770080009', NULL, 'Hyundai Tucson', 320000, 'GAZ', 'Next', NULL, 2007, 46000, 'diesel', 'manuelle', 'très bon', 'Nador', '19', 3, 'WW au Maroc', 'non', 'MIJ96sBHF8A', 'qvg0IpbcHVc', 'suv et 4x4', '', NULL, '', '', '', '', '', '', '', '', '', '', 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-03-11 16:58:13', '2024-03-11 17:12:55', '2024-03-11 17:12:55', 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, '0770080009', NULL, 'Range Rover Sport SE', 200000, 'GAZ', 'Next', NULL, 2009, 5551, 'diesel', 'automatique', 'très bon', 'Zenata', '18', 9, 'WW au Maroc', 'oui', 'MIJ96sBHF8A', 'GEprGIUM5hM', 'compact', '', NULL, '', '', '', '', '', '', '', '', '', '', 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, '2024-03-11 17:07:05', '2024-03-11 17:12:52', '2024-03-11 17:12:52', 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, '0770080009', NULL, 'Range Rover Sport SE -2016', 310000, 'LAND ROVER', 'Range Rover Sport SE', NULL, 2024, 137000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', 'Hyjw_VHg0Mc', 'hxG3fJcs_Iw', 'suv et 4x4', 'vendu', '[\"volkswagen-tiguan-563698.png\n\"]', 'volkswagen-tiguan-563698.png', 'volkswagen-tiguan-301310.jpg', '', '', '', '', '', '', '', '120', 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 222, 1, '2024-03-16 11:48:22', '2025-06-15 10:51:17', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, '0770080009', NULL, 'Hyundai tucson - 2023', 320000, 'HYUNDAI', 'Tucson', NULL, 2023, 46000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'bfbvFtE87qc', 'GEprGIUM5hM', 'suv et 4x4', 'vendu', '[\"hyundai-tucson-129358.png\"]', 'hyundai-tucson-129358.png', '', '', '', '', '', '', '', '', '12', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 112, 1, '2024-03-16 11:53:07', '2025-06-16 19:30:39', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, '0770080009', NULL, 'Renault Kadjar - 2021', 195000, 'RENAULT', 'Kadjar', NULL, 2021, 108000, 'diesel', 'automatique', 'très bon', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'MIJ96sBHF8A', 'WtUX4K0I0TQ', 'suv et 4x4', 'vendu', '[\"renault-kadjar-262932.png\"]', 'renault-kadjar-262932.png', '', '', '', '', '', '', '', '', '5', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 156, 1, '2024-03-16 11:56:13', '2025-09-08 17:34:44', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, '0770080009', NULL, 'Peugeot 208 - 2022', 156000, 'PEUGEOT', '208', NULL, 2022, 56000, 'diesel', 'manuelle', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', '2Rfl0uqpRz4', 'lRQ5cCE6SjA', 'compact', 'vendu', NULL, '', '', '', '', '', '', '', '', '', '12', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 109, 1, '2024-03-16 11:58:53', '2025-06-10 22:52:19', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, '0770080009', NULL, 'BMW 2020 Série 1 Sport 118d - 2020', 265000, 'BMW', 'Série 1 Sport', NULL, 2020, 120000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', 'TPlfIcutDys', 'KNtxW1BT4K0', 'compact', 'vendu', NULL, 'bmw-serie-1-sport-472564.png', 'bmw-serie-1-sport-512944.jpg', '', '', '', '', '', '', 'BMW-Série 1 Sport-130132.pdf', '100', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 341, 1, '2024-03-16 12:02:40', '2025-06-17 13:22:29', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, '0770080009', NULL, 'Hyundai Tucson - 2022', 265000, 'HYUNDAI', 'Tucson', NULL, 2022, 66000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '5', 5, 'WW au Maroc', 'oui', 'k8AYr0UQCq0', 'qvg0IpbcHVc', 'suv et 4x4', 'vendu', NULL, 'hyundai-tucson-481641.png', 'hyundai-tucson-914055.jpg', '', '', '', '', '', '', 'HYUNDAI-Tucson-640269.pdf', '12', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 144, 1, '2024-03-16 12:05:48', '2025-06-08 21:14:46', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, '0770080009', NULL, 'Audi A4 -2019', 280000, 'AUDI', 'A4', NULL, 2019, 125000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', 'JggUO1rxIwM', '10L5ayahsLA', 'berline', 'vendu', NULL, 'audi-a4-254270.png', 'audi-a4-116065.jpg', '', '', '', '', '', '', 'AUDI-A4-403523.pdf', '5', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 130, 1, '2024-03-16 12:11:39', '2025-06-04 17:48:12', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, '0770080009', NULL, 'Mercedes-Benz Classe C - 2014', 280000, 'MERCEDES', 'Classe C bluetec', NULL, 2014, 194000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '12', 5, 'WW au Maroc', 'oui', 'ZsxdWFkuJZg', '9xKjcyFvVxg', 'berline', 'vendu', NULL, 'mercedes-classe-c-bluetec-958306.png', '', '', '', '', '', '', '', '', NULL, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 487, 1, '2024-03-16 12:20:42', '2025-06-21 07:29:19', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, '0770080009', NULL, 'Hyundai I30 - 2019', 170000, 'HYUNDAI', 'I 30', NULL, 2019, 57000, 'diesel', 'manuelle', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'Pl7THzdvtXs', 'ydL7O-di1zg', 'compact', 'vendu', NULL, 'hyundai-i-30-236194.png', 'hyundai-i-30-666768.jpg', '', '', '', '', '', '', 'HYUNDAI-I 30-115174.pdf', '120', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 151, 1, '2024-03-16 17:34:19', '2025-06-12 08:32:50', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(28, '0770080009', NULL, 'Volkswagen Tiguan - 2024', 480000, 'VOLKSWAGEN', 'Tiguan', NULL, 2024, 4000, 'diesel', 'automatique', 'neuf', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', 'LmsM2D7R5-c', 'DsmqOgzUpsI', 'suv et 4x4', 'vendu', NULL, 'volkswagen-tiguan-375078.png', 'volkswagen-tiguan-309506.jpg', '', '', '', '', '', '', 'VOLKSWAGEN-Tiguan-578088.pdf', '5', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 153, 1, '2024-04-01 13:46:14', '2025-05-10 11:47:38', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(29, '0770080009', NULL, 'Mercedes-Benz classe C  bluetec - 2016', 270000, 'MERCEDES', 'Classe C bluetec', NULL, 2016, 96000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'lsxpwyEMYS8', '1MsPkgu0FZM', 'berline', 'vendu', NULL, 'mercedes-classe-c-bluetec-696128.png', 'mercedes-classe-c-bluetec-971039.jpg', '', '', '', '', '', '', 'MERCEDES-Classe C bluetec-158784.pdf', '120', 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 337, 1, '2024-04-04 13:59:39', '2025-06-20 21:27:39', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30, '0770080009', NULL, 'Nissan Juke-2021', 190000, 'NISSAN', 'Juke', NULL, 2021, 65000, 'essence', 'automatique', 'très bon', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'xlPk1i-PTWY', 'D1uzRnCBwX8', 'suv et 4x4', 'vendu', NULL, 'nissan-juke-272619.png', 'nissan-juke-122522.jpg', '', '', '', '', '', '', 'NISSAN-Juke-311989.pdf', '100', 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 92, 1, '2024-04-06 17:38:36', '2025-06-10 22:59:01', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(31, '0770080009', NULL, 'Volkswagen Tiguan - 2021', 500000, 'VOLKSWAGEN', 'Tiguan', NULL, 2021, 100000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'dédouané', 'oui', 'LmsM2D7R5-c', 'N8gMn34oaO0', 'suv et 4x4', 'vendu', NULL, 'volkswagen-tiguan-381489.png', 'volkswagen-tiguan-306980.jpg', '', '', '', '', '', '', 'VOLKSWAGEN-Tiguan-633091.pdf', '5', 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 109, 1, '2024-04-21 08:07:49', '2025-06-09 12:44:57', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(32, '0770080009', NULL, 'TOYOTA C-CHR - 2017', 170000, 'TOYOTA', 'C-HR', NULL, 2017, 215000, 'hybride', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '10', 5, 'WW au Maroc', 'oui', '4lSP9BM7-6I', 'QuxNPDtvNfU', 'suv et 4x4', 'vendu', NULL, 'toyota-c-hr-174870.png', 'toyota-c-hr-530676.jpg', '', '', '', '', '', '', 'TOYOTA-C-HR-849109.pdf', '120', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 139, 1, '2024-04-26 11:05:26', '2025-06-06 12:06:18', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(33, '0770080009', NULL, 'TOYOTA Corolla - 2019', 160000, 'TOYOTA', 'Corolla', NULL, 2019, 108000, 'hybride', 'automatique', 'très bon', 'Casablanca-Jnane Californie', '10', 5, 'WW au Maroc', 'oui', 'e4bzk34pOVI', 'MuHUvfgk2a4', 'berline', 'vendu', NULL, 'toyota-corolla-702444.png', 'toyota-corolla-558451.jpg', '', '', '', '', '', '', 'TOYOTA-Corolla-899561.pdf', '100', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 262, 1, '2024-04-26 11:17:23', '2025-06-15 10:40:34', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(34, '0770080009', NULL, 'Hyundai Creta - 2022', 229000, 'HYUNDAI', 'Creta', NULL, 2022, 68000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'importé neuf', 'oui', 'IlPta1Eiutg', 'aML1O0rxq7g', 'suv et 4x4', 'vendu', NULL, 'hyundai-creta-331848.png', 'hyundai-creta-862640.jpg', '', '', '', '', '', '', 'HYUNDAI-Creta-776322.pdf', '50', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 198, 1, '2024-05-04 08:42:55', '2025-06-21 02:26:17', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(35, '0770080009', NULL, 'Volkswagen Touareg -2021', 480000, 'VOLKSWAGEN', 'Touareg', NULL, 2021, 177000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '12', 5, 'WW au Maroc', 'oui', 'QBlmh5Zr4mA', 'KU9WjHJQig8', 'suv et 4x4', 'vendu', NULL, 'volkswagen-touareg-521878.png', 'volkswagen-touareg-618537.jpg', '', '', '', '', '', '', 'VOLKSWAGEN-Touareg-994750.pdf', '50', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 254, 1, '2024-05-07 09:50:12', '2025-06-13 12:36:13', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(36, '0643818890', NULL, 'Volkswagen Tiguan - 2018', 227000, 'VOLKSWAGEN', 'Tiguan', NULL, 2018, 101000, 'diesel', 'automatique', 'très bon', 'Casablanca', '8', 5, 'WW au Maroc', 'oui', 'lzKSqJlLHv4', 'M244FfKiaPA', 'suv et 4x4', 'vendu', NULL, 'volkswagen-tiguan-268016.png', 'volkswagen-tiguan-121193.jpg', '', '', '', '', '', '', 'VOLKSWAGEN-Tiguan-596536.pdf', '100', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 216, 1, '2024-05-08 10:29:16', '2025-06-16 04:57:59', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(37, '0770080009', NULL, 'AUDI Q5 - 2011', 160000, 'AUDI', 'Q5', NULL, 2011, 137000, 'diesel', 'automatique', 'bon', 'Casablanca', '12', 5, 'WW au Maroc', 'oui', 'l_A4Rkf5ds8', 'PfTUc6hWmpo', 'suv et 4x4', 'vendu', NULL, 'audi-q5-109760.png', 'audi-q5-662985.jpg', '', '', '', '', '', '', 'AUDI-Q5-157924.pdf', '150', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 458, 1, '2024-05-08 11:38:37', '2025-06-21 12:37:03', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(38, '0707763415', NULL, 'DACIA Duster -2020', 179000, 'DACIA', 'Duster', NULL, 2020, 110000, 'diesel', 'automatique', 'excellent', 'Casablanca', '6', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'vendu', NULL, 'dacia-duster-602116.png', 'dacia-duster-978997.jpg', '', '', '', '', '', '', 'DACIA-Duster-445105.pdf', '100', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 100, 1, '2024-05-08 12:16:02', '2025-05-14 17:22:35', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(39, '0770080009', NULL, 'kadjar Renault -2020-12', 167000, 'RENAULT', 'Kadjar', NULL, 2020, 300000, 'diesel', 'manuelle', 'très bon', 'Casablanca', '6', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'vendu', NULL, 'renault-kadjar-770102.png', 'renault-kadjar-597791.jpg', '', '', '', '', '', '', 'RENAULT-Kadjar-671269.pdf', '100', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 318, 1, '2024-05-08 12:52:44', '2025-06-16 10:02:00', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(40, '0707763415', NULL, 'Hyundai Tucson -2021', 260000, 'HYUNDAI', 'Tucson', NULL, 2021, 112000, 'diesel', 'automatique', 'très bon', 'Casablanca', '6', 5, 'WW au Maroc', 'non', 'ZN5VFZoeEQw', 'Y2juoZNvEtM', 'suv et 4x4', 'vendu', NULL, 'hyundai-tucson-878704.png', 'hyundai-tucson-644418.jpg', '', '', '', '', '', '', 'HYUNDAI-Tucson-546061.pdf', '150', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 123, 1, '2024-05-09 07:56:07', '2025-05-29 20:00:27', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(41, '0707763415', NULL, 'Opel Astra 2015', 125000, 'OPEL', 'Astra', NULL, 2015, 130000, 'diesel', 'automatique', 'très bon', 'Casablanca', '8', 5, 'WW au Maroc', 'non', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'vendu', NULL, 'opel-astra-787384.png', 'opel-astra-333710.jpg', '', '', '', '', '', '', 'OPEL-Astra-663188.pdf', '150', 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 130, 1, '2024-05-11 08:00:36', '2025-06-16 22:35:48', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(42, '0707763415', NULL, 'Seat Arona - 2022', 196000, 'SEAT', 'Arona', NULL, 2022, 59000, 'diesel', 'manuelle', 'excellent', 'Casablanca', '6', 5, 'WW au Maroc', 'oui', 'rPBFcwuRbAs', '-LWiI1B0ogQ', 'suv et 4x4', 'vendu', NULL, 'seat-arona-562305.png', 'seat-arona-330433.jpg', '', '', '', '', '', '', 'SEAT-Arona-875596.pdf', '50', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 167, 1, '2024-05-11 09:20:45', '2025-06-19 17:37:58', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(43, '0770080009', NULL, 'Mercedes-Benz classe C  - 2023', 820000, 'MERCEDES', 'Classe C', NULL, 2023, 26000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'dédouané', 'oui', 'd6E6GC_6F0U', 'aQ1thovOahg', 'berline', 'vendu', NULL, 'mercedes-classe-c-197528.png', 'mercedes-classe-c-496038.jpg', '', '', '', '', '', 'mercedes-classe-c-975701.jpg', 'MERCEDES-Classe C-432480.pdf', '09', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 191, 1, '2024-05-11 12:17:28', '2025-06-13 20:49:38', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(44, '0707763415', NULL, 'Hyundai Tucson - 2020', 282000, 'HYUNDAI', 'Tucson', NULL, 2020, 49000, 'diesel', 'automatique', 'excellent', 'Casablanca', '6', 5, 'WW au Maroc', 'oui', 'JeSKlruj5NY', '7Snw21CPvvA', 'suv et 4x4', 'vendu', NULL, 'hyundai-tucson-805529.png', 'hyundai-tucson-361824.jpg', '', '', '', '', '', 'hyundai-tucson-369588.jpg', 'HYUNDAI-Tucson-863752.pdf', '50', 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 133, 1, '2024-05-13 12:15:07', '2025-06-16 08:02:37', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(45, '0707763415', NULL, 'Nissan Micra-2021', 156000, 'NISSAN', 'Micra', NULL, 2021, 30000, 'diesel', 'manuelle', 'excellent', 'Casablanca', '6', 5, 'WW au Maroc', 'non', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'compact', 'vendu', NULL, 'nissan-micra-317308.png', 'nissan-micra-584525.jpg', '', '', '', '', '', '', 'NISSAN-Micra-298120.pdf', '100', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 157, 1, '2024-05-16 07:48:24', '2025-06-20 19:42:11', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(46, '0707763415', NULL, 'DACIA Duster -2018', 177000, 'DACIA', 'Duster', NULL, 2018, 55000, 'diesel', 'automatique', 'excellent', 'Casablanca', '6', 5, 'WW au Maroc', 'oui', 'WKCxW9Hm8K8', 'kCQFSuxkpuI', 'suv et 4x4', 'vendu', NULL, 'dacia-duster-204169.png', 'dacia-duster-380436.jpg', '', '', '', '', '', 'dacia-duster-757219.jpg', 'DACIA-Duster-769453.pdf', '100', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 113, 1, '2024-05-17 13:54:59', '2025-06-02 01:40:50', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(47, '0707763415', NULL, 'Peugeot 3008- 2018', 245000, 'PEUGEOT', '3008', NULL, 2018, 85000, 'diesel', 'automatique', 'excellent', 'Casablanca', '8', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'vendu', NULL, 'peugeot-3008-675308.png', 'peugeot-3008-431248.png', 'peugeot-3008-569433.png', 'peugeot-3008-115570.png', 'peugeot-3008-331863.png', 'peugeot-3008-941176.png', '', 'peugeot-3008-209972.jpg', 'PEUGEOT-3008-474601.pdf', '100', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 135, 1, '2024-05-20 11:42:22', '2025-05-21 13:12:28', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(48, '0770080009', NULL, 'Mercedes-Benz Classe A- 2020 Dédouané 2024', 365000, 'MERCEDES', 'Classe A', NULL, 2020, 160000, 'diesel', 'automatique', 'excellent', 'Casablanca', '8', 5, 'dédouané', 'oui', 'CtjPrsS7--Q', 'j9DJuXQCBR0', 'compact', 'vendu', NULL, 'mercedes-classe-a-841238.png', 'mercedes-classe-a-583560.png', 'mercedes-classe-a-723052.jpg', 'mercedes-classe-a-489182.png', 'mercedes-classe-a-272533.jpg', 'mercedes-classe-a-666944.png', '', 'mercedes-classe-a-182785.jpg', 'MERCEDES-Classe A-639170.pdf', '10', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 623, 1, '2024-05-20 14:02:33', '2025-06-16 23:55:42', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49, '0707763415', NULL, 'Volkswagen Tiguan R-line 2021 dédouaner 2024', 540000, 'VOLKSWAGEN', 'Tiguan', NULL, 2021, 52000, 'diesel', 'automatique', 'excellent', 'Oujda', '8', 5, 'dédouané', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'vendu', NULL, 'volkswagen-tiguan-459573.png', 'volkswagen-tiguan-506069.png', 'volkswagen-tiguan-730333.png', 'volkswagen-tiguan-100171.png', 'volkswagen-tiguan-768728.png', 'volkswagen-tiguan-136722.png', '', 'volkswagen-tiguan-772483.jpg', 'VOLKSWAGEN-Tiguan-535013.pdf', '05', 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 158, 1, '2024-05-22 09:23:56', '2025-06-11 11:24:50', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(50, '0707763415', NULL, 'Dacia Sandero Stepway -2022', 155000, 'DACIA', 'Sandero Stepway', NULL, 2022, 39000, 'diesel', 'manuelle', 'excellent', 'Casablanca', '6', 5, 'WW au Maroc', 'oui', 'Sa0RDCXP1A0', '0lWp_yyYpDo', 'suv et 4x4', 'vendu', NULL, 'dacia-sandero-stepway-250693.png', 'dacia-sandero-stepway-872415.png', 'dacia-sandero-stepway-816272.png', 'dacia-sandero-stepway-523140.png', 'dacia-sandero-stepway-866657.png', 'dacia-sandero-stepway-747783.png', '', 'dacia-sandero-stepway-855816.jpg', 'DACIA-Sandero Stepway-854103.pdf', '10', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 104, 1, '2024-05-24 15:30:59', '2025-08-09 20:44:31', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(51, '0770080009', NULL, 'BMW X1 -2017 BVM', 210000, 'BMW', 'X1', NULL, 2017, 98000, 'diesel', 'manuelle', 'excellent', 'Casablanca', '6', 5, 'WW au Maroc', 'oui', 'ePV1jtj5Jao', 'utn5I_obvbM', 'suv et 4x4', 'vendu', NULL, 'bmw-x1-530601.png', 'bmw-x1-401989.png', 'bmw-x1-776431.png', 'bmw-x1-207080.png', 'bmw-x1-171103.png', 'bmw-x1-989473.png', '', 'bmw-x1-505361.jpg', 'BMW-X1-479894.pdf', '10', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 457, 1, '2024-05-25 09:17:38', '2025-06-19 18:13:23', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(52, '0707763415', NULL, 'hyundai i30 -2013', 136000, 'HYUNDAI', 'I 30', NULL, 2013, 138000, 'diesel', 'automatique', 'très bon', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'compact', 'vendu', NULL, 'hyundai-i-30-496077.png', 'hyundai-i-30-834672.png', 'hyundai-i-30-673828.png', 'hyundai-i-30-439601.png', 'hyundai-i-30-647216.png', 'hyundai-i-30-874662.png', '', 'hyundai-i-30-850351.jpg', 'HYUNDAI-I 30-989929.pdf', '100', 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 175, 1, '2024-05-25 10:56:06', '2025-06-08 16:46:58', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(53, '0770080009', NULL, 'Hyundai Tucson - 2016', 190000, 'HYUNDAI', 'Tucson', NULL, 2016, 130000, 'diesel', 'automatique', 'excellent', 'Casablanca', '7', 5, 'WW au Maroc', 'oui', 'XlZ_H40kHmo', 'iaxSpSgj8Hc', 'suv et 4x4', 'vendu', NULL, 'hyundai-tucson-183283.png', 'hyundai-tucson-537881.png', 'hyundai-tucson-538083.png', 'hyundai-tucson-993288.png', 'hyundai-tucson-775975.png', 'hyundai-tucson-531682.png', '', 'hyundai-tucson-724662.jpg', 'HYUNDAI-Tucson-291158.pdf', '100', 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 477, 1, '2024-05-29 15:17:00', '2025-06-20 14:08:13', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54, '0606323211', NULL, 'dacia logan', 12000, 'DODGE', 'Avenger', NULL, 2011, 1254888, 'essence', 'manuelle', 'excellent', 'Nador', '18', 8, 'WW au Maroc', 'non', 'qvg0IpbcHVc', 'qvg0IpbcHVc', 'suv et 4x4', 'disponible', NULL, 'dodge-avenger-115271.png', 'dodge-avenger-292972.png', 'dodge-avenger-104421.png', 'dodge-avenger-887824.png', 'dodge-avenger-106002.png', 'dodge-avenger-661532.png', 'dodge-avenger-421017.png', 'dodge-avenger-995583.png', 'DODGE-Avenger-748373.pdf', '125', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2024-07-02 13:29:07', '2024-07-02 13:29:17', '2024-07-02 13:29:17', 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(55, '0770080009', NULL, 'HONDA CRV - 2014', 170000, 'HONDA', 'CR-V', NULL, 2014, 199000, 'diesel', 'automatique', 'excellent', 'Casablanca', '9', 5, 'WW au Maroc', 'oui', 'bI23nZJPzUU', '0PLxeD_-OUU', 'suv et 4x4', 'vendu', NULL, 'honda-cr-v-992771.png', 'honda-cr-v-709348.png', 'honda-cr-v-201089.png', 'honda-cr-v-959161.png', 'honda-cr-v-832188.png', 'honda-cr-v-804456.png', 'honda-cr-v-885080.png', 'honda-cr-v-316931.jpg', 'HONDA-CR-V-584135.pdf', '100', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 146, 1, '2024-07-02 14:21:00', '2025-06-19 17:36:11', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(56, '0770080009', NULL, 'Hyundai Tucson - 2022', 250000, 'HYUNDAI', 'Tucson', NULL, 2022, 99000, 'diesel', 'automatique', 'excellent', 'Casablanca', '6', 5, 'WW au Maroc', 'oui', 'Mf6k6WBnVe4', '15wsbmPOA5g', 'suv et 4x4', 'vendu', NULL, 'hyundai-tucson-871616.png', 'hyundai-tucson-640823.png', 'hyundai-tucson-136306.png', 'hyundai-tucson-696520.png', 'hyundai-tucson-984117.png', 'hyundai-tucson-343063.png', 'hyundai-tucson-768116.png', 'hyundai-tucson-199620.jpg', 'HYUNDAI-Tucson-523884.pdf', '50', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 338, 1, '2024-07-02 14:53:18', '2025-06-04 17:19:01', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(57, '0770080009', NULL, 'Audi A1 -2016 dédouaner 2017', 170000, 'AUDI', 'A1', NULL, 2016, 56000, 'diesel', 'manuelle', 'excellent', 'Casablanca', '6', 5, 'dédouané', 'oui', 'H4MIMTZC-4U', 'enmjhfIy_YI', 'compact', 'vendu', NULL, 'audi-a1-358883.png', 'audi-a1-769233.png', 'audi-a1-715893.jpg', 'audi-a1-408744.png', 'audi-a1-707497.png', 'audi-a1-670326.png', 'audi-a1-233733.jpg', 'audi-a1-960266.jpg', 'AUDI-A1-397023.pdf', '100', 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 226, 1, '2024-07-04 15:33:17', '2025-06-10 22:48:31', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(58, '0770080009', NULL, 'Mercedes-Benz classe C  AMG line - 2022', 480000, 'MERCEDES', 'Classe C', NULL, 2022, 67000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'pas encore dédouané', 'oui', 'B2rg1CWCj5s', 'nlfzxdV9XGk', 'berline', 'vendu', NULL, 'mercedes-classe-c-529808.png', 'mercedes-classe-c-635174.png', 'mercedes-classe-c-347598.png', 'mercedes-classe-c-515427.png', 'mercedes-classe-c-757481.png', 'mercedes-classe-c-278080.png', 'mercedes-classe-c-864126.png', 'mercedes-classe-c-927266.jpg', 'MERCEDES-Classe C-440563.pdf', '01', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 337, 1, '2024-07-06 12:01:07', '2025-06-17 18:47:20', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(59, '0770080009', NULL, 'Peugeot 508 GTL  - 2021', 310000, 'PEUGEOT', '508', NULL, 2021, 87000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', 'I_DPY62fuUw', 'ydOuIL06dvo', 'berline', 'vendu', NULL, 'peugeot-508-345943.png', 'peugeot-508-757687.png', 'peugeot-508-521584.png', 'peugeot-508-491162.png', 'peugeot-508-646791.png', 'peugeot-508-407274.png', 'peugeot-508-963620.png', 'peugeot-508-799367.jpg', 'PEUGEOT-508-277327.pdf', '01', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 144, 1, '2024-07-06 14:45:06', '2025-06-09 11:20:34', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(60, '0707763415', NULL, 'Renault koleos -2010', 35000, 'RENAULT', 'Koleos', NULL, 2010, 180000, 'essence', 'manuelle', 'bon', 'Casablanca', '14', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'vendu', NULL, 'renault-koleos-100319.png', 'renault-koleos-829082.png', 'renault-koleos-904953.png', 'renault-koleos-493801.png', 'renault-koleos-908815.png', 'renault-koleos-187408.png', 'renault-koleos-248575.png', 'renault-koleos-184124.jpg', 'RENAULT-Koleos-535566.pdf', '200', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 208, 1, '2024-07-08 15:24:05', '2025-06-14 23:47:14', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(61, '0770080009', NULL, 'TOYOTA Yaris -2021', 130000, 'TOYOTA', 'Yaris', NULL, 2021, 30000, 'essence', 'manuelle', 'excellent', 'Casablanca', '6', 5, 'WW au Maroc', 'oui', 'S8CI2Twvn3Q', '0HLC4BNdT-g', 'compact', 'vendu', NULL, 'toyota-yaris-908053.png', 'toyota-yaris-390686.png', 'toyota-yaris-251629.png', 'toyota-yaris-444717.png', 'toyota-yaris-408481.png', 'toyota-yaris-769431.png', 'toyota-yaris-119947.png', 'toyota-yaris-878969.jpg', 'TOYOTA-Yaris-686553.pdf', '100', 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 205, 1, '2024-07-09 11:36:31', '2025-06-14 22:01:07', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(62, '0770080009', NULL, 'Volkswagen golf 8 style -2022', 330000, 'VOLKSWAGEN', 'Golf 8', NULL, 2022, 41000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'IrqxkoedkF0', 'compact', 'disponible', '[\"volkswagen-golf-8-539284.png\"]', '', 'volkswagen-golf-8-988095.png', 'volkswagen-golf-8-412213.png', 'volkswagen-golf-8-929566.png', 'volkswagen-golf-8-522719.png', 'volkswagen-golf-8-581910.png', 'volkswagen-golf-8-164888.png', 'volkswagen-golf-8-652715.jpg', 'VOLKSWAGEN-Golf 8-296452.pdf', '100', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 749, 1, '2024-07-11 15:53:52', '2025-08-28 10:57:43', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(63, '0770080009', NULL, 'Peugeot 3008- GTL 2018', 237000, 'PEUGEOT', '3008', NULL, 2018, 97000, 'diesel', 'automatique', 'excellent', 'Casablanca', '8', 5, 'WW au Maroc', 'oui', 'JKf9BCwP1tE', 'MuHUvfgk2a4', 'suv et 4x4', 'vendu', NULL, 'peugeot-3008-902738.png', 'peugeot-3008-239183.png', 'peugeot-3008-874570.png', 'peugeot-3008-892828.png', 'peugeot-3008-709407.png', 'peugeot-3008-315588.png', 'peugeot-3008-740343.png', 'peugeot-3008-432493.jpg', 'PEUGEOT-3008-291994.pdf', '100', 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 174, 1, '2024-07-12 14:02:27', '2025-06-07 02:34:05', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(64, '0770080009', NULL, 'KIA Picanto -202O', 120000, 'KIA', 'Picanto', NULL, 2020, 36000, 'essence', 'manuelle', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'C5jk_URqNk0', 'rL-EAeQpgTo', 'compact', 'vendu', NULL, 'kia-picanto-579745.png', 'kia-picanto-692095.png', 'kia-picanto-976865.png', 'kia-picanto-185835.png', 'kia-picanto-818680.png', 'kia-picanto-428854.png', 'kia-picanto-483847.png', 'kia-picanto-718434.jpg', 'KIA-Picanto-566677.pdf', '10', 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 132, 1, '2024-07-12 15:13:38', '2025-06-03 19:05:02', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(65, '0770080009', NULL, 'Peugeot 3008- 2019', 227000, 'PEUGEOT', '3008', NULL, 2019, 100000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', '7O6fvWPcCAE', 'BCNI-Za308c', 'suv et 4x4', 'vendu', NULL, 'peugeot-3008-333177.png', 'peugeot-3008-947306.png', 'peugeot-3008-302871.png', 'peugeot-3008-859811.png', 'peugeot-3008-616876.png', 'peugeot-3008-889944.png', 'peugeot-3008-958723.png', 'peugeot-3008-929014.jpg', 'PEUGEOT-3008-526059.pdf', '100', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 269, 1, '2024-07-13 14:16:53', '2025-06-18 09:13:27', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(66, '0770080009', NULL, 'Hyundai Tucson - 2022', 268000, 'HYUNDAI', 'Tucson', NULL, 2022, 67000, 'diesel', 'automatique', 'excellent', 'Casablanca', '6', 5, 'WW au Maroc', 'oui', 'R4nQQRYZkFM', 'ZG_1LG6j9Q0', 'suv et 4x4', 'vendu', NULL, 'hyundai-tucson-549379.png', 'hyundai-tucson-464012.png', 'hyundai-tucson-998033.png', 'hyundai-tucson-880708.png', 'hyundai-tucson-897599.png', 'hyundai-tucson-233981.png', 'hyundai-tucson-363383.png', 'hyundai-tucson-205000.jpg', 'HYUNDAI-Tucson-650195.pdf', '50', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 209, 1, '2024-07-15 15:43:40', '2025-06-03 15:22:44', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(67, '0770080009', NULL, 'Hyundai Tucson - 2021', 263000, '21', '346', NULL, 2021, 86000, 'diesel', 'automatique', 'excellent', 'Casablanca', '6', 5, 'WW au Maroc', 'oui', '5z0kZPr8neI', 'P2eG7AC2BLs', 'suv et 4x4', 'vendu', '[]', 'hyundai-tucson-331441.png', 'hyundai-tucson-870292.jpg', 'hyundai-tucson-367551.jpg', 'hyundai-tucson-843639.jpg', 'hyundai-tucson-486050.jpg', 'hyundai-tucson-162577.jpg', 'hyundai-tucson-229506.jpg', 'hyundai-tucson-319784.jpg', 'HYUNDAI-Tucson-117492.pdf', '100', 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 355, 1, '2024-07-18 13:23:21', '2025-10-07 15:57:48', NULL, 0, NULL, 0, NULL, 0, 'Blanc', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(68, '0770080009', NULL, 'Hyundai Tucson - 2022', 355000, 'HYUNDAI', 'Tucson', NULL, 2022, 40000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'q_uq02V4j_0', 'Sxxs7SjEPGs', 'suv et 4x4', 'vendu', NULL, 'hyundai-tucson-656662.png', 'hyundai-tucson-424684.png', 'hyundai-tucson-142138.png', 'hyundai-tucson-377521.png', 'hyundai-tucson-180597.png', 'hyundai-tucson-445000.png', 'hyundai-tucson-670557.png', 'hyundai-tucson-524794.jpg', 'HYUNDAI-Tucson-621007.pdf', '10', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 103, 1, '2024-07-19 12:14:02', '2025-06-20 07:18:15', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(69, '0770080009', NULL, 'Hyundai Tucson - 2024-04', 365000, 'HYUNDAI', 'Tucson', NULL, 2024, 5000, 'diesel', 'automatique', 'neuf', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'Xtm_LWXoSEI', 'cHwqlD7Z1b0', 'suv et 4x4', 'vendu', NULL, 'hyundai-tucson-763398.png', 'hyundai-tucson-714990.jpg', 'hyundai-tucson-387528.png', 'hyundai-tucson-462040.png', 'hyundai-tucson-813969.jpg', 'hyundai-tucson-712935.png', 'hyundai-tucson-466194.png', 'hyundai-tucson-871960.jpg', 'HYUNDAI-Tucson-174325.pdf', '10', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 126, 1, '2024-07-19 15:51:01', '2025-05-21 13:20:05', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(70, '0770080009', NULL, 'Volkswagen Touareg R-line 2022', 690000, 'VOLKSWAGEN', 'Touareg', NULL, 2022, 81000, 'diesel', 'automatique', 'excellent', 'Casablanca', '12', 5, 'WW au Maroc', 'oui', 'RvSwfy5mNAE', '77ymYgT_60c', 'suv et 4x4', 'vendu', NULL, 'volkswagen-touareg-136668.png', 'volkswagen-touareg-623354.png', 'volkswagen-touareg-780660.png', 'volkswagen-touareg-193967.png', 'volkswagen-touareg-869540.png', 'volkswagen-touareg-768710.png', 'volkswagen-touareg-833313.png', 'volkswagen-touareg-892135.jpg', 'VOLKSWAGEN-Touareg-439484.pdf', '100', 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 193, 1, '2024-07-19 16:27:55', '2025-06-05 08:00:28', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(71, '0770080009', NULL, 'Seat Ibiza - 2017', 120000, 'SEAT', 'Ibiza', NULL, 2017, 77000, 'diesel', 'manuelle', 'très bon', 'Casablanca', '6', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'compact', 'vendu', NULL, 'seat-ibiza-708701.png', 'seat-ibiza-495077.png', 'seat-ibiza-920494.png', 'seat-ibiza-440330.png', 'seat-ibiza-910125.png', 'seat-ibiza-910657.png', 'seat-ibiza-548023.png', 'seat-ibiza-764611.jpg', 'SEAT-Ibiza-799137.pdf', '150', 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 287, 1, '2024-07-22 13:41:57', '2025-06-17 19:58:58', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(72, '0707763415', NULL, 'Hyundai I10 - 2012', 63000, 'HYUNDAI', 'I 10', NULL, 2012, 79000, 'essence', 'manuelle', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'zILLt8rMb00', '_DVLYRwrAvo', 'compact', 'vendu', NULL, 'hyundai-i-10-229848.png', 'hyundai-i-10-355037.png', 'hyundai-i-10-384400.png', 'hyundai-i-10-132321.png', 'hyundai-i-10-488922.png', 'hyundai-i-10-630575.png', 'hyundai-i-10-990636.png', 'hyundai-i-10-585486.jpg', 'HYUNDAI-I 10-384556.pdf', '200', 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1956, 1, '2024-07-24 09:07:30', '2025-06-20 14:17:01', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(73, '0770080009', NULL, 'Ford kuga titanium -2016', 178000, 'FORD', 'Kuga', NULL, 2016, 113000, 'diesel', 'manuelle', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', 'D4Qi2hU9AMs', 'Ay22yb_tZuQ', 'suv et 4x4', 'vendu', NULL, 'ford-kuga-170407.png', 'ford-kuga-956196.png', 'ford-kuga-223362.png', 'ford-kuga-962169.png', 'ford-kuga-695504.png', 'ford-kuga-909535.png', 'ford-kuga-290054.png', 'ford-kuga-657582.jpg', 'FORD-Kuga-171886.pdf', '120', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 466, 1, '2024-07-27 11:36:17', '2025-06-17 15:28:02', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(74, '0770080009', NULL, 'Hyundai Tucson - 2017', 210000, 'HYUNDAI', 'Tucson', NULL, 2017, 126000, 'diesel', 'automatique', 'excellent', 'Casablanca', '6', 5, 'WW au Maroc', 'oui', 'Pl6rHABhQNo', 'm2VR2mqNsP8', 'suv et 4x4', 'vendu', NULL, 'hyundai-tucson-657727.png', 'hyundai-tucson-614200.png', 'hyundai-tucson-664618.png', 'hyundai-tucson-789923.png', 'hyundai-tucson-975422.png', 'hyundai-tucson-510393.png', 'hyundai-tucson-719624.png', 'hyundai-tucson-762049.jpg', 'HYUNDAI-Tucson-934536.pdf', '100', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 370, 1, '2024-07-30 13:20:07', '2025-06-18 06:43:09', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(75, '0770080009', NULL, 'Jeep wrangler sahara - 2018', 340000, 'JEEP', 'Wrangler', NULL, 2018, 32000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '11', 2, 'WW au Maroc', 'oui', 'tdWv_qwErFw', '-AIs7kPxcG4', 'suv et 4x4', 'vendu', '[\"\"]', 'jeep-wrangler-463901.png', 'jeep-wrangler-196075.png', 'jeep-wrangler-768613.png', 'jeep-wrangler-238232.png', 'jeep-wrangler-549503.png', 'jeep-wrangler-165372.png', 'jeep-wrangler-138970.png', 'jeep-wrangler-828971.jpg', 'JEEP-Wrangler-294242.pdf', '10', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 262, 1, '2024-08-03 13:45:59', '2025-06-19 22:16:06', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `annonces` (`id`, `phone`, `pack_id`, `titre`, `prix`, `mark`, `modele`, `matricule`, `year`, `km`, `carburant`, `box`, `etat`, `city`, `cv`, `nb_Door`, `origine`, `premiere_main`, `video`, `reel`, `bodywork`, `status`, `images`, `image`, `imgrleft`, `imgrtop`, `imgrmed`, `imgrbottom`, `imgrright`, `imginterior`, `imgrapport`, `rapport`, `co2`, `certifie`, `particulie`, `showroom`, `finance`, `jantesA`, `airbags`, `climatisation`, `gps`, `toit_ouvrant`, `double_toit_ouvrant`, `siege_cuir`, `radar_recul`, `camera_recul`, `vitreselec`, `abs`, `eps`, `rv`, `lv`, `cd`, `ordinateur`, `verrouillage`, `garantie`, `views`, `active`, `created_at`, `updated_at`, `deleted_at`, `verified`, `featured_position`, `show_in_homepage`, `homepage_position`, `is_homepage`, `colors`, `esp`, `antipatinage`, `aide_freinage_urgence`, `antidemarrage_electronique`, `aide_demarrage_cote`, `selecteur_mode_conduite`, `detection_fatigue`, `maintien_dans_la_voie`, `detecteur_angle_mort`, `detecteur_sous_gonflage`, `fermeture_portes_auto`, `preparation_isofix`, `phares_antibrouillard`, `systeme_alarme`, `start_stop`, `regulateur_vitesse`, `detecteur_pluie`, `allumage_auto_feux`, `frein_main_electrique`, `aide_stationnement`, `volant_reglable`, `retros_electriques`, `retros_rabat_electriques`, `coffre_electrique`, `sieges_electriques`, `sieges_elec_memoire`, `banquette_rabattable`, `ecran_tactile`, `cockpit_digital`, `commandes_volant`, `commandes_vocales`, `reconnaissance_panneaux`, `affichage_tete_haute`, `systeme_audio`, `wifi_bord`, `bluetooth`, `compatibilite_smartphone`, `apple_carplay_android_auto`, `chargeur_sans_fil`, `sellerie_similicuir_tissu`, `volant_cuir`, `follow_me_home`, `lumiere_ambiance`, `feux_jour_led`, `phares_full_led`, `toit_panoramique`, `barres_de_toit`, `vitres_surteintees`) VALUES
(76, '0770080009', NULL, 'Hyundai Tucson - 2017-08', 250000, 'HYUNDAI', 'Tucson', NULL, 2017, 150000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '7', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'vendu', '[\"\"]', 'hyundai-tucson-560329.png', 'hyundai-tucson-589652.png', 'hyundai-tucson-449172.png', 'hyundai-tucson-527632.png', 'hyundai-tucson-155140.png', 'hyundai-tucson-888690.png', 'hyundai-tucson-923613.png', 'hyundai-tucson-966246.jpg', 'HYUNDAI-Tucson-373061.pdf', '100', 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 269, 1, '2024-08-07 10:57:50', '2025-06-11 12:33:24', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(77, '0770080009', NULL, 'TOYOTA Yaris -2019', 125000, 'TOYOTA', 'Yaris', NULL, 2019, 12000, 'essence', 'manuelle', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'compact', 'réserve', '[\"toyota-yaris-275558.png\"]', '', 'toyota-yaris-857513.png', 'toyota-yaris-681230.png', 'toyota-yaris-226031.png', 'toyota-yaris-247473.png', 'toyota-yaris-375851.png', 'toyota-yaris-797570.png', 'toyota-yaris-108027.jpg', 'TOYOTA-Yaris-602960.pdf', '100', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 381, 1, '2024-08-09 11:17:44', '2025-10-08 13:14:38', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78, '0606323211', NULL, 'dacia logan', 12000, 'DACIA', 'Sandero Stepway', NULL, 2010, 1254888, 'essence', 'manuelle', 'très bon', 'Salé', '4', 3, 'WW au Maroc', 'non', 'qvg0IpbcHVc', 'qvg0IpbcHVc', 'suv et 4x4', 'réserve', '[\"\"]', 'dacia-sandero-stepway-216873.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2024-08-13 19:18:43', '2024-08-13 19:18:50', '2024-08-13 19:18:50', 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79, '0770080009', NULL, 'Hyundai Tucson - 2022', 330000, 'HYUNDAI', 'Tucson', NULL, 2022, 73000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'QwOngJHoAGo', 'Jk0MbBcmmWo', 'suv et 4x4', 'vendu', '[\"\"]', 'hyundai-tucson-216961.png', 'hyundai-tucson-932019.png', 'hyundai-tucson-456060.png', 'hyundai-tucson-241317.png', 'hyundai-tucson-850801.png', 'hyundai-tucson-458739.jpg', 'hyundai-tucson-985719.jpg', 'hyundai-tucson-962780.jpg', 'HYUNDAI-Tucson-851354.pdf', '10', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 188, 1, '2024-08-14 07:35:55', '2025-06-01 10:53:30', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(80, '0770080009', NULL, 'Volkswagen golf 7 - 2019', 215000, 'VOLKSWAGEN', 'Golf 7', NULL, 2019, 119000, 'diesel', 'automatique', 'très bon', 'Casablanca', '8', 5, 'WW au Maroc', 'oui', '_v-ShVUpD-o', 'MuHUvfgk2a4', 'compact', 'vendu', '[\"\"]', 'volkswagen-golf-7-238807.png', 'volkswagen-golf-7-488847.png', 'volkswagen-golf-7-160530.png', 'volkswagen-golf-7-352091.png', 'volkswagen-golf-7-130105.png', 'volkswagen-golf-7-318736.png', 'volkswagen-golf-7-440477.png', 'volkswagen-golf-7-170455.jpg', 'VOLKSWAGEN-Golf 7-738942.pdf', '100', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 526, 1, '2024-08-17 10:51:15', '2025-06-21 05:20:03', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(81, '0707763415', NULL, 'AUDI Q5 - 2021', 470000, 'AUDI', 'Q5', NULL, 2021, 47000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'non', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'vendu', '[\"\"]', 'audi-q5-546966.png', 'audi-q5-324477.png', 'audi-q5-230450.png', 'audi-q5-874711.png', 'audi-q5-427600.png', 'audi-q5-292714.png', 'audi-q5-797265.png', 'audi-q5-993463.jpg', 'AUDI-Q5-108472.pdf', '100', 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 190, 1, '2024-09-04 07:08:20', '2025-06-09 19:24:12', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(82, '0770080009', NULL, 'BMW Série5 -2018', 300000, 'BMW', 'Série 5', NULL, 2018, 118000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', 'xBndkM-UGlk', 'W0yv_Lo1gfM', 'berline', 'vendu', '[\"bmw-serie-5-773006.png\"]', '', 'bmw-serie-5-358113.png', 'bmw-serie-5-934216.png', NULL, 'bmw-serie-5-379210.png', 'bmw-serie-5-839926.png', 'bmw-serie-5-854373.png', 'bmw-serie-5-906312.jpg', 'BMW-Série 5-524936.pdf', '100', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 453, 1, '2024-09-05 14:58:41', '2025-06-16 17:29:39', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(83, '0770080009', NULL, 'Nissan Qashqai-2019-12', 230000, 'NISSAN', 'Qashqai', NULL, 2019, 51000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'jQaknrM2fYA', 'HgiZ9r2j0G8', 'suv et 4x4', 'vendu', '[\"\"]', 'nissan-qashqai-853307.png', 'nissan-qashqai-689487.png', 'nissan-qashqai-914406.png', 'nissan-qashqai-736011.png', 'nissan-qashqai-155704.png', 'nissan-qashqai-918686.png', 'nissan-qashqai-695214.png', 'nissan-qashqai-240266.jpg', 'NISSAN-Qashqai-589005.pdf', '100', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 137, 1, '2024-09-06 13:30:10', '2024-09-21 12:00:12', '2024-09-21 12:00:12', 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(84, '0770080009', NULL, 'Hyundai Tucson - 2022', 310000, 'HYUNDAI', 'Tucson', NULL, 2022, 90000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'DL-WynUxH_A', '8xxHoHtLgtw', 'suv et 4x4', 'vendu', '[\"\"]', 'hyundai-tucson-641701.png', 'hyundai-tucson-544974.png', 'hyundai-tucson-542965.png', 'hyundai-tucson-934980.png', 'hyundai-tucson-550894.png', 'hyundai-tucson-595025.png', 'hyundai-tucson-764173.png', 'hyundai-tucson-432846.jpg', 'HYUNDAI-Tucson-710197.pdf', '50', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 160, 1, '2024-09-06 15:17:46', '2025-05-23 12:13:48', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(85, '0707763415', NULL, 'BMW X5 -2019', 190000, 'BMW', 'X5', NULL, 2014, 280000, 'diesel', 'automatique', 'très bon', 'Casablanca', '12', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'vendu', '[\"\"]', 'bmw-x5-726085.png', 'bmw-x5-611745.png', 'bmw-x5-596476.png', 'bmw-x5-189183.png', 'bmw-x5-626772.png', 'bmw-x5-879790.png', 'bmw-x5-223565.png', 'bmw-x5-936981.jpg', 'BMW-X5-784145.pdf', '100', 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 249, 1, '2024-09-18 08:56:07', '2025-06-18 14:26:54', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(86, '0770080009', NULL, 'Renault Clio 4 - 2020', 130000, 'RENAULT', 'Clio', NULL, 2020, 56000, 'diesel', 'manuelle', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'compact', 'vendu', '[\"\"]', 'renault-clio-350876.png', 'renault-clio-784766.png', 'renault-clio-221409.png', 'renault-clio-102390.png', 'renault-clio-813974.png', 'renault-clio-248462.png', 'renault-clio-942640.png', 'renault-clio-502770.png', 'RENAULT-Clio-768156.pdf', '90', 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 211, 1, '2024-09-18 10:13:16', '2025-06-11 08:12:41', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(87, '0770080009', NULL, 'Seat Ibiza - 2017', 330000, 'ABARTH', '124 Spider', NULL, 2008, 73000, 'essence', 'manuelle', 'correct', 'Rabat', '17', 3, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'disponible', '[\"\"]', 'abarth-124-spider-887244.png', NULL, NULL, NULL, NULL, NULL, NULL, 'abarth-124-spider-961577.jpg', 'ABARTH-124 Spider-932293.pdf', '10', 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, '2024-09-20 09:21:12', '2024-09-20 09:26:05', '2024-09-20 09:26:05', 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(88, '0687855003', NULL, 'opel astra - 2021', 125000, 'OPEL', 'Astra', NULL, 2021, 210000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'disponible', NULL, 'opel-astra-246668.png', NULL, NULL, NULL, NULL, NULL, NULL, 'opel-astra-705895.jpg', 'OPEL-Astra-311647.pdf', '10', 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1, '2024-09-20 10:07:47', '2024-09-20 10:16:16', '2024-09-20 10:16:16', 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(89, '0770080009', NULL, 'TOYOTA C-CHR - 2020', 240000, 'TOYOTA', 'C-HR', NULL, 2020, 13000, 'hybride', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'vendu', NULL, 'toyota-c-hr-810773.png', NULL, NULL, NULL, NULL, NULL, NULL, 'toyota-c-hr-976978.jpg', 'TOYOTA-C-HR-912953.pdf', '90', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 118, 1, '2024-09-20 15:57:26', '2025-06-10 11:33:37', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(90, '0770080009', NULL, 'Land Rover Discovery sport - 2019 - Location', 240000, 'LAND ROVER', 'Discovery Sport', NULL, 2019, 182000, 'diesel', 'automatique', 'excellent', 'Casablanca', '8', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'tb0Asb9NBJU', 'suv et 4x4', 'vendu', NULL, 'land-rover-discovery-sport-546772.png', NULL, NULL, NULL, NULL, NULL, NULL, 'land-rover-discovery-sport-597357.jpg', 'LAND ROVER-Discovery Sport-555374.pdf', '100', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 223, 1, '2024-09-21 15:20:33', '2025-06-16 19:39:08', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(91, '0770080009', NULL, 'Land Rover bb velar - 2019 - Location', 380000, 'LAND ROVER', 'Velar', NULL, 2019, 156000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', 'yP7_sGplLVE', 'C5WeTyWjYY0', 'suv et 4x4', 'vendu', NULL, 'land-rover-velar-221639.png', 'land-rover-velar-435526.png', 'land-rover-velar-725210.png', 'land-rover-velar-579065.png', 'land-rover-velar-210461.png', 'land-rover-velar-462792.png', 'land-rover-velar-829371.png', 'land-rover-velar-273229.jpg', 'LAND ROVER-Velar-605631.pdf', '100', 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 183, 1, '2024-09-25 13:46:12', '2025-06-15 22:39:35', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(92, '0770080009', NULL, 'Peugeot 3008 ALLURE - 2021', 275000, 'PEUGEOT', '3008', NULL, 2021, 104000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', 'W-oRS_dMYcc', 'h1re-yTvMIE', 'suv et 4x4', 'vendu', NULL, 'peugeot-3008-855070.png', 'peugeot-3008-488665.png', 'peugeot-3008-695003.png', 'peugeot-3008-402077.png', 'peugeot-3008-460106.png', 'peugeot-3008-970316.png', 'peugeot-3008-152766.png', 'peugeot-3008-204534.jpg', 'PEUGEOT-3008-316231.pdf', '90', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 146, 1, '2024-09-28 08:31:10', '2025-06-21 05:27:48', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(93, '0770080009', NULL, 'Land Rover Evoque - 2016', 220000, 'LAND ROVER', 'Range Rover Evoque', NULL, 2016, 87000, 'diesel', 'automatique', 'excellent', 'Casablanca', '9', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'vendu', NULL, 'land-rover-range-rover-evoque-604691.png', 'land-rover-range-rover-evoque-604388.png', 'land-rover-range-rover-evoque-695579.png', 'land-rover-range-rover-evoque-741553.png', 'land-rover-range-rover-evoque-355861.png', 'land-rover-range-rover-evoque-155474.png', 'land-rover-range-rover-evoque-426415.png', 'land-rover-range-rover-evoque-507906.jpg', 'LAND ROVER-Range Rover Evoque-795406.pdf', '200', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 234, 1, '2024-09-28 12:55:01', '2025-06-21 13:37:51', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(94, '0770080009', NULL, 'Renault Clio 4 - 2019', 128000, 'RENAULT', 'Clio', NULL, 2019, 115000, 'diesel', 'automatique', 'très bon', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'compact', 'vendu', NULL, 'renault-clio-181395.png', 'renault-clio-790303.png', 'renault-clio-384414.png', 'renault-clio-715555.png', 'renault-clio-355226.png', 'renault-clio-273270.png', NULL, 'renault-clio-607714.jpg', 'RENAULT-Clio-591869.pdf', '122', 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 355, 1, '2024-10-02 15:27:52', '2025-06-11 09:08:16', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(95, '0770080009', NULL, 'hyundai tucson 2023', 285000, 'HYUNDAI', 'Tucson', NULL, 2023, 67000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'sHgQ7YInOuY', 'l5i-MubyZmc', 'suv et 4x4', 'vendu', NULL, 'hyundai-tucson-647315.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '100', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 199, 1, '2024-10-10 13:40:29', '2025-06-05 16:12:10', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(96, '0770080009', NULL, 'LAND ROVER Evoque Dynamique20', 265000, 'LAND ROVER', 'Evoque', NULL, 2018, 127000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '9', 6, 'WW au Maroc', 'non', 'Zt49jxsKNlQ', 'Zt49jxsKNlQ', 'suv et 4x4', 'vendu', NULL, 'land-rover-range-rover-evoque-369474.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '100', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 687, 1, '2024-10-10 14:13:02', '2025-06-21 01:05:13', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(97, '0770080009', NULL, 'Range Rover Evoque Dynamique 2018', 265000, 'LAND ROVER', 'Range Rover Evoque', NULL, 2018, 125000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '9', 5, 'WW au Maroc', 'oui', 'Zt49jxsKNlQ/edit', 'Zt49jxsKNlQ/edit', 'suv et 4x4', 'disponible', NULL, 'land-rover-range-rover-evoque-670552.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '100', 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 4, 1, '2024-10-12 14:22:03', '2024-10-12 14:56:24', '2024-10-12 14:56:24', 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(98, '0770080009', NULL, 'DACIA DUSTER -2022', 200000, 'DACIA', 'Duster', NULL, 2022, 90000, 'essence', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', '6SBrRyb57EQ', '6SBrRyb57EQ', 'suv et 4x4', 'vendu', NULL, 'dacia-duster-805789.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '100', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 63, 1, '2024-10-18 10:03:16', '2025-06-08 01:40:41', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99, '0770080009', NULL, 'FIAT 500 BVA 2022 ESSENCE', 130000, 'FIAT', '500', NULL, 2022, 33000, 'essence', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '7', 3, 'WW au Maroc', 'oui', 'y9yftlJqGmM', 'Lkbmt5FvYC4', 'citadine', 'vendu', NULL, 'fiat-500-638409.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 186, 1, '2024-10-21 08:44:40', '2025-06-21 12:38:50', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(100, '0770080009', NULL, 'Mercedes-Benz classe GLC  - 2019 - D09/2024', 650000, 'MERCEDES', 'Classe GLC', NULL, 2019, 118000, 'diesel', 'automatique', 'excellent', 'Béni Mellal', '8', 5, 'dédouané', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'vendu', NULL, 'mercedes-classe-glc-461264.png', 'mercedes-classe-glc-528921.png', 'mercedes-classe-glc-132110.png', 'mercedes-classe-glc-669534.png', 'mercedes-classe-glc-479210.png', 'mercedes-classe-glc-394051.png', 'mercedes-classe-glc-211037.png', 'mercedes-classe-glc-718489.jpg', 'MERCEDES-Classe GLC-536808.pdf', '100', 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 121, 1, '2024-10-23 12:37:10', '2025-06-17 12:47:49', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(101, '0770080009', NULL, 'Volkswagen Touareg 2019', 237000, 'VOLKSWAGEN', 'Touareg', NULL, 2019, 106000, 'diesel', 'automatique', 'excellent', 'Casablanca', '12', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'vendu', NULL, 'volkswagen-touareg-344535.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VOLKSWAGEN-Touareg-404736.pdf', '100', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 181, 1, '2024-11-04 13:23:53', '2025-06-19 23:16:43', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(102, '0770080009', NULL, 'Hyundai creta  - 2022', 230000, 'HYUNDAI', 'Creta', NULL, 2022, 69000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', '6mQvsMa3rJU', 'OgJJvXwl-4s', 'suv et 4x4', 'vendu', NULL, 'hyundai-creta-575648.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HYUNDAI-Creta-925059.pdf', '20', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 364, 1, '2024-11-12 15:31:28', '2025-06-16 11:45:12', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(103, '0770080009', NULL, 'Volkswagen Tiguan 2018', 305000, 'VOLKSWAGEN', 'Tiguan', NULL, 2018, 100000, 'diesel', 'automatique', 'excellent', 'Casablanca', '8', 5, 'WW au Maroc', 'oui', 'iGX4X2K8wt4', 'LSnUzX6dW28', 'suv et 4x4', 'vendu', NULL, 'volkswagen-tiguan-291214.png', 'volkswagen-tiguan-107859.png', 'volkswagen-tiguan-645597.png', 'volkswagen-tiguan-286738.png', 'volkswagen-tiguan-141817.png', 'volkswagen-tiguan-489323.png', NULL, 'volkswagen-tiguan-239389.jpg', 'VOLKSWAGEN-Tiguan-770033.pdf', '50', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 339, 1, '2024-11-20 13:23:34', '2025-06-17 13:18:41', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(104, '0770080009', NULL, 'BMW X5 -2017', 280000, 'BMW', 'X5', NULL, 2017, 186000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', '0WVBRaNmZj0', 'X4b2AYKwO-k', 'suv et 4x4', 'vendu', NULL, 'bmw-x5-106165.png', 'bmw-x5-267399.png', 'bmw-x5-743813.png', 'bmw-x5-692051.png', 'bmw-x5-366346.png', NULL, 'bmw-x5-314420.png', 'bmw-x5-298210.jpg', 'BMW-X5-752479.pdf', '10', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 357, 1, '2024-11-21 12:59:59', '2025-06-19 23:13:23', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(105, '0770080009', NULL, 'Renault Captur - 2021', 195000, 'RENAULT', 'Captur', NULL, 2021, 49000, 'diesel', 'manuelle', 'très bon', 'Casablanca', '6', 5, 'WW au Maroc', 'oui', 'iZ5iSGkRFLU', 'dZlZDHc-z3Q', 'suv et 4x4', 'vendu', NULL, 'renault-captur-652692.png', 'renault-captur-902259.png', 'renault-captur-482302.png', 'renault-captur-911177.png', 'renault-captur-705868.png', 'renault-captur-396912.png', NULL, 'renault-captur-582342.jpg', 'RENAULT-Captur-855816.pdf', '50', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 325, 1, '2024-11-22 14:55:11', '2025-06-21 10:19:26', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(106, '0770080009', NULL, 'Audi Q3 S LIGNE QUATTRO  2019 BVA', 315000, 'AUDI', 'Q3', NULL, 2019, 76000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'non', '9-sHnc1dXpw', 'y8n9BlfSUw4', 'suv et 4x4', 'vendu', NULL, 'audi-q3-626722.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 230, 1, '2024-11-27 11:37:20', '2025-06-19 22:15:46', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(107, '0770080009', NULL, 'Hyundai Tucson - 2022', 300000, 'HYUNDAI', 'Tucson', NULL, 2022, 71000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'F7ur11MCtLA', 'F7ur11MCtLA', 'suv et 4x4', 'vendu', NULL, 'hyundai-tucson-170660.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 232, 1, '2024-12-04 11:24:28', '2025-06-14 16:23:35', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(108, '0770080009', NULL, 'CITROEN C4 X - 2023', 205000, 'CITROEN', 'C4x', NULL, 2023, 41000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 4, 'WW au Maroc', 'oui', '2hG3jegw8FA', 'nxOx4hkzR40', 'compact', 'vendu', NULL, 'citroen-c4x-898928.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 182, 1, '2024-12-04 14:41:52', '2025-06-14 08:12:38', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(109, '0770080009', NULL, 'CITROEN C5 AIR CROSS 2.0 EAT8 - 2020', 215000, 'CITROEN', 'C5 Aircross', NULL, 2020, 100000, 'diesel', 'automatique', 'très bon', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', '70cIRohmP6g', 'suv et 4x4', 'disponible', '[\"citroen-c5-aircross-238150.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 240, 1, '2024-12-05 10:14:36', '2025-06-20 17:31:06', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(110, '0770080009', NULL, 'Skoda KODIAQ - 2020', 270000, 'SKODA', 'Kodiaq', NULL, 2020, 101000, 'diesel', 'automatique', 'bon', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'vendu', NULL, 'skoda-kodiaq-122963.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 110, 1, '2024-12-14 08:44:47', '2025-06-19 23:12:53', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(111, '0770080009', NULL, 'BMW Série 2 Grand Coupé -2023', 430000, 'BMW', 'Série 2 Gran Coupé', NULL, 2023, 60000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', 'bixLsvAyrhs', 'JKJeiyQ-CdI', 'berline', 'vendu', NULL, 'bmw-serie-2-gran-coupe-690903.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 114, 1, '2024-12-17 08:41:21', '2025-06-16 05:00:35', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(112, '770080009', NULL, 'Renault Clio 5 - 2023', 175000, 'RENAULT', 'Clio', NULL, 2023, 56000, 'diesel', 'manuelle', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'DxQ6Ii3wQQE', '8VID1lCptOg', 'citadine', 'vendu', NULL, 'renault-clio-566723.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 80, 1, '2024-12-18 08:09:19', '2025-06-16 23:51:37', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(113, '070080009', NULL, 'BMW Série5 -2012', 180000, 'BMW', 'Série 5', NULL, 2012, 144000, 'diesel', 'automatique', 'bon', 'Casablanca-Jnane Californie', '12', 4, 'dédouané', 'non', '3Vz14Eb3-7E', 'ZvBlN9insYQ', 'berline', 'vendu', '[\"bmw-serie-5-251211.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 138, 1, '2024-12-19 09:31:06', '2025-06-18 14:25:35', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(114, '0770080009', NULL, 'Mercedes-Benz GLC Coupé 220 AMG LINE', 560000, 'MERCEDES', 'Classe GLC Coupé', NULL, 2019, 107000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'dédouané', 'oui', '3Vz14Eb3-7E', 'ei5f555tvaM', 'coupé cabriolet', 'vendu', NULL, 'mercedes-classe-gle-coupe-271594.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 103, 1, '2024-12-23 14:15:37', '2025-06-21 02:17:56', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(115, '0770080009', NULL, 'BMW Série 3 M édition -2019', 450000, '4', '10', NULL, 2019, 100000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 4, 'importé neuf', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'berline', 'vendu', '[\"bmw-serie-3-212622.jpg\n\"]', 'bmw-serie-3-212622.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 92, 1, '2024-12-26 11:56:06', '2025-09-26 15:45:55', NULL, 0, NULL, 0, NULL, 0, 'Blanc', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(116, '0770080009', NULL, 'CITROEN C5 AIR CROSS - 2023', 270000, 'CITROEN', 'C5 Aircross', NULL, 2023, 49000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'disponible', '[\"citroen-c5-aircross-665263.jpg\n\"]', 'citroen-c5-aircross-665263.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, '2024-12-27 15:57:53', '2024-12-27 15:58:30', '2024-12-27 15:58:30', 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(117, '0770080009', NULL, 'CITROEN C5 AIR CROSS - 2023', 270000, 'CITROEN', 'C5 Aircross', NULL, 2023, 49000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', '4bDOOcdHWb4', 'VeoHQTbVKDw', 'suv et 4x4', 'vendu', '[\"citroen-c5-aircross-244962.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 201, 1, '2024-12-27 15:58:05', '2025-06-20 06:52:20', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(118, '0770080009', NULL, 'OPEL ASTRA 2021 - ELEGANCE', 190000, 'OPEL', 'Astra', NULL, 2021, 75000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'compact', 'vendu', NULL, 'opel-astra-718394.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 'opel-astra-602870.jpeg', NULL, NULL, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 109, 1, '2025-01-09 10:08:05', '2025-06-12 12:02:18', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(119, '0770080009', NULL, 'FIAT TIPO Hatchback 2018- Automatique', 145000, 'FIAT', 'Tipo Hatchback', NULL, 2018, 86000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'EohqMrAzINU', 'EohqMrAzINU', 'compact', 'vendu', NULL, 'fiat-tipo-hatchback-395817.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 223, 1, '2025-01-13 10:35:12', '2025-06-16 21:56:41', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(120, '0770080009', NULL, 'KIA SPORTAGE - 2020', 200000, 'KIA', 'SPORTAGE', NULL, 2020, 115000, 'diesel', 'automatique', 'très bon', 'Casablanca', '8', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'vendu', '[\"kia-sportage-492578.jpg\n\"]', 'kia-sportage-492578.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 82, 1, '2025-01-20 15:13:01', '2025-06-13 06:33:43', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(121, '0770080009', NULL, 'PORSCHE MACAN - 2021', 580000, 'PORSCHE', 'Macan', NULL, 2021, 67000, 'essence', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '11', 5, 'WW au Maroc', 'non', '3Vz14Eb3-7E', 'MuHUvfgk2a4', 'suv et 4x4', 'disponible', '[\"porsche-macan-708521.jpg\"]', '', 'porsche-macan-438739.jpg', 'porsche-macan-887414.jpg', 'porsche-macan-899504.jpg', 'porsche-macan-153284.jpg', 'porsche-macan-714430.jpg', 'porsche-macan-302758.jpg', NULL, NULL, '228', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 5, 1, '2025-01-21 12:50:25', '2025-01-21 13:11:08', '2025-01-21 13:11:08', 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(122, '0770080009', NULL, 'PORSCHE MACAN - 2021', 580000, 'PORSCHE', 'Macan', NULL, 2021, 67000, 'essence', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '11', 5, 'WW au Maroc', 'oui', 'GkxOxb4MdLY', 'fk0Q6IG4ASo', 'suv et 4x4', 'disponible', '[\"porsche-macan-999187.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '228', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 290, 1, '2025-01-21 13:17:48', '2025-09-17 18:07:03', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(123, '0770080009', NULL, 'FORD MUSTANG 2.3 ECO BOOST CABRIOLET', 410000, 'FORD', 'Mustang Cabriolet', NULL, 2022, 66000, 'essence', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '11', 2, 'dédouané', 'non', 'EDzFK1lOb-E', 'EDzFK1lOb-E', 'coupé cabriolet', 'vendu', '[\"ford-mustang-cabriolet-796374.jpg\n\"]', 'ford-mustang-cabriolet-796374.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 157, 1, '2025-02-03 10:09:59', '2025-06-16 13:56:30', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(124, '0770080009', NULL, 'TESLA Model 3 2023- Ded 2025', 490000, 'TESLA', 'Model 3', NULL, 2023, 12000, 'electrique', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '2', 5, 'dédouané', 'oui', 'DZ1ULMDss8g', 'DZ1ULMDss8g', 'compact', 'vendu', '[\"tesla-model-3-532777.jpg\n\"]', 'tesla-model-3-532777.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 144, 1, '2025-02-07 15:26:04', '2025-06-14 23:10:10', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(125, '0770080009', NULL, 'NISSAN QASHQAI 2018', 200000, 'NISSAN', 'Qashqai', NULL, 2018, 80000, 'diesel', 'manuelle', 'très bon', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', '5BWs9NF7OCI', 'suv et 4x4', 'vendu', '[\"nissan-qashqai-884503.png\n\"]', 'nissan-qashqai-884503.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 155, 1, '2025-02-08 13:56:56', '2025-06-18 18:36:36', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(126, '0770080009', NULL, 'FIAT PANDA 2019', 83000, 'FIAT', 'Panda', NULL, 2019, 99000, 'essence', 'manuelle', 'très bon', 'Casablanca-Jnane Californie', '7', 5, 'WW au Maroc', 'oui', 'PxtufTkaO8w', 'b_QXHwDPi4U', 'citadine', 'vendu', '[\"fiat-panda-636711.png\n\"]', 'fiat-panda-636711.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 120, 1, '2025-02-08 14:50:32', '2025-08-14 19:58:00', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(127, '0770080009', NULL, 'Peugeot 3008- 2020  2.0  Allure BVA', 235000, 'PEUGEOT', '3008', NULL, 2020, 127000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', 'AdFplN2H6Tc', 'MuHUvfgk2a4', 'suv et 4x4', 'vendu', '[\"peugeot-3008-301042.jpg\n\"]', 'peugeot-3008-301042.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 211, 1, '2025-02-15 16:58:22', '2025-06-18 22:06:36', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(128, '0770080009', NULL, 'JEEP CHEROKEE Limited 4x4- 2018', 195000, '24', '388', NULL, 2018, 145000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '9', 5, 'WW au Maroc', 'oui', 'SYiZDBtf5LE', '27rR7y_olvA', 'suv et 4x4', 'vendu', '[]', 'jeep-cherokee-469291.jpg', 'jeep-cherokee-916664.JPG', 'jeep-cherokee-300377.JPG', NULL, 'jeep-cherokee-126986.JPG', 'jeep-cherokee-594918.JPG', 'jeep-cherokee-663789.JPG', NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 165, 1, '2025-02-28 11:34:13', '2025-09-26 22:07:36', NULL, 0, NULL, 0, NULL, 0, 'Blanc', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(129, '0770080009', NULL, 'JEEP Compass 2.0 MultiJet 140 Longitude 4x4', 240000, 'JEEP', 'Compass', NULL, 2020, 52000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', 'KUVG7DKGYmQ', 'JoIysamDF00', 'suv et 4x4', 'vendu', '[\"jeep-compass-981890.jpg\n\"]', 'jeep-compass-981890.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 293, 1, '2025-03-01 20:14:42', '2025-06-19 11:51:59', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(130, '0770080009', NULL, 'Mercedes-Benz classe C  200 d - 2019', 380000, 'MERCEDES', 'Classe C', NULL, 2019, 135000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 4, 'dédouané', 'oui', 'FQmXv-lhS3A', 'VVbC_E3RRu8', 'berline', 'vendu', '[\"mercedes-classe-c-235404.jpg\n\"]', 'mercedes-classe-c-235404.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 326, 1, '2025-03-05 13:43:18', '2025-06-21 07:33:35', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(131, '0770080009', NULL, 'Mercedes-Benz GLC Coupé 2017 DD 2021 AMG LINE', 530000, 'MERCEDES', 'Classe GLC Coupé', NULL, 2017, 180000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '12', 5, 'WW au Maroc', 'oui', '27jOV816xwQ', 'HxcxujL5Zmk', 'suv et 4x4', 'vendu', '[\"mercedes-classe-glc-coupe-393122.jpg\n\"]', 'mercedes-classe-glc-coupe-393122.jpg', 'mercedes-classe-glc-coupe-530407.jpg', 'mercedes-classe-glc-coupe-861084.jpg', 'mercedes-classe-glc-coupe-881233.JPG', 'mercedes-classe-glc-coupe-644287.jpg', 'mercedes-classe-glc-coupe-256583.jpg', 'mercedes-classe-glc-coupe-695172.jpg', NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 100, 1, '2025-03-20 13:48:55', '2025-06-16 23:50:58', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(132, '0770080009', NULL, 'JEEP WRANGLER SAHARA UNLIMITED- 2016', 250000, 'JEEP', 'Wrangler', NULL, 2016, 200000, 'diesel', 'automatique', 'excellent', 'Casablanca', '11', 5, 'WW au Maroc', 'oui', '2QqSWlotUfA', 'KAriMQpmuyE', 'suv et 4x4', 'vendu', '[\"jeep-wrangler-775285.jpg\n\"]', 'jeep-wrangler-775285.jpg', 'jeep-wrangler-913548.jpg', 'jeep-wrangler-171486.jpg', 'jeep-wrangler-783549.jpg', 'jeep-wrangler-597280.JPG', 'jeep-wrangler-887221.JPG', 'jeep-wrangler-617294.jpg', NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 256, 1, '2025-03-20 15:22:23', '2025-08-15 10:03:36', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(133, '0770080009', NULL, 'TESLA Model 3 2021- Ded 2025', 380000, 'TESLA', 'Model 3', NULL, 2021, 164000, 'electrique', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 4, 'dédouané', 'oui', 'hH48FGjNEGY', 'Ru5FgiCmCs8', 'berline', 'disponible', '[\"tesla-model-3-291482.jpg\"]', '', NULL, 'tesla-model-3-585913.jpg', NULL, 'tesla-model-3-364918.jpg', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 374, 1, '2025-03-25 16:13:33', '2025-09-26 21:05:06', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(134, '0770080009', NULL, 'Peugeot 3008- ALLURE 2019', 230000, 'PEUGEOT', '3008', NULL, 2019, 120000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', 'IkBPV82BLJs', 'VBklTlLCA40', 'suv et 4x4', 'vendu', '[\"peugeot-3008-269676.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 119, 1, '2025-03-26 23:16:18', '2025-06-15 09:01:02', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(135, '0770080009', NULL, 'JEEP WRANGLER SAHARA 2 Portes- 2016', 300000, 'JEEP', 'Wrangler', NULL, 2016, 129000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '11', 3, 'WW au Maroc', 'oui', 'SOAfx2dJ02g', '_k7whpj6buo', 'suv et 4x4', 'disponible', '[\"jeep-wrangler-593754.jpg\"]', '', 'jeep-wrangler-387865.JPG', 'jeep-wrangler-756865.JPG', 'jeep-wrangler-326290.JPG', 'jeep-wrangler-226724.JPG', 'jeep-wrangler-483920.JPG', 'jeep-wrangler-528162.JPG', NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 119, 1, '2025-04-08 11:48:09', '2025-08-12 14:52:19', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(136, '0770080009', NULL, 'Mercedes-Benz classe GLA  200 d - 2024', 495000, 'MERCEDES', 'Classe GLA', NULL, 2024, 23000, 'diesel', 'automatique', 'neuf', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', 'MZXnb4aH7JM', '0ph87fuhSms', 'suv et 4x4', 'vendu', '[\"mercedes-classe-gla-510876.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 162, 1, '2025-04-08 17:19:01', '2025-06-20 16:59:39', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(137, '0770080009', NULL, 'JEEP Wrangler SAHARA 2021', 500000, 'JEEP', 'Wrangler', NULL, 2021, 100000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '9', 5, 'WW au Maroc', 'oui', 'N4Mu3JlEjtc', 'JgGQjXBDOms', 'suv et 4x4', 'disponible', '[\"jeep-wrangler-249214.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 122, 1, '2025-04-17 16:55:51', '2025-09-10 23:33:38', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(138, '0770080009', NULL, 'Hyundai Tucson - 2021', 280000, '21', '346', NULL, 2021, 70000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'Khp4ABqK8kc', '_sT1hR31v8Y', 'suv et 4x4', 'vendu', '[\"hyundai-tucson-114426.jpg\",\"hyundai-tucson-114426.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 132, 1, '2025-04-25 14:45:33', '2025-09-26 21:08:23', NULL, 0, NULL, 0, NULL, 0, 'Blanc', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(139, '0770080009', NULL, 'DS 7 - 2.0 BlueHDi 180 EAT8 Rivoli 2021', 280000, 'DS', 'DS 7 Crossback', NULL, 2021, 100000, 'diesel', 'automatique', 'très bon', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', 'dUheC8GPo_U', 'wHPef7lW_I0', 'suv et 4x4', 'vendu', '[\"ds-ds-7-crossback-754800.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 156, 1, '2025-04-29 07:42:15', '2025-09-05 10:09:19', NULL, 0, NULL, 0, NULL, 1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(140, '0770080009', NULL, 'Volkswagen Tiguan 2021 CARAT', 420000, '46', '69', NULL, 2021, 129000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'dédouané', 'oui', 'GtYOYQN8f1A', '6ZmNbzPSAF8', 'suv et 4x4', 'disponible', '[\"volkswagen-tiguan-832022.jpg\",\"volkswagen-tiguan-832022.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 164, 1, '2025-04-30 09:03:21', '2025-09-27 00:08:06', NULL, 0, NULL, 0, NULL, 1, 'Blanc', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(141, '0770080009', NULL, 'Mercedes-Benz Classe E 220 d - 2017 - BUSINESS', 284999, '32', '225', NULL, 2017, 98000, 'diesel', 'automatique', 'très bon', 'Casablanca-Jnane Californie', '8', 4, 'WW au Maroc', 'oui', 'P_1w03KQp7w', 'pGQpKkg0UmE', 'berline', 'vendu', '[\"mercedes-classe-e-523637.jpg\",\"mercedes-classe-e-523637.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 348, 1, '2025-05-07 10:55:00', '2025-09-29 15:53:35', NULL, 0, NULL, 0, NULL, 1, 'Noir', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(142, '0770080009', NULL, 'LAND ROVER Range Rover Sport HSE Dynamic', 630000, '27', '335', NULL, 2021, 75000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '12', 5, 'WW au Maroc', 'oui', 'MeOHMSNw9RE', 'QMTdNVoFcPo', 'suv et 4x4', 'disponible', '[\"land-rover-range-rover-sport-356425.jpg\",\"land-rover-range-rover-sport-356425.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rapport.pdf', NULL, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 161, 1, '2025-05-23 09:16:20', '2025-09-26 15:40:43', NULL, 0, NULL, 0, NULL, 1, 'Gris', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `annonces` (`id`, `phone`, `pack_id`, `titre`, `prix`, `mark`, `modele`, `matricule`, `year`, `km`, `carburant`, `box`, `etat`, `city`, `cv`, `nb_Door`, `origine`, `premiere_main`, `video`, `reel`, `bodywork`, `status`, `images`, `image`, `imgrleft`, `imgrtop`, `imgrmed`, `imgrbottom`, `imgrright`, `imginterior`, `imgrapport`, `rapport`, `co2`, `certifie`, `particulie`, `showroom`, `finance`, `jantesA`, `airbags`, `climatisation`, `gps`, `toit_ouvrant`, `double_toit_ouvrant`, `siege_cuir`, `radar_recul`, `camera_recul`, `vitreselec`, `abs`, `eps`, `rv`, `lv`, `cd`, `ordinateur`, `verrouillage`, `garantie`, `views`, `active`, `created_at`, `updated_at`, `deleted_at`, `verified`, `featured_position`, `show_in_homepage`, `homepage_position`, `is_homepage`, `colors`, `esp`, `antipatinage`, `aide_freinage_urgence`, `antidemarrage_electronique`, `aide_demarrage_cote`, `selecteur_mode_conduite`, `detection_fatigue`, `maintien_dans_la_voie`, `detecteur_angle_mort`, `detecteur_sous_gonflage`, `fermeture_portes_auto`, `preparation_isofix`, `phares_antibrouillard`, `systeme_alarme`, `start_stop`, `regulateur_vitesse`, `detecteur_pluie`, `allumage_auto_feux`, `frein_main_electrique`, `aide_stationnement`, `volant_reglable`, `retros_electriques`, `retros_rabat_electriques`, `coffre_electrique`, `sieges_electriques`, `sieges_elec_memoire`, `banquette_rabattable`, `ecran_tactile`, `cockpit_digital`, `commandes_volant`, `commandes_vocales`, `reconnaissance_panneaux`, `affichage_tete_haute`, `systeme_audio`, `wifi_bord`, `bluetooth`, `compatibilite_smartphone`, `apple_carplay_android_auto`, `chargeur_sans_fil`, `sellerie_similicuir_tissu`, `volant_cuir`, `follow_me_home`, `lumiere_ambiance`, `feux_jour_led`, `phares_full_led`, `toit_panoramique`, `barres_de_toit`, `vitres_surteintees`) VALUES
(143, '0770080009', NULL, 'BMW X3 - Xdrive 20 d XLine', 370000, 'BMW', 'X3', NULL, 2019, 110000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', 'vHryXf0JEY4', 'qwYcbU9oQmA', 'suv et 4x4', 'vendu', '[\"bmw-x3-339449.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 223, 1, '2025-05-29 10:12:32', '2025-09-08 07:16:47', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(144, '0770080009', NULL, 'BMW X1 Sdrive 18 D CLUB', 235000, '4', '35', NULL, 2018, 140000, 'diesel', 'automatique', 'très bon', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'non', '3ZaolC_ChmY', 'yRiFB_F7TOY', 'suv et 4x4', 'vendu', '[\"bmw-x1-314957.jpg\",\"bmw-x1-314957.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 558, 1, '2025-06-04 11:38:33', '2025-10-08 13:00:55', NULL, 0, NULL, 0, NULL, 0, 'Noir', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(145, '0770080009', NULL, 'BMW SERIE 5 520D SPORT+', 340000, '4', '20', NULL, 2019, 134000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 4, 'WW au Maroc', 'oui', 'OkqNInB9imQ', 'Yw4Z9prhILg', 'berline', 'vendu', '[\"bmw-serie-5-689122.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 196, 1, '2025-06-18 13:30:31', '2025-09-26 21:25:16', NULL, 0, NULL, 0, NULL, 0, 'Blanc', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(146, '0770080009', NULL, 'RENAULT Arkana 1.6 E-Tech 145 HEV Enginereed', 280000, '39', '198', NULL, 2023, 30000, 'hybride', 'automatique', 'neuf', 'Casablanca-Jnane Californie', '9', 5, 'WW au Maroc', 'oui', 'IV_G6NEx9gU', 'E4NDA30pbBo', 'suv et 4x4', 'vendu', '[\"renault-arkana-524958.jpg\",\"renault-arkana-524958.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 161, 1, '2025-06-25 08:17:38', '2025-10-07 15:55:52', NULL, 0, NULL, 0, NULL, 0, 'Noir', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(147, '0770080009', NULL, 'DACIA DUSTER 1.5 DCI', 175000, '10', '578', NULL, 2021, 40000, 'diesel', 'manuelle', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', '4hgmJ4QUNno', '8A2fI4Q0IIw', 'suv et 4x4', 'vendu', '[\"dacia-duster-188721.jpg\",\"dacia-duster-188721.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 118, 1, '2025-06-25 15:21:52', '2025-10-07 15:56:18', NULL, 0, NULL, 0, NULL, 0, 'Noir', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(148, '0770080009', NULL, 'Mercedes-Benz classe C  220 d - 2019 AMG Désigno', 390000, '32', '217', NULL, 2019, 200000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 4, 'importé neuf', 'oui', 'k8QFQfH1QRM', 'zanolRjS7sg', 'berline', 'vendu', '[\"mercedes-classe-c-102703.jpg\",\"mercedes-classe-c-102703.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 132, 1, '2025-07-17 15:08:26', '2025-10-07 15:57:03', NULL, 0, NULL, 0, NULL, 0, 'Noir', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(149, '0770080009', NULL, 'MASERAT Levante 3.0 V6 275 CH', 400000, '30', '1017', NULL, 2017, 55000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '12', 5, 'WW au Maroc', 'oui', 'nRKYdD7AdYY', 'HU8yHeEI5dY', 'suv et 4x4', 'disponible', '[\"maserati-levante-587508.jpg\",\"maserati-levante-587508.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 111, 1, '2025-07-17 15:50:50', '2025-10-08 13:13:31', NULL, 0, NULL, 0, NULL, 0, 'Blanc', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(150, '0770080009', NULL, 'Mercedes-Benz E230 Collection 1981', 200000, '32', '230', NULL, 1992, 200000, 'essence', 'manuelle', 'excellent', 'Casablanca-Jnane Californie', '10', 5, 'dédouané', 'oui', 'nkH8Mby2NnM', '_Gj6-4VIYO4', 'berline', 'disponible', '[\"mercedes-230-239225.jpg\",\"mercedes-230-239225.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 114, 1, '2025-07-17 16:58:57', '2025-10-08 13:22:46', NULL, 0, NULL, 0, NULL, 0, 'Bleu marin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151, '0770080009', NULL, 'FORD KUGA 1.5 TDCI TREND', 180000, 'FORD', 'Kuga', NULL, 2018, 69000, 'diesel', 'manuelle', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'non', '0fbamO-B6pY', 'uyFSiB3giyc', 'suv et 4x4', 'vendu', '[\"ford-kuga-trend-632233.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 256, 1, '2025-07-19 09:30:32', '2025-09-01 02:05:24', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(152, '0770080009', NULL, 'AUDI A6 - PRESTIGE 2.7 - 2010', 115000, 'AUDI', 'A6', NULL, 2010, 200000, 'diesel', 'automatique', 'très bon', 'Casablanca-Jnane Californie', '11', 5, 'WW au Maroc', 'oui', 'M9Fz4ovy63A', 'ozaaN6k8sj4', 'berline', 'vendu', '[\"audi-a6-447918.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 146, 1, '2025-07-22 17:59:56', '2025-09-07 14:05:09', NULL, 0, NULL, 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(153, '0770080009', NULL, 'RENAULT MEGAN Rs 2021', 325000, '39', '147', NULL, 2021, 30000, 'essence', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '10', 5, 'WW au Maroc', 'oui', 'sqW1HYsQSC0', 'oqw0keLWcq8', 'compact', 'disponible', '[\"renault-megane-642324.jpg\",\"renault-megane-642324.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 154, 1, '2025-08-05 08:59:36', '2025-10-08 13:53:50', NULL, 0, NULL, 0, NULL, 0, 'Orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(154, '0770080009', NULL, 'FIAT 500 1.2 l 69 Cult BVA 2018 ESSENCE', 120000, '15', '524', NULL, 2018, 100000, 'essence', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '7', 3, 'WW au Maroc', 'oui', 'W5QPI0tQzps', '9hBm0Oa7OjE', 'citadine', 'disponible', '[\"fiat-500-538783.jpg\",\"fiat-500-538783.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 46, 1, '2025-08-19 17:03:27', '2025-09-26 15:53:13', NULL, 0, NULL, 0, NULL, 0, 'Blanc', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(155, '0770080009', NULL, 'BMW Série 1 116d Urban', 228000, '4', '3', NULL, 2019, 124000, 'diesel', 'automatique', 'très bon', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', 'vQBz11ykGDA', 'vQBz11ykGDA', 'compact', 'disponible', '[\"bmw-serie-1-sport-569123.jpg\",\"bmw-serie-1-sport-569123.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 44, 1, '2025-09-04 16:40:46', '2025-10-08 13:55:13', NULL, 0, NULL, 0, NULL, 0, 'Blanc', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(156, '0770080009', NULL, 'AUDI Q2 TDI 35 150 CH URBAN', 267000, '3', '117', NULL, 2020, 70000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 5, 'WW au Maroc', 'oui', '/o5pmU-N72Ug', 'KFZ0mTbTnZU', 'suv et 4x4', 'disponible', '[\"audi-q2-460538.JPG\",\"audi-q2-460538.JPG\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 67, 1, '2025-09-10 08:17:16', '2025-10-08 13:25:50', NULL, 0, NULL, 0, NULL, 0, 'Noir', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(157, '0770080009', NULL, 'Audi Q3 S LIGNE QUATTRO  2019 BVA', 285000, 'AUDI', 'Q2', NULL, 2020, 99000, 'diesel', 'automatique', 'excellent', 'Casablanca-Jnane Californie', '8', 4, 'WW au Maroc', 'oui', 'MZXnb4aH7JM', 'KAriMQpmuyE', 'suv et 4x4', 'disponible', '[\"audi-q2-251014.JPG\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, 'audi-q2-557441.JPG', NULL, NULL, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2025-09-10 13:42:37', '2025-09-10 13:44:47', '2025-09-10 13:44:47', 0, NULL, 0, NULL, 0, 'Bleu cadet', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(158, '0770080009', NULL, 'HYUNDAI Grand i10 1.0 l 66 Lounge - 2021', 110000, '21', '348', NULL, 2021, 65000, 'essence', 'manuelle', 'excellent', 'Casablanca-Jnane Californie', '6', 5, 'WW au Maroc', 'oui', '3Vz14Eb3-7E', '2qAzOZDSXXk', 'citadine', 'disponible', '[\"21-348-493286.jpg\",\"21-348-915787.jpg\",\"21-348-741282.jpg\",\"21-348-953416.jpg\",\"21-348-828502.jpg\",\"21-348-922218.jpg\"]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 90, 1, '2025-09-15 08:46:17', '2025-10-08 13:20:06', NULL, 0, NULL, 0, NULL, 0, 'Gris mat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(161, '0637916135', 4, 'Audi a4', 200000, '3', '110', NULL, 2014, 200000, 'diesel', 'manuelle', 'excellent', 'Salé', '8', 5, 'WW au Maroc', 'non', NULL, NULL, 'crossover', 'disponible', '[]', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 15, 0, '2025-09-10 16:08:56', '2025-09-26 22:18:10', NULL, 0, NULL, 0, NULL, 0, 'Bleu', 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(162, '0637916134', 1, 'Nissan', 200000, '35', '407', '61514-M-51', 2018, 200000, 'hybride', 'automatique', 'très bon', 'Kénitra', '8', 3, 'WW au Maroc', 'oui', NULL, NULL, NULL, 'disponible', '[\"nissan-gtr-213039.jpeg\",\"nissan-gtr-257517.png\",\"nissan-gtr-486404.png\",\"nissan-gtr-994540.jpg\",\"nissan-gtr-213039.jpeg\",\"nissan-gtr-257517.png\",\"nissan-gtr-486404.png\",\"nissan-gtr-994540.jpg\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 7, 1, '2025-09-11 15:39:32', '2025-10-08 13:15:42', NULL, 0, NULL, 0, NULL, 0, 'Bleu ciel', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(163, '0637916134', 3, 'Nissan', 200000, 'NISSAN', 'Bluebird', NULL, 2016, 200000, 'hybride', 'automatique', 'Accidenté', 'Fès', '8', 3, 'WW au Maroc', 'Oui', NULL, NULL, NULL, 'disponible', '[\"1757596446_audi a4.jpeg\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2025-09-11 15:52:23', '2025-09-11 15:52:23', NULL, 0, NULL, 0, NULL, 0, 'Bleu de minuit', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(164, '0637916134', 3, 'Chi', 222222, 'CHEVROLET', 'Metro', NULL, 2018, 88888, 'essence', 'automatique', 'Très bon état', 'Californie', '8', 3, 'dédouané', 'Oui', NULL, NULL, NULL, 'disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2025-09-11 16:27:58', '2025-09-11 16:29:08', NULL, 0, NULL, 0, NULL, 0, 'Bleu ciel', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(165, '0637916134', 4, 'ejndk', 222222, 'CHEVROLET', 'CMP', NULL, 2010, 55545, 'hybride', 'automatique', 'Très bon état', 'Marrakech', '8', 3, 'WW au Maroc', 'Oui', NULL, NULL, NULL, 'disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2025-09-11 16:32:15', '2025-09-11 16:32:15', NULL, 0, NULL, 0, NULL, 0, 'Bleu cadet', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(166, '0637916134', 4, 'ejndk', 888888, '8', '895', NULL, 2021, 2000, 'hybride', 'automatique', 'correct', 'Agadir', '8', 5, 'WW au Maroc', 'non', NULL, NULL, 'compact', 'disponible', '[\"35-407-622865.jpg\",\"35-407-622865.jpg\",\"35-407-622865.jpg\",\"35-407-622865.jpg\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 5, 0, '2025-09-11 16:40:30', '2025-09-27 00:10:48', NULL, 0, NULL, 0, NULL, 0, 'Blanc', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(167, '0770080009', NULL, 'Dacia', 41554, '10', '580', NULL, 2018, 200000, 'diesel', 'manuelle', 'endommagé', 'Marrakech', '9', 4, 'dédouané', 'oui', NULL, NULL, 'suv et 4x4', 'disponible', '[\"10-580-114923.jpg\",\"10-580-778764.jpeg\",\"10-580-653877.jpeg\",\"10-580-114923.jpg\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10-580-979273.pdf', NULL, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 12, 1, '2025-09-23 11:48:51', '2025-10-07 16:49:51', NULL, 0, NULL, 0, NULL, 0, 'Bleu ardoise', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(168, '0637996134', 2, 'nissan qachkai', 200000, 'CITROEN', 'C35', NULL, 2017, 200000, 'diesel', 'automatique', 'Bon état', 'Kénitra', '8', 5, 'WW au Maroc', 'Oui', NULL, NULL, NULL, 'disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2025-09-26 17:50:02', '2025-09-26 17:50:02', NULL, 0, NULL, 0, NULL, 0, 'Bleu de minuit', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(169, '0637916199', NULL, 'test', 630000, '3', '112', '61514-M-52', 2017, 200000, 'electrique', 'automatique', 'très bon', 'Tétouan', '15', 6, 'dédouané', 'oui', NULL, NULL, 'suv et 4x4', 'disponible', '[\"3-112-300832.png\",\"3-112-573500.jpg\",\"3-112-481088.png\",\"3-112-366829.PNG\",\"3-112-894541.png\",\"3-112-642978.jpg\",\"3-112-320850.jpg\",\"3-112-404891.jpg\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 11, 1, '2025-09-26 18:49:34', '2025-10-08 13:31:00', NULL, 0, NULL, 0, NULL, 0, 'Bleu marin', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(170, '0637916135', NULL, 'Yaris test', 200000, '45', '1014', '53652-L-22', 2017, 200000, 'diesel', 'manuelle', 'excellent', 'Salé', '12', 4, 'WW au Maroc', 'non', NULL, NULL, 'berline', 'disponible', '[\"45-1014-820793.png\",\"45-1014-342720.png\",\"45-1014-301707.jpg\",\"45-1014-597783.png\",\"45-1014-820793.png\",\"45-1014-342720.png\",\"45-1014-301707.jpg\",\"45-1014-597783.png\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6, 0, '2025-09-26 22:26:54', '2025-09-27 00:10:02', NULL, 0, NULL, 0, NULL, 0, 'Bleu moyen', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(171, '0770080009', NULL, 'test Cupra', 200000, '9', '890', '61514-M-50', 2018, 200000, 'diesel', 'manuelle', 'correct', 'Californie', '12', 5, 'WW au Maroc', 'non', NULL, NULL, 'compact', 'disponible', '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2025-09-26 22:37:03', '2025-09-26 23:58:17', NULL, 0, NULL, 0, NULL, 0, 'Vert Chartreuse', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(172, '0770080009', NULL, 'test', 200000, '10', '581', '23515-K-7', 2015, 32203, 'essence', 'manuelle', 'neuf', 'Zenata', '10', 3, 'importé neuf', 'non', NULL, NULL, 'berline', 'disponible', '[\"10-581-566151.jpeg\",\"10-581-464711.jpeg\",\"10-581-424703.jpeg\",\"10-581-393053.png\",\"10-581-464450.png\",\"10-581-566151.jpeg\",\"10-581-464711.jpeg\",\"10-581-424703.jpeg\",\"10-581-393053.png\",\"10-581-464450.png\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10-581-684902.pdf', NULL, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 0, '2025-09-26 22:42:16', '2025-09-27 00:09:53', NULL, 0, NULL, 0, NULL, 0, 'Bleu marin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(173, '0770080009', NULL, 'testcc', 200000, '10', '581', '23515-K-11', 2023, 32203, 'diesel', 'automatique', 'très bon', 'Agadir', '6', 4, 'importé neuf', 'non', NULL, NULL, 'berline', 'disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 2, 1, '2025-09-27 19:47:21', '2025-10-07 16:46:57', '2025-10-07 16:46:57', 0, NULL, 0, NULL, 0, 'Bleu ciel', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(174, '0637916134', NULL, 'test', 200000, '10', '581', '18224-E-3', 2016, 200000, 'electrique', 'manuelle', 'correct', 'Tétouan', '12', 3, 'WW au Maroc', 'non', NULL, NULL, 'citadine', 'disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 4, 0, '2025-09-27 20:05:45', '2025-10-08 13:26:59', NULL, 0, NULL, 0, NULL, 0, 'Bleu cadet', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(175, '0637916134', NULL, 'testss', 200000, '13', '872', '48488-E-1', 2013, 200000, 'diesel', 'automatique', 'endommagé', 'Tétouan', '13', 3, 'WW au Maroc', 'non', NULL, NULL, 'berline', 'disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2025-09-27 20:11:48', '2025-10-07 16:46:43', '2025-10-07 16:46:43', 0, NULL, 0, NULL, 0, 'Bleu de minuit', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(176, '0637916134', NULL, 'testbb', 200000, '8', '901', '89485-E-1', 2013, 200000, 'diesel', 'manuelle', 'très bon', 'Safi', '9', 4, 'WW au Maroc', 'non', NULL, NULL, 'compact', 'disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, '2025-09-27 20:25:04', '2025-10-07 16:46:29', '2025-10-07 16:46:29', 0, NULL, 0, NULL, 0, 'Bleu ciel', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(178, '0770080009', NULL, 'testggg', 200000, '15', '530', '61514-M-5', 2024, 200000, 'essence', 'manuelle', 'correct', 'Casablanca-Jnane Californie', '12', 5, 'importé neuf', 'oui', NULL, NULL, 'citadine', 'disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, '2025-10-07 16:38:51', '2025-10-07 16:47:04', '2025-10-07 16:47:04', 0, NULL, 0, NULL, 0, 'Bleu de minuit', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(179, '0770080009', NULL, 'testddddd', 200000, '16', '451', '23515-K-2', 2014, 200000, 'diesel', 'manuelle', 'correct', 'Salé', '17', 4, 'importé neuf', 'non', NULL, '2qAzOZDSXXk', 'compact', 'disponible', '[\"16-451-206511.png\",\"16-451-227394.jpg\",\"16-451-212790.png\",\"16-451-211617.PNG\",\"16-451-231600.png\",\"16-451-206511.png\",\"16-451-227394.jpg\",\"16-451-212790.png\",\"16-451-211617.PNG\",\"16-451-231600.png\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 27, 1, '2025-10-07 16:45:27', '2025-10-10 16:14:21', NULL, 0, NULL, 0, NULL, 0, 'Bleu ardoise foncé', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(180, '0770080009', NULL, 'ejndkdd', 200000, '13', '871', '18224-E-1', 2024, 200000, 'essence', 'manuelle', 'neuf', 'Californie', '11', 5, 'importé neuf', 'oui', NULL, NULL, 'crossover', 'disponible', '[\"13-871-266250.png\",\"13-871-646220.jpg\",\"13-871-304958.png\",\"13-871-412802.PNG\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 2, 1, '2025-10-08 13:32:25', '2025-10-08 13:38:12', NULL, 0, NULL, 0, NULL, 0, 'Bleu marine', 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(181, '0637996134', NULL, 'Audi a4', 20000, '11', '886', '71134-H-1', 2014, 200000, 'diesel', 'automatique', 'Très bon état', 'Rabat', '7', 3, 'WW au Maroc', 'Oui', NULL, NULL, NULL, 'disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2025-10-15 17:06:00', '2025-10-15 17:06:00', NULL, 0, NULL, 0, NULL, 0, 'Bleu marin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(183, '0637996134', NULL, 'Audi a4', 20000, '4', '5', '71134-H-3', 2014, 200000, 'diesel', 'automatique', 'Très bon état', 'Rabat', '7', 3, 'WW au Maroc', 'Oui', NULL, NULL, NULL, 'disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2025-10-15 17:07:32', '2025-10-15 17:07:32', NULL, 0, NULL, 0, NULL, 0, 'Bleu marin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(185, '0637996134', NULL, 'Audi a4', 20000, '11', '886', '71134-N-1', 2014, 200000, 'diesel', 'automatique', 'Très bon état', 'Rabat', '7', 3, 'WW au Maroc', 'Oui', NULL, NULL, NULL, 'disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2025-10-15 17:07:59', '2025-10-15 17:07:59', NULL, 0, NULL, 0, NULL, 0, 'Bleu marin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(187, '0637996134', NULL, 'Audi a4', 20000, '11', '886', '71134-N-2', 2014, 200000, 'diesel', 'automatique', 'Neuf', 'Californie', '7', 3, 'dédouané', 'Non', NULL, NULL, NULL, 'disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2025-10-15 17:11:11', '2025-10-15 17:11:11', NULL, 0, NULL, 0, NULL, 0, 'Bleu marin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(190, '0637996134', NULL, 'Audi a4', 20000, '11', '886', '71134-N-8', 2014, 200000, 'diesel', 'automatique', 'Neuf', 'Californie', '7', 3, 'dédouané', 'Non', NULL, NULL, NULL, 'disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2025-10-15 17:14:58', '2025-10-15 17:14:58', NULL, 0, NULL, 0, NULL, 0, 'Bleu marin', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `autoencheres`
--

CREATE TABLE `autoencheres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `annonce_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `proposition` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `autoencheres`
--

INSERT INTO `autoencheres` (`id`, `annonce_id`, `client_id`, `proposition`, `created_at`, `updated_at`) VALUES
(1, 142, 2, 200000, '2025-07-18 15:58:04', '2025-07-18 15:58:04'),
(2, 137, 1, 400000, '2025-07-27 22:32:21', '2025-07-27 22:32:21'),
(3, 140, 2, 300000, '2025-08-05 17:18:07', '2025-08-05 17:18:07'),
(7, 139, 2, 200000, '2025-09-05 10:09:19', '2025-09-05 10:09:19'),
(8, 16, 2, 5222222, '2025-09-08 17:30:49', '2025-09-08 17:30:49'),
(9, 155, 14, 200000, '2025-10-08 13:55:04', '2025-10-08 13:55:04');

-- --------------------------------------------------------

--
-- Table structure for table `avistexts`
--

CREATE TABLE `avistexts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `job` varchar(125) NOT NULL,
  `text` longtext NOT NULL,
  `image` varchar(125) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `avistexts`
--

INSERT INTO `avistexts` (`id`, `name`, `job`, `text`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'HASSAN KABIR', 'Blogger', 'م أكن أعرف ماذا أتوقع عند شرائي لأول مرة سيارة، لكن مستوى الخدمة الذي حصلت عليه تجاوز توقعاتي بكثير. فريق احترافي ومتعاون، والسيارة التي اشتريتها تجعلني سعيدة جدًا. شكرًا جزيلا لكم.', 'nado-1707230827.jpg', '2024-02-06 12:47:07', '2024-05-14 14:56:00', '2024-05-14 14:56:00'),
(2, 'HANAN YASSMIN', 'HR Manager', 'Grâce à Every Sunday, j\'ai réussi à vendre ma voiture dès le lendemain. Merci Nado pour cette plateforme efficace et rapide.', 'nado-1707230905.jpg', '2024-02-06 12:48:25', '2024-05-14 14:56:02', '2024-05-14 14:56:02'),
(3, 'KAMAL DARI', 'English Teacher', 'Je tiens à vous remercier pour votre professionnalisme et votre enthousiasme, Nado. Votre plateforme a véritablement transformé l\'expérience d\'achat de voitures d\'occasion. Je vous souhaite bon courage pour la suite', 'nado-1707230958.jpg', '2024-02-06 12:49:18', '2024-05-14 14:55:55', '2024-05-14 14:55:55'),
(4, 'HASSNA KAMA', 'Student', 'لم أكن أعرف ماذا أتوقع عند شرائي لأول مرة سيارة، لكن مستوى الخدمة الذي حصلت عليه تجاوز توقعاتي بكثير. فريق احترافي ومتعاون، والسيارة التي اشتريتها تجعلني سعيدة جدًا. شكرًا جزيلا لكم', 'nado-1707230995.jpg', '2024-02-06 12:49:55', '2024-05-14 14:55:58', '2024-05-14 14:55:58'),
(5, 'YASSINE', 'Professeur d\'éducation', 'خدمة ممتازة أنصح بزيارة موقع NADO.MA \r\nوأشكر كمل الطاقم على حسن الإستقبال', 'nado-1715705518.png', '2024-05-14 14:51:58', '2024-05-14 14:55:29', NULL),
(6, 'M.Karim', 'citoyen', 'خدمة ممتازة وسريعة أنصح كل من يريد شراء سيارة أن يتعامل مع موقع نادو', 'nado-1720014737.png', '2024-07-03 11:52:18', '2024-07-03 11:52:18', NULL),
(7, 'M.Amine', 'citoyen', 'سيارة جميلة لم أجد أي مشكلة كانت الخدمة سلسة وأشكر فريق نادو على حسن الإستقبال', 'nado-1720113076.png', '2024-07-04 15:11:16', '2024-07-04 15:11:16', NULL),
(8, 'Mr. Driss MOIADI', 'Client d\'Agadir', 'تجربة رائعة مع نادو. وجدت السيارة اللي كنت كنقلب عليها بسهولة وبثمن مناسب. فريق العمل كان متعاون جداً وأنصح أي واحد باغي تشري سيارة مستعملة يتعامل معاهم.', 'nado-1741348414.JPG', '2025-03-07 11:53:34', '2025-03-07 11:54:08', NULL),
(9, 'السيد عزالدين كاتين', 'مسير شركة', 'كلمة وشهادة الحق لكم باعتبار معاملتكم لنا كل التقدير و الاحترام على صدقكم و الاحترافية في التعامل و الاخلاق العالية بالخصوص السيد الحاج رضوان و السيد شوقي .. لنا عظيم الشرف التعامل معكم و شكرا على خدمتكم وجودة منتوجاتكم', 'nado-1741606377.JPG', '2025-03-10 11:32:58', '2025-03-10 11:32:58', NULL),
(10, 'الأخ فهد', 'السعودية', 'شكرا لك وللاخ رضوان لحسن التعامل والمصداقيه في التعامل والوفاء والخدمات التي تقدموها سواء بالضمان مابعد البيع او في تقديم خدمة بيع السيارات بكل مصداقيه \nنصيحه للاخوه المغاربه الي في الخليج او في اي مكان اذا رغبت في شراء سيارة عليك بالاخ شوقي ورضوان ، \nتحياتي', 'nado-1745841613.JPG', '2025-04-28 10:00:13', '2025-04-28 10:00:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `avisvideos`
--

CREATE TABLE `avisvideos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(125) NOT NULL,
  `video_key` varchar(125) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `avisvideos`
--

INSERT INTO `avisvideos` (`id`, `title`, `video_key`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Les avis de nos clients', '3Vz14Eb3-7E', '2024-02-15 12:54:18', '2024-05-14 14:52:37', '2024-05-14 14:52:37'),
(2, 'avis', 'aPEbXtOHCXc', '2024-05-02 14:18:55', '2024-05-14 14:52:35', '2024-05-14 14:52:35'),
(3, 'M.Yassine', 'RnA7_K5OMlc', '2024-05-14 14:53:26', '2024-07-04 15:12:23', NULL),
(4, 'M.Karim', 'Uv5hJwSQswE', '2024-07-03 12:19:45', '2024-07-03 12:23:21', NULL),
(5, 'M.Amine', 'BVv7-VMbSTs', '2024-07-04 15:12:00', '2024-07-04 15:12:00', NULL),
(6, 'Jeep wrangler sahara - 2018', 'tdWv_qwErFw', '2024-08-05 14:06:08', '2024-08-05 14:06:31', '2024-08-05 14:06:31'),
(7, 'Mr. Driss MOIADI', 'wnN8L_m4p1Q', '2025-02-15 09:58:51', '2025-02-15 10:55:07', NULL),
(8, 'Mr A. KATTEN', '4hVZ8PZeX68', '2025-03-19 15:50:12', '2025-03-19 15:50:12', NULL),
(9, 'Avis Mr A. ACHWAQ', 'L-1KrtYeqiA', '2025-05-21 11:18:46', '2025-05-21 11:18:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `logo` varchar(125) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip` varchar(125) DEFAULT NULL,
  `user_agent` varchar(125) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `logo`, `user_id`, `ip`, `user_agent`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ABARTH', 'abarth-1707227603.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 11:53:23', '2024-02-06 11:53:23', NULL),
(2, 'ALFA ROMEO', 'alfa-romeo-1707227657.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 11:53:48', '2024-02-06 11:54:17', NULL),
(3, 'AUDI', 'audi-1707227800.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 11:56:40', '2024-02-06 11:57:11', NULL),
(4, 'BMW', 'bmw-1707227856.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 11:57:36', '2024-02-06 11:57:36', NULL),
(5, 'CHERY', 'chery-1707227888.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 11:58:08', '2024-02-06 11:58:08', NULL),
(6, 'CHEVROLET', 'chevrolet-1707227932.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 11:58:52', '2024-02-06 11:58:52', NULL),
(7, 'CHRYSLER', 'chrysler-1707227968.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 11:59:28', '2024-02-06 11:59:28', NULL),
(8, 'CITROEN', 'citroen-1707227988.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 11:59:48', '2024-02-06 11:59:48', NULL),
(9, 'CUPRA', 'cupra-1707228025.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:00:25', '2024-02-06 12:00:25', NULL),
(10, 'DACIA', 'dacia-1707228045.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:00:45', '2024-02-06 12:00:45', NULL),
(11, 'DAIHATSU', 'daihatsu-1707228069.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:01:09', '2024-02-06 12:01:09', NULL),
(12, 'DFSK', 'dfsk-1707228085.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:01:25', '2024-02-06 12:01:25', NULL),
(13, 'DODGE', 'dodge-1707228116.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:01:56', '2024-02-06 12:01:56', NULL),
(14, 'DS', 'ds-1707228155.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:02:35', '2024-02-06 12:02:35', NULL),
(15, 'FIAT', 'fiat-1707228180.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:03:00', '2024-02-06 12:03:00', NULL),
(16, 'FORD', 'ford-1707228198.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:03:18', '2024-02-06 12:03:18', NULL),
(17, 'FOTON', 'foton-1707228209.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:03:29', '2024-02-06 12:03:29', NULL),
(18, 'GAZ', 'gaz-1707228234.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:03:54', '2024-02-06 12:03:54', NULL),
(19, 'HONDA', 'honda-1707228272.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:04:32', '2024-02-06 12:04:32', NULL),
(20, 'HUMMER', 'hummer-1707228285.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:04:45', '2024-02-06 12:04:45', NULL),
(21, 'HYUNDAI', 'hyundai-1707228297.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:04:57', '2024-02-06 12:04:57', NULL),
(22, 'ISUZU', 'isuzu-1707228314.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:05:14', '2024-02-06 12:05:14', NULL),
(23, 'JAGUAR', 'jaguar-1707228328.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:05:28', '2024-02-06 12:05:28', NULL),
(24, 'JEEP', 'jeep-1707228354.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:05:54', '2024-02-06 12:05:54', NULL),
(25, 'KIA', 'kia-1707228364.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:06:04', '2024-02-06 12:06:04', NULL),
(26, 'LANCIA', 'lancia-1707228376.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:06:16', '2024-02-06 12:06:16', NULL),
(27, 'LAND ROVER', 'land-rover-1707228401.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:06:41', '2024-02-06 12:06:41', NULL),
(28, 'LEXUS', 'lexus-1707228422.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:07:02', '2024-02-06 12:07:02', NULL),
(29, 'MAHINDRA', 'mahindra-1707228441.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:07:21', '2024-02-06 12:07:21', NULL),
(30, 'MASERATI', 'maserati-1707228475.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:07:55', '2024-02-06 12:07:55', NULL),
(31, 'MAZDA', 'mazda-1707228490.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:08:10', '2024-02-06 12:08:10', NULL),
(32, 'MERCEDES', 'mercedes-1707228505.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:08:25', '2024-02-06 12:08:25', NULL),
(33, 'MINI', 'mini-1707228534.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:08:54', '2024-02-06 12:08:54', NULL),
(34, 'MITSUBISHI', 'mitsubishi-1707228551.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:09:11', '2024-02-06 12:09:11', NULL),
(35, 'NISSAN', 'nissan-1707228569.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:09:29', '2024-02-06 12:09:29', NULL),
(36, 'OPEL', 'opel-1707228581.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:09:41', '2024-02-06 12:09:41', NULL),
(37, 'PEUGEOT', 'peugeot-1707228598.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:09:58', '2024-02-06 12:09:58', NULL),
(38, 'PORSCHE', 'porsche-1707228614.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:10:14', '2024-02-06 12:10:14', NULL),
(39, 'RENAULT', 'renault-1707228630.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:10:30', '2024-02-06 12:10:30', NULL),
(40, 'SEAT', 'seat-1707228641.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:10:41', '2024-02-06 12:10:41', NULL),
(41, 'SKODA', 'skoda-1707228661.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:11:01', '2024-02-06 12:11:01', NULL),
(42, 'SSANGYONG', 'ssangyong-1707228673.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:11:13', '2024-02-06 12:11:13', NULL),
(43, 'SUBARU', 'subaru-1707228691.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:11:31', '2024-02-06 12:11:31', NULL),
(44, 'SUZUKI', 'suzuki-1707228719.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:11:59', '2024-02-06 12:11:59', NULL),
(45, 'TOYOTA', 'toyota-1707228730.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:12:10', '2024-02-06 12:12:10', NULL),
(46, 'VOLKSWAGEN', 'volkswagen-1707228743.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:12:23', '2024-02-06 12:12:23', NULL),
(47, 'VOLVO', 'volvo-1707228777.png', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 12:12:57', '2024-02-06 12:12:57', NULL),
(48, 'TESLA', 'tesla-1738948636.png', 2, '105.157.255.167', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', '2025-02-07 15:17:16', '2025-02-07 15:17:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(125) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_avistext', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:6:{i:0;O:19:\"App\\Models\\Avistext\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"avistexts\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:10;s:4:\"name\";s:15:\"الأخ فهد\";s:3:\"job\";s:16:\"السعودية\";s:4:\"text\";s:469:\"شكرا لك وللاخ رضوان لحسن التعامل والمصداقيه في التعامل والوفاء والخدمات التي تقدموها سواء بالضمان مابعد البيع او في تقديم خدمة بيع السيارات بكل مصداقيه \nنصيحه للاخوه المغاربه الي في الخليج او في اي مكان اذا رغبت في شراء سيارة عليك بالاخ شوقي ورضوان ، \nتحياتي\";s:5:\"image\";s:19:\"nado-1745841613.JPG\";s:10:\"created_at\";s:19:\"2025-04-28 11:00:13\";s:10:\"updated_at\";s:19:\"2025-04-28 11:00:13\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:10;s:4:\"name\";s:15:\"الأخ فهد\";s:3:\"job\";s:16:\"السعودية\";s:4:\"text\";s:469:\"شكرا لك وللاخ رضوان لحسن التعامل والمصداقيه في التعامل والوفاء والخدمات التي تقدموها سواء بالضمان مابعد البيع او في تقديم خدمة بيع السيارات بكل مصداقيه \nنصيحه للاخوه المغاربه الي في الخليج او في اي مكان اذا رغبت في شراء سيارة عليك بالاخ شوقي ورضوان ، \nتحياتي\";s:5:\"image\";s:19:\"nado-1745841613.JPG\";s:10:\"created_at\";s:19:\"2025-04-28 11:00:13\";s:10:\"updated_at\";s:19:\"2025-04-28 11:00:13\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:4:{i:0;s:4:\"name\";i:1;s:3:\"job\";i:2;s:4:\"text\";i:3;s:5:\"image\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:1;O:19:\"App\\Models\\Avistext\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"avistexts\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:9;s:4:\"name\";s:36:\"السيد عزالدين كاتين\";s:3:\"job\";s:17:\"مسير شركة\";s:4:\"text\";s:398:\"كلمة وشهادة الحق لكم باعتبار معاملتكم لنا كل التقدير و الاحترام على صدقكم و الاحترافية في التعامل و الاخلاق العالية بالخصوص السيد الحاج رضوان و السيد شوقي .. لنا عظيم الشرف التعامل معكم و شكرا على خدمتكم وجودة منتوجاتكم\";s:5:\"image\";s:19:\"nado-1741606377.JPG\";s:10:\"created_at\";s:19:\"2025-03-10 11:32:58\";s:10:\"updated_at\";s:19:\"2025-03-10 11:32:58\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:9;s:4:\"name\";s:36:\"السيد عزالدين كاتين\";s:3:\"job\";s:17:\"مسير شركة\";s:4:\"text\";s:398:\"كلمة وشهادة الحق لكم باعتبار معاملتكم لنا كل التقدير و الاحترام على صدقكم و الاحترافية في التعامل و الاخلاق العالية بالخصوص السيد الحاج رضوان و السيد شوقي .. لنا عظيم الشرف التعامل معكم و شكرا على خدمتكم وجودة منتوجاتكم\";s:5:\"image\";s:19:\"nado-1741606377.JPG\";s:10:\"created_at\";s:19:\"2025-03-10 11:32:58\";s:10:\"updated_at\";s:19:\"2025-03-10 11:32:58\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:4:{i:0;s:4:\"name\";i:1;s:3:\"job\";i:2;s:4:\"text\";i:3;s:5:\"image\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:2;O:19:\"App\\Models\\Avistext\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"avistexts\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:8;s:4:\"name\";s:16:\"Mr. Driss MOIADI\";s:3:\"job\";s:15:\"Client d\'Agadir\";s:4:\"text\";s:277:\"تجربة رائعة مع نادو. وجدت السيارة اللي كنت كنقلب عليها بسهولة وبثمن مناسب. فريق العمل كان متعاون جداً وأنصح أي واحد باغي تشري سيارة مستعملة يتعامل معاهم.\";s:5:\"image\";s:19:\"nado-1741348414.JPG\";s:10:\"created_at\";s:19:\"2025-03-07 11:53:34\";s:10:\"updated_at\";s:19:\"2025-03-07 11:54:08\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:8;s:4:\"name\";s:16:\"Mr. Driss MOIADI\";s:3:\"job\";s:15:\"Client d\'Agadir\";s:4:\"text\";s:277:\"تجربة رائعة مع نادو. وجدت السيارة اللي كنت كنقلب عليها بسهولة وبثمن مناسب. فريق العمل كان متعاون جداً وأنصح أي واحد باغي تشري سيارة مستعملة يتعامل معاهم.\";s:5:\"image\";s:19:\"nado-1741348414.JPG\";s:10:\"created_at\";s:19:\"2025-03-07 11:53:34\";s:10:\"updated_at\";s:19:\"2025-03-07 11:54:08\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:4:{i:0;s:4:\"name\";i:1;s:3:\"job\";i:2;s:4:\"text\";i:3;s:5:\"image\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:3;O:19:\"App\\Models\\Avistext\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"avistexts\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:7;s:4:\"name\";s:7:\"M.Amine\";s:3:\"job\";s:7:\"citoyen\";s:4:\"text\";s:142:\"سيارة جميلة لم أجد أي مشكلة كانت الخدمة سلسة وأشكر فريق نادو على حسن الإستقبال\";s:5:\"image\";s:19:\"nado-1720113076.png\";s:10:\"created_at\";s:19:\"2024-07-04 16:11:16\";s:10:\"updated_at\";s:19:\"2024-07-04 16:11:16\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:7;s:4:\"name\";s:7:\"M.Amine\";s:3:\"job\";s:7:\"citoyen\";s:4:\"text\";s:142:\"سيارة جميلة لم أجد أي مشكلة كانت الخدمة سلسة وأشكر فريق نادو على حسن الإستقبال\";s:5:\"image\";s:19:\"nado-1720113076.png\";s:10:\"created_at\";s:19:\"2024-07-04 16:11:16\";s:10:\"updated_at\";s:19:\"2024-07-04 16:11:16\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:4:{i:0;s:4:\"name\";i:1;s:3:\"job\";i:2;s:4:\"text\";i:3;s:5:\"image\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:4;O:19:\"App\\Models\\Avistext\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"avistexts\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:6;s:4:\"name\";s:7:\"M.Karim\";s:3:\"job\";s:7:\"citoyen\";s:4:\"text\";s:123:\"خدمة ممتازة وسريعة أنصح كل من يريد شراء سيارة أن يتعامل مع موقع نادو\";s:5:\"image\";s:19:\"nado-1720014737.png\";s:10:\"created_at\";s:19:\"2024-07-03 12:52:18\";s:10:\"updated_at\";s:19:\"2024-07-03 12:52:18\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:6;s:4:\"name\";s:7:\"M.Karim\";s:3:\"job\";s:7:\"citoyen\";s:4:\"text\";s:123:\"خدمة ممتازة وسريعة أنصح كل من يريد شراء سيارة أن يتعامل مع موقع نادو\";s:5:\"image\";s:19:\"nado-1720014737.png\";s:10:\"created_at\";s:19:\"2024-07-03 12:52:18\";s:10:\"updated_at\";s:19:\"2024-07-03 12:52:18\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:4:{i:0;s:4:\"name\";i:1;s:3:\"job\";i:2;s:4:\"text\";i:3;s:5:\"image\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:5;O:19:\"App\\Models\\Avistext\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"avistexts\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:5;s:4:\"name\";s:7:\"YASSINE\";s:3:\"job\";s:23:\"Professeur d\'éducation\";s:4:\"text\";s:126:\"خدمة ممتازة أنصح بزيارة موقع NADO.MA \r\nوأشكر كمل الطاقم على حسن الإستقبال\";s:5:\"image\";s:19:\"nado-1715705518.png\";s:10:\"created_at\";s:19:\"2024-05-14 15:51:58\";s:10:\"updated_at\";s:19:\"2024-05-14 15:55:29\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:5;s:4:\"name\";s:7:\"YASSINE\";s:3:\"job\";s:23:\"Professeur d\'éducation\";s:4:\"text\";s:126:\"خدمة ممتازة أنصح بزيارة موقع NADO.MA \r\nوأشكر كمل الطاقم على حسن الإستقبال\";s:5:\"image\";s:19:\"nado-1715705518.png\";s:10:\"created_at\";s:19:\"2024-05-14 15:51:58\";s:10:\"updated_at\";s:19:\"2024-05-14 15:55:29\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:4:{i:0;s:4:\"name\";i:1;s:3:\"job\";i:2;s:4:\"text\";i:3;s:5:\"image\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1760611443),
('laravel_cache_avisvideos', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:6:{i:0;O:21:\"App\\Models\\Avisvideos\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"avisvideos\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:9;s:5:\"title\";s:17:\"Avis Mr A. ACHWAQ\";s:9:\"video_key\";s:11:\"L-1KrtYeqiA\";s:10:\"created_at\";s:19:\"2025-05-21 12:18:46\";s:10:\"updated_at\";s:19:\"2025-05-21 12:18:46\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:9;s:5:\"title\";s:17:\"Avis Mr A. ACHWAQ\";s:9:\"video_key\";s:11:\"L-1KrtYeqiA\";s:10:\"created_at\";s:19:\"2025-05-21 12:18:46\";s:10:\"updated_at\";s:19:\"2025-05-21 12:18:46\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:5:\"title\";i:1;s:9:\"video_key\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:1;O:21:\"App\\Models\\Avisvideos\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"avisvideos\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:8;s:5:\"title\";s:12:\"Mr A. KATTEN\";s:9:\"video_key\";s:11:\"4hVZ8PZeX68\";s:10:\"created_at\";s:19:\"2025-03-19 15:50:12\";s:10:\"updated_at\";s:19:\"2025-03-19 15:50:12\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:8;s:5:\"title\";s:12:\"Mr A. KATTEN\";s:9:\"video_key\";s:11:\"4hVZ8PZeX68\";s:10:\"created_at\";s:19:\"2025-03-19 15:50:12\";s:10:\"updated_at\";s:19:\"2025-03-19 15:50:12\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:5:\"title\";i:1;s:9:\"video_key\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:2;O:21:\"App\\Models\\Avisvideos\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"avisvideos\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:7;s:5:\"title\";s:16:\"Mr. Driss MOIADI\";s:9:\"video_key\";s:11:\"wnN8L_m4p1Q\";s:10:\"created_at\";s:19:\"2025-02-15 10:58:51\";s:10:\"updated_at\";s:19:\"2025-02-15 11:55:07\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:7;s:5:\"title\";s:16:\"Mr. Driss MOIADI\";s:9:\"video_key\";s:11:\"wnN8L_m4p1Q\";s:10:\"created_at\";s:19:\"2025-02-15 10:58:51\";s:10:\"updated_at\";s:19:\"2025-02-15 11:55:07\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:5:\"title\";i:1;s:9:\"video_key\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:3;O:21:\"App\\Models\\Avisvideos\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"avisvideos\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:5;s:5:\"title\";s:7:\"M.Amine\";s:9:\"video_key\";s:11:\"BVv7-VMbSTs\";s:10:\"created_at\";s:19:\"2024-07-04 16:12:00\";s:10:\"updated_at\";s:19:\"2024-07-04 16:12:00\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:5;s:5:\"title\";s:7:\"M.Amine\";s:9:\"video_key\";s:11:\"BVv7-VMbSTs\";s:10:\"created_at\";s:19:\"2024-07-04 16:12:00\";s:10:\"updated_at\";s:19:\"2024-07-04 16:12:00\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:5:\"title\";i:1;s:9:\"video_key\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:4;O:21:\"App\\Models\\Avisvideos\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"avisvideos\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:4;s:5:\"title\";s:7:\"M.Karim\";s:9:\"video_key\";s:11:\"Uv5hJwSQswE\";s:10:\"created_at\";s:19:\"2024-07-03 13:19:45\";s:10:\"updated_at\";s:19:\"2024-07-03 13:23:21\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:4;s:5:\"title\";s:7:\"M.Karim\";s:9:\"video_key\";s:11:\"Uv5hJwSQswE\";s:10:\"created_at\";s:19:\"2024-07-03 13:19:45\";s:10:\"updated_at\";s:19:\"2024-07-03 13:23:21\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:5:\"title\";i:1;s:9:\"video_key\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:5;O:21:\"App\\Models\\Avisvideos\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"avisvideos\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:3;s:5:\"title\";s:9:\"M.Yassine\";s:9:\"video_key\";s:11:\"RnA7_K5OMlc\";s:10:\"created_at\";s:19:\"2024-05-14 15:53:26\";s:10:\"updated_at\";s:19:\"2024-07-04 16:12:23\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:3;s:5:\"title\";s:9:\"M.Yassine\";s:9:\"video_key\";s:11:\"RnA7_K5OMlc\";s:10:\"created_at\";s:19:\"2024-05-14 15:53:26\";s:10:\"updated_at\";s:19:\"2024-07-04 16:12:23\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:5:\"title\";i:1;s:9:\"video_key\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1760611443);
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_brands', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:24:{i:2;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:3;s:4:\"name\";s:4:\"AUDI\";s:4:\"logo\";s:19:\"audi-1707227800.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 12:56:40\";s:10:\"updated_at\";s:19:\"2024-02-06 12:57:11\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:3;s:4:\"name\";s:4:\"AUDI\";s:4:\"logo\";s:19:\"audi-1707227800.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 12:56:40\";s:10:\"updated_at\";s:19:\"2024-02-06 12:57:11\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:3;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:4;s:4:\"name\";s:3:\"BMW\";s:4:\"logo\";s:18:\"bmw-1707227856.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 12:57:36\";s:10:\"updated_at\";s:19:\"2024-02-06 12:57:36\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:4;s:4:\"name\";s:3:\"BMW\";s:4:\"logo\";s:18:\"bmw-1707227856.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 12:57:36\";s:10:\"updated_at\";s:19:\"2024-02-06 12:57:36\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:5;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:6;s:4:\"name\";s:9:\"CHEVROLET\";s:4:\"logo\";s:24:\"chevrolet-1707227932.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 12:58:52\";s:10:\"updated_at\";s:19:\"2024-02-06 12:58:52\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:6;s:4:\"name\";s:9:\"CHEVROLET\";s:4:\"logo\";s:24:\"chevrolet-1707227932.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 12:58:52\";s:10:\"updated_at\";s:19:\"2024-02-06 12:58:52\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:7;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:8;s:4:\"name\";s:7:\"CITROEN\";s:4:\"logo\";s:22:\"citroen-1707227988.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 12:59:48\";s:10:\"updated_at\";s:19:\"2024-02-06 12:59:48\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:8;s:4:\"name\";s:7:\"CITROEN\";s:4:\"logo\";s:22:\"citroen-1707227988.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 12:59:48\";s:10:\"updated_at\";s:19:\"2024-02-06 12:59:48\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:9;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:10;s:4:\"name\";s:5:\"DACIA\";s:4:\"logo\";s:20:\"dacia-1707228045.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:00:45\";s:10:\"updated_at\";s:19:\"2024-02-06 13:00:45\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:10;s:4:\"name\";s:5:\"DACIA\";s:4:\"logo\";s:20:\"dacia-1707228045.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:00:45\";s:10:\"updated_at\";s:19:\"2024-02-06 13:00:45\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:13;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:14;s:4:\"name\";s:2:\"DS\";s:4:\"logo\";s:17:\"ds-1707228155.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:02:35\";s:10:\"updated_at\";s:19:\"2024-02-06 13:02:35\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:14;s:4:\"name\";s:2:\"DS\";s:4:\"logo\";s:17:\"ds-1707228155.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:02:35\";s:10:\"updated_at\";s:19:\"2024-02-06 13:02:35\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:14;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:15;s:4:\"name\";s:4:\"FIAT\";s:4:\"logo\";s:19:\"fiat-1707228180.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:03:00\";s:10:\"updated_at\";s:19:\"2024-02-06 13:03:00\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:15;s:4:\"name\";s:4:\"FIAT\";s:4:\"logo\";s:19:\"fiat-1707228180.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:03:00\";s:10:\"updated_at\";s:19:\"2024-02-06 13:03:00\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:15;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:16;s:4:\"name\";s:4:\"FORD\";s:4:\"logo\";s:19:\"ford-1707228198.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:03:18\";s:10:\"updated_at\";s:19:\"2024-02-06 13:03:18\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:16;s:4:\"name\";s:4:\"FORD\";s:4:\"logo\";s:19:\"ford-1707228198.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:03:18\";s:10:\"updated_at\";s:19:\"2024-02-06 13:03:18\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:18;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:19;s:4:\"name\";s:5:\"HONDA\";s:4:\"logo\";s:20:\"honda-1707228272.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:04:32\";s:10:\"updated_at\";s:19:\"2024-02-06 13:04:32\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:19;s:4:\"name\";s:5:\"HONDA\";s:4:\"logo\";s:20:\"honda-1707228272.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:04:32\";s:10:\"updated_at\";s:19:\"2024-02-06 13:04:32\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:20;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:21;s:4:\"name\";s:7:\"HYUNDAI\";s:4:\"logo\";s:22:\"hyundai-1707228297.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:04:57\";s:10:\"updated_at\";s:19:\"2024-02-06 13:04:57\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:21;s:4:\"name\";s:7:\"HYUNDAI\";s:4:\"logo\";s:22:\"hyundai-1707228297.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:04:57\";s:10:\"updated_at\";s:19:\"2024-02-06 13:04:57\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:23;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:24;s:4:\"name\";s:4:\"JEEP\";s:4:\"logo\";s:19:\"jeep-1707228354.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:05:54\";s:10:\"updated_at\";s:19:\"2024-02-06 13:05:54\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:24;s:4:\"name\";s:4:\"JEEP\";s:4:\"logo\";s:19:\"jeep-1707228354.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:05:54\";s:10:\"updated_at\";s:19:\"2024-02-06 13:05:54\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:24;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:25;s:4:\"name\";s:3:\"KIA\";s:4:\"logo\";s:18:\"kia-1707228364.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:06:04\";s:10:\"updated_at\";s:19:\"2024-02-06 13:06:04\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:25;s:4:\"name\";s:3:\"KIA\";s:4:\"logo\";s:18:\"kia-1707228364.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:06:04\";s:10:\"updated_at\";s:19:\"2024-02-06 13:06:04\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:26;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:27;s:4:\"name\";s:10:\"LAND ROVER\";s:4:\"logo\";s:25:\"land-rover-1707228401.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:06:41\";s:10:\"updated_at\";s:19:\"2024-02-06 13:06:41\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:27;s:4:\"name\";s:10:\"LAND ROVER\";s:4:\"logo\";s:25:\"land-rover-1707228401.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:06:41\";s:10:\"updated_at\";s:19:\"2024-02-06 13:06:41\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:31;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:32;s:4:\"name\";s:8:\"MERCEDES\";s:4:\"logo\";s:23:\"mercedes-1707228505.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:08:25\";s:10:\"updated_at\";s:19:\"2024-02-06 13:08:25\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:32;s:4:\"name\";s:8:\"MERCEDES\";s:4:\"logo\";s:23:\"mercedes-1707228505.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:08:25\";s:10:\"updated_at\";s:19:\"2024-02-06 13:08:25\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:34;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:35;s:4:\"name\";s:6:\"NISSAN\";s:4:\"logo\";s:21:\"nissan-1707228569.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:09:29\";s:10:\"updated_at\";s:19:\"2024-02-06 13:09:29\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:35;s:4:\"name\";s:6:\"NISSAN\";s:4:\"logo\";s:21:\"nissan-1707228569.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:09:29\";s:10:\"updated_at\";s:19:\"2024-02-06 13:09:29\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:35;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:36;s:4:\"name\";s:4:\"OPEL\";s:4:\"logo\";s:19:\"opel-1707228581.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:09:41\";s:10:\"updated_at\";s:19:\"2024-02-06 13:09:41\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:36;s:4:\"name\";s:4:\"OPEL\";s:4:\"logo\";s:19:\"opel-1707228581.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:09:41\";s:10:\"updated_at\";s:19:\"2024-02-06 13:09:41\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:36;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:37;s:4:\"name\";s:7:\"PEUGEOT\";s:4:\"logo\";s:22:\"peugeot-1707228598.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:09:58\";s:10:\"updated_at\";s:19:\"2024-02-06 13:09:58\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:37;s:4:\"name\";s:7:\"PEUGEOT\";s:4:\"logo\";s:22:\"peugeot-1707228598.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:09:58\";s:10:\"updated_at\";s:19:\"2024-02-06 13:09:58\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:37;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:38;s:4:\"name\";s:7:\"PORSCHE\";s:4:\"logo\";s:22:\"porsche-1707228614.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:10:14\";s:10:\"updated_at\";s:19:\"2024-02-06 13:10:14\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:38;s:4:\"name\";s:7:\"PORSCHE\";s:4:\"logo\";s:22:\"porsche-1707228614.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:10:14\";s:10:\"updated_at\";s:19:\"2024-02-06 13:10:14\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:38;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:39;s:4:\"name\";s:7:\"RENAULT\";s:4:\"logo\";s:22:\"renault-1707228630.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:10:30\";s:10:\"updated_at\";s:19:\"2024-02-06 13:10:30\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:39;s:4:\"name\";s:7:\"RENAULT\";s:4:\"logo\";s:22:\"renault-1707228630.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:10:30\";s:10:\"updated_at\";s:19:\"2024-02-06 13:10:30\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:39;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:40;s:4:\"name\";s:4:\"SEAT\";s:4:\"logo\";s:19:\"seat-1707228641.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:10:41\";s:10:\"updated_at\";s:19:\"2024-02-06 13:10:41\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:40;s:4:\"name\";s:4:\"SEAT\";s:4:\"logo\";s:19:\"seat-1707228641.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:10:41\";s:10:\"updated_at\";s:19:\"2024-02-06 13:10:41\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:40;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:41;s:4:\"name\";s:5:\"SKODA\";s:4:\"logo\";s:20:\"skoda-1707228661.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:11:01\";s:10:\"updated_at\";s:19:\"2024-02-06 13:11:01\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:41;s:4:\"name\";s:5:\"SKODA\";s:4:\"logo\";s:20:\"skoda-1707228661.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:11:01\";s:10:\"updated_at\";s:19:\"2024-02-06 13:11:01\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:44;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:45;s:4:\"name\";s:6:\"TOYOTA\";s:4:\"logo\";s:21:\"toyota-1707228730.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:12:10\";s:10:\"updated_at\";s:19:\"2024-02-06 13:12:10\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:45;s:4:\"name\";s:6:\"TOYOTA\";s:4:\"logo\";s:21:\"toyota-1707228730.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:12:10\";s:10:\"updated_at\";s:19:\"2024-02-06 13:12:10\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:45;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:46;s:4:\"name\";s:10:\"VOLKSWAGEN\";s:4:\"logo\";s:25:\"volkswagen-1707228743.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:12:23\";s:10:\"updated_at\";s:19:\"2024-02-06 13:12:23\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:46;s:4:\"name\";s:10:\"VOLKSWAGEN\";s:4:\"logo\";s:25:\"volkswagen-1707228743.png\";s:7:\"user_id\";i:1;s:2:\"ip\";s:14:\"81.192.111.244\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2024-02-06 13:12:23\";s:10:\"updated_at\";s:19:\"2024-02-06 13:12:23\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:47;O:16:\"App\\Models\\Brand\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"brands\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:48;s:4:\"name\";s:5:\"TESLA\";s:4:\"logo\";s:20:\"tesla-1738948636.png\";s:7:\"user_id\";i:2;s:2:\"ip\";s:15:\"105.157.255.167\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2025-02-07 16:17:16\";s:10:\"updated_at\";s:19:\"2025-02-07 16:17:16\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:48;s:4:\"name\";s:5:\"TESLA\";s:4:\"logo\";s:20:\"tesla-1738948636.png\";s:7:\"user_id\";i:2;s:2:\"ip\";s:15:\"105.157.255.167\";s:10:\"user_agent\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36\";s:10:\"created_at\";s:19:\"2025-02-07 16:17:16\";s:10:\"updated_at\";s:19:\"2025-02-07 16:17:16\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"logo\";i:2;s:2:\"ip\";i:3;s:10:\"user_agent\";i:4;s:7:\"user_id\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1760611443);
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_Imgslider', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:6:{i:0;O:20:\"App\\Models\\Imgslider\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"imgsliders\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:1;s:4:\"name\";s:12:\"slide nado 1\";s:5:\"image\";s:27:\"slide-nado-1-1731583264.png\";s:4:\"link\";s:15:\"https://nado.ma\";s:4:\"type\";s:7:\"desktop\";s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2024-02-06 13:24:17\";s:10:\"updated_at\";s:19:\"2024-11-14 10:21:05\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:1;s:4:\"name\";s:12:\"slide nado 1\";s:5:\"image\";s:27:\"slide-nado-1-1731583264.png\";s:4:\"link\";s:15:\"https://nado.ma\";s:4:\"type\";s:7:\"desktop\";s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2024-02-06 13:24:17\";s:10:\"updated_at\";s:19:\"2024-11-14 10:21:05\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"link\";i:2;s:5:\"image\";i:3;s:4:\"type\";i:4;s:6:\"active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:1;O:20:\"App\\Models\\Imgslider\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"imgsliders\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:2;s:4:\"name\";s:12:\"slide nado 2\";s:5:\"image\";s:27:\"slide-nado-2-1731583281.png\";s:4:\"link\";s:16:\"https://nado.ma/\";s:4:\"type\";s:7:\"desktop\";s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2024-02-06 13:24:34\";s:10:\"updated_at\";s:19:\"2024-11-14 10:21:21\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:2;s:4:\"name\";s:12:\"slide nado 2\";s:5:\"image\";s:27:\"slide-nado-2-1731583281.png\";s:4:\"link\";s:16:\"https://nado.ma/\";s:4:\"type\";s:7:\"desktop\";s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2024-02-06 13:24:34\";s:10:\"updated_at\";s:19:\"2024-11-14 10:21:21\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"link\";i:2;s:5:\"image\";i:3;s:4:\"type\";i:4;s:6:\"active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:2;O:20:\"App\\Models\\Imgslider\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"imgsliders\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:4;s:4:\"name\";s:12:\"slide nado 4\";s:5:\"image\";s:27:\"slide-nado-4-1731582727.jpg\";s:4:\"link\";s:1:\"#\";s:4:\"type\";s:7:\"desktop\";s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2024-02-06 13:25:13\";s:10:\"updated_at\";s:19:\"2025-02-13 10:38:58\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:4;s:4:\"name\";s:12:\"slide nado 4\";s:5:\"image\";s:27:\"slide-nado-4-1731582727.jpg\";s:4:\"link\";s:1:\"#\";s:4:\"type\";s:7:\"desktop\";s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2024-02-06 13:25:13\";s:10:\"updated_at\";s:19:\"2025-02-13 10:38:58\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"link\";i:2;s:5:\"image\";i:3;s:4:\"type\";i:4;s:6:\"active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:3;O:20:\"App\\Models\\Imgslider\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"imgsliders\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:5;s:4:\"name\";s:12:\"slide nado 5\";s:5:\"image\";s:27:\"slide-nado-5-1731582705.jpg\";s:4:\"link\";s:21:\"https://nado.ma/vente\";s:4:\"type\";s:7:\"desktop\";s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2024-02-06 13:25:30\";s:10:\"updated_at\";s:19:\"2024-11-14 10:11:45\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:5;s:4:\"name\";s:12:\"slide nado 5\";s:5:\"image\";s:27:\"slide-nado-5-1731582705.jpg\";s:4:\"link\";s:21:\"https://nado.ma/vente\";s:4:\"type\";s:7:\"desktop\";s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2024-02-06 13:25:30\";s:10:\"updated_at\";s:19:\"2024-11-14 10:11:45\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"link\";i:2;s:5:\"image\";i:3;s:4:\"type\";i:4;s:6:\"active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:4;O:20:\"App\\Models\\Imgslider\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"imgsliders\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:6;s:4:\"name\";s:12:\"slide nado 6\";s:5:\"image\";s:27:\"slide-nado-6-1731582749.jpg\";s:4:\"link\";s:1:\"#\";s:4:\"type\";s:7:\"desktop\";s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2024-02-06 13:25:53\";s:10:\"updated_at\";s:19:\"2024-12-26 14:04:18\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:6;s:4:\"name\";s:12:\"slide nado 6\";s:5:\"image\";s:27:\"slide-nado-6-1731582749.jpg\";s:4:\"link\";s:1:\"#\";s:4:\"type\";s:7:\"desktop\";s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2024-02-06 13:25:53\";s:10:\"updated_at\";s:19:\"2024-12-26 14:04:18\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"link\";i:2;s:5:\"image\";i:3;s:4:\"type\";i:4;s:6:\"active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:5;O:20:\"App\\Models\\Imgslider\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"imgsliders\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:12;s:4:\"name\";s:12:\"slide nado 7\";s:5:\"image\";s:27:\"slide-nado-7-1735227988.jpg\";s:4:\"link\";s:15:\"https://nado.ma\";s:4:\"type\";s:7:\"desktop\";s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2024-12-26 14:23:45\";s:10:\"updated_at\";s:19:\"2024-12-26 14:46:30\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:12;s:4:\"name\";s:12:\"slide nado 7\";s:5:\"image\";s:27:\"slide-nado-7-1735227988.jpg\";s:4:\"link\";s:15:\"https://nado.ma\";s:4:\"type\";s:7:\"desktop\";s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2024-12-26 14:23:45\";s:10:\"updated_at\";s:19:\"2024-12-26 14:46:30\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:4:\"name\";i:1;s:4:\"link\";i:2;s:5:\"image\";i:3;s:4:\"type\";i:4;s:6:\"active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1760611443);
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_similar_ads', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:9:{i:0;O:19:\"App\\Models\\Annonces\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"annonces\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:114:{s:2:\"id\";i:156;s:5:\"phone\";s:10:\"0770080009\";s:7:\"pack_id\";N;s:5:\"titre\";s:27:\"AUDI Q2 TDI 35 150 CH URBAN\";s:4:\"prix\";i:267000;s:4:\"mark\";s:1:\"3\";s:6:\"modele\";s:3:\"117\";s:9:\"matricule\";N;s:4:\"year\";i:2020;s:2:\"km\";i:70000;s:9:\"carburant\";s:6:\"diesel\";s:3:\"box\";s:11:\"automatique\";s:4:\"etat\";s:9:\"excellent\";s:4:\"city\";s:27:\"Casablanca-Jnane Californie\";s:2:\"cv\";s:1:\"8\";s:7:\"nb_Door\";i:5;s:7:\"origine\";s:11:\"WW au Maroc\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";s:12:\"/o5pmU-N72Ug\";s:4:\"reel\";s:11:\"KFZ0mTbTnZU\";s:8:\"bodywork\";s:10:\"suv et 4x4\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:43:\"[\"audi-q2-460538.JPG\",\"audi-q2-460538.JPG\"]\";s:5:\"image\";N;s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";N;s:3:\"co2\";N;s:8:\"certifie\";i:1;s:10:\"particulie\";i:1;s:8:\"showroom\";i:1;s:7:\"finance\";i:1;s:7:\"jantesA\";i:0;s:7:\"airbags\";i:1;s:13:\"climatisation\";i:1;s:3:\"gps\";i:1;s:12:\"toit_ouvrant\";i:0;s:19:\"double_toit_ouvrant\";i:0;s:10:\"siege_cuir\";i:0;s:11:\"radar_recul\";i:1;s:12:\"camera_recul\";i:1;s:10:\"vitreselec\";i:1;s:3:\"abs\";i:1;s:3:\"eps\";i:1;s:2:\"rv\";i:1;s:2:\"lv\";i:1;s:2:\"cd\";i:1;s:10:\"ordinateur\";i:0;s:12:\"verrouillage\";i:1;s:8:\"garantie\";i:1;s:5:\"views\";i:67;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-09-10 09:17:16\";s:10:\"updated_at\";s:19:\"2025-10-08 14:25:50\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:0;s:6:\"colors\";s:4:\"Noir\";s:3:\"esp\";i:0;s:12:\"antipatinage\";i:0;s:21:\"aide_freinage_urgence\";i:0;s:26:\"antidemarrage_electronique\";i:0;s:19:\"aide_demarrage_cote\";i:0;s:23:\"selecteur_mode_conduite\";i:0;s:17:\"detection_fatigue\";i:0;s:21:\"maintien_dans_la_voie\";i:0;s:20:\"detecteur_angle_mort\";i:0;s:23:\"detecteur_sous_gonflage\";i:0;s:21:\"fermeture_portes_auto\";i:0;s:18:\"preparation_isofix\";i:0;s:21:\"phares_antibrouillard\";i:0;s:14:\"systeme_alarme\";i:0;s:10:\"start_stop\";i:0;s:18:\"regulateur_vitesse\";i:0;s:15:\"detecteur_pluie\";i:0;s:18:\"allumage_auto_feux\";i:0;s:21:\"frein_main_electrique\";i:0;s:18:\"aide_stationnement\";i:0;s:15:\"volant_reglable\";i:0;s:18:\"retros_electriques\";i:0;s:24:\"retros_rabat_electriques\";i:0;s:17:\"coffre_electrique\";i:0;s:18:\"sieges_electriques\";i:0;s:19:\"sieges_elec_memoire\";i:0;s:20:\"banquette_rabattable\";i:0;s:13:\"ecran_tactile\";i:0;s:15:\"cockpit_digital\";i:0;s:16:\"commandes_volant\";i:0;s:17:\"commandes_vocales\";i:0;s:23:\"reconnaissance_panneaux\";i:0;s:20:\"affichage_tete_haute\";i:0;s:13:\"systeme_audio\";i:0;s:9:\"wifi_bord\";i:0;s:9:\"bluetooth\";i:0;s:24:\"compatibilite_smartphone\";i:0;s:26:\"apple_carplay_android_auto\";i:0;s:17:\"chargeur_sans_fil\";i:0;s:25:\"sellerie_similicuir_tissu\";i:0;s:11:\"volant_cuir\";i:0;s:14:\"follow_me_home\";i:0;s:16:\"lumiere_ambiance\";i:0;s:13:\"feux_jour_led\";i:0;s:15:\"phares_full_led\";i:0;s:16:\"toit_panoramique\";i:0;s:14:\"barres_de_toit\";i:0;s:18:\"vitres_surteintees\";i:0;}s:11:\"\0*\0original\";a:114:{s:2:\"id\";i:156;s:5:\"phone\";s:10:\"0770080009\";s:7:\"pack_id\";N;s:5:\"titre\";s:27:\"AUDI Q2 TDI 35 150 CH URBAN\";s:4:\"prix\";i:267000;s:4:\"mark\";s:1:\"3\";s:6:\"modele\";s:3:\"117\";s:9:\"matricule\";N;s:4:\"year\";i:2020;s:2:\"km\";i:70000;s:9:\"carburant\";s:6:\"diesel\";s:3:\"box\";s:11:\"automatique\";s:4:\"etat\";s:9:\"excellent\";s:4:\"city\";s:27:\"Casablanca-Jnane Californie\";s:2:\"cv\";s:1:\"8\";s:7:\"nb_Door\";i:5;s:7:\"origine\";s:11:\"WW au Maroc\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";s:12:\"/o5pmU-N72Ug\";s:4:\"reel\";s:11:\"KFZ0mTbTnZU\";s:8:\"bodywork\";s:10:\"suv et 4x4\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:43:\"[\"audi-q2-460538.JPG\",\"audi-q2-460538.JPG\"]\";s:5:\"image\";N;s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";N;s:3:\"co2\";N;s:8:\"certifie\";i:1;s:10:\"particulie\";i:1;s:8:\"showroom\";i:1;s:7:\"finance\";i:1;s:7:\"jantesA\";i:0;s:7:\"airbags\";i:1;s:13:\"climatisation\";i:1;s:3:\"gps\";i:1;s:12:\"toit_ouvrant\";i:0;s:19:\"double_toit_ouvrant\";i:0;s:10:\"siege_cuir\";i:0;s:11:\"radar_recul\";i:1;s:12:\"camera_recul\";i:1;s:10:\"vitreselec\";i:1;s:3:\"abs\";i:1;s:3:\"eps\";i:1;s:2:\"rv\";i:1;s:2:\"lv\";i:1;s:2:\"cd\";i:1;s:10:\"ordinateur\";i:0;s:12:\"verrouillage\";i:1;s:8:\"garantie\";i:1;s:5:\"views\";i:67;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-09-10 09:17:16\";s:10:\"updated_at\";s:19:\"2025-10-08 14:25:50\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:0;s:6:\"colors\";s:4:\"Noir\";s:3:\"esp\";i:0;s:12:\"antipatinage\";i:0;s:21:\"aide_freinage_urgence\";i:0;s:26:\"antidemarrage_electronique\";i:0;s:19:\"aide_demarrage_cote\";i:0;s:23:\"selecteur_mode_conduite\";i:0;s:17:\"detection_fatigue\";i:0;s:21:\"maintien_dans_la_voie\";i:0;s:20:\"detecteur_angle_mort\";i:0;s:23:\"detecteur_sous_gonflage\";i:0;s:21:\"fermeture_portes_auto\";i:0;s:18:\"preparation_isofix\";i:0;s:21:\"phares_antibrouillard\";i:0;s:14:\"systeme_alarme\";i:0;s:10:\"start_stop\";i:0;s:18:\"regulateur_vitesse\";i:0;s:15:\"detecteur_pluie\";i:0;s:18:\"allumage_auto_feux\";i:0;s:21:\"frein_main_electrique\";i:0;s:18:\"aide_stationnement\";i:0;s:15:\"volant_reglable\";i:0;s:18:\"retros_electriques\";i:0;s:24:\"retros_rabat_electriques\";i:0;s:17:\"coffre_electrique\";i:0;s:18:\"sieges_electriques\";i:0;s:19:\"sieges_elec_memoire\";i:0;s:20:\"banquette_rabattable\";i:0;s:13:\"ecran_tactile\";i:0;s:15:\"cockpit_digital\";i:0;s:16:\"commandes_volant\";i:0;s:17:\"commandes_vocales\";i:0;s:23:\"reconnaissance_panneaux\";i:0;s:20:\"affichage_tete_haute\";i:0;s:13:\"systeme_audio\";i:0;s:9:\"wifi_bord\";i:0;s:9:\"bluetooth\";i:0;s:24:\"compatibilite_smartphone\";i:0;s:26:\"apple_carplay_android_auto\";i:0;s:17:\"chargeur_sans_fil\";i:0;s:25:\"sellerie_similicuir_tissu\";i:0;s:11:\"volant_cuir\";i:0;s:14:\"follow_me_home\";i:0;s:16:\"lumiere_ambiance\";i:0;s:13:\"feux_jour_led\";i:0;s:15:\"phares_full_led\";i:0;s:16:\"toit_panoramique\";i:0;s:14:\"barres_de_toit\";i:0;s:18:\"vitres_surteintees\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:6:{s:8:\"verified\";s:7:\"boolean\";s:7:\"jantesA\";s:7:\"integer\";s:7:\"airbags\";s:7:\"integer\";s:13:\"climatisation\";s:7:\"integer\";s:6:\"images\";s:5:\"array\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:110:{i:0;s:5:\"phone\";i:1;s:7:\"pack_id\";i:2;s:5:\"titre\";i:3;s:4:\"prix\";i:4;s:4:\"mark\";i:5;s:6:\"modele\";i:6;s:9:\"matricule\";i:7;s:4:\"year\";i:8;s:2:\"km\";i:9;s:9:\"carburant\";i:10;s:3:\"box\";i:11;s:4:\"etat\";i:12;s:4:\"city\";i:13;s:2:\"cv\";i:14;s:7:\"nb_Door\";i:15;s:7:\"origine\";i:16;s:13:\"premiere_main\";i:17;s:5:\"video\";i:18;s:4:\"reel\";i:19;s:8:\"bodywork\";i:20;s:6:\"status\";i:21;s:5:\"image\";i:22;s:8:\"imgrleft\";i:23;s:7:\"imgrtop\";i:24;s:7:\"imgrmed\";i:25;s:10:\"imgrbottom\";i:26;s:9:\"imgrright\";i:27;s:11:\"imginterior\";i:28;s:10:\"imgrapport\";i:29;s:7:\"rapport\";i:30;s:3:\"co2\";i:31;s:8:\"certifie\";i:32;s:10:\"particulie\";i:33;s:8:\"showroom\";i:34;s:7:\"finance\";i:35;s:16:\"jantes_aluminium\";i:36;s:7:\"airbags\";i:37;s:13:\"climatisation\";i:38;s:3:\"gps\";i:39;s:12:\"toit_ouvrant\";i:40;s:19:\"double_toit_ouvrant\";i:41;s:10:\"siege_cuir\";i:42;s:11:\"radar_recul\";i:43;s:12:\"camera_recul\";i:44;s:10:\"vitreselec\";i:45;s:3:\"abs\";i:46;s:3:\"eps\";i:47;s:2:\"rv\";i:48;s:2:\"lv\";i:49;s:2:\"cd\";i:50;s:10:\"ordinateur\";i:51;s:12:\"verrouillage\";i:52;s:8:\"garantie\";i:53;s:5:\"views\";i:54;s:6:\"active\";i:55;s:8:\"verified\";i:56;s:4:\"pack\";i:57;s:17:\"featured_position\";i:58;s:16:\"show_in_homepage\";i:59;s:17:\"homepage_position\";i:60;s:11:\"is_homepage\";i:61;s:6:\"colors\";i:62;s:3:\"esp\";i:63;s:12:\"antipatinage\";i:64;s:21:\"aide_freinage_urgence\";i:65;s:26:\"antidemarrage_electronique\";i:66;s:19:\"aide_demarrage_cote\";i:67;s:23:\"selecteur_mode_conduite\";i:68;s:17:\"detection_fatigue\";i:69;s:21:\"maintien_dans_la_voie\";i:70;s:20:\"detecteur_angle_mort\";i:71;s:23:\"detecteur_sous_gonflage\";i:72;s:21:\"fermeture_portes_auto\";i:73;s:18:\"preparation_isofix\";i:74;s:21:\"phares_antibrouillard\";i:75;s:14:\"systeme_alarme\";i:76;s:10:\"start_stop\";i:77;s:18:\"regulateur_vitesse\";i:78;s:15:\"detecteur_pluie\";i:79;s:18:\"allumage_auto_feux\";i:80;s:21:\"frein_main_electrique\";i:81;s:18:\"aide_stationnement\";i:82;s:15:\"volant_reglable\";i:83;s:18:\"retros_electriques\";i:84;s:24:\"retros_rabat_electriques\";i:85;s:17:\"coffre_electrique\";i:86;s:18:\"sieges_electriques\";i:87;s:19:\"sieges_elec_memoire\";i:88;s:20:\"banquette_rabattable\";i:89;s:13:\"ecran_tactile\";i:90;s:15:\"cockpit_digital\";i:91;s:16:\"commandes_volant\";i:92;s:17:\"commandes_vocales\";i:93;s:23:\"reconnaissance_panneaux\";i:94;s:20:\"affichage_tete_haute\";i:95;s:13:\"systeme_audio\";i:96;s:9:\"wifi_bord\";i:97;s:9:\"bluetooth\";i:98;s:24:\"compatibilite_smartphone\";i:99;s:26:\"apple_carplay_android_auto\";i:100;s:17:\"chargeur_sans_fil\";i:101;s:25:\"sellerie_similicuir_tissu\";i:102;s:11:\"volant_cuir\";i:103;s:14:\"follow_me_home\";i:104;s:16:\"lumiere_ambiance\";i:105;s:13:\"feux_jour_led\";i:106;s:15:\"phares_full_led\";i:107;s:16:\"toit_panoramique\";i:108;s:14:\"barres_de_toit\";i:109;s:18:\"vitres_surteintees\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:1;O:19:\"App\\Models\\Annonces\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"annonces\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:114:{s:2:\"id\";i:155;s:5:\"phone\";s:10:\"0770080009\";s:7:\"pack_id\";N;s:5:\"titre\";s:23:\"BMW Série 1 116d Urban\";s:4:\"prix\";i:228000;s:4:\"mark\";s:1:\"4\";s:6:\"modele\";s:1:\"3\";s:9:\"matricule\";N;s:4:\"year\";i:2019;s:2:\"km\";i:124000;s:9:\"carburant\";s:6:\"diesel\";s:3:\"box\";s:11:\"automatique\";s:4:\"etat\";s:9:\"très bon\";s:4:\"city\";s:27:\"Casablanca-Jnane Californie\";s:2:\"cv\";s:1:\"6\";s:7:\"nb_Door\";i:5;s:7:\"origine\";s:11:\"WW au Maroc\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";s:11:\"vQBz11ykGDA\";s:4:\"reel\";s:11:\"vQBz11ykGDA\";s:8:\"bodywork\";s:7:\"compact\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:63:\"[\"bmw-serie-1-sport-569123.jpg\",\"bmw-serie-1-sport-569123.jpg\"]\";s:5:\"image\";s:0:\"\";s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";N;s:3:\"co2\";N;s:8:\"certifie\";i:1;s:10:\"particulie\";i:1;s:8:\"showroom\";i:1;s:7:\"finance\";i:1;s:7:\"jantesA\";i:0;s:7:\"airbags\";i:1;s:13:\"climatisation\";i:1;s:3:\"gps\";i:1;s:12:\"toit_ouvrant\";i:0;s:19:\"double_toit_ouvrant\";i:0;s:10:\"siege_cuir\";i:1;s:11:\"radar_recul\";i:1;s:12:\"camera_recul\";i:1;s:10:\"vitreselec\";i:1;s:3:\"abs\";i:1;s:3:\"eps\";i:1;s:2:\"rv\";i:1;s:2:\"lv\";i:1;s:2:\"cd\";i:1;s:10:\"ordinateur\";i:1;s:12:\"verrouillage\";i:1;s:8:\"garantie\";i:1;s:5:\"views\";i:44;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-09-04 17:40:46\";s:10:\"updated_at\";s:19:\"2025-10-08 14:55:13\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:0;s:6:\"colors\";s:5:\"Blanc\";s:3:\"esp\";i:0;s:12:\"antipatinage\";i:0;s:21:\"aide_freinage_urgence\";i:0;s:26:\"antidemarrage_electronique\";i:0;s:19:\"aide_demarrage_cote\";i:0;s:23:\"selecteur_mode_conduite\";i:0;s:17:\"detection_fatigue\";i:0;s:21:\"maintien_dans_la_voie\";i:0;s:20:\"detecteur_angle_mort\";i:0;s:23:\"detecteur_sous_gonflage\";i:0;s:21:\"fermeture_portes_auto\";i:0;s:18:\"preparation_isofix\";i:0;s:21:\"phares_antibrouillard\";i:0;s:14:\"systeme_alarme\";i:0;s:10:\"start_stop\";i:0;s:18:\"regulateur_vitesse\";i:0;s:15:\"detecteur_pluie\";i:0;s:18:\"allumage_auto_feux\";i:0;s:21:\"frein_main_electrique\";i:0;s:18:\"aide_stationnement\";i:0;s:15:\"volant_reglable\";i:0;s:18:\"retros_electriques\";i:0;s:24:\"retros_rabat_electriques\";i:0;s:17:\"coffre_electrique\";i:0;s:18:\"sieges_electriques\";i:0;s:19:\"sieges_elec_memoire\";i:0;s:20:\"banquette_rabattable\";i:0;s:13:\"ecran_tactile\";i:0;s:15:\"cockpit_digital\";i:0;s:16:\"commandes_volant\";i:0;s:17:\"commandes_vocales\";i:0;s:23:\"reconnaissance_panneaux\";i:0;s:20:\"affichage_tete_haute\";i:0;s:13:\"systeme_audio\";i:0;s:9:\"wifi_bord\";i:0;s:9:\"bluetooth\";i:0;s:24:\"compatibilite_smartphone\";i:0;s:26:\"apple_carplay_android_auto\";i:0;s:17:\"chargeur_sans_fil\";i:0;s:25:\"sellerie_similicuir_tissu\";i:0;s:11:\"volant_cuir\";i:0;s:14:\"follow_me_home\";i:0;s:16:\"lumiere_ambiance\";i:0;s:13:\"feux_jour_led\";i:0;s:15:\"phares_full_led\";i:0;s:16:\"toit_panoramique\";i:0;s:14:\"barres_de_toit\";i:0;s:18:\"vitres_surteintees\";i:0;}s:11:\"\0*\0original\";a:114:{s:2:\"id\";i:155;s:5:\"phone\";s:10:\"0770080009\";s:7:\"pack_id\";N;s:5:\"titre\";s:23:\"BMW Série 1 116d Urban\";s:4:\"prix\";i:228000;s:4:\"mark\";s:1:\"4\";s:6:\"modele\";s:1:\"3\";s:9:\"matricule\";N;s:4:\"year\";i:2019;s:2:\"km\";i:124000;s:9:\"carburant\";s:6:\"diesel\";s:3:\"box\";s:11:\"automatique\";s:4:\"etat\";s:9:\"très bon\";s:4:\"city\";s:27:\"Casablanca-Jnane Californie\";s:2:\"cv\";s:1:\"6\";s:7:\"nb_Door\";i:5;s:7:\"origine\";s:11:\"WW au Maroc\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";s:11:\"vQBz11ykGDA\";s:4:\"reel\";s:11:\"vQBz11ykGDA\";s:8:\"bodywork\";s:7:\"compact\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:63:\"[\"bmw-serie-1-sport-569123.jpg\",\"bmw-serie-1-sport-569123.jpg\"]\";s:5:\"image\";s:0:\"\";s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";N;s:3:\"co2\";N;s:8:\"certifie\";i:1;s:10:\"particulie\";i:1;s:8:\"showroom\";i:1;s:7:\"finance\";i:1;s:7:\"jantesA\";i:0;s:7:\"airbags\";i:1;s:13:\"climatisation\";i:1;s:3:\"gps\";i:1;s:12:\"toit_ouvrant\";i:0;s:19:\"double_toit_ouvrant\";i:0;s:10:\"siege_cuir\";i:1;s:11:\"radar_recul\";i:1;s:12:\"camera_recul\";i:1;s:10:\"vitreselec\";i:1;s:3:\"abs\";i:1;s:3:\"eps\";i:1;s:2:\"rv\";i:1;s:2:\"lv\";i:1;s:2:\"cd\";i:1;s:10:\"ordinateur\";i:1;s:12:\"verrouillage\";i:1;s:8:\"garantie\";i:1;s:5:\"views\";i:44;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-09-04 17:40:46\";s:10:\"updated_at\";s:19:\"2025-10-08 14:55:13\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:0;s:6:\"colors\";s:5:\"Blanc\";s:3:\"esp\";i:0;s:12:\"antipatinage\";i:0;s:21:\"aide_freinage_urgence\";i:0;s:26:\"antidemarrage_electronique\";i:0;s:19:\"aide_demarrage_cote\";i:0;s:23:\"selecteur_mode_conduite\";i:0;s:17:\"detection_fatigue\";i:0;s:21:\"maintien_dans_la_voie\";i:0;s:20:\"detecteur_angle_mort\";i:0;s:23:\"detecteur_sous_gonflage\";i:0;s:21:\"fermeture_portes_auto\";i:0;s:18:\"preparation_isofix\";i:0;s:21:\"phares_antibrouillard\";i:0;s:14:\"systeme_alarme\";i:0;s:10:\"start_stop\";i:0;s:18:\"regulateur_vitesse\";i:0;s:15:\"detecteur_pluie\";i:0;s:18:\"allumage_auto_feux\";i:0;s:21:\"frein_main_electrique\";i:0;s:18:\"aide_stationnement\";i:0;s:15:\"volant_reglable\";i:0;s:18:\"retros_electriques\";i:0;s:24:\"retros_rabat_electriques\";i:0;s:17:\"coffre_electrique\";i:0;s:18:\"sieges_electriques\";i:0;s:19:\"sieges_elec_memoire\";i:0;s:20:\"banquette_rabattable\";i:0;s:13:\"ecran_tactile\";i:0;s:15:\"cockpit_digital\";i:0;s:16:\"commandes_volant\";i:0;s:17:\"commandes_vocales\";i:0;s:23:\"reconnaissance_panneaux\";i:0;s:20:\"affichage_tete_haute\";i:0;s:13:\"systeme_audio\";i:0;s:9:\"wifi_bord\";i:0;s:9:\"bluetooth\";i:0;s:24:\"compatibilite_smartphone\";i:0;s:26:\"apple_carplay_android_auto\";i:0;s:17:\"chargeur_sans_fil\";i:0;s:25:\"sellerie_similicuir_tissu\";i:0;s:11:\"volant_cuir\";i:0;s:14:\"follow_me_home\";i:0;s:16:\"lumiere_ambiance\";i:0;s:13:\"feux_jour_led\";i:0;s:15:\"phares_full_led\";i:0;s:16:\"toit_panoramique\";i:0;s:14:\"barres_de_toit\";i:0;s:18:\"vitres_surteintees\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:6:{s:8:\"verified\";s:7:\"boolean\";s:7:\"jantesA\";s:7:\"integer\";s:7:\"airbags\";s:7:\"integer\";s:13:\"climatisation\";s:7:\"integer\";s:6:\"images\";s:5:\"array\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:110:{i:0;s:5:\"phone\";i:1;s:7:\"pack_id\";i:2;s:5:\"titre\";i:3;s:4:\"prix\";i:4;s:4:\"mark\";i:5;s:6:\"modele\";i:6;s:9:\"matricule\";i:7;s:4:\"year\";i:8;s:2:\"km\";i:9;s:9:\"carburant\";i:10;s:3:\"box\";i:11;s:4:\"etat\";i:12;s:4:\"city\";i:13;s:2:\"cv\";i:14;s:7:\"nb_Door\";i:15;s:7:\"origine\";i:16;s:13:\"premiere_main\";i:17;s:5:\"video\";i:18;s:4:\"reel\";i:19;s:8:\"bodywork\";i:20;s:6:\"status\";i:21;s:5:\"image\";i:22;s:8:\"imgrleft\";i:23;s:7:\"imgrtop\";i:24;s:7:\"imgrmed\";i:25;s:10:\"imgrbottom\";i:26;s:9:\"imgrright\";i:27;s:11:\"imginterior\";i:28;s:10:\"imgrapport\";i:29;s:7:\"rapport\";i:30;s:3:\"co2\";i:31;s:8:\"certifie\";i:32;s:10:\"particulie\";i:33;s:8:\"showroom\";i:34;s:7:\"finance\";i:35;s:16:\"jantes_aluminium\";i:36;s:7:\"airbags\";i:37;s:13:\"climatisation\";i:38;s:3:\"gps\";i:39;s:12:\"toit_ouvrant\";i:40;s:19:\"double_toit_ouvrant\";i:41;s:10:\"siege_cuir\";i:42;s:11:\"radar_recul\";i:43;s:12:\"camera_recul\";i:44;s:10:\"vitreselec\";i:45;s:3:\"abs\";i:46;s:3:\"eps\";i:47;s:2:\"rv\";i:48;s:2:\"lv\";i:49;s:2:\"cd\";i:50;s:10:\"ordinateur\";i:51;s:12:\"verrouillage\";i:52;s:8:\"garantie\";i:53;s:5:\"views\";i:54;s:6:\"active\";i:55;s:8:\"verified\";i:56;s:4:\"pack\";i:57;s:17:\"featured_position\";i:58;s:16:\"show_in_homepage\";i:59;s:17:\"homepage_position\";i:60;s:11:\"is_homepage\";i:61;s:6:\"colors\";i:62;s:3:\"esp\";i:63;s:12:\"antipatinage\";i:64;s:21:\"aide_freinage_urgence\";i:65;s:26:\"antidemarrage_electronique\";i:66;s:19:\"aide_demarrage_cote\";i:67;s:23:\"selecteur_mode_conduite\";i:68;s:17:\"detection_fatigue\";i:69;s:21:\"maintien_dans_la_voie\";i:70;s:20:\"detecteur_angle_mort\";i:71;s:23:\"detecteur_sous_gonflage\";i:72;s:21:\"fermeture_portes_auto\";i:73;s:18:\"preparation_isofix\";i:74;s:21:\"phares_antibrouillard\";i:75;s:14:\"systeme_alarme\";i:76;s:10:\"start_stop\";i:77;s:18:\"regulateur_vitesse\";i:78;s:15:\"detecteur_pluie\";i:79;s:18:\"allumage_auto_feux\";i:80;s:21:\"frein_main_electrique\";i:81;s:18:\"aide_stationnement\";i:82;s:15:\"volant_reglable\";i:83;s:18:\"retros_electriques\";i:84;s:24:\"retros_rabat_electriques\";i:85;s:17:\"coffre_electrique\";i:86;s:18:\"sieges_electriques\";i:87;s:19:\"sieges_elec_memoire\";i:88;s:20:\"banquette_rabattable\";i:89;s:13:\"ecran_tactile\";i:90;s:15:\"cockpit_digital\";i:91;s:16:\"commandes_volant\";i:92;s:17:\"commandes_vocales\";i:93;s:23:\"reconnaissance_panneaux\";i:94;s:20:\"affichage_tete_haute\";i:95;s:13:\"systeme_audio\";i:96;s:9:\"wifi_bord\";i:97;s:9:\"bluetooth\";i:98;s:24:\"compatibilite_smartphone\";i:99;s:26:\"apple_carplay_android_auto\";i:100;s:17:\"chargeur_sans_fil\";i:101;s:25:\"sellerie_similicuir_tissu\";i:102;s:11:\"volant_cuir\";i:103;s:14:\"follow_me_home\";i:104;s:16:\"lumiere_ambiance\";i:105;s:13:\"feux_jour_led\";i:106;s:15:\"phares_full_led\";i:107;s:16:\"toit_panoramique\";i:108;s:14:\"barres_de_toit\";i:109;s:18:\"vitres_surteintees\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:2;O:19:\"App\\Models\\Annonces\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"annonces\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:114:{s:2:\"id\";i:154;s:5:\"phone\";s:10:\"0770080009\";s:7:\"pack_id\";N;s:5:\"titre\";s:39:\"FIAT 500 1.2 l 69 Cult BVA 2018 ESSENCE\";s:4:\"prix\";i:120000;s:4:\"mark\";s:2:\"15\";s:6:\"modele\";s:3:\"524\";s:9:\"matricule\";N;s:4:\"year\";i:2018;s:2:\"km\";i:100000;s:9:\"carburant\";s:7:\"essence\";s:3:\"box\";s:11:\"automatique\";s:4:\"etat\";s:9:\"excellent\";s:4:\"city\";s:27:\"Casablanca-Jnane Californie\";s:2:\"cv\";s:1:\"7\";s:7:\"nb_Door\";i:3;s:7:\"origine\";s:11:\"WW au Maroc\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";s:11:\"W5QPI0tQzps\";s:4:\"reel\";s:11:\"9hBm0Oa7OjE\";s:8:\"bodywork\";s:8:\"citadine\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:45:\"[\"fiat-500-538783.jpg\",\"fiat-500-538783.jpg\"]\";s:5:\"image\";s:0:\"\";s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";N;s:3:\"co2\";N;s:8:\"certifie\";i:1;s:10:\"particulie\";i:1;s:8:\"showroom\";i:1;s:7:\"finance\";i:1;s:7:\"jantesA\";i:0;s:7:\"airbags\";i:0;s:13:\"climatisation\";i:1;s:3:\"gps\";i:1;s:12:\"toit_ouvrant\";i:0;s:19:\"double_toit_ouvrant\";i:0;s:10:\"siege_cuir\";i:0;s:11:\"radar_recul\";i:1;s:12:\"camera_recul\";i:0;s:10:\"vitreselec\";i:1;s:3:\"abs\";i:1;s:3:\"eps\";i:1;s:2:\"rv\";i:1;s:2:\"lv\";i:1;s:2:\"cd\";i:1;s:10:\"ordinateur\";i:0;s:12:\"verrouillage\";i:1;s:8:\"garantie\";i:1;s:5:\"views\";i:46;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-08-19 18:03:27\";s:10:\"updated_at\";s:19:\"2025-09-26 16:53:13\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:0;s:6:\"colors\";s:5:\"Blanc\";s:3:\"esp\";i:0;s:12:\"antipatinage\";i:0;s:21:\"aide_freinage_urgence\";i:0;s:26:\"antidemarrage_electronique\";i:0;s:19:\"aide_demarrage_cote\";i:0;s:23:\"selecteur_mode_conduite\";i:0;s:17:\"detection_fatigue\";i:0;s:21:\"maintien_dans_la_voie\";i:0;s:20:\"detecteur_angle_mort\";i:0;s:23:\"detecteur_sous_gonflage\";i:0;s:21:\"fermeture_portes_auto\";i:0;s:18:\"preparation_isofix\";i:0;s:21:\"phares_antibrouillard\";i:0;s:14:\"systeme_alarme\";i:0;s:10:\"start_stop\";i:0;s:18:\"regulateur_vitesse\";i:0;s:15:\"detecteur_pluie\";i:0;s:18:\"allumage_auto_feux\";i:0;s:21:\"frein_main_electrique\";i:0;s:18:\"aide_stationnement\";i:0;s:15:\"volant_reglable\";i:0;s:18:\"retros_electriques\";i:0;s:24:\"retros_rabat_electriques\";i:0;s:17:\"coffre_electrique\";i:0;s:18:\"sieges_electriques\";i:0;s:19:\"sieges_elec_memoire\";i:0;s:20:\"banquette_rabattable\";i:0;s:13:\"ecran_tactile\";i:0;s:15:\"cockpit_digital\";i:0;s:16:\"commandes_volant\";i:0;s:17:\"commandes_vocales\";i:0;s:23:\"reconnaissance_panneaux\";i:0;s:20:\"affichage_tete_haute\";i:0;s:13:\"systeme_audio\";i:0;s:9:\"wifi_bord\";i:0;s:9:\"bluetooth\";i:0;s:24:\"compatibilite_smartphone\";i:0;s:26:\"apple_carplay_android_auto\";i:0;s:17:\"chargeur_sans_fil\";i:0;s:25:\"sellerie_similicuir_tissu\";i:0;s:11:\"volant_cuir\";i:0;s:14:\"follow_me_home\";i:0;s:16:\"lumiere_ambiance\";i:0;s:13:\"feux_jour_led\";i:0;s:15:\"phares_full_led\";i:0;s:16:\"toit_panoramique\";i:0;s:14:\"barres_de_toit\";i:0;s:18:\"vitres_surteintees\";i:0;}s:11:\"\0*\0original\";a:114:{s:2:\"id\";i:154;s:5:\"phone\";s:10:\"0770080009\";s:7:\"pack_id\";N;s:5:\"titre\";s:39:\"FIAT 500 1.2 l 69 Cult BVA 2018 ESSENCE\";s:4:\"prix\";i:120000;s:4:\"mark\";s:2:\"15\";s:6:\"modele\";s:3:\"524\";s:9:\"matricule\";N;s:4:\"year\";i:2018;s:2:\"km\";i:100000;s:9:\"carburant\";s:7:\"essence\";s:3:\"box\";s:11:\"automatique\";s:4:\"etat\";s:9:\"excellent\";s:4:\"city\";s:27:\"Casablanca-Jnane Californie\";s:2:\"cv\";s:1:\"7\";s:7:\"nb_Door\";i:3;s:7:\"origine\";s:11:\"WW au Maroc\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";s:11:\"W5QPI0tQzps\";s:4:\"reel\";s:11:\"9hBm0Oa7OjE\";s:8:\"bodywork\";s:8:\"citadine\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:45:\"[\"fiat-500-538783.jpg\",\"fiat-500-538783.jpg\"]\";s:5:\"image\";s:0:\"\";s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";N;s:3:\"co2\";N;s:8:\"certifie\";i:1;s:10:\"particulie\";i:1;s:8:\"showroom\";i:1;s:7:\"finance\";i:1;s:7:\"jantesA\";i:0;s:7:\"airbags\";i:0;s:13:\"climatisation\";i:1;s:3:\"gps\";i:1;s:12:\"toit_ouvrant\";i:0;s:19:\"double_toit_ouvrant\";i:0;s:10:\"siege_cuir\";i:0;s:11:\"radar_recul\";i:1;s:12:\"camera_recul\";i:0;s:10:\"vitreselec\";i:1;s:3:\"abs\";i:1;s:3:\"eps\";i:1;s:2:\"rv\";i:1;s:2:\"lv\";i:1;s:2:\"cd\";i:1;s:10:\"ordinateur\";i:0;s:12:\"verrouillage\";i:1;s:8:\"garantie\";i:1;s:5:\"views\";i:46;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-08-19 18:03:27\";s:10:\"updated_at\";s:19:\"2025-09-26 16:53:13\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:0;s:6:\"colors\";s:5:\"Blanc\";s:3:\"esp\";i:0;s:12:\"antipatinage\";i:0;s:21:\"aide_freinage_urgence\";i:0;s:26:\"antidemarrage_electronique\";i:0;s:19:\"aide_demarrage_cote\";i:0;s:23:\"selecteur_mode_conduite\";i:0;s:17:\"detection_fatigue\";i:0;s:21:\"maintien_dans_la_voie\";i:0;s:20:\"detecteur_angle_mort\";i:0;s:23:\"detecteur_sous_gonflage\";i:0;s:21:\"fermeture_portes_auto\";i:0;s:18:\"preparation_isofix\";i:0;s:21:\"phares_antibrouillard\";i:0;s:14:\"systeme_alarme\";i:0;s:10:\"start_stop\";i:0;s:18:\"regulateur_vitesse\";i:0;s:15:\"detecteur_pluie\";i:0;s:18:\"allumage_auto_feux\";i:0;s:21:\"frein_main_electrique\";i:0;s:18:\"aide_stationnement\";i:0;s:15:\"volant_reglable\";i:0;s:18:\"retros_electriques\";i:0;s:24:\"retros_rabat_electriques\";i:0;s:17:\"coffre_electrique\";i:0;s:18:\"sieges_electriques\";i:0;s:19:\"sieges_elec_memoire\";i:0;s:20:\"banquette_rabattable\";i:0;s:13:\"ecran_tactile\";i:0;s:15:\"cockpit_digital\";i:0;s:16:\"commandes_volant\";i:0;s:17:\"commandes_vocales\";i:0;s:23:\"reconnaissance_panneaux\";i:0;s:20:\"affichage_tete_haute\";i:0;s:13:\"systeme_audio\";i:0;s:9:\"wifi_bord\";i:0;s:9:\"bluetooth\";i:0;s:24:\"compatibilite_smartphone\";i:0;s:26:\"apple_carplay_android_auto\";i:0;s:17:\"chargeur_sans_fil\";i:0;s:25:\"sellerie_similicuir_tissu\";i:0;s:11:\"volant_cuir\";i:0;s:14:\"follow_me_home\";i:0;s:16:\"lumiere_ambiance\";i:0;s:13:\"feux_jour_led\";i:0;s:15:\"phares_full_led\";i:0;s:16:\"toit_panoramique\";i:0;s:14:\"barres_de_toit\";i:0;s:18:\"vitres_surteintees\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:6:{s:8:\"verified\";s:7:\"boolean\";s:7:\"jantesA\";s:7:\"integer\";s:7:\"airbags\";s:7:\"integer\";s:13:\"climatisation\";s:7:\"integer\";s:6:\"images\";s:5:\"array\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:110:{i:0;s:5:\"phone\";i:1;s:7:\"pack_id\";i:2;s:5:\"titre\";i:3;s:4:\"prix\";i:4;s:4:\"mark\";i:5;s:6:\"modele\";i:6;s:9:\"matricule\";i:7;s:4:\"year\";i:8;s:2:\"km\";i:9;s:9:\"carburant\";i:10;s:3:\"box\";i:11;s:4:\"etat\";i:12;s:4:\"city\";i:13;s:2:\"cv\";i:14;s:7:\"nb_Door\";i:15;s:7:\"origine\";i:16;s:13:\"premiere_main\";i:17;s:5:\"video\";i:18;s:4:\"reel\";i:19;s:8:\"bodywork\";i:20;s:6:\"status\";i:21;s:5:\"image\";i:22;s:8:\"imgrleft\";i:23;s:7:\"imgrtop\";i:24;s:7:\"imgrmed\";i:25;s:10:\"imgrbottom\";i:26;s:9:\"imgrright\";i:27;s:11:\"imginterior\";i:28;s:10:\"imgrapport\";i:29;s:7:\"rapport\";i:30;s:3:\"co2\";i:31;s:8:\"certifie\";i:32;s:10:\"particulie\";i:33;s:8:\"showroom\";i:34;s:7:\"finance\";i:35;s:16:\"jantes_aluminium\";i:36;s:7:\"airbags\";i:37;s:13:\"climatisation\";i:38;s:3:\"gps\";i:39;s:12:\"toit_ouvrant\";i:40;s:19:\"double_toit_ouvrant\";i:41;s:10:\"siege_cuir\";i:42;s:11:\"radar_recul\";i:43;s:12:\"camera_recul\";i:44;s:10:\"vitreselec\";i:45;s:3:\"abs\";i:46;s:3:\"eps\";i:47;s:2:\"rv\";i:48;s:2:\"lv\";i:49;s:2:\"cd\";i:50;s:10:\"ordinateur\";i:51;s:12:\"verrouillage\";i:52;s:8:\"garantie\";i:53;s:5:\"views\";i:54;s:6:\"active\";i:55;s:8:\"verified\";i:56;s:4:\"pack\";i:57;s:17:\"featured_position\";i:58;s:16:\"show_in_homepage\";i:59;s:17:\"homepage_position\";i:60;s:11:\"is_homepage\";i:61;s:6:\"colors\";i:62;s:3:\"esp\";i:63;s:12:\"antipatinage\";i:64;s:21:\"aide_freinage_urgence\";i:65;s:26:\"antidemarrage_electronique\";i:66;s:19:\"aide_demarrage_cote\";i:67;s:23:\"selecteur_mode_conduite\";i:68;s:17:\"detection_fatigue\";i:69;s:21:\"maintien_dans_la_voie\";i:70;s:20:\"detecteur_angle_mort\";i:71;s:23:\"detecteur_sous_gonflage\";i:72;s:21:\"fermeture_portes_auto\";i:73;s:18:\"preparation_isofix\";i:74;s:21:\"phares_antibrouillard\";i:75;s:14:\"systeme_alarme\";i:76;s:10:\"start_stop\";i:77;s:18:\"regulateur_vitesse\";i:78;s:15:\"detecteur_pluie\";i:79;s:18:\"allumage_auto_feux\";i:80;s:21:\"frein_main_electrique\";i:81;s:18:\"aide_stationnement\";i:82;s:15:\"volant_reglable\";i:83;s:18:\"retros_electriques\";i:84;s:24:\"retros_rabat_electriques\";i:85;s:17:\"coffre_electrique\";i:86;s:18:\"sieges_electriques\";i:87;s:19:\"sieges_elec_memoire\";i:88;s:20:\"banquette_rabattable\";i:89;s:13:\"ecran_tactile\";i:90;s:15:\"cockpit_digital\";i:91;s:16:\"commandes_volant\";i:92;s:17:\"commandes_vocales\";i:93;s:23:\"reconnaissance_panneaux\";i:94;s:20:\"affichage_tete_haute\";i:95;s:13:\"systeme_audio\";i:96;s:9:\"wifi_bord\";i:97;s:9:\"bluetooth\";i:98;s:24:\"compatibilite_smartphone\";i:99;s:26:\"apple_carplay_android_auto\";i:100;s:17:\"chargeur_sans_fil\";i:101;s:25:\"sellerie_similicuir_tissu\";i:102;s:11:\"volant_cuir\";i:103;s:14:\"follow_me_home\";i:104;s:16:\"lumiere_ambiance\";i:105;s:13:\"feux_jour_led\";i:106;s:15:\"phares_full_led\";i:107;s:16:\"toit_panoramique\";i:108;s:14:\"barres_de_toit\";i:109;s:18:\"vitres_surteintees\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:3;O:19:\"App\\Models\\Annonces\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"annonces\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:114:{s:2:\"id\";i:153;s:5:\"phone\";s:10:\"0770080009\";s:7:\"pack_id\";N;s:5:\"titre\";s:21:\"RENAULT MEGAN Rs 2021\";s:4:\"prix\";i:325000;s:4:\"mark\";s:2:\"39\";s:6:\"modele\";s:3:\"147\";s:9:\"matricule\";N;s:4:\"year\";i:2021;s:2:\"km\";i:30000;s:9:\"carburant\";s:7:\"essence\";s:3:\"box\";s:11:\"automatique\";s:4:\"etat\";s:9:\"excellent\";s:4:\"city\";s:27:\"Casablanca-Jnane Californie\";s:2:\"cv\";s:2:\"10\";s:7:\"nb_Door\";i:5;s:7:\"origine\";s:11:\"WW au Maroc\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";s:11:\"sqW1HYsQSC0\";s:4:\"reel\";s:11:\"oqw0keLWcq8\";s:8:\"bodywork\";s:7:\"compact\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:57:\"[\"renault-megane-642324.jpg\",\"renault-megane-642324.jpg\"]\";s:5:\"image\";s:0:\"\";s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";N;s:3:\"co2\";N;s:8:\"certifie\";i:1;s:10:\"particulie\";i:1;s:8:\"showroom\";i:1;s:7:\"finance\";i:1;s:7:\"jantesA\";i:0;s:7:\"airbags\";i:1;s:13:\"climatisation\";i:1;s:3:\"gps\";i:1;s:12:\"toit_ouvrant\";i:1;s:19:\"double_toit_ouvrant\";i:1;s:10:\"siege_cuir\";i:1;s:11:\"radar_recul\";i:1;s:12:\"camera_recul\";i:1;s:10:\"vitreselec\";i:1;s:3:\"abs\";i:1;s:3:\"eps\";i:1;s:2:\"rv\";i:1;s:2:\"lv\";i:1;s:2:\"cd\";i:1;s:10:\"ordinateur\";i:1;s:12:\"verrouillage\";i:1;s:8:\"garantie\";i:1;s:5:\"views\";i:154;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-08-05 09:59:36\";s:10:\"updated_at\";s:19:\"2025-10-08 14:53:50\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:0;s:6:\"colors\";s:6:\"Orange\";s:3:\"esp\";i:0;s:12:\"antipatinage\";i:0;s:21:\"aide_freinage_urgence\";i:0;s:26:\"antidemarrage_electronique\";i:0;s:19:\"aide_demarrage_cote\";i:0;s:23:\"selecteur_mode_conduite\";i:0;s:17:\"detection_fatigue\";i:0;s:21:\"maintien_dans_la_voie\";i:0;s:20:\"detecteur_angle_mort\";i:0;s:23:\"detecteur_sous_gonflage\";i:0;s:21:\"fermeture_portes_auto\";i:0;s:18:\"preparation_isofix\";i:0;s:21:\"phares_antibrouillard\";i:0;s:14:\"systeme_alarme\";i:0;s:10:\"start_stop\";i:0;s:18:\"regulateur_vitesse\";i:0;s:15:\"detecteur_pluie\";i:0;s:18:\"allumage_auto_feux\";i:0;s:21:\"frein_main_electrique\";i:0;s:18:\"aide_stationnement\";i:0;s:15:\"volant_reglable\";i:0;s:18:\"retros_electriques\";i:0;s:24:\"retros_rabat_electriques\";i:0;s:17:\"coffre_electrique\";i:0;s:18:\"sieges_electriques\";i:0;s:19:\"sieges_elec_memoire\";i:0;s:20:\"banquette_rabattable\";i:0;s:13:\"ecran_tactile\";i:0;s:15:\"cockpit_digital\";i:0;s:16:\"commandes_volant\";i:0;s:17:\"commandes_vocales\";i:0;s:23:\"reconnaissance_panneaux\";i:0;s:20:\"affichage_tete_haute\";i:0;s:13:\"systeme_audio\";i:0;s:9:\"wifi_bord\";i:0;s:9:\"bluetooth\";i:0;s:24:\"compatibilite_smartphone\";i:0;s:26:\"apple_carplay_android_auto\";i:0;s:17:\"chargeur_sans_fil\";i:0;s:25:\"sellerie_similicuir_tissu\";i:0;s:11:\"volant_cuir\";i:0;s:14:\"follow_me_home\";i:0;s:16:\"lumiere_ambiance\";i:0;s:13:\"feux_jour_led\";i:0;s:15:\"phares_full_led\";i:0;s:16:\"toit_panoramique\";i:0;s:14:\"barres_de_toit\";i:0;s:18:\"vitres_surteintees\";i:0;}s:11:\"\0*\0original\";a:114:{s:2:\"id\";i:153;s:5:\"phone\";s:10:\"0770080009\";s:7:\"pack_id\";N;s:5:\"titre\";s:21:\"RENAULT MEGAN Rs 2021\";s:4:\"prix\";i:325000;s:4:\"mark\";s:2:\"39\";s:6:\"modele\";s:3:\"147\";s:9:\"matricule\";N;s:4:\"year\";i:2021;s:2:\"km\";i:30000;s:9:\"carburant\";s:7:\"essence\";s:3:\"box\";s:11:\"automatique\";s:4:\"etat\";s:9:\"excellent\";s:4:\"city\";s:27:\"Casablanca-Jnane Californie\";s:2:\"cv\";s:2:\"10\";s:7:\"nb_Door\";i:5;s:7:\"origine\";s:11:\"WW au Maroc\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";s:11:\"sqW1HYsQSC0\";s:4:\"reel\";s:11:\"oqw0keLWcq8\";s:8:\"bodywork\";s:7:\"compact\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:57:\"[\"renault-megane-642324.jpg\",\"renault-megane-642324.jpg\"]\";s:5:\"image\";s:0:\"\";s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";N;s:3:\"co2\";N;s:8:\"certifie\";i:1;s:10:\"particulie\";i:1;s:8:\"showroom\";i:1;s:7:\"finance\";i:1;s:7:\"jantesA\";i:0;s:7:\"airbags\";i:1;s:13:\"climatisation\";i:1;s:3:\"gps\";i:1;s:12:\"toit_ouvrant\";i:1;s:19:\"double_toit_ouvrant\";i:1;s:10:\"siege_cuir\";i:1;s:11:\"radar_recul\";i:1;s:12:\"camera_recul\";i:1;s:10:\"vitreselec\";i:1;s:3:\"abs\";i:1;s:3:\"eps\";i:1;s:2:\"rv\";i:1;s:2:\"lv\";i:1;s:2:\"cd\";i:1;s:10:\"ordinateur\";i:1;s:12:\"verrouillage\";i:1;s:8:\"garantie\";i:1;s:5:\"views\";i:154;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-08-05 09:59:36\";s:10:\"updated_at\";s:19:\"2025-10-08 14:53:50\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:0;s:6:\"colors\";s:6:\"Orange\";s:3:\"esp\";i:0;s:12:\"antipatinage\";i:0;s:21:\"aide_freinage_urgence\";i:0;s:26:\"antidemarrage_electronique\";i:0;s:19:\"aide_demarrage_cote\";i:0;s:23:\"selecteur_mode_conduite\";i:0;s:17:\"detection_fatigue\";i:0;s:21:\"maintien_dans_la_voie\";i:0;s:20:\"detecteur_angle_mort\";i:0;s:23:\"detecteur_sous_gonflage\";i:0;s:21:\"fermeture_portes_auto\";i:0;s:18:\"preparation_isofix\";i:0;s:21:\"phares_antibrouillard\";i:0;s:14:\"systeme_alarme\";i:0;s:10:\"start_stop\";i:0;s:18:\"regulateur_vitesse\";i:0;s:15:\"detecteur_pluie\";i:0;s:18:\"allumage_auto_feux\";i:0;s:21:\"frein_main_electrique\";i:0;s:18:\"aide_stationnement\";i:0;s:15:\"volant_reglable\";i:0;s:18:\"retros_electriques\";i:0;s:24:\"retros_rabat_electriques\";i:0;s:17:\"coffre_electrique\";i:0;s:18:\"sieges_electriques\";i:0;s:19:\"sieges_elec_memoire\";i:0;s:20:\"banquette_rabattable\";i:0;s:13:\"ecran_tactile\";i:0;s:15:\"cockpit_digital\";i:0;s:16:\"commandes_volant\";i:0;s:17:\"commandes_vocales\";i:0;s:23:\"reconnaissance_panneaux\";i:0;s:20:\"affichage_tete_haute\";i:0;s:13:\"systeme_audio\";i:0;s:9:\"wifi_bord\";i:0;s:9:\"bluetooth\";i:0;s:24:\"compatibilite_smartphone\";i:0;s:26:\"apple_carplay_android_auto\";i:0;s:17:\"chargeur_sans_fil\";i:0;s:25:\"sellerie_similicuir_tissu\";i:0;s:11:\"volant_cuir\";i:0;s:14:\"follow_me_home\";i:0;s:16:\"lumiere_ambiance\";i:0;s:13:\"feux_jour_led\";i:0;s:15:\"phares_full_led\";i:0;s:16:\"toit_panoramique\";i:0;s:14:\"barres_de_toit\";i:0;s:18:\"vitres_surteintees\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:6:{s:8:\"verified\";s:7:\"boolean\";s:7:\"jantesA\";s:7:\"integer\";s:7:\"airbags\";s:7:\"integer\";s:13:\"climatisation\";s:7:\"integer\";s:6:\"images\";s:5:\"array\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:110:{i:0;s:5:\"phone\";i:1;s:7:\"pack_id\";i:2;s:5:\"titre\";i:3;s:4:\"prix\";i:4;s:4:\"mark\";i:5;s:6:\"modele\";i:6;s:9:\"matricule\";i:7;s:4:\"year\";i:8;s:2:\"km\";i:9;s:9:\"carburant\";i:10;s:3:\"box\";i:11;s:4:\"etat\";i:12;s:4:\"city\";i:13;s:2:\"cv\";i:14;s:7:\"nb_Door\";i:15;s:7:\"origine\";i:16;s:13:\"premiere_main\";i:17;s:5:\"video\";i:18;s:4:\"reel\";i:19;s:8:\"bodywork\";i:20;s:6:\"status\";i:21;s:5:\"image\";i:22;s:8:\"imgrleft\";i:23;s:7:\"imgrtop\";i:24;s:7:\"imgrmed\";i:25;s:10:\"imgrbottom\";i:26;s:9:\"imgrright\";i:27;s:11:\"imginterior\";i:28;s:10:\"imgrapport\";i:29;s:7:\"rapport\";i:30;s:3:\"co2\";i:31;s:8:\"certifie\";i:32;s:10:\"particulie\";i:33;s:8:\"showroom\";i:34;s:7:\"finance\";i:35;s:16:\"jantes_aluminium\";i:36;s:7:\"airbags\";i:37;s:13:\"climatisation\";i:38;s:3:\"gps\";i:39;s:12:\"toit_ouvrant\";i:40;s:19:\"double_toit_ouvrant\";i:41;s:10:\"siege_cuir\";i:42;s:11:\"radar_recul\";i:43;s:12:\"camera_recul\";i:44;s:10:\"vitreselec\";i:45;s:3:\"abs\";i:46;s:3:\"eps\";i:47;s:2:\"rv\";i:48;s:2:\"lv\";i:49;s:2:\"cd\";i:50;s:10:\"ordinateur\";i:51;s:12:\"verrouillage\";i:52;s:8:\"garantie\";i:53;s:5:\"views\";i:54;s:6:\"active\";i:55;s:8:\"verified\";i:56;s:4:\"pack\";i:57;s:17:\"featured_position\";i:58;s:16:\"show_in_homepage\";i:59;s:17:\"homepage_position\";i:60;s:11:\"is_homepage\";i:61;s:6:\"colors\";i:62;s:3:\"esp\";i:63;s:12:\"antipatinage\";i:64;s:21:\"aide_freinage_urgence\";i:65;s:26:\"antidemarrage_electronique\";i:66;s:19:\"aide_demarrage_cote\";i:67;s:23:\"selecteur_mode_conduite\";i:68;s:17:\"detection_fatigue\";i:69;s:21:\"maintien_dans_la_voie\";i:70;s:20:\"detecteur_angle_mort\";i:71;s:23:\"detecteur_sous_gonflage\";i:72;s:21:\"fermeture_portes_auto\";i:73;s:18:\"preparation_isofix\";i:74;s:21:\"phares_antibrouillard\";i:75;s:14:\"systeme_alarme\";i:76;s:10:\"start_stop\";i:77;s:18:\"regulateur_vitesse\";i:78;s:15:\"detecteur_pluie\";i:79;s:18:\"allumage_auto_feux\";i:80;s:21:\"frein_main_electrique\";i:81;s:18:\"aide_stationnement\";i:82;s:15:\"volant_reglable\";i:83;s:18:\"retros_electriques\";i:84;s:24:\"retros_rabat_electriques\";i:85;s:17:\"coffre_electrique\";i:86;s:18:\"sieges_electriques\";i:87;s:19:\"sieges_elec_memoire\";i:88;s:20:\"banquette_rabattable\";i:89;s:13:\"ecran_tactile\";i:90;s:15:\"cockpit_digital\";i:91;s:16:\"commandes_volant\";i:92;s:17:\"commandes_vocales\";i:93;s:23:\"reconnaissance_panneaux\";i:94;s:20:\"affichage_tete_haute\";i:95;s:13:\"systeme_audio\";i:96;s:9:\"wifi_bord\";i:97;s:9:\"bluetooth\";i:98;s:24:\"compatibilite_smartphone\";i:99;s:26:\"apple_carplay_android_auto\";i:100;s:17:\"chargeur_sans_fil\";i:101;s:25:\"sellerie_similicuir_tissu\";i:102;s:11:\"volant_cuir\";i:103;s:14:\"follow_me_home\";i:104;s:16:\"lumiere_ambiance\";i:105;s:13:\"feux_jour_led\";i:106;s:15:\"phares_full_led\";i:107;s:16:\"toit_panoramique\";i:108;s:14:\"barres_de_toit\";i:109;s:18:\"vitres_surteintees\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:4;O:19:\"App\\Models\\Annonces\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"annonces\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:114:{s:2:\"id\";i:150;s:5:\"phone\";s:10:\"0770080009\";s:7:\"pack_id\";N;s:5:\"titre\";s:34:\"Mercedes-Benz E230 Collection 1981\";s:4:\"prix\";i:200000;s:4:\"mark\";s:2:\"32\";s:6:\"modele\";s:3:\"230\";s:9:\"matricule\";N;s:4:\"year\";i:1992;s:2:\"km\";i:200000;s:9:\"carburant\";s:7:\"essence\";s:3:\"box\";s:8:\"manuelle\";s:4:\"etat\";s:9:\"excellent\";s:4:\"city\";s:27:\"Casablanca-Jnane Californie\";s:2:\"cv\";s:2:\"10\";s:7:\"nb_Door\";i:5;s:7:\"origine\";s:10:\"dédouané\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";s:11:\"nkH8Mby2NnM\";s:4:\"reel\";s:11:\"_Gj6-4VIYO4\";s:8:\"bodywork\";s:7:\"berline\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:53:\"[\"mercedes-230-239225.jpg\",\"mercedes-230-239225.jpg\"]\";s:5:\"image\";s:0:\"\";s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";N;s:3:\"co2\";N;s:8:\"certifie\";i:1;s:10:\"particulie\";i:1;s:8:\"showroom\";i:1;s:7:\"finance\";i:0;s:7:\"jantesA\";i:0;s:7:\"airbags\";i:0;s:13:\"climatisation\";i:0;s:3:\"gps\";i:0;s:12:\"toit_ouvrant\";i:0;s:19:\"double_toit_ouvrant\";i:0;s:10:\"siege_cuir\";i:0;s:11:\"radar_recul\";i:0;s:12:\"camera_recul\";i:0;s:10:\"vitreselec\";i:0;s:3:\"abs\";i:0;s:3:\"eps\";i:0;s:2:\"rv\";i:0;s:2:\"lv\";i:0;s:2:\"cd\";i:0;s:10:\"ordinateur\";i:0;s:12:\"verrouillage\";i:0;s:8:\"garantie\";i:0;s:5:\"views\";i:114;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-07-17 17:58:57\";s:10:\"updated_at\";s:19:\"2025-10-08 14:22:46\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:0;s:6:\"colors\";s:10:\"Bleu marin\";s:3:\"esp\";i:0;s:12:\"antipatinage\";i:0;s:21:\"aide_freinage_urgence\";i:0;s:26:\"antidemarrage_electronique\";i:0;s:19:\"aide_demarrage_cote\";i:0;s:23:\"selecteur_mode_conduite\";i:0;s:17:\"detection_fatigue\";i:0;s:21:\"maintien_dans_la_voie\";i:0;s:20:\"detecteur_angle_mort\";i:0;s:23:\"detecteur_sous_gonflage\";i:0;s:21:\"fermeture_portes_auto\";i:0;s:18:\"preparation_isofix\";i:0;s:21:\"phares_antibrouillard\";i:0;s:14:\"systeme_alarme\";i:0;s:10:\"start_stop\";i:0;s:18:\"regulateur_vitesse\";i:0;s:15:\"detecteur_pluie\";i:0;s:18:\"allumage_auto_feux\";i:0;s:21:\"frein_main_electrique\";i:0;s:18:\"aide_stationnement\";i:0;s:15:\"volant_reglable\";i:0;s:18:\"retros_electriques\";i:0;s:24:\"retros_rabat_electriques\";i:0;s:17:\"coffre_electrique\";i:0;s:18:\"sieges_electriques\";i:0;s:19:\"sieges_elec_memoire\";i:0;s:20:\"banquette_rabattable\";i:0;s:13:\"ecran_tactile\";i:0;s:15:\"cockpit_digital\";i:0;s:16:\"commandes_volant\";i:0;s:17:\"commandes_vocales\";i:0;s:23:\"reconnaissance_panneaux\";i:0;s:20:\"affichage_tete_haute\";i:0;s:13:\"systeme_audio\";i:0;s:9:\"wifi_bord\";i:0;s:9:\"bluetooth\";i:0;s:24:\"compatibilite_smartphone\";i:0;s:26:\"apple_carplay_android_auto\";i:0;s:17:\"chargeur_sans_fil\";i:0;s:25:\"sellerie_similicuir_tissu\";i:0;s:11:\"volant_cuir\";i:0;s:14:\"follow_me_home\";i:0;s:16:\"lumiere_ambiance\";i:0;s:13:\"feux_jour_led\";i:0;s:15:\"phares_full_led\";i:0;s:16:\"toit_panoramique\";i:0;s:14:\"barres_de_toit\";i:0;s:18:\"vitres_surteintees\";i:0;}s:11:\"\0*\0original\";a:114:{s:2:\"id\";i:150;s:5:\"phone\";s:10:\"0770080009\";s:7:\"pack_id\";N;s:5:\"titre\";s:34:\"Mercedes-Benz E230 Collection 1981\";s:4:\"prix\";i:200000;s:4:\"mark\";s:2:\"32\";s:6:\"modele\";s:3:\"230\";s:9:\"matricule\";N;s:4:\"year\";i:1992;s:2:\"km\";i:200000;s:9:\"carburant\";s:7:\"essence\";s:3:\"box\";s:8:\"manuelle\";s:4:\"etat\";s:9:\"excellent\";s:4:\"city\";s:27:\"Casablanca-Jnane Californie\";s:2:\"cv\";s:2:\"10\";s:7:\"nb_Door\";i:5;s:7:\"origine\";s:10:\"dédouané\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";s:11:\"nkH8Mby2NnM\";s:4:\"reel\";s:11:\"_Gj6-4VIYO4\";s:8:\"bodywork\";s:7:\"berline\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:53:\"[\"mercedes-230-239225.jpg\",\"mercedes-230-239225.jpg\"]\";s:5:\"image\";s:0:\"\";s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";N;s:3:\"co2\";N;s:8:\"certifie\";i:1;s:10:\"particulie\";i:1;s:8:\"showroom\";i:1;s:7:\"finance\";i:0;s:7:\"jantesA\";i:0;s:7:\"airbags\";i:0;s:13:\"climatisation\";i:0;s:3:\"gps\";i:0;s:12:\"toit_ouvrant\";i:0;s:19:\"double_toit_ouvrant\";i:0;s:10:\"siege_cuir\";i:0;s:11:\"radar_recul\";i:0;s:12:\"camera_recul\";i:0;s:10:\"vitreselec\";i:0;s:3:\"abs\";i:0;s:3:\"eps\";i:0;s:2:\"rv\";i:0;s:2:\"lv\";i:0;s:2:\"cd\";i:0;s:10:\"ordinateur\";i:0;s:12:\"verrouillage\";i:0;s:8:\"garantie\";i:0;s:5:\"views\";i:114;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-07-17 17:58:57\";s:10:\"updated_at\";s:19:\"2025-10-08 14:22:46\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:0;s:6:\"colors\";s:10:\"Bleu marin\";s:3:\"esp\";i:0;s:12:\"antipatinage\";i:0;s:21:\"aide_freinage_urgence\";i:0;s:26:\"antidemarrage_electronique\";i:0;s:19:\"aide_demarrage_cote\";i:0;s:23:\"selecteur_mode_conduite\";i:0;s:17:\"detection_fatigue\";i:0;s:21:\"maintien_dans_la_voie\";i:0;s:20:\"detecteur_angle_mort\";i:0;s:23:\"detecteur_sous_gonflage\";i:0;s:21:\"fermeture_portes_auto\";i:0;s:18:\"preparation_isofix\";i:0;s:21:\"phares_antibrouillard\";i:0;s:14:\"systeme_alarme\";i:0;s:10:\"start_stop\";i:0;s:18:\"regulateur_vitesse\";i:0;s:15:\"detecteur_pluie\";i:0;s:18:\"allumage_auto_feux\";i:0;s:21:\"frein_main_electrique\";i:0;s:18:\"aide_stationnement\";i:0;s:15:\"volant_reglable\";i:0;s:18:\"retros_electriques\";i:0;s:24:\"retros_rabat_electriques\";i:0;s:17:\"coffre_electrique\";i:0;s:18:\"sieges_electriques\";i:0;s:19:\"sieges_elec_memoire\";i:0;s:20:\"banquette_rabattable\";i:0;s:13:\"ecran_tactile\";i:0;s:15:\"cockpit_digital\";i:0;s:16:\"commandes_volant\";i:0;s:17:\"commandes_vocales\";i:0;s:23:\"reconnaissance_panneaux\";i:0;s:20:\"affichage_tete_haute\";i:0;s:13:\"systeme_audio\";i:0;s:9:\"wifi_bord\";i:0;s:9:\"bluetooth\";i:0;s:24:\"compatibilite_smartphone\";i:0;s:26:\"apple_carplay_android_auto\";i:0;s:17:\"chargeur_sans_fil\";i:0;s:25:\"sellerie_similicuir_tissu\";i:0;s:11:\"volant_cuir\";i:0;s:14:\"follow_me_home\";i:0;s:16:\"lumiere_ambiance\";i:0;s:13:\"feux_jour_led\";i:0;s:15:\"phares_full_led\";i:0;s:16:\"toit_panoramique\";i:0;s:14:\"barres_de_toit\";i:0;s:18:\"vitres_surteintees\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:6:{s:8:\"verified\";s:7:\"boolean\";s:7:\"jantesA\";s:7:\"integer\";s:7:\"airbags\";s:7:\"integer\";s:13:\"climatisation\";s:7:\"integer\";s:6:\"images\";s:5:\"array\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:110:{i:0;s:5:\"phone\";i:1;s:7:\"pack_id\";i:2;s:5:\"titre\";i:3;s:4:\"prix\";i:4;s:4:\"mark\";i:5;s:6:\"modele\";i:6;s:9:\"matricule\";i:7;s:4:\"year\";i:8;s:2:\"km\";i:9;s:9:\"carburant\";i:10;s:3:\"box\";i:11;s:4:\"etat\";i:12;s:4:\"city\";i:13;s:2:\"cv\";i:14;s:7:\"nb_Door\";i:15;s:7:\"origine\";i:16;s:13:\"premiere_main\";i:17;s:5:\"video\";i:18;s:4:\"reel\";i:19;s:8:\"bodywork\";i:20;s:6:\"status\";i:21;s:5:\"image\";i:22;s:8:\"imgrleft\";i:23;s:7:\"imgrtop\";i:24;s:7:\"imgrmed\";i:25;s:10:\"imgrbottom\";i:26;s:9:\"imgrright\";i:27;s:11:\"imginterior\";i:28;s:10:\"imgrapport\";i:29;s:7:\"rapport\";i:30;s:3:\"co2\";i:31;s:8:\"certifie\";i:32;s:10:\"particulie\";i:33;s:8:\"showroom\";i:34;s:7:\"finance\";i:35;s:16:\"jantes_aluminium\";i:36;s:7:\"airbags\";i:37;s:13:\"climatisation\";i:38;s:3:\"gps\";i:39;s:12:\"toit_ouvrant\";i:40;s:19:\"double_toit_ouvrant\";i:41;s:10:\"siege_cuir\";i:42;s:11:\"radar_recul\";i:43;s:12:\"camera_recul\";i:44;s:10:\"vitreselec\";i:45;s:3:\"abs\";i:46;s:3:\"eps\";i:47;s:2:\"rv\";i:48;s:2:\"lv\";i:49;s:2:\"cd\";i:50;s:10:\"ordinateur\";i:51;s:12:\"verrouillage\";i:52;s:8:\"garantie\";i:53;s:5:\"views\";i:54;s:6:\"active\";i:55;s:8:\"verified\";i:56;s:4:\"pack\";i:57;s:17:\"featured_position\";i:58;s:16:\"show_in_homepage\";i:59;s:17:\"homepage_position\";i:60;s:11:\"is_homepage\";i:61;s:6:\"colors\";i:62;s:3:\"esp\";i:63;s:12:\"antipatinage\";i:64;s:21:\"aide_freinage_urgence\";i:65;s:26:\"antidemarrage_electronique\";i:66;s:19:\"aide_demarrage_cote\";i:67;s:23:\"selecteur_mode_conduite\";i:68;s:17:\"detection_fatigue\";i:69;s:21:\"maintien_dans_la_voie\";i:70;s:20:\"detecteur_angle_mort\";i:71;s:23:\"detecteur_sous_gonflage\";i:72;s:21:\"fermeture_portes_auto\";i:73;s:18:\"preparation_isofix\";i:74;s:21:\"phares_antibrouillard\";i:75;s:14:\"systeme_alarme\";i:76;s:10:\"start_stop\";i:77;s:18:\"regulateur_vitesse\";i:78;s:15:\"detecteur_pluie\";i:79;s:18:\"allumage_auto_feux\";i:80;s:21:\"frein_main_electrique\";i:81;s:18:\"aide_stationnement\";i:82;s:15:\"volant_reglable\";i:83;s:18:\"retros_electriques\";i:84;s:24:\"retros_rabat_electriques\";i:85;s:17:\"coffre_electrique\";i:86;s:18:\"sieges_electriques\";i:87;s:19:\"sieges_elec_memoire\";i:88;s:20:\"banquette_rabattable\";i:89;s:13:\"ecran_tactile\";i:90;s:15:\"cockpit_digital\";i:91;s:16:\"commandes_volant\";i:92;s:17:\"commandes_vocales\";i:93;s:23:\"reconnaissance_panneaux\";i:94;s:20:\"affichage_tete_haute\";i:95;s:13:\"systeme_audio\";i:96;s:9:\"wifi_bord\";i:97;s:9:\"bluetooth\";i:98;s:24:\"compatibilite_smartphone\";i:99;s:26:\"apple_carplay_android_auto\";i:100;s:17:\"chargeur_sans_fil\";i:101;s:25:\"sellerie_similicuir_tissu\";i:102;s:11:\"volant_cuir\";i:103;s:14:\"follow_me_home\";i:104;s:16:\"lumiere_ambiance\";i:105;s:13:\"feux_jour_led\";i:106;s:15:\"phares_full_led\";i:107;s:16:\"toit_panoramique\";i:108;s:14:\"barres_de_toit\";i:109;s:18:\"vitres_surteintees\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:5;O:19:\"App\\Models\\Annonces\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"annonces\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:114:{s:2:\"id\";i:149;s:5:\"phone\";s:10:\"0770080009\";s:7:\"pack_id\";N;s:5:\"titre\";s:29:\"MASERAT Levante 3.0 V6 275 CH\";s:4:\"prix\";i:400000;s:4:\"mark\";s:2:\"30\";s:6:\"modele\";s:4:\"1017\";s:9:\"matricule\";N;s:4:\"year\";i:2017;s:2:\"km\";i:55000;s:9:\"carburant\";s:6:\"diesel\";s:3:\"box\";s:11:\"automatique\";s:4:\"etat\";s:9:\"excellent\";s:4:\"city\";s:27:\"Casablanca-Jnane Californie\";s:2:\"cv\";s:2:\"12\";s:7:\"nb_Door\";i:5;s:7:\"origine\";s:11:\"WW au Maroc\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";s:11:\"nRKYdD7AdYY\";s:4:\"reel\";s:11:\"HU8yHeEI5dY\";s:8:\"bodywork\";s:10:\"suv et 4x4\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:61:\"[\"maserati-levante-587508.jpg\",\"maserati-levante-587508.jpg\"]\";s:5:\"image\";s:0:\"\";s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";N;s:3:\"co2\";N;s:8:\"certifie\";i:1;s:10:\"particulie\";i:1;s:8:\"showroom\";i:1;s:7:\"finance\";i:1;s:7:\"jantesA\";i:0;s:7:\"airbags\";i:1;s:13:\"climatisation\";i:1;s:3:\"gps\";i:0;s:12:\"toit_ouvrant\";i:0;s:19:\"double_toit_ouvrant\";i:0;s:10:\"siege_cuir\";i:1;s:11:\"radar_recul\";i:1;s:12:\"camera_recul\";i:1;s:10:\"vitreselec\";i:1;s:3:\"abs\";i:1;s:3:\"eps\";i:1;s:2:\"rv\";i:1;s:2:\"lv\";i:1;s:2:\"cd\";i:1;s:10:\"ordinateur\";i:1;s:12:\"verrouillage\";i:1;s:8:\"garantie\";i:0;s:5:\"views\";i:111;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-07-17 16:50:50\";s:10:\"updated_at\";s:19:\"2025-10-08 14:13:31\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:0;s:6:\"colors\";s:5:\"Blanc\";s:3:\"esp\";i:0;s:12:\"antipatinage\";i:0;s:21:\"aide_freinage_urgence\";i:0;s:26:\"antidemarrage_electronique\";i:0;s:19:\"aide_demarrage_cote\";i:0;s:23:\"selecteur_mode_conduite\";i:0;s:17:\"detection_fatigue\";i:0;s:21:\"maintien_dans_la_voie\";i:0;s:20:\"detecteur_angle_mort\";i:0;s:23:\"detecteur_sous_gonflage\";i:0;s:21:\"fermeture_portes_auto\";i:0;s:18:\"preparation_isofix\";i:0;s:21:\"phares_antibrouillard\";i:0;s:14:\"systeme_alarme\";i:0;s:10:\"start_stop\";i:0;s:18:\"regulateur_vitesse\";i:0;s:15:\"detecteur_pluie\";i:0;s:18:\"allumage_auto_feux\";i:0;s:21:\"frein_main_electrique\";i:0;s:18:\"aide_stationnement\";i:0;s:15:\"volant_reglable\";i:0;s:18:\"retros_electriques\";i:0;s:24:\"retros_rabat_electriques\";i:0;s:17:\"coffre_electrique\";i:0;s:18:\"sieges_electriques\";i:0;s:19:\"sieges_elec_memoire\";i:0;s:20:\"banquette_rabattable\";i:0;s:13:\"ecran_tactile\";i:0;s:15:\"cockpit_digital\";i:0;s:16:\"commandes_volant\";i:0;s:17:\"commandes_vocales\";i:0;s:23:\"reconnaissance_panneaux\";i:0;s:20:\"affichage_tete_haute\";i:0;s:13:\"systeme_audio\";i:0;s:9:\"wifi_bord\";i:0;s:9:\"bluetooth\";i:0;s:24:\"compatibilite_smartphone\";i:0;s:26:\"apple_carplay_android_auto\";i:0;s:17:\"chargeur_sans_fil\";i:0;s:25:\"sellerie_similicuir_tissu\";i:0;s:11:\"volant_cuir\";i:0;s:14:\"follow_me_home\";i:0;s:16:\"lumiere_ambiance\";i:0;s:13:\"feux_jour_led\";i:0;s:15:\"phares_full_led\";i:0;s:16:\"toit_panoramique\";i:0;s:14:\"barres_de_toit\";i:0;s:18:\"vitres_surteintees\";i:0;}s:11:\"\0*\0original\";a:114:{s:2:\"id\";i:149;s:5:\"phone\";s:10:\"0770080009\";s:7:\"pack_id\";N;s:5:\"titre\";s:29:\"MASERAT Levante 3.0 V6 275 CH\";s:4:\"prix\";i:400000;s:4:\"mark\";s:2:\"30\";s:6:\"modele\";s:4:\"1017\";s:9:\"matricule\";N;s:4:\"year\";i:2017;s:2:\"km\";i:55000;s:9:\"carburant\";s:6:\"diesel\";s:3:\"box\";s:11:\"automatique\";s:4:\"etat\";s:9:\"excellent\";s:4:\"city\";s:27:\"Casablanca-Jnane Californie\";s:2:\"cv\";s:2:\"12\";s:7:\"nb_Door\";i:5;s:7:\"origine\";s:11:\"WW au Maroc\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";s:11:\"nRKYdD7AdYY\";s:4:\"reel\";s:11:\"HU8yHeEI5dY\";s:8:\"bodywork\";s:10:\"suv et 4x4\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:61:\"[\"maserati-levante-587508.jpg\",\"maserati-levante-587508.jpg\"]\";s:5:\"image\";s:0:\"\";s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";N;s:3:\"co2\";N;s:8:\"certifie\";i:1;s:10:\"particulie\";i:1;s:8:\"showroom\";i:1;s:7:\"finance\";i:1;s:7:\"jantesA\";i:0;s:7:\"airbags\";i:1;s:13:\"climatisation\";i:1;s:3:\"gps\";i:0;s:12:\"toit_ouvrant\";i:0;s:19:\"double_toit_ouvrant\";i:0;s:10:\"siege_cuir\";i:1;s:11:\"radar_recul\";i:1;s:12:\"camera_recul\";i:1;s:10:\"vitreselec\";i:1;s:3:\"abs\";i:1;s:3:\"eps\";i:1;s:2:\"rv\";i:1;s:2:\"lv\";i:1;s:2:\"cd\";i:1;s:10:\"ordinateur\";i:1;s:12:\"verrouillage\";i:1;s:8:\"garantie\";i:0;s:5:\"views\";i:111;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-07-17 16:50:50\";s:10:\"updated_at\";s:19:\"2025-10-08 14:13:31\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:0;s:6:\"colors\";s:5:\"Blanc\";s:3:\"esp\";i:0;s:12:\"antipatinage\";i:0;s:21:\"aide_freinage_urgence\";i:0;s:26:\"antidemarrage_electronique\";i:0;s:19:\"aide_demarrage_cote\";i:0;s:23:\"selecteur_mode_conduite\";i:0;s:17:\"detection_fatigue\";i:0;s:21:\"maintien_dans_la_voie\";i:0;s:20:\"detecteur_angle_mort\";i:0;s:23:\"detecteur_sous_gonflage\";i:0;s:21:\"fermeture_portes_auto\";i:0;s:18:\"preparation_isofix\";i:0;s:21:\"phares_antibrouillard\";i:0;s:14:\"systeme_alarme\";i:0;s:10:\"start_stop\";i:0;s:18:\"regulateur_vitesse\";i:0;s:15:\"detecteur_pluie\";i:0;s:18:\"allumage_auto_feux\";i:0;s:21:\"frein_main_electrique\";i:0;s:18:\"aide_stationnement\";i:0;s:15:\"volant_reglable\";i:0;s:18:\"retros_electriques\";i:0;s:24:\"retros_rabat_electriques\";i:0;s:17:\"coffre_electrique\";i:0;s:18:\"sieges_electriques\";i:0;s:19:\"sieges_elec_memoire\";i:0;s:20:\"banquette_rabattable\";i:0;s:13:\"ecran_tactile\";i:0;s:15:\"cockpit_digital\";i:0;s:16:\"commandes_volant\";i:0;s:17:\"commandes_vocales\";i:0;s:23:\"reconnaissance_panneaux\";i:0;s:20:\"affichage_tete_haute\";i:0;s:13:\"systeme_audio\";i:0;s:9:\"wifi_bord\";i:0;s:9:\"bluetooth\";i:0;s:24:\"compatibilite_smartphone\";i:0;s:26:\"apple_carplay_android_auto\";i:0;s:17:\"chargeur_sans_fil\";i:0;s:25:\"sellerie_similicuir_tissu\";i:0;s:11:\"volant_cuir\";i:0;s:14:\"follow_me_home\";i:0;s:16:\"lumiere_ambiance\";i:0;s:13:\"feux_jour_led\";i:0;s:15:\"phares_full_led\";i:0;s:16:\"toit_panoramique\";i:0;s:14:\"barres_de_toit\";i:0;s:18:\"vitres_surteintees\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:6:{s:8:\"verified\";s:7:\"boolean\";s:7:\"jantesA\";s:7:\"integer\";s:7:\"airbags\";s:7:\"integer\";s:13:\"climatisation\";s:7:\"integer\";s:6:\"images\";s:5:\"array\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:110:{i:0;s:5:\"phone\";i:1;s:7:\"pack_id\";i:2;s:5:\"titre\";i:3;s:4:\"prix\";i:4;s:4:\"mark\";i:5;s:6:\"modele\";i:6;s:9:\"matricule\";i:7;s:4:\"year\";i:8;s:2:\"km\";i:9;s:9:\"carburant\";i:10;s:3:\"box\";i:11;s:4:\"etat\";i:12;s:4:\"city\";i:13;s:2:\"cv\";i:14;s:7:\"nb_Door\";i:15;s:7:\"origine\";i:16;s:13:\"premiere_main\";i:17;s:5:\"video\";i:18;s:4:\"reel\";i:19;s:8:\"bodywork\";i:20;s:6:\"status\";i:21;s:5:\"image\";i:22;s:8:\"imgrleft\";i:23;s:7:\"imgrtop\";i:24;s:7:\"imgrmed\";i:25;s:10:\"imgrbottom\";i:26;s:9:\"imgrright\";i:27;s:11:\"imginterior\";i:28;s:10:\"imgrapport\";i:29;s:7:\"rapport\";i:30;s:3:\"co2\";i:31;s:8:\"certifie\";i:32;s:10:\"particulie\";i:33;s:8:\"showroom\";i:34;s:7:\"finance\";i:35;s:16:\"jantes_aluminium\";i:36;s:7:\"airbags\";i:37;s:13:\"climatisation\";i:38;s:3:\"gps\";i:39;s:12:\"toit_ouvrant\";i:40;s:19:\"double_toit_ouvrant\";i:41;s:10:\"siege_cuir\";i:42;s:11:\"radar_recul\";i:43;s:12:\"camera_recul\";i:44;s:10:\"vitreselec\";i:45;s:3:\"abs\";i:46;s:3:\"eps\";i:47;s:2:\"rv\";i:48;s:2:\"lv\";i:49;s:2:\"cd\";i:50;s:10:\"ordinateur\";i:51;s:12:\"verrouillage\";i:52;s:8:\"garantie\";i:53;s:5:\"views\";i:54;s:6:\"active\";i:55;s:8:\"verified\";i:56;s:4:\"pack\";i:57;s:17:\"featured_position\";i:58;s:16:\"show_in_homepage\";i:59;s:17:\"homepage_position\";i:60;s:11:\"is_homepage\";i:61;s:6:\"colors\";i:62;s:3:\"esp\";i:63;s:12:\"antipatinage\";i:64;s:21:\"aide_freinage_urgence\";i:65;s:26:\"antidemarrage_electronique\";i:66;s:19:\"aide_demarrage_cote\";i:67;s:23:\"selecteur_mode_conduite\";i:68;s:17:\"detection_fatigue\";i:69;s:21:\"maintien_dans_la_voie\";i:70;s:20:\"detecteur_angle_mort\";i:71;s:23:\"detecteur_sous_gonflage\";i:72;s:21:\"fermeture_portes_auto\";i:73;s:18:\"preparation_isofix\";i:74;s:21:\"phares_antibrouillard\";i:75;s:14:\"systeme_alarme\";i:76;s:10:\"start_stop\";i:77;s:18:\"regulateur_vitesse\";i:78;s:15:\"detecteur_pluie\";i:79;s:18:\"allumage_auto_feux\";i:80;s:21:\"frein_main_electrique\";i:81;s:18:\"aide_stationnement\";i:82;s:15:\"volant_reglable\";i:83;s:18:\"retros_electriques\";i:84;s:24:\"retros_rabat_electriques\";i:85;s:17:\"coffre_electrique\";i:86;s:18:\"sieges_electriques\";i:87;s:19:\"sieges_elec_memoire\";i:88;s:20:\"banquette_rabattable\";i:89;s:13:\"ecran_tactile\";i:90;s:15:\"cockpit_digital\";i:91;s:16:\"commandes_volant\";i:92;s:17:\"commandes_vocales\";i:93;s:23:\"reconnaissance_panneaux\";i:94;s:20:\"affichage_tete_haute\";i:95;s:13:\"systeme_audio\";i:96;s:9:\"wifi_bord\";i:97;s:9:\"bluetooth\";i:98;s:24:\"compatibilite_smartphone\";i:99;s:26:\"apple_carplay_android_auto\";i:100;s:17:\"chargeur_sans_fil\";i:101;s:25:\"sellerie_similicuir_tissu\";i:102;s:11:\"volant_cuir\";i:103;s:14:\"follow_me_home\";i:104;s:16:\"lumiere_ambiance\";i:105;s:13:\"feux_jour_led\";i:106;s:15:\"phares_full_led\";i:107;s:16:\"toit_panoramique\";i:108;s:14:\"barres_de_toit\";i:109;s:18:\"vitres_surteintees\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:6;O:19:\"App\\Models\\Annonces\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"annonces\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:114:{s:2:\"id\";i:142;s:5:\"phone\";s:10:\"0770080009\";s:7:\"pack_id\";N;s:5:\"titre\";s:40:\"LAND ROVER Range Rover Sport HSE Dynamic\";s:4:\"prix\";i:630000;s:4:\"mark\";s:2:\"27\";s:6:\"modele\";s:3:\"335\";s:9:\"matricule\";N;s:4:\"year\";i:2021;s:2:\"km\";i:75000;s:9:\"carburant\";s:6:\"diesel\";s:3:\"box\";s:11:\"automatique\";s:4:\"etat\";s:9:\"excellent\";s:4:\"city\";s:27:\"Casablanca-Jnane Californie\";s:2:\"cv\";s:2:\"12\";s:7:\"nb_Door\";i:5;s:7:\"origine\";s:11:\"WW au Maroc\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";s:11:\"MeOHMSNw9RE\";s:4:\"reel\";s:11:\"QMTdNVoFcPo\";s:8:\"bodywork\";s:10:\"suv et 4x4\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:85:\"[\"land-rover-range-rover-sport-356425.jpg\",\"land-rover-range-rover-sport-356425.jpg\"]\";s:5:\"image\";s:0:\"\";s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";s:11:\"rapport.pdf\";s:3:\"co2\";N;s:8:\"certifie\";i:1;s:10:\"particulie\";i:0;s:8:\"showroom\";i:1;s:7:\"finance\";i:1;s:7:\"jantesA\";i:0;s:7:\"airbags\";i:1;s:13:\"climatisation\";i:1;s:3:\"gps\";i:1;s:12:\"toit_ouvrant\";i:1;s:19:\"double_toit_ouvrant\";i:1;s:10:\"siege_cuir\";i:1;s:11:\"radar_recul\";i:1;s:12:\"camera_recul\";i:1;s:10:\"vitreselec\";i:1;s:3:\"abs\";i:1;s:3:\"eps\";i:1;s:2:\"rv\";i:0;s:2:\"lv\";i:1;s:2:\"cd\";i:1;s:10:\"ordinateur\";i:1;s:12:\"verrouillage\";i:1;s:8:\"garantie\";i:1;s:5:\"views\";i:161;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-05-23 10:16:20\";s:10:\"updated_at\";s:19:\"2025-09-26 16:40:43\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:1;s:6:\"colors\";s:4:\"Gris\";s:3:\"esp\";i:0;s:12:\"antipatinage\";i:1;s:21:\"aide_freinage_urgence\";i:0;s:26:\"antidemarrage_electronique\";i:0;s:19:\"aide_demarrage_cote\";i:0;s:23:\"selecteur_mode_conduite\";i:0;s:17:\"detection_fatigue\";i:0;s:21:\"maintien_dans_la_voie\";i:0;s:20:\"detecteur_angle_mort\";i:0;s:23:\"detecteur_sous_gonflage\";i:0;s:21:\"fermeture_portes_auto\";i:0;s:18:\"preparation_isofix\";i:0;s:21:\"phares_antibrouillard\";i:0;s:14:\"systeme_alarme\";i:0;s:10:\"start_stop\";i:0;s:18:\"regulateur_vitesse\";i:0;s:15:\"detecteur_pluie\";i:0;s:18:\"allumage_auto_feux\";i:0;s:21:\"frein_main_electrique\";i:0;s:18:\"aide_stationnement\";i:0;s:15:\"volant_reglable\";i:0;s:18:\"retros_electriques\";i:0;s:24:\"retros_rabat_electriques\";i:0;s:17:\"coffre_electrique\";i:0;s:18:\"sieges_electriques\";i:0;s:19:\"sieges_elec_memoire\";i:0;s:20:\"banquette_rabattable\";i:0;s:13:\"ecran_tactile\";i:0;s:15:\"cockpit_digital\";i:0;s:16:\"commandes_volant\";i:0;s:17:\"commandes_vocales\";i:1;s:23:\"reconnaissance_panneaux\";i:0;s:20:\"affichage_tete_haute\";i:0;s:13:\"systeme_audio\";i:0;s:9:\"wifi_bord\";i:0;s:9:\"bluetooth\";i:0;s:24:\"compatibilite_smartphone\";i:0;s:26:\"apple_carplay_android_auto\";i:0;s:17:\"chargeur_sans_fil\";i:0;s:25:\"sellerie_similicuir_tissu\";i:0;s:11:\"volant_cuir\";i:0;s:14:\"follow_me_home\";i:0;s:16:\"lumiere_ambiance\";i:0;s:13:\"feux_jour_led\";i:0;s:15:\"phares_full_led\";i:0;s:16:\"toit_panoramique\";i:0;s:14:\"barres_de_toit\";i:0;s:18:\"vitres_surteintees\";i:1;}s:11:\"\0*\0original\";a:114:{s:2:\"id\";i:142;s:5:\"phone\";s:10:\"0770080009\";s:7:\"pack_id\";N;s:5:\"titre\";s:40:\"LAND ROVER Range Rover Sport HSE Dynamic\";s:4:\"prix\";i:630000;s:4:\"mark\";s:2:\"27\";s:6:\"modele\";s:3:\"335\";s:9:\"matricule\";N;s:4:\"year\";i:2021;s:2:\"km\";i:75000;s:9:\"carburant\";s:6:\"diesel\";s:3:\"box\";s:11:\"automatique\";s:4:\"etat\";s:9:\"excellent\";s:4:\"city\";s:27:\"Casablanca-Jnane Californie\";s:2:\"cv\";s:2:\"12\";s:7:\"nb_Door\";i:5;s:7:\"origine\";s:11:\"WW au Maroc\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";s:11:\"MeOHMSNw9RE\";s:4:\"reel\";s:11:\"QMTdNVoFcPo\";s:8:\"bodywork\";s:10:\"suv et 4x4\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:85:\"[\"land-rover-range-rover-sport-356425.jpg\",\"land-rover-range-rover-sport-356425.jpg\"]\";s:5:\"image\";s:0:\"\";s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";s:11:\"rapport.pdf\";s:3:\"co2\";N;s:8:\"certifie\";i:1;s:10:\"particulie\";i:0;s:8:\"showroom\";i:1;s:7:\"finance\";i:1;s:7:\"jantesA\";i:0;s:7:\"airbags\";i:1;s:13:\"climatisation\";i:1;s:3:\"gps\";i:1;s:12:\"toit_ouvrant\";i:1;s:19:\"double_toit_ouvrant\";i:1;s:10:\"siege_cuir\";i:1;s:11:\"radar_recul\";i:1;s:12:\"camera_recul\";i:1;s:10:\"vitreselec\";i:1;s:3:\"abs\";i:1;s:3:\"eps\";i:1;s:2:\"rv\";i:0;s:2:\"lv\";i:1;s:2:\"cd\";i:1;s:10:\"ordinateur\";i:1;s:12:\"verrouillage\";i:1;s:8:\"garantie\";i:1;s:5:\"views\";i:161;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-05-23 10:16:20\";s:10:\"updated_at\";s:19:\"2025-09-26 16:40:43\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:1;s:6:\"colors\";s:4:\"Gris\";s:3:\"esp\";i:0;s:12:\"antipatinage\";i:1;s:21:\"aide_freinage_urgence\";i:0;s:26:\"antidemarrage_electronique\";i:0;s:19:\"aide_demarrage_cote\";i:0;s:23:\"selecteur_mode_conduite\";i:0;s:17:\"detection_fatigue\";i:0;s:21:\"maintien_dans_la_voie\";i:0;s:20:\"detecteur_angle_mort\";i:0;s:23:\"detecteur_sous_gonflage\";i:0;s:21:\"fermeture_portes_auto\";i:0;s:18:\"preparation_isofix\";i:0;s:21:\"phares_antibrouillard\";i:0;s:14:\"systeme_alarme\";i:0;s:10:\"start_stop\";i:0;s:18:\"regulateur_vitesse\";i:0;s:15:\"detecteur_pluie\";i:0;s:18:\"allumage_auto_feux\";i:0;s:21:\"frein_main_electrique\";i:0;s:18:\"aide_stationnement\";i:0;s:15:\"volant_reglable\";i:0;s:18:\"retros_electriques\";i:0;s:24:\"retros_rabat_electriques\";i:0;s:17:\"coffre_electrique\";i:0;s:18:\"sieges_electriques\";i:0;s:19:\"sieges_elec_memoire\";i:0;s:20:\"banquette_rabattable\";i:0;s:13:\"ecran_tactile\";i:0;s:15:\"cockpit_digital\";i:0;s:16:\"commandes_volant\";i:0;s:17:\"commandes_vocales\";i:1;s:23:\"reconnaissance_panneaux\";i:0;s:20:\"affichage_tete_haute\";i:0;s:13:\"systeme_audio\";i:0;s:9:\"wifi_bord\";i:0;s:9:\"bluetooth\";i:0;s:24:\"compatibilite_smartphone\";i:0;s:26:\"apple_carplay_android_auto\";i:0;s:17:\"chargeur_sans_fil\";i:0;s:25:\"sellerie_similicuir_tissu\";i:0;s:11:\"volant_cuir\";i:0;s:14:\"follow_me_home\";i:0;s:16:\"lumiere_ambiance\";i:0;s:13:\"feux_jour_led\";i:0;s:15:\"phares_full_led\";i:0;s:16:\"toit_panoramique\";i:0;s:14:\"barres_de_toit\";i:0;s:18:\"vitres_surteintees\";i:1;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:6:{s:8:\"verified\";s:7:\"boolean\";s:7:\"jantesA\";s:7:\"integer\";s:7:\"airbags\";s:7:\"integer\";s:13:\"climatisation\";s:7:\"integer\";s:6:\"images\";s:5:\"array\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:110:{i:0;s:5:\"phone\";i:1;s:7:\"pack_id\";i:2;s:5:\"titre\";i:3;s:4:\"prix\";i:4;s:4:\"mark\";i:5;s:6:\"modele\";i:6;s:9:\"matricule\";i:7;s:4:\"year\";i:8;s:2:\"km\";i:9;s:9:\"carburant\";i:10;s:3:\"box\";i:11;s:4:\"etat\";i:12;s:4:\"city\";i:13;s:2:\"cv\";i:14;s:7:\"nb_Door\";i:15;s:7:\"origine\";i:16;s:13:\"premiere_main\";i:17;s:5:\"video\";i:18;s:4:\"reel\";i:19;s:8:\"bodywork\";i:20;s:6:\"status\";i:21;s:5:\"image\";i:22;s:8:\"imgrleft\";i:23;s:7:\"imgrtop\";i:24;s:7:\"imgrmed\";i:25;s:10:\"imgrbottom\";i:26;s:9:\"imgrright\";i:27;s:11:\"imginterior\";i:28;s:10:\"imgrapport\";i:29;s:7:\"rapport\";i:30;s:3:\"co2\";i:31;s:8:\"certifie\";i:32;s:10:\"particulie\";i:33;s:8:\"showroom\";i:34;s:7:\"finance\";i:35;s:16:\"jantes_aluminium\";i:36;s:7:\"airbags\";i:37;s:13:\"climatisation\";i:38;s:3:\"gps\";i:39;s:12:\"toit_ouvrant\";i:40;s:19:\"double_toit_ouvrant\";i:41;s:10:\"siege_cuir\";i:42;s:11:\"radar_recul\";i:43;s:12:\"camera_recul\";i:44;s:10:\"vitreselec\";i:45;s:3:\"abs\";i:46;s:3:\"eps\";i:47;s:2:\"rv\";i:48;s:2:\"lv\";i:49;s:2:\"cd\";i:50;s:10:\"ordinateur\";i:51;s:12:\"verrouillage\";i:52;s:8:\"garantie\";i:53;s:5:\"views\";i:54;s:6:\"active\";i:55;s:8:\"verified\";i:56;s:4:\"pack\";i:57;s:17:\"featured_position\";i:58;s:16:\"show_in_homepage\";i:59;s:17:\"homepage_position\";i:60;s:11:\"is_homepage\";i:61;s:6:\"colors\";i:62;s:3:\"esp\";i:63;s:12:\"antipatinage\";i:64;s:21:\"aide_freinage_urgence\";i:65;s:26:\"antidemarrage_electronique\";i:66;s:19:\"aide_demarrage_cote\";i:67;s:23:\"selecteur_mode_conduite\";i:68;s:17:\"detection_fatigue\";i:69;s:21:\"maintien_dans_la_voie\";i:70;s:20:\"detecteur_angle_mort\";i:71;s:23:\"detecteur_sous_gonflage\";i:72;s:21:\"fermeture_portes_auto\";i:73;s:18:\"preparation_isofix\";i:74;s:21:\"phares_antibrouillard\";i:75;s:14:\"systeme_alarme\";i:76;s:10:\"start_stop\";i:77;s:18:\"regulateur_vitesse\";i:78;s:15:\"detecteur_pluie\";i:79;s:18:\"allumage_auto_feux\";i:80;s:21:\"frein_main_electrique\";i:81;s:18:\"aide_stationnement\";i:82;s:15:\"volant_reglable\";i:83;s:18:\"retros_electriques\";i:84;s:24:\"retros_rabat_electriques\";i:85;s:17:\"coffre_electrique\";i:86;s:18:\"sieges_electriques\";i:87;s:19:\"sieges_elec_memoire\";i:88;s:20:\"banquette_rabattable\";i:89;s:13:\"ecran_tactile\";i:90;s:15:\"cockpit_digital\";i:91;s:16:\"commandes_volant\";i:92;s:17:\"commandes_vocales\";i:93;s:23:\"reconnaissance_panneaux\";i:94;s:20:\"affichage_tete_haute\";i:95;s:13:\"systeme_audio\";i:96;s:9:\"wifi_bord\";i:97;s:9:\"bluetooth\";i:98;s:24:\"compatibilite_smartphone\";i:99;s:26:\"apple_carplay_android_auto\";i:100;s:17:\"chargeur_sans_fil\";i:101;s:25:\"sellerie_similicuir_tissu\";i:102;s:11:\"volant_cuir\";i:103;s:14:\"follow_me_home\";i:104;s:16:\"lumiere_ambiance\";i:105;s:13:\"feux_jour_led\";i:106;s:15:\"phares_full_led\";i:107;s:16:\"toit_panoramique\";i:108;s:14:\"barres_de_toit\";i:109;s:18:\"vitres_surteintees\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:7;O:19:\"App\\Models\\Annonces\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"annonces\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:114:{s:2:\"id\";i:140;s:5:\"phone\";s:10:\"0770080009\";s:7:\"pack_id\";N;s:5:\"titre\";s:28:\"Volkswagen Tiguan 2021 CARAT\";s:4:\"prix\";i:420000;s:4:\"mark\";s:2:\"46\";s:6:\"modele\";s:2:\"69\";s:9:\"matricule\";N;s:4:\"year\";i:2021;s:2:\"km\";i:129000;s:9:\"carburant\";s:6:\"diesel\";s:3:\"box\";s:11:\"automatique\";s:4:\"etat\";s:9:\"excellent\";s:4:\"city\";s:27:\"Casablanca-Jnane Californie\";s:2:\"cv\";s:1:\"8\";s:7:\"nb_Door\";i:5;s:7:\"origine\";s:10:\"dédouané\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";s:11:\"GtYOYQN8f1A\";s:4:\"reel\";s:11:\"6ZmNbzPSAF8\";s:8:\"bodywork\";s:10:\"suv et 4x4\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:63:\"[\"volkswagen-tiguan-832022.jpg\",\"volkswagen-tiguan-832022.jpg\"]\";s:5:\"image\";s:0:\"\";s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";N;s:3:\"co2\";N;s:8:\"certifie\";i:1;s:10:\"particulie\";i:0;s:8:\"showroom\";i:1;s:7:\"finance\";i:1;s:7:\"jantesA\";i:0;s:7:\"airbags\";i:0;s:13:\"climatisation\";i:1;s:3:\"gps\";i:1;s:12:\"toit_ouvrant\";i:1;s:19:\"double_toit_ouvrant\";i:1;s:10:\"siege_cuir\";i:1;s:11:\"radar_recul\";i:1;s:12:\"camera_recul\";i:1;s:10:\"vitreselec\";i:1;s:3:\"abs\";i:1;s:3:\"eps\";i:1;s:2:\"rv\";i:1;s:2:\"lv\";i:1;s:2:\"cd\";i:1;s:10:\"ordinateur\";i:1;s:12:\"verrouillage\";i:1;s:8:\"garantie\";i:1;s:5:\"views\";i:164;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-04-30 10:03:21\";s:10:\"updated_at\";s:19:\"2025-09-27 01:08:06\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:1;s:6:\"colors\";s:5:\"Blanc\";s:3:\"esp\";i:0;s:12:\"antipatinage\";i:0;s:21:\"aide_freinage_urgence\";i:0;s:26:\"antidemarrage_electronique\";i:0;s:19:\"aide_demarrage_cote\";i:0;s:23:\"selecteur_mode_conduite\";i:0;s:17:\"detection_fatigue\";i:0;s:21:\"maintien_dans_la_voie\";i:0;s:20:\"detecteur_angle_mort\";i:0;s:23:\"detecteur_sous_gonflage\";i:0;s:21:\"fermeture_portes_auto\";i:0;s:18:\"preparation_isofix\";i:0;s:21:\"phares_antibrouillard\";i:0;s:14:\"systeme_alarme\";i:0;s:10:\"start_stop\";i:0;s:18:\"regulateur_vitesse\";i:0;s:15:\"detecteur_pluie\";i:0;s:18:\"allumage_auto_feux\";i:0;s:21:\"frein_main_electrique\";i:0;s:18:\"aide_stationnement\";i:0;s:15:\"volant_reglable\";i:0;s:18:\"retros_electriques\";i:0;s:24:\"retros_rabat_electriques\";i:0;s:17:\"coffre_electrique\";i:0;s:18:\"sieges_electriques\";i:0;s:19:\"sieges_elec_memoire\";i:0;s:20:\"banquette_rabattable\";i:0;s:13:\"ecran_tactile\";i:0;s:15:\"cockpit_digital\";i:0;s:16:\"commandes_volant\";i:0;s:17:\"commandes_vocales\";i:0;s:23:\"reconnaissance_panneaux\";i:0;s:20:\"affichage_tete_haute\";i:0;s:13:\"systeme_audio\";i:0;s:9:\"wifi_bord\";i:0;s:9:\"bluetooth\";i:0;s:24:\"compatibilite_smartphone\";i:0;s:26:\"apple_carplay_android_auto\";i:0;s:17:\"chargeur_sans_fil\";i:0;s:25:\"sellerie_similicuir_tissu\";i:0;s:11:\"volant_cuir\";i:0;s:14:\"follow_me_home\";i:0;s:16:\"lumiere_ambiance\";i:0;s:13:\"feux_jour_led\";i:0;s:15:\"phares_full_led\";i:0;s:16:\"toit_panoramique\";i:0;s:14:\"barres_de_toit\";i:0;s:18:\"vitres_surteintees\";i:0;}s:11:\"\0*\0original\";a:114:{s:2:\"id\";i:140;s:5:\"phone\";s:10:\"0770080009\";s:7:\"pack_id\";N;s:5:\"titre\";s:28:\"Volkswagen Tiguan 2021 CARAT\";s:4:\"prix\";i:420000;s:4:\"mark\";s:2:\"46\";s:6:\"modele\";s:2:\"69\";s:9:\"matricule\";N;s:4:\"year\";i:2021;s:2:\"km\";i:129000;s:9:\"carburant\";s:6:\"diesel\";s:3:\"box\";s:11:\"automatique\";s:4:\"etat\";s:9:\"excellent\";s:4:\"city\";s:27:\"Casablanca-Jnane Californie\";s:2:\"cv\";s:1:\"8\";s:7:\"nb_Door\";i:5;s:7:\"origine\";s:10:\"dédouané\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";s:11:\"GtYOYQN8f1A\";s:4:\"reel\";s:11:\"6ZmNbzPSAF8\";s:8:\"bodywork\";s:10:\"suv et 4x4\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:63:\"[\"volkswagen-tiguan-832022.jpg\",\"volkswagen-tiguan-832022.jpg\"]\";s:5:\"image\";s:0:\"\";s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";N;s:3:\"co2\";N;s:8:\"certifie\";i:1;s:10:\"particulie\";i:0;s:8:\"showroom\";i:1;s:7:\"finance\";i:1;s:7:\"jantesA\";i:0;s:7:\"airbags\";i:0;s:13:\"climatisation\";i:1;s:3:\"gps\";i:1;s:12:\"toit_ouvrant\";i:1;s:19:\"double_toit_ouvrant\";i:1;s:10:\"siege_cuir\";i:1;s:11:\"radar_recul\";i:1;s:12:\"camera_recul\";i:1;s:10:\"vitreselec\";i:1;s:3:\"abs\";i:1;s:3:\"eps\";i:1;s:2:\"rv\";i:1;s:2:\"lv\";i:1;s:2:\"cd\";i:1;s:10:\"ordinateur\";i:1;s:12:\"verrouillage\";i:1;s:8:\"garantie\";i:1;s:5:\"views\";i:164;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-04-30 10:03:21\";s:10:\"updated_at\";s:19:\"2025-09-27 01:08:06\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:1;s:6:\"colors\";s:5:\"Blanc\";s:3:\"esp\";i:0;s:12:\"antipatinage\";i:0;s:21:\"aide_freinage_urgence\";i:0;s:26:\"antidemarrage_electronique\";i:0;s:19:\"aide_demarrage_cote\";i:0;s:23:\"selecteur_mode_conduite\";i:0;s:17:\"detection_fatigue\";i:0;s:21:\"maintien_dans_la_voie\";i:0;s:20:\"detecteur_angle_mort\";i:0;s:23:\"detecteur_sous_gonflage\";i:0;s:21:\"fermeture_portes_auto\";i:0;s:18:\"preparation_isofix\";i:0;s:21:\"phares_antibrouillard\";i:0;s:14:\"systeme_alarme\";i:0;s:10:\"start_stop\";i:0;s:18:\"regulateur_vitesse\";i:0;s:15:\"detecteur_pluie\";i:0;s:18:\"allumage_auto_feux\";i:0;s:21:\"frein_main_electrique\";i:0;s:18:\"aide_stationnement\";i:0;s:15:\"volant_reglable\";i:0;s:18:\"retros_electriques\";i:0;s:24:\"retros_rabat_electriques\";i:0;s:17:\"coffre_electrique\";i:0;s:18:\"sieges_electriques\";i:0;s:19:\"sieges_elec_memoire\";i:0;s:20:\"banquette_rabattable\";i:0;s:13:\"ecran_tactile\";i:0;s:15:\"cockpit_digital\";i:0;s:16:\"commandes_volant\";i:0;s:17:\"commandes_vocales\";i:0;s:23:\"reconnaissance_panneaux\";i:0;s:20:\"affichage_tete_haute\";i:0;s:13:\"systeme_audio\";i:0;s:9:\"wifi_bord\";i:0;s:9:\"bluetooth\";i:0;s:24:\"compatibilite_smartphone\";i:0;s:26:\"apple_carplay_android_auto\";i:0;s:17:\"chargeur_sans_fil\";i:0;s:25:\"sellerie_similicuir_tissu\";i:0;s:11:\"volant_cuir\";i:0;s:14:\"follow_me_home\";i:0;s:16:\"lumiere_ambiance\";i:0;s:13:\"feux_jour_led\";i:0;s:15:\"phares_full_led\";i:0;s:16:\"toit_panoramique\";i:0;s:14:\"barres_de_toit\";i:0;s:18:\"vitres_surteintees\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:6:{s:8:\"verified\";s:7:\"boolean\";s:7:\"jantesA\";s:7:\"integer\";s:7:\"airbags\";s:7:\"integer\";s:13:\"climatisation\";s:7:\"integer\";s:6:\"images\";s:5:\"array\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:110:{i:0;s:5:\"phone\";i:1;s:7:\"pack_id\";i:2;s:5:\"titre\";i:3;s:4:\"prix\";i:4;s:4:\"mark\";i:5;s:6:\"modele\";i:6;s:9:\"matricule\";i:7;s:4:\"year\";i:8;s:2:\"km\";i:9;s:9:\"carburant\";i:10;s:3:\"box\";i:11;s:4:\"etat\";i:12;s:4:\"city\";i:13;s:2:\"cv\";i:14;s:7:\"nb_Door\";i:15;s:7:\"origine\";i:16;s:13:\"premiere_main\";i:17;s:5:\"video\";i:18;s:4:\"reel\";i:19;s:8:\"bodywork\";i:20;s:6:\"status\";i:21;s:5:\"image\";i:22;s:8:\"imgrleft\";i:23;s:7:\"imgrtop\";i:24;s:7:\"imgrmed\";i:25;s:10:\"imgrbottom\";i:26;s:9:\"imgrright\";i:27;s:11:\"imginterior\";i:28;s:10:\"imgrapport\";i:29;s:7:\"rapport\";i:30;s:3:\"co2\";i:31;s:8:\"certifie\";i:32;s:10:\"particulie\";i:33;s:8:\"showroom\";i:34;s:7:\"finance\";i:35;s:16:\"jantes_aluminium\";i:36;s:7:\"airbags\";i:37;s:13:\"climatisation\";i:38;s:3:\"gps\";i:39;s:12:\"toit_ouvrant\";i:40;s:19:\"double_toit_ouvrant\";i:41;s:10:\"siege_cuir\";i:42;s:11:\"radar_recul\";i:43;s:12:\"camera_recul\";i:44;s:10:\"vitreselec\";i:45;s:3:\"abs\";i:46;s:3:\"eps\";i:47;s:2:\"rv\";i:48;s:2:\"lv\";i:49;s:2:\"cd\";i:50;s:10:\"ordinateur\";i:51;s:12:\"verrouillage\";i:52;s:8:\"garantie\";i:53;s:5:\"views\";i:54;s:6:\"active\";i:55;s:8:\"verified\";i:56;s:4:\"pack\";i:57;s:17:\"featured_position\";i:58;s:16:\"show_in_homepage\";i:59;s:17:\"homepage_position\";i:60;s:11:\"is_homepage\";i:61;s:6:\"colors\";i:62;s:3:\"esp\";i:63;s:12:\"antipatinage\";i:64;s:21:\"aide_freinage_urgence\";i:65;s:26:\"antidemarrage_electronique\";i:66;s:19:\"aide_demarrage_cote\";i:67;s:23:\"selecteur_mode_conduite\";i:68;s:17:\"detection_fatigue\";i:69;s:21:\"maintien_dans_la_voie\";i:70;s:20:\"detecteur_angle_mort\";i:71;s:23:\"detecteur_sous_gonflage\";i:72;s:21:\"fermeture_portes_auto\";i:73;s:18:\"preparation_isofix\";i:74;s:21:\"phares_antibrouillard\";i:75;s:14:\"systeme_alarme\";i:76;s:10:\"start_stop\";i:77;s:18:\"regulateur_vitesse\";i:78;s:15:\"detecteur_pluie\";i:79;s:18:\"allumage_auto_feux\";i:80;s:21:\"frein_main_electrique\";i:81;s:18:\"aide_stationnement\";i:82;s:15:\"volant_reglable\";i:83;s:18:\"retros_electriques\";i:84;s:24:\"retros_rabat_electriques\";i:85;s:17:\"coffre_electrique\";i:86;s:18:\"sieges_electriques\";i:87;s:19:\"sieges_elec_memoire\";i:88;s:20:\"banquette_rabattable\";i:89;s:13:\"ecran_tactile\";i:90;s:15:\"cockpit_digital\";i:91;s:16:\"commandes_volant\";i:92;s:17:\"commandes_vocales\";i:93;s:23:\"reconnaissance_panneaux\";i:94;s:20:\"affichage_tete_haute\";i:95;s:13:\"systeme_audio\";i:96;s:9:\"wifi_bord\";i:97;s:9:\"bluetooth\";i:98;s:24:\"compatibilite_smartphone\";i:99;s:26:\"apple_carplay_android_auto\";i:100;s:17:\"chargeur_sans_fil\";i:101;s:25:\"sellerie_similicuir_tissu\";i:102;s:11:\"volant_cuir\";i:103;s:14:\"follow_me_home\";i:104;s:16:\"lumiere_ambiance\";i:105;s:13:\"feux_jour_led\";i:106;s:15:\"phares_full_led\";i:107;s:16:\"toit_panoramique\";i:108;s:14:\"barres_de_toit\";i:109;s:18:\"vitres_surteintees\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:8;O:19:\"App\\Models\\Annonces\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"annonces\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:114:{s:2:\"id\";i:137;s:5:\"phone\";s:10:\"0770080009\";s:7:\"pack_id\";N;s:5:\"titre\";s:25:\"JEEP Wrangler SAHARA 2021\";s:4:\"prix\";i:500000;s:4:\"mark\";s:4:\"JEEP\";s:6:\"modele\";s:8:\"Wrangler\";s:9:\"matricule\";N;s:4:\"year\";i:2021;s:2:\"km\";i:100000;s:9:\"carburant\";s:6:\"diesel\";s:3:\"box\";s:11:\"automatique\";s:4:\"etat\";s:9:\"excellent\";s:4:\"city\";s:27:\"Casablanca-Jnane Californie\";s:2:\"cv\";s:1:\"9\";s:7:\"nb_Door\";i:5;s:7:\"origine\";s:11:\"WW au Maroc\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";s:11:\"N4Mu3JlEjtc\";s:4:\"reel\";s:11:\"JgGQjXBDOms\";s:8:\"bodywork\";s:10:\"suv et 4x4\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:28:\"[\"jeep-wrangler-249214.jpg\"]\";s:5:\"image\";s:0:\"\";s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";N;s:3:\"co2\";N;s:8:\"certifie\";i:1;s:10:\"particulie\";i:0;s:8:\"showroom\";i:1;s:7:\"finance\";i:1;s:7:\"jantesA\";i:1;s:7:\"airbags\";i:1;s:13:\"climatisation\";i:1;s:3:\"gps\";i:1;s:12:\"toit_ouvrant\";i:1;s:19:\"double_toit_ouvrant\";i:1;s:10:\"siege_cuir\";i:1;s:11:\"radar_recul\";i:1;s:12:\"camera_recul\";i:1;s:10:\"vitreselec\";i:1;s:3:\"abs\";i:1;s:3:\"eps\";i:1;s:2:\"rv\";i:1;s:2:\"lv\";i:1;s:2:\"cd\";i:1;s:10:\"ordinateur\";i:1;s:12:\"verrouillage\";i:1;s:8:\"garantie\";i:1;s:5:\"views\";i:122;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-04-17 17:55:51\";s:10:\"updated_at\";s:19:\"2025-09-11 00:33:38\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:0;s:6:\"colors\";s:0:\"\";s:3:\"esp\";i:0;s:12:\"antipatinage\";i:0;s:21:\"aide_freinage_urgence\";i:0;s:26:\"antidemarrage_electronique\";i:0;s:19:\"aide_demarrage_cote\";i:0;s:23:\"selecteur_mode_conduite\";i:0;s:17:\"detection_fatigue\";i:0;s:21:\"maintien_dans_la_voie\";i:0;s:20:\"detecteur_angle_mort\";i:0;s:23:\"detecteur_sous_gonflage\";i:0;s:21:\"fermeture_portes_auto\";i:0;s:18:\"preparation_isofix\";i:0;s:21:\"phares_antibrouillard\";i:0;s:14:\"systeme_alarme\";i:0;s:10:\"start_stop\";i:0;s:18:\"regulateur_vitesse\";i:0;s:15:\"detecteur_pluie\";i:0;s:18:\"allumage_auto_feux\";i:0;s:21:\"frein_main_electrique\";i:0;s:18:\"aide_stationnement\";i:0;s:15:\"volant_reglable\";i:0;s:18:\"retros_electriques\";i:0;s:24:\"retros_rabat_electriques\";i:0;s:17:\"coffre_electrique\";i:0;s:18:\"sieges_electriques\";i:0;s:19:\"sieges_elec_memoire\";i:0;s:20:\"banquette_rabattable\";i:0;s:13:\"ecran_tactile\";i:0;s:15:\"cockpit_digital\";i:0;s:16:\"commandes_volant\";i:0;s:17:\"commandes_vocales\";i:0;s:23:\"reconnaissance_panneaux\";i:0;s:20:\"affichage_tete_haute\";i:0;s:13:\"systeme_audio\";i:0;s:9:\"wifi_bord\";i:0;s:9:\"bluetooth\";i:0;s:24:\"compatibilite_smartphone\";i:0;s:26:\"apple_carplay_android_auto\";i:0;s:17:\"chargeur_sans_fil\";i:0;s:25:\"sellerie_similicuir_tissu\";i:0;s:11:\"volant_cuir\";i:0;s:14:\"follow_me_home\";i:0;s:16:\"lumiere_ambiance\";i:0;s:13:\"feux_jour_led\";i:0;s:15:\"phares_full_led\";i:0;s:16:\"toit_panoramique\";i:0;s:14:\"barres_de_toit\";i:0;s:18:\"vitres_surteintees\";i:0;}s:11:\"\0*\0original\";a:114:{s:2:\"id\";i:137;s:5:\"phone\";s:10:\"0770080009\";s:7:\"pack_id\";N;s:5:\"titre\";s:25:\"JEEP Wrangler SAHARA 2021\";s:4:\"prix\";i:500000;s:4:\"mark\";s:4:\"JEEP\";s:6:\"modele\";s:8:\"Wrangler\";s:9:\"matricule\";N;s:4:\"year\";i:2021;s:2:\"km\";i:100000;s:9:\"carburant\";s:6:\"diesel\";s:3:\"box\";s:11:\"automatique\";s:4:\"etat\";s:9:\"excellent\";s:4:\"city\";s:27:\"Casablanca-Jnane Californie\";s:2:\"cv\";s:1:\"9\";s:7:\"nb_Door\";i:5;s:7:\"origine\";s:11:\"WW au Maroc\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";s:11:\"N4Mu3JlEjtc\";s:4:\"reel\";s:11:\"JgGQjXBDOms\";s:8:\"bodywork\";s:10:\"suv et 4x4\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:28:\"[\"jeep-wrangler-249214.jpg\"]\";s:5:\"image\";s:0:\"\";s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";N;s:3:\"co2\";N;s:8:\"certifie\";i:1;s:10:\"particulie\";i:0;s:8:\"showroom\";i:1;s:7:\"finance\";i:1;s:7:\"jantesA\";i:1;s:7:\"airbags\";i:1;s:13:\"climatisation\";i:1;s:3:\"gps\";i:1;s:12:\"toit_ouvrant\";i:1;s:19:\"double_toit_ouvrant\";i:1;s:10:\"siege_cuir\";i:1;s:11:\"radar_recul\";i:1;s:12:\"camera_recul\";i:1;s:10:\"vitreselec\";i:1;s:3:\"abs\";i:1;s:3:\"eps\";i:1;s:2:\"rv\";i:1;s:2:\"lv\";i:1;s:2:\"cd\";i:1;s:10:\"ordinateur\";i:1;s:12:\"verrouillage\";i:1;s:8:\"garantie\";i:1;s:5:\"views\";i:122;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-04-17 17:55:51\";s:10:\"updated_at\";s:19:\"2025-09-11 00:33:38\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:0;s:6:\"colors\";s:0:\"\";s:3:\"esp\";i:0;s:12:\"antipatinage\";i:0;s:21:\"aide_freinage_urgence\";i:0;s:26:\"antidemarrage_electronique\";i:0;s:19:\"aide_demarrage_cote\";i:0;s:23:\"selecteur_mode_conduite\";i:0;s:17:\"detection_fatigue\";i:0;s:21:\"maintien_dans_la_voie\";i:0;s:20:\"detecteur_angle_mort\";i:0;s:23:\"detecteur_sous_gonflage\";i:0;s:21:\"fermeture_portes_auto\";i:0;s:18:\"preparation_isofix\";i:0;s:21:\"phares_antibrouillard\";i:0;s:14:\"systeme_alarme\";i:0;s:10:\"start_stop\";i:0;s:18:\"regulateur_vitesse\";i:0;s:15:\"detecteur_pluie\";i:0;s:18:\"allumage_auto_feux\";i:0;s:21:\"frein_main_electrique\";i:0;s:18:\"aide_stationnement\";i:0;s:15:\"volant_reglable\";i:0;s:18:\"retros_electriques\";i:0;s:24:\"retros_rabat_electriques\";i:0;s:17:\"coffre_electrique\";i:0;s:18:\"sieges_electriques\";i:0;s:19:\"sieges_elec_memoire\";i:0;s:20:\"banquette_rabattable\";i:0;s:13:\"ecran_tactile\";i:0;s:15:\"cockpit_digital\";i:0;s:16:\"commandes_volant\";i:0;s:17:\"commandes_vocales\";i:0;s:23:\"reconnaissance_panneaux\";i:0;s:20:\"affichage_tete_haute\";i:0;s:13:\"systeme_audio\";i:0;s:9:\"wifi_bord\";i:0;s:9:\"bluetooth\";i:0;s:24:\"compatibilite_smartphone\";i:0;s:26:\"apple_carplay_android_auto\";i:0;s:17:\"chargeur_sans_fil\";i:0;s:25:\"sellerie_similicuir_tissu\";i:0;s:11:\"volant_cuir\";i:0;s:14:\"follow_me_home\";i:0;s:16:\"lumiere_ambiance\";i:0;s:13:\"feux_jour_led\";i:0;s:15:\"phares_full_led\";i:0;s:16:\"toit_panoramique\";i:0;s:14:\"barres_de_toit\";i:0;s:18:\"vitres_surteintees\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:6:{s:8:\"verified\";s:7:\"boolean\";s:7:\"jantesA\";s:7:\"integer\";s:7:\"airbags\";s:7:\"integer\";s:13:\"climatisation\";s:7:\"integer\";s:6:\"images\";s:5:\"array\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:110:{i:0;s:5:\"phone\";i:1;s:7:\"pack_id\";i:2;s:5:\"titre\";i:3;s:4:\"prix\";i:4;s:4:\"mark\";i:5;s:6:\"modele\";i:6;s:9:\"matricule\";i:7;s:4:\"year\";i:8;s:2:\"km\";i:9;s:9:\"carburant\";i:10;s:3:\"box\";i:11;s:4:\"etat\";i:12;s:4:\"city\";i:13;s:2:\"cv\";i:14;s:7:\"nb_Door\";i:15;s:7:\"origine\";i:16;s:13:\"premiere_main\";i:17;s:5:\"video\";i:18;s:4:\"reel\";i:19;s:8:\"bodywork\";i:20;s:6:\"status\";i:21;s:5:\"image\";i:22;s:8:\"imgrleft\";i:23;s:7:\"imgrtop\";i:24;s:7:\"imgrmed\";i:25;s:10:\"imgrbottom\";i:26;s:9:\"imgrright\";i:27;s:11:\"imginterior\";i:28;s:10:\"imgrapport\";i:29;s:7:\"rapport\";i:30;s:3:\"co2\";i:31;s:8:\"certifie\";i:32;s:10:\"particulie\";i:33;s:8:\"showroom\";i:34;s:7:\"finance\";i:35;s:16:\"jantes_aluminium\";i:36;s:7:\"airbags\";i:37;s:13:\"climatisation\";i:38;s:3:\"gps\";i:39;s:12:\"toit_ouvrant\";i:40;s:19:\"double_toit_ouvrant\";i:41;s:10:\"siege_cuir\";i:42;s:11:\"radar_recul\";i:43;s:12:\"camera_recul\";i:44;s:10:\"vitreselec\";i:45;s:3:\"abs\";i:46;s:3:\"eps\";i:47;s:2:\"rv\";i:48;s:2:\"lv\";i:49;s:2:\"cd\";i:50;s:10:\"ordinateur\";i:51;s:12:\"verrouillage\";i:52;s:8:\"garantie\";i:53;s:5:\"views\";i:54;s:6:\"active\";i:55;s:8:\"verified\";i:56;s:4:\"pack\";i:57;s:17:\"featured_position\";i:58;s:16:\"show_in_homepage\";i:59;s:17:\"homepage_position\";i:60;s:11:\"is_homepage\";i:61;s:6:\"colors\";i:62;s:3:\"esp\";i:63;s:12:\"antipatinage\";i:64;s:21:\"aide_freinage_urgence\";i:65;s:26:\"antidemarrage_electronique\";i:66;s:19:\"aide_demarrage_cote\";i:67;s:23:\"selecteur_mode_conduite\";i:68;s:17:\"detection_fatigue\";i:69;s:21:\"maintien_dans_la_voie\";i:70;s:20:\"detecteur_angle_mort\";i:71;s:23:\"detecteur_sous_gonflage\";i:72;s:21:\"fermeture_portes_auto\";i:73;s:18:\"preparation_isofix\";i:74;s:21:\"phares_antibrouillard\";i:75;s:14:\"systeme_alarme\";i:76;s:10:\"start_stop\";i:77;s:18:\"regulateur_vitesse\";i:78;s:15:\"detecteur_pluie\";i:79;s:18:\"allumage_auto_feux\";i:80;s:21:\"frein_main_electrique\";i:81;s:18:\"aide_stationnement\";i:82;s:15:\"volant_reglable\";i:83;s:18:\"retros_electriques\";i:84;s:24:\"retros_rabat_electriques\";i:85;s:17:\"coffre_electrique\";i:86;s:18:\"sieges_electriques\";i:87;s:19:\"sieges_elec_memoire\";i:88;s:20:\"banquette_rabattable\";i:89;s:13:\"ecran_tactile\";i:90;s:15:\"cockpit_digital\";i:91;s:16:\"commandes_volant\";i:92;s:17:\"commandes_vocales\";i:93;s:23:\"reconnaissance_panneaux\";i:94;s:20:\"affichage_tete_haute\";i:95;s:13:\"systeme_audio\";i:96;s:9:\"wifi_bord\";i:97;s:9:\"bluetooth\";i:98;s:24:\"compatibilite_smartphone\";i:99;s:26:\"apple_carplay_android_auto\";i:100;s:17:\"chargeur_sans_fil\";i:101;s:25:\"sellerie_similicuir_tissu\";i:102;s:11:\"volant_cuir\";i:103;s:14:\"follow_me_home\";i:104;s:16:\"lumiere_ambiance\";i:105;s:13:\"feux_jour_led\";i:106;s:15:\"phares_full_led\";i:107;s:16:\"toit_panoramique\";i:108;s:14:\"barres_de_toit\";i:109;s:18:\"vitres_surteintees\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1760638777);
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_similar_adsp', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:19:\"App\\Models\\Annonces\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"annonces\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:114:{s:2:\"id\";i:169;s:5:\"phone\";s:10:\"0637916199\";s:7:\"pack_id\";N;s:5:\"titre\";s:4:\"test\";s:4:\"prix\";i:630000;s:4:\"mark\";s:1:\"3\";s:6:\"modele\";s:3:\"112\";s:9:\"matricule\";s:10:\"61514-M-52\";s:4:\"year\";i:2017;s:2:\"km\";i:200000;s:9:\"carburant\";s:10:\"electrique\";s:3:\"box\";s:11:\"automatique\";s:4:\"etat\";s:9:\"très bon\";s:4:\"city\";s:8:\"Tétouan\";s:2:\"cv\";s:2:\"15\";s:7:\"nb_Door\";i:6;s:7:\"origine\";s:10:\"dédouané\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";N;s:4:\"reel\";N;s:8:\"bodywork\";s:10:\"suv et 4x4\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:153:\"[\"3-112-300832.png\",\"3-112-573500.jpg\",\"3-112-481088.png\",\"3-112-366829.PNG\",\"3-112-894541.png\",\"3-112-642978.jpg\",\"3-112-320850.jpg\",\"3-112-404891.jpg\"]\";s:5:\"image\";N;s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";N;s:3:\"co2\";N;s:8:\"certifie\";i:0;s:10:\"particulie\";i:1;s:8:\"showroom\";i:0;s:7:\"finance\";i:0;s:7:\"jantesA\";i:0;s:7:\"airbags\";i:1;s:13:\"climatisation\";i:1;s:3:\"gps\";i:1;s:12:\"toit_ouvrant\";i:0;s:19:\"double_toit_ouvrant\";i:0;s:10:\"siege_cuir\";i:0;s:11:\"radar_recul\";i:0;s:12:\"camera_recul\";i:1;s:10:\"vitreselec\";i:0;s:3:\"abs\";i:1;s:3:\"eps\";i:0;s:2:\"rv\";i:0;s:2:\"lv\";i:0;s:2:\"cd\";i:0;s:10:\"ordinateur\";i:0;s:12:\"verrouillage\";i:0;s:8:\"garantie\";i:0;s:5:\"views\";i:11;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-09-26 19:49:34\";s:10:\"updated_at\";s:19:\"2025-10-08 14:31:00\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:0;s:6:\"colors\";s:10:\"Bleu marin\";s:3:\"esp\";i:1;s:12:\"antipatinage\";i:1;s:21:\"aide_freinage_urgence\";i:1;s:26:\"antidemarrage_electronique\";i:1;s:19:\"aide_demarrage_cote\";i:1;s:23:\"selecteur_mode_conduite\";i:1;s:17:\"detection_fatigue\";i:1;s:21:\"maintien_dans_la_voie\";i:1;s:20:\"detecteur_angle_mort\";i:1;s:23:\"detecteur_sous_gonflage\";i:1;s:21:\"fermeture_portes_auto\";i:1;s:18:\"preparation_isofix\";i:1;s:21:\"phares_antibrouillard\";i:1;s:14:\"systeme_alarme\";i:1;s:10:\"start_stop\";i:1;s:18:\"regulateur_vitesse\";i:1;s:15:\"detecteur_pluie\";i:1;s:18:\"allumage_auto_feux\";i:1;s:21:\"frein_main_electrique\";i:1;s:18:\"aide_stationnement\";i:1;s:15:\"volant_reglable\";i:1;s:18:\"retros_electriques\";i:1;s:24:\"retros_rabat_electriques\";i:1;s:17:\"coffre_electrique\";i:1;s:18:\"sieges_electriques\";i:1;s:19:\"sieges_elec_memoire\";i:1;s:20:\"banquette_rabattable\";i:1;s:13:\"ecran_tactile\";i:1;s:15:\"cockpit_digital\";i:1;s:16:\"commandes_volant\";i:1;s:17:\"commandes_vocales\";i:1;s:23:\"reconnaissance_panneaux\";i:1;s:20:\"affichage_tete_haute\";i:1;s:13:\"systeme_audio\";i:1;s:9:\"wifi_bord\";i:1;s:9:\"bluetooth\";i:1;s:24:\"compatibilite_smartphone\";i:1;s:26:\"apple_carplay_android_auto\";i:1;s:17:\"chargeur_sans_fil\";i:1;s:25:\"sellerie_similicuir_tissu\";i:1;s:11:\"volant_cuir\";i:1;s:14:\"follow_me_home\";i:1;s:16:\"lumiere_ambiance\";i:1;s:13:\"feux_jour_led\";i:1;s:15:\"phares_full_led\";i:1;s:16:\"toit_panoramique\";i:1;s:14:\"barres_de_toit\";i:1;s:18:\"vitres_surteintees\";i:1;}s:11:\"\0*\0original\";a:114:{s:2:\"id\";i:169;s:5:\"phone\";s:10:\"0637916199\";s:7:\"pack_id\";N;s:5:\"titre\";s:4:\"test\";s:4:\"prix\";i:630000;s:4:\"mark\";s:1:\"3\";s:6:\"modele\";s:3:\"112\";s:9:\"matricule\";s:10:\"61514-M-52\";s:4:\"year\";i:2017;s:2:\"km\";i:200000;s:9:\"carburant\";s:10:\"electrique\";s:3:\"box\";s:11:\"automatique\";s:4:\"etat\";s:9:\"très bon\";s:4:\"city\";s:8:\"Tétouan\";s:2:\"cv\";s:2:\"15\";s:7:\"nb_Door\";i:6;s:7:\"origine\";s:10:\"dédouané\";s:13:\"premiere_main\";s:3:\"oui\";s:5:\"video\";N;s:4:\"reel\";N;s:8:\"bodywork\";s:10:\"suv et 4x4\";s:6:\"status\";s:10:\"disponible\";s:6:\"images\";s:153:\"[\"3-112-300832.png\",\"3-112-573500.jpg\",\"3-112-481088.png\",\"3-112-366829.PNG\",\"3-112-894541.png\",\"3-112-642978.jpg\",\"3-112-320850.jpg\",\"3-112-404891.jpg\"]\";s:5:\"image\";N;s:8:\"imgrleft\";N;s:7:\"imgrtop\";N;s:7:\"imgrmed\";N;s:10:\"imgrbottom\";N;s:9:\"imgrright\";N;s:11:\"imginterior\";N;s:10:\"imgrapport\";N;s:7:\"rapport\";N;s:3:\"co2\";N;s:8:\"certifie\";i:0;s:10:\"particulie\";i:1;s:8:\"showroom\";i:0;s:7:\"finance\";i:0;s:7:\"jantesA\";i:0;s:7:\"airbags\";i:1;s:13:\"climatisation\";i:1;s:3:\"gps\";i:1;s:12:\"toit_ouvrant\";i:0;s:19:\"double_toit_ouvrant\";i:0;s:10:\"siege_cuir\";i:0;s:11:\"radar_recul\";i:0;s:12:\"camera_recul\";i:1;s:10:\"vitreselec\";i:0;s:3:\"abs\";i:1;s:3:\"eps\";i:0;s:2:\"rv\";i:0;s:2:\"lv\";i:0;s:2:\"cd\";i:0;s:10:\"ordinateur\";i:0;s:12:\"verrouillage\";i:0;s:8:\"garantie\";i:0;s:5:\"views\";i:11;s:6:\"active\";i:1;s:10:\"created_at\";s:19:\"2025-09-26 19:49:34\";s:10:\"updated_at\";s:19:\"2025-10-08 14:31:00\";s:10:\"deleted_at\";N;s:8:\"verified\";i:0;s:17:\"featured_position\";N;s:16:\"show_in_homepage\";i:0;s:17:\"homepage_position\";N;s:11:\"is_homepage\";i:0;s:6:\"colors\";s:10:\"Bleu marin\";s:3:\"esp\";i:1;s:12:\"antipatinage\";i:1;s:21:\"aide_freinage_urgence\";i:1;s:26:\"antidemarrage_electronique\";i:1;s:19:\"aide_demarrage_cote\";i:1;s:23:\"selecteur_mode_conduite\";i:1;s:17:\"detection_fatigue\";i:1;s:21:\"maintien_dans_la_voie\";i:1;s:20:\"detecteur_angle_mort\";i:1;s:23:\"detecteur_sous_gonflage\";i:1;s:21:\"fermeture_portes_auto\";i:1;s:18:\"preparation_isofix\";i:1;s:21:\"phares_antibrouillard\";i:1;s:14:\"systeme_alarme\";i:1;s:10:\"start_stop\";i:1;s:18:\"regulateur_vitesse\";i:1;s:15:\"detecteur_pluie\";i:1;s:18:\"allumage_auto_feux\";i:1;s:21:\"frein_main_electrique\";i:1;s:18:\"aide_stationnement\";i:1;s:15:\"volant_reglable\";i:1;s:18:\"retros_electriques\";i:1;s:24:\"retros_rabat_electriques\";i:1;s:17:\"coffre_electrique\";i:1;s:18:\"sieges_electriques\";i:1;s:19:\"sieges_elec_memoire\";i:1;s:20:\"banquette_rabattable\";i:1;s:13:\"ecran_tactile\";i:1;s:15:\"cockpit_digital\";i:1;s:16:\"commandes_volant\";i:1;s:17:\"commandes_vocales\";i:1;s:23:\"reconnaissance_panneaux\";i:1;s:20:\"affichage_tete_haute\";i:1;s:13:\"systeme_audio\";i:1;s:9:\"wifi_bord\";i:1;s:9:\"bluetooth\";i:1;s:24:\"compatibilite_smartphone\";i:1;s:26:\"apple_carplay_android_auto\";i:1;s:17:\"chargeur_sans_fil\";i:1;s:25:\"sellerie_similicuir_tissu\";i:1;s:11:\"volant_cuir\";i:1;s:14:\"follow_me_home\";i:1;s:16:\"lumiere_ambiance\";i:1;s:13:\"feux_jour_led\";i:1;s:15:\"phares_full_led\";i:1;s:16:\"toit_panoramique\";i:1;s:14:\"barres_de_toit\";i:1;s:18:\"vitres_surteintees\";i:1;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:6:{s:8:\"verified\";s:7:\"boolean\";s:7:\"jantesA\";s:7:\"integer\";s:7:\"airbags\";s:7:\"integer\";s:13:\"climatisation\";s:7:\"integer\";s:6:\"images\";s:5:\"array\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:110:{i:0;s:5:\"phone\";i:1;s:7:\"pack_id\";i:2;s:5:\"titre\";i:3;s:4:\"prix\";i:4;s:4:\"mark\";i:5;s:6:\"modele\";i:6;s:9:\"matricule\";i:7;s:4:\"year\";i:8;s:2:\"km\";i:9;s:9:\"carburant\";i:10;s:3:\"box\";i:11;s:4:\"etat\";i:12;s:4:\"city\";i:13;s:2:\"cv\";i:14;s:7:\"nb_Door\";i:15;s:7:\"origine\";i:16;s:13:\"premiere_main\";i:17;s:5:\"video\";i:18;s:4:\"reel\";i:19;s:8:\"bodywork\";i:20;s:6:\"status\";i:21;s:5:\"image\";i:22;s:8:\"imgrleft\";i:23;s:7:\"imgrtop\";i:24;s:7:\"imgrmed\";i:25;s:10:\"imgrbottom\";i:26;s:9:\"imgrright\";i:27;s:11:\"imginterior\";i:28;s:10:\"imgrapport\";i:29;s:7:\"rapport\";i:30;s:3:\"co2\";i:31;s:8:\"certifie\";i:32;s:10:\"particulie\";i:33;s:8:\"showroom\";i:34;s:7:\"finance\";i:35;s:16:\"jantes_aluminium\";i:36;s:7:\"airbags\";i:37;s:13:\"climatisation\";i:38;s:3:\"gps\";i:39;s:12:\"toit_ouvrant\";i:40;s:19:\"double_toit_ouvrant\";i:41;s:10:\"siege_cuir\";i:42;s:11:\"radar_recul\";i:43;s:12:\"camera_recul\";i:44;s:10:\"vitreselec\";i:45;s:3:\"abs\";i:46;s:3:\"eps\";i:47;s:2:\"rv\";i:48;s:2:\"lv\";i:49;s:2:\"cd\";i:50;s:10:\"ordinateur\";i:51;s:12:\"verrouillage\";i:52;s:8:\"garantie\";i:53;s:5:\"views\";i:54;s:6:\"active\";i:55;s:8:\"verified\";i:56;s:4:\"pack\";i:57;s:17:\"featured_position\";i:58;s:16:\"show_in_homepage\";i:59;s:17:\"homepage_position\";i:60;s:11:\"is_homepage\";i:61;s:6:\"colors\";i:62;s:3:\"esp\";i:63;s:12:\"antipatinage\";i:64;s:21:\"aide_freinage_urgence\";i:65;s:26:\"antidemarrage_electronique\";i:66;s:19:\"aide_demarrage_cote\";i:67;s:23:\"selecteur_mode_conduite\";i:68;s:17:\"detection_fatigue\";i:69;s:21:\"maintien_dans_la_voie\";i:70;s:20:\"detecteur_angle_mort\";i:71;s:23:\"detecteur_sous_gonflage\";i:72;s:21:\"fermeture_portes_auto\";i:73;s:18:\"preparation_isofix\";i:74;s:21:\"phares_antibrouillard\";i:75;s:14:\"systeme_alarme\";i:76;s:10:\"start_stop\";i:77;s:18:\"regulateur_vitesse\";i:78;s:15:\"detecteur_pluie\";i:79;s:18:\"allumage_auto_feux\";i:80;s:21:\"frein_main_electrique\";i:81;s:18:\"aide_stationnement\";i:82;s:15:\"volant_reglable\";i:83;s:18:\"retros_electriques\";i:84;s:24:\"retros_rabat_electriques\";i:85;s:17:\"coffre_electrique\";i:86;s:18:\"sieges_electriques\";i:87;s:19:\"sieges_elec_memoire\";i:88;s:20:\"banquette_rabattable\";i:89;s:13:\"ecran_tactile\";i:90;s:15:\"cockpit_digital\";i:91;s:16:\"commandes_volant\";i:92;s:17:\"commandes_vocales\";i:93;s:23:\"reconnaissance_panneaux\";i:94;s:20:\"affichage_tete_haute\";i:95;s:13:\"systeme_audio\";i:96;s:9:\"wifi_bord\";i:97;s:9:\"bluetooth\";i:98;s:24:\"compatibilite_smartphone\";i:99;s:26:\"apple_carplay_android_auto\";i:100;s:17:\"chargeur_sans_fil\";i:101;s:25:\"sellerie_similicuir_tissu\";i:102;s:11:\"volant_cuir\";i:103;s:14:\"follow_me_home\";i:104;s:16:\"lumiere_ambiance\";i:105;s:13:\"feux_jour_led\";i:106;s:15:\"phares_full_led\";i:107;s:16:\"toit_panoramique\";i:108;s:14:\"barres_de_toit\";i:109;s:18:\"vitres_surteintees\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1760638777),
('laravel_cache_vdAds', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:6:{i:0;O:20:\"App\\Models\\Videosads\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"videosads\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:69;s:5:\"title\";s:21:\"Captur Renault - 2021\";s:9:\"video_key\";s:11:\"iZ5iSGkRFLU\";s:10:\"created_at\";s:19:\"2024-11-22 16:36:57\";s:10:\"updated_at\";s:19:\"2024-11-22 16:36:57\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:69;s:5:\"title\";s:21:\"Captur Renault - 2021\";s:9:\"video_key\";s:11:\"iZ5iSGkRFLU\";s:10:\"created_at\";s:19:\"2024-11-22 16:36:57\";s:10:\"updated_at\";s:19:\"2024-11-22 16:36:57\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:5:\"title\";i:1;s:9:\"video_key\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:1;O:20:\"App\\Models\\Videosads\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"videosads\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:68;s:5:\"title\";s:12:\"BMW X5 -2017\";s:9:\"video_key\";s:11:\"0WVBRaNmZj0\";s:10:\"created_at\";s:19:\"2024-11-21 14:37:45\";s:10:\"updated_at\";s:19:\"2024-11-22 16:36:04\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:68;s:5:\"title\";s:12:\"BMW X5 -2017\";s:9:\"video_key\";s:11:\"0WVBRaNmZj0\";s:10:\"created_at\";s:19:\"2024-11-21 14:37:45\";s:10:\"updated_at\";s:19:\"2024-11-22 16:36:04\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:5:\"title\";i:1;s:9:\"video_key\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:2;O:20:\"App\\Models\\Videosads\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"videosads\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:67;s:5:\"title\";s:24:\"Volkswagen Tiguan - 2018\";s:9:\"video_key\";s:11:\"iGX4X2K8wt4\";s:10:\"created_at\";s:19:\"2024-11-20 14:38:54\";s:10:\"updated_at\";s:19:\"2024-11-20 14:38:54\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:67;s:5:\"title\";s:24:\"Volkswagen Tiguan - 2018\";s:9:\"video_key\";s:11:\"iGX4X2K8wt4\";s:10:\"created_at\";s:19:\"2024-11-20 14:38:54\";s:10:\"updated_at\";s:19:\"2024-11-20 14:38:54\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:5:\"title\";i:1;s:9:\"video_key\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:3;O:20:\"App\\Models\\Videosads\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"videosads\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:66;s:5:\"title\";s:21:\"Hyundai Creta  - 2022\";s:9:\"video_key\";s:11:\"6mQvsMa3rJU\";s:10:\"created_at\";s:19:\"2024-11-13 09:43:19\";s:10:\"updated_at\";s:19:\"2024-11-13 09:43:19\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:66;s:5:\"title\";s:21:\"Hyundai Creta  - 2022\";s:9:\"video_key\";s:11:\"6mQvsMa3rJU\";s:10:\"created_at\";s:19:\"2024-11-13 09:43:19\";s:10:\"updated_at\";s:19:\"2024-11-13 09:43:19\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:5:\"title\";i:1;s:9:\"video_key\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:4;O:20:\"App\\Models\\Videosads\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"videosads\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:65;s:5:\"title\";s:21:\"Hyundai Tucson - 2022\";s:9:\"video_key\";s:11:\"sHgQ7YInOuY\";s:10:\"created_at\";s:19:\"2024-11-13 09:42:29\";s:10:\"updated_at\";s:19:\"2024-11-13 09:44:44\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:65;s:5:\"title\";s:21:\"Hyundai Tucson - 2022\";s:9:\"video_key\";s:11:\"sHgQ7YInOuY\";s:10:\"created_at\";s:19:\"2024-11-13 09:42:29\";s:10:\"updated_at\";s:19:\"2024-11-13 09:44:44\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:5:\"title\";i:1;s:9:\"video_key\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}i:5;O:20:\"App\\Models\\Videosads\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"videosads\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:63;s:5:\"title\";s:21:\"Hyundai Tucson - 2022\";s:9:\"video_key\";s:11:\"DL-WynUxH_A\";s:10:\"created_at\";s:19:\"2024-09-28 14:47:30\";s:10:\"updated_at\";s:19:\"2024-09-28 14:47:30\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:63;s:5:\"title\";s:21:\"Hyundai Tucson - 2022\";s:9:\"video_key\";s:11:\"DL-WynUxH_A\";s:10:\"created_at\";s:19:\"2024-09-28 14:47:30\";s:10:\"updated_at\";s:19:\"2024-09-28 14:47:30\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:2:{i:0;s:5:\"title\";i:1;s:9:\"video_key\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:16:\"\0*\0forceDeleting\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1760611443);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(125) NOT NULL,
  `owner` varchar(125) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(125) NOT NULL,
  `email` varchar(125) NOT NULL,
  `phone` varchar(125) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `password` varchar(125) NOT NULL,
  `type` enum('pro','particulier','flotte&enchere') NOT NULL DEFAULT 'particulier',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `company` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `parent_id`, `name`, `email`, `phone`, `logo`, `password`, `type`, `created_at`, `updated_at`, `is_verified`, `is_approved`, `company`) VALUES
(1, NULL, 'Oussama', 'oussamaelhadi1111@gmail.com', '0637916134', NULL, '$2y$12$F644SHMdpV3x54sGm6jm3u6ErmQ8yTouU0bzukDeSXWcKK3CKu5Oa', 'pro', '2025-07-06 11:45:37', '2025-07-27 22:31:07', 0, 1, NULL),
(2, NULL, 'OUSSAMA', 'oussamacccelhadi11@gmail.com', '0637916135', NULL, '$2y$12$fnJCm4LthGldWfSEXMJ21uCyr3i4jkRw3JCZys0PMi3MBI9JQhmti', 'particulier', '2025-07-15 15:46:48', '2025-07-23 13:59:09', 0, 1, NULL),
(7, NULL, 'Elhadi', 'oussamaelhadi11598@gmail.com', '0637916199', NULL, '$2y$12$jG9K9HYYLJzobWf83tBoa.M5ZWrCmX3c2vtPx/cAr5R4MdJEQfyii', 'particulier', '2025-07-22 18:47:47', '2025-08-02 18:25:25', 0, 1, NULL),
(8, NULL, 'Oussama Elhadi', 'oussamaelhadi1215211@gmail.com', '0637916197', NULL, '$2y$12$IDGEBBvFxARz0V3sAqBiQeibym0DkuRbR01I7nz9PIYs0GVrcfKXS', 'particulier', '2025-07-22 18:53:30', '2025-07-22 18:53:30', 0, 0, NULL),
(9, NULL, 'Oussama Elhadi', 'oussamaelhadi125161@gmail.com', '0637916165', NULL, '$2y$12$2DdfYBKNyFuTp7Fnix9Tq.niZdo93FpRGCa2glJodrri0rJHuUTxu', 'particulier', '2025-07-22 18:54:35', '2025-07-22 18:54:35', 0, 0, NULL),
(10, NULL, 'rehab', 'rehabessabaouni@gmail.com', '06379162255', NULL, '$2y$12$n2uEfOxumYUOwGQpp8syVOl3582Zb4lQnNLCfpCKMYnaray184j/S', 'pro', '2025-07-25 09:59:21', '2025-07-25 10:01:09', 0, 1, NULL),
(11, NULL, 'ohesci', 'oussamaelhadi625611@gmail.com', '0637916131', NULL, '$2y$12$c/QitvVWtgfq6i9CC5hPPOm7FfdUrPJ5bb.akO4r.Udzu8VnRkEQG', 'particulier', '2025-08-05 17:26:42', '2025-08-05 17:26:42', 0, 0, NULL),
(12, NULL, 'Test', 'test@gmail.com', '637916145', NULL, '$2y$12$E/jY/zMkWJ7ZZtNz4Mrp0OnP.3Howd6Ax8VFYgCqflnsxAuTMW5P6', 'pro', '2025-09-09 13:04:48', '2025-09-09 13:05:59', 0, 1, NULL),
(13, NULL, 'mohammed abd', 'mohammedabd@gmail.com', '0637916161', NULL, '$2y$12$TCYs9cncSbbjjazyGi433uYyWILz1ww6CvaSR9WTAAFYn0tvSPUMS', 'particulier', '2025-09-11 17:01:38', '2025-09-11 17:01:38', 0, 0, NULL),
(14, NULL, 'Yahya yahya', 'oussamaelhadi11@gmail.com', '0637916122', NULL, '$2y$12$fhrWiiERM9o6DnFZv8w.hONAEAYtd27Pp6XNsCuSSso7/hoOw/y.e', 'flotte&enchere', '2025-09-17 10:30:30', '2025-09-17 10:31:26', 0, 1, 'L\'entreprise EMID'),
(17, NULL, 'amine', 'oussamaelhadi222@gmail.com', '0637916122', NULL, '$2y$12$8dPwxzDUUQf0OJE1Nutwk.WwxGJu7ebxt51fglEIC4j4AW1R45VeS', 'flotte&enchere', '2025-09-17 18:47:18', '2025-09-17 18:47:18', 0, 0, NULL),
(18, NULL, 'copie', 'oussamaelhadi1@gmail.com', '0637916122', NULL, '$2y$12$UoY3VBy6jmmF55b12fuewO6QEA6rIRiUbCxM/LqntasRBOv5xyvOC', 'flotte&enchere', '2025-09-17 18:49:15', '2025-09-17 18:52:35', 0, 1, NULL),
(19, NULL, 'xxxxx', 'oussamaelhadi11222@gmail.com', '0637916122', NULL, '$2y$12$TKxIeWA0YbynHjo1b3FtBOTtHgnwm.uL9r.nuXSCpPwgvFOV8ahCu', 'flotte&enchere', '2025-09-17 18:51:46', '2025-09-17 18:52:31', 0, 1, NULL),
(23, NULL, 'Oussama', 'oussamaelhadi2111@gmail.com', '0637916122', NULL, '$2y$12$TTylP0LqV99WXFfx4QASw.GjSx4dUrsOmVBgxjm7t9gOit/UTopf.', 'flotte&enchere', '2025-09-17 19:03:21', '2025-09-17 19:04:35', 0, 1, NULL),
(25, NULL, 'OSSAMA ELHADI', 'oussamaelhadi0@gmail.com', '0634916133', '25-587399.jpeg', '$2y$12$dZPj/V0DQI2o0Z/TYkIk5ef8jBAl.1v/231SlC5p9GLWE.vBfAlra', 'flotte&enchere', '2025-09-19 20:27:28', '2025-09-29 10:00:31', 0, 1, 'RINALINK'),
(26, NULL, 'test', 'oussamaelhadi111201@gmail.com', '0638587557', NULL, '$2y$12$xDmxxOMZ1yLqRSKBiHvElOO7fBNjXK2eGy7zhnnOTll1WAyR/Fylq', 'flotte&enchere', '2025-09-23 21:39:19', '2025-09-23 21:39:19', 0, 1, 'MED'),
(27, NULL, 'Oussama test par', 'oussamaelhadi1110@gmail.com', '0637996134', '[\"1758911341-68d6db6dba6b3.png\"]', '$2y$12$dhLpibtEvsJCZyHlMxA6iuBLC65/XdEixwtjc.CGRA0.LRB4BpyYO', 'particulier', '2025-09-26 17:29:02', '2025-09-26 17:30:05', 0, 1, NULL),
(28, NULL, 'Oussama', 'oussamaelhad11@gmail.com', '0637556134', '28-751124.jpg', '$2y$12$B7lCpivAdPpemKRfZWSiNOwiV0AVntp4/N56RI9/UpvFeMEu4CBDa', 'flotte&enchere', '2025-09-26 22:13:06', '2025-09-27 00:36:17', 0, 1, 'Gogargo'),
(29, NULL, 'test surnom', 'oussamaeldi11@gmail.com', '0637556134', '28-751124.jpg', '$2y$12$d2yoAixgLDCsdS9bW2eCvuu8BGD4fHi1hs9wQqkV5cC/DrZCpg/Mq', 'flotte&enchere', '2025-09-27 00:38:02', '2025-09-27 00:38:33', 0, 1, 'Gogargo'),
(30, NULL, 'Test enchere', 'test1111@gmail.com', '0655555555', 'logos/UAfjepY72Xe7grWDva9cqSlRFsRKNZPV3HBDbBP1.png', '$2y$12$8Ag6BN0tAayK3YJ5VfzHlOQ0Y6CFErGnb/mTBu4cWZdUxWg03dwyS', 'flotte&enchere', '2025-09-29 11:43:31', '2025-09-29 11:44:41', 0, 1, 'KOSSMARK'),
(31, NULL, 'BMCI test', 'test11111@gmail.com', '0638587550', 'logos/CzhYiCswnAsW90Vnh1lp4Jgt8cQUQAps3ypZjvE5.jpg', '$2y$12$uAr5BaxT8adl57DozkZoP.KiPx8bHt94UrisyyatZUo01i5AWEqty', 'flotte&enchere', '2025-09-29 18:00:49', '2025-09-29 18:00:49', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_types`
--

CREATE TABLE `client_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `taux_interet` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_types`
--

INSERT INTO `client_types` (`id`, `name`, `taux_interet`, `created_at`, `updated_at`) VALUES
(1, 'Retraité', 12.00, NULL, '2025-09-08 17:33:11'),
(2, 'Salarié du secteur privé', 12.50, NULL, '2025-09-08 17:33:11'),
(3, 'Fonctionnaire', 10.50, NULL, '2025-09-08 17:33:11'),
(4, 'Profession libérale', 13.00, NULL, '2025-09-08 17:33:11'),
(5, 'Commerçant', 14.00, NULL, '2025-09-08 17:33:11'),
(6, 'Artisan', 14.00, NULL, '2025-09-08 17:33:11'),
(7, 'Autres professions', 15.00, NULL, '2025-09-08 17:33:11');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Argent', NULL, NULL, NULL),
(2, 'Blanc', NULL, NULL, NULL),
(3, 'Blanc Nacré', NULL, NULL, NULL),
(4, 'Bleu', NULL, NULL, NULL),
(5, 'Bleu acier', NULL, NULL, NULL),
(6, 'Bleu acier clair', NULL, NULL, NULL),
(7, 'Bleu Alice', NULL, NULL, NULL),
(8, 'Bleu ardoise', NULL, NULL, NULL),
(9, 'Bleu ardoise foncé', NULL, NULL, NULL),
(10, 'Bleu ardoise moyen', NULL, NULL, NULL),
(11, 'Bleu cadet', NULL, NULL, NULL),
(12, 'Bleu ciel', NULL, NULL, NULL),
(13, 'Bleu de minuit', NULL, NULL, NULL),
(14, 'Bleu marin', NULL, NULL, NULL),
(15, 'Bleu marine', NULL, NULL, NULL),
(16, 'Bleu moyen', NULL, NULL, NULL),
(17, 'Bleu poudre', NULL, NULL, NULL),
(18, 'Bleu royal', NULL, NULL, NULL),
(19, 'Bleu toile', NULL, NULL, NULL),
(20, 'Bleu violet', NULL, NULL, NULL),
(21, 'Bleuet', NULL, NULL, NULL),
(22, 'Bois rustique', NULL, NULL, NULL),
(23, 'Brique', NULL, NULL, NULL),
(24, 'Brun rosé', NULL, NULL, NULL),
(25, 'Brun sableux', NULL, NULL, NULL),
(26, 'Brun tanné', NULL, NULL, NULL),
(27, 'Gris', NULL, NULL, NULL),
(28, 'Gris clair', NULL, NULL, NULL),
(29, 'Gris foncé', NULL, NULL, NULL),
(30, 'Gris Gainsboro', NULL, NULL, NULL),
(31, 'Gris mat', NULL, NULL, NULL),
(32, 'Gris mat', NULL, NULL, NULL),
(33, 'Indigo', NULL, NULL, NULL),
(34, 'Ivoire', NULL, NULL, NULL),
(35, 'Marron', NULL, NULL, NULL),
(36, 'Noir', NULL, NULL, NULL),
(37, 'Champagne', NULL, NULL, NULL),
(38, 'Orange', NULL, NULL, NULL),
(39, 'Pourpre', NULL, NULL, NULL),
(40, 'Prune', NULL, NULL, NULL),
(41, 'Rouge', NULL, NULL, NULL),
(42, 'Rouge foncé', NULL, NULL, NULL),
(43, 'Rouge indien', NULL, NULL, NULL),
(44, 'Rouge violet moyen', NULL, NULL, NULL),
(45, 'Rouge violet pâle', NULL, NULL, NULL),
(46, 'Teal', NULL, NULL, NULL),
(47, 'Terre de Sienne', NULL, NULL, NULL),
(48, 'Tomate', NULL, NULL, NULL),
(49, 'Turquoise', NULL, NULL, NULL),
(50, 'Vert', NULL, NULL, NULL),
(51, 'Vert Chartreuse', NULL, NULL, NULL),
(52, 'Vert d\'eau', NULL, NULL, NULL),
(53, 'Vert eau marine', NULL, NULL, NULL),
(54, 'Vert eau marine moyen', NULL, NULL, NULL),
(55, 'Vert foncé', NULL, NULL, NULL),
(56, 'Vert forestier', NULL, NULL, NULL),
(57, 'Vert jaune', NULL, NULL, NULL),
(58, 'Vert jauni', NULL, NULL, NULL),
(59, 'Vert marin', NULL, NULL, NULL),
(60, 'Vert marin clair', NULL, NULL, NULL),
(61, 'Vert marin foncé', NULL, NULL, NULL),
(62, 'Vert marin moyen', NULL, NULL, NULL),
(63, 'Vert pâle', NULL, NULL, NULL),
(64, 'Vert pelouse', NULL, NULL, NULL),
(65, 'Vert printanier', NULL, NULL, NULL),
(66, 'Violet orchidée moyen', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `entretiens`
--

CREATE TABLE `entretiens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `annonce_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `revision` varchar(125) DEFAULT NULL,
  `entretien` varchar(125) DEFAULT NULL,
  `reparation` varchar(125) DEFAULT NULL,
  `carrosserie` varchar(125) DEFAULT NULL,
  `professionnels` varchar(125) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entretiens`
--

INSERT INTO `entretiens` (`id`, `annonce_id`, `date`, `revision`, `entretien`, `reparation`, `carrosserie`, `professionnels`, `created_at`, `updated_at`) VALUES
(1, 137, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 133, NULL, NULL, NULL, NULL, NULL, 'efdcf', NULL, '2025-07-30 16:04:44'),
(3, 137, '2024-10-12', 'Révision complète', 'Changement huile + filtres', 'Remplacement freins', 'Polissage capot', 'Garage AutoPro', '2025-07-04 19:01:04', '2025-07-04 19:01:04'),
(4, 137, '2025-02-20', 'Contrôle technique', 'Filtre à air', NULL, 'Réparation aile gauche', 'Centre Technique Maroc', '2025-07-04 19:01:04', '2025-07-04 19:01:04'),
(5, 142, '2024-08-05', 'Révision annuelle', 'Vidange + liquide de frein', 'Changement amortisseurs', NULL, 'Garage Expert Auto', '2025-07-04 19:01:04', '2025-07-04 19:01:04'),
(6, 130, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-30 15:52:05', '2025-07-30 15:52:05'),
(7, 60, '2025-08-29', 'oui', 'Vidange', 'Freins', 'Peinture', 'Garage Auto', '2025-09-08 17:27:29', '2025-09-08 17:27:29'),
(8, 16, '2025-08-29', 'oui', 'Vidange', 'Freins', 'Peinture', 'Garage Auto', '2025-09-08 17:28:20', '2025-09-08 17:28:20');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(125) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `annonce_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `client_id`, `annonce_id`, `created_at`, `updated_at`) VALUES
(1, 1, 142, '2025-07-12 17:13:07', '2025-07-12 17:13:07'),
(2, 1, 140, '2025-07-12 17:29:39', '2025-07-12 17:29:39'),
(12, 2, 122, '2025-08-08 16:49:32', '2025-08-08 16:49:32'),
(13, 2, 132, '2025-08-15 10:03:35', '2025-08-15 10:03:35'),
(16, 2, 16, '2025-09-08 17:34:44', '2025-09-08 17:34:44');

-- --------------------------------------------------------

--
-- Table structure for table `financements`
--

CREATE TABLE `financements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `phone` varchar(125) NOT NULL,
  `city` varchar(125) NOT NULL,
  `mark` varchar(125) NOT NULL,
  `modele` varchar(125) NOT NULL,
  `year` int(11) NOT NULL,
  `situationprof` varchar(125) NOT NULL,
  `revenusmensuels` varchar(125) NOT NULL,
  `creditsencours` varchar(125) NOT NULL,
  `duree` varchar(125) NOT NULL,
  `prixcar` varchar(125) NOT NULL,
  `montant` varchar(125) NOT NULL,
  `mensualites` varchar(125) NOT NULL,
  `creditsdh` varchar(125) NOT NULL,
  `email` varchar(125) NOT NULL,
  `rendezvous` date NOT NULL,
  `cin` varchar(125) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `financement_settings`
--

CREATE TABLE `financement_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(125) NOT NULL,
  `value` varchar(125) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `financement_settings`
--

INSERT INTO `financement_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'frais_dossier', '2000', NULL, NULL),
(2, 'assurance_annuelle', '235', NULL, NULL),
(3, 'taux_interet_default', '13', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `imgsliders`
--

CREATE TABLE `imgsliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `image` varchar(125) NOT NULL,
  `link` varchar(125) NOT NULL,
  `type` varchar(125) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `imgsliders`
--

INSERT INTO `imgsliders` (`id`, `name`, `image`, `link`, `type`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'slide nado 1', 'slide-nado-1-1731583264.png', 'https://nado.ma', 'desktop', 1, '2024-02-06 12:24:17', '2024-11-14 09:21:05', NULL),
(2, 'slide nado 2', 'slide-nado-2-1731583281.png', 'https://nado.ma/', 'desktop', 1, '2024-02-06 12:24:34', '2024-11-14 09:21:21', NULL),
(3, 'slide nado 3', 'slide-nado-3-1731583199.png', 'https://nado.ma/achat/voiture/HYUNDAI_Creta_102.html', 'desktop', 0, '2024-02-06 12:24:59', '2024-12-26 13:54:58', NULL),
(4, 'slide nado 4', 'slide-nado-4-1731582727.jpg', '#', 'desktop', 1, '2024-02-06 12:25:13', '2025-02-13 09:38:58', NULL),
(5, 'slide nado 5', 'slide-nado-5-1731582705.jpg', 'https://nado.ma/vente', 'desktop', 1, '2024-02-06 12:25:30', '2024-11-14 09:11:45', NULL),
(6, 'slide nado 6', 'slide-nado-6-1731582749.jpg', '#', 'desktop', 1, '2024-02-06 12:25:53', '2024-12-26 13:04:18', NULL),
(7, 'slide nado 7', 'slaid-11-1708607465.jpg', '#', 'desktop', 1, '2024-02-22 11:11:06', '2024-02-22 11:13:19', '2024-02-22 11:13:19'),
(8, 'slide nado 7', 'slide-nado-7-1708607616.jpg', '#', 'desktop', 1, '2024-02-22 11:13:36', '2024-02-22 12:03:24', '2024-02-22 12:03:24'),
(9, 'benta', 'benta-1710108939.jpg', '#', 'desktop', 1, '2024-03-10 22:15:40', '2024-03-10 22:16:25', '2024-03-10 22:16:25'),
(10, 'Slide nado 7', 'slide-nado-7-1735221486.png', 'https://nado.ma', 'desktop', 1, '2024-12-26 11:58:06', '2024-12-26 11:58:50', '2024-12-26 11:58:50'),
(11, 'slide nado 7', 'slide-nado-7-1735225234.jpg', 'https://nado.ma', 'desktop', 1, '2024-12-26 13:00:34', '2024-12-26 13:04:23', '2024-12-26 13:04:23'),
(12, 'slide nado 7', 'slide-nado-7-1735227988.jpg', 'https://nado.ma', 'desktop', 1, '2024-12-26 13:23:45', '2024-12-26 13:46:30', NULL),
(13, 'slide nado 8', 'slide-nado-8-1735665304.jpg', 'https://nado.ma', 'desktop', 0, '2024-12-31 15:15:04', '2025-02-13 09:38:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `annonces_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `name`, `annonces_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'range-rover-sport-se-137-000-km-diesel-automatique-voitures-doccasion-nadoma-529545.jpg', 1, '2024-03-05 13:48:45', '2024-03-05 13:48:45', NULL),
(2, 'range-rover-sport-se-137-000-km-diesel-automatique-voitures-doccasion-nadoma-555328.jpg', 1, '2024-03-05 13:48:45', '2024-03-05 13:48:45', NULL),
(3, 'range-rover-sport-se-137-000-km-diesel-automatique-voitures-doccasion-nadoma-623712.jpg', 1, '2024-03-05 13:48:45', '2024-03-05 13:48:45', NULL),
(4, 'range-rover-sport-se-137-000-km-diesel-automatique-voitures-doccasion-nadoma-254767.jpg', 1, '2024-03-05 13:48:45', '2024-03-05 13:48:45', NULL),
(5, 'range-rover-sport-se-137-000-km-diesel-automatique-voitures-doccasion-nadoma-225899.jpg', 1, '2024-03-05 13:48:45', '2024-03-05 13:48:45', NULL),
(6, 'range-rover-sport-se-137-000-km-diesel-automatique-voitures-doccasion-nadoma-725775.jpg', 1, '2024-03-05 13:48:46', '2024-03-05 13:48:46', NULL),
(7, 'range-rover-sport-se-137-000-km-diesel-automatique-voitures-doccasion-nadoma-306355.jpg', 1, '2024-03-05 13:48:46', '2024-03-05 13:48:46', NULL),
(8, 'range-rover-sport-se-137-000-km-diesel-automatique-voitures-doccasion-nadoma-164347.jpg', 1, '2024-03-05 13:48:46', '2024-03-05 13:48:46', NULL),
(17, 'hyundai-tucson-2023-diesel-automatique-voitures-doccasion-nadoma-989679.jpg', 3, '2024-03-05 14:03:00', '2024-03-05 14:03:00', NULL),
(18, 'hyundai-tucson-2023-diesel-automatique-voitures-doccasion-nadoma-715593.jpg', 3, '2024-03-05 14:03:00', '2024-03-05 14:03:00', NULL),
(19, 'hyundai-tucson-2023-diesel-automatique-voitures-doccasion-nadoma-663307.jpg', 3, '2024-03-05 14:03:00', '2024-03-05 14:03:00', NULL),
(20, 'hyundai-tucson-2023-diesel-automatique-voitures-doccasion-nadoma-543221.jpg', 3, '2024-03-05 14:03:00', '2024-03-05 14:03:00', NULL),
(21, 'hyundai-tucson-2023-diesel-automatique-voitures-doccasion-nadoma-386317.jpg', 3, '2024-03-05 14:03:00', '2024-03-05 14:03:00', NULL),
(22, 'hyundai-tucson-2023-diesel-automatique-voitures-doccasion-nadoma-825903.jpg', 3, '2024-03-05 14:03:00', '2024-03-05 14:03:00', NULL),
(23, 'hyundai-tucson-2023-diesel-automatique-voitures-doccasion-nadoma-439117.jpg', 3, '2024-03-05 14:03:00', '2024-03-05 14:03:00', NULL),
(24, 'hyundai-tucson-2023-diesel-automatique-voitures-doccasion-nadoma-936069.jpg', 3, '2024-03-05 14:03:00', '2024-03-05 14:03:00', NULL),
(25, 'renault-kadjar-2021-diesel-automatique-voitures-doccasion-nadoma-229113.jpg', 4, '2024-03-05 14:17:17', '2024-03-05 14:17:17', NULL),
(26, 'renault-kadjar-2021-diesel-automatique-voitures-doccasion-nadoma-952658.jpg', 4, '2024-03-05 14:17:17', '2024-03-05 14:17:17', NULL),
(27, 'renault-kadjar-2021-diesel-automatique-voitures-doccasion-nadoma-743940.jpg', 4, '2024-03-05 14:17:17', '2024-03-05 14:17:17', NULL),
(28, 'renault-kadjar-2021-diesel-automatique-voitures-doccasion-nadoma-113101.jpg', 4, '2024-03-05 14:17:17', '2024-03-05 14:17:17', NULL),
(29, 'renault-kadjar-2021-diesel-automatique-voitures-doccasion-nadoma-194285.jpg', 4, '2024-03-05 14:17:17', '2024-03-05 14:17:17', NULL),
(30, 'renault-kadjar-2021-diesel-automatique-voitures-doccasion-nadoma-420570.jpg', 4, '2024-03-05 14:17:17', '2024-03-05 14:17:17', NULL),
(31, 'renault-kadjar-2021-diesel-automatique-voitures-doccasion-nadoma-538946.jpg', 4, '2024-03-05 14:17:17', '2024-03-05 14:17:17', NULL),
(32, 'renault-kadjar-2021-diesel-automatique-voitures-doccasion-nadoma-997944.jpg', 4, '2024-03-05 14:17:17', '2024-03-05 14:17:17', NULL),
(33, 'peugeot-208-2022-diesel-manuelle-voitures-doccasion-nadoma-637357.jpg', 5, '2024-03-05 14:24:55', '2024-03-05 14:24:55', NULL),
(34, 'peugeot-208-2022-diesel-manuelle-voitures-doccasion-nadoma-746287.jpg', 5, '2024-03-05 14:24:55', '2024-03-05 14:24:55', NULL),
(35, 'peugeot-208-2022-diesel-manuelle-voitures-doccasion-nadoma-195756.jpg', 5, '2024-03-05 14:24:55', '2024-03-05 14:24:55', NULL),
(36, 'peugeot-208-2022-diesel-manuelle-voitures-doccasion-nadoma-136221.jpg', 5, '2024-03-05 14:24:55', '2024-03-05 14:24:55', NULL),
(37, 'peugeot-208-2022-diesel-manuelle-voitures-doccasion-nadoma-852166.jpg', 5, '2024-03-05 14:24:55', '2024-03-05 14:24:55', NULL),
(38, 'peugeot-208-2022-diesel-manuelle-voitures-doccasion-nadoma-183268.jpg', 5, '2024-03-05 14:24:55', '2024-03-05 14:24:55', NULL),
(39, 'peugeot-208-2022-diesel-manuelle-voitures-doccasion-nadoma-766747.jpg', 5, '2024-03-05 14:24:55', '2024-03-05 14:24:55', NULL),
(40, 'peugeot-208-2022-diesel-manuelle-voitures-doccasion-nadoma-904370.jpg', 5, '2024-03-05 14:24:55', '2024-03-05 14:24:55', NULL),
(41, 'bmw-2020-serie-1-sport-118d-diesel-automatique-voitures-doccasion-nadoma-541670.jpg', 6, '2024-03-05 14:34:51', '2024-03-11 11:25:54', '2024-03-11 11:25:54'),
(42, 'bmw-2020-serie-1-sport-118d-diesel-automatique-voitures-doccasion-nadoma-497942.jpg', 6, '2024-03-05 14:34:51', '2024-03-11 11:25:55', '2024-03-11 11:25:55'),
(43, 'bmw-2020-serie-1-sport-118d-diesel-automatique-voitures-doccasion-nadoma-814770.jpg', 6, '2024-03-05 14:34:51', '2024-03-11 11:25:56', '2024-03-11 11:25:56'),
(44, 'bmw-2020-serie-1-sport-118d-diesel-automatique-voitures-doccasion-nadoma-399008.jpg', 6, '2024-03-05 14:34:51', '2024-03-11 11:25:57', '2024-03-11 11:25:57'),
(45, 'bmw-2020-serie-1-sport-118d-diesel-automatique-voitures-doccasion-nadoma-744462.jpg', 6, '2024-03-05 14:34:51', '2024-03-11 11:25:58', '2024-03-11 11:25:58'),
(46, 'bmw-2020-serie-1-sport-118d-diesel-automatique-voitures-doccasion-nadoma-515221.jpg', 6, '2024-03-05 14:34:51', '2024-03-11 11:25:59', '2024-03-11 11:25:59'),
(47, 'bmw-2020-serie-1-sport-118d-diesel-automatique-voitures-doccasion-nadoma-311417.jpg', 6, '2024-03-05 14:34:51', '2024-03-11 11:26:00', '2024-03-11 11:26:00'),
(48, 'bmw-2020-serie-1-sport-118d-diesel-automatique-voitures-doccasion-nadoma-513316.jpg', 6, '2024-03-05 14:34:51', '2024-03-11 11:26:01', '2024-03-11 11:26:01'),
(49, 'hyundai-tucson-2022-diesel-automatique-voitures-doccasion-nadoma-902362.jpg', 7, '2024-03-05 14:40:55', '2024-03-05 14:40:55', NULL),
(50, 'hyundai-tucson-2022-diesel-automatique-voitures-doccasion-nadoma-903394.jpg', 7, '2024-03-05 14:40:55', '2024-03-05 14:40:55', NULL),
(51, 'hyundai-tucson-2022-diesel-automatique-voitures-doccasion-nadoma-342433.jpg', 7, '2024-03-05 14:40:55', '2024-03-05 14:40:55', NULL),
(52, 'hyundai-tucson-2022-diesel-automatique-voitures-doccasion-nadoma-895304.jpg', 7, '2024-03-05 14:40:55', '2024-03-05 14:40:55', NULL),
(53, 'hyundai-tucson-2022-diesel-automatique-voitures-doccasion-nadoma-256854.jpg', 7, '2024-03-05 14:40:55', '2024-03-05 14:40:55', NULL),
(54, 'hyundai-tucson-2022-diesel-automatique-voitures-doccasion-nadoma-718776.jpg', 7, '2024-03-05 14:40:55', '2024-03-05 14:40:55', NULL),
(55, 'hyundai-tucson-2022-diesel-automatique-voitures-doccasion-nadoma-945215.jpg', 7, '2024-03-05 14:40:56', '2024-03-05 14:40:56', NULL),
(56, 'hyundai-tucson-2022-diesel-automatique-voitures-doccasion-nadoma-330114.jpg', 7, '2024-03-05 14:40:56', '2024-03-05 14:40:56', NULL),
(58, 'audi-a4-872178.png', 8, '2024-03-10 14:06:35', '2024-03-10 14:33:56', '2024-03-10 14:33:56'),
(59, 'audi-a4-870215.jpg', 8, '2024-03-10 14:32:19', '2024-03-10 14:33:33', '2024-03-10 14:33:33'),
(60, 'audi-a4-950198.jpg', 8, '2024-03-10 14:44:18', '2024-03-10 14:47:10', '2024-03-10 14:47:10'),
(61, 'audi-a4-104261.jpg', 8, '2024-03-10 14:48:10', '2024-03-10 16:31:05', '2024-03-10 16:31:05'),
(62, 'audi-a4-806587.jpg', 8, '2024-03-10 14:51:38', '2024-03-10 22:16:48', '2024-03-10 22:16:48'),
(63, 'audi-a4-709183.jpg', 8, '2024-03-10 16:11:56', '2024-03-10 16:31:04', '2024-03-10 16:31:04'),
(64, 'audi-a4-635805.jpg', 8, '2024-03-10 17:12:24', '2024-03-10 17:36:34', '2024-03-10 17:36:34'),
(65, 'audi-a4-973811.png', 8, '2024-03-10 17:33:44', '2024-03-10 17:36:31', '2024-03-10 17:36:31'),
(66, 'audi-a4-524156.jpg', 8, '2024-03-10 17:34:58', '2024-03-10 17:36:33', '2024-03-10 17:36:33'),
(67, 'audi-a4-471594.jpg', 8, '2024-03-10 21:55:43', '2024-03-10 22:16:46', '2024-03-10 22:16:46'),
(68, 'audi-a4-393654.jpg', 8, '2024-03-11 11:02:59', '2024-03-11 11:02:59', NULL),
(69, 'audi-a4-862465.jpg', 8, '2024-03-11 11:02:59', '2024-03-11 11:02:59', NULL),
(70, 'audi-a4-509089.jpg', 8, '2024-03-11 11:02:59', '2024-03-11 11:02:59', NULL),
(71, 'audi-a4-758610.jpg', 8, '2024-03-11 11:02:59', '2024-03-11 11:02:59', NULL),
(72, 'audi-a4-557850.jpg', 8, '2024-03-11 11:02:59', '2024-03-11 11:02:59', NULL),
(73, 'audi-a4-517718.jpg', 8, '2024-03-11 11:02:59', '2024-03-11 11:02:59', NULL),
(74, 'audi-a4-989140.jpg', 8, '2024-03-11 11:02:59', '2024-03-11 11:02:59', NULL),
(75, 'audi-a4-457270.jpg', 8, '2024-03-11 11:02:59', '2024-03-11 11:02:59', NULL),
(76, 'bmw-serie-1-sport-482975.jpg', 6, '2024-03-11 11:27:27', '2024-03-11 11:36:29', '2024-03-11 11:36:29'),
(77, 'bmw-serie-1-sport-281543.jpg', 6, '2024-03-11 11:27:27', '2024-03-11 11:27:27', NULL),
(78, 'bmw-serie-1-sport-827330.jpg', 6, '2024-03-11 11:27:27', '2024-03-11 11:27:27', NULL),
(79, 'bmw-serie-1-sport-704060.jpg', 6, '2024-03-11 11:27:27', '2024-03-11 11:27:27', NULL),
(80, 'bmw-serie-1-sport-237420.jpg', 6, '2024-03-11 11:27:27', '2024-03-11 11:27:27', NULL),
(81, 'bmw-serie-1-sport-664433.jpg', 6, '2024-03-11 11:27:27', '2024-03-11 11:27:27', NULL),
(82, 'bmw-serie-1-sport-541753.jpg', 6, '2024-03-11 11:27:27', '2024-03-11 11:27:27', NULL),
(83, 'bmw-serie-1-sport-734031.jpg', 6, '2024-03-11 11:27:27', '2024-03-11 11:27:27', NULL),
(84, 'foton-forland-246709.jpg', 11, '2024-03-11 16:56:34', '2024-03-11 16:56:34', NULL),
(85, 'foton-forland-501234.jpg', 11, '2024-03-11 16:56:34', '2024-03-11 16:56:34', NULL),
(86, 'foton-forland-172408.jpg', 11, '2024-03-11 16:56:34', '2024-03-11 16:56:34', NULL),
(87, 'foton-forland-459449.jpg', 11, '2024-03-11 16:56:34', '2024-03-11 16:56:34', NULL),
(88, 'foton-forland-306132.jpg', 11, '2024-03-11 16:56:35', '2024-03-11 16:59:00', '2024-03-11 16:59:00'),
(89, 'gaz-next-495350.jpg', 12, '2024-03-11 16:58:13', '2024-03-11 16:58:13', NULL),
(90, 'gaz-next-914219.jpg', 12, '2024-03-11 16:58:13', '2024-03-11 16:58:13', NULL),
(91, 'gaz-next-924784.jpg', 12, '2024-03-11 16:58:13', '2024-03-11 16:58:13', NULL),
(92, 'gaz-next-347781.jpg', 12, '2024-03-11 16:58:13', '2024-03-11 16:58:13', NULL),
(93, 'gaz-next-444029.jpg', 12, '2024-03-11 16:58:13', '2024-03-11 16:58:13', NULL),
(94, 'gaz-next-205365.jpg', 12, '2024-03-11 16:58:13', '2024-03-11 16:58:13', NULL),
(95, 'gaz-next-620519.jpg', 12, '2024-03-11 16:58:13', '2024-03-11 16:58:13', NULL),
(96, 'gaz-next-546877.jpg', 12, '2024-03-11 16:58:13', '2024-03-11 16:58:13', NULL),
(97, 'gaz-next-234960.jpg', 13, '2024-03-11 17:07:05', '2024-03-11 17:07:05', NULL),
(98, 'gaz-next-972081.jpg', 13, '2024-03-11 17:07:05', '2024-03-11 17:07:05', NULL),
(99, 'gaz-next-734837.jpg', 13, '2024-03-11 17:07:05', '2024-03-11 17:07:05', NULL),
(100, 'gaz-next-755840.jpg', 13, '2024-03-11 17:07:05', '2024-03-11 17:07:05', NULL),
(101, 'gaz-next-205092.jpg', 13, '2024-03-11 17:07:05', '2024-03-11 17:07:05', NULL),
(102, 'gaz-next-766299.jpg', 13, '2024-03-11 17:07:05', '2024-03-11 17:07:05', NULL),
(103, 'gaz-next-201905.jpg', 13, '2024-03-11 17:07:05', '2024-03-11 17:07:05', NULL),
(104, 'gaz-next-584169.jpg', 13, '2024-03-11 17:07:05', '2024-03-11 17:07:05', NULL),
(105, 'land-rover-range-rover-sport-se-162279.jpg', 14, '2024-03-16 11:48:23', '2024-03-30 17:29:18', '2024-03-30 17:29:18'),
(106, 'land-rover-range-rover-sport-se-341368.jpg', 14, '2024-03-16 11:48:23', '2024-03-30 17:29:17', '2024-03-30 17:29:17'),
(107, 'land-rover-range-rover-sport-se-216586.jpg', 14, '2024-03-16 11:48:23', '2024-03-30 17:29:16', '2024-03-30 17:29:16'),
(108, 'land-rover-range-rover-sport-se-607650.jpg', 14, '2024-03-16 11:48:23', '2024-03-30 17:29:15', '2024-03-30 17:29:15'),
(109, 'land-rover-range-rover-sport-se-313636.jpg', 14, '2024-03-16 11:48:23', '2024-03-30 17:29:14', '2024-03-30 17:29:14'),
(110, 'land-rover-range-rover-sport-se-607322.jpg', 14, '2024-03-16 11:48:23', '2024-03-30 17:29:13', '2024-03-30 17:29:13'),
(111, 'land-rover-range-rover-sport-se-281542.jpg', 14, '2024-03-16 11:48:23', '2024-03-30 17:29:13', '2024-03-30 17:29:13'),
(112, 'land-rover-range-rover-sport-se-618709.jpg', 14, '2024-03-16 11:48:23', '2024-03-30 17:29:13', '2024-03-30 17:29:13'),
(113, 'hyundai-tucson-876784.jpg', 15, '2024-03-16 11:53:07', '2024-03-16 11:53:07', NULL),
(114, 'hyundai-tucson-378670.jpg', 15, '2024-03-16 11:53:07', '2024-03-16 11:53:07', NULL),
(115, 'hyundai-tucson-235084.jpg', 15, '2024-03-16 11:53:07', '2024-03-16 11:53:07', NULL),
(116, 'hyundai-tucson-665438.jpg', 15, '2024-03-16 11:53:07', '2024-03-16 11:53:07', NULL),
(117, 'hyundai-tucson-835615.jpg', 15, '2024-03-16 11:53:07', '2024-03-16 11:53:07', NULL),
(118, 'hyundai-tucson-715215.jpg', 15, '2024-03-16 11:53:07', '2024-03-16 11:53:07', NULL),
(119, 'hyundai-tucson-167374.jpg', 15, '2024-03-16 11:53:07', '2024-03-16 11:53:07', NULL),
(120, 'hyundai-tucson-740778.jpg', 15, '2024-03-16 11:53:07', '2024-03-16 11:53:07', NULL),
(121, 'renault-kadjar-446721.jpg', 16, '2024-03-16 11:56:13', '2024-03-16 11:56:13', NULL),
(122, 'renault-kadjar-772263.jpg', 16, '2024-03-16 11:56:13', '2024-03-16 11:56:13', NULL),
(123, 'renault-kadjar-413763.jpg', 16, '2024-03-16 11:56:13', '2024-03-16 11:56:13', NULL),
(124, 'renault-kadjar-575497.jpg', 16, '2024-03-16 11:56:13', '2024-03-16 11:56:13', NULL),
(125, 'renault-kadjar-197110.jpg', 16, '2024-03-16 11:56:13', '2024-03-16 11:56:13', NULL),
(126, 'renault-kadjar-459558.jpg', 16, '2024-03-16 11:56:13', '2024-03-16 11:56:13', NULL),
(127, 'renault-kadjar-720458.jpg', 16, '2024-03-16 11:56:13', '2024-03-16 11:56:13', NULL),
(128, 'renault-kadjar-199248.jpg', 16, '2024-03-16 11:56:13', '2024-03-16 11:56:13', NULL),
(129, 'peugeot-208-598073.jpg', 17, '2024-03-16 11:58:53', '2024-03-16 11:58:53', NULL),
(130, 'peugeot-208-760384.jpg', 17, '2024-03-16 11:58:53', '2024-03-16 11:58:53', NULL),
(131, 'peugeot-208-120608.jpg', 17, '2024-03-16 11:58:53', '2024-03-16 11:58:53', NULL),
(132, 'peugeot-208-505873.jpg', 17, '2024-03-16 11:58:53', '2024-03-16 11:58:53', NULL),
(133, 'peugeot-208-687172.jpg', 17, '2024-03-16 11:58:53', '2024-03-16 11:58:53', NULL),
(134, 'peugeot-208-444546.jpg', 17, '2024-03-16 11:58:53', '2024-03-16 11:58:53', NULL),
(135, 'peugeot-208-151297.jpg', 17, '2024-03-16 11:58:53', '2024-03-16 11:58:53', NULL),
(136, 'peugeot-208-670337.jpg', 17, '2024-03-16 11:58:53', '2024-03-16 11:58:53', NULL),
(137, 'bmw-serie-1-sport-608897.jpg', 18, '2024-03-16 12:02:40', '2024-03-16 12:02:40', NULL),
(138, 'bmw-serie-1-sport-179408.jpg', 18, '2024-03-16 12:02:40', '2024-03-16 12:02:40', NULL),
(139, 'bmw-serie-1-sport-845635.jpg', 18, '2024-03-16 12:02:40', '2024-03-16 12:02:40', NULL),
(140, 'bmw-serie-1-sport-360346.jpg', 18, '2024-03-16 12:02:40', '2024-03-16 12:02:40', NULL),
(141, 'bmw-serie-1-sport-834966.jpg', 18, '2024-03-16 12:02:40', '2024-03-16 12:02:40', NULL),
(142, 'bmw-serie-1-sport-682905.jpg', 18, '2024-03-16 12:02:40', '2024-03-16 12:02:40', NULL),
(143, 'bmw-serie-1-sport-469733.jpg', 18, '2024-03-16 12:02:40', '2024-03-16 12:02:40', NULL),
(144, 'hyundai-tucson-903104.jpg', 19, '2024-03-16 12:05:49', '2024-03-16 12:06:58', '2024-03-16 12:06:58'),
(145, 'hyundai-tucson-317730.jpg', 19, '2024-03-16 12:07:58', '2024-03-16 12:07:58', NULL),
(146, 'hyundai-tucson-416085.jpg', 19, '2024-03-16 12:07:58', '2024-03-16 12:07:58', NULL),
(147, 'hyundai-tucson-350218.jpg', 19, '2024-03-16 12:07:58', '2024-03-16 12:07:58', NULL),
(148, 'hyundai-tucson-407426.jpg', 19, '2024-03-16 12:07:58', '2024-03-16 12:07:58', NULL),
(149, 'hyundai-tucson-377135.jpg', 19, '2024-03-16 12:07:58', '2024-03-16 12:07:58', NULL),
(150, 'hyundai-tucson-912183.jpg', 19, '2024-03-16 12:07:58', '2024-03-16 12:07:58', NULL),
(151, 'hyundai-tucson-724473.jpg', 19, '2024-03-16 12:07:58', '2024-03-16 12:07:58', NULL),
(152, 'audi-a4-284957.jpg', 20, '2024-03-16 12:11:39', '2024-03-16 12:11:39', NULL),
(153, 'audi-a4-134569.jpg', 20, '2024-03-16 12:11:39', '2024-03-16 12:11:39', NULL),
(154, 'audi-a4-216418.jpg', 20, '2024-03-16 12:11:39', '2024-03-16 12:11:39', NULL),
(155, 'audi-a4-520716.jpg', 20, '2024-03-16 12:11:39', '2024-03-16 12:11:39', NULL),
(156, 'audi-a4-640214.jpg', 20, '2024-03-16 12:11:39', '2024-03-16 12:11:39', NULL),
(157, 'audi-a4-324346.jpg', 20, '2024-03-16 12:11:39', '2024-03-16 12:11:39', NULL),
(158, 'audi-a4-619483.jpg', 20, '2024-03-16 12:11:39', '2024-03-16 12:11:39', NULL),
(159, 'audi-a4-992887.jpg', 20, '2024-03-16 12:11:40', '2024-03-16 12:11:40', NULL),
(160, 'mercedes-classe-c-bluetec-365741.jpg', 21, '2024-03-16 12:20:42', '2024-03-16 12:20:42', NULL),
(161, 'mercedes-classe-c-bluetec-990001.jpg', 21, '2024-03-16 12:20:42', '2024-03-16 12:20:42', NULL),
(162, 'mercedes-classe-c-bluetec-503168.jpg', 21, '2024-03-16 12:20:42', '2024-03-16 12:20:42', NULL),
(163, 'mercedes-classe-c-bluetec-413286.jpg', 21, '2024-03-16 12:20:42', '2024-03-16 12:20:42', NULL),
(164, 'mercedes-classe-c-bluetec-110315.jpg', 21, '2024-03-16 12:20:42', '2024-03-16 12:20:42', NULL),
(165, 'mercedes-classe-c-bluetec-683757.jpg', 21, '2024-03-16 12:20:42', '2024-03-16 12:20:42', NULL),
(166, 'mercedes-classe-c-bluetec-152536.jpg', 21, '2024-03-16 12:20:42', '2024-03-16 12:20:42', NULL),
(167, 'mercedes-classe-c-bluetec-950966.jpg', 21, '2024-03-16 12:20:42', '2024-03-16 12:20:42', NULL),
(168, 'hyundai-i-30-923469.jpg', 22, '2024-03-16 17:34:19', '2024-03-16 17:34:19', NULL),
(169, 'hyundai-i-30-967193.jpg', 22, '2024-03-16 17:34:19', '2024-03-16 17:34:19', NULL),
(170, 'hyundai-i-30-968729.jpg', 22, '2024-03-16 17:34:19', '2024-03-16 17:34:19', NULL),
(171, 'hyundai-i-30-836471.jpg', 22, '2024-03-16 17:34:19', '2024-03-16 17:34:19', NULL),
(172, 'hyundai-i-30-130109.jpg', 22, '2024-03-16 17:34:19', '2024-03-16 17:34:19', NULL),
(173, 'hyundai-i-30-911220.jpg', 22, '2024-03-16 17:34:19', '2024-03-16 17:34:19', NULL),
(174, 'hyundai-i-30-606362.jpg', 22, '2024-03-16 17:34:19', '2024-03-16 17:34:19', NULL),
(175, 'hyundai-i-30-620209.jpg', 22, '2024-03-16 17:34:19', '2024-03-16 17:34:19', NULL),
(176, 'volkswagen-tiguan-457837.png', 14, '2024-03-30 17:29:37', '2024-04-01 12:45:03', '2024-04-01 12:45:03'),
(177, 'volkswagen-tiguan-156215.png', 14, '2024-03-30 17:29:37', '2024-04-01 12:45:03', '2024-04-01 12:45:03'),
(178, 'volkswagen-tiguan-167318.png', 14, '2024-03-30 17:29:38', '2024-04-01 12:45:02', '2024-04-01 12:45:02'),
(179, 'volkswagen-tiguan-806964.png', 14, '2024-03-30 17:29:38', '2024-04-01 12:45:00', '2024-04-01 12:45:00'),
(180, 'volkswagen-tiguan-221787.png', 14, '2024-03-30 17:29:38', '2024-04-01 12:45:00', '2024-04-01 12:45:00'),
(181, 'volkswagen-tiguan-286226.png', 14, '2024-03-30 17:29:38', '2024-04-01 12:45:00', '2024-04-01 12:45:00'),
(182, 'volkswagen-tiguan-892543.png', 14, '2024-03-30 17:29:38', '2024-04-01 12:45:00', '2024-04-01 12:45:00'),
(183, 'volkswagen-tiguan-963548.png', 14, '2024-03-30 17:29:39', '2024-04-01 12:44:59', '2024-04-01 12:44:59'),
(188, 'volkswagen-tiguan-920382.jpg', 14, '2024-04-01 12:46:44', '2024-04-01 12:46:44', NULL),
(189, 'volkswagen-tiguan-936739.jpg', 14, '2024-04-01 12:46:44', '2024-04-01 12:46:44', NULL),
(190, 'volkswagen-tiguan-596376.jpg', 14, '2024-04-01 12:46:44', '2024-04-01 12:46:44', NULL),
(191, 'volkswagen-tiguan-181458.jpg', 14, '2024-04-01 12:46:44', '2024-04-01 12:46:44', NULL),
(192, 'volkswagen-tiguan-756685.jpg', 14, '2024-04-01 12:46:44', '2024-04-01 12:46:44', NULL),
(193, 'volkswagen-tiguan-775233.jpg', 14, '2024-04-01 12:46:44', '2024-04-01 12:46:44', NULL),
(194, 'volkswagen-tiguan-649609.jpg', 14, '2024-04-01 12:46:44', '2024-04-01 12:46:44', NULL),
(195, 'volkswagen-tiguan-728144.jpg', 14, '2024-04-01 12:46:44', '2024-04-01 12:46:44', NULL),
(196, 'volkswagen-tiguan-625047.png', 28, '2024-04-01 13:46:14', '2024-04-01 14:01:06', '2024-04-01 14:01:06'),
(197, 'volkswagen-tiguan-766917.png', 28, '2024-04-01 13:46:14', '2024-04-01 14:01:05', '2024-04-01 14:01:05'),
(198, 'volkswagen-tiguan-912407.png', 28, '2024-04-01 13:46:15', '2024-04-01 14:01:04', '2024-04-01 14:01:04'),
(199, 'volkswagen-tiguan-790520.png', 28, '2024-04-01 13:46:15', '2024-04-01 14:01:03', '2024-04-01 14:01:03'),
(200, 'volkswagen-tiguan-397626.png', 28, '2024-04-01 13:46:15', '2024-04-01 14:01:02', '2024-04-01 14:01:02'),
(201, 'volkswagen-tiguan-959699.png', 28, '2024-04-01 13:46:15', '2024-04-01 14:01:02', '2024-04-01 14:01:02'),
(202, 'volkswagen-tiguan-694239.png', 28, '2024-04-01 13:46:16', '2024-04-01 14:01:02', '2024-04-01 14:01:02'),
(203, 'volkswagen-tiguan-609074.png', 28, '2024-04-01 13:46:16', '2024-04-01 14:01:02', '2024-04-01 14:01:02'),
(204, 'volkswagen-tiguan-338149.png', 28, '2024-04-01 13:46:16', '2024-04-01 14:01:01', '2024-04-01 14:01:01'),
(205, 'volkswagen-tiguan-876397.png', 28, '2024-04-01 14:01:32', '2024-04-01 14:01:32', NULL),
(206, 'volkswagen-tiguan-635274.png', 28, '2024-04-01 14:01:32', '2024-04-01 14:01:32', NULL),
(207, 'volkswagen-tiguan-585389.png', 28, '2024-04-01 14:01:33', '2024-04-01 14:01:33', NULL),
(208, 'volkswagen-tiguan-930498.png', 28, '2024-04-01 14:01:33', '2024-04-01 14:01:33', NULL),
(209, 'volkswagen-tiguan-713419.png', 28, '2024-04-01 14:01:35', '2024-04-01 14:01:35', NULL),
(210, 'volkswagen-tiguan-884281.png', 28, '2024-04-01 14:01:35', '2024-04-01 14:01:35', NULL),
(211, 'volkswagen-tiguan-524989.png', 28, '2024-04-01 14:01:35', '2024-04-01 14:01:35', NULL),
(212, 'volkswagen-tiguan-689317.png', 28, '2024-04-01 14:01:35', '2024-04-01 14:01:35', NULL),
(213, 'volkswagen-tiguan-925186.png', 28, '2024-04-01 14:01:36', '2024-04-01 14:01:36', NULL),
(214, 'volkswagen-tiguan-182427.png', 28, '2024-04-01 14:01:36', '2024-04-01 14:01:36', NULL),
(215, 'volkswagen-tiguan-233293.png', 28, '2024-04-01 14:01:36', '2024-04-01 14:01:36', NULL),
(216, 'volkswagen-tiguan-170433.png', 28, '2024-04-01 14:01:36', '2024-04-01 14:01:36', NULL),
(217, 'mercedes-classe-c-bluetec-564690.png', 29, '2024-04-04 13:59:39', '2024-04-06 14:10:34', '2024-04-06 14:10:34'),
(218, 'mercedes-classe-c-bluetec-647828.png', 29, '2024-04-04 13:59:39', '2024-04-06 14:10:35', '2024-04-06 14:10:35'),
(219, 'mercedes-classe-c-bluetec-195265.png', 29, '2024-04-04 13:59:39', '2024-04-04 13:59:39', NULL),
(220, 'mercedes-classe-c-bluetec-878728.png', 29, '2024-04-04 13:59:40', '2024-04-04 13:59:40', NULL),
(221, 'mercedes-classe-c-bluetec-906980.png', 29, '2024-04-04 13:59:40', '2024-04-04 13:59:40', NULL),
(222, 'mercedes-classe-c-bluetec-222449.png', 29, '2024-04-04 13:59:40', '2024-04-04 13:59:40', NULL),
(223, 'mercedes-classe-c-bluetec-706582.png', 29, '2024-04-04 13:59:40', '2024-04-04 13:59:40', NULL),
(224, 'mercedes-classe-c-bluetec-428338.png', 29, '2024-04-04 13:59:41', '2024-04-04 13:59:41', NULL),
(225, 'mercedes-classe-c-bluetec-901561.png', 29, '2024-04-06 14:11:01', '2024-04-06 14:11:01', NULL),
(226, 'mercedes-classe-c-bluetec-295618.png', 29, '2024-04-06 14:11:01', '2024-04-06 14:11:01', NULL),
(227, 'nissan-juke-697256.png', 30, '2024-04-06 17:38:36', '2024-04-06 17:38:36', NULL),
(228, 'nissan-juke-906793.png', 30, '2024-04-06 17:38:36', '2024-04-06 17:38:36', NULL),
(229, 'nissan-juke-835177.png', 30, '2024-04-06 17:38:36', '2024-04-06 17:38:36', NULL),
(230, 'nissan-juke-926260.png', 30, '2024-04-06 17:38:36', '2024-04-06 17:38:36', NULL),
(231, 'nissan-juke-677910.png', 30, '2024-04-06 17:38:37', '2024-04-06 17:38:37', NULL),
(232, 'nissan-juke-369814.png', 30, '2024-04-06 17:38:37', '2024-04-06 17:38:37', NULL),
(233, 'nissan-juke-557695.png', 30, '2024-04-06 17:38:37', '2024-04-06 17:38:37', NULL),
(234, 'nissan-juke-590796.png', 30, '2024-04-06 17:38:37', '2024-04-06 17:38:37', NULL),
(235, 'volkswagen-tiguan-578097.png', 31, '2024-04-21 09:07:51', '2024-04-21 09:07:51', NULL),
(236, 'volkswagen-tiguan-704930.png', 31, '2024-04-21 09:07:54', '2024-04-21 09:07:54', NULL),
(237, 'volkswagen-tiguan-589830.png', 31, '2024-04-21 09:07:57', '2024-04-21 09:07:57', NULL),
(238, 'volkswagen-tiguan-826142.png', 31, '2024-04-21 09:07:59', '2024-04-21 09:07:59', NULL),
(239, 'volkswagen-tiguan-640354.png', 31, '2024-04-21 09:08:02', '2024-04-21 09:08:02', NULL),
(240, 'volkswagen-tiguan-922538.png', 31, '2024-04-21 09:08:04', '2024-04-21 09:08:04', NULL),
(241, 'volkswagen-tiguan-586413.png', 31, '2024-04-21 09:08:05', '2024-04-21 09:08:05', NULL),
(242, 'volkswagen-tiguan-838660.png', 31, '2024-04-21 09:08:08', '2024-04-21 09:08:08', NULL),
(243, 'toyota-c-hr-830419.png', 32, '2024-04-26 12:05:29', '2024-04-26 12:05:29', NULL),
(244, 'toyota-c-hr-410360.png', 32, '2024-04-26 12:05:31', '2024-04-26 12:05:31', NULL),
(245, 'toyota-c-hr-626268.png', 32, '2024-04-26 12:05:33', '2024-04-26 12:05:33', NULL),
(246, 'toyota-c-hr-271075.png', 32, '2024-04-26 12:05:36', '2024-04-26 12:05:36', NULL),
(247, 'toyota-c-hr-508387.png', 32, '2024-04-26 12:05:39', '2024-04-26 12:05:39', NULL),
(248, 'toyota-c-hr-593258.png', 32, '2024-04-26 12:05:42', '2024-04-26 12:05:42', NULL),
(249, 'toyota-c-hr-609124.png', 32, '2024-04-26 12:05:45', '2024-04-26 12:05:45', NULL),
(250, 'toyota-c-hr-112300.png', 32, '2024-04-26 12:05:47', '2024-04-26 12:05:47', NULL),
(251, 'toyota-corolla-867669.png', 33, '2024-04-26 12:17:24', '2024-04-26 12:17:24', NULL),
(252, 'toyota-corolla-910744.png', 33, '2024-04-26 12:17:25', '2024-04-26 12:17:25', NULL),
(253, 'toyota-corolla-672842.png', 33, '2024-04-26 12:17:26', '2024-04-26 12:17:26', NULL),
(254, 'toyota-corolla-889561.png', 33, '2024-04-26 12:17:27', '2024-04-26 12:17:27', NULL),
(255, 'toyota-corolla-576938.png', 33, '2024-04-26 12:17:28', '2024-04-26 12:17:28', NULL),
(256, 'toyota-corolla-146728.png', 33, '2024-04-26 12:17:31', '2024-04-26 12:17:31', NULL),
(257, 'toyota-corolla-517512.png', 33, '2024-04-26 12:17:33', '2024-04-26 12:17:33', NULL),
(258, 'toyota-corolla-921586.png', 33, '2024-04-26 12:17:35', '2024-04-26 12:17:35', NULL),
(259, 'hyundai-creta-503155.png', 34, '2024-05-04 09:42:55', '2024-05-04 09:42:55', NULL),
(260, 'hyundai-creta-375983.png', 34, '2024-05-04 09:42:55', '2024-05-04 09:42:55', NULL),
(261, 'hyundai-creta-913432.png', 34, '2024-05-04 09:42:55', '2024-05-04 09:42:55', NULL),
(262, 'hyundai-creta-180556.png', 34, '2024-05-04 09:42:55', '2024-05-04 09:42:55', NULL),
(263, 'hyundai-creta-440317.png', 34, '2024-05-04 09:42:56', '2024-05-04 09:42:56', NULL),
(264, 'hyundai-creta-262487.png', 34, '2024-05-04 09:42:56', '2024-05-04 09:42:56', NULL),
(265, 'hyundai-creta-349411.png', 34, '2024-05-04 09:42:56', '2024-05-04 09:42:56', NULL),
(266, 'hyundai-creta-337339.png', 34, '2024-05-04 09:42:56', '2024-05-04 09:42:56', NULL),
(267, 'volkswagen-touareg-766046.png', 35, '2024-05-07 10:50:13', '2024-05-07 10:50:13', NULL),
(268, 'volkswagen-touareg-173495.png', 35, '2024-05-07 10:50:13', '2024-05-07 10:50:13', NULL),
(269, 'volkswagen-touareg-300006.png', 35, '2024-05-07 10:50:13', '2024-05-07 10:50:13', NULL),
(270, 'volkswagen-touareg-386485.png', 35, '2024-05-07 10:50:13', '2024-05-07 10:50:13', NULL),
(271, 'volkswagen-touareg-685691.png', 35, '2024-05-07 10:50:13', '2024-05-07 10:50:13', NULL),
(272, 'volkswagen-touareg-117300.png', 35, '2024-05-07 10:50:14', '2024-05-07 10:50:14', NULL),
(273, 'volkswagen-touareg-207367.png', 35, '2024-05-07 10:50:14', '2024-05-07 10:50:14', NULL),
(274, 'volkswagen-touareg-195141.png', 35, '2024-05-07 10:50:14', '2024-05-07 10:50:14', NULL),
(275, 'volkswagen-tiguan-865725.png', 36, '2024-05-08 11:29:16', '2024-05-08 11:29:16', NULL),
(276, 'volkswagen-tiguan-187997.png', 36, '2024-05-08 11:29:16', '2024-05-08 11:29:16', NULL),
(277, 'volkswagen-tiguan-904290.png', 36, '2024-05-08 11:29:17', '2024-05-08 11:29:17', NULL),
(278, 'volkswagen-tiguan-199582.png', 36, '2024-05-08 11:29:17', '2024-05-08 11:29:17', NULL),
(279, 'volkswagen-tiguan-931702.png', 36, '2024-05-08 11:29:17', '2024-05-08 11:29:17', NULL),
(280, 'volkswagen-tiguan-833689.png', 36, '2024-05-08 11:29:17', '2024-05-08 11:29:17', NULL),
(281, 'volkswagen-tiguan-263951.png', 36, '2024-05-08 11:29:18', '2024-05-08 11:29:18', NULL),
(282, 'audi-q5-256463.png', 37, '2024-05-08 12:38:37', '2024-05-08 12:38:37', NULL),
(283, 'audi-q5-679452.png', 37, '2024-05-08 12:38:37', '2024-05-08 12:38:37', NULL),
(284, 'audi-q5-227841.png', 37, '2024-05-08 12:38:37', '2024-05-08 12:38:37', NULL),
(285, 'audi-q5-657748.png', 37, '2024-05-08 12:38:37', '2024-05-08 12:38:37', NULL),
(286, 'audi-q5-172582.png', 37, '2024-05-08 12:38:38', '2024-05-08 12:38:38', NULL),
(287, 'audi-q5-172082.png', 37, '2024-05-08 12:38:38', '2024-05-08 12:38:38', NULL),
(288, 'audi-q5-747870.png', 37, '2024-05-08 12:38:38', '2024-05-08 12:38:38', NULL),
(289, 'audi-q5-502794.png', 37, '2024-05-08 12:38:38', '2024-05-08 12:38:38', NULL),
(290, 'dacia-duster-474290.png', 38, '2024-05-08 13:16:02', '2024-05-08 13:16:02', NULL),
(291, 'dacia-duster-776982.png', 38, '2024-05-08 13:16:02', '2024-05-08 13:16:02', NULL),
(292, 'dacia-duster-396115.png', 38, '2024-05-08 13:16:03', '2024-05-08 13:16:03', NULL),
(293, 'dacia-duster-143301.png', 38, '2024-05-08 13:16:03', '2024-05-08 13:16:03', NULL),
(294, 'dacia-duster-393394.png', 38, '2024-05-08 13:16:03', '2024-05-08 13:16:03', NULL),
(295, 'dacia-duster-926921.png', 38, '2024-05-08 13:16:03', '2024-05-08 13:16:03', NULL),
(296, 'renault-kadjar-361840.png', 39, '2024-05-08 13:52:44', '2024-05-08 13:52:44', NULL),
(297, 'renault-kadjar-567655.png', 39, '2024-05-08 13:52:44', '2024-05-08 13:52:44', NULL),
(298, 'renault-kadjar-824598.png', 39, '2024-05-08 13:52:44', '2024-05-08 13:52:44', NULL),
(299, 'renault-kadjar-338806.png', 39, '2024-05-08 13:52:45', '2024-05-08 13:52:45', NULL),
(300, 'renault-kadjar-560088.png', 39, '2024-05-08 13:52:45', '2024-05-08 13:52:45', NULL),
(301, 'renault-kadjar-865364.png', 39, '2024-05-08 13:52:45', '2024-05-08 13:52:45', NULL),
(302, 'renault-kadjar-473559.png', 39, '2024-05-08 13:52:45', '2024-05-08 13:52:45', NULL),
(303, 'renault-kadjar-178543.png', 39, '2024-05-08 13:52:46', '2024-05-08 13:52:46', NULL),
(304, 'hyundai-tucson-148131.png', 40, '2024-05-09 08:56:07', '2024-05-09 08:56:07', NULL),
(305, 'hyundai-tucson-167337.png', 40, '2024-05-09 08:56:07', '2024-05-09 08:56:07', NULL),
(306, 'hyundai-tucson-545894.png', 40, '2024-05-09 08:56:08', '2024-05-09 08:56:08', NULL),
(307, 'hyundai-tucson-111241.png', 40, '2024-05-09 08:56:08', '2024-05-09 08:56:08', NULL),
(308, 'hyundai-tucson-862444.png', 40, '2024-05-09 08:56:08', '2024-05-09 08:56:08', NULL),
(309, 'hyundai-tucson-975568.png', 40, '2024-05-09 08:56:08', '2024-05-09 08:56:08', NULL),
(310, 'hyundai-tucson-100459.png', 40, '2024-05-09 08:56:09', '2024-05-09 08:56:09', NULL),
(311, 'hyundai-tucson-198890.png', 40, '2024-05-09 08:56:09', '2024-05-09 08:56:09', NULL),
(312, 'opel-astra-969188.png', 41, '2024-05-11 09:00:36', '2024-05-11 09:00:36', NULL),
(313, 'opel-astra-471725.png', 41, '2024-05-11 09:00:36', '2024-05-11 09:00:36', NULL),
(314, 'opel-astra-979159.png', 41, '2024-05-11 09:00:37', '2024-05-11 09:00:37', NULL),
(315, 'opel-astra-219797.png', 41, '2024-05-11 09:00:37', '2024-05-11 09:00:37', NULL),
(316, 'opel-astra-489369.png', 41, '2024-05-11 09:00:37', '2024-05-11 09:00:37', NULL),
(317, 'seat-arona-146770.png', 42, '2024-05-11 10:20:45', '2024-05-11 10:20:45', NULL),
(318, 'seat-arona-373962.png', 42, '2024-05-11 10:20:45', '2024-05-11 10:20:45', NULL),
(319, 'seat-arona-974966.png', 42, '2024-05-11 10:20:45', '2024-05-11 10:20:45', NULL),
(320, 'seat-arona-498421.png', 42, '2024-05-11 10:20:45', '2024-05-11 10:20:45', NULL),
(321, 'seat-arona-336133.png', 42, '2024-05-11 10:20:45', '2024-05-11 10:20:45', NULL),
(322, 'seat-arona-693639.png', 42, '2024-05-11 10:20:46', '2024-05-11 10:20:46', NULL),
(323, 'seat-arona-976905.png', 42, '2024-05-11 10:20:46', '2024-05-11 10:20:46', NULL),
(324, 'seat-arona-719056.png', 42, '2024-05-11 10:20:46', '2024-05-11 10:20:46', NULL),
(325, 'mercedes-classe-c-758700.png', 43, '2024-05-11 13:17:28', '2024-05-11 13:17:28', NULL),
(326, 'mercedes-classe-c-305823.png', 43, '2024-05-11 13:17:28', '2024-05-11 13:17:28', NULL),
(327, 'mercedes-classe-c-249194.png', 43, '2024-05-11 13:17:29', '2024-05-11 13:17:29', NULL),
(328, 'mercedes-classe-c-194950.png', 43, '2024-05-11 13:17:29', '2024-05-11 13:17:29', NULL),
(329, 'mercedes-classe-c-547131.png', 43, '2024-05-11 13:17:29', '2024-05-11 13:17:29', NULL),
(330, 'mercedes-classe-c-475605.png', 43, '2024-05-11 13:17:29', '2024-05-11 13:17:29', NULL),
(331, 'mercedes-classe-c-867184.png', 43, '2024-05-11 13:17:30', '2024-05-11 13:17:30', NULL),
(332, 'mercedes-classe-c-666454.png', 43, '2024-05-11 13:17:30', '2024-05-11 13:17:30', NULL),
(333, 'hyundai-tucson-219239.png', 44, '2024-05-13 13:15:07', '2024-05-13 13:15:07', NULL),
(334, 'hyundai-tucson-934191.png', 44, '2024-05-13 13:15:08', '2024-05-13 13:15:08', NULL),
(335, 'hyundai-tucson-695753.png', 44, '2024-05-13 13:15:08', '2024-05-13 13:15:08', NULL),
(336, 'hyundai-tucson-782115.png', 44, '2024-05-13 13:15:08', '2024-05-13 13:15:08', NULL),
(337, 'hyundai-tucson-178507.png', 44, '2024-05-13 13:15:08', '2024-05-13 13:15:08', NULL),
(338, 'hyundai-tucson-296822.png', 44, '2024-05-13 13:15:09', '2024-05-13 13:15:09', NULL),
(339, 'hyundai-tucson-489742.png', 44, '2024-05-13 13:15:09', '2024-05-13 13:15:09', NULL),
(340, 'hyundai-tucson-508380.png', 44, '2024-05-13 13:15:09', '2024-05-13 13:15:09', NULL),
(341, 'nissan-micra-173996.png', 45, '2024-05-16 08:48:24', '2024-05-16 08:48:24', NULL),
(342, 'nissan-micra-745234.png', 45, '2024-05-16 08:48:24', '2024-05-16 08:48:24', NULL),
(343, 'nissan-micra-829407.png', 45, '2024-05-16 08:48:25', '2024-05-16 08:48:25', NULL),
(344, 'dacia-duster-303015.png', 46, '2024-05-17 14:55:00', '2024-05-17 14:55:00', NULL),
(345, 'dacia-duster-768852.png', 46, '2024-05-17 14:55:00', '2024-05-17 14:55:00', NULL),
(346, 'dacia-duster-444822.png', 46, '2024-05-17 14:55:00', '2024-05-17 14:55:00', NULL),
(347, 'dacia-duster-850823.png', 46, '2024-05-17 14:55:00', '2024-05-17 14:55:00', NULL),
(348, 'dacia-duster-917448.png', 46, '2024-05-17 14:55:00', '2024-05-17 14:55:00', NULL),
(349, 'dacia-duster-866785.png', 46, '2024-05-17 14:55:01', '2024-05-17 14:55:01', NULL),
(350, 'dacia-duster-212736.png', 46, '2024-05-17 14:55:01', '2024-05-17 14:55:01', NULL),
(351, 'dacia-duster-927348.png', 46, '2024-05-17 14:55:01', '2024-05-17 14:55:01', NULL),
(352, 'peugeot-3008-762151.png', 47, '2024-05-20 12:42:23', '2024-05-20 12:42:23', NULL),
(353, 'peugeot-3008-349732.png', 47, '2024-05-20 12:42:23', '2024-05-20 12:42:23', NULL),
(354, 'peugeot-3008-152748.png', 47, '2024-05-20 12:42:23', '2024-05-20 12:42:23', NULL),
(355, 'peugeot-3008-260167.png', 47, '2024-05-20 12:42:23', '2024-05-20 12:42:23', NULL),
(356, 'peugeot-3008-540112.png', 47, '2024-05-20 12:42:23', '2024-05-20 12:42:23', NULL),
(357, 'peugeot-3008-304270.png', 47, '2024-05-20 12:42:24', '2024-05-20 12:42:24', NULL),
(358, 'peugeot-3008-459370.png', 47, '2024-05-20 12:42:24', '2024-05-20 12:42:24', NULL),
(359, 'peugeot-3008-300451.png', 47, '2024-05-20 12:42:24', '2024-05-20 12:42:24', NULL),
(360, 'mercedes-classe-a-966089.png', 48, '2024-05-20 15:02:33', '2024-05-25 12:58:32', '2024-05-25 12:58:32'),
(361, 'mercedes-classe-a-491348.png', 48, '2024-05-20 15:02:33', '2024-05-25 12:58:31', '2024-05-25 12:58:31'),
(362, 'mercedes-classe-a-224043.png', 48, '2024-05-20 15:02:33', '2024-05-25 12:58:31', '2024-05-25 12:58:31'),
(363, 'mercedes-classe-a-894315.png', 48, '2024-05-20 15:02:33', '2024-05-25 12:58:30', '2024-05-25 12:58:30'),
(364, 'mercedes-classe-a-555109.png', 48, '2024-05-20 15:02:34', '2024-05-25 12:58:28', '2024-05-25 12:58:28'),
(365, 'mercedes-classe-a-989833.png', 48, '2024-05-20 15:02:34', '2024-05-25 12:58:28', '2024-05-25 12:58:28'),
(366, 'mercedes-classe-a-621640.png', 48, '2024-05-20 15:02:34', '2024-05-25 12:58:28', '2024-05-25 12:58:28'),
(367, 'mercedes-classe-a-895683.png', 48, '2024-05-20 15:02:34', '2024-05-25 12:58:27', '2024-05-25 12:58:27'),
(368, 'volkswagen-tiguan-683606.png', 49, '2024-05-22 10:23:56', '2024-07-22 15:10:35', '2024-07-22 15:10:35'),
(369, 'volkswagen-tiguan-944281.png', 49, '2024-05-22 10:23:57', '2024-05-22 10:23:57', NULL),
(370, 'volkswagen-tiguan-847686.png', 49, '2024-05-22 10:23:57', '2024-05-22 10:23:57', NULL),
(371, 'volkswagen-tiguan-909023.png', 49, '2024-05-22 10:23:57', '2024-05-22 10:23:57', NULL),
(372, 'volkswagen-tiguan-537328.png', 49, '2024-05-22 10:23:57', '2024-05-22 10:23:57', NULL),
(373, 'volkswagen-tiguan-620957.png', 49, '2024-05-22 10:23:57', '2024-05-22 10:23:57', NULL),
(374, 'volkswagen-tiguan-523201.png', 49, '2024-05-22 10:23:58', '2024-05-22 10:23:58', NULL),
(375, 'volkswagen-tiguan-436490.png', 49, '2024-05-22 10:23:58', '2024-05-22 10:23:58', NULL),
(376, 'dacia-sandero-stepway-318362.png', 50, '2024-05-24 16:30:59', '2024-05-24 16:30:59', NULL),
(377, 'dacia-sandero-stepway-511429.png', 50, '2024-05-24 16:30:59', '2024-05-24 16:30:59', NULL),
(378, 'dacia-sandero-stepway-491215.png', 50, '2024-05-24 16:30:59', '2024-05-24 16:30:59', NULL),
(379, 'dacia-sandero-stepway-551174.png', 50, '2024-05-24 16:31:00', '2024-05-24 16:31:00', NULL),
(380, 'dacia-sandero-stepway-182412.png', 50, '2024-05-24 16:31:00', '2024-05-24 16:31:00', NULL),
(381, 'dacia-sandero-stepway-839234.png', 50, '2024-05-24 16:31:00', '2024-05-24 16:31:00', NULL),
(382, 'dacia-sandero-stepway-402309.png', 50, '2024-05-24 16:31:00', '2024-05-24 16:31:00', NULL),
(383, 'dacia-sandero-stepway-172100.png', 50, '2024-05-24 16:31:00', '2024-05-24 16:31:00', NULL),
(384, 'bmw-x1-195090.png', 51, '2024-05-25 10:17:38', '2024-05-25 10:17:38', NULL),
(385, 'bmw-x1-542429.png', 51, '2024-05-25 10:17:38', '2024-05-25 10:17:38', NULL),
(386, 'bmw-x1-618097.png', 51, '2024-05-25 10:17:38', '2024-05-25 10:17:38', NULL),
(387, 'bmw-x1-200936.png', 51, '2024-05-25 10:17:39', '2024-05-25 10:17:39', NULL),
(388, 'bmw-x1-288537.png', 51, '2024-05-25 10:17:39', '2024-05-25 10:17:39', NULL),
(389, 'bmw-x1-262040.png', 51, '2024-05-25 10:17:39', '2024-05-25 10:17:39', NULL),
(390, 'bmw-x1-480168.png', 51, '2024-05-25 10:17:39', '2024-05-25 10:17:39', NULL),
(391, 'bmw-x1-840899.png', 51, '2024-05-25 10:17:39', '2024-05-25 10:17:39', NULL),
(392, 'hyundai-i-30-469422.png', 52, '2024-05-25 11:56:06', '2024-05-25 11:56:06', NULL),
(393, 'hyundai-i-30-344516.png', 52, '2024-05-25 11:56:06', '2024-05-25 11:56:06', NULL),
(394, 'hyundai-i-30-844237.png', 52, '2024-05-25 11:56:06', '2024-05-25 11:56:06', NULL),
(395, 'hyundai-i-30-211209.png', 52, '2024-05-25 11:56:07', '2024-05-25 11:56:07', NULL),
(396, 'hyundai-i-30-807961.png', 52, '2024-05-25 11:56:07', '2024-05-25 11:56:07', NULL),
(397, 'hyundai-i-30-907600.png', 52, '2024-05-25 11:56:07', '2024-05-25 11:56:07', NULL),
(398, 'hyundai-i-30-130897.png', 52, '2024-05-25 11:56:07', '2024-05-25 11:56:07', NULL),
(399, 'hyundai-i-30-113274.png', 52, '2024-05-25 11:56:08', '2024-05-25 11:56:34', '2024-05-25 11:56:34'),
(400, 'mercedes-classe-a-682720.png', 48, '2024-05-25 12:58:49', '2024-05-25 12:58:49', NULL),
(401, 'mercedes-classe-a-934717.png', 48, '2024-05-25 12:58:49', '2024-05-25 12:58:49', NULL),
(402, 'mercedes-classe-a-355865.png', 48, '2024-05-25 12:58:49', '2024-05-25 12:58:49', NULL),
(403, 'mercedes-classe-a-864722.png', 48, '2024-05-25 12:58:49', '2024-05-25 12:58:49', NULL),
(404, 'mercedes-classe-a-758642.png', 48, '2024-05-25 12:58:49', '2024-05-25 12:58:49', NULL),
(405, 'mercedes-classe-a-894537.png', 48, '2024-05-25 12:58:50', '2024-05-25 12:58:50', NULL),
(406, 'mercedes-classe-a-653571.png', 48, '2024-05-25 12:58:50', '2024-05-25 12:58:50', NULL),
(407, 'mercedes-classe-a-562355.png', 48, '2024-05-25 12:58:50', '2024-05-25 12:58:50', NULL),
(408, 'hyundai-tucson-895320.png', 53, '2024-05-29 16:17:00', '2024-05-29 16:17:00', NULL),
(409, 'hyundai-tucson-766072.png', 53, '2024-05-29 16:17:00', '2024-05-29 16:17:00', NULL),
(410, 'hyundai-tucson-673086.png', 53, '2024-05-29 16:17:01', '2024-05-29 16:17:01', NULL),
(411, 'hyundai-tucson-770640.png', 53, '2024-05-29 16:17:01', '2024-05-29 16:17:01', NULL),
(412, 'hyundai-tucson-909426.png', 53, '2024-05-29 16:17:01', '2024-05-29 16:17:01', NULL),
(413, 'hyundai-tucson-912241.png', 53, '2024-05-29 16:17:01', '2024-05-29 16:17:01', NULL),
(414, 'hyundai-tucson-812310.png', 53, '2024-05-29 16:17:01', '2024-05-29 16:17:01', NULL),
(415, 'hyundai-tucson-993353.png', 53, '2024-05-29 16:17:02', '2024-05-29 16:17:02', NULL),
(416, 'honda-cr-v-815654.png', 55, '2024-07-02 15:21:00', '2024-07-02 15:21:00', NULL),
(417, 'honda-cr-v-759760.png', 55, '2024-07-02 15:21:00', '2024-07-02 15:21:00', NULL),
(418, 'honda-cr-v-324545.png', 55, '2024-07-02 15:21:00', '2024-07-02 15:21:00', NULL),
(419, 'honda-cr-v-101926.png', 55, '2024-07-02 15:21:01', '2024-07-02 15:21:01', NULL),
(420, 'honda-cr-v-419950.png', 55, '2024-07-02 15:21:01', '2024-07-02 15:21:01', NULL),
(421, 'honda-cr-v-302241.png', 55, '2024-07-02 15:21:01', '2024-07-02 15:21:01', NULL),
(422, 'honda-cr-v-666385.png', 55, '2024-07-02 15:21:01', '2024-07-02 15:21:01', NULL),
(423, 'honda-cr-v-802506.png', 55, '2024-07-02 15:21:01', '2024-07-02 15:21:01', NULL),
(424, 'hyundai-tucson-263768.png', 56, '2024-07-02 15:53:18', '2024-07-02 15:53:18', NULL),
(425, 'hyundai-tucson-623596.png', 56, '2024-07-02 15:53:19', '2024-07-02 15:53:19', NULL),
(426, 'hyundai-tucson-229486.png', 56, '2024-07-02 15:53:19', '2024-07-02 15:53:19', NULL),
(427, 'hyundai-tucson-816510.png', 56, '2024-07-02 15:53:19', '2024-07-02 15:53:19', NULL),
(428, 'hyundai-tucson-160697.png', 56, '2024-07-02 15:53:19', '2024-07-02 15:53:19', NULL),
(429, 'hyundai-tucson-379176.png', 56, '2024-07-02 15:53:20', '2024-07-02 15:53:20', NULL),
(430, 'hyundai-tucson-628459.png', 56, '2024-07-02 15:53:20', '2024-07-02 15:53:20', NULL),
(431, 'hyundai-tucson-214168.png', 56, '2024-07-02 15:53:20', '2024-07-02 15:53:20', NULL),
(432, 'audi-a1-400130.png', 57, '2024-07-04 16:33:17', '2024-07-04 16:33:17', NULL),
(433, 'audi-a1-897225.png', 57, '2024-07-04 16:33:17', '2024-07-04 16:33:17', NULL),
(434, 'audi-a1-135811.png', 57, '2024-07-04 16:33:17', '2024-07-04 16:33:17', NULL),
(435, 'audi-a1-742425.png', 57, '2024-07-04 16:33:17', '2024-07-04 16:33:17', NULL),
(436, 'audi-a1-525360.png', 57, '2024-07-04 16:33:17', '2024-07-04 16:33:17', NULL),
(437, 'audi-a1-798652.png', 57, '2024-07-04 16:33:18', '2024-07-04 16:33:18', NULL),
(438, 'audi-a1-257000.png', 57, '2024-07-04 16:33:18', '2024-07-04 16:33:18', NULL),
(439, 'audi-a1-673759.png', 57, '2024-07-04 16:33:18', '2024-07-04 16:33:18', NULL),
(440, 'mercedes-classe-c-791433.png', 58, '2024-07-06 13:01:07', '2024-07-06 13:01:07', NULL),
(441, 'mercedes-classe-c-723239.png', 58, '2024-07-06 13:01:08', '2024-07-06 13:01:08', NULL),
(442, 'mercedes-classe-c-691511.png', 58, '2024-07-06 13:01:08', '2024-07-06 13:01:08', NULL),
(443, 'mercedes-classe-c-657123.png', 58, '2024-07-06 13:01:08', '2024-07-06 13:01:08', NULL),
(444, 'mercedes-classe-c-811064.png', 58, '2024-07-06 13:01:08', '2024-07-06 13:01:08', NULL),
(445, 'mercedes-classe-c-685203.png', 58, '2024-07-06 13:01:08', '2024-07-06 13:01:08', NULL),
(446, 'mercedes-classe-c-568549.png', 58, '2024-07-06 13:01:09', '2024-07-06 13:01:09', NULL),
(447, 'mercedes-classe-c-815342.png', 58, '2024-07-06 13:01:09', '2024-07-06 13:01:09', NULL),
(448, 'peugeot-508-599008.png', 59, '2024-07-06 15:45:07', '2024-07-06 15:45:07', NULL),
(449, 'peugeot-508-708660.png', 59, '2024-07-06 15:45:07', '2024-07-06 15:45:07', NULL),
(450, 'peugeot-508-307936.png', 59, '2024-07-06 15:45:07', '2024-07-06 15:45:07', NULL),
(451, 'peugeot-508-461244.png', 59, '2024-07-06 15:45:07', '2024-07-06 15:45:07', NULL),
(452, 'peugeot-508-462834.png', 59, '2024-07-06 15:45:07', '2024-07-06 15:45:07', NULL),
(453, 'peugeot-508-961906.png', 59, '2024-07-06 15:45:08', '2024-07-06 15:45:08', NULL),
(454, 'peugeot-508-840079.png', 59, '2024-07-06 15:45:08', '2024-07-06 15:45:08', NULL),
(455, 'peugeot-508-222976.png', 59, '2024-07-06 15:45:08', '2024-07-06 15:45:08', NULL),
(456, 'renault-koleos-479089.png', 60, '2024-07-08 16:24:05', '2024-07-08 16:24:05', NULL),
(457, 'renault-koleos-557103.png', 60, '2024-07-08 16:24:05', '2024-07-08 16:24:05', NULL),
(458, 'renault-koleos-744460.png', 60, '2024-07-08 16:24:05', '2024-07-08 16:24:05', NULL),
(459, 'renault-koleos-470971.png', 60, '2024-07-08 16:24:06', '2024-07-08 16:24:06', NULL),
(460, 'renault-koleos-675934.png', 60, '2024-07-08 16:24:06', '2024-07-08 16:24:06', NULL),
(461, 'renault-koleos-920583.png', 60, '2024-07-08 16:24:06', '2024-07-08 16:24:06', NULL),
(462, 'renault-koleos-424716.png', 60, '2024-07-08 16:24:06', '2024-07-08 16:24:06', NULL),
(463, 'toyota-yaris-363009.png', 61, '2024-07-09 12:36:32', '2024-07-09 12:36:32', NULL),
(464, 'toyota-yaris-524935.png', 61, '2024-07-09 12:36:32', '2024-07-09 12:36:32', NULL),
(465, 'toyota-yaris-410124.png', 61, '2024-07-09 12:36:32', '2024-07-09 12:36:32', NULL),
(466, 'toyota-yaris-470919.png', 61, '2024-07-09 12:36:32', '2024-07-09 12:36:32', NULL),
(467, 'toyota-yaris-322347.png', 61, '2024-07-09 12:36:32', '2024-07-09 12:36:32', NULL),
(468, 'toyota-yaris-519525.png', 61, '2024-07-09 12:36:32', '2024-07-09 12:36:32', NULL),
(469, 'toyota-yaris-736631.png', 61, '2024-07-09 12:36:33', '2024-07-09 12:36:33', NULL),
(470, 'toyota-yaris-662722.png', 61, '2024-07-09 12:36:33', '2024-07-09 12:36:33', NULL),
(471, 'volkswagen-golf-8-845513.png', 62, '2024-07-11 16:53:52', '2024-07-11 16:53:52', NULL),
(472, 'volkswagen-golf-8-278235.png', 62, '2024-07-11 16:53:52', '2024-07-11 16:53:52', NULL),
(473, 'volkswagen-golf-8-313805.png', 62, '2024-07-11 16:53:52', '2024-07-11 16:53:52', NULL),
(474, 'volkswagen-golf-8-104193.png', 62, '2024-07-11 16:53:52', '2024-07-11 16:53:52', NULL),
(475, 'volkswagen-golf-8-928602.png', 62, '2024-07-11 16:53:53', '2024-07-11 16:53:53', NULL),
(476, 'volkswagen-golf-8-227128.png', 62, '2024-07-11 16:53:53', '2024-07-11 16:53:53', NULL),
(477, 'volkswagen-golf-8-787873.png', 62, '2024-07-11 16:53:53', '2024-07-11 16:53:53', NULL),
(478, 'volkswagen-golf-8-943358.png', 62, '2024-07-11 16:53:53', '2024-07-11 16:53:53', NULL),
(479, 'peugeot-3008-489297.png', 63, '2024-07-12 15:02:27', '2024-07-13 09:41:14', '2024-07-13 09:41:14'),
(480, 'peugeot-3008-776540.png', 63, '2024-07-12 15:02:27', '2024-07-12 15:02:27', NULL),
(481, 'peugeot-3008-644155.png', 63, '2024-07-12 15:02:27', '2024-07-12 15:02:27', NULL),
(482, 'peugeot-3008-529019.png', 63, '2024-07-12 15:02:28', '2024-07-12 15:02:28', NULL),
(483, 'peugeot-3008-701073.png', 63, '2024-07-12 15:02:28', '2024-07-12 15:02:28', NULL),
(484, 'peugeot-3008-331951.png', 63, '2024-07-12 15:02:28', '2024-07-12 15:02:28', NULL),
(485, 'peugeot-3008-809976.png', 63, '2024-07-12 15:02:28', '2024-07-12 15:02:28', NULL),
(486, 'peugeot-3008-935336.png', 63, '2024-07-12 15:02:28', '2024-07-12 15:02:28', NULL),
(487, 'kia-picanto-626066.png', 64, '2024-07-12 16:13:39', '2024-07-12 16:13:39', NULL),
(488, 'kia-picanto-142420.png', 64, '2024-07-12 16:13:39', '2024-07-12 16:13:39', NULL),
(489, 'kia-picanto-760501.png', 64, '2024-07-12 16:13:39', '2024-07-12 16:13:39', NULL),
(490, 'kia-picanto-426012.png', 64, '2024-07-12 16:13:39', '2024-07-12 16:13:39', NULL),
(491, 'kia-picanto-251906.png', 64, '2024-07-12 16:13:39', '2024-07-12 16:13:39', NULL),
(492, 'kia-picanto-949410.png', 64, '2024-07-12 16:13:39', '2024-07-12 16:13:39', NULL),
(493, 'kia-picanto-402501.png', 64, '2024-07-12 16:13:40', '2024-07-12 16:13:40', NULL),
(494, 'kia-picanto-920296.png', 64, '2024-07-12 16:13:40', '2024-07-12 16:13:40', NULL),
(495, 'peugeot-3008-568575.png', 65, '2024-07-13 15:16:53', '2024-07-13 15:16:53', NULL),
(496, 'peugeot-3008-205732.png', 65, '2024-07-13 15:16:54', '2024-07-13 15:16:54', NULL),
(497, 'peugeot-3008-201941.png', 65, '2024-07-13 15:16:54', '2024-07-13 15:16:54', NULL),
(498, 'peugeot-3008-244196.png', 65, '2024-07-13 15:16:54', '2024-07-13 15:16:54', NULL),
(499, 'peugeot-3008-859065.png', 65, '2024-07-13 15:16:54', '2024-07-13 15:16:54', NULL),
(500, 'peugeot-3008-611470.png', 65, '2024-07-13 15:16:54', '2024-07-13 15:16:54', NULL),
(501, 'peugeot-3008-942909.png', 65, '2024-07-13 15:16:54', '2024-07-13 15:16:54', NULL),
(502, 'peugeot-3008-987655.png', 65, '2024-07-13 15:16:55', '2024-07-13 15:16:55', NULL),
(503, 'hyundai-tucson-950741.png', 66, '2024-07-15 16:43:40', '2024-07-15 16:43:40', NULL),
(504, 'hyundai-tucson-381456.png', 66, '2024-07-15 16:43:40', '2024-07-15 16:43:40', NULL),
(505, 'hyundai-tucson-294189.png', 66, '2024-07-15 16:43:40', '2024-07-15 16:43:40', NULL),
(506, 'hyundai-tucson-213393.png', 66, '2024-07-15 16:43:41', '2024-07-15 16:43:41', NULL),
(507, 'hyundai-tucson-760502.png', 66, '2024-07-15 16:43:41', '2024-07-15 16:43:41', NULL),
(508, 'hyundai-tucson-630295.png', 66, '2024-07-15 16:43:41', '2024-07-15 16:43:41', NULL),
(509, 'hyundai-tucson-252476.png', 66, '2024-07-15 16:43:41', '2024-07-15 16:43:41', NULL),
(510, 'hyundai-tucson-953055.png', 66, '2024-07-15 16:43:41', '2024-07-15 16:43:41', NULL),
(511, 'hyundai-tucson-598279.png', 66, '2024-07-15 16:43:42', '2024-07-15 16:43:42', NULL),
(512, 'hyundai-tucson-322054.png', 66, '2024-07-15 16:43:42', '2024-07-15 16:43:42', NULL),
(513, 'hyundai-tucson-464525.jpg', 67, '2024-07-18 14:23:21', '2024-07-18 15:31:51', '2024-07-18 15:31:51'),
(514, 'hyundai-tucson-264660.jpg', 67, '2024-07-18 14:23:21', '2024-07-18 15:31:50', '2024-07-18 15:31:50'),
(515, 'hyundai-tucson-644184.jpg', 67, '2024-07-18 14:23:21', '2024-07-18 15:31:49', '2024-07-18 15:31:49'),
(516, 'hyundai-tucson-620813.jpg', 67, '2024-07-18 14:23:21', '2024-07-18 15:31:48', '2024-07-18 15:31:48'),
(517, 'hyundai-tucson-584833.jpg', 67, '2024-07-18 14:23:21', '2024-07-18 15:31:47', '2024-07-18 15:31:47'),
(518, 'hyundai-tucson-671766.jpg', 67, '2024-07-18 14:23:21', '2024-07-18 15:31:47', '2024-07-18 15:31:47'),
(519, 'hyundai-tucson-299785.jpg', 67, '2024-07-18 14:23:21', '2024-07-18 15:31:47', '2024-07-18 15:31:47'),
(520, 'hyundai-tucson-145475.jpg', 67, '2024-07-18 14:23:21', '2024-07-18 15:31:46', '2024-07-18 15:31:46'),
(521, 'hyundai-tucson-152008.jpg', 67, '2024-07-18 15:40:12', '2024-07-18 16:14:11', '2024-07-18 16:14:11'),
(522, 'hyundai-tucson-156066.jpg', 67, '2024-07-18 15:40:12', '2024-07-18 16:14:11', '2024-07-18 16:14:11'),
(523, 'hyundai-tucson-552132.jpg', 67, '2024-07-18 15:40:12', '2024-07-18 16:14:10', '2024-07-18 16:14:10'),
(524, 'hyundai-tucson-670926.jpg', 67, '2024-07-18 15:40:12', '2024-07-18 16:14:09', '2024-07-18 16:14:09'),
(525, 'hyundai-tucson-351734.jpg', 67, '2024-07-18 15:40:12', '2024-07-18 16:14:08', '2024-07-18 16:14:08'),
(526, 'hyundai-tucson-842124.jpg', 67, '2024-07-18 15:40:13', '2024-07-18 16:14:08', '2024-07-18 16:14:08'),
(527, 'hyundai-tucson-952000.jpg', 67, '2024-07-18 15:40:13', '2024-07-18 16:14:08', '2024-07-18 16:14:08');
INSERT INTO `media` (`id`, `name`, `annonces_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(528, 'hyundai-tucson-271084.jpg', 67, '2024-07-18 15:40:13', '2024-07-18 16:14:07', '2024-07-18 16:14:07'),
(529, 'hyundai-tucson-974479.jpg', 67, '2024-07-18 15:40:13', '2024-07-18 16:14:07', '2024-07-18 16:14:07'),
(530, 'hyundai-tucson-883016.jpg', 67, '2024-07-18 15:40:13', '2024-07-18 16:14:07', '2024-07-18 16:14:07'),
(531, 'hyundai-tucson-321845.jpg', 67, '2024-07-18 15:40:13', '2024-07-18 16:14:07', '2024-07-18 16:14:07'),
(532, 'hyundai-tucson-614606.jpg', 67, '2024-07-18 15:40:13', '2024-07-18 16:14:07', '2024-07-18 16:14:07'),
(533, 'hyundai-tucson-460236.png', 67, '2024-07-18 16:22:46', '2024-07-18 16:22:46', NULL),
(534, 'hyundai-tucson-751831.png', 67, '2024-07-18 16:22:56', '2024-07-18 16:22:56', NULL),
(535, 'hyundai-tucson-550072.png', 67, '2024-07-18 16:23:07', '2024-07-18 16:23:07', NULL),
(536, 'hyundai-tucson-288593.png', 67, '2024-07-18 16:23:18', '2024-07-18 16:23:18', NULL),
(537, 'hyundai-tucson-633537.png', 67, '2024-07-18 16:23:28', '2024-07-18 16:23:28', NULL),
(538, 'hyundai-tucson-892090.png', 67, '2024-07-18 16:23:39', '2024-07-18 16:23:39', NULL),
(539, 'hyundai-tucson-302519.png', 68, '2024-07-19 13:14:03', '2024-07-19 13:14:03', NULL),
(540, 'hyundai-tucson-593614.png', 68, '2024-07-19 13:14:03', '2024-07-19 13:14:03', NULL),
(541, 'hyundai-tucson-452833.png', 68, '2024-07-19 13:14:03', '2024-07-19 13:14:03', NULL),
(542, 'hyundai-tucson-388652.png', 68, '2024-07-19 13:14:03', '2024-07-19 13:14:03', NULL),
(543, 'hyundai-tucson-788494.png', 68, '2024-07-19 13:14:04', '2024-07-19 13:14:04', NULL),
(544, 'hyundai-tucson-189867.png', 68, '2024-07-19 13:14:04', '2024-07-19 13:14:04', NULL),
(545, 'hyundai-tucson-625334.png', 68, '2024-07-19 13:14:04', '2024-07-19 13:14:04', NULL),
(546, 'hyundai-tucson-357354.png', 68, '2024-07-19 13:14:04', '2024-07-19 13:14:04', NULL),
(547, 'hyundai-tucson-674141.png', 69, '2024-07-19 16:51:02', '2024-07-19 16:51:02', NULL),
(548, 'hyundai-tucson-250781.png', 69, '2024-07-19 16:51:02', '2024-07-19 16:51:02', NULL),
(549, 'hyundai-tucson-379421.png', 69, '2024-07-19 16:51:02', '2024-07-19 16:51:02', NULL),
(550, 'hyundai-tucson-353040.png', 69, '2024-07-19 16:51:02', '2024-07-19 16:51:02', NULL),
(551, 'hyundai-tucson-547780.png', 69, '2024-07-19 16:51:32', '2024-07-19 16:51:32', NULL),
(552, 'hyundai-tucson-333477.png', 69, '2024-07-19 16:51:32', '2024-07-19 16:51:32', NULL),
(553, 'hyundai-tucson-408223.png', 69, '2024-07-19 16:51:32', '2024-07-19 16:51:32', NULL),
(554, 'hyundai-tucson-159266.png', 69, '2024-07-19 16:51:33', '2024-07-19 16:51:33', NULL),
(555, 'volkswagen-touareg-803475.png', 70, '2024-07-19 17:27:55', '2024-07-19 17:27:55', NULL),
(556, 'volkswagen-touareg-131913.png', 70, '2024-07-19 17:27:55', '2024-07-19 17:27:55', NULL),
(557, 'volkswagen-touareg-678418.png', 70, '2024-07-19 17:27:56', '2024-07-19 17:27:56', NULL),
(558, 'volkswagen-touareg-730578.png', 70, '2024-07-19 17:27:56', '2024-07-19 17:27:56', NULL),
(559, 'seat-ibiza-951258.png', 71, '2024-07-22 14:41:57', '2024-07-22 14:41:57', NULL),
(560, 'seat-ibiza-697735.png', 71, '2024-07-22 14:41:58', '2024-07-22 14:41:58', NULL),
(561, 'seat-ibiza-339597.png', 71, '2024-07-22 14:41:58', '2024-07-22 14:41:58', NULL),
(562, 'seat-ibiza-938830.png', 71, '2024-07-22 14:41:58', '2024-07-22 14:41:58', NULL),
(563, 'seat-ibiza-579392.png', 71, '2024-07-22 14:41:58', '2024-07-22 14:41:58', NULL),
(564, 'seat-ibiza-693166.png', 71, '2024-07-22 14:41:58', '2024-07-22 14:41:58', NULL),
(565, 'seat-ibiza-792776.png', 71, '2024-07-22 14:41:59', '2024-07-22 14:41:59', NULL),
(566, 'seat-ibiza-719313.png', 71, '2024-07-22 14:41:59', '2024-07-22 14:41:59', NULL),
(567, 'volkswagen-tiguan-473901.png', 49, '2024-07-22 15:10:03', '2024-07-22 15:10:03', NULL),
(568, 'hyundai-i-10-168793.png', 72, '2024-07-24 10:07:31', '2024-07-29 13:26:58', '2024-07-29 13:26:58'),
(569, 'hyundai-i-10-890553.png', 72, '2024-07-24 10:07:31', '2024-07-29 13:26:57', '2024-07-29 13:26:57'),
(570, 'hyundai-i-10-616414.png', 72, '2024-07-24 10:07:31', '2024-07-29 13:26:56', '2024-07-29 13:26:56'),
(571, 'hyundai-i-10-315441.png', 72, '2024-07-24 10:07:31', '2024-07-29 13:26:55', '2024-07-29 13:26:55'),
(572, 'hyundai-i-10-430102.png', 72, '2024-07-24 10:07:31', '2024-07-29 13:26:54', '2024-07-29 13:26:54'),
(573, 'hyundai-i-10-741541.png', 72, '2024-07-24 10:07:32', '2024-07-29 13:26:54', '2024-07-29 13:26:54'),
(574, 'hyundai-i-10-737699.png', 72, '2024-07-24 10:07:32', '2024-07-29 13:26:53', '2024-07-29 13:26:53'),
(575, 'hyundai-i-10-839863.png', 72, '2024-07-24 10:07:32', '2024-07-29 13:26:53', '2024-07-29 13:26:53'),
(576, 'hyundai-i-10-757593.png', 72, '2024-07-24 10:07:32', '2024-07-29 13:26:52', '2024-07-29 13:26:52'),
(577, 'hyundai-i-10-617209.png', 72, '2024-07-24 10:07:32', '2024-07-29 13:26:52', '2024-07-29 13:26:52'),
(578, 'hyundai-i-10-841379.png', 72, '2024-07-24 10:07:32', '2024-07-29 13:26:52', '2024-07-29 13:26:52'),
(579, 'ford-kuga-661002.png', 73, '2024-07-27 12:36:17', '2024-09-12 10:12:32', '2024-09-12 10:12:32'),
(580, 'ford-kuga-553553.png', 73, '2024-07-27 12:36:18', '2024-09-12 10:12:31', '2024-09-12 10:12:31'),
(581, 'ford-kuga-462424.png', 73, '2024-07-27 12:36:18', '2024-09-12 10:12:30', '2024-09-12 10:12:30'),
(582, 'ford-kuga-856268.png', 73, '2024-07-27 12:36:18', '2024-09-12 10:12:29', '2024-09-12 10:12:29'),
(583, 'ford-kuga-643077.png', 73, '2024-07-27 12:36:18', '2024-09-12 10:12:28', '2024-09-12 10:12:28'),
(584, 'hyundai-i-10-858264.png', 72, '2024-07-29 13:27:13', '2024-07-29 13:27:13', NULL),
(585, 'hyundai-i-10-873213.png', 72, '2024-07-29 13:27:13', '2024-07-29 13:27:13', NULL),
(586, 'hyundai-i-10-817381.png', 72, '2024-07-29 13:27:13', '2024-07-29 13:27:13', NULL),
(587, 'hyundai-i-10-286929.png', 72, '2024-07-29 13:27:14', '2024-07-29 13:27:14', NULL),
(588, 'hyundai-i-10-397799.png', 72, '2024-07-29 13:27:14', '2024-07-29 13:27:14', NULL),
(589, 'hyundai-i-10-908471.png', 72, '2024-07-29 13:27:14', '2024-07-29 13:27:14', NULL),
(590, 'hyundai-i-10-574490.png', 72, '2024-07-29 13:27:14', '2024-07-29 13:27:14', NULL),
(591, 'hyundai-i-10-384745.png', 72, '2024-07-29 13:27:14', '2024-07-29 13:27:14', NULL),
(592, 'hyundai-i-10-430616.png', 72, '2024-07-29 13:27:15', '2024-07-29 13:27:15', NULL),
(593, 'hyundai-i-10-654959.png', 72, '2024-07-29 13:27:15', '2024-07-29 13:27:15', NULL),
(594, 'hyundai-i-10-510630.png', 72, '2024-07-29 13:27:15', '2024-07-29 13:27:15', NULL),
(595, 'hyundai-i-10-144406.png', 72, '2024-07-29 13:27:15', '2024-07-29 13:27:15', NULL),
(596, 'hyundai-tucson-190594.png', 74, '2024-07-30 14:20:07', '2024-07-30 14:20:07', NULL),
(597, 'hyundai-tucson-769514.png', 74, '2024-07-30 14:20:07', '2024-07-30 14:20:07', NULL),
(598, 'hyundai-tucson-471010.png', 74, '2024-07-30 14:20:08', '2024-07-30 14:20:08', NULL),
(599, 'hyundai-tucson-566863.png', 74, '2024-07-30 14:20:08', '2024-07-30 14:20:08', NULL),
(600, 'hyundai-tucson-309951.png', 74, '2024-07-30 14:20:08', '2024-07-30 14:20:08', NULL),
(601, 'hyundai-tucson-702868.png', 74, '2024-07-30 14:20:08', '2024-07-30 14:20:08', NULL),
(602, 'hyundai-tucson-683396.png', 74, '2024-07-30 14:20:09', '2024-07-30 14:20:09', NULL),
(603, 'hyundai-tucson-613543.png', 74, '2024-07-30 14:20:09', '2024-07-30 14:20:09', NULL),
(604, 'hyundai-tucson-218108.png', 74, '2024-07-30 14:20:09', '2024-07-30 14:20:09', NULL),
(605, 'hyundai-tucson-432462.png', 74, '2024-07-30 14:20:09', '2024-07-30 14:20:09', NULL),
(606, 'hyundai-tucson-719008.png', 74, '2024-07-30 14:20:09', '2024-07-30 14:20:09', NULL),
(607, 'jeep-wrangler-880933.png', 75, '2024-08-03 14:45:59', '2024-08-03 14:45:59', NULL),
(608, 'jeep-wrangler-872374.png', 75, '2024-08-03 14:45:59', '2024-08-03 14:45:59', NULL),
(609, 'jeep-wrangler-958604.png', 75, '2024-08-03 14:46:00', '2024-08-03 14:46:00', NULL),
(610, 'jeep-wrangler-474996.png', 75, '2024-08-03 14:46:00', '2024-08-03 14:46:00', NULL),
(611, 'jeep-wrangler-873848.png', 75, '2024-08-03 14:46:00', '2024-08-03 14:46:00', NULL),
(612, 'jeep-wrangler-645722.png', 75, '2024-08-03 14:46:00', '2024-08-03 14:46:00', NULL),
(613, 'hyundai-tucson-438846.png', 76, '2024-08-07 11:57:50', '2024-08-07 11:57:50', NULL),
(614, 'hyundai-tucson-848119.png', 76, '2024-08-07 11:57:51', '2024-08-07 11:57:51', NULL),
(615, 'hyundai-tucson-373742.png', 76, '2024-08-07 11:57:51', '2024-08-07 11:57:51', NULL),
(616, 'hyundai-tucson-742614.png', 76, '2024-08-07 11:57:51', '2024-08-07 11:57:51', NULL),
(617, 'hyundai-tucson-348360.png', 76, '2024-08-07 11:57:51', '2024-08-07 11:57:51', NULL),
(618, 'hyundai-tucson-185976.png', 76, '2024-08-07 11:57:52', '2024-08-07 11:57:52', NULL),
(619, 'hyundai-tucson-665349.png', 76, '2024-08-07 11:57:52', '2024-08-07 11:57:52', NULL),
(620, 'toyota-yaris-723275.png', 77, '2024-08-09 12:17:44', '2024-08-09 12:17:44', NULL),
(621, 'toyota-yaris-950620.png', 77, '2024-08-09 12:17:44', '2024-08-09 12:17:44', NULL),
(622, 'toyota-yaris-508700.png', 77, '2024-08-09 12:17:45', '2024-08-09 12:17:45', NULL),
(623, 'toyota-yaris-298567.png', 77, '2024-08-09 12:17:45', '2024-08-09 12:17:45', NULL),
(624, 'toyota-yaris-506065.png', 77, '2024-08-09 12:17:45', '2024-08-09 12:17:45', NULL),
(625, 'toyota-yaris-512290.png', 77, '2024-08-09 12:17:45', '2024-08-09 12:17:45', NULL),
(626, 'toyota-yaris-449697.png', 77, '2024-08-09 12:17:45', '2024-08-09 12:17:45', NULL),
(627, 'dacia-sandero-stepway-171878.jpg', 78, '2024-08-13 20:18:43', '2024-08-13 20:18:43', NULL),
(628, 'hyundai-tucson-738726.png', 79, '2024-08-14 08:35:56', '2024-08-14 08:35:56', NULL),
(629, 'hyundai-tucson-153989.png', 79, '2024-08-14 08:35:56', '2024-08-14 08:35:56', NULL),
(630, 'hyundai-tucson-428175.png', 79, '2024-08-14 08:35:56', '2024-08-14 08:35:56', NULL),
(631, 'hyundai-tucson-134336.png', 79, '2024-08-14 08:35:56', '2024-08-14 08:35:56', NULL),
(632, 'hyundai-tucson-820121.png', 79, '2024-08-14 08:35:56', '2024-08-14 08:35:56', NULL),
(633, 'hyundai-tucson-584186.png', 79, '2024-08-14 08:35:56', '2024-08-14 08:35:56', NULL),
(634, 'volkswagen-golf-7-658387.png', 80, '2024-08-17 11:51:16', '2024-08-17 11:51:16', NULL),
(635, 'volkswagen-golf-7-391299.png', 80, '2024-08-17 11:51:16', '2024-08-17 11:51:16', NULL),
(636, 'volkswagen-golf-7-258017.png', 80, '2024-08-17 11:51:16', '2024-08-17 11:51:16', NULL),
(637, 'volkswagen-golf-7-692276.png', 80, '2024-08-17 11:51:16', '2024-08-17 11:51:16', NULL),
(638, 'volkswagen-golf-7-707597.png', 80, '2024-08-17 11:51:16', '2024-08-17 11:51:16', NULL),
(639, 'volkswagen-golf-7-896550.png', 80, '2024-08-17 11:51:17', '2024-08-17 11:51:17', NULL),
(640, 'volkswagen-golf-7-638135.png', 80, '2024-08-17 11:51:17', '2024-08-17 11:51:17', NULL),
(641, 'volkswagen-golf-7-770055.png', 80, '2024-08-17 11:51:17', '2024-08-17 11:51:17', NULL),
(642, 'volkswagen-golf-7-740129.png', 80, '2024-08-17 11:51:17', '2024-08-17 11:51:17', NULL),
(643, 'volkswagen-golf-7-820316.png', 80, '2024-08-17 11:51:18', '2024-08-17 11:51:18', NULL),
(644, 'audi-q5-964812.png', 81, '2024-09-04 08:08:20', '2024-09-04 08:08:20', NULL),
(645, 'audi-q5-624198.png', 81, '2024-09-04 08:08:20', '2024-09-04 08:08:20', NULL),
(646, 'audi-q5-125083.png', 81, '2024-09-04 08:08:21', '2024-09-04 08:08:21', NULL),
(647, 'audi-q5-843494.png', 81, '2024-09-04 08:08:21', '2024-09-04 08:08:21', NULL),
(648, 'audi-q5-528095.png', 81, '2024-09-04 08:08:21', '2024-09-04 08:08:21', NULL),
(649, 'audi-q5-411974.png', 81, '2024-09-04 08:08:21', '2024-09-04 08:08:21', NULL),
(650, 'audi-q5-588351.png', 81, '2024-09-04 08:08:22', '2024-09-04 08:08:22', NULL),
(651, 'audi-q5-154707.png', 81, '2024-09-04 08:08:22', '2024-09-04 08:08:22', NULL),
(652, 'audi-q5-224767.png', 81, '2024-09-04 08:08:22', '2024-09-04 08:08:22', NULL),
(653, 'bmw-serie-5-570482.png', 82, '2024-09-05 14:58:41', '2024-09-05 14:59:19', '2024-09-05 14:59:19'),
(654, 'bmw-serie-5-166882.png', 82, '2024-09-05 15:00:05', '2024-09-05 15:00:05', NULL),
(655, 'bmw-serie-5-179397.png', 82, '2024-09-05 15:00:06', '2024-09-05 15:00:06', NULL),
(656, 'bmw-serie-5-975124.png', 82, '2024-09-05 15:00:06', '2024-09-05 15:00:06', NULL),
(657, 'bmw-serie-5-633695.png', 82, '2024-09-05 15:00:06', '2024-09-05 15:00:06', NULL),
(658, 'bmw-serie-5-661555.png', 82, '2024-09-05 15:00:07', '2024-09-05 15:00:07', NULL),
(659, 'bmw-serie-5-453208.png', 82, '2024-09-05 15:00:07', '2024-09-05 15:00:07', NULL),
(660, 'bmw-serie-5-179372.png', 82, '2024-09-05 15:00:07', '2024-09-05 15:00:07', NULL),
(661, 'bmw-serie-5-607834.png', 82, '2024-09-05 15:00:07', '2024-09-05 15:00:07', NULL),
(662, 'bmw-serie-5-608732.png', 82, '2024-09-05 15:00:07', '2024-09-05 15:00:07', NULL),
(663, 'bmw-serie-5-118961.png', 82, '2024-09-05 15:00:08', '2024-09-05 15:00:08', NULL),
(664, 'bmw-serie-5-176474.png', 82, '2024-09-05 15:00:08', '2024-09-05 15:00:08', NULL),
(665, 'nissan-qashqai-291786.png', 83, '2024-09-06 13:30:11', '2024-09-06 13:30:11', NULL),
(666, 'nissan-qashqai-783206.png', 83, '2024-09-06 13:30:11', '2024-09-06 13:30:11', NULL),
(667, 'nissan-qashqai-261088.png', 83, '2024-09-06 13:30:11', '2024-09-06 13:30:11', NULL),
(668, 'nissan-qashqai-576912.png', 83, '2024-09-06 13:30:11', '2024-09-06 13:30:11', NULL),
(669, 'nissan-qashqai-649152.png', 83, '2024-09-06 13:30:12', '2024-09-06 13:30:12', NULL),
(670, 'nissan-qashqai-233552.png', 83, '2024-09-06 13:30:12', '2024-09-06 13:30:12', NULL),
(671, 'nissan-qashqai-359816.png', 83, '2024-09-06 13:30:12', '2024-09-06 13:30:12', NULL),
(672, 'nissan-qashqai-585834.png', 83, '2024-09-06 13:30:12', '2024-09-06 13:30:12', NULL),
(673, 'nissan-qashqai-909563.png', 83, '2024-09-06 13:30:13', '2024-09-06 13:30:13', NULL),
(674, 'hyundai-tucson-192998.png', 84, '2024-09-06 15:17:46', '2024-09-28 12:44:44', '2024-09-28 12:44:44'),
(675, 'hyundai-tucson-885134.png', 84, '2024-09-06 15:17:47', '2024-09-28 12:44:44', '2024-09-28 12:44:44'),
(676, 'hyundai-tucson-746639.png', 84, '2024-09-06 15:17:47', '2024-09-28 12:44:43', '2024-09-28 12:44:43'),
(677, 'hyundai-tucson-848776.png', 84, '2024-09-06 15:17:47', '2024-09-28 12:44:41', '2024-09-28 12:44:41'),
(678, 'hyundai-tucson-191472.png', 84, '2024-09-06 15:17:48', '2024-09-28 12:44:40', '2024-09-28 12:44:40'),
(679, 'hyundai-tucson-604537.png', 84, '2024-09-06 15:17:48', '2024-09-28 12:44:40', '2024-09-28 12:44:40'),
(680, 'hyundai-tucson-185260.png', 84, '2024-09-06 15:17:48', '2024-09-28 12:44:40', '2024-09-28 12:44:40'),
(681, 'hyundai-tucson-517445.png', 84, '2024-09-06 15:17:48', '2024-09-28 12:44:40', '2024-09-28 12:44:40'),
(682, 'hyundai-tucson-929665.png', 84, '2024-09-06 15:17:49', '2024-09-28 12:44:39', '2024-09-28 12:44:39'),
(683, 'hyundai-tucson-996916.png', 84, '2024-09-06 15:17:49', '2024-09-28 12:44:39', '2024-09-28 12:44:39'),
(684, 'hyundai-tucson-826002.png', 84, '2024-09-06 15:17:49', '2024-09-28 12:44:39', '2024-09-28 12:44:39'),
(685, 'hyundai-tucson-528691.png', 84, '2024-09-06 15:17:50', '2024-09-28 12:44:39', '2024-09-28 12:44:39'),
(686, 'ford-kuga-154625.png', 73, '2024-09-12 10:13:33', '2024-09-12 10:13:33', NULL),
(687, 'ford-kuga-730694.png', 73, '2024-09-12 10:13:34', '2024-09-12 10:13:34', NULL),
(688, 'ford-kuga-729708.png', 73, '2024-09-12 10:13:34', '2024-09-12 10:13:34', NULL),
(689, 'ford-kuga-381943.png', 73, '2024-09-12 10:13:34', '2024-09-12 10:13:34', NULL),
(690, 'ford-kuga-301992.png', 73, '2024-09-12 10:13:34', '2024-09-12 10:13:34', NULL),
(691, 'ford-kuga-204150.png', 73, '2024-09-12 10:13:35', '2024-09-12 10:13:35', NULL),
(692, 'ford-kuga-981761.png', 73, '2024-09-12 10:13:35', '2024-09-12 10:13:35', NULL),
(693, 'ford-kuga-834677.png', 73, '2024-09-12 10:13:35', '2024-09-12 10:13:35', NULL),
(694, 'ford-kuga-225676.png', 73, '2024-09-12 10:13:35', '2024-09-12 10:13:35', NULL),
(695, 'ford-kuga-290470.png', 73, '2024-09-12 10:13:36', '2024-09-12 10:13:36', NULL),
(696, 'bmw-x5-187503.png', 85, '2024-09-18 08:56:08', '2024-09-18 08:56:08', NULL),
(697, 'bmw-x5-530416.png', 85, '2024-09-18 08:56:08', '2024-09-18 08:56:08', NULL),
(698, 'bmw-x5-467042.png', 85, '2024-09-18 08:56:08', '2024-09-18 08:56:08', NULL),
(699, 'bmw-x5-526397.png', 85, '2024-09-18 08:56:08', '2024-09-18 08:56:08', NULL),
(700, 'renault-clio-492545.png', 86, '2024-09-18 10:13:16', '2024-09-18 10:13:16', NULL),
(701, 'renault-clio-704997.png', 86, '2024-09-18 10:13:16', '2024-09-18 10:13:16', NULL),
(702, 'renault-clio-340196.png', 86, '2024-09-18 10:13:17', '2024-09-18 10:13:17', NULL),
(703, 'renault-clio-993096.png', 86, '2024-09-18 10:13:17', '2024-09-18 10:13:17', NULL),
(704, 'renault-clio-114919.png', 86, '2024-09-18 10:13:17', '2024-09-18 10:13:17', NULL),
(705, 'renault-clio-654916.png', 86, '2024-09-18 10:13:17', '2024-09-18 10:13:17', NULL),
(706, 'abarth-124-spider-540093.png', 87, '2024-09-20 09:21:12', '2024-09-20 09:21:12', NULL),
(707, 'abarth-124-spider-261472.png', 87, '2024-09-20 09:21:12', '2024-09-20 09:21:12', NULL),
(708, 'abarth-124-spider-772950.png', 87, '2024-09-20 09:21:12', '2024-09-20 09:21:12', NULL),
(709, 'abarth-124-spider-122514.png', 87, '2024-09-20 09:21:13', '2024-09-20 09:21:13', NULL),
(710, 'abarth-124-spider-184618.png', 87, '2024-09-20 09:21:13', '2024-09-20 09:21:13', NULL),
(711, 'abarth-124-spider-501163.png', 87, '2024-09-20 09:21:13', '2024-09-20 09:21:13', NULL),
(712, 'abarth-124-spider-386035.png', 87, '2024-09-20 09:21:14', '2024-09-20 09:21:14', NULL),
(713, 'opel-astra-743234.jpeg', 88, '2024-09-20 10:07:47', '2024-09-20 10:07:47', NULL),
(714, 'opel-astra-661264.jpeg', 88, '2024-09-20 10:07:48', '2024-09-20 10:07:48', NULL),
(715, 'opel-astra-835447.jpeg', 88, '2024-09-20 10:07:48', '2024-09-20 10:07:48', NULL),
(716, 'opel-astra-331404.jpeg', 88, '2024-09-20 10:07:48', '2024-09-20 10:07:48', NULL),
(717, 'opel-astra-469983.jpeg', 88, '2024-09-20 10:07:48', '2024-09-20 10:07:48', NULL),
(718, 'toyota-c-hr-426578.png', 89, '2024-09-20 15:57:26', '2024-09-20 15:57:26', NULL),
(719, 'toyota-c-hr-804685.png', 89, '2024-09-20 15:57:26', '2024-09-20 15:57:26', NULL),
(720, 'toyota-c-hr-259352.png', 89, '2024-09-20 15:57:27', '2024-09-20 15:57:27', NULL),
(721, 'toyota-c-hr-961883.png', 89, '2024-09-20 15:57:27', '2024-09-20 15:57:27', NULL),
(722, 'toyota-c-hr-846627.png', 89, '2024-09-20 15:57:27', '2024-09-20 15:57:27', NULL),
(723, 'toyota-c-hr-698983.png', 89, '2024-09-20 15:57:27', '2024-09-20 15:57:27', NULL),
(724, 'toyota-c-hr-361046.png', 89, '2024-09-20 15:57:28', '2024-09-20 15:57:28', NULL),
(725, 'toyota-c-hr-987605.png', 89, '2024-09-20 15:57:28', '2024-09-20 15:57:28', NULL),
(726, 'land-rover-discovery-sport-890299.png', 90, '2024-09-21 15:20:33', '2024-09-21 15:20:33', NULL),
(727, 'land-rover-discovery-sport-128243.png', 90, '2024-09-21 15:20:34', '2024-09-21 15:20:34', NULL),
(728, 'land-rover-discovery-sport-344899.png', 90, '2024-09-21 15:20:34', '2024-09-21 15:20:34', NULL),
(729, 'land-rover-discovery-sport-364265.png', 90, '2024-09-21 15:20:34', '2024-09-21 15:20:34', NULL),
(730, 'land-rover-discovery-sport-122385.png', 90, '2024-09-21 15:20:34', '2024-09-21 15:20:34', NULL),
(731, 'land-rover-discovery-sport-519753.png', 90, '2024-09-21 15:20:35', '2024-09-21 15:20:35', NULL),
(732, 'land-rover-discovery-sport-180397.png', 90, '2024-09-21 15:20:35', '2024-09-21 15:20:35', NULL),
(733, 'land-rover-discovery-sport-936310.png', 90, '2024-09-21 15:20:35', '2024-09-21 15:20:35', NULL),
(734, 'land-rover-velar-795201.png', 91, '2024-09-25 13:46:13', '2024-09-25 13:46:13', NULL),
(735, 'land-rover-velar-633052.png', 91, '2024-09-25 13:46:13', '2024-09-25 13:46:13', NULL),
(736, 'land-rover-velar-782413.png', 91, '2024-09-25 13:46:13', '2024-09-25 13:46:13', NULL),
(737, 'land-rover-velar-382592.png', 91, '2024-09-25 13:46:13', '2024-09-25 13:46:13', NULL),
(738, 'land-rover-velar-988103.png', 91, '2024-09-25 13:46:13', '2024-09-25 13:46:13', NULL),
(739, 'land-rover-velar-722515.png', 91, '2024-09-25 13:46:14', '2024-09-25 13:46:14', NULL),
(740, 'land-rover-velar-887180.png', 91, '2024-09-25 13:46:14', '2024-09-25 13:46:14', NULL),
(741, 'land-rover-velar-315064.png', 91, '2024-09-25 13:46:14', '2024-09-25 13:46:14', NULL),
(742, 'land-rover-velar-977496.png', 91, '2024-09-25 13:46:14', '2024-09-25 13:46:14', NULL),
(743, 'land-rover-velar-632000.png', 91, '2024-09-25 13:46:15', '2024-09-25 13:46:15', NULL),
(744, 'land-rover-velar-246196.png', 91, '2024-09-25 13:46:15', '2024-09-25 13:46:15', NULL),
(745, 'land-rover-velar-683876.png', 91, '2024-09-25 13:46:15', '2024-09-25 13:46:15', NULL),
(746, 'peugeot-3008-168218.png', 92, '2024-09-28 08:31:10', '2024-09-28 11:08:04', '2024-09-28 11:08:04'),
(747, 'peugeot-3008-290468.png', 92, '2024-09-28 08:31:10', '2024-09-28 11:08:03', '2024-09-28 11:08:03'),
(748, 'peugeot-3008-433408.png', 92, '2024-09-28 08:31:11', '2024-09-28 11:08:02', '2024-09-28 11:08:02'),
(749, 'peugeot-3008-514865.png', 92, '2024-09-28 08:31:11', '2024-09-28 11:08:01', '2024-09-28 11:08:01'),
(750, 'peugeot-3008-146146.png', 92, '2024-09-28 08:31:11', '2024-09-28 11:08:00', '2024-09-28 11:08:00'),
(751, 'peugeot-3008-690782.png', 92, '2024-09-28 08:31:11', '2024-09-28 11:08:00', '2024-09-28 11:08:00'),
(752, 'peugeot-3008-841696.png', 92, '2024-09-28 08:31:12', '2024-09-28 11:08:00', '2024-09-28 11:08:00'),
(753, 'peugeot-3008-957148.png', 92, '2024-09-28 11:09:13', '2024-09-28 11:09:13', NULL),
(754, 'peugeot-3008-686927.png', 92, '2024-09-28 11:09:14', '2024-09-28 11:09:14', NULL),
(755, 'peugeot-3008-839968.png', 92, '2024-09-28 11:09:14', '2024-09-28 11:09:14', NULL),
(756, 'peugeot-3008-658557.png', 92, '2024-09-28 11:09:14', '2024-09-28 11:09:14', NULL),
(757, 'peugeot-3008-260930.png', 92, '2024-09-28 11:09:14', '2024-09-28 11:09:14', NULL),
(758, 'peugeot-3008-219805.png', 92, '2024-09-28 11:09:15', '2024-09-28 11:09:15', NULL),
(759, 'peugeot-3008-404928.png', 92, '2024-09-28 11:09:15', '2024-09-28 11:09:15', NULL),
(760, 'peugeot-3008-669872.png', 92, '2024-09-28 11:09:15', '2024-09-28 11:09:15', NULL),
(761, 'peugeot-3008-790031.png', 92, '2024-09-28 11:09:15', '2024-09-28 11:09:15', NULL),
(762, 'peugeot-3008-159718.png', 92, '2024-09-28 11:09:16', '2024-09-28 11:09:16', NULL),
(763, 'peugeot-3008-537052.png', 92, '2024-09-28 11:09:16', '2024-09-28 11:09:16', NULL),
(764, 'hyundai-tucson-315029.png', 84, '2024-09-28 12:45:08', '2024-09-28 12:45:08', NULL),
(765, 'hyundai-tucson-336954.png', 84, '2024-09-28 12:45:08', '2024-09-28 12:45:08', NULL),
(766, 'hyundai-tucson-546875.png', 84, '2024-09-28 12:45:09', '2024-09-28 12:45:09', NULL),
(767, 'hyundai-tucson-383099.png', 84, '2024-09-28 12:45:09', '2024-09-28 12:45:09', NULL),
(768, 'hyundai-tucson-384886.png', 84, '2024-09-28 12:45:09', '2024-09-28 12:45:09', NULL),
(769, 'hyundai-tucson-355139.png', 84, '2024-09-28 12:45:09', '2024-09-28 12:45:09', NULL),
(770, 'hyundai-tucson-599038.png', 84, '2024-09-28 12:45:10', '2024-09-28 12:45:10', NULL),
(771, 'land-rover-range-rover-evoque-358970.png', 93, '2024-09-28 12:55:01', '2024-09-28 12:55:01', NULL),
(772, 'land-rover-range-rover-evoque-288456.png', 93, '2024-09-28 12:55:02', '2024-09-28 12:55:02', NULL),
(773, 'land-rover-range-rover-evoque-943296.png', 93, '2024-09-28 12:55:02', '2024-09-28 12:55:02', NULL),
(774, 'land-rover-range-rover-evoque-263975.png', 93, '2024-09-28 12:55:02', '2024-09-28 12:55:02', NULL),
(775, 'land-rover-range-rover-evoque-963647.png', 93, '2024-09-28 12:55:02', '2024-09-28 12:55:02', NULL),
(776, 'land-rover-range-rover-evoque-898647.png', 93, '2024-09-28 12:55:03', '2024-09-28 12:55:03', NULL),
(777, 'land-rover-range-rover-evoque-977239.png', 93, '2024-09-28 12:55:03', '2024-09-28 12:55:03', NULL),
(778, 'land-rover-range-rover-evoque-638582.png', 93, '2024-09-28 12:55:03', '2024-09-28 12:55:03', NULL),
(779, 'land-rover-range-rover-evoque-255949.png', 93, '2024-09-28 12:55:04', '2024-09-28 12:55:04', NULL),
(780, 'land-rover-range-rover-evoque-493954.png', 93, '2024-09-28 12:55:04', '2024-09-28 12:55:04', NULL),
(781, 'renault-clio-230161.png', 94, '2024-10-02 15:27:52', '2024-10-02 15:27:52', NULL),
(782, 'renault-clio-199028.png', 94, '2024-10-02 15:27:52', '2024-10-02 15:27:52', NULL),
(783, 'renault-clio-625121.png', 94, '2024-10-02 15:27:53', '2024-10-02 15:27:53', NULL),
(784, 'renault-clio-878330.png', 94, '2024-10-02 15:27:53', '2024-10-02 15:27:53', NULL),
(785, 'renault-clio-558445.png', 94, '2024-10-02 15:27:53', '2024-10-02 15:27:53', NULL),
(786, 'renault-clio-252928.png', 94, '2024-10-02 15:27:53', '2024-10-02 15:27:53', NULL),
(787, 'renault-clio-616364.png', 94, '2024-10-02 15:27:54', '2024-10-02 15:27:54', NULL),
(788, 'renault-clio-733436.png', 94, '2024-10-02 15:27:54', '2024-10-02 15:27:54', NULL),
(789, 'renault-clio-949526.png', 94, '2024-10-02 15:27:54', '2024-10-02 15:27:54', NULL),
(790, 'renault-clio-324040.png', 94, '2024-10-02 15:27:55', '2024-10-02 15:27:55', NULL),
(791, 'renault-clio-912448.png', 94, '2024-10-02 15:27:55', '2024-10-02 15:27:55', NULL),
(792, 'renault-clio-295406.png', 94, '2024-10-02 15:27:55', '2024-10-02 15:27:55', NULL),
(793, 'hyundai-tucson-163126.jpeg', 95, '2024-10-10 13:40:30', '2024-10-10 13:40:30', NULL),
(794, 'hyundai-tucson-451565.jpeg', 95, '2024-10-10 13:40:30', '2024-10-10 13:40:30', NULL),
(795, 'hyundai-tucson-830002.jpeg', 95, '2024-10-10 13:40:30', '2024-10-10 13:40:30', NULL),
(796, 'hyundai-tucson-316635.jpeg', 95, '2024-10-10 13:40:31', '2024-10-10 13:40:31', NULL),
(797, 'hyundai-tucson-748687.jpeg', 95, '2024-10-10 13:40:31', '2024-10-10 13:40:31', NULL),
(798, 'hyundai-tucson-859682.jpeg', 95, '2024-10-10 13:40:32', '2024-10-10 13:40:32', NULL),
(799, 'land-rover-range-rover-evoque-305870.jpeg', 96, '2024-10-10 14:13:02', '2024-10-23 15:36:03', '2024-10-23 15:36:03'),
(800, 'land-rover-range-rover-evoque-868649.jpeg', 96, '2024-10-10 14:13:03', '2024-10-23 15:36:02', '2024-10-23 15:36:02'),
(801, 'land-rover-range-rover-evoque-303554.jpeg', 96, '2024-10-10 14:13:03', '2024-10-23 15:36:01', '2024-10-23 15:36:01'),
(802, 'land-rover-range-rover-evoque-544153.jpeg', 96, '2024-10-10 14:13:04', '2024-10-23 15:36:00', '2024-10-23 15:36:00'),
(803, 'land-rover-range-rover-evoque-480052.jpeg', 96, '2024-10-10 14:13:04', '2024-10-23 15:35:59', '2024-10-23 15:35:59'),
(804, 'land-rover-range-rover-evoque-316808.jpeg', 96, '2024-10-10 14:13:05', '2024-10-23 15:35:59', '2024-10-23 15:35:59'),
(805, 'land-rover-range-rover-evoque-472596.jpg', 96, '2024-10-10 14:13:05', '2024-10-10 14:14:08', '2024-10-10 14:14:08'),
(806, 'land-rover-range-rover-evoque-420008.jpeg', 97, '2024-10-12 14:22:04', '2024-10-12 14:47:22', '2024-10-12 14:47:22'),
(807, 'land-rover-range-rover-evoque-378274.jpeg', 97, '2024-10-12 14:22:04', '2024-10-12 14:47:21', '2024-10-12 14:47:21'),
(808, 'land-rover-range-rover-evoque-363682.jpeg', 97, '2024-10-12 14:22:05', '2024-10-12 14:47:23', '2024-10-12 14:47:23'),
(809, 'land-rover-range-rover-evoque-395452.jpeg', 97, '2024-10-12 14:22:06', '2024-10-12 14:47:25', '2024-10-12 14:47:25'),
(810, 'land-rover-range-rover-evoque-539552.jpeg', 97, '2024-10-12 14:22:06', '2024-10-12 14:47:26', '2024-10-12 14:47:26'),
(811, 'land-rover-range-rover-evoque-935296.jpeg', 97, '2024-10-12 14:22:07', '2024-10-12 14:47:28', '2024-10-12 14:47:28'),
(812, 'land-rover-range-rover-evoque-866799.jpeg', 97, '2024-10-12 14:48:47', '2024-10-12 14:48:47', NULL),
(813, 'land-rover-range-rover-evoque-450994.jpeg', 97, '2024-10-12 14:48:47', '2024-10-12 14:48:47', NULL),
(814, 'land-rover-range-rover-evoque-832086.jpeg', 97, '2024-10-12 14:48:48', '2024-10-12 14:48:48', NULL),
(815, 'land-rover-range-rover-evoque-723098.jpeg', 97, '2024-10-12 14:48:49', '2024-10-12 14:48:49', NULL),
(816, 'land-rover-range-rover-evoque-778188.jpeg', 97, '2024-10-12 14:48:49', '2024-10-12 14:48:49', NULL),
(817, 'land-rover-range-rover-evoque-311628.jpeg', 97, '2024-10-12 14:48:50', '2024-10-12 14:48:50', NULL),
(818, 'dacia-duster-829321.jpeg', 98, '2024-10-18 10:03:17', '2024-10-18 10:03:17', NULL),
(819, 'dacia-duster-681714.jpeg', 98, '2024-10-18 10:03:17', '2024-10-18 10:03:17', NULL),
(820, 'dacia-duster-456558.jpeg', 98, '2024-10-18 10:03:18', '2024-10-18 10:03:18', NULL),
(821, 'dacia-duster-890914.jpeg', 98, '2024-10-18 10:03:18', '2024-10-18 10:03:18', NULL),
(822, 'dacia-duster-466323.jpeg', 98, '2024-10-18 10:03:19', '2024-10-18 10:03:19', NULL),
(823, 'dacia-duster-485731.jpeg', 98, '2024-10-18 10:03:19', '2024-10-18 10:03:19', NULL),
(824, 'fiat-500-734027.jpg', 99, '2024-10-21 08:44:40', '2024-10-21 08:49:29', '2024-10-21 08:49:29'),
(825, 'fiat-500-618978.jpg', 99, '2024-10-21 08:44:41', '2024-10-21 08:49:32', '2024-10-21 08:49:32'),
(826, 'fiat-500-134542.jpg', 99, '2024-10-21 08:44:41', '2024-10-21 08:49:15', '2024-10-21 08:49:15'),
(827, 'fiat-500-926382.jpg', 99, '2024-10-21 08:44:41', '2024-10-23 12:42:48', '2024-10-23 12:42:48'),
(828, 'fiat-500-376151.jpg', 99, '2024-10-21 08:44:41', '2024-10-23 12:42:47', '2024-10-23 12:42:47'),
(829, 'fiat-500-470749.jpg', 99, '2024-10-21 08:44:42', '2024-10-23 12:42:46', '2024-10-23 12:42:46'),
(830, 'fiat-500-113241.jpg', 99, '2024-10-21 08:44:42', '2024-10-23 12:42:45', '2024-10-23 12:42:45'),
(831, 'fiat-500-671252.jpg', 99, '2024-10-21 08:44:43', '2024-10-23 12:42:44', '2024-10-23 12:42:44'),
(832, 'fiat-500-207708.jpg', 99, '2024-10-21 08:44:43', '2024-10-21 08:49:08', '2024-10-21 08:49:08'),
(833, 'fiat-500-115714.jpg', 99, '2024-10-21 08:44:43', '2024-10-21 08:49:11', '2024-10-21 08:49:11'),
(834, 'fiat-500-839151.jpg', 99, '2024-10-21 08:44:43', '2024-10-23 12:42:43', '2024-10-23 12:42:43'),
(835, 'mercedes-classe-glc-158199.png', 100, '2024-10-23 12:37:11', '2024-10-23 12:37:11', NULL),
(836, 'mercedes-classe-glc-103122.png', 100, '2024-10-23 12:37:11', '2024-10-23 12:37:11', NULL),
(837, 'mercedes-classe-glc-265194.png', 100, '2024-10-23 12:37:11', '2024-10-23 12:37:11', NULL),
(838, 'mercedes-classe-glc-964463.png', 100, '2024-10-23 12:37:11', '2024-10-23 12:37:11', NULL),
(839, 'mercedes-classe-glc-134081.png', 100, '2024-10-23 12:37:12', '2024-10-23 12:37:12', NULL),
(840, 'mercedes-classe-glc-541018.png', 100, '2024-10-23 12:37:12', '2024-10-23 12:37:12', NULL),
(841, 'mercedes-classe-glc-393195.png', 100, '2024-10-23 12:37:12', '2024-10-23 12:37:12', NULL),
(842, 'mercedes-classe-glc-388826.png', 100, '2024-10-23 12:37:13', '2024-10-23 12:37:13', NULL),
(843, 'fiat-500-476141.png', 99, '2024-10-23 12:43:50', '2024-10-23 12:43:50', NULL),
(844, 'fiat-500-837772.png', 99, '2024-10-23 12:43:50', '2024-10-23 12:43:50', NULL),
(845, 'fiat-500-551082.png', 99, '2024-10-23 12:43:50', '2024-10-23 12:43:50', NULL),
(846, 'fiat-500-806788.png', 99, '2024-10-23 12:43:50', '2024-10-23 12:43:50', NULL),
(847, 'fiat-500-875652.png', 99, '2024-10-23 12:43:51', '2024-10-23 12:43:51', NULL),
(848, 'fiat-500-187469.png', 99, '2024-10-23 12:43:51', '2024-10-23 12:43:51', NULL),
(849, 'fiat-500-262740.png', 99, '2024-10-23 12:43:51', '2024-10-23 12:43:51', NULL),
(850, 'fiat-500-421933.png', 99, '2024-10-23 12:43:51', '2024-10-23 12:43:51', NULL),
(851, 'fiat-500-574270.png', 99, '2024-10-23 12:43:52', '2024-10-23 12:43:52', NULL),
(852, 'land-rover-range-rover-evoque-648641.png', 96, '2024-10-23 15:36:34', '2024-10-23 15:36:34', NULL),
(853, 'land-rover-range-rover-evoque-174110.png', 96, '2024-10-23 15:36:35', '2024-10-23 15:36:35', NULL),
(854, 'land-rover-range-rover-evoque-372642.png', 96, '2024-10-23 15:36:35', '2024-10-23 15:36:35', NULL),
(855, 'land-rover-range-rover-evoque-701750.png', 96, '2024-10-23 15:36:35', '2024-10-23 15:36:35', NULL),
(856, 'volkswagen-touareg-965173.png', 101, '2024-11-04 13:23:54', '2024-11-04 13:23:54', NULL),
(857, 'volkswagen-touareg-827612.png', 101, '2024-11-04 13:23:54', '2024-11-04 13:23:54', NULL),
(858, 'volkswagen-touareg-889705.png', 101, '2024-11-04 13:23:54', '2024-11-04 13:23:54', NULL),
(859, 'volkswagen-touareg-347093.png', 101, '2024-11-04 13:23:55', '2024-11-04 13:23:55', NULL),
(860, 'volkswagen-touareg-182166.png', 101, '2024-11-04 13:23:55', '2024-11-04 13:23:55', NULL),
(861, 'volkswagen-touareg-269190.png', 101, '2024-11-04 13:23:55', '2024-11-04 13:23:55', NULL),
(862, 'volkswagen-touareg-150920.png', 101, '2024-11-04 13:23:56', '2024-11-04 13:23:56', NULL),
(863, 'volkswagen-touareg-174053.png', 101, '2024-11-04 13:23:56', '2024-11-04 13:23:56', NULL),
(864, 'volkswagen-touareg-309536.png', 101, '2024-11-04 13:23:56', '2024-11-04 13:23:56', NULL),
(865, 'volkswagen-touareg-830627.png', 101, '2024-11-04 13:23:56', '2024-11-04 13:23:56', NULL),
(866, 'volkswagen-touareg-291547.png', 101, '2024-11-04 13:23:57', '2024-11-04 13:23:57', NULL),
(867, 'volkswagen-touareg-765832.png', 101, '2024-11-04 13:23:57', '2024-11-04 13:23:57', NULL),
(868, 'hyundai-creta-795706.png', 102, '2024-11-12 15:31:29', '2024-11-12 15:31:29', NULL),
(869, 'hyundai-creta-445249.png', 102, '2024-11-12 15:31:29', '2024-11-12 15:31:29', NULL),
(870, 'hyundai-creta-608317.png', 102, '2024-11-12 15:31:29', '2024-11-12 15:31:29', NULL),
(871, 'hyundai-creta-522678.png', 102, '2024-11-12 15:31:29', '2024-11-12 15:31:29', NULL),
(872, 'hyundai-creta-621559.png', 102, '2024-11-12 15:31:30', '2024-11-12 15:31:30', NULL),
(873, 'hyundai-creta-782328.png', 102, '2024-11-12 15:31:30', '2024-11-12 15:31:30', NULL),
(874, 'hyundai-creta-507880.png', 102, '2024-11-12 15:31:30', '2024-11-12 15:31:30', NULL),
(875, 'hyundai-creta-762139.png', 102, '2024-11-12 15:31:30', '2024-11-12 15:31:30', NULL),
(876, 'hyundai-creta-241303.png', 102, '2024-11-12 15:31:31', '2024-11-12 15:31:31', NULL),
(877, 'hyundai-creta-819852.png', 102, '2024-11-12 15:31:31', '2024-11-12 15:31:31', NULL),
(878, 'hyundai-creta-500692.png', 102, '2024-11-12 15:31:31', '2024-11-12 15:31:31', NULL),
(879, 'hyundai-creta-115525.png', 102, '2024-11-12 15:31:32', '2024-11-12 15:31:32', NULL),
(880, 'volkswagen-tiguan-718582.png', 103, '2024-11-20 13:23:34', '2024-11-20 13:23:34', NULL),
(881, 'volkswagen-tiguan-891748.png', 103, '2024-11-20 13:23:35', '2024-11-20 13:23:35', NULL),
(882, 'volkswagen-tiguan-374744.png', 103, '2024-11-20 13:23:35', '2024-11-20 13:23:35', NULL),
(883, 'volkswagen-tiguan-531289.png', 103, '2024-11-20 13:23:35', '2024-11-20 13:23:35', NULL),
(884, 'volkswagen-tiguan-375133.png', 103, '2024-11-20 13:23:35', '2024-11-20 13:23:35', NULL),
(885, 'volkswagen-tiguan-382281.png', 103, '2024-11-20 13:23:36', '2024-11-20 13:23:36', NULL),
(886, 'volkswagen-tiguan-231696.png', 103, '2024-11-20 13:23:36', '2024-11-20 13:23:36', NULL),
(887, 'volkswagen-tiguan-879119.png', 103, '2024-11-20 13:23:36', '2024-11-20 13:23:36', NULL),
(888, 'volkswagen-tiguan-490117.png', 103, '2024-11-20 13:23:36', '2024-11-20 13:23:36', NULL),
(889, 'volkswagen-tiguan-828651.png', 103, '2024-11-20 13:23:37', '2024-11-20 13:23:37', NULL),
(890, 'volkswagen-tiguan-666882.png', 103, '2024-11-20 13:23:37', '2024-11-20 13:23:37', NULL),
(891, 'volkswagen-tiguan-546247.png', 103, '2024-11-20 13:23:37', '2024-11-20 13:23:37', NULL),
(892, 'bmw-x5-914129.png', 104, '2024-11-21 12:59:59', '2024-11-21 12:59:59', NULL),
(893, 'bmw-x5-350458.png', 104, '2024-11-21 12:59:59', '2024-11-21 12:59:59', NULL),
(894, 'bmw-x5-651589.png', 104, '2024-11-21 12:59:59', '2024-11-21 12:59:59', NULL),
(895, 'bmw-x5-791046.png', 104, '2024-11-21 13:00:00', '2024-11-21 13:00:00', NULL),
(896, 'bmw-x5-858389.png', 104, '2024-11-21 13:00:00', '2024-11-21 13:00:00', NULL),
(897, 'bmw-x5-188225.png', 104, '2024-11-21 13:00:00', '2024-11-21 13:00:00', NULL),
(898, 'bmw-x5-898361.png', 104, '2024-11-21 13:00:00', '2024-11-21 13:00:00', NULL),
(899, 'bmw-x5-147411.png', 104, '2024-11-21 13:00:01', '2024-11-21 13:00:01', NULL),
(900, 'bmw-x5-805350.png', 104, '2024-11-21 13:00:01', '2024-11-21 13:00:01', NULL),
(901, 'bmw-x5-735578.png', 104, '2024-11-21 13:00:01', '2024-11-21 13:00:01', NULL),
(902, 'bmw-x5-308877.png', 104, '2024-11-21 13:00:01', '2024-11-21 13:00:01', NULL),
(903, 'bmw-x5-525008.png', 104, '2024-11-21 13:00:02', '2024-11-21 13:00:02', NULL),
(904, 'renault-captur-662151.png', 105, '2024-11-22 14:55:11', '2024-11-22 14:55:11', NULL),
(905, 'renault-captur-649240.png', 105, '2024-11-22 14:55:11', '2024-11-22 14:55:11', NULL),
(906, 'renault-captur-942687.png', 105, '2024-11-22 14:55:11', '2024-11-22 14:55:11', NULL),
(907, 'renault-captur-146660.png', 105, '2024-11-22 14:55:12', '2024-11-22 14:55:12', NULL),
(908, 'renault-captur-927947.png', 105, '2024-11-22 14:55:12', '2024-11-22 14:55:12', NULL),
(909, 'renault-captur-628883.png', 105, '2024-11-22 14:55:12', '2024-11-22 14:55:12', NULL),
(910, 'renault-captur-421123.png', 105, '2024-11-22 14:55:12', '2024-11-22 14:55:12', NULL),
(911, 'renault-captur-170528.png', 105, '2024-11-22 14:55:13', '2024-11-22 14:55:13', NULL),
(912, 'renault-captur-461880.png', 105, '2024-11-22 14:55:13', '2024-11-22 14:55:13', NULL),
(913, 'renault-captur-548559.png', 105, '2024-11-22 14:55:13', '2024-11-22 14:55:13', NULL),
(914, 'renault-captur-230505.png', 105, '2024-11-22 14:55:13', '2024-11-22 14:55:13', NULL),
(915, 'renault-captur-520314.png', 105, '2024-11-22 14:55:14', '2024-11-22 14:55:14', NULL),
(916, 'audi-q3-217287.jpg', 106, '2024-11-27 11:37:21', '2024-11-28 19:52:31', '2024-11-28 19:52:31'),
(917, 'audi-q3-456223.jpg', 106, '2024-11-27 11:37:22', '2024-11-28 19:52:29', '2024-11-28 19:52:29'),
(918, 'audi-q3-936488.jpg', 106, '2024-11-27 11:37:23', '2024-11-28 19:52:28', '2024-11-28 19:52:28'),
(919, 'audi-q3-232076.jpg', 106, '2024-11-27 11:37:23', '2024-11-28 19:52:27', '2024-11-28 19:52:27'),
(920, 'audi-q3-171808.jpg', 106, '2024-11-27 11:37:25', '2024-11-28 19:52:26', '2024-11-28 19:52:26'),
(921, 'audi-q3-597988.jpg', 106, '2024-11-27 11:37:26', '2024-11-28 19:52:36', '2024-11-28 19:52:36'),
(922, 'audi-q3-509164.jpg', 106, '2024-11-27 11:37:28', '2024-11-27 11:37:28', NULL),
(923, 'audi-q3-734411.jpg', 106, '2024-11-27 11:37:30', '2024-11-27 11:37:30', NULL),
(924, 'audi-q3-358248.jpg', 106, '2024-11-28 19:50:44', '2024-11-28 19:50:44', NULL),
(925, 'audi-q3-710156.jpg', 106, '2024-11-28 19:55:16', '2024-11-28 19:55:16', NULL),
(926, 'audi-q3-213600.jpg', 106, '2024-11-28 19:55:17', '2024-11-28 19:55:17', NULL),
(927, 'audi-q3-914388.jpg', 106, '2024-11-28 19:55:18', '2024-11-28 19:55:18', NULL),
(928, 'hyundai-tucson-347653.jpg', 107, '2024-12-04 11:25:44', '2024-12-04 11:25:44', NULL),
(929, 'hyundai-tucson-307239.jpg', 107, '2024-12-04 11:25:44', '2024-12-04 11:25:44', NULL),
(930, 'hyundai-tucson-346095.jpg', 107, '2024-12-04 11:25:44', '2024-12-04 11:25:44', NULL),
(931, 'hyundai-tucson-993546.jpg', 107, '2024-12-04 11:25:44', '2024-12-04 11:25:44', NULL),
(932, 'citroen-c4x-377327.jpg', 108, '2024-12-04 14:41:52', '2024-12-04 14:41:52', NULL),
(933, 'citroen-c4x-129115.jpg', 108, '2024-12-04 14:41:52', '2024-12-04 14:41:52', NULL),
(934, 'citroen-c4x-395235.jpg', 108, '2024-12-04 14:41:52', '2024-12-04 14:41:52', NULL),
(935, 'citroen-c4x-187069.jpg', 108, '2024-12-04 14:41:52', '2024-12-04 14:41:52', NULL),
(936, 'citroen-c4x-222009.jpg', 108, '2024-12-04 14:41:52', '2024-12-04 14:41:52', NULL),
(937, 'citroen-c5-aircross-329538.jpg', 109, '2024-12-05 10:14:36', '2024-12-05 10:14:36', NULL),
(938, 'citroen-c5-aircross-146569.jpg', 109, '2024-12-05 10:14:36', '2024-12-05 10:14:36', NULL),
(939, 'citroen-c5-aircross-805422.jpg', 109, '2024-12-05 10:14:36', '2024-12-05 10:14:36', NULL),
(940, 'skoda-kodiaq-412783.jpg', 110, '2024-12-14 08:44:47', '2024-12-14 08:44:47', NULL),
(941, 'skoda-kodiaq-838346.jpg', 110, '2024-12-14 08:44:47', '2024-12-14 08:44:47', NULL),
(942, 'skoda-kodiaq-781915.jpg', 110, '2024-12-14 08:44:47', '2024-12-14 08:44:47', NULL),
(943, 'skoda-kodiaq-918661.jpg', 110, '2024-12-14 08:44:47', '2024-12-14 08:44:47', NULL),
(944, 'skoda-kodiaq-276903.jpg', 110, '2024-12-14 08:47:18', '2024-12-14 08:47:18', NULL),
(945, 'bmw-serie-2-gran-coupe-848086.jpg', 111, '2024-12-17 08:41:21', '2024-12-17 08:44:16', '2024-12-17 08:44:16'),
(946, 'bmw-serie-2-gran-coupe-487308.jpg', 111, '2024-12-17 08:41:21', '2024-12-17 08:44:17', '2024-12-17 08:44:17'),
(947, 'bmw-serie-2-gran-coupe-730916.jpg', 111, '2024-12-17 08:41:21', '2024-12-17 08:44:18', '2024-12-17 08:44:18'),
(948, 'bmw-serie-2-gran-coupe-863540.jpg', 111, '2024-12-17 08:44:30', '2024-12-17 08:44:30', NULL),
(949, 'bmw-serie-2-gran-coupe-550875.jpg', 111, '2024-12-17 08:44:30', '2024-12-17 08:44:30', NULL),
(950, 'bmw-serie-2-gran-coupe-728129.jpg', 111, '2024-12-17 08:44:30', '2024-12-17 08:44:30', NULL),
(951, 'bmw-serie-2-gran-coupe-283944.jpg', 111, '2024-12-17 08:44:30', '2024-12-17 08:44:30', NULL),
(952, 'renault-clio-756337.jpg', 112, '2024-12-18 08:09:19', '2024-12-18 08:09:19', NULL),
(953, 'renault-clio-563486.jpg', 112, '2024-12-18 08:09:19', '2024-12-18 08:09:19', NULL),
(954, 'renault-clio-110973.jpg', 112, '2024-12-18 08:09:19', '2024-12-18 08:09:19', NULL),
(955, 'renault-clio-541369.jpg', 112, '2024-12-18 08:09:19', '2024-12-18 08:09:19', NULL),
(956, 'renault-clio-679744.jpg', 112, '2024-12-18 08:09:19', '2024-12-18 08:09:19', NULL),
(957, 'renault-clio-790070.jpg', 112, '2024-12-18 08:09:19', '2024-12-18 08:09:19', NULL),
(958, 'renault-clio-911686.jpg', 112, '2024-12-18 08:09:19', '2024-12-18 08:09:19', NULL),
(959, 'bmw-serie-5-664154.jpg', 113, '2024-12-19 09:31:06', '2024-12-19 09:31:06', NULL),
(960, 'bmw-serie-5-998657.jpg', 113, '2024-12-19 09:31:06', '2024-12-19 09:31:06', NULL),
(961, 'bmw-serie-5-353627.jpg', 113, '2024-12-19 09:31:06', '2024-12-19 09:31:06', NULL),
(962, 'bmw-serie-5-532329.jpg', 113, '2024-12-19 09:31:06', '2024-12-19 09:31:06', NULL),
(963, 'bmw-serie-5-278378.jpg', 113, '2024-12-19 09:31:06', '2024-12-19 09:31:06', NULL),
(964, 'mercedes-classe-gle-coupe-357963.jpg', 114, '2024-12-23 14:15:37', '2024-12-23 14:16:38', '2024-12-23 14:16:38'),
(965, 'mercedes-classe-gle-coupe-203440.jpg', 114, '2024-12-23 14:15:37', '2024-12-23 14:16:41', '2024-12-23 14:16:41'),
(966, 'mercedes-classe-gle-coupe-224104.jpg', 114, '2024-12-23 14:15:37', '2024-12-23 14:16:42', '2024-12-23 14:16:42'),
(967, 'mercedes-classe-gle-coupe-111042.jpg', 114, '2024-12-23 14:15:37', '2024-12-23 14:16:43', '2024-12-23 14:16:43'),
(968, 'mercedes-classe-gle-coupe-804778.jpg', 114, '2024-12-23 14:16:47', '2024-12-23 14:16:47', NULL),
(969, 'mercedes-classe-gle-coupe-119500.jpg', 114, '2024-12-23 14:16:47', '2024-12-23 14:16:47', NULL),
(970, 'mercedes-classe-gle-coupe-521480.jpg', 114, '2024-12-23 14:16:47', '2024-12-23 14:16:47', NULL),
(971, 'mercedes-classe-gle-coupe-619178.jpg', 114, '2024-12-23 14:16:47', '2024-12-23 14:16:47', NULL),
(972, 'mercedes-classe-gle-coupe-732847.jpg', 114, '2024-12-23 14:16:47', '2024-12-23 14:16:47', NULL),
(973, 'bmw-serie-3-738820.jpg', 115, '2024-12-26 11:56:06', '2024-12-26 11:56:06', NULL),
(974, 'bmw-serie-3-791885.jpg', 115, '2024-12-26 11:56:06', '2024-12-26 11:56:06', NULL),
(975, 'bmw-serie-3-744442.jpg', 115, '2024-12-26 11:56:06', '2024-12-26 11:56:06', NULL),
(976, 'bmw-serie-3-483471.jpg', 115, '2024-12-26 11:56:06', '2024-12-26 11:56:06', NULL),
(977, 'citroen-c5-aircross-476544.jpg', 117, '2024-12-27 15:58:05', '2024-12-27 15:58:05', NULL),
(978, 'citroen-c5-aircross-941310.jpg', 117, '2024-12-27 15:58:05', '2024-12-27 16:00:38', '2024-12-27 16:00:38'),
(979, 'citroen-c5-aircross-841686.jpg', 117, '2024-12-27 15:58:06', '2024-12-27 16:00:38', '2024-12-27 16:00:38'),
(980, 'citroen-c5-aircross-925486.jpg', 117, '2024-12-27 15:58:06', '2024-12-27 16:00:37', '2024-12-27 16:00:37'),
(981, 'citroen-c5-aircross-594103.jpg', 117, '2024-12-27 15:58:06', '2024-12-27 16:00:36', '2024-12-27 16:00:36'),
(982, 'citroen-c5-aircross-425882.jpg', 117, '2024-12-27 15:58:06', '2024-12-27 16:00:34', '2024-12-27 16:00:34'),
(983, 'citroen-c5-aircross-742193.jpg', 117, '2024-12-27 16:01:03', '2024-12-27 16:01:03', NULL),
(984, 'citroen-c5-aircross-102019.jpg', 117, '2024-12-27 16:01:03', '2024-12-27 16:01:03', NULL),
(985, 'citroen-c5-aircross-553201.jpg', 117, '2024-12-27 16:01:03', '2024-12-27 16:01:03', NULL),
(986, 'citroen-c5-aircross-625779.jpg', 117, '2024-12-27 16:01:03', '2024-12-27 16:01:03', NULL),
(987, 'citroen-c5-aircross-713850.jpg', 117, '2024-12-27 16:01:03', '2024-12-28 08:12:49', '2024-12-28 08:12:49'),
(988, 'opel-astra-438760.jpg', 118, '2025-01-09 10:08:06', '2025-01-09 10:08:06', NULL),
(989, 'opel-astra-256146.jpg', 118, '2025-01-09 10:08:06', '2025-01-09 10:08:06', NULL),
(990, 'opel-astra-673170.jpg', 118, '2025-01-09 10:08:06', '2025-01-09 10:08:06', NULL),
(991, 'opel-astra-482153.jpg', 118, '2025-01-09 10:08:06', '2025-01-09 10:08:06', NULL),
(992, 'fiat-tipo-hatchback-737652.jpg', 119, '2025-01-13 10:35:13', '2025-01-13 10:35:13', NULL),
(993, 'fiat-tipo-hatchback-548257.jpg', 119, '2025-01-13 10:35:13', '2025-01-13 10:35:13', NULL),
(994, 'fiat-tipo-hatchback-595640.jpg', 119, '2025-01-13 10:35:13', '2025-01-13 10:35:13', NULL),
(995, 'fiat-tipo-hatchback-968953.jpg', 119, '2025-01-13 10:35:13', '2025-01-13 10:35:13', NULL),
(996, 'fiat-tipo-hatchback-650585.jpg', 119, '2025-01-13 10:35:13', '2025-01-13 10:35:13', NULL),
(997, 'fiat-tipo-hatchback-183530.jpg', 119, '2025-01-13 10:35:13', '2025-01-13 10:35:13', NULL),
(998, 'kia-sportage-586025.jpg', 120, '2025-01-20 15:13:02', '2025-01-20 15:13:02', NULL),
(999, 'kia-sportage-699503.jpg', 120, '2025-01-20 15:13:02', '2025-01-20 15:13:02', NULL),
(1000, 'kia-sportage-666884.jpg', 120, '2025-01-20 15:13:02', '2025-01-20 15:13:02', NULL),
(1001, 'kia-sportage-628873.jpg', 120, '2025-01-20 15:13:03', '2025-01-20 15:13:03', NULL),
(1002, 'kia-sportage-890824.jpg', 120, '2025-01-20 15:13:03', '2025-01-20 15:13:03', NULL),
(1003, 'kia-sportage-187348.jpg', 120, '2025-01-20 15:13:03', '2025-01-20 15:13:03', NULL),
(1004, 'porsche-macan-559708.jpg', 121, '2025-01-21 12:51:59', '2025-01-21 13:05:27', '2025-01-21 13:05:27'),
(1005, 'porsche-macan-682995.jpg', 121, '2025-01-21 12:51:59', '2025-01-21 13:06:07', '2025-01-21 13:06:07'),
(1006, 'porsche-macan-545502.jpg', 121, '2025-01-21 12:51:59', '2025-01-21 13:06:09', '2025-01-21 13:06:09'),
(1007, 'porsche-macan-780752.jpg', 121, '2025-01-21 12:52:00', '2025-01-21 13:06:09', '2025-01-21 13:06:09'),
(1008, 'porsche-macan-109369.jpg', 121, '2025-01-21 12:52:00', '2025-01-21 13:06:08', '2025-01-21 13:06:08'),
(1009, 'porsche-macan-834388.jpg', 121, '2025-01-21 12:52:00', '2025-01-21 13:06:10', '2025-01-21 13:06:10'),
(1010, 'porsche-macan-270025.jpg', 121, '2025-01-21 12:52:01', '2025-01-21 13:06:11', '2025-01-21 13:06:11'),
(1011, 'porsche-macan-891317.jpg', 121, '2025-01-21 13:05:50', '2025-01-21 13:05:50', NULL),
(1012, 'porsche-macan-145161.jpg', 121, '2025-01-21 13:05:50', '2025-01-21 13:05:50', NULL),
(1013, 'porsche-macan-493464.jpg', 121, '2025-01-21 13:05:51', '2025-01-21 13:05:51', NULL),
(1014, 'porsche-macan-472524.jpg', 121, '2025-01-21 13:06:48', '2025-01-21 13:07:16', '2025-01-21 13:07:16'),
(1015, 'porsche-macan-741537.jpg', 121, '2025-01-21 13:06:49', '2025-01-21 13:07:13', '2025-01-21 13:07:13'),
(1016, 'porsche-macan-246735.jpg', 121, '2025-01-21 13:06:49', '2025-01-21 13:07:13', '2025-01-21 13:07:13'),
(1017, 'porsche-macan-643129.jpg', 121, '2025-01-21 13:06:49', '2025-01-21 13:07:12', '2025-01-21 13:07:12'),
(1018, 'porsche-macan-638695.jpg', 121, '2025-01-21 13:06:50', '2025-01-21 13:07:12', '2025-01-21 13:07:12'),
(1019, 'porsche-macan-607430.jpg', 121, '2025-01-21 13:06:50', '2025-01-21 13:07:12', '2025-01-21 13:07:12'),
(1020, 'porsche-macan-896793.jpg', 121, '2025-01-21 13:06:50', '2025-01-21 13:07:12', '2025-01-21 13:07:12'),
(1021, 'porsche-macan-450266.jpg', 121, '2025-01-21 13:06:51', '2025-01-21 13:07:12', '2025-01-21 13:07:12'),
(1022, 'porsche-macan-971610.jpg', 121, '2025-01-21 13:06:51', '2025-01-21 13:07:11', '2025-01-21 13:07:11'),
(1023, 'porsche-macan-477245.jpg', 121, '2025-01-21 13:08:23', '2025-01-21 13:10:06', '2025-01-21 13:10:06'),
(1024, 'porsche-macan-955619.jpg', 121, '2025-01-21 13:08:24', '2025-01-21 13:10:05', '2025-01-21 13:10:05'),
(1025, 'porsche-macan-378850.jpg', 121, '2025-01-21 13:08:24', '2025-01-21 13:10:04', '2025-01-21 13:10:04'),
(1026, 'porsche-macan-625157.jpg', 121, '2025-01-21 13:08:24', '2025-01-21 13:10:02', '2025-01-21 13:10:02'),
(1027, 'porsche-macan-337491.jpg', 121, '2025-01-21 13:08:24', '2025-01-21 13:09:59', '2025-01-21 13:09:59'),
(1028, 'porsche-macan-361475.jpg', 121, '2025-01-21 13:10:37', '2025-01-21 13:10:37', NULL),
(1029, 'porsche-macan-399802.jpg', 121, '2025-01-21 13:10:37', '2025-01-21 13:10:37', NULL),
(1030, 'porsche-macan-780885.jpg', 121, '2025-01-21 13:10:37', '2025-01-21 13:10:37', NULL),
(1031, 'porsche-macan-197686.jpg', 121, '2025-01-21 13:10:38', '2025-01-21 13:10:38', NULL),
(1032, 'porsche-macan-595400.jpg', 121, '2025-01-21 13:10:38', '2025-01-21 13:10:38', NULL),
(1033, 'porsche-macan-361534.jpg', 121, '2025-01-21 13:10:38', '2025-01-21 13:10:38', NULL),
(1034, 'porsche-macan-627106.jpg', 121, '2025-01-21 13:10:39', '2025-01-21 13:10:39', NULL),
(1035, 'porsche-macan-219226.jpg', 122, '2025-01-21 13:17:48', '2025-04-08 12:04:49', '2025-04-08 12:04:49'),
(1036, 'porsche-macan-383378.jpg', 122, '2025-01-21 13:17:49', '2025-01-21 13:17:49', NULL),
(1037, 'porsche-macan-408354.jpg', 122, '2025-01-21 13:17:49', '2025-01-21 13:17:49', NULL),
(1038, 'porsche-macan-526302.jpg', 122, '2025-01-21 13:17:49', '2025-01-21 13:17:49', NULL),
(1039, 'porsche-macan-752109.jpg', 122, '2025-01-21 13:17:50', '2025-01-21 13:17:50', NULL),
(1040, 'porsche-macan-332050.jpg', 122, '2025-01-21 13:17:50', '2025-01-21 13:17:50', NULL),
(1041, 'porsche-macan-872475.jpg', 122, '2025-01-21 13:17:50', '2025-01-21 13:17:50', NULL),
(1042, 'porsche-macan-311522.jpg', 122, '2025-01-21 13:17:51', '2025-01-21 13:17:51', NULL),
(1043, 'porsche-macan-853902.jpg', 122, '2025-01-21 13:17:51', '2025-01-21 13:17:51', NULL),
(1044, 'ford-mustang-cabriolet-635137.jpg', 123, '2025-02-03 10:09:59', '2025-02-03 12:35:39', '2025-02-03 12:35:39'),
(1045, 'ford-mustang-cabriolet-443870.jpg', 123, '2025-02-03 10:10:00', '2025-02-03 12:35:37', '2025-02-03 12:35:37'),
(1046, 'ford-mustang-cabriolet-150201.jpg', 123, '2025-02-03 10:20:51', '2025-04-08 12:04:28', '2025-04-08 12:04:28'),
(1047, 'ford-mustang-cabriolet-932578.jpg', 123, '2025-02-03 12:35:45', '2025-02-03 12:35:45', NULL),
(1048, 'ford-mustang-cabriolet-117482.jpg', 123, '2025-02-03 12:35:45', '2025-02-03 12:35:45', NULL),
(1049, 'ford-mustang-cabriolet-402353.jpg', 123, '2025-02-04 08:48:31', '2025-02-04 08:48:31', NULL),
(1050, 'tesla-model-3-409872.jpg', 124, '2025-02-07 15:26:05', '2025-02-07 15:26:05', NULL),
(1051, 'tesla-model-3-891205.jpg', 124, '2025-02-07 15:26:05', '2025-02-07 15:26:05', NULL),
(1052, 'tesla-model-3-187823.jpg', 124, '2025-02-07 15:26:05', '2025-02-07 15:26:05', NULL),
(1053, 'tesla-model-3-916031.jpg', 124, '2025-02-07 15:26:05', '2025-02-07 15:26:05', NULL),
(1054, 'tesla-model-3-156841.jpg', 124, '2025-02-07 15:26:06', '2025-02-07 15:26:06', NULL);
INSERT INTO `media` (`id`, `name`, `annonces_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1055, 'nissan-qashqai-473818.jpg', 125, '2025-02-08 13:56:56', '2025-02-08 13:56:56', NULL),
(1056, 'nissan-qashqai-717658.jpg', 125, '2025-02-08 13:56:56', '2025-02-08 13:56:56', NULL),
(1057, 'nissan-qashqai-114329.jpg', 125, '2025-02-08 13:56:57', '2025-02-08 13:56:57', NULL),
(1058, 'nissan-qashqai-971053.jpg', 125, '2025-02-08 13:56:57', '2025-02-08 13:56:57', NULL),
(1059, 'nissan-qashqai-898921.jpg', 125, '2025-02-08 13:56:57', '2025-02-08 13:56:57', NULL),
(1060, 'nissan-qashqai-444155.jpg', 125, '2025-02-08 13:56:58', '2025-02-08 13:56:58', NULL),
(1061, 'nissan-qashqai-632973.jpg', 125, '2025-02-08 13:56:58', '2025-02-08 13:56:58', NULL),
(1062, 'fiat-panda-403859.jpg', 126, '2025-02-08 14:50:32', '2025-02-08 14:50:32', NULL),
(1063, 'fiat-panda-379183.jpg', 126, '2025-02-08 14:50:33', '2025-02-08 14:50:33', NULL),
(1064, 'fiat-panda-109473.jpg', 126, '2025-02-08 14:50:33', '2025-02-08 14:50:33', NULL),
(1065, 'fiat-panda-184981.jpg', 126, '2025-02-08 14:50:34', '2025-02-08 14:50:34', NULL),
(1066, 'fiat-panda-856303.jpg', 126, '2025-02-08 14:50:34', '2025-02-08 14:50:34', NULL),
(1067, 'fiat-panda-112945.png', 126, '2025-02-08 14:50:34', '2025-02-08 14:50:34', NULL),
(1068, 'peugeot-3008-886957.jpg', 127, '2025-02-15 16:58:22', '2025-02-15 16:58:22', NULL),
(1069, 'peugeot-3008-253401.jpg', 127, '2025-02-15 16:58:23', '2025-02-15 16:58:23', NULL),
(1070, 'peugeot-3008-151668.jpg', 127, '2025-02-15 16:58:23', '2025-02-15 16:58:23', NULL),
(1071, 'peugeot-3008-430274.jpg', 127, '2025-02-15 16:58:24', '2025-02-15 16:58:24', NULL),
(1072, 'peugeot-3008-528063.jpg', 127, '2025-02-15 16:58:24', '2025-02-15 16:58:24', NULL),
(1073, 'peugeot-3008-334493.jpg', 127, '2025-02-15 16:58:24', '2025-02-15 16:58:24', NULL),
(1074, 'jeep-cherokee-429781.jpg', 128, '2025-02-28 11:34:14', '2025-02-28 11:34:14', NULL),
(1075, 'jeep-cherokee-616087.jpg', 128, '2025-02-28 11:34:14', '2025-02-28 11:34:14', NULL),
(1076, 'jeep-cherokee-218103.jpg', 128, '2025-02-28 11:34:15', '2025-02-28 11:34:15', NULL),
(1077, 'jeep-cherokee-202172.jpg', 128, '2025-02-28 11:34:15', '2025-02-28 11:34:15', NULL),
(1078, 'jeep-cherokee-487356.jpg', 128, '2025-02-28 11:34:15', '2025-02-28 11:34:15', NULL),
(1079, 'jeep-compass-820057.jpg', 129, '2025-03-01 20:14:43', '2025-03-02 12:14:57', '2025-03-02 12:14:57'),
(1080, 'jeep-compass-223327.jpg', 129, '2025-03-01 20:14:43', '2025-03-02 12:15:05', '2025-03-02 12:15:05'),
(1081, 'jeep-compass-106540.jpg', 129, '2025-03-01 20:14:43', '2025-03-02 12:15:08', '2025-03-02 12:15:08'),
(1082, 'jeep-compass-537083.jpg', 129, '2025-03-02 12:13:59', '2025-03-02 12:15:10', '2025-03-02 12:15:10'),
(1083, 'jeep-compass-942483.jpg', 129, '2025-03-02 12:13:59', '2025-03-02 12:14:43', '2025-03-02 12:14:43'),
(1084, 'jeep-compass-900359.jpg', 129, '2025-03-02 12:14:03', '2025-03-02 12:14:41', '2025-03-02 12:14:41'),
(1085, 'jeep-compass-311245.jpg', 129, '2025-03-02 12:14:04', '2025-03-02 12:15:12', '2025-03-02 12:15:12'),
(1086, 'jeep-compass-736415.jpg', 129, '2025-03-02 12:14:04', '2025-03-02 12:15:13', '2025-03-02 12:15:13'),
(1087, 'jeep-compass-206446.jpg', 129, '2025-03-02 12:15:30', '2025-03-02 12:15:30', NULL),
(1088, 'jeep-compass-513242.jpg', 129, '2025-03-02 12:15:30', '2025-03-02 12:15:30', NULL),
(1089, 'jeep-compass-945471.jpg', 129, '2025-03-02 12:15:30', '2025-03-02 12:15:30', NULL),
(1090, 'jeep-compass-134938.jpg', 129, '2025-03-02 12:15:31', '2025-03-02 12:15:31', NULL),
(1091, 'jeep-compass-219000.jpg', 129, '2025-03-02 12:15:31', '2025-03-02 12:15:31', NULL),
(1092, 'mercedes-classe-c-583331.jpg', 130, '2025-03-05 13:43:18', '2025-03-05 13:43:18', NULL),
(1093, 'mercedes-classe-c-854467.jpg', 130, '2025-03-05 13:43:18', '2025-03-05 13:43:18', NULL),
(1094, 'mercedes-classe-c-528447.jpg', 130, '2025-03-05 13:43:19', '2025-03-05 13:43:19', NULL),
(1095, 'mercedes-classe-c-986412.jpg', 130, '2025-03-05 13:43:19', '2025-03-05 13:43:19', NULL),
(1096, 'mercedes-classe-c-222541.jpg', 130, '2025-03-05 13:43:19', '2025-03-05 13:43:19', NULL),
(1097, 'mercedes-classe-c-433936.jpg', 130, '2025-03-05 13:43:20', '2025-03-05 13:43:20', NULL),
(1098, 'mercedes-classe-c-500606.jpg', 130, '2025-03-05 13:43:20', '2025-03-05 13:43:20', NULL),
(1099, 'mercedes-classe-c-108595.jpg', 130, '2025-03-05 13:43:20', '2025-03-05 13:43:20', NULL),
(1100, 'mercedes-classe-c-369059.jpg', 130, '2025-03-05 13:43:22', '2025-03-05 13:43:22', NULL),
(1101, 'mercedes-classe-glc-coupe-423484.jpg', 131, '2025-03-20 13:48:55', '2025-03-20 13:48:55', NULL),
(1102, 'mercedes-classe-glc-coupe-821985.jpg', 131, '2025-03-20 13:48:55', '2025-03-20 13:48:55', NULL),
(1103, 'mercedes-classe-glc-coupe-349093.jpg', 131, '2025-03-20 13:48:56', '2025-03-20 13:48:56', NULL),
(1104, 'mercedes-classe-glc-coupe-584027.jpg', 131, '2025-03-20 13:48:56', '2025-03-20 13:48:56', NULL),
(1105, 'mercedes-classe-glc-coupe-374392.jpg', 131, '2025-03-20 13:48:57', '2025-03-20 13:48:57', NULL),
(1106, 'mercedes-classe-glc-coupe-434564.jpg', 131, '2025-03-20 13:48:57', '2025-03-20 13:48:57', NULL),
(1107, 'jeep-wrangler-946098.jpg', 132, '2025-03-20 15:23:56', '2025-03-20 15:23:56', NULL),
(1108, 'jeep-wrangler-689153.jpg', 132, '2025-03-20 15:23:56', '2025-03-20 15:23:56', NULL),
(1109, 'jeep-wrangler-831872.jpg', 132, '2025-03-20 15:23:57', '2025-03-20 15:28:48', '2025-03-20 15:28:48'),
(1110, 'jeep-wrangler-642860.jpg', 132, '2025-03-20 15:23:57', '2025-03-20 15:28:54', '2025-03-20 15:28:54'),
(1111, 'jeep-wrangler-676308.jpg', 132, '2025-03-20 15:23:58', '2025-03-20 15:29:01', '2025-03-20 15:29:01'),
(1112, 'jeep-wrangler-195393.jpg', 132, '2025-03-20 15:23:58', '2025-03-20 15:23:58', NULL),
(1113, 'jeep-wrangler-128837.jpg', 132, '2025-03-20 15:23:58', '2025-03-20 15:23:58', NULL),
(1114, 'jeep-wrangler-545011.jpg', 132, '2025-03-20 15:23:59', '2025-03-20 15:23:59', NULL),
(1115, 'jeep-wrangler-349147.jpg', 132, '2025-03-20 15:23:59', '2025-03-20 15:23:59', NULL),
(1116, 'jeep-wrangler-518939.jpg', 132, '2025-03-20 15:23:59', '2025-03-20 15:23:59', NULL),
(1117, 'jeep-wrangler-257749.jpg', 132, '2025-03-20 15:29:22', '2025-03-20 15:29:22', NULL),
(1118, 'jeep-wrangler-330423.jpg', 132, '2025-03-20 15:29:22', '2025-03-20 15:29:22', NULL),
(1119, 'jeep-wrangler-536245.jpg', 132, '2025-03-20 15:29:22', '2025-03-20 15:29:22', NULL),
(1120, 'jeep-wrangler-591078.jpg', 132, '2025-03-20 15:29:23', '2025-03-20 15:29:23', NULL),
(1121, 'tesla-model-3-849795.jpg', 133, '2025-03-25 16:13:33', '2025-04-08 12:03:39', '2025-04-08 12:03:39'),
(1122, 'tesla-model-3-529863.jpg', 133, '2025-03-25 16:13:34', '2025-03-25 16:13:34', NULL),
(1123, 'tesla-model-3-457259.jpg', 133, '2025-03-25 16:13:34', '2025-03-25 16:13:34', NULL),
(1124, 'peugeot-3008-678675.jpg', 134, '2025-03-26 23:16:18', '2025-03-26 23:16:18', NULL),
(1125, 'peugeot-3008-108984.jpg', 134, '2025-03-26 23:16:18', '2025-03-26 23:16:18', NULL),
(1126, 'peugeot-3008-922695.jpg', 134, '2025-03-26 23:16:19', '2025-03-26 23:16:19', NULL),
(1127, 'peugeot-3008-337791.jpg', 134, '2025-03-26 23:16:19', '2025-03-26 23:16:19', NULL),
(1128, 'peugeot-3008-465464.jpg', 134, '2025-03-26 23:16:20', '2025-03-26 23:16:20', NULL),
(1129, 'peugeot-3008-661506.jpg', 134, '2025-03-26 23:16:20', '2025-03-26 23:16:20', NULL),
(1130, 'jeep-wrangler-873010.jpg', 135, '2025-04-08 11:53:31', '2025-04-08 11:53:31', NULL),
(1131, 'jeep-wrangler-253311.jpg', 135, '2025-04-08 11:53:36', '2025-04-08 11:53:36', NULL),
(1132, 'jeep-wrangler-331337.jpg', 135, '2025-04-08 11:53:36', '2025-04-08 11:53:36', NULL),
(1133, 'jeep-wrangler-463410.jpg', 135, '2025-04-08 11:53:36', '2025-04-08 11:53:36', NULL),
(1134, 'jeep-wrangler-902489.jpg', 135, '2025-04-08 11:53:37', '2025-04-08 11:53:37', NULL),
(1135, 'jeep-wrangler-709146.jpg', 135, '2025-04-08 11:53:37', '2025-04-08 11:53:37', NULL),
(1136, 'jeep-wrangler-475776.jpg', 135, '2025-04-08 11:53:37', '2025-04-08 11:53:37', NULL),
(1137, 'mercedes-classe-gla-766991.jpg', 136, '2025-04-08 17:19:01', '2025-04-08 17:19:01', NULL),
(1138, 'mercedes-classe-gla-348783.jpg', 136, '2025-04-08 17:19:01', '2025-04-08 17:19:01', NULL),
(1139, 'mercedes-classe-gla-339878.jpg', 136, '2025-04-08 17:19:01', '2025-04-08 17:19:01', NULL),
(1140, 'mercedes-classe-gla-274415.jpg', 136, '2025-04-08 17:19:02', '2025-04-08 17:19:02', NULL),
(1141, 'mercedes-classe-gla-408076.jpg', 136, '2025-04-08 17:19:02', '2025-04-08 17:19:02', NULL),
(1142, 'mercedes-classe-gla-102242.jpg', 136, '2025-04-08 17:19:02', '2025-04-08 17:19:02', NULL),
(1143, 'mercedes-classe-gla-424376.jpg', 136, '2025-04-08 17:19:03', '2025-04-08 17:19:03', NULL),
(1144, 'mercedes-classe-gla-495921.jpg', 136, '2025-04-08 17:19:03', '2025-04-08 17:19:03', NULL),
(1145, 'jeep-wrangler-824726.jpg', 137, '2025-04-17 16:55:51', '2025-04-17 16:55:51', NULL),
(1146, 'jeep-wrangler-281416.jpg', 137, '2025-04-17 16:55:52', '2025-04-17 16:55:52', NULL),
(1147, 'jeep-wrangler-480049.jpg', 137, '2025-04-17 16:55:52', '2025-04-17 16:55:52', NULL),
(1148, 'jeep-wrangler-327830.jpg', 137, '2025-04-17 16:55:52', '2025-04-17 16:55:52', NULL),
(1149, 'jeep-wrangler-479522.jpg', 137, '2025-04-17 16:55:53', '2025-04-17 16:55:53', NULL),
(1150, 'jeep-wrangler-936553.jpg', 137, '2025-04-17 16:55:53', '2025-04-17 16:55:53', NULL),
(1151, 'hyundai-tucson-147546.jpg', 138, '2025-04-25 14:45:34', '2025-04-25 14:45:34', NULL),
(1152, 'hyundai-tucson-329469.jpg', 138, '2025-04-25 14:45:34', '2025-04-25 14:45:34', NULL),
(1153, 'hyundai-tucson-150468.jpg', 138, '2025-04-25 14:45:34', '2025-04-25 14:45:34', NULL),
(1154, 'hyundai-tucson-206616.jpg', 138, '2025-04-25 14:45:35', '2025-04-25 14:45:35', NULL),
(1155, 'hyundai-tucson-996211.jpg', 138, '2025-04-25 14:45:35', '2025-04-25 14:45:35', NULL),
(1156, 'hyundai-tucson-564432.jpg', 138, '2025-04-25 14:45:35', '2025-04-25 14:45:35', NULL),
(1157, 'hyundai-tucson-826781.jpg', 138, '2025-04-25 14:45:36', '2025-04-25 14:45:36', NULL),
(1158, 'ds-ds-7-crossback-975325.jpg', 139, '2025-04-29 07:42:15', '2025-04-29 07:42:15', NULL),
(1159, 'ds-ds-7-crossback-152605.jpg', 139, '2025-04-29 07:42:15', '2025-04-29 07:42:15', NULL),
(1160, 'ds-ds-7-crossback-810646.jpg', 139, '2025-04-29 07:42:16', '2025-04-29 07:42:16', NULL),
(1161, 'ds-ds-7-crossback-724712.jpg', 139, '2025-04-29 07:42:16', '2025-04-29 07:42:16', NULL),
(1162, 'volkswagen-tiguan-303862.jpg', 140, '2025-04-30 09:03:21', '2025-04-30 09:03:21', NULL),
(1163, 'volkswagen-tiguan-899159.jpg', 140, '2025-04-30 09:03:22', '2025-04-30 09:03:22', NULL),
(1164, 'volkswagen-tiguan-461852.jpg', 140, '2025-04-30 09:03:22', '2025-04-30 09:03:22', NULL),
(1165, 'volkswagen-tiguan-484523.jpg', 140, '2025-04-30 09:03:22', '2025-04-30 09:03:22', NULL),
(1166, 'volkswagen-tiguan-224942.jpg', 140, '2025-04-30 09:03:23', '2025-04-30 09:03:23', NULL),
(1167, 'volkswagen-tiguan-273967.jpg', 140, '2025-04-30 09:03:23', '2025-04-30 09:03:23', NULL),
(1168, 'mercedes-classe-e-716999.jpg', 141, '2025-05-07 10:55:01', '2025-05-07 10:55:01', NULL),
(1169, 'mercedes-classe-e-862693.jpg', 141, '2025-05-07 10:55:01', '2025-05-07 10:55:01', NULL),
(1170, 'mercedes-classe-e-970919.jpg', 141, '2025-05-07 10:55:01', '2025-05-07 10:55:01', NULL),
(1171, 'mercedes-classe-e-113041.jpg', 141, '2025-05-07 10:55:01', '2025-05-07 10:55:01', NULL),
(1172, 'mercedes-classe-e-307410.jpg', 141, '2025-05-07 10:55:01', '2025-05-07 10:55:01', NULL),
(1173, 'mercedes-classe-e-920544.jpg', 141, '2025-05-07 10:55:02', '2025-05-07 10:55:02', NULL),
(1174, 'mercedes-classe-e-454662.jpg', 141, '2025-05-07 10:55:02', '2025-05-07 10:55:02', NULL),
(1175, 'land-rover-range-rover-sport-964029.jpg', 142, '2025-05-23 09:16:20', '2025-05-23 09:16:20', NULL),
(1176, 'land-rover-range-rover-sport-500686.jpg', 142, '2025-05-23 09:16:20', '2025-05-23 09:16:20', NULL),
(1177, 'land-rover-range-rover-sport-866457.jpg', 142, '2025-05-23 09:16:21', '2025-05-23 09:16:21', NULL),
(1178, 'land-rover-range-rover-sport-729636.jpg', 142, '2025-05-23 09:16:21', '2025-05-23 09:16:21', NULL),
(1179, 'land-rover-range-rover-sport-231725.jpg', 142, '2025-05-23 09:16:21', '2025-05-23 09:16:21', NULL),
(1180, 'land-rover-range-rover-sport-551887.jpg', 142, '2025-05-23 09:16:22', '2025-05-23 09:16:22', NULL),
(1181, 'bmw-x3-580615.jpg', 143, '2025-05-29 10:12:32', '2025-05-29 10:12:32', NULL),
(1182, 'bmw-x3-716130.jpg', 143, '2025-05-29 10:12:33', '2025-05-29 10:12:33', NULL),
(1183, 'bmw-x3-127131.jpg', 143, '2025-05-29 10:12:33', '2025-05-29 10:12:33', NULL),
(1184, 'bmw-x3-781037.jpg', 143, '2025-05-29 10:12:33', '2025-05-29 10:12:33', NULL),
(1185, 'bmw-x3-590602.jpg', 143, '2025-05-29 10:12:34', '2025-05-29 10:12:34', NULL),
(1186, 'bmw-x3-273447.jpg', 143, '2025-05-29 10:12:34', '2025-05-29 10:12:34', NULL),
(1187, 'bmw-x3-842281.jpg', 143, '2025-05-29 10:12:36', '2025-05-29 10:12:36', NULL),
(1188, 'bmw-x1-827787.jpg', 144, '2025-06-04 11:38:33', '2025-06-04 11:38:33', NULL),
(1189, 'bmw-x1-917214.jpg', 144, '2025-06-04 11:38:33', '2025-06-04 11:38:33', NULL),
(1190, 'bmw-x1-218592.jpg', 144, '2025-06-04 11:38:34', '2025-06-04 11:38:34', NULL),
(1191, 'bmw-x1-425864.jpg', 144, '2025-06-04 11:38:34', '2025-06-04 11:38:34', NULL),
(1192, 'bmw-x1-233455.jpg', 144, '2025-06-04 11:38:34', '2025-06-04 11:38:34', NULL),
(1193, 'bmw-x1-833171.jpg', 144, '2025-06-04 11:38:36', '2025-06-04 11:38:36', NULL),
(1194, 'bmw-serie-5-513373.jpg', 145, '2025-06-18 13:30:32', '2025-06-18 13:30:32', NULL),
(1195, 'bmw-serie-5-667584.jpg', 145, '2025-06-18 13:30:32', '2025-06-18 13:30:32', NULL),
(1196, 'bmw-serie-5-436848.jpg', 145, '2025-06-18 13:30:32', '2025-06-18 13:30:32', NULL),
(1197, 'bmw-serie-5-423487.jpg', 145, '2025-06-18 13:30:32', '2025-06-18 13:30:32', NULL),
(1198, 'bmw-serie-5-329817.jpg', 145, '2025-06-18 13:30:33', '2025-06-18 13:30:33', NULL),
(1199, 'bmw-serie-5-744841.jpg', 145, '2025-06-18 13:30:33', '2025-06-18 13:30:33', NULL),
(1200, 'bmw-serie-5-689122.jpg', 145, '2025-06-18 13:30:35', '2025-06-18 13:30:35', NULL),
(1201, 'renault-arkana-371663.jpg', 146, '2025-06-25 08:17:38', '2025-06-25 08:17:38', NULL),
(1202, 'renault-arkana-883141.jpg', 146, '2025-06-25 08:17:41', '2025-06-25 08:17:41', NULL),
(1203, 'renault-arkana-201273.jpg', 146, '2025-06-25 08:17:41', '2025-06-25 08:17:41', NULL),
(1204, 'renault-arkana-947045.jpg', 146, '2025-06-25 08:17:44', '2025-06-25 08:17:44', NULL),
(1205, 'renault-arkana-360124.jpg', 146, '2025-06-25 08:17:44', '2025-06-25 08:17:44', NULL),
(1206, 'renault-arkana-514602.jpg', 146, '2025-06-25 08:17:45', '2025-06-25 08:17:45', NULL),
(1207, 'renault-arkana-824370.jpg', 146, '2025-06-25 08:17:45', '2025-06-25 08:17:45', NULL),
(1208, 'renault-arkana-338490.jpg', 146, '2025-06-25 08:17:45', '2025-06-25 08:17:45', NULL),
(1209, 'renault-arkana-217809.jpg', 146, '2025-06-25 08:17:48', '2025-06-25 08:17:48', NULL),
(1210, 'dacia-duster-244052.jpg', 147, '2025-06-25 15:21:53', '2025-06-25 15:21:53', NULL),
(1211, 'dacia-duster-196777.jpg', 147, '2025-06-25 15:21:53', '2025-06-25 15:21:53', NULL),
(1212, 'dacia-duster-760383.jpg', 147, '2025-06-25 15:21:53', '2025-06-25 15:21:53', NULL),
(1213, 'dacia-duster-428030.jpg', 147, '2025-06-25 15:21:54', '2025-06-25 15:21:54', NULL),
(1214, 'dacia-duster-252656.jpg', 147, '2025-06-25 15:21:54', '2025-06-25 15:21:54', NULL),
(1215, 'dacia-duster-320763.jpg', 147, '2025-06-25 15:21:55', '2025-06-25 15:21:55', NULL),
(1216, 'mercedes-classe-c-436410.jpg', 148, '2025-07-17 15:08:26', '2025-07-17 15:08:26', NULL),
(1217, 'mercedes-classe-c-928660.jpg', 148, '2025-07-17 15:08:27', '2025-07-17 15:08:27', NULL),
(1218, 'mercedes-classe-c-786884.jpg', 148, '2025-07-17 15:08:27', '2025-07-17 15:08:27', NULL),
(1219, 'mercedes-classe-c-476505.jpg', 148, '2025-07-17 15:08:27', '2025-07-17 15:08:27', NULL),
(1220, 'mercedes-classe-c-370590.jpg', 148, '2025-07-17 15:08:28', '2025-07-17 15:08:28', NULL),
(1221, 'mercedes-classe-c-847928.jpg', 148, '2025-07-17 15:08:28', '2025-07-17 15:08:28', NULL),
(1222, 'mercedes-classe-c-816449.jpg', 148, '2025-07-17 15:08:29', '2025-07-17 15:08:29', NULL),
(1223, 'mercedes-classe-c-718408.jpg', 148, '2025-07-17 15:08:29', '2025-07-17 15:08:29', NULL),
(1224, 'mercedes-classe-c-715074.jpg', 148, '2025-07-17 15:08:30', '2025-07-17 15:08:30', NULL),
(1225, 'maserati-levante-129238.jpg', 149, '2025-07-17 15:50:50', '2025-07-17 15:50:50', NULL),
(1226, 'maserati-levante-457591.jpg', 149, '2025-07-17 15:50:50', '2025-07-17 15:50:50', NULL),
(1227, 'maserati-levante-474989.jpg', 149, '2025-07-17 15:50:50', '2025-07-17 15:50:50', NULL),
(1228, 'maserati-levante-544670.jpg', 149, '2025-07-17 15:50:51', '2025-07-17 15:50:51', NULL),
(1229, 'maserati-levante-662698.jpg', 149, '2025-07-17 15:50:51', '2025-07-17 15:50:51', NULL),
(1230, 'maserati-levante-522790.jpg', 149, '2025-07-17 15:50:57', '2025-07-17 15:50:57', NULL),
(1231, 'mercedes-230-178726.jpg', 150, '2025-07-17 16:58:58', '2025-07-17 16:58:58', NULL),
(1232, 'mercedes-230-772722.jpg', 150, '2025-07-17 16:58:58', '2025-07-17 16:58:58', NULL),
(1233, 'mercedes-230-942632.jpg', 150, '2025-07-17 16:58:58', '2025-07-17 16:58:58', NULL),
(1234, 'mercedes-230-436263.jpg', 150, '2025-07-17 16:58:59', '2025-07-17 16:58:59', NULL),
(1235, 'ford-kuga-trend-727648.jpg', 151, '2025-07-19 09:30:32', '2025-07-19 09:30:32', NULL),
(1236, 'ford-kuga-trend-190743.jpg', 151, '2025-07-19 09:30:32', '2025-07-19 09:30:32', NULL),
(1237, 'ford-kuga-trend-433405.jpg', 151, '2025-07-19 09:30:32', '2025-07-19 09:30:32', NULL),
(1238, 'ford-kuga-trend-698341.jpg', 151, '2025-07-19 09:30:33', '2025-07-19 09:30:33', NULL),
(1239, 'ford-kuga-trend-986078.jpg', 151, '2025-07-19 09:30:33', '2025-07-19 09:30:33', NULL),
(1240, 'ford-kuga-trend-209743.jpg', 151, '2025-07-19 09:30:34', '2025-07-19 09:30:49', '2025-07-19 09:30:49'),
(1241, 'ford-kuga-trend-634619.jpg', 151, '2025-07-19 09:30:34', '2025-07-19 09:30:34', NULL),
(1242, 'ford-kuga-trend-339500.jpg', 151, '2025-07-19 09:32:13', '2025-07-19 09:32:13', NULL),
(1243, 'audi-a6-897251.jpg', 152, '2025-07-22 17:59:57', '2025-07-22 17:59:57', NULL),
(1244, 'audi-a6-714677.jpg', 152, '2025-07-22 17:59:57', '2025-07-22 17:59:57', NULL),
(1245, 'audi-a6-534762.jpg', 152, '2025-07-22 17:59:57', '2025-07-22 17:59:57', NULL),
(1246, 'audi-a6-245585.jpg', 152, '2025-07-22 17:59:58', '2025-07-22 17:59:58', NULL),
(1247, 'audi-a6-139481.jpg', 152, '2025-07-22 17:59:58', '2025-07-22 17:59:58', NULL),
(1248, 'audi-a6-497303.jpg', 152, '2025-07-22 17:59:59', '2025-07-22 17:59:59', NULL),
(1249, 'audi-a6-894291.jpg', 152, '2025-07-22 17:59:59', '2025-07-22 17:59:59', NULL),
(1250, 'audi-a6-363369.jpg', 152, '2025-07-22 17:59:59', '2025-07-22 17:59:59', NULL),
(1251, 'audi-a6-438185.jpg', 152, '2025-07-22 18:00:04', '2025-07-22 18:00:04', NULL),
(1252, 'renault-megane-397064.jpg', 153, '2025-08-05 08:59:36', '2025-08-05 08:59:36', NULL),
(1253, 'renault-megane-745515.jpg', 153, '2025-08-05 08:59:37', '2025-08-05 08:59:37', NULL),
(1254, 'renault-megane-631455.jpg', 153, '2025-08-05 08:59:37', '2025-08-05 08:59:37', NULL),
(1255, 'renault-megane-231704.jpg', 153, '2025-08-05 08:59:38', '2025-08-05 08:59:38', NULL),
(1256, 'renault-megane-963665.jpg', 153, '2025-08-05 08:59:38', '2025-08-05 08:59:38', NULL),
(1257, 'renault-megane-499008.jpg', 153, '2025-08-05 08:59:38', '2025-08-05 08:59:38', NULL),
(1258, 'renault-megane-539982.jpg', 153, '2025-08-05 08:59:39', '2025-08-05 08:59:39', NULL),
(1259, 'fiat-500-465323.jpg', 154, '2025-08-19 17:03:27', '2025-08-19 17:03:27', NULL),
(1260, 'fiat-500-976723.jpg', 154, '2025-08-19 17:03:27', '2025-08-19 17:03:27', NULL),
(1261, 'fiat-500-920801.jpg', 154, '2025-08-19 17:03:27', '2025-08-19 17:03:27', NULL),
(1262, 'fiat-500-573415.jpg', 154, '2025-08-19 17:03:28', '2025-08-19 17:03:28', NULL),
(1263, 'fiat-500-831711.jpg', 154, '2025-08-19 17:03:28', '2025-08-19 17:03:28', NULL),
(1264, 'fiat-500-236417.jpg', 154, '2025-08-19 17:03:29', '2025-08-19 17:03:29', NULL),
(1265, 'fiat-500-749813.jpg', 154, '2025-08-19 17:03:31', '2025-08-19 17:03:31', NULL),
(1266, 'bmw-serie-1-sport-193750.jpg', 155, '2025-09-04 16:40:46', '2025-09-04 16:40:46', NULL),
(1267, 'bmw-serie-1-sport-183252.jpg', 155, '2025-09-04 16:40:46', '2025-09-04 16:40:46', NULL),
(1268, 'bmw-serie-1-sport-318250.jpg', 155, '2025-09-04 16:40:47', '2025-09-04 16:40:47', NULL),
(1269, 'bmw-serie-1-sport-970849.jpg', 155, '2025-09-04 16:40:47', '2025-09-04 16:40:47', NULL),
(1270, 'bmw-serie-1-sport-891413.jpg', 155, '2025-09-04 16:40:47', '2025-09-04 16:40:47', NULL),
(1271, 'bmw-serie-1-sport-536886.jpg', 155, '2025-09-04 16:40:48', '2025-09-04 16:40:48', NULL),
(1272, 'bmw-serie-1-sport-248423.jpg', 155, '2025-09-04 16:40:48', '2025-09-04 16:40:48', NULL),
(1273, 'audi-q2-302191.jpg', 156, '2025-09-10 08:17:17', '2025-09-10 08:17:17', NULL),
(1274, 'audi-q2-999178.jpg', 156, '2025-09-10 08:17:17', '2025-09-10 08:17:17', NULL),
(1275, 'audi-q2-750225.jpg', 156, '2025-09-10 08:17:17', '2025-09-10 08:17:17', NULL),
(1276, 'audi-q2-107571.jpg', 156, '2025-09-10 08:17:18', '2025-09-10 08:17:18', NULL),
(1277, 'audi-q2-916735.jpg', 156, '2025-09-10 08:17:18', '2025-09-10 08:17:18', NULL),
(1278, 'audi-q2-137942.jpg', 156, '2025-09-10 08:17:18', '2025-09-10 08:17:18', NULL),
(1279, 'audi-q2-556403.jpg', 156, '2025-09-10 08:17:19', '2025-09-10 08:17:19', NULL),
(1280, 'hyundai-grand-i10-357287.jpg', 158, '2025-09-15 08:46:17', '2025-09-15 08:46:17', NULL),
(1281, 'hyundai-grand-i10-691508.jpg', 158, '2025-09-15 08:46:18', '2025-09-15 08:46:18', NULL),
(1282, 'hyundai-grand-i10-893970.jpg', 158, '2025-09-15 08:46:18', '2025-09-15 08:46:18', NULL),
(1283, 'hyundai-grand-i10-121015.jpg', 158, '2025-09-15 08:46:19', '2025-09-15 08:46:19', NULL),
(1284, 'hyundai-grand-i10-203274.jpg', 158, '2025-09-15 08:46:19', '2025-09-15 08:46:19', NULL),
(1285, 'hyundai-grand-i10-541341.jpg', 158, '2025-09-15 08:46:19', '2025-09-15 08:46:19', NULL),
(1286, 'chery-a5-921364.png', 166, '2025-09-23 11:20:19', '2025-09-23 11:20:19', NULL),
(1287, 'chery-a5-490589.png', 166, '2025-09-23 11:20:40', '2025-09-23 11:20:40', NULL),
(1288, 'chery-a5-719922.png', 166, '2025-09-23 11:21:11', '2025-09-23 11:21:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(125) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_07_111759_create_villes_table', 1),
(6, '2024_01_07_183025_create_brands_table', 1),
(7, '2024_01_07_183137_create_models_table', 1),
(8, '2024_01_07_183319_create_avistext_table', 1),
(9, '2024_01_07_183329_create_avisvideos_table', 1),
(10, '2024_01_07_183349_create_videosads_table', 1),
(11, '2024_01_07_183423_create_imgsliders_table', 1),
(12, '2024_09_05_150931_create_cache_table', 2),
(13, '2024_01_28_151544_create_permission_tables', 3),
(14, '2024_02_28_202413_create_annonces_table', 3),
(15, '2024_02_29_113259_create_media_table', 3),
(16, '2024_04_13_184020_create_ventes_table', 3),
(17, '2024_04_13_184214_create_financements_table', 3),
(18, '2024_04_13_184225_create_offres_table', 3),
(19, '2024_04_13_184618_create_reprises_table', 3),
(21, '2025_06_12_154207_add_status_to_users_table', 3),
(22, '2025_06_13_190817_add_role_to_users_table', 3),
(23, '2025_06_19_213519_create_plans_table', 3),
(24, '2025_07_04_184557_create_entretiens_table', 4),
(25, '2025_06_04_145629_create_clients_table', 5),
(26, '2025_07_07_194505_add_phone_to_clients_table', 6),
(27, '2025_07_12_174335_create_favorites_table', 7),
(28, '2025_07_15_160548_add_is_verified_to_clients_table', 8),
(29, '2025_07_15_161934_add_is_approved_to_clients_table', 9),
(30, '2025_07_17_184438_add_verified_to_annonces_table', 10),
(31, '2025_07_18_165237_create_autoencheres_table', 11),
(32, '2025_07_18_170504_create_accessoires_table', 12),
(33, '2025_07_20_144854_add_pack_to_annonces_table', 13),
(34, '2025_07_20_145237_create_packs_table', 14),
(35, '2025_07_20_145325_add_pack_id_to_annonces_table', 15),
(36, '2025_07_22_194525_create_notifications_table', 16),
(37, '2025_07_22_204816_create_colors_table', 17),
(38, '2025_07_28_172942_create_publications_table', 18),
(39, '2025_07_28_174959_add_placement_to_publications_table', 19),
(40, '2025_07_29_111610_update_placement_enum_in_publications_table', 20),
(41, '2025_07_29_115156_update_placement_enum_in_publications_table', 21),
(42, '2025_08_06_124019_add_featured_position_to_annonces_table', 22),
(43, '2025_08_08_115609_add_homepage_fields_to_annonces_table', 23),
(44, '2025_08_08_121425_add_is_homepage_to_annonces_table', 24),
(45, '2025_08_08_175941_create_financement_settings_table', 25),
(46, '2025_08_09_111146_create_client_types_table', 26),
(47, '2025_09_13_171538_create_nado_auto_encheres_table', 27),
(48, '2025_09_14_204423_add_proposition_and_client_to_nado_auto_encheres_table', 28),
(49, '2025_09_15_182444_create_nado_auto_encheres_bid_table', 29),
(50, '2025_09_17_194112_add_parent_id_to_clients_table', 30);

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip` varchar(125) DEFAULT NULL,
  `user_agent` varchar(125) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`id`, `brand_id`, `name`, `user_id`, `ip`, `user_agent`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 'X4', 1, '81.192.111.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 13:37:29', '2024-02-09 14:16:30', '2024-02-09 14:16:30'),
(2, 4, 'X2', 2, '160.176.97.242', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-06 14:24:53', '2024-02-09 14:16:27', '2024-02-09 14:16:27'),
(3, 4, 'Série 1', 2, '105.157.238.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-09 14:35:58', '2024-02-09 14:35:58', NULL),
(4, 4, 'Série 1 Cabriolet', 2, '105.157.238.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-09 14:36:34', '2024-02-09 14:36:34', NULL),
(5, 4, 'Série 1 Coupé', 2, '105.157.238.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-09 14:36:43', '2024-02-09 14:36:43', NULL),
(6, 4, 'Série 2', 2, '105.157.238.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-09 14:36:52', '2024-02-09 14:36:52', NULL),
(7, 4, 'Série 2 Active Tourer', 2, '105.157.238.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-09 14:36:58', '2024-02-09 14:36:58', NULL),
(8, 4, 'Série 2 Coupé', 2, '105.157.238.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-09 14:38:06', '2024-02-09 14:38:06', NULL),
(9, 4, 'Série 2 Gran Coupé', 2, '105.157.238.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-09 14:38:14', '2024-02-09 14:38:14', NULL),
(10, 4, 'Série 3', 2, '105.157.238.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-09 14:38:20', '2024-02-09 14:38:20', NULL),
(11, 4, 'Série 3 Cabriolet', 2, '105.157.238.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-09 14:38:26', '2024-02-09 14:38:26', NULL),
(12, 4, 'Série 3 Coupé', 2, '105.157.238.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-09 14:38:32', '2024-02-09 14:38:32', NULL),
(13, 4, 'Série 3 GT', 2, '105.157.238.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-09 14:38:47', '2024-02-09 14:38:47', NULL),
(14, 4, 'Série 3 Cabriolet', 2, '105.157.238.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-09 14:38:53', '2024-02-09 14:38:53', NULL),
(15, 4, 'Série 3 Coupé', 2, '105.157.238.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-09 14:39:01', '2024-02-09 14:39:01', NULL),
(16, 4, 'Série 4', 2, '105.157.238.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-09 14:39:15', '2024-02-09 14:39:15', NULL),
(17, 4, 'Série 4 Cabriolet', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:00:02', '2024-02-12 09:00:02', NULL),
(18, 4, 'Série 4 Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:00:10', '2024-02-12 09:00:10', NULL),
(19, 4, 'Série 4 Gran Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:00:19', '2024-02-12 09:00:19', NULL),
(20, 4, 'Série 5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:00:40', '2024-02-12 09:00:40', NULL),
(21, 4, 'Série 5 GT', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:00:56', '2024-02-12 09:00:56', NULL),
(22, 4, 'Série 8', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:01:03', '2024-02-12 09:01:34', '2024-02-12 09:01:34'),
(23, 4, 'Série 5 M2', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:01:22', '2024-02-12 09:01:22', NULL),
(24, 4, 'Série 6', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:01:43', '2024-02-12 09:01:43', NULL),
(25, 4, 'Série 6 Cabriolet', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:01:49', '2024-02-12 09:01:49', NULL),
(26, 4, 'Série 6 Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:01:56', '2024-02-12 09:01:56', NULL),
(27, 4, 'Série 6 Gran Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:02:04', '2024-02-12 09:02:04', NULL),
(28, 4, 'Série 6 GT', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:02:11', '2024-02-12 09:02:11', NULL),
(29, 4, 'Série 7', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:02:18', '2024-02-12 09:02:18', NULL),
(30, 4, 'Série 8', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:02:26', '2024-02-12 09:02:26', NULL),
(31, 4, 'Série 8 Berline', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:02:35', '2024-02-12 09:02:35', NULL),
(32, 4, 'Série 8 Cabriolet', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:02:43', '2024-02-12 09:02:43', NULL),
(33, 4, 'Série 8 Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:02:58', '2024-02-12 09:02:58', NULL),
(34, 4, 'Série 8 Gran Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:03:08', '2024-02-12 09:03:08', NULL),
(35, 4, 'X1', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:03:15', '2024-02-12 09:03:15', NULL),
(36, 4, 'X2', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:03:21', '2024-02-12 09:03:21', NULL),
(37, 4, 'X3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:03:29', '2024-02-12 09:03:29', NULL),
(38, 4, 'X4', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:03:36', '2024-02-12 09:03:36', NULL),
(39, 4, 'X5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:03:44', '2024-02-12 09:03:44', NULL),
(40, 4, 'X5 M', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:03:53', '2024-02-12 09:03:53', NULL),
(41, 4, 'X6', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:04:04', '2024-02-12 09:04:04', NULL),
(42, 4, 'X6 M', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:04:10', '2024-02-12 09:04:10', NULL),
(43, 4, 'X7', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:04:16', '2024-02-12 09:04:16', NULL),
(44, 4, 'Z1', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:04:23', '2024-02-12 09:04:23', NULL),
(45, 4, 'Z3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:04:50', '2024-02-12 09:04:50', NULL),
(46, 4, 'I4', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:05:04', '2024-02-12 09:05:04', NULL),
(47, 4, 'iX', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:05:10', '2024-02-12 09:05:10', NULL),
(48, 4, 'M', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:05:18', '2024-02-12 09:05:18', NULL),
(49, 4, 'I4', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:05:34', '2024-02-12 09:06:12', '2024-02-12 09:06:12'),
(50, 4, 'I4', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:05:50', '2024-02-12 09:06:05', '2024-02-12 09:06:05'),
(51, 4, 'M2', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:06:28', '2024-02-12 09:06:28', NULL),
(52, 4, 'M3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:06:35', '2024-02-12 09:06:35', NULL),
(53, 4, 'M4', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:06:50', '2024-02-12 09:06:50', NULL),
(54, 4, 'M5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:06:57', '2024-02-12 09:06:57', NULL),
(55, 4, 'M6', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:07:08', '2024-02-12 09:07:08', NULL),
(56, 4, 'Cabriolet', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:07:14', '2024-02-12 09:07:14', NULL),
(57, 4, 'Compact', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:07:22', '2024-02-12 09:07:22', NULL),
(58, 46, 'Gol', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:07:43', '2024-02-12 09:07:43', NULL),
(59, 46, 'Golf', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:08:12', '2024-02-12 09:10:06', NULL),
(60, 46, 'Golf 2', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:08:19', '2024-02-12 09:10:23', NULL),
(61, 46, 'Golf 3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:08:26', '2024-02-12 09:10:29', NULL),
(62, 46, 'Golf 4', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:08:32', '2024-02-12 09:10:37', NULL),
(63, 46, 'Golf 5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:08:39', '2024-02-12 09:10:49', NULL),
(64, 46, 'Golf 6', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:08:46', '2024-02-12 09:11:08', NULL),
(65, 46, 'Golf 7', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:08:53', '2024-02-12 09:11:17', NULL),
(66, 46, 'Golf 8', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:08:59', '2024-02-12 09:11:28', NULL),
(67, 46, 'Golf Plus', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:09:15', '2024-02-12 09:11:48', NULL),
(68, 46, 'Thing', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:12:09', '2024-02-12 09:12:41', NULL),
(69, 46, 'Tiguan', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:12:49', '2024-02-12 09:12:49', NULL),
(70, 46, 'Touareg', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:12:58', '2024-02-12 09:12:58', NULL),
(71, 46, 'Touran', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:13:04', '2024-02-12 09:13:04', NULL),
(72, 4, 'Transporter', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:13:10', '2024-02-12 09:13:10', NULL),
(73, 46, 'T-Roc', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:13:17', '2024-02-12 09:13:17', NULL),
(74, 46, 'Amarok', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:13:40', '2024-02-12 09:13:40', NULL),
(75, 46, 'Arteon', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:13:47', '2024-02-12 09:13:47', NULL),
(76, 46, 'Parati', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:13:54', '2024-02-12 09:13:54', NULL),
(77, 46, 'Passat', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:14:01', '2024-02-12 09:14:01', NULL),
(78, 46, 'Passat CC', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:14:07', '2024-02-12 09:14:07', NULL),
(79, 46, 'Phaeton', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:14:13', '2024-02-12 09:14:13', NULL),
(80, 46, 'Polo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:14:20', '2024-02-12 09:14:20', NULL),
(81, 46, 'Polo Sedan', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:14:27', '2024-02-12 09:14:27', NULL),
(82, 46, 'Scirocco', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:14:34', '2024-02-12 09:14:34', NULL),
(83, 46, 'Sharan', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:14:41', '2024-02-12 09:14:41', NULL),
(84, 46, 'I.D.Crozz', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:14:48', '2024-02-12 09:14:48', NULL),
(85, 46, 'Beetle', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:14:54', '2024-02-12 09:14:54', NULL),
(86, 46, 'Bora', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:15:03', '2024-02-12 09:15:03', NULL),
(87, 46, 'Caddy', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:15:09', '2024-02-12 09:15:09', NULL),
(88, 46, 'Caddy Maxi', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:15:15', '2024-02-12 09:15:15', NULL),
(89, 4, 'Caddy Van', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:15:21', '2024-02-12 09:15:21', NULL),
(90, 46, 'Caravelle', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:15:27', '2024-02-12 09:15:27', NULL),
(91, 46, 'CC', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:15:34', '2024-02-12 09:15:34', NULL),
(92, 46, 'Coccinelle', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:15:40', '2024-02-12 09:15:40', NULL),
(93, 46, 'Coccinelle Cabriolet', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:15:46', '2024-02-12 09:15:46', NULL),
(94, 46, 'Combi', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:15:53', '2024-02-12 09:15:53', NULL),
(95, 46, 'Corrado', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:15:59', '2024-02-12 09:15:59', NULL),
(96, 4, 'Crafter', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:16:05', '2024-02-12 09:16:05', NULL),
(97, 46, 'Eos', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:16:11', '2024-02-12 09:16:11', NULL),
(98, 46, 'Fox', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:16:16', '2024-02-12 09:16:16', NULL),
(99, 46, 'Jetta', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:16:23', '2024-02-12 09:16:23', NULL),
(100, 46, 'Karman', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:16:29', '2024-02-12 09:16:29', NULL),
(101, 46, 'LT', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:16:35', '2024-02-12 09:16:35', NULL),
(102, 46, 'Lupo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:16:40', '2024-02-12 09:16:40', NULL),
(103, 46, 'Multivan', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:16:47', '2024-02-12 09:16:47', NULL),
(104, 46, 'New Beetle', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:16:53', '2024-02-12 09:16:53', NULL),
(105, 3, 'A1', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:17:07', '2024-02-12 09:17:07', NULL),
(106, 3, 'A1 Sportback', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:17:14', '2024-02-12 09:17:14', NULL),
(107, 3, 'A2', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:17:28', '2024-02-12 09:17:28', NULL),
(108, 3, 'A3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:17:47', '2024-02-12 09:17:47', NULL),
(109, 3, 'A3 Sportback', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:17:54', '2024-02-12 09:17:54', NULL),
(110, 3, 'A4', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:18:00', '2024-02-12 09:18:00', NULL),
(111, 3, 'A5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:18:07', '2024-02-12 09:18:07', NULL),
(112, 3, 'A5 Sportback', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:18:14', '2024-02-12 09:18:14', NULL),
(113, 3, 'A6', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:18:20', '2024-02-12 09:18:20', NULL),
(114, 3, 'A7', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:18:26', '2024-02-12 09:18:26', NULL),
(115, 3, 'A8', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:18:32', '2024-02-12 09:18:32', NULL),
(116, 3, 'Allroad', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:18:40', '2024-02-12 09:18:40', NULL),
(117, 3, 'Q2', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:19:47', '2024-02-12 09:19:47', NULL),
(118, 3, 'Q3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:19:55', '2024-02-12 09:19:55', NULL),
(119, 3, 'Q3 Sportback', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:20:03', '2024-02-12 09:20:03', NULL),
(120, 3, 'Q5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:20:10', '2024-02-12 09:20:10', NULL),
(121, 3, 'Q5 Sportback', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:20:16', '2024-02-12 09:20:16', NULL),
(122, 3, 'Q7', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:20:22', '2024-02-12 09:20:22', NULL),
(123, 3, 'Q8', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:20:28', '2024-02-12 09:20:28', NULL),
(124, 3, 'R8', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:20:37', '2024-02-12 09:20:37', NULL),
(125, 3, 'RS2', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:20:44', '2024-02-12 09:20:44', NULL),
(126, 3, 'RS3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:20:50', '2024-02-12 09:20:50', NULL),
(127, 3, 'RS4', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:20:57', '2024-02-12 09:20:57', NULL),
(128, 3, 'RS5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:21:06', '2024-02-12 09:21:06', NULL),
(129, 3, 'RS6', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:21:13', '2024-02-12 09:21:13', NULL),
(130, 3, 'RS7', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:21:24', '2024-02-12 09:21:24', NULL),
(131, 3, 'RSQ3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:21:30', '2024-02-12 09:21:30', NULL),
(132, 3, 'RSQ8', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:21:38', '2024-02-12 09:21:38', NULL),
(133, 3, 'S2', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:21:44', '2024-02-12 09:21:44', NULL),
(134, 3, 'S3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:21:50', '2024-02-12 09:21:50', NULL),
(135, 3, 'S4', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:21:56', '2024-02-12 09:21:56', NULL),
(136, 3, 'S5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:22:04', '2024-02-12 09:22:04', NULL),
(137, 3, 'S6', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:22:10', '2024-02-12 09:22:10', NULL),
(138, 3, 'S8', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:22:18', '2024-02-12 09:22:18', NULL),
(139, 3, 'SQ5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:22:26', '2024-02-12 09:22:26', NULL),
(140, 3, 'Coupe', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:22:35', '2024-02-12 09:22:35', NULL),
(141, 3, 'e-tron S line', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:22:43', '2024-02-12 09:22:43', NULL),
(142, 3, '100', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:22:50', '2024-02-12 09:22:50', NULL),
(143, 3, '200', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:22:57', '2024-02-12 09:22:57', NULL),
(144, 3, '80', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:23:06', '2024-02-12 09:23:06', NULL),
(145, 3, '90', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:23:12', '2024-02-12 09:23:12', NULL),
(146, 39, 'Clio', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:23:36', '2024-02-12 09:23:36', NULL),
(147, 39, 'Megane', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:23:42', '2024-02-12 09:23:42', NULL),
(148, 39, 'Megane 3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:23:50', '2024-02-12 09:23:50', NULL),
(149, 39, 'Megane 4', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:24:08', '2024-02-12 09:24:08', NULL),
(150, 39, 'Megane Cabriolet', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:24:15', '2024-02-12 09:24:15', NULL),
(151, 39, 'Megane CC', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:24:21', '2024-02-12 09:24:21', NULL),
(152, 39, 'Megane Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:24:30', '2024-02-12 09:24:30', NULL),
(153, 39, 'Megane Estate', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:24:36', '2024-02-12 09:24:36', NULL),
(154, 39, 'Megane Sedan', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:24:42', '2024-02-12 09:24:42', NULL),
(155, 39, 'Messenger', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:24:47', '2024-02-12 09:24:47', NULL),
(156, 39, 'Microbus', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:24:56', '2024-02-12 09:24:56', NULL),
(157, 39, 'Midlum', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:25:02', '2024-02-12 09:25:02', NULL),
(158, 39, 'Modus', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:25:08', '2024-02-12 09:25:08', NULL),
(159, 39, 'Kadjar', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:25:15', '2024-02-12 09:25:15', NULL),
(160, 39, 'Kangoo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:25:22', '2024-02-12 09:25:22', NULL),
(161, 39, 'Kangoo Express', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:25:28', '2024-02-12 09:25:28', NULL),
(162, 39, 'Kangoo ZE', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:25:33', '2024-02-12 09:25:33', NULL),
(163, 39, 'Koleos', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:25:39', '2024-02-12 09:25:39', NULL),
(164, 39, 'Espace', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:25:45', '2024-02-12 09:25:45', NULL),
(165, 39, 'Captur', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:25:50', '2024-02-12 09:25:50', NULL),
(166, 39, 'Espace', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:25:56', '2024-02-12 09:25:56', NULL),
(167, 39, 'Estafette', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:26:08', '2024-02-12 09:26:08', NULL),
(168, 39, 'Express', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:26:13', '2024-02-12 09:26:13', NULL),
(169, 39, 'Express Van', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:26:19', '2024-02-12 09:26:19', NULL),
(170, 39, 'Fluence', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:26:25', '2024-02-12 09:26:25', NULL),
(171, 39, 'Fuego', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:26:32', '2024-02-12 09:26:32', NULL),
(172, 39, 'Grand Espace', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:26:38', '2024-02-12 09:26:38', NULL),
(173, 39, 'Grand Modus', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:26:44', '2024-02-12 09:26:44', NULL),
(174, 39, 'Grand Scenic', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:26:50', '2024-02-12 09:26:50', NULL),
(175, 39, 'Laguna', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:26:55', '2024-02-12 09:26:55', NULL),
(176, 39, 'Laguna Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:27:02', '2024-02-12 09:27:02', NULL),
(177, 39, 'Laguna Estate', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:27:07', '2024-02-12 09:27:07', NULL),
(178, 39, 'Latitude', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:27:12', '2024-02-12 09:27:12', NULL),
(179, 39, 'Mascott', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:27:18', '2024-02-12 09:27:18', NULL),
(180, 39, 'Master', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:27:25', '2024-02-12 09:27:25', NULL),
(181, 39, 'Master CCB', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:27:31', '2024-02-12 09:27:31', NULL),
(182, 39, 'Nevada', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:27:37', '2024-02-12 09:27:37', NULL),
(183, 39, 'R11', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:27:52', '2024-02-12 09:27:52', NULL),
(184, 39, 'R18', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:27:58', '2024-02-12 09:27:58', NULL),
(185, 39, 'R19', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:28:04', '2024-02-12 09:28:04', NULL),
(186, 39, 'R20', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:28:10', '2024-02-12 09:28:10', NULL),
(187, 39, 'R21', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:28:16', '2024-02-12 09:28:16', NULL),
(188, 39, 'R25', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:28:22', '2024-02-12 09:28:22', NULL),
(189, 39, 'R4', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:28:27', '2024-02-12 09:28:27', NULL),
(190, 39, 'R5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:28:32', '2024-02-12 09:28:32', NULL),
(191, 39, 'R8', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:28:38', '2024-02-12 09:28:38', NULL),
(192, 39, 'R9', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:28:45', '2024-02-12 09:28:45', NULL),
(193, 39, '12', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:28:51', '2024-02-12 09:28:51', NULL),
(194, 39, '14', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:28:57', '2024-02-12 09:28:57', NULL),
(195, 39, '16', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:29:02', '2024-02-12 09:29:02', NULL),
(196, 39, '19', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:29:08', '2024-02-12 09:29:08', NULL),
(197, 39, '30', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:29:15', '2024-02-12 09:29:15', NULL),
(198, 39, 'Arkana', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:29:20', '2024-02-12 09:29:20', NULL),
(199, 39, 'Avantime', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:29:26', '2024-02-12 09:29:26', NULL),
(200, 39, 'B 110', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:29:31', '2024-02-12 09:29:31', NULL),
(201, 39, 'B 120', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:29:37', '2024-02-12 09:29:37', NULL),
(202, 39, 'B 80', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:29:42', '2024-02-12 09:29:42', NULL),
(203, 39, 'Captur', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:29:47', '2024-02-12 09:29:47', NULL),
(204, 39, 'Safrane', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:29:54', '2024-02-12 09:29:54', NULL),
(205, 39, 'Samsung SM3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:30:03', '2024-02-12 09:30:03', NULL),
(206, 39, 'Scenic', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:30:10', '2024-02-12 09:30:10', NULL),
(207, 39, 'Spider', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:30:39', '2024-02-12 09:30:39', NULL),
(208, 39, 'Super 5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:30:44', '2024-02-12 09:30:44', NULL),
(209, 39, 'Symbol', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:30:53', '2024-02-12 09:30:53', NULL),
(210, 39, 'Talisman', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:31:00', '2024-02-12 09:31:00', NULL),
(211, 39, 'Trafic', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:31:05', '2024-02-12 09:31:05', NULL),
(212, 39, 'Twingo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:31:11', '2024-02-12 09:31:11', NULL),
(213, 39, 'Twizy', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:31:16', '2024-02-12 09:31:16', NULL),
(214, 32, 'Classe A', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:32:05', '2024-02-12 09:32:05', NULL),
(215, 32, 'Classe A Berline', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:32:50', '2024-02-12 09:32:50', NULL),
(216, 32, 'Classe B', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:32:59', '2024-02-12 09:32:59', NULL),
(217, 32, 'Classe C', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:33:07', '2024-02-12 09:33:07', NULL),
(218, 32, 'Classe C Cabriolet', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:33:14', '2024-02-12 09:33:14', NULL),
(219, 32, 'Classe C Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:33:22', '2024-02-12 09:33:22', NULL),
(220, 32, 'Classe CL', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:33:30', '2024-02-12 09:33:30', NULL),
(221, 32, 'Classe CLA', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:33:39', '2024-02-12 09:33:39', NULL),
(222, 32, 'Classe CLC', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:33:47', '2024-02-12 09:33:47', NULL),
(223, 32, 'Classe CLK', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:33:55', '2024-02-12 09:33:55', NULL),
(224, 32, 'Classe CLS', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:34:03', '2024-02-12 09:34:03', NULL),
(225, 32, 'Classe E', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:34:10', '2024-02-12 09:34:10', NULL),
(226, 32, 'Classe E Cabriolet', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:34:16', '2024-02-12 09:34:16', NULL),
(227, 32, 'Classe E Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:34:22', '2024-02-12 09:34:22', NULL),
(228, 32, 'Classe G', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:34:34', '2024-02-12 09:34:34', NULL),
(229, 32, 'Classe GL', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:34:40', '2024-02-12 09:34:40', NULL),
(230, 32, 'Classe GLA', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:34:47', '2024-02-12 09:34:47', NULL),
(231, 32, 'Classe GLC', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:34:55', '2024-02-12 09:34:55', NULL),
(232, 32, 'Classe GLC Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:35:04', '2024-02-12 09:35:04', NULL),
(233, 32, 'Classe GLE', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:35:12', '2024-02-12 09:35:12', NULL),
(234, 32, 'Classe GLE Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:35:19', '2024-02-12 09:35:19', NULL),
(235, 32, 'Classe GLK', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:35:28', '2024-02-12 09:35:28', NULL),
(236, 32, 'Classe GLS', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:35:36', '2024-02-12 09:35:36', NULL),
(237, 32, 'Classe M', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:35:44', '2024-02-12 09:35:44', NULL),
(238, 32, 'Classe ML', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:35:52', '2024-02-12 09:35:52', NULL),
(239, 32, 'Classe R', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:35:59', '2024-02-12 09:35:59', NULL),
(240, 32, 'Classe S', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:36:06', '2024-02-12 09:36:06', NULL),
(241, 32, 'Classe S Cabriolet', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:36:14', '2024-02-12 09:36:14', NULL);
INSERT INTO `models` (`id`, `brand_id`, `name`, `user_id`, `ip`, `user_agent`, `created_at`, `updated_at`, `deleted_at`) VALUES
(242, 32, 'Classe S Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:36:22', '2024-02-12 09:36:22', NULL),
(243, 32, 'Classe SL', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:36:29', '2024-02-12 09:36:29', NULL),
(244, 32, 'Classe SLC', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:36:40', '2024-02-12 09:36:40', NULL),
(245, 32, 'Classe SLK', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:36:47', '2024-02-12 09:36:47', NULL),
(246, 32, 'Classe SLR', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:36:54', '2024-02-12 09:36:54', NULL),
(247, 32, 'Classe SLS', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:37:02', '2024-02-12 09:37:02', NULL),
(248, 32, 'Classe V', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:37:08', '2024-02-12 09:37:08', NULL),
(249, 32, 'AMG GT', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:37:15', '2024-02-12 09:37:15', NULL),
(250, 32, 'AMG GT Roadster', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:37:22', '2024-02-12 09:37:22', NULL),
(251, 32, 'Citan', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:37:28', '2024-02-12 09:37:28', NULL),
(252, 32, 'MB', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:37:37', '2024-02-12 09:37:37', NULL),
(253, 32, 'Classe SLS Roadster', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:37:44', '2024-02-12 09:37:44', NULL),
(254, 32, 'Sprinter', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:37:52', '2024-02-12 09:37:52', NULL),
(255, 32, 'Utilitaire', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:37:58', '2024-02-12 09:37:58', NULL),
(256, 32, 'Vaneo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:38:05', '2024-02-12 09:38:05', NULL),
(257, 32, '190', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:38:12', '2024-02-12 09:38:12', NULL),
(258, 32, '207D', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:38:19', '2024-02-12 09:38:19', NULL),
(259, 32, '210', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:38:25', '2024-02-12 09:38:25', NULL),
(260, 32, '210', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:38:26', '2024-02-12 09:38:26', NULL),
(261, 32, '220', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:38:33', '2024-02-12 09:38:33', NULL),
(262, 32, '230', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:38:39', '2024-02-12 09:38:39', NULL),
(263, 32, '240', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:38:45', '2024-02-12 09:38:45', NULL),
(264, 32, '250', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:38:51', '2024-02-12 09:38:51', NULL),
(265, 32, '260', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:39:06', '2024-02-12 09:39:06', NULL),
(266, 32, '270', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:39:12', '2024-02-12 09:39:12', NULL),
(267, 32, '280', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:39:19', '2024-02-12 09:39:19', NULL),
(268, 32, '300', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:39:28', '2024-02-12 09:39:28', NULL),
(269, 32, '310D', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:39:38', '2024-02-12 09:39:38', NULL),
(270, 32, '400', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:39:44', '2024-02-12 09:39:44', NULL),
(271, 32, '408', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:39:51', '2024-02-12 09:39:51', NULL),
(272, 32, '410', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:39:58', '2024-02-12 09:39:58', NULL),
(273, 32, '412', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:40:04', '2024-02-12 09:40:04', NULL),
(274, 32, '560', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:40:10', '2024-02-12 09:40:10', NULL),
(275, 32, '608', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:40:17', '2024-02-12 09:40:17', NULL),
(276, 37, '208', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:40:26', '2024-02-12 09:40:26', NULL),
(277, 37, '204', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:40:41', '2024-02-12 09:40:41', NULL),
(278, 37, '205', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:40:50', '2024-02-12 09:40:50', NULL),
(279, 37, '206', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:40:58', '2024-02-12 09:40:58', NULL),
(280, 37, '206+', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:41:08', '2024-02-12 09:41:08', NULL),
(281, 37, '206 CC', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:41:16', '2024-02-12 09:41:16', NULL),
(282, 37, '206 SW', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:41:22', '2024-02-12 09:41:22', NULL),
(283, 37, '207', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:41:51', '2024-02-12 09:41:51', NULL),
(284, 37, '207 CC', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:41:59', '2024-02-12 09:41:59', NULL),
(285, 37, '207 SW', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:42:06', '2024-02-12 09:42:06', NULL),
(286, 37, '3008', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:42:14', '2024-02-12 09:42:14', NULL),
(287, 37, '301', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:42:22', '2024-02-12 09:42:22', NULL),
(288, 37, '304', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:42:30', '2024-02-12 09:42:30', NULL),
(289, 37, '305', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:42:50', '2024-02-12 09:42:50', NULL),
(290, 37, '306', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:42:59', '2024-02-12 09:42:59', NULL),
(291, 37, '307', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:43:05', '2024-02-12 09:43:05', NULL),
(292, 37, '307 CC', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:43:13', '2024-02-12 09:43:13', NULL),
(293, 37, '307 SW', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:43:19', '2024-02-12 09:43:19', NULL),
(294, 37, '308', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:43:25', '2024-02-12 09:43:25', NULL),
(295, 37, '308 CC', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:43:34', '2024-02-12 09:43:34', NULL),
(296, 37, '308 SW', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:43:41', '2024-02-12 09:43:41', NULL),
(297, 37, '309', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:45:28', '2024-02-12 09:45:28', NULL),
(298, 37, '4007', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:45:34', '2024-02-12 09:45:34', NULL),
(299, 37, '4008', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:45:40', '2024-02-12 09:45:40', NULL),
(300, 37, '403', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:45:46', '2024-02-12 09:45:46', NULL),
(301, 37, '404', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:45:51', '2024-02-12 09:45:51', NULL),
(302, 37, '405', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:45:58', '2024-02-12 09:45:58', NULL),
(303, 37, '406', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:46:05', '2024-02-12 09:46:05', NULL),
(304, 37, '406 Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:46:11', '2024-02-12 09:46:11', NULL),
(305, 37, '407', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:46:44', '2024-02-12 09:46:44', NULL),
(306, 37, '407 Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:47:35', '2024-02-12 09:47:35', NULL),
(307, 37, '407 SW', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:47:40', '2024-02-12 09:47:40', NULL),
(308, 37, '1007', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:47:46', '2024-02-12 09:47:46', NULL),
(309, 37, '104', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:47:51', '2024-02-12 09:47:51', NULL),
(310, 37, '106', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:47:58', '2024-02-12 09:47:58', NULL),
(311, 37, '107', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:48:04', '2024-02-12 09:48:04', NULL),
(312, 37, '108', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:48:11', '2024-02-12 09:48:11', NULL),
(313, 37, '2008', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:48:16', '2024-02-12 09:48:16', NULL),
(314, 37, '3008', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:48:22', '2024-02-12 09:48:22', NULL),
(315, 37, '5008', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:48:28', '2024-02-12 09:48:28', NULL),
(316, 37, '504', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:48:53', '2024-02-12 09:48:53', NULL),
(317, 37, '505', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:49:00', '2024-02-12 09:49:00', NULL),
(318, 37, '506', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:49:05', '2024-02-12 09:49:05', NULL),
(319, 37, '507', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:49:32', '2024-02-12 09:49:32', NULL),
(320, 37, '508', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:49:39', '2024-02-12 09:49:39', NULL),
(321, 37, '604', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:49:45', '2024-02-12 09:49:45', NULL),
(322, 37, '605', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:49:51', '2024-02-12 09:49:51', NULL),
(323, 37, '607', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:49:57', '2024-02-12 09:49:57', NULL),
(324, 37, '806', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:50:02', '2024-02-12 09:50:02', NULL),
(325, 37, '807', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:50:09', '2024-02-12 09:50:09', NULL),
(326, 37, 'Bipper', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:50:15', '2024-02-12 09:50:15', NULL),
(327, 37, 'Boxer', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:50:21', '2024-02-12 09:50:21', NULL),
(328, 37, 'Expert', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:50:27', '2024-02-12 09:50:27', NULL),
(329, 37, 'J5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:50:32', '2024-02-12 09:50:32', NULL),
(330, 37, 'J9', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:50:38', '2024-02-12 09:50:38', NULL),
(331, 37, 'Landtrek', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:50:43', '2024-02-12 09:50:43', NULL),
(332, 37, 'Partner', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:50:49', '2024-02-12 09:50:49', NULL),
(333, 37, 'RCZ', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:50:55', '2024-02-12 09:50:55', NULL),
(334, 37, 'Rifter', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:51:00', '2024-02-12 09:51:00', NULL),
(335, 27, 'Range Rover', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:51:35', '2024-02-12 09:51:35', NULL),
(336, 27, 'Range Rover Sport', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:51:45', '2024-02-12 09:51:45', NULL),
(337, 27, 'Evoque', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:51:54', '2024-10-24 13:54:37', NULL),
(338, 27, 'Defender', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:52:01', '2024-02-12 09:52:01', NULL),
(339, 27, 'Discovery', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:52:07', '2024-02-12 09:52:07', NULL),
(340, 27, 'Discovery Sport', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:52:14', '2024-02-12 09:52:14', NULL),
(341, 27, 'Freelander', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:52:20', '2024-02-12 09:52:20', NULL),
(342, 27, 'Cabriolet', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:52:26', '2024-02-12 09:52:26', NULL),
(343, 27, 'Range Rover Vogue', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:52:33', '2024-02-12 09:52:33', NULL),
(344, 27, 'Velar', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:52:39', '2024-02-12 09:52:39', NULL),
(345, 21, 'Accent', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:52:51', '2024-02-12 09:52:51', NULL),
(346, 21, 'Tucson', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:52:58', '2024-02-12 09:52:58', NULL),
(347, 21, 'Creta', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:53:04', '2024-02-12 09:53:04', NULL),
(348, 21, 'I 10', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:53:10', '2024-02-12 09:53:10', NULL),
(349, 21, 'I 20', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:53:19', '2024-02-12 09:53:19', NULL),
(350, 21, 'I 30', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:53:30', '2024-02-12 09:53:30', NULL),
(351, 21, 'I 40', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:53:37', '2024-02-12 09:53:37', NULL),
(352, 21, 'Ioniq Hybrid', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:53:43', '2024-02-12 09:53:43', NULL),
(353, 21, 'Ix 35', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:53:50', '2024-02-12 09:53:50', NULL),
(354, 21, 'Ix 55', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:53:56', '2024-02-12 09:53:56', NULL),
(355, 21, 'Atos', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:54:02', '2024-02-12 09:54:02', NULL),
(356, 21, 'Atos Prime', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:54:12', '2024-02-12 09:54:12', NULL),
(357, 21, 'Azera', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:54:17', '2024-02-12 09:54:17', NULL),
(358, 21, 'Centennial', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:54:24', '2024-02-12 09:54:24', NULL),
(359, 21, 'County', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:54:30', '2024-02-12 09:54:30', NULL),
(360, 21, 'Coupe', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:54:35', '2024-02-12 09:54:35', NULL),
(361, 21, 'Elantra', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:54:42', '2024-02-12 09:54:42', NULL),
(362, 21, 'Excel', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:54:47', '2024-02-12 09:54:47', NULL),
(363, 21, 'Galloper', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:54:54', '2024-02-12 09:54:54', NULL),
(364, 21, 'Genesis', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:55:00', '2024-02-12 09:55:00', NULL),
(365, 21, 'Genesis Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:55:06', '2024-02-12 09:55:06', NULL),
(366, 21, 'Getz', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:55:12', '2024-02-12 09:55:12', NULL),
(367, 21, 'Grandeur', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:55:17', '2024-02-12 09:55:17', NULL),
(368, 21, 'Grand i10', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:55:23', '2024-02-12 09:55:23', NULL),
(369, 21, 'Grand Santa Fe', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:55:31', '2024-02-12 09:55:31', NULL),
(370, 21, 'H', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:55:38', '2024-02-12 09:55:38', NULL),
(371, 21, 'H-1', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:55:47', '2024-02-12 09:55:47', NULL),
(372, 21, 'H-100', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:55:53', '2024-02-12 09:55:53', NULL),
(373, 21, 'H-200', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:55:59', '2024-02-12 09:55:59', NULL),
(374, 21, 'Kona', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:56:05', '2024-02-12 09:56:05', NULL),
(375, 21, 'Lantra', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:56:12', '2024-02-12 09:56:12', NULL),
(376, 21, 'Matrix', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:56:18', '2024-02-12 09:56:18', NULL),
(377, 21, 'Pony', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:56:24', '2024-02-12 09:56:24', NULL),
(378, 21, 'Santa Fe', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:56:30', '2024-02-12 09:56:30', NULL),
(379, 21, 'Santamo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:56:36', '2024-02-12 09:56:36', NULL),
(380, 21, 'Satellite', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:56:41', '2024-02-12 09:56:41', NULL),
(381, 21, 'Sonata', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:56:48', '2024-02-12 09:56:48', NULL),
(382, 21, 'Sonica', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:56:57', '2024-02-12 09:56:57', NULL),
(383, 21, 'Terracan', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:57:08', '2024-02-12 09:57:08', NULL),
(384, 21, 'Trajet', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:57:15', '2024-02-12 09:57:15', NULL),
(385, 21, 'Veloster', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:57:24', '2024-02-12 09:57:24', NULL),
(386, 24, 'Renegade', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:57:34', '2024-02-12 09:57:34', NULL),
(387, 24, 'Wrangler', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:57:41', '2024-02-12 09:57:41', NULL),
(388, 24, 'Cherokee', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:57:47', '2024-02-12 09:57:47', NULL),
(389, 24, 'Grand Cherokee', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:57:52', '2024-02-12 09:57:52', NULL),
(390, 24, 'Grand cherokee overland', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:57:58', '2024-02-12 09:57:58', NULL),
(391, 24, 'Jeep limited', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:58:04', '2024-02-12 09:58:04', NULL),
(392, 24, 'CJ 5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:58:14', '2024-02-12 09:58:14', NULL),
(393, 24, 'Commander', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:58:20', '2024-02-12 09:58:20', NULL),
(394, 24, 'Compass', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:58:31', '2024-02-12 09:58:31', NULL),
(395, 21, 'Dallas', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:58:43', '2024-02-12 09:58:43', NULL),
(396, 21, 'Kaisser', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:58:52', '2024-02-12 09:58:52', NULL),
(397, 21, 'Liberty', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:59:01', '2024-02-12 09:59:01', NULL),
(398, 21, 'M151 Mutt', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:59:08', '2024-02-12 09:59:08', NULL),
(399, 21, 'Patriot', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:59:14', '2024-02-12 09:59:14', NULL),
(400, 35, 'Qashqai', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:59:51', '2024-02-12 09:59:51', NULL),
(401, 35, 'Micra', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 09:59:58', '2024-02-12 09:59:58', NULL),
(402, 35, 'Almera', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:00:05', '2024-02-12 10:00:05', NULL),
(403, 35, 'Altima', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:00:12', '2024-02-12 10:00:12', NULL),
(404, 35, 'Bluebird', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:00:40', '2024-02-12 10:00:40', NULL),
(405, 35, 'Cabstar', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:00:49', '2024-02-12 10:00:49', NULL),
(406, 35, 'Evalia', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:01:17', '2024-02-12 10:01:17', NULL),
(407, 35, 'GTR', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:01:26', '2024-02-12 10:01:26', NULL),
(408, 35, 'Infiniti', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:01:33', '2024-02-12 10:01:33', NULL),
(409, 35, 'Juke', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:01:40', '2024-02-12 10:01:40', NULL),
(410, 35, 'King Cab', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:01:46', '2024-02-12 10:01:46', NULL),
(411, 35, 'King Double Cab', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:01:52', '2024-02-12 10:01:52', NULL),
(412, 35, 'Kubistar', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:01:59', '2024-02-12 10:01:59', NULL),
(413, 35, 'Maxima', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:02:05', '2024-02-12 10:02:05', NULL),
(414, 35, 'Murano', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:02:11', '2024-02-12 10:02:11', NULL),
(415, 35, 'Navara', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:02:16', '2024-02-12 10:02:16', NULL),
(416, 35, 'Note', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:02:34', '2024-02-12 10:02:34', NULL),
(417, 35, 'Pathfinder', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:02:40', '2024-02-12 10:02:40', NULL),
(418, 35, 'Patrol', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:02:46', '2024-02-12 10:02:46', NULL),
(419, 35, 'Patrol GR', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:02:52', '2024-02-12 10:02:52', NULL),
(420, 35, 'Pick up', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:02:58', '2024-02-12 10:02:58', NULL),
(421, 35, 'Prairie', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:03:04', '2024-02-12 10:03:04', NULL),
(422, 35, 'Primastar', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:03:09', '2024-02-12 10:03:09', NULL),
(423, 35, 'Primera', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:03:15', '2024-02-12 10:03:15', NULL),
(424, 35, 'Rogue', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:03:21', '2024-02-12 10:03:21', NULL),
(425, 35, 'Serena', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:03:27', '2024-02-12 10:03:27', NULL),
(426, 35, 'Sunny', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:03:33', '2024-02-12 10:03:33', NULL),
(427, 35, 'Terrano', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:03:40', '2024-02-12 10:03:40', NULL),
(428, 35, 'Tiida', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:03:46', '2024-02-12 10:03:46', NULL),
(429, 35, 'Tino', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:03:51', '2024-02-12 10:03:51', NULL),
(430, 35, 'Trade', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:03:58', '2024-02-12 10:03:58', NULL),
(431, 35, 'Urvan', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:04:04', '2024-02-12 10:04:04', NULL),
(432, 35, 'Vanette', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:04:10', '2024-02-12 10:04:10', NULL),
(433, 35, '280', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:04:15', '2024-02-12 10:04:15', NULL),
(434, 35, '300', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:04:21', '2024-02-12 10:04:21', NULL),
(435, 35, '350 Z', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:04:27', '2024-02-12 10:04:27', NULL),
(436, 35, '370 Z', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:04:34', '2024-02-12 10:04:34', NULL),
(437, 16, 'Fiesta', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:04:53', '2024-02-12 10:04:53', NULL),
(438, 16, 'Focus', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:04:58', '2024-02-12 10:04:58', NULL),
(439, 16, 'Focus C-Max', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:05:04', '2024-02-12 10:05:04', NULL),
(440, 16, 'Fusion', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:05:13', '2024-02-12 10:05:13', NULL),
(441, 16, 'Fusion Berline', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:05:19', '2024-02-12 10:05:19', NULL),
(442, 16, 'Cougar', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:05:25', '2024-02-12 10:05:25', NULL),
(443, 16, 'Kuga', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:05:31', '2024-02-12 10:05:31', NULL),
(444, 16, 'kuga trend', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:05:37', '2024-02-12 10:05:37', NULL),
(445, 16, 'kuga trend plus', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:05:42', '2024-02-12 10:05:42', NULL),
(446, 16, 'kuga titanium', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:05:48', '2024-02-12 10:05:48', NULL),
(447, 16, 'Bedford', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:05:54', '2024-02-12 10:05:54', NULL),
(448, 16, 'B-Max', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:06:01', '2024-02-12 10:06:01', NULL),
(449, 16, 'Capri', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:06:06', '2024-02-12 10:06:06', NULL),
(450, 16, 'C-Max', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:06:16', '2024-02-12 10:06:16', NULL),
(451, 16, 'Connect', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:06:24', '2024-02-12 10:06:24', NULL),
(452, 16, 'Courrier', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:06:31', '2024-02-12 10:06:31', NULL),
(453, 16, 'Crown Victoria', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:06:36', '2024-02-12 10:06:36', NULL),
(454, 16, 'Ecosport', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:06:42', '2024-02-12 10:06:42', NULL),
(455, 16, 'Edge', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:06:48', '2024-02-12 10:06:48', NULL),
(456, 16, 'Escape', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:06:54', '2024-02-12 10:06:54', NULL),
(457, 16, 'Escort', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:06:59', '2024-02-12 10:06:59', NULL),
(458, 16, 'Everest', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:07:06', '2024-02-12 10:07:06', NULL),
(459, 16, 'Excursion', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:07:12', '2024-02-12 10:07:12', NULL),
(460, 16, 'Expedition', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:07:17', '2024-02-12 10:07:17', NULL),
(461, 16, 'Explorer', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:07:23', '2024-02-12 10:07:23', NULL),
(462, 16, 'F150', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:07:30', '2024-02-12 10:07:30', NULL),
(463, 16, 'F250', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:07:36', '2024-02-12 10:07:36', NULL),
(464, 16, 'F350', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:07:41', '2024-02-12 10:07:41', NULL),
(465, 16, 'Galaxy', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:07:46', '2024-02-12 10:07:46', NULL),
(466, 16, 'Grand C-Max', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:07:56', '2024-02-12 10:07:56', NULL),
(467, 16, 'GT', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:08:03', '2024-02-12 10:08:03', NULL),
(468, 16, 'Ka', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:08:10', '2024-02-12 10:08:10', NULL),
(469, 16, 'Maverick', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:08:17', '2024-02-12 10:08:17', NULL),
(470, 16, 'Minibus', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:08:23', '2024-02-12 10:08:23', NULL),
(471, 16, 'Mondeo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:08:32', '2024-02-12 10:08:32', NULL),
(472, 16, 'Mustang Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:08:44', '2024-02-12 10:08:44', NULL),
(473, 16, 'Mustang Cabriolet', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:08:50', '2024-02-12 10:08:50', NULL),
(474, 16, 'Orion', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:08:56', '2024-02-12 10:08:56', NULL),
(475, 16, 'Probe', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:09:03', '2024-02-12 10:09:03', NULL),
(476, 16, 'Puma', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:09:08', '2024-02-12 10:09:08', NULL),
(477, 16, 'Ranger', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:09:16', '2024-02-12 10:09:16', NULL),
(478, 16, 'Scorpio', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:09:23', '2024-02-12 10:09:23', NULL),
(479, 16, 'Sierra', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:09:29', '2024-02-12 10:09:29', NULL),
(480, 16, 'S-Max', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:09:35', '2024-02-12 10:09:35', NULL),
(481, 16, 'Street Ka', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:09:45', '2024-02-12 10:09:45', NULL),
(482, 16, 'Super Duty', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:09:52', '2024-02-12 10:09:52', NULL);
INSERT INTO `models` (`id`, `brand_id`, `name`, `user_id`, `ip`, `user_agent`, `created_at`, `updated_at`, `deleted_at`) VALUES
(483, 16, 'Thunderbird', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:09:59', '2024-02-12 10:09:59', NULL),
(484, 16, 'TM', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:10:14', '2024-02-12 10:10:14', NULL),
(485, 16, 'Tourneo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:10:25', '2024-02-12 10:10:25', NULL),
(486, 16, 'Tourneo Connect', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:10:34', '2024-02-12 10:10:34', NULL),
(487, 41, 'Octavia', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:11:01', '2024-02-12 10:11:01', NULL),
(488, 41, 'Superb', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:11:07', '2024-02-12 10:11:07', NULL),
(489, 41, 'Fabia', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:11:13', '2024-02-12 10:11:13', NULL),
(490, 41, 'Favorit', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:11:18', '2024-02-12 10:11:18', NULL),
(491, 41, 'Felicia', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:11:25', '2024-02-12 10:11:25', NULL),
(492, 41, 'Kamiq', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:11:31', '2024-02-12 10:11:31', NULL),
(493, 41, 'Karoq', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:12:17', '2024-02-12 10:12:17', NULL),
(494, 41, 'Kodiaq', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:13:36', '2024-02-12 10:13:36', NULL),
(495, 41, 'Rapid', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:13:43', '2024-02-12 10:13:43', NULL),
(496, 41, 'Roomster', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:13:49', '2024-02-12 10:13:49', NULL),
(497, 41, 'Scala', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:13:55', '2024-02-12 10:13:55', NULL),
(498, 41, 'Yeti', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:14:01', '2024-02-12 10:14:01', NULL),
(499, 40, 'Ateca', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:14:07', '2024-02-12 10:14:07', NULL),
(500, 40, 'Alhambra', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:14:13', '2024-02-12 10:14:13', NULL),
(501, 40, 'Altea', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:14:18', '2024-02-12 10:14:18', NULL),
(502, 40, 'Altea XL', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:14:25', '2024-02-12 10:14:25', NULL),
(503, 40, 'Arona', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:14:52', '2024-02-12 10:14:52', NULL),
(504, 40, 'Arosa', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:14:59', '2024-02-12 10:14:59', NULL),
(505, 40, 'Cordoba', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:15:05', '2024-02-12 10:15:05', NULL),
(506, 40, 'Exeo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:15:10', '2024-02-12 10:15:10', NULL),
(507, 40, 'Ibiza', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:15:15', '2024-02-12 10:15:15', NULL),
(508, 40, 'Inca', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:15:20', '2024-02-12 10:15:20', NULL),
(509, 40, 'Leon', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:15:25', '2024-02-12 10:15:25', NULL),
(510, 40, 'Leon ST', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:15:31', '2024-02-12 10:15:31', NULL),
(511, 40, 'Malaga', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:15:36', '2024-02-12 10:15:36', NULL),
(512, 40, 'Marbella', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:15:41', '2024-02-12 10:15:41', NULL),
(513, 40, 'Mii', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:15:46', '2024-02-12 10:15:46', NULL),
(514, 40, 'Tarraco', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:15:51', '2024-02-12 10:15:51', NULL),
(515, 15, 'Tipo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:16:00', '2024-02-12 10:16:00', NULL),
(516, 15, 'Tipo Hatchback', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:16:07', '2024-02-12 10:16:07', NULL),
(517, 15, 'Doblo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:16:17', '2024-02-12 10:16:17', NULL),
(518, 15, 'Doblo Classic', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:16:26', '2024-02-12 10:16:26', NULL),
(519, 15, 'Doblo Panorama', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:16:32', '2024-02-12 10:16:32', NULL),
(520, 15, 'Ducato', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:16:38', '2024-02-12 10:16:38', NULL),
(521, 15, '126', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:17:05', '2024-02-12 10:17:05', NULL),
(522, 15, '127', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:17:12', '2024-02-12 10:17:12', NULL),
(523, 15, '131', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:17:18', '2024-02-12 10:17:18', NULL),
(524, 15, '500', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:17:24', '2024-02-12 10:17:24', NULL),
(525, 15, '500 C', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:18:16', '2024-02-12 10:18:16', NULL),
(526, 15, '500 L', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:18:24', '2024-02-12 10:18:24', NULL),
(527, 15, '500 L Living', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:18:30', '2024-02-12 10:18:30', NULL),
(528, 15, '500 X', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:18:37', '2024-02-12 10:18:37', NULL),
(529, 15, 'Albea', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:18:42', '2024-02-12 10:18:42', NULL),
(530, 15, 'Barchetta', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:18:49', '2024-02-12 10:18:49', NULL),
(531, 15, 'Bertone', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:18:55', '2024-02-12 10:18:55', NULL),
(532, 15, 'Brava', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:19:06', '2024-02-12 10:19:06', NULL),
(533, 15, 'Bravo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:19:12', '2024-02-12 10:19:12', NULL),
(534, 15, 'Burstner', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:19:17', '2024-02-12 10:19:17', NULL),
(535, 15, 'CinqueCento', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:19:23', '2024-02-12 10:19:23', NULL),
(536, 15, 'Croma', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:19:30', '2024-02-12 10:19:30', NULL),
(537, 15, 'Fiorino', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:20:52', '2024-02-12 10:20:52', NULL),
(538, 15, 'Fiorino Cargo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:20:58', '2024-02-12 10:20:58', NULL),
(539, 15, 'Freemont', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:21:03', '2024-02-12 10:21:03', NULL),
(540, 15, 'Fullback', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:21:08', '2024-02-12 10:21:08', NULL),
(541, 15, 'Grande Punto', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:21:14', '2024-02-12 10:21:14', NULL),
(542, 15, 'Idea', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:21:19', '2024-02-12 10:21:19', NULL),
(543, 15, 'Linea', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:21:24', '2024-02-12 10:21:24', NULL),
(544, 15, 'Marea', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:21:30', '2024-02-12 10:21:30', NULL),
(545, 15, 'Multipla', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:21:34', '2024-02-12 10:21:34', NULL),
(546, 15, 'Palio', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:21:40', '2024-02-12 10:21:40', NULL),
(547, 15, 'Panda', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:21:47', '2024-02-12 10:21:47', NULL),
(548, 15, 'Punto', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:21:53', '2024-02-12 10:21:53', NULL),
(549, 15, 'Punto Classic', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:21:59', '2024-02-12 10:21:59', NULL),
(550, 15, 'Regata', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:22:04', '2024-02-12 10:22:04', NULL),
(551, 15, 'Ritmo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:22:09', '2024-02-12 10:22:09', NULL),
(552, 15, 'Scudo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:22:14', '2024-02-12 10:22:14', NULL),
(553, 15, 'Sedici', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:22:20', '2024-02-12 10:22:20', NULL),
(554, 15, 'SeiCento', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:22:25', '2024-02-12 10:22:25', NULL),
(555, 15, 'Siena', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:22:30', '2024-02-12 10:22:30', NULL),
(556, 15, 'Stilo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:22:35', '2024-02-12 10:22:35', NULL),
(557, 15, 'Talento', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:22:41', '2024-02-12 10:22:41', NULL),
(558, 15, 'Tempra', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:22:46', '2024-02-12 10:22:46', NULL),
(559, 14, 'DS', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:22:56', '2024-02-12 10:22:56', NULL),
(560, 14, 'DS 3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:23:04', '2024-02-12 10:23:04', NULL),
(561, 14, 'DS 3 Cabriolet', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:23:11', '2024-02-12 10:23:11', NULL),
(562, 14, 'DS 3 Crossback', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:23:17', '2024-02-12 10:23:17', NULL),
(563, 14, 'DS 4', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:23:25', '2024-02-12 10:23:25', NULL),
(564, 14, 'DS 4 Crossback', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:23:31', '2024-02-12 10:23:31', NULL),
(565, 14, 'DS 4S', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:23:38', '2024-02-12 10:23:38', NULL),
(566, 14, 'DS 5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:23:45', '2024-02-12 10:23:45', NULL),
(567, 14, 'DS 5 LS', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:23:52', '2024-02-12 10:23:52', NULL),
(568, 14, 'DS 6', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:23:59', '2024-02-12 10:23:59', NULL),
(569, 14, 'DS 7 Crossback', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:24:07', '2024-02-12 10:24:07', NULL),
(570, 14, 'DS 9', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:24:15', '2024-02-12 10:24:15', NULL),
(571, 10, 'Sandero', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:24:24', '2024-02-12 10:24:24', NULL),
(572, 10, 'Sandero Stepway', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:24:29', '2024-02-12 10:24:29', NULL),
(573, 10, 'Sandero Streetway', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:24:34', '2024-02-12 10:24:34', NULL),
(574, 10, 'Solenza', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:24:40', '2024-02-12 10:24:40', NULL),
(575, 10, 'Spring', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:24:44', '2024-02-12 10:24:44', NULL),
(576, 10, 'Dokker', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:24:50', '2024-02-12 10:24:50', NULL),
(577, 10, 'Dokker Van', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:24:55', '2024-02-12 10:24:55', NULL),
(578, 10, 'Duster', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:25:01', '2024-02-12 10:25:01', NULL),
(579, 10, 'Lodgy', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:25:06', '2024-02-12 10:25:06', NULL),
(580, 10, 'Logan', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:25:12', '2024-02-12 10:25:12', NULL),
(581, 10, 'Logan MCV', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:25:18', '2024-02-12 10:25:18', NULL),
(582, 10, 'Pick-Up', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:25:24', '2024-02-12 10:25:24', NULL),
(583, 10, 'Pick-Up Double Cab', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:25:29', '2024-02-12 10:25:29', NULL),
(584, 36, 'Adam', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:25:50', '2024-02-12 10:25:50', NULL),
(585, 36, 'Adam Rocks', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:25:58', '2024-02-12 10:25:58', NULL),
(586, 36, 'Agila', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:26:03', '2024-02-12 10:26:03', NULL),
(587, 36, 'Antara', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:36:14', '2024-02-12 10:36:14', NULL),
(588, 36, 'Ascona', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:36:20', '2024-02-12 10:36:20', NULL),
(589, 36, 'Astra', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:36:26', '2024-02-12 10:36:26', NULL),
(590, 36, 'Calibra', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:36:33', '2024-02-12 10:36:33', NULL),
(591, 36, 'Campo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:36:38', '2024-02-12 10:36:38', NULL),
(592, 36, 'Combo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:37:31', '2024-02-12 10:37:31', NULL),
(593, 36, 'Combo Cargo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:38:17', '2024-02-12 10:38:17', NULL),
(594, 36, 'Combo Life', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:38:31', '2024-02-12 10:38:31', NULL),
(595, 36, 'Corsa', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:38:37', '2024-02-12 10:38:37', NULL),
(596, 36, 'Crossland X', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:38:43', '2024-02-12 10:38:43', NULL),
(597, 36, 'Frontera', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:38:49', '2024-02-12 10:38:49', NULL),
(598, 36, 'Grandland X', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:38:55', '2024-02-12 10:39:09', NULL),
(599, 36, 'GT', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:39:16', '2024-02-12 10:39:16', NULL),
(600, 36, 'Insignia', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:39:22', '2024-02-12 10:39:22', NULL),
(601, 36, 'Insignia Grand Sport', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:39:27', '2024-02-12 10:39:27', NULL),
(602, 36, 'Kadett', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:39:32', '2024-02-12 10:39:32', NULL),
(603, 36, 'Meriva', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:39:37', '2024-02-12 10:39:37', NULL),
(604, 36, 'Mokka', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:39:43', '2024-02-12 10:39:43', NULL),
(605, 36, 'Monterey', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:39:48', '2024-02-12 10:39:48', NULL),
(606, 36, 'Movano', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:39:54', '2024-02-12 10:39:54', NULL),
(607, 36, 'Omega', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:40:00', '2024-02-12 10:40:00', NULL),
(608, 36, 'Rekord', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:40:07', '2024-02-12 10:40:07', NULL),
(609, 36, 'Signum', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:40:12', '2024-02-12 10:40:12', NULL),
(610, 36, 'Sintra', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:40:18', '2024-02-12 10:40:18', NULL),
(611, 36, 'Speedster', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:40:24', '2024-02-12 10:40:24', NULL),
(612, 36, 'Tigra', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:40:30', '2024-02-12 10:40:30', NULL),
(613, 36, 'Vectra', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:40:36', '2024-02-12 10:40:36', NULL),
(614, 19, 'Accord', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:40:46', '2024-02-12 10:40:46', NULL),
(615, 19, 'Acty', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:40:53', '2024-02-12 10:40:53', NULL),
(616, 19, 'Aerodeck', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:40:58', '2024-02-12 10:40:58', NULL),
(617, 19, 'Boss', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:41:04', '2024-02-12 10:41:04', NULL),
(618, 19, 'City', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:41:12', '2024-02-12 10:41:12', NULL),
(619, 19, 'Civic', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:41:18', '2024-02-12 10:41:18', NULL),
(620, 19, 'Civic Berline', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:41:23', '2024-02-12 10:41:23', NULL),
(621, 19, 'Civic Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:41:30', '2024-02-12 10:41:30', NULL),
(622, 19, 'Civic Tourer', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:41:35', '2024-02-12 10:41:35', NULL),
(623, 19, 'Concerto', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:41:40', '2024-02-12 10:41:40', NULL),
(624, 19, 'CR-V', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:41:45', '2024-02-12 10:41:45', NULL),
(625, 19, 'CR-X', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 10:41:52', '2024-02-12 10:41:52', NULL),
(626, 19, 'FR-V', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:01:12', '2024-02-12 11:01:12', NULL),
(627, 19, 'HR-V', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:25:54', '2024-02-12 11:25:54', NULL),
(628, 19, 'Insight', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:25:59', '2024-02-12 11:25:59', NULL),
(629, 19, 'Integra', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:26:11', '2024-02-12 11:26:11', NULL),
(630, 19, 'Jazz', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:26:41', '2024-02-12 11:26:41', NULL),
(631, 19, 'Legend', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:26:47', '2024-02-12 11:26:47', NULL),
(632, 19, 'Logo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:26:54', '2024-02-12 11:26:54', NULL),
(633, 19, 'NSX', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:27:00', '2024-02-12 11:27:00', NULL),
(634, 19, 'Odyssey', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:27:07', '2024-02-12 11:27:07', NULL),
(635, 19, 'Prelude', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:27:13', '2024-02-12 11:27:13', NULL),
(636, 19, 'S 2000', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:27:19', '2024-02-12 11:27:19', NULL),
(637, 19, 'Shuttle', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:27:25', '2024-02-12 11:27:25', NULL),
(638, 47, 'C30', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:28:13', '2024-02-12 11:28:13', NULL),
(639, 47, 'C70', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:28:20', '2024-02-12 11:28:20', NULL),
(640, 47, 'S40', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:28:29', '2024-02-12 11:28:29', NULL),
(641, 47, 'S60', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:29:03', '2024-02-12 11:29:03', NULL),
(642, 47, 'S60', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:29:03', '2024-02-12 11:29:03', NULL),
(643, 47, 'S80', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:29:10', '2024-02-12 11:29:10', NULL),
(644, 47, 'S90', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:29:16', '2024-02-12 11:29:16', NULL),
(645, 47, 'V40', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:29:24', '2024-02-12 11:29:24', NULL),
(646, 47, 'V40 Cross Country', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:29:32', '2024-02-12 11:29:32', NULL),
(647, 47, 'V60', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:29:40', '2024-02-12 11:29:40', NULL),
(648, 47, 'V70', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:29:46', '2024-02-12 11:29:46', NULL),
(649, 47, 'V90', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:29:53', '2024-02-12 11:29:53', NULL),
(650, 47, 'XC40', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:30:05', '2024-02-12 11:30:05', NULL),
(651, 47, 'XC60', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:30:11', '2024-02-12 11:30:11', NULL),
(652, 45, '4 Runner', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:30:24', '2024-02-12 11:30:24', NULL),
(653, 45, 'Auris', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:30:36', '2024-02-12 11:30:36', NULL),
(654, 45, 'Avensis', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:30:46', '2024-02-12 11:30:46', NULL),
(655, 45, 'Avensis Verso', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:31:09', '2024-02-12 11:31:09', NULL),
(656, 45, 'Aygo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:31:15', '2024-02-12 11:31:15', NULL),
(657, 45, 'Camry', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:31:20', '2024-02-12 11:31:20', NULL),
(658, 45, 'Carina', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:31:25', '2024-02-12 11:31:25', NULL),
(659, 45, 'Celica', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:31:31', '2024-02-12 11:31:31', NULL),
(660, 45, 'C-HR', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:31:41', '2024-02-12 11:31:41', NULL),
(661, 45, 'Corolla', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:32:04', '2024-02-12 11:32:04', NULL),
(662, 45, 'Corolla Cross', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:32:10', '2024-02-12 11:32:10', NULL),
(663, 45, 'Corolla Millenium', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:32:18', '2024-02-12 11:32:18', NULL),
(664, 45, 'Corolla Prestige', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:32:24', '2024-02-12 11:32:24', NULL),
(665, 45, 'Corolla Cross', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:32:29', '2024-02-12 11:32:29', NULL),
(666, 45, 'Corolla Millenium', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:32:35', '2024-02-12 11:32:35', NULL),
(667, 45, 'Corolla Prestige', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:32:40', '2024-02-12 11:32:40', NULL),
(668, 45, 'Corolla Sport', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:32:46', '2024-02-12 11:32:46', NULL),
(669, 45, 'Corolla Verso', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:32:52', '2024-02-12 11:32:52', NULL),
(670, 45, 'Corona', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:32:59', '2024-02-12 11:32:59', NULL),
(671, 45, 'FJ', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:33:06', '2024-02-12 11:33:06', NULL),
(672, 45, 'FJ Cruiser', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:33:12', '2024-02-12 11:33:12', NULL),
(673, 45, 'Fortuner', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:33:19', '2024-02-12 11:33:19', NULL),
(674, 45, 'Hi Ace', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:33:29', '2024-02-12 11:33:29', NULL),
(675, 45, 'Highlander', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:33:35', '2024-02-12 11:33:35', NULL),
(676, 45, 'Hilux', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:33:41', '2024-02-12 11:33:41', NULL),
(677, 45, 'Land Cruiser', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:33:46', '2024-02-12 11:33:46', NULL),
(678, 45, 'Land Cruiser 200', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:33:52', '2024-02-12 11:33:52', NULL),
(679, 45, 'Land Cruiser Prado', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:33:58', '2024-02-12 11:33:58', NULL),
(680, 45, 'Lexus', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:34:05', '2024-02-12 11:34:05', NULL),
(681, 45, 'Lite Ace', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:34:10', '2024-02-12 11:34:10', NULL),
(682, 45, 'MR', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:34:16', '2024-02-12 11:34:16', NULL),
(683, 45, 'Paseo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:34:23', '2024-02-12 11:34:23', NULL),
(684, 45, 'Picnic', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:34:29', '2024-02-12 11:34:29', NULL),
(685, 45, 'Prado', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:34:35', '2024-02-12 11:34:35', NULL),
(686, 45, 'Previa', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:34:40', '2024-02-12 11:34:40', NULL),
(687, 45, 'Prius', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:34:47', '2024-02-12 11:34:47', NULL),
(688, 45, 'RAV 4', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:34:53', '2024-02-12 11:34:53', NULL),
(689, 45, 'Runner', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:34:59', '2024-02-12 11:34:59', NULL),
(690, 45, 'Sienna', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:35:06', '2024-02-12 11:35:06', NULL),
(691, 45, 'Starlet', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:35:12', '2024-02-12 11:35:12', NULL),
(692, 45, 'Supra', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:35:18', '2024-02-12 11:35:18', NULL),
(693, 44, 'Aerio', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:35:32', '2024-02-12 11:35:32', NULL),
(694, 44, 'Alto', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:35:40', '2024-02-12 11:35:40', NULL),
(695, 44, 'APV', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:35:50', '2024-02-12 11:35:50', NULL),
(696, 44, 'Baleno', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:36:02', '2024-02-12 11:36:02', NULL),
(697, 44, 'Carry', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:36:12', '2024-02-12 11:36:12', NULL),
(698, 44, 'Celerio', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:36:20', '2024-02-12 11:36:20', NULL),
(699, 44, 'Grand Vitara', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:36:30', '2024-02-12 11:36:30', NULL),
(700, 44, 'Ignis', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:37:25', '2024-02-12 11:37:25', NULL),
(701, 44, 'Jimny', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:37:35', '2024-02-12 11:37:35', NULL),
(702, 44, 'Liana', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:37:43', '2024-02-12 11:37:43', NULL),
(703, 44, 'Maruti', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:37:50', '2024-02-12 11:37:50', NULL),
(704, 44, 'Samurai', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:37:59', '2024-02-12 11:37:59', NULL),
(705, 44, 'S-cross', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:38:07', '2024-02-12 11:38:07', NULL),
(706, 44, 'Splash', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:38:16', '2024-02-12 11:38:16', NULL),
(707, 44, 'Swift', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:38:23', '2024-02-12 11:38:23', NULL),
(708, 44, 'SX 4', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:38:31', '2024-02-12 11:38:31', NULL),
(709, 44, 'Vitara', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:38:46', '2024-02-12 11:38:46', NULL),
(710, 44, 'Wagon R', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:38:56', '2024-02-12 11:38:56', NULL),
(711, 43, 'Impreza', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:39:19', '2024-02-12 11:39:19', NULL),
(712, 43, 'Legacy', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:39:44', '2024-02-12 11:39:44', NULL),
(713, 43, 'Tribeca', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:39:53', '2024-02-12 11:39:53', NULL),
(714, 42, 'Actyon', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:40:01', '2024-02-12 11:40:01', NULL),
(715, 42, 'Ceo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:40:09', '2024-02-12 11:40:09', NULL),
(716, 42, 'Family', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:40:16', '2024-02-12 11:40:16', NULL),
(717, 42, 'FAW', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:40:23', '2024-02-12 11:40:23', NULL),
(718, 42, 'Korando', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:40:29', '2024-02-12 11:40:29', NULL),
(719, 42, 'Kyron', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:40:37', '2024-02-12 11:40:37', NULL),
(720, 42, 'Rexton', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:40:44', '2024-02-12 11:40:44', NULL),
(721, 42, 'Rodius', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:40:50', '2024-02-12 11:40:50', NULL),
(722, 42, 'Stavic', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:40:58', '2024-02-12 11:40:58', NULL),
(723, 42, 'Tivoli', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:41:08', '2024-02-12 11:41:08', NULL);
INSERT INTO `models` (`id`, `brand_id`, `name`, `user_id`, `ip`, `user_agent`, `created_at`, `updated_at`, `deleted_at`) VALUES
(724, 42, 'XLV', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:41:17', '2024-02-12 11:41:17', NULL),
(725, 38, '718 Boxster', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:41:40', '2024-02-12 11:41:40', NULL),
(726, 38, '718 Cayman', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:41:48', '2024-02-12 11:41:48', NULL),
(727, 38, '911', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:42:54', '2024-02-12 11:42:54', NULL),
(728, 38, '911 Cabriolet', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:43:06', '2024-02-12 11:43:06', NULL),
(729, 38, '911 Carrera', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:43:14', '2024-02-12 11:43:14', NULL),
(730, 38, '911 Coupe', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:45:05', '2024-02-12 11:45:05', NULL),
(731, 38, '911 Targa', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:45:13', '2024-02-12 11:45:13', NULL),
(732, 38, '911 Turbo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:45:21', '2024-02-12 11:45:21', NULL),
(733, 38, '918 Spyder', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:45:27', '2024-02-12 11:45:27', NULL),
(734, 38, 'Boxster', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:45:33', '2024-02-12 11:45:33', NULL),
(735, 38, 'Boxster GTS', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:45:39', '2024-02-12 11:45:39', NULL),
(736, 38, 'Boxster S', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:45:46', '2024-02-12 11:45:46', NULL),
(737, 38, 'Boxster Spyder', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:45:54', '2024-02-12 11:45:54', NULL),
(738, 38, 'Carrera', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:46:03', '2024-02-12 11:46:03', NULL),
(739, 38, 'Carrera GT', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:46:10', '2024-02-12 11:46:10', NULL),
(740, 38, 'Cayenne', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:46:18', '2024-02-12 11:46:18', NULL),
(741, 38, 'Cayenne Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:46:26', '2024-02-12 11:46:26', NULL),
(742, 38, 'Cayman', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:46:33', '2024-02-12 11:46:33', NULL),
(743, 38, 'Corolla Five', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:46:40', '2024-02-12 11:46:40', NULL),
(744, 38, 'Macan', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:46:54', '2024-02-12 11:46:54', NULL),
(745, 38, 'Panamera', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:47:01', '2024-02-12 11:47:01', NULL),
(746, 38, 'Panamera Sport', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:47:19', '2024-02-12 11:47:19', NULL),
(747, 38, 'Turismo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:47:26', '2024-02-12 11:47:26', NULL),
(748, 34, 'Canter', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:47:49', '2024-02-12 11:47:49', NULL),
(749, 34, 'Colt', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:47:58', '2024-02-12 11:47:58', NULL),
(750, 34, 'Grandis', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:48:07', '2024-02-12 11:48:07', NULL),
(751, 34, 'L200', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:48:14', '2024-02-12 11:48:14', NULL),
(752, 34, 'Lancer', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:48:27', '2024-02-12 11:48:27', NULL),
(753, 34, 'Nativa', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:48:35', '2024-02-12 11:48:35', NULL),
(754, 34, 'Outlander', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:48:43', '2024-02-12 11:48:43', NULL),
(755, 34, 'Pajero', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:48:51', '2024-02-12 11:48:51', NULL),
(756, 34, 'Pajero Sport', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:48:59', '2024-02-12 11:48:59', NULL),
(757, 34, 'pick up', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:49:08', '2024-02-12 11:49:08', NULL),
(758, 33, 'Cabrio', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:49:20', '2024-02-12 11:49:20', NULL),
(759, 33, 'Clubman', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:49:29', '2024-02-12 11:49:29', NULL),
(760, 33, 'Cooper', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:49:38', '2024-02-12 11:49:38', NULL),
(761, 33, 'Country Man', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:49:46', '2024-02-12 11:49:46', NULL),
(762, 33, 'Hatch', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:49:53', '2024-02-12 11:49:53', NULL),
(763, 33, 'Mini', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:50:01', '2024-02-12 11:50:01', NULL),
(764, 33, 'Mini Coupé', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:50:12', '2024-02-12 11:50:12', NULL),
(765, 33, 'One', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:50:19', '2024-02-12 11:50:19', NULL),
(766, 33, 'Paceman', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:50:26', '2024-02-12 11:50:26', NULL),
(767, 33, 'Roadster', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:50:34', '2024-02-12 11:50:34', NULL),
(768, 31, '121', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:50:53', '2024-02-12 11:50:53', NULL),
(769, 31, 'Mazda 2', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:51:00', '2024-02-12 11:51:00', NULL),
(770, 31, 'Mazda 3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:51:07', '2024-02-12 11:51:07', NULL),
(771, 31, '323', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:51:14', '2024-02-12 11:51:14', NULL),
(772, 31, 'Mazda 5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:52:30', '2024-02-12 11:52:30', NULL),
(773, 31, 'Mazda', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:52:39', '2024-02-12 11:52:39', NULL),
(774, 31, '626', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:52:47', '2024-02-12 11:52:47', NULL),
(775, 31, '929', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:52:54', '2024-02-12 11:52:54', NULL),
(776, 31, 'Astina', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:53:02', '2024-02-12 11:53:02', NULL),
(777, 31, 'B 2500', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:53:09', '2024-02-12 11:53:09', NULL),
(778, 31, 'BK', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:53:18', '2024-02-12 11:53:18', NULL),
(779, 31, 'Bongo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:53:26', '2024-02-12 11:53:26', NULL),
(780, 31, 'BT-50', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:53:39', '2024-02-12 11:53:39', NULL),
(781, 31, 'CX-3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:53:47', '2024-02-12 11:53:47', NULL),
(782, 31, 'CX-5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:53:58', '2024-02-12 11:53:58', NULL),
(783, 31, 'CX-7', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:54:06', '2024-02-12 11:54:06', NULL),
(784, 31, 'CX-9', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:54:13', '2024-02-12 11:54:13', NULL),
(785, 31, 'Demio', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:54:21', '2024-02-12 11:54:21', NULL),
(786, 31, 'E2000', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:54:28', '2024-02-12 11:54:28', NULL),
(787, 31, 'Familia', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:54:34', '2024-02-12 11:54:34', NULL),
(788, 31, 'MPV', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:54:41', '2024-02-12 11:54:41', NULL),
(789, 31, 'MX-3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:54:50', '2024-02-12 11:54:50', NULL),
(790, 31, 'MX-5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:54:57', '2024-02-12 11:54:57', NULL),
(791, 31, 'MX-6', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:55:03', '2024-02-12 11:55:03', NULL),
(792, 31, 'Premacy', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:55:10', '2024-02-12 11:55:10', NULL),
(793, 31, 'RX-7', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:55:18', '2024-02-12 11:55:18', NULL),
(794, 31, 'RX-8', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:55:30', '2024-02-12 11:55:30', NULL),
(795, 31, 'Sportiva', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:55:37', '2024-02-12 11:55:37', NULL),
(796, 31, '3200 GT', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:55:50', '2024-02-12 11:55:50', NULL),
(797, 31, '4200 GT', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:55:57', '2024-02-12 11:55:57', NULL),
(798, 31, 'Ghibli', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:56:04', '2024-02-12 11:56:04', NULL),
(799, 31, 'Gran Cabrio', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:56:26', '2024-02-12 11:56:26', NULL),
(800, 31, 'Gran Turismo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:56:33', '2024-02-12 11:56:33', NULL),
(801, 31, 'Levante', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:56:40', '2024-02-12 11:56:40', NULL),
(802, 31, 'Quattroporte', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:56:52', '2024-02-12 11:56:52', NULL),
(803, 29, 'Hover', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:57:06', '2024-02-12 11:57:06', NULL),
(804, 29, 'KUV 100', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:57:17', '2024-02-12 11:57:17', NULL),
(805, 29, 'Scorpio', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:57:26', '2024-02-12 11:57:26', NULL),
(806, 29, 'XUV 500', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:57:36', '2024-02-12 11:57:36', NULL),
(807, 28, 'GS 350', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:57:50', '2024-02-12 11:57:50', NULL),
(808, 28, 'GS 360', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:58:04', '2024-02-12 11:58:04', NULL),
(809, 28, 'ES', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:58:16', '2024-02-12 11:58:16', NULL),
(810, 28, 'IS', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:58:25', '2024-02-12 11:58:25', NULL),
(811, 28, 'LS', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:58:37', '2024-02-12 11:58:37', NULL),
(812, 28, 'LX', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:58:45', '2024-02-12 11:58:45', NULL),
(813, 28, 'NX', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:58:53', '2024-02-12 11:58:53', NULL),
(814, 28, 'RX', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:59:08', '2024-02-12 11:59:08', NULL),
(815, 28, 'UX', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:59:18', '2024-02-12 11:59:18', NULL),
(816, 26, 'Delta', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:59:28', '2024-02-12 11:59:28', NULL),
(817, 26, 'Thema', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:59:34', '2024-02-12 11:59:34', NULL),
(818, 26, 'Y', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:59:40', '2024-02-12 11:59:40', NULL),
(819, 26, 'Ypsilon', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 11:59:46', '2024-02-12 11:59:46', NULL),
(820, 25, 'Besta', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:00:02', '2024-02-12 12:00:02', NULL),
(821, 25, 'Cadenza', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:00:09', '2024-02-12 12:00:09', NULL),
(822, 25, 'Carens', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:00:15', '2024-02-12 12:00:15', NULL),
(823, 25, 'Carnival', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:00:22', '2024-02-12 12:00:22', NULL),
(824, 25, 'Ceed', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:00:29', '2024-02-12 12:00:29', NULL),
(825, 25, 'Cerato', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:00:38', '2024-02-12 12:00:38', NULL),
(826, 25, 'Clarus', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:00:44', '2024-02-12 12:00:44', NULL),
(827, 25, 'Combi', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:00:51', '2024-02-12 12:00:51', NULL),
(828, 25, 'K 2500', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:01:03', '2024-02-12 12:01:03', NULL),
(829, 25, 'K 2700', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:01:10', '2024-02-12 12:01:10', NULL),
(830, 25, 'K5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:01:17', '2024-02-12 12:01:17', NULL),
(831, 25, 'Magentis', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:01:23', '2024-02-12 12:01:23', NULL),
(832, 25, 'Mohave', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:01:30', '2024-02-12 12:01:30', NULL),
(833, 25, 'Niro', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:01:37', '2024-02-12 12:01:37', NULL),
(834, 25, 'Opirus', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:02:05', '2024-02-12 12:02:05', NULL),
(835, 25, 'Optima', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:02:12', '2024-02-12 12:02:12', NULL),
(836, 25, 'Picanto', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:02:19', '2024-02-12 12:02:19', NULL),
(837, 25, 'Pregio', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:02:25', '2024-02-12 12:02:25', NULL),
(838, 25, 'Pride', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:02:31', '2024-02-12 12:02:31', NULL),
(839, 25, 'Proceed', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:02:37', '2024-02-12 12:02:37', NULL),
(840, 25, 'Quoris', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:02:44', '2024-02-12 12:02:44', NULL),
(841, 25, 'Rio', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:02:51', '2024-02-12 12:02:51', NULL),
(842, 25, 'Seltos', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:02:57', '2024-02-12 12:02:57', NULL),
(843, 25, 'Sephia', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:03:04', '2024-02-12 12:03:04', NULL),
(844, 25, 'Shuma', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:03:12', '2024-02-12 12:03:12', NULL),
(845, 25, 'Sorento', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:03:19', '2024-02-12 12:03:19', NULL),
(846, 25, 'Soul', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:03:26', '2024-02-12 12:03:26', NULL),
(847, 23, 'E-Pace', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:03:46', '2024-02-12 12:03:46', NULL),
(848, 23, 'F-Pace', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:03:53', '2024-02-12 12:03:53', NULL),
(849, 23, 'F-Type', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:03:59', '2024-02-12 12:03:59', NULL),
(850, 23, 'F-Type Cabriolet', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:04:06', '2024-02-12 12:04:06', NULL),
(851, 23, 'F-Type Convertible', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:04:12', '2024-02-12 12:04:12', NULL),
(852, 23, 'I-Pace', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:04:18', '2024-02-12 12:04:18', NULL),
(853, 23, 'Sovreign', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:04:26', '2024-02-12 12:04:26', NULL),
(854, 23, 'S-Type', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:04:34', '2024-02-12 12:04:34', NULL),
(855, 23, 'XE', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:04:42', '2024-02-12 12:04:42', NULL),
(856, 23, 'XF', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:04:49', '2024-02-12 12:04:49', NULL),
(857, 23, 'XJ', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:04:55', '2024-02-12 12:04:55', NULL),
(858, 23, 'XJ 6', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:05:02', '2024-02-12 12:05:02', NULL),
(859, 23, 'XJ 8', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:05:08', '2024-02-12 12:05:08', NULL),
(860, 23, 'XK', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:05:14', '2024-02-12 12:05:14', NULL),
(861, 23, 'XK 8', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:05:20', '2024-02-12 12:05:20', NULL),
(862, 23, 'XK Cabriolet', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:05:28', '2024-02-12 12:05:28', NULL),
(863, 22, 'D-Max', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:05:59', '2024-02-12 12:05:59', NULL),
(864, 22, 'Landwind', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:06:06', '2024-02-12 12:06:06', NULL),
(865, 22, 'Trooper', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:06:13', '2024-02-12 12:06:13', NULL),
(866, 20, 'H2', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:06:23', '2024-02-12 12:06:23', NULL),
(867, 20, 'H3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:06:29', '2024-02-12 12:06:29', NULL),
(868, 18, 'Next', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:06:39', '2024-02-12 12:06:39', NULL),
(869, 18, 'Next Van', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:06:45', '2024-02-12 12:06:45', NULL),
(870, 17, 'Forland', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:06:57', '2024-02-12 12:06:57', NULL),
(871, 13, 'Avenger', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:07:11', '2024-02-12 12:07:11', NULL),
(872, 13, 'Caliber', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:07:25', '2024-02-12 12:07:25', NULL),
(873, 12, 'C31', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:07:38', '2024-02-12 12:07:38', NULL),
(874, 12, 'C35', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:07:55', '2024-02-12 12:07:55', NULL),
(875, 12, 'Glory 580', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:08:35', '2024-02-12 12:08:35', NULL),
(876, 12, 'Glory IX5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:08:41', '2024-02-12 12:08:41', NULL),
(877, 12, 'ix 5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:08:51', '2024-02-12 12:08:51', NULL),
(878, 12, 'K01', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:08:59', '2024-02-12 12:08:59', NULL),
(879, 12, 'K01h', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:09:07', '2024-02-12 12:09:07', NULL),
(880, 12, 'K01i', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:09:15', '2024-02-12 12:09:15', NULL),
(881, 12, 'K01s', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:09:24', '2024-02-12 12:09:24', NULL),
(882, 12, 'K05', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:09:32', '2024-02-12 12:09:32', NULL),
(883, 12, 'Seres 3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:09:40', '2024-02-12 12:09:40', NULL),
(884, 12, 'Super cab', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:09:47', '2024-02-12 12:09:47', NULL),
(885, 11, 'Copen', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:10:00', '2024-02-12 12:10:00', NULL),
(886, 11, 'Dodge', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:10:13', '2024-02-12 12:10:13', NULL),
(887, 11, 'Sirion', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:10:24', '2024-02-12 12:10:24', NULL),
(888, 11, 'Terios', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:10:33', '2024-02-12 12:10:33', NULL),
(889, 11, 'YRV', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:10:41', '2024-02-12 12:10:41', NULL),
(890, 9, 'Formentor', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:10:58', '2024-02-12 12:10:58', NULL),
(891, 8, '2 CV', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:11:18', '2024-02-12 12:11:18', NULL),
(892, 8, 'Ami', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:11:28', '2024-02-12 12:11:28', NULL),
(893, 8, 'AX', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:11:37', '2024-02-12 12:11:37', NULL),
(894, 8, 'Berlingo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:11:45', '2024-02-12 12:11:45', NULL),
(895, 8, 'BX', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:11:54', '2024-02-12 12:11:54', NULL),
(896, 8, 'C1', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:12:02', '2024-02-12 12:12:02', NULL),
(897, 8, 'C15', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:12:10', '2024-02-12 12:12:10', NULL),
(898, 8, 'C2', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:12:19', '2024-02-12 12:12:19', NULL),
(899, 8, 'C25', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:12:29', '2024-02-12 12:12:29', NULL),
(900, 8, 'C3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:12:37', '2024-02-12 12:12:37', NULL),
(901, 8, 'C35', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:12:46', '2024-02-12 12:12:46', NULL),
(902, 8, 'C3 Aircross', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:12:54', '2024-02-12 12:12:54', NULL),
(903, 8, 'C3 Cactus', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:13:02', '2024-02-12 12:13:02', NULL),
(904, 8, 'C3 Picasso', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:13:12', '2024-02-12 12:13:12', NULL),
(905, 8, 'C3 Pluriel', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:13:22', '2024-02-12 12:13:22', NULL),
(906, 8, 'C4', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:13:30', '2024-02-12 12:13:30', NULL),
(907, 8, 'C4 Aircross', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:13:39', '2024-02-12 12:13:39', NULL),
(908, 8, 'C4 Cactus', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:13:48', '2024-02-12 12:13:48', NULL),
(909, 8, 'C4 Picasso', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:13:56', '2024-02-12 12:13:56', NULL),
(910, 8, 'C4 Spacetourer', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:14:03', '2024-02-12 12:14:03', NULL),
(911, 8, 'C4x', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:14:17', '2024-02-12 12:14:17', NULL),
(912, 8, 'C5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:14:46', '2024-02-12 12:14:46', NULL),
(913, 8, 'C5 Aircross', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:14:55', '2024-02-12 12:14:55', NULL),
(914, 8, 'C6', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:15:02', '2024-02-12 12:15:02', NULL),
(915, 8, 'C8', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:15:09', '2024-02-12 12:15:09', NULL),
(916, 8, 'C-Crosser', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:15:20', '2024-02-12 12:15:20', NULL),
(917, 8, 'C-Elysée', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:15:30', '2024-02-12 12:15:30', NULL),
(918, 8, 'CX', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:16:19', '2024-02-12 12:16:19', NULL),
(919, 8, 'CX', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:17:47', '2024-02-12 12:17:47', NULL),
(920, 8, 'Evasion', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:18:07', '2024-02-12 12:18:07', NULL),
(921, 8, 'Grand C4 Picasso', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:18:16', '2024-02-12 12:18:16', NULL),
(922, 8, 'Grand C4 Spacetourer', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:18:25', '2024-02-12 12:18:25', NULL),
(923, 8, 'Jumper', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:18:32', '2024-02-12 12:18:32', NULL),
(924, 8, 'Jumper', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:18:32', '2024-02-12 12:18:32', NULL),
(925, 8, 'Jumpy', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:18:42', '2024-02-12 12:18:42', NULL),
(926, 8, 'Nemo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:18:52', '2024-02-12 12:18:52', NULL),
(927, 8, 'Saxo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:19:04', '2024-02-12 12:19:04', NULL),
(928, 8, 'SM', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:19:13', '2024-02-12 12:19:13', NULL),
(929, 8, 'Spacetourer', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:19:21', '2024-02-12 12:19:21', NULL),
(930, 8, 'Visa', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:19:28', '2024-02-12 12:19:28', NULL),
(931, 8, 'Xantia', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:19:35', '2024-02-12 12:19:35', NULL),
(932, 8, 'XM', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:19:42', '2024-02-12 12:19:42', NULL),
(933, 8, 'Xsara', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:19:54', '2024-02-12 12:19:54', NULL),
(934, 8, '300 C', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:20:03', '2024-02-12 12:20:03', NULL),
(935, 8, '300 M', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:20:11', '2024-02-12 12:20:11', NULL),
(936, 8, 'Grand Voyager', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:20:20', '2024-02-12 12:20:20', NULL),
(937, 8, 'Pacifica', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:20:29', '2024-02-12 12:20:29', NULL),
(938, 8, 'PT Cruiser', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:20:38', '2024-02-12 12:20:38', NULL),
(939, 8, 'Sebring', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:20:45', '2024-02-12 12:20:45', NULL),
(940, 6, 'Alero', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:20:53', '2024-02-12 12:20:53', NULL),
(941, 6, 'Astro', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:21:18', '2024-02-12 12:21:18', NULL),
(942, 6, 'Avalanche', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:21:28', '2024-02-12 12:21:28', NULL),
(943, 6, 'Aveo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:21:39', '2024-02-12 12:21:39', NULL),
(944, 6, 'Aveo Berline', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:21:53', '2024-02-12 12:21:53', NULL),
(945, 6, 'Beretta', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:22:01', '2024-02-12 12:22:01', NULL),
(946, 6, 'Blazer', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:23:59', '2024-02-12 12:23:59', NULL),
(947, 6, 'Camaro', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:24:07', '2024-02-12 12:24:07', NULL),
(948, 6, 'Caprice', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:24:13', '2024-02-12 12:24:13', NULL),
(949, 6, 'Captiva', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:24:24', '2024-02-12 12:24:24', NULL),
(950, 6, 'Cavalier', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:24:32', '2024-02-12 12:24:32', NULL),
(951, 6, 'CMP', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:24:41', '2024-02-12 12:24:41', NULL),
(952, 6, 'Corvette', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:24:48', '2024-02-12 12:24:48', NULL),
(953, 6, 'Corvette Cabrio', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:24:56', '2024-02-12 12:24:56', NULL),
(954, 6, 'CR8', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:25:06', '2024-02-12 12:25:06', NULL),
(955, 6, 'Cruze', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:25:13', '2024-02-12 12:25:13', NULL),
(956, 6, 'El Camino', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:25:20', '2024-02-12 12:25:20', NULL),
(957, 6, 'Epica', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:25:28', '2024-02-12 12:25:28', NULL),
(958, 6, 'Express', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:25:38', '2024-02-12 12:25:38', NULL),
(959, 6, 'HHR', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:25:46', '2024-02-12 12:25:46', NULL),
(960, 6, 'Lacetti', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:25:53', '2024-02-12 12:25:53', NULL),
(961, 6, 'Metro', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:26:00', '2024-02-12 12:26:00', NULL),
(962, 6, 'Monte-Carlo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:26:07', '2024-02-12 12:26:07', NULL),
(963, 6, 'Nubira SW', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:26:14', '2024-02-12 12:26:14', NULL),
(964, 6, 'Optra', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:26:21', '2024-02-12 12:26:21', NULL),
(965, 6, 'Orlando', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:26:31', '2024-02-12 12:26:31', NULL);
INSERT INTO `models` (`id`, `brand_id`, `name`, `user_id`, `ip`, `user_agent`, `created_at`, `updated_at`, `deleted_at`) VALUES
(966, 6, 'S-10', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:26:38', '2024-02-12 12:26:38', NULL),
(967, 6, 'Silverado', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:26:45', '2024-02-12 12:26:45', NULL),
(968, 6, 'Spark', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:26:51', '2024-02-12 12:26:51', NULL),
(969, 6, 'SSR', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:26:57', '2024-02-12 12:26:57', NULL),
(970, 6, 'Suburban', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:27:03', '2024-02-12 12:27:03', NULL),
(971, 6, 'Tacuma', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:27:10', '2024-02-12 12:27:10', NULL),
(972, 6, 'Tahoe', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:27:17', '2024-02-12 12:27:17', NULL),
(973, 6, 'Tracker', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:27:25', '2024-02-12 12:27:25', NULL),
(974, 6, 'Trailblazer', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:27:31', '2024-02-12 12:27:31', NULL),
(975, 6, 'Trans Sport', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:27:37', '2024-02-12 12:27:37', NULL),
(976, 6, 'Traverse', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:27:43', '2024-02-12 12:27:43', NULL),
(977, 5, 'A1', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:27:53', '2024-02-12 12:27:53', NULL),
(978, 5, 'A113', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:27:59', '2024-02-12 12:27:59', NULL),
(979, 5, 'A3', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:28:05', '2024-02-12 12:28:05', NULL),
(980, 5, 'A5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:28:11', '2024-02-12 12:28:11', NULL),
(981, 5, 'A516', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:28:17', '2024-02-12 12:28:17', NULL),
(982, 5, 'Eastar', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:28:24', '2024-02-12 12:28:24', NULL),
(983, 5, 'QQ', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:28:30', '2024-02-12 12:28:30', NULL),
(984, 5, 'QQ6', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:28:38', '2024-02-12 12:28:38', NULL),
(985, 5, 'Tiggo', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:28:44', '2024-02-12 12:28:44', NULL),
(986, 5, 'V5', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:28:50', '2024-02-12 12:28:50', NULL),
(987, 5, 'V525', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:28:56', '2024-02-12 12:28:56', NULL),
(988, 2, '145', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:29:11', '2024-02-12 12:29:11', NULL),
(989, 2, '146', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:29:31', '2024-02-12 12:29:31', NULL),
(990, 2, '147', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:29:41', '2024-02-12 12:29:41', NULL),
(991, 2, '147 GTA', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:29:50', '2024-02-12 12:29:50', NULL),
(992, 2, '155', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:29:58', '2024-02-12 12:29:58', NULL),
(993, 2, '156', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:30:05', '2024-02-12 12:30:05', NULL),
(994, 2, '159', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:30:53', '2024-02-12 12:30:53', NULL),
(995, 2, '164', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:31:00', '2024-02-12 12:31:00', NULL),
(996, 2, '166', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:31:06', '2024-02-12 12:31:06', NULL),
(997, 2, '33', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:31:15', '2024-02-12 12:31:15', NULL),
(998, 2, '75', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:31:28', '2024-02-12 12:31:28', NULL),
(999, 2, '4C', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:31:40', '2024-02-12 12:31:40', NULL),
(1000, 2, '8C', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:31:55', '2024-02-12 12:31:55', NULL),
(1001, 2, 'Brera', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:32:02', '2024-02-12 12:32:02', NULL),
(1002, 2, 'Giulia', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:32:08', '2024-02-12 12:32:08', NULL),
(1003, 2, 'Giulietta', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:32:15', '2024-02-12 12:32:15', NULL),
(1004, 2, 'GT', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:32:21', '2024-02-12 12:32:21', NULL),
(1005, 2, 'GTV', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:32:28', '2024-02-12 12:32:28', NULL),
(1006, 2, 'Mito', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:32:34', '2024-02-12 12:32:34', NULL),
(1007, 2, '4C Spider', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:32:42', '2024-02-12 12:32:42', NULL),
(1008, 1, '124 Spider', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:32:52', '2024-02-12 12:32:52', NULL),
(1009, 1, '595', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:32:59', '2024-02-12 12:32:59', NULL),
(1010, 1, '595 Cabriolet', 2, '41.250.82.108', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-12 12:33:05', '2024-02-12 12:33:05', NULL),
(1011, 27, 'Range Rover Sport SE', 2, '105.155.237.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', '2024-03-05 11:40:39', '2024-03-05 11:45:04', NULL),
(1012, 4, 'Série 1 Sport', 2, '105.155.237.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', '2024-03-05 14:27:32', '2024-03-05 14:27:32', NULL),
(1013, 32, 'Classe C bluetec', 2, '105.159.158.36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', '2024-03-16 12:18:36', '2024-03-16 12:18:36', NULL),
(1014, 45, 'Yaris', 2, '105.154.20.22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '2024-07-09 12:31:38', '2024-07-09 12:31:38', NULL),
(1015, 25, 'SPORTAGE', 2, '41.251.123.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-20 15:05:52', '2025-01-20 15:05:52', NULL),
(1016, 48, 'Model 3', 2, '105.157.255.167', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', '2025-02-07 15:17:48', '2025-02-07 15:17:48', NULL),
(1017, 30, 'Levante', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '2025-09-26 22:04:17', '2025-09-26 22:04:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(125) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(125) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `nado_auto_encheres`
--

CREATE TABLE `nado_auto_encheres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `proposition` int(11) DEFAULT NULL,
  `phone` varchar(125) DEFAULT NULL,
  `titre` varchar(125) DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `mark` varchar(125) DEFAULT NULL,
  `modele` varchar(125) DEFAULT NULL,
  `matricule` varchar(125) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `km` int(11) DEFAULT NULL,
  `carburant` varchar(125) DEFAULT NULL,
  `box` varchar(125) DEFAULT NULL,
  `etat` varchar(125) DEFAULT NULL,
  `city` varchar(125) DEFAULT NULL,
  `cv` varchar(125) DEFAULT NULL,
  `nb_Door` varchar(125) DEFAULT NULL,
  `origine` varchar(125) DEFAULT NULL,
  `premiere_main` tinyint(1) NOT NULL DEFAULT 0,
  `video` varchar(125) DEFAULT NULL,
  `reel` tinyint(1) NOT NULL DEFAULT 0,
  `bodywork` varchar(125) DEFAULT NULL,
  `status` varchar(125) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `rapport` text DEFAULT NULL,
  `co2` varchar(125) DEFAULT NULL,
  `certifie` tinyint(1) NOT NULL DEFAULT 0,
  `particulie` tinyint(1) NOT NULL DEFAULT 0,
  `showroom` tinyint(1) NOT NULL DEFAULT 0,
  `finance` tinyint(1) NOT NULL DEFAULT 0,
  `jantesA` tinyint(1) NOT NULL DEFAULT 0,
  `airbags` tinyint(1) NOT NULL DEFAULT 0,
  `climatisation` tinyint(1) NOT NULL DEFAULT 0,
  `gps` tinyint(1) NOT NULL DEFAULT 0,
  `toit_ouvrant` tinyint(1) NOT NULL DEFAULT 0,
  `double_toit_ouvrant` tinyint(1) NOT NULL DEFAULT 0,
  `siege_cuir` tinyint(1) NOT NULL DEFAULT 0,
  `radar_recul` tinyint(1) NOT NULL DEFAULT 0,
  `camera_recul` tinyint(1) NOT NULL DEFAULT 0,
  `abs` tinyint(1) NOT NULL DEFAULT 0,
  `eps` tinyint(1) NOT NULL DEFAULT 0,
  `esp` tinyint(1) NOT NULL DEFAULT 0,
  `antipatinage` tinyint(1) NOT NULL DEFAULT 0,
  `aide_freinage_urgence` tinyint(1) NOT NULL DEFAULT 0,
  `antidemarrage_electronique` tinyint(1) NOT NULL DEFAULT 0,
  `aide_demarrage_cote` tinyint(1) NOT NULL DEFAULT 0,
  `selecteur_mode_conduite` tinyint(1) NOT NULL DEFAULT 0,
  `detection_fatigue` tinyint(1) NOT NULL DEFAULT 0,
  `maintien_dans_la_voie` tinyint(1) NOT NULL DEFAULT 0,
  `detecteur_angle_mort` tinyint(1) NOT NULL DEFAULT 0,
  `detecteur_sous_gonflage` tinyint(1) NOT NULL DEFAULT 0,
  `fermeture_portes_auto` tinyint(1) NOT NULL DEFAULT 0,
  `preparation_isofix` tinyint(1) NOT NULL DEFAULT 0,
  `phares_antibrouillard` tinyint(1) NOT NULL DEFAULT 0,
  `systeme_alarme` tinyint(1) NOT NULL DEFAULT 0,
  `start_stop` tinyint(1) NOT NULL DEFAULT 0,
  `regulateur_vitesse` tinyint(1) NOT NULL DEFAULT 0,
  `detecteur_pluie` tinyint(1) NOT NULL DEFAULT 0,
  `allumage_auto_feux` tinyint(1) NOT NULL DEFAULT 0,
  `frein_main_electrique` tinyint(1) NOT NULL DEFAULT 0,
  `aide_stationnement` tinyint(1) NOT NULL DEFAULT 0,
  `volant_reglable` tinyint(1) NOT NULL DEFAULT 0,
  `retros_electriques` tinyint(1) NOT NULL DEFAULT 0,
  `retros_rabat_electriques` tinyint(1) NOT NULL DEFAULT 0,
  `coffre_electrique` tinyint(1) NOT NULL DEFAULT 0,
  `sieges_electriques` tinyint(1) NOT NULL DEFAULT 0,
  `sieges_elec_memoire` tinyint(1) NOT NULL DEFAULT 0,
  `banquette_rabattable` tinyint(1) NOT NULL DEFAULT 0,
  `ecran_tactile` tinyint(1) NOT NULL DEFAULT 0,
  `cockpit_digital` tinyint(1) NOT NULL DEFAULT 0,
  `commandes_volant` tinyint(1) NOT NULL DEFAULT 0,
  `commandes_vocales` tinyint(1) NOT NULL DEFAULT 0,
  `reconnaissance_panneaux` tinyint(1) NOT NULL DEFAULT 0,
  `affichage_tete_haute` tinyint(1) NOT NULL DEFAULT 0,
  `systeme_audio` tinyint(1) NOT NULL DEFAULT 0,
  `wifi_bord` tinyint(1) NOT NULL DEFAULT 0,
  `bluetooth` tinyint(1) NOT NULL DEFAULT 0,
  `compatibilite_smartphone` tinyint(1) NOT NULL DEFAULT 0,
  `apple_carplay_android_auto` tinyint(1) NOT NULL DEFAULT 0,
  `chargeur_sans_fil` tinyint(1) NOT NULL DEFAULT 0,
  `sellerie_similicuir_tissu` tinyint(1) NOT NULL DEFAULT 0,
  `volant_cuir` tinyint(1) NOT NULL DEFAULT 0,
  `follow_me_home` tinyint(1) NOT NULL DEFAULT 0,
  `lumiere_ambiance` tinyint(1) NOT NULL DEFAULT 0,
  `feux_jour_led` tinyint(1) NOT NULL DEFAULT 0,
  `phares_full_led` tinyint(1) NOT NULL DEFAULT 0,
  `toit_panoramique` tinyint(1) NOT NULL DEFAULT 0,
  `barres_de_toit` tinyint(1) NOT NULL DEFAULT 0,
  `vitres_surteintees` tinyint(1) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `colors` varchar(125) DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `starts_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nado_auto_encheres`
--

INSERT INTO `nado_auto_encheres` (`id`, `client_id`, `proposition`, `phone`, `titre`, `prix`, `mark`, `modele`, `matricule`, `year`, `km`, `carburant`, `box`, `etat`, `city`, `cv`, `nb_Door`, `origine`, `premiere_main`, `video`, `reel`, `bodywork`, `status`, `images`, `rapport`, `co2`, `certifie`, `particulie`, `showroom`, `finance`, `jantesA`, `airbags`, `climatisation`, `gps`, `toit_ouvrant`, `double_toit_ouvrant`, `siege_cuir`, `radar_recul`, `camera_recul`, `abs`, `eps`, `esp`, `antipatinage`, `aide_freinage_urgence`, `antidemarrage_electronique`, `aide_demarrage_cote`, `selecteur_mode_conduite`, `detection_fatigue`, `maintien_dans_la_voie`, `detecteur_angle_mort`, `detecteur_sous_gonflage`, `fermeture_portes_auto`, `preparation_isofix`, `phares_antibrouillard`, `systeme_alarme`, `start_stop`, `regulateur_vitesse`, `detecteur_pluie`, `allumage_auto_feux`, `frein_main_electrique`, `aide_stationnement`, `volant_reglable`, `retros_electriques`, `retros_rabat_electriques`, `coffre_electrique`, `sieges_electriques`, `sieges_elec_memoire`, `banquette_rabattable`, `ecran_tactile`, `cockpit_digital`, `commandes_volant`, `commandes_vocales`, `reconnaissance_panneaux`, `affichage_tete_haute`, `systeme_audio`, `wifi_bord`, `bluetooth`, `compatibilite_smartphone`, `apple_carplay_android_auto`, `chargeur_sans_fil`, `sellerie_similicuir_tissu`, `volant_cuir`, `follow_me_home`, `lumiere_ambiance`, `feux_jour_led`, `phares_full_led`, `toit_panoramique`, `barres_de_toit`, `vitres_surteintees`, `views`, `active`, `created_at`, `updated_at`, `deleted_at`, `verified`, `colors`, `ends_at`, `starts_at`) VALUES
(1, NULL, NULL, '0637916122', 'bmw', 630000.00, '4', '6', '23114-H-7', '2023', 32203, 'essence', NULL, NULL, 'Safi', '7', '6', 'importé neuf', 1, NULL, 0, 'citadine', 'disponible', '[\"4-6-420674.png\",\"4-6-279119.jpg\"]', '4-6-632703.pdf', NULL, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 21, 1, '2025-09-14 16:16:46', '2025-09-27 02:01:54', NULL, 0, 'Bleu ardoise moyen', '2025-10-04 19:45:00', '2025-09-27 19:45:00'),
(2, NULL, NULL, '0637916122', 'test', 630000.00, '12', '879', '24114-H-13', '2019', 565545, 'diesel', 'manuelle', 'très bon', 'Agadir', '4', '3', 'importé neuf', 0, NULL, 0, 'berline', 'disponible', '[\"12-879-858882.jpeg\",\"12-879-422328.jpeg\",\"12-879-158069.png\",\"12-879-405930.png\",\"12-879-100223.jpg\",\"12-879-424258.jpg\",\"12-879-511336.jpg\",\"12-879-722504.png\",\"12-879-493638.jpg\",\"12-879-338892.png\",\"12-879-127608.png\"]', NULL, NULL, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 1, '2025-09-14 16:57:09', '2025-09-27 01:27:07', NULL, 0, 'Bleu ardoise', '2025-10-04 18:11:00', '2025-09-27 18:11:00'),
(3, NULL, NULL, '0770080009', 'Audi a4', 41554.00, '3', '110', NULL, '2020', 200000, 'diesel', 'automatique', 'très bon', 'Kénitra', '8', '3', 'WW au Maroc', 0, NULL, 0, 'suv et 4x4', 'disponible', '[\"3-110-649351.jpeg\"]', '3-110-744246.pdf', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 1, '2025-09-17 17:06:36', '2025-09-23 18:37:06', NULL, 0, 'Teal', '2025-09-30 18:11:37', '2025-09-23 18:11:45'),
(4, NULL, NULL, '0634916133', 'Audi a3', 35000.00, '3', '109', NULL, '2021', 200000, NULL, 'manuelle', NULL, 'Casablanca-Jnane Californie', '11', '3', 'WW au Maroc', 1, NULL, 0, 'compact', 'disponible', '[\"3-109-137936.jpg\",\"3-109-147615.jpg\"]', '3-109-150204.pdf', NULL, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 36, 1, '2025-09-23 11:04:08', '2025-09-29 20:11:09', NULL, 0, 'Noir', '2025-09-30 12:17:00', '2025-09-23 12:17:00'),
(5, NULL, NULL, '0638587557', 'Audi a4', 200000.00, '3', '106', NULL, '2014', 200000, 'diesel', 'manuelle', NULL, 'Kénitra', '11', '3', 'importé neuf', 0, NULL, 0, 'berline', NULL, '[\"3-106-503628.jpg\",\"3-106-832401.jpg\",\"3-106-894929.jpg\",\"3-106-385085.jpg\"]', NULL, NULL, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, '2025-09-23 21:44:43', '2025-10-15 16:45:47', NULL, 0, 'Bleu ardoise moyen', '2025-10-18 22:43:00', '2025-10-10 22:43:00');

-- --------------------------------------------------------

--
-- Table structure for table `nado_auto_encheres_bid`
--

CREATE TABLE `nado_auto_encheres_bid` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `enchere_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `proposition` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nado_auto_encheres_bid`
--

INSERT INTO `nado_auto_encheres_bid` (`id`, `enchere_id`, `client_id`, `proposition`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 20000.00, '2025-09-15 17:44:16', '2025-09-15 17:44:16'),
(2, 1, 2, 20000.00, '2025-09-16 18:02:09', '2025-09-16 18:02:09'),
(3, 1, 2, 20000.00, '2025-09-16 18:02:12', '2025-09-16 18:02:12'),
(4, 2, 14, 632000.00, '2025-09-20 11:13:53', '2025-09-20 11:13:53'),
(5, 1, 14, 638000.00, '2025-09-22 16:40:41', '2025-09-22 16:40:41'),
(6, 1, 14, 639000.00, '2025-09-23 18:03:05', '2025-09-23 18:03:05'),
(7, 4, 30, 39000.00, '2025-09-29 11:45:41', '2025-09-29 11:45:41'),
(8, 4, 30, 41000.00, '2025-09-29 11:56:17', '2025-09-29 11:56:17'),
(9, 4, 30, 42000.00, '2025-09-29 11:56:48', '2025-09-29 11:56:48'),
(10, 4, 14, 20000.00, '2025-09-29 16:39:20', '2025-09-29 16:39:20'),
(11, 4, 14, 20000.00, '2025-09-29 16:39:55', '2025-09-29 16:39:55'),
(12, 5, 14, 250000.00, '2025-10-15 13:17:47', '2025-10-15 13:17:47'),
(13, 5, 14, 250000.00, '2025-10-15 16:24:03', '2025-10-15 16:24:03'),
(14, 5, 14, 250000.00, '2025-10-15 16:24:57', '2025-10-15 16:24:57'),
(15, 5, 14, 260000.00, '2025-10-15 16:44:59', '2025-10-15 16:44:59'),
(16, 5, 14, 260000.00, '2025-10-15 16:45:43', '2025-10-15 16:45:43');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(125) NOT NULL,
  `notifiable_type` varchar(125) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('08563520-f99a-47f8-87f8-0b80bff30263', 'App\\Notifications\\NewClientRegistered', 'App\\Models\\User', 2, '{\"message\":\"Nouveau client: rehab\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/clients\\/10\"}', NULL, '2025-07-25 09:59:38', '2025-07-25 09:59:38'),
('0ce043f0-cd79-4bb2-8502-fc656498f5c0', 'App\\Notifications\\NewClientRegistered', 'App\\Models\\User', 1, '{\"message\":\"Nouveau client: Elhadi\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/clients\\/7\"}', NULL, '2025-07-22 18:47:47', '2025-07-22 18:47:47'),
('14f68576-e20c-4a13-b5f1-313efa270bb4', 'App\\Notifications\\NewClientRegistered', 'App\\Models\\User', 1, '{\"message\":\"Nouveau client: Oussama Elhadi\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/clients\\/8\"} ', NULL, '2025-07-22 18:53:30', '2025-07-22 18:53:30'),
('1e73867e-4d27-48e8-8457-23cc6819df99', 'App\\Notifications\\NewClientRegistered', 'App\\Models\\User', 1, '{\"message\":\"Nouveau client: rehab\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/clients\\/10\"}', NULL, '2025-07-25 09:59:38', '2025-07-25 09:59:38'),
('376a52cf-dccf-4057-95eb-07597266b4c0', 'App\\Notifications\\NewClientRegistered', 'App\\Models\\User', 2, '{\"message\":\"Nouveau client: Oussama Elhadi\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/clients\\/8\"}', NULL, '2025-07-22 18:53:30', '2025-07-22 18:53:30'),
('92157773-5030-45de-8eb1-87571da2a93a', 'App\\Notifications\\NewClientRegistered', 'App\\Models\\User', 1, '{\"message\":\"Nouveau client: Oussama Elhadi\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/clients\\/9\"}', NULL, '2025-07-22 18:54:35', '2025-07-22 18:54:35'),
('bb7a169d-d44f-4ad9-9324-b9f246299a4f', 'App\\Notifications\\NewClientRegistered', 'App\\Models\\User', 2, '{\"message\":\"Nouveau client: Elhadi\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/clients\\/7\"}', NULL, '2025-07-22 18:47:47', '2025-07-22 18:47:47'),
('cbcbaa36-17a4-4036-94e7-8dafd31afacd', 'App\\Notifications\\NewClientRegistered', 'App\\Models\\User', 2, '{\"message\":\"Nouveau client: Oussama Elhadi\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/clients\\/9\"}', NULL, '2025-07-22 18:54:35', '2025-07-22 18:54:35');

-- --------------------------------------------------------

--
-- Table structure for table `offres`
--

CREATE TABLE `offres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `car` varchar(125) NOT NULL,
  `prix` varchar(125) NOT NULL,
  `phone` varchar(125) NOT NULL,
  `offre` varchar(125) NOT NULL,
  `idads` int(11) NOT NULL,
  `status` varchar(125) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offres`
--

INSERT INTO `offres` (`id`, `car`, `prix`, `phone`, `offre`, `idads`, `status`, `comment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'MERCEDES Classe C bluetec 2014', '280000', '0606323210', '480000', 21, '', '', '2024-04-25 11:30:59', '2024-04-25 13:05:59', '2024-04-25 13:05:59'),
(2, 'NISSAN Juke 2021', '190000', '0704709214', '322333', 30, '', '', '2024-04-25 16:39:33', '2024-04-30 08:05:07', '2024-04-30 08:05:07'),
(3, 'TOYOTA Corolla 2019', '160000', '0665797171', '135000', 33, 'intéresse', 'comment', '2024-04-26 16:39:39', '2024-05-05 21:29:37', '2024-05-05 21:29:37'),
(4, 'TOYOTA Corolla 2019', '160000', '0665797171', '130000', 33, 'intéresse', 'comment', '2024-04-26 16:45:35', '2024-05-05 21:29:43', '2024-05-05 21:29:43'),
(5, 'TOYOTA C-HR 2017', '160000', '0665797171', '130000', 32, 'intéresse', 'comment', '2024-04-26 16:51:34', '2024-05-05 21:30:03', '2024-05-05 21:30:03'),
(6, 'TOYOTA Corolla 2019', '160000', '0674376205', '150000', 33, 'intéresse', 'comment', '2024-04-27 09:02:09', '2024-05-05 21:29:50', '2024-05-05 21:29:50'),
(7, 'NISSAN Juke 2021', '190000', '0600686909', 'Jarfi Ahmed', 30, 'supprime', 'il a deja acheter une voiture', '2024-04-27 11:07:31', '2024-05-11 10:26:18', NULL),
(8, 'TOYOTA C-HR 2017', '160000', '0648775465', '145000', 32, 'supprime', 'plus interesse', '2024-04-27 22:04:04', '2024-05-15 10:41:26', NULL),
(9, 'TOYOTA C-HR 2017', '160000', '0694697474', '140000', 32, 'qualifie', 'il a acheter une voiture', '2024-05-01 07:30:44', '2024-05-11 10:25:52', NULL),
(10, 'TOYOTA Corolla 2019', '160000', '0664852264', '15800', 33, 'supprime', 'voiture a ete vendu plus interesse', '2024-05-02 06:14:43', '2024-05-11 10:25:28', NULL),
(11, 'TOYOTA Corolla 2019', '160000', '0664600201', '161000', 33, '', '', '2024-05-02 10:22:37', '2024-05-03 06:43:53', '2024-05-03 06:43:53'),
(13, 'HYUNDAI Tucson 2021', '260000', '0643818890', '322333', 40, NULL, NULL, '2024-05-09 09:00:25', '2024-05-09 09:00:40', '2024-05-09 09:00:40'),
(14, 'DACIA Duster 2020', '179000', '0643818890', '12200', 38, NULL, NULL, '2024-05-09 09:33:54', '2024-05-09 09:34:03', '2024-05-09 09:34:03'),
(15, 'NISSAN Juke 2021', '190000', '0668176515', '165000', 30, 'supprime', 'cest vendu', '2024-05-10 15:28:02', '2024-05-15 10:41:15', NULL),
(16, 'OPEL Astra 2015', '125000', '0613342086', '100000', 41, 'interesse', '105000dh cest son plafond', '2024-05-12 15:38:50', '2024-05-13 08:07:45', NULL),
(17, 'RENAULT Kadjar 2020', '167000', '0663062347', '125000Dhs', 39, 'supprime', 'loin de prix', '2024-05-12 19:01:54', '2024-05-15 10:40:43', NULL),
(18, 'MERCEDES Classe C bluetec 2016', '270000', '0664247186', 'Mercedes-Benz classe C bluetec - 2016', 29, 'se rappeler', 'voiture deja vendu', '2024-05-12 20:27:44', '2024-05-17 09:22:31', NULL),
(19, 'LAND ROVER Range Rover Sport SE 2024', '310000', '0664247186', 'Range Rover Sport SE -2016', 14, 'supprime', 'double formulaire', '2024-05-12 20:41:04', '2024-05-15 10:40:51', NULL),
(20, 'HYUNDAI Tucson 2020', '282000', '0643818890', '322333', 44, NULL, NULL, '2024-05-13 13:27:21', '2024-05-13 13:27:30', '2024-05-13 13:27:30'),
(21, 'NISSAN Juke 2021', '190000', '0643818890', '322333', 30, NULL, NULL, '2024-05-14 15:42:19', '2024-05-14 15:42:27', '2024-05-14 15:42:27'),
(22, 'OPEL Astra 2015', '125000', '0722257668', '107000', 41, 'interesse', 'va me rappeler pour un rdv', '2024-05-15 06:58:04', '2024-05-15 09:07:09', NULL),
(23, 'RENAULT Kadjar 2020', '167000', '0663062347', '127000', 39, NULL, 'toujours interesse va essayer d\'augmenter sa proposition', '2024-05-16 13:28:28', '2024-05-17 09:15:38', NULL),
(24, 'HYUNDAI Tucson 2021', '260000', '+212660402344', '140000', 40, 'supprime', 'vendu client ne repend pas', '2024-05-17 18:00:01', '2024-05-21 09:04:06', NULL),
(25, 'VOLKSWAGEN Touareg 2021', '500000', '0770080009', '322333', 35, NULL, NULL, '2024-05-20 09:37:37', '2024-05-20 09:37:47', '2024-05-20 09:37:47'),
(26, 'TOYOTA Corolla 2019', '160000', '0625702561', '147000 cash', 33, 'interesse', 'interesse pour la corolla prestige', '2024-05-20 12:33:11', '2024-05-21 09:03:58', NULL),
(27, 'MERCEDES Classe A 2020', '420000', '0808631836', '322333', 48, NULL, NULL, '2024-05-22 20:37:02', '2024-05-22 21:18:02', '2024-05-22 21:18:02'),
(28, 'TOYOTA C-HR 2017', '160000', '0770080009', '150000', 32, 'se rappeler', 'ne repend pas', '2024-05-23 20:58:26', '2024-05-24 07:17:37', NULL),
(29, 'BMW Série 1 Sport 2022', '265000', '0780712217', '4000 drh/mois', 18, NULL, 'interesse par credit il est a agdir va nous rappeler', '2024-05-24 11:58:12', '2024-05-24 14:38:19', NULL),
(30, 'BMW X1 2017', '210000', '0660754726', '200000', 51, 'qualifie', 'sht faire une reprise il a une focus 2011', '2024-05-27 06:28:43', '2024-05-27 07:59:38', NULL),
(31, 'HYUNDAI I 30 2013', '136000', '0676830369', '133000', 52, 'interesse', 'rdv fixe pour la voire', '2024-05-27 11:31:24', '2024-05-28 07:31:09', NULL),
(32, 'BMW X1 2017', '210000', '0660754726', '190000', 51, 'interesse', 'Pour BMX Automatique - offre 195000', '2024-06-01 17:05:31', '2024-06-03 10:16:39', NULL),
(33, 'HYUNDAI Tucson 2016', '190000', '0661233595', '160000', 53, 'interesse', 'Prix max 160000', '2024-06-01 21:35:53', '2024-06-03 10:16:11', NULL),
(34, 'BMW X1 2017', '210000', '0665870344', '190000', 51, 'supprime', 'Pas intéressé', '2024-06-03 09:29:16', '2024-06-05 09:04:03', NULL),
(35, 'NISSAN Micra 2021', '156000', '0644949309', '120000', 45, 'supprime', 'voiture vendu', '2024-06-04 16:15:59', '2024-06-05 09:23:22', NULL),
(36, 'DACIA Sandero Stepway 2022', '155000', '0644949309', '125000', 50, 'supprime', 'voiture vendu', '2024-06-04 16:16:32', '2024-06-05 09:23:17', NULL),
(37, 'HYUNDAI Tucson 2016', '190000', '0661821520', '160000', 53, 'interesse', 'offre 170 000 DH', '2024-06-06 16:36:19', '2024-06-07 14:47:24', NULL),
(38, 'HYUNDAI Tucson 2016', '190000', '0698196913', '180000', 53, 'interesse', 'Rendez-vous 07-06-2024', '2024-06-06 20:50:08', '2024-06-07 14:55:19', NULL),
(39, 'HYUNDAI Tucson 2016', '190000', '0707897106', '155000', 53, 'supprime', 'Prix ​​acceptable', '2024-06-07 18:38:44', '2024-06-11 10:09:42', NULL),
(40, 'HYUNDAI Tucson 2016', '190000', '0661821520', '170000.00', 53, 'interesse', 'HYUNDAI Tucson', '2024-06-08 09:52:10', '2024-06-08 10:33:39', NULL),
(41, 'HYUNDAI Tucson 2016', '190000', '0661434821', '175000', 53, 'interesse', 'Repris laguna renault 2005 - 200 000Km', '2024-06-08 12:58:24', '2024-06-10 09:37:34', NULL),
(42, 'HYUNDAI Tucson 2016', '190000', '060065343', '160000', 53, 'supprime', 'Téléphone manquant', '2024-06-09 16:29:57', '2024-06-10 09:41:15', NULL),
(43, 'HYUNDAI Tucson 2016', '190000', '0600653422', '160000', 53, 'supprime', 'Prix ​​acceptable', '2024-06-09 16:30:25', '2024-06-11 10:09:39', NULL),
(44, 'HYUNDAI Tucson 2016', '190000', '0668140192', '183000', 53, 'interesse', 'Réservation 183 000 DH', '2024-06-10 09:32:59', '2024-06-10 10:42:13', NULL),
(45, 'HYUNDAI Tucson 2016', '190000', '0661821520', '170000.00', 53, 'supprime', 'Prix ​​acceptable', '2024-06-11 06:18:48', '2024-06-11 10:09:50', NULL),
(46, 'HYUNDAI Tucson 2016', '190000', '0661821520', '172000', 53, 'supprime', 'Prix ​​acceptable', '2024-06-12 08:44:48', '2024-06-12 09:26:42', NULL),
(47, 'HYUNDAI Tucson 2016', '190000', '0661821520', '175000', 53, 'se rappeler', 'Prix ​​acceptable', '2024-06-13 13:50:14', '2024-06-14 17:21:27', NULL),
(48, 'BMW X1 2017', '210000', '0649219664', '200000', 51, NULL, NULL, '2024-06-13 20:13:28', '2024-06-13 20:13:28', NULL),
(49, 'HYUNDAI Tucson 2016', '190000', '0661821520', '175000.00', 53, 'se rappeler', 'Prix ​​acceptable', '2024-06-14 08:15:55', '2024-06-14 17:21:41', NULL),
(50, 'BMW X1 2017', '210000', '0614931845', '200000', 51, NULL, NULL, '2024-06-14 10:55:17', '2024-06-14 10:55:17', NULL),
(51, 'BMW Série 1 Sport 2020', '265000', '0600003325', '250000', 18, NULL, NULL, '2024-06-14 11:03:49', '2024-06-14 11:03:49', NULL),
(52, 'DACIA Duster 2020', '179000', '0644305577', '150000', 38, 'supprime', 'voiture vendu', '2024-06-14 13:34:18', '2024-06-14 17:22:59', NULL),
(53, 'SEAT Arona 2022', '196000', '0644949309', '170000', 42, 'supprime', 'voiture vendu', '2024-06-15 13:09:01', '2024-07-02 09:20:58', NULL),
(54, 'HYUNDAI Tucson 2016', '190000', '0661821520', '175000.00', 53, 'supprime', 'Prix ​​acceptable', '2024-06-16 11:09:02', '2024-06-18 08:00:27', NULL),
(55, 'HYUNDAI Tucson 2016', '190000', '0669444499', '170000', 53, 'supprime', 'Prix ​​acceptable', '2024-06-18 03:09:05', '2024-06-18 08:00:41', NULL),
(56, 'HYUNDAI Tucson 2016', '190000', '0661821520', '175000.00', 53, 'supprime', 'Prix ​​acceptable', '2024-06-20 07:19:30', '2024-07-02 11:45:52', NULL),
(57, 'RENAULT Kadjar 2020', '167000', '0644949309', '150000', 39, 'se rappeler', '150000 dh bg SUV 2020', '2024-06-22 21:12:16', '2024-07-02 09:34:24', NULL),
(58, 'VOLKSWAGEN Tiguan 2018', '227000', '0665309165', '200000', 36, 'se rappeler', NULL, '2024-07-01 14:22:06', '2024-07-02 09:21:27', NULL),
(59, 'PEUGEOT 3008 2018', '245000', '0663433636', '226000', 47, 'interesse', 'FINANCEMENT - SALA', '2024-07-02 08:25:52', '2024-07-02 09:44:17', NULL),
(60, 'SEAT Arona 2022', '196000', '0663433636', '180000', 42, 'interesse', 'FINANCEMENT - SALA', '2024-07-02 08:27:25', '2024-07-02 09:43:16', NULL),
(61, 'RENAULT Kadjar 2020', '167000', '0663433636', '155000', 39, 'interesse', 'FINANCEMENT - SALA', '2024-07-02 08:28:37', '2024-07-02 09:44:00', NULL),
(62, 'DACIA Duster 2018', '177000', '0608351665', '160000', 46, 'interesse', NULL, '2024-07-02 11:44:22', '2024-07-02 11:46:39', '2024-07-02 11:46:39'),
(63, 'HYUNDAI Tucson 2016', '190000', '0707763415', '322333', 53, NULL, NULL, '2024-07-04 08:19:18', '2024-07-04 08:19:27', '2024-07-04 08:19:27'),
(64, 'HONDA CR-V 2014', '170000', '0669593948', '145000', 55, 'interesse', 'Intéressé HONDA CR-V', '2024-07-04 10:23:12', '2024-07-04 14:48:12', NULL),
(65, 'HYUNDAI Tucson 2022', '250000', '0770080009', '240000', 56, NULL, NULL, '2024-07-04 17:17:15', '2024-07-08 07:52:45', '2024-07-08 07:52:45'),
(66, 'HYUNDAI Tucson 2022', '265000', '0649720871', 'Souhail amzil', 19, 'se rappeler', NULL, '2024-07-07 01:17:45', '2024-07-08 13:49:14', NULL),
(67, 'AUDI Q5 2011', '160000', '0713946195', '150000', 37, 'interesse', 'A TANGER', '2024-07-08 21:18:20', '2024-07-09 09:07:16', NULL),
(68, 'HYUNDAI Tucson 2022', '250000', '0661821520', '220000.00', 56, 'se rappeler', 'interesse budget  220000', '2024-07-10 10:53:28', '2024-07-10 14:31:41', NULL),
(69, 'RENAULT Koleos 2010', '35000', '+212653448199', '25000', 60, 'se rappeler', NULL, '2024-07-10 12:35:19', '2024-07-11 09:29:59', NULL),
(70, 'RENAULT Koleos 2010', '35000', '0663680168', '35000', 60, 'interesse', 'RDV SAMEDI', '2024-07-14 16:41:58', '2024-07-15 08:19:55', NULL),
(71, 'RENAULT Koleos 2010', '35000', '0771352432', 'Intéressée', 60, 'se rappeler', NULL, '2024-07-14 21:14:31', '2024-07-15 08:21:21', NULL),
(72, 'HYUNDAI Tucson 2022', '250000', '0666-719220', 'Tucson 2022', 56, 'interesse', 'PRESQUE VENDUE', '2024-07-15 02:36:29', '2024-07-15 08:23:03', NULL),
(73, 'AUDI A4 2019', '280000', '0661245021', '265000', 20, 'interesse', 'A4/BMW S5', '2024-07-15 08:54:12', '2024-07-15 12:05:07', NULL),
(74, 'PEUGEOT 3008 2018', '237000', '0724756763', '220000', 63, 'interesse', 'FINANCEMENT', '2024-07-17 07:12:17', '2024-07-17 14:58:31', NULL),
(75, 'HYUNDAI Tucson 2021', '263000', '0707763415', '322333', 67, NULL, NULL, '2024-07-19 08:42:22', '2024-07-19 08:42:29', '2024-07-19 08:42:29'),
(76, 'HYUNDAI Tucson 2020', '282000', '0640501652', '240000', 44, 'interesse', '240000 P.MAX', '2024-07-25 10:54:44', '2024-07-27 12:34:59', NULL),
(77, 'HYUNDAI I 10 2012', '68000', '07994646641', '70000', 72, NULL, NULL, '2024-07-25 14:38:51', '2024-07-25 14:39:35', '2024-07-25 14:39:35'),
(78, 'HYUNDAI Tucson 2022', '250000', '0661821520', '230000', 56, 'se rappeler', 'Propose tucson 2017', '2024-07-27 16:54:29', '2024-07-29 08:53:39', NULL),
(79, 'AUDI Q5 2011', '160000', '+212675759757', '153000', 37, 'supprime', 'Déjà acheter', '2024-07-27 22:29:08', '2024-07-29 12:07:46', NULL),
(80, 'HYUNDAI I 10 2012', '0', '0636193270', '61000', 72, 'se rappeler', 'samedi', '2024-07-28 08:18:59', '2024-07-29 08:54:23', NULL),
(81, 'HYUNDAI I 10 2012', '0', '0636193270', '61500', 72, 'se rappeler', 'samedi', '2024-07-28 08:19:14', '2024-07-29 09:52:16', '2024-07-29 09:52:16'),
(82, 'HYUNDAI Tucson 2021', '263000', '06 64 10 92 87', '240000', 67, 'se rappeler', 'Bdg 240000', '2024-07-28 15:23:12', '2024-07-30 09:30:54', NULL),
(83, 'HYUNDAI I 10 2012', '40000', '06060606', '63000', 72, NULL, NULL, '2024-07-29 10:27:53', '2024-07-29 10:41:27', '2024-07-29 10:41:27'),
(84, 'HYUNDAI I 10 2012', '40000', '0615432300', '60000', 72, NULL, NULL, '2024-07-29 10:28:31', '2024-07-29 10:41:29', '2024-07-29 10:41:29'),
(85, 'HYUNDAI I 10 2012', '40000', '+212655555515', '420000', 72, NULL, NULL, '2024-07-29 16:13:13', '2024-07-30 08:07:31', '2024-07-30 08:07:31'),
(86, 'HYUNDAI I 10 2012', '40000', '0688076947', '55000 dhs', 72, NULL, NULL, '2024-07-29 17:55:56', '2024-07-29 17:55:56', NULL),
(87, 'HYUNDAI I 10 2012', '40000', '0659323167', '45000', 72, NULL, NULL, '2024-07-30 08:20:23', '2024-07-30 08:20:23', NULL),
(88, 'HYUNDAI I 10 2012', '40000', '0664870083', '50000', 72, NULL, NULL, '2024-07-30 08:47:05', '2024-07-30 08:47:05', NULL),
(89, 'SEAT Arona 2022', '196000', '0644949309', '170000', 42, 'se rappeler', 'Intéressé seat arona 2019 bdj 170', '2024-07-30 09:17:34', '2024-07-30 09:27:10', NULL),
(90, 'HYUNDAI I 10 2012', '40000', '0666673612', '50000', 72, NULL, NULL, '2024-07-30 09:24:44', '2024-07-30 09:24:44', NULL),
(91, 'HYUNDAI I 10 2012', '40000', '0662162272', '50000', 72, NULL, NULL, '2024-07-30 09:44:05', '2024-07-30 09:44:05', NULL),
(92, 'HYUNDAI I 10 2012', '40000', '0770886035', '37000', 72, NULL, NULL, '2024-07-30 10:23:58', '2024-07-30 10:23:58', NULL),
(93, 'HYUNDAI I 10 2012', '40000', '0771049729', '41000', 72, NULL, NULL, '2024-07-30 11:11:27', '2024-07-30 11:11:27', NULL),
(94, 'HYUNDAI I 10 2012', '40000', '0664624614', '50000', 72, 'se rappeler', NULL, '2024-07-30 11:58:36', '2024-07-30 15:18:57', NULL),
(95, 'HYUNDAI I 10 2012', '40000', '0661445623', '80000', 72, 'se rappeler', NULL, '2024-07-30 12:36:08', '2024-07-30 15:18:53', NULL),
(96, 'HYUNDAI I 10 2012', '40000', '0656132245', '77000', 72, 'se rappeler', NULL, '2024-07-30 12:38:09', '2024-07-30 15:18:50', NULL),
(97, 'HYUNDAI I 10 2012', '40000', '0642604823', '62000', 72, 'se rappeler', NULL, '2024-07-30 13:02:04', '2024-07-30 15:18:32', NULL),
(98, 'HYUNDAI I 10 2012', '40000', '0642604823', '63000', 72, 'se rappeler', NULL, '2024-07-30 13:12:10', '2024-07-30 15:18:28', NULL),
(99, 'HYUNDAI I 10 2012', '40000', '0699632989', '50000', 72, 'se rappeler', NULL, '2024-07-30 13:32:58', '2024-07-30 15:18:12', NULL),
(100, 'HYUNDAI I 10 2012', '40000', '0703124945', '52000', 72, 'se rappeler', NULL, '2024-07-30 14:03:49', '2024-07-30 15:18:08', NULL),
(101, 'HYUNDAI I 10 2012', '40000', '0625399713', '43000', 72, 'se rappeler', NULL, '2024-07-30 14:50:20', '2024-07-30 15:18:05', NULL),
(102, 'HYUNDAI I 10 2012', '40000', 'X', '90000', 72, 'se rappeler', NULL, '2024-07-30 14:58:02', '2024-07-30 15:18:01', NULL),
(103, 'HYUNDAI I 10 2012', '40000', '0670658541', '47000', 72, 'se rappeler', NULL, '2024-07-30 15:04:44', '2024-07-30 15:17:52', NULL),
(104, 'HYUNDAI I 10 2012', '40000', '0651192246', '41000', 72, NULL, NULL, '2024-07-30 15:22:57', '2024-07-30 15:22:57', NULL),
(105, 'HYUNDAI I 10 2012', '40000', '0705753486', '42500', 72, NULL, NULL, '2024-07-30 17:27:19', '2024-07-30 17:27:19', NULL),
(106, 'HYUNDAI I 10 2012', '40000', '0612045399', '45000', 72, NULL, NULL, '2024-07-30 17:52:52', '2024-07-30 17:52:52', NULL),
(107, 'HYUNDAI I 10 2012', '40000', '0665705624', 'Hyundai i10', 72, NULL, NULL, '2024-07-30 18:32:33', '2024-07-30 18:32:33', NULL),
(108, 'HYUNDAI I 10 2012', '40000', '0641048468', '50000', 72, NULL, NULL, '2024-07-30 18:49:54', '2024-07-30 18:49:54', NULL),
(109, 'HYUNDAI I 10 2012', '40000', '0663140953', '55000', 72, NULL, NULL, '2024-07-30 18:51:15', '2024-07-30 18:51:15', NULL),
(110, 'HYUNDAI I 10 2012', '40000', '212661403592', '45000', 72, NULL, NULL, '2024-07-30 20:36:36', '2024-07-30 20:36:36', NULL),
(111, 'HYUNDAI I 10 2012', '40000', '0623426200', '40000', 72, NULL, NULL, '2024-07-30 21:32:56', '2024-07-30 21:32:56', NULL),
(112, 'HYUNDAI I 10 2012', '40000', '0615100008', '50000', 72, NULL, NULL, '2024-07-30 22:20:03', '2024-07-30 22:20:03', NULL),
(113, 'HYUNDAI I 10 2012', '40000', '0637524224', '50000 dh', 72, NULL, NULL, '2024-07-30 23:28:46', '2024-07-30 23:28:46', NULL),
(114, 'HYUNDAI I 10 2012', '40000', '0663266310', '45000', 72, NULL, NULL, '2024-07-31 00:18:31', '2024-07-31 00:18:31', NULL),
(115, 'HYUNDAI I 10 2012', '40000', '+212667127768', '42000', 72, NULL, NULL, '2024-07-31 05:50:51', '2024-07-31 05:50:51', NULL),
(116, 'HYUNDAI I 10 2012', '40000', '0708961355', 'Hyundai i10', 72, NULL, NULL, '2024-07-31 05:57:01', '2024-07-31 05:57:01', NULL),
(117, 'HYUNDAI I 10 2012', '40000', '0700091835', '40000', 72, NULL, NULL, '2024-07-31 06:16:16', '2024-07-31 06:16:16', NULL),
(118, 'HYUNDAI Tucson 2017', '210000', '0640501652', '180000', 74, 'supprime', 'Discutez du prix', '2024-07-31 07:04:15', '2024-07-31 09:24:22', NULL),
(119, 'HYUNDAI I 10 2012', '40000', '0675571144', '43000', 72, NULL, NULL, '2024-07-31 08:20:15', '2024-07-31 08:20:15', NULL),
(120, 'HYUNDAI I 10 2012', '40000', '0658628873', '50000 dh', 72, NULL, NULL, '2024-07-31 08:33:17', '2024-07-31 08:33:17', NULL),
(121, 'HYUNDAI I 10 2012', '40000', '0609928830', '40000', 72, NULL, NULL, '2024-07-31 08:49:27', '2024-07-31 08:49:27', NULL),
(122, 'HYUNDAI I 10 2012', '40000', '0609928830', '42000', 72, NULL, NULL, '2024-07-31 08:58:58', '2024-07-31 08:58:58', NULL),
(123, 'HYUNDAI I 10 2012', '40000', '0661103655', '51000 dh', 72, NULL, NULL, '2024-07-31 09:11:32', '2024-07-31 09:11:32', NULL),
(124, 'HYUNDAI I 10 2012', '40000', '0663171340', 'Prix 48500.00dh', 72, NULL, NULL, '2024-07-31 09:28:28', '2024-07-31 09:28:28', NULL),
(125, 'HYUNDAI I 10 2012', '40000', '0663171340', 'Prix 48500.00dh', 72, NULL, NULL, '2024-07-31 09:29:11', '2024-07-31 09:29:11', NULL),
(126, 'HYUNDAI I 10 2012', '40000', '0670658542', '50000', 72, NULL, NULL, '2024-07-31 09:39:31', '2024-07-31 09:39:31', NULL),
(127, 'HYUNDAI I 10 2012', '40000', '0667543782', '42000', 72, NULL, NULL, '2024-07-31 09:41:58', '2024-07-31 09:41:58', NULL),
(128, 'HYUNDAI I 10 2012', '40000', '0770080009', '322333', 72, NULL, NULL, '2024-07-31 10:04:10', '2024-07-31 10:10:08', '2024-07-31 10:10:08'),
(129, 'HYUNDAI I 10 2012', '40000', '000000000', '00000', 72, NULL, NULL, '2024-07-31 10:06:57', '2024-07-31 10:10:28', '2024-07-31 10:10:28'),
(130, 'HYUNDAI I 10 2012', '40000', '0648655386', '50000', 72, NULL, NULL, '2024-07-31 10:09:28', '2024-07-31 10:09:28', NULL),
(131, 'HYUNDAI I 10 2012', '40000', '0660426035', '51000', 72, NULL, NULL, '2024-07-31 10:34:42', '2024-07-31 10:34:42', NULL),
(132, 'HYUNDAI I 10 2012', '40000', '0660426035', '51000', 72, NULL, NULL, '2024-07-31 10:35:30', '2024-07-31 10:35:30', NULL),
(133, 'HYUNDAI I 10 2012', '40000', '0661509635', '42-45000', 72, NULL, NULL, '2024-07-31 10:40:15', '2024-07-31 10:40:15', NULL),
(134, 'HYUNDAI I 10 2012', '40000', '0676441184', '44000', 72, NULL, NULL, '2024-07-31 10:51:35', '2024-07-31 10:51:35', NULL),
(135, 'HYUNDAI I 10 2012', '40000', '0676441184', '44000', 72, NULL, NULL, '2024-07-31 10:52:07', '2024-07-31 10:52:07', NULL),
(136, 'HYUNDAI I 10 2012', '40000', '0612634790', '40000', 72, NULL, NULL, '2024-07-31 11:00:47', '2024-07-31 11:00:47', NULL),
(137, 'HYUNDAI I 10 2012', '40000', '0612634790', '45000', 72, NULL, NULL, '2024-07-31 11:06:12', '2024-07-31 11:06:12', NULL),
(138, 'HYUNDAI I 10 2012', '40000', '0706912395', 'Anouar. 50000 dh', 72, NULL, NULL, '2024-07-31 11:57:41', '2024-07-31 11:57:41', NULL),
(139, 'HYUNDAI I 10 2012', '40000', '0613015291', '50000 dh', 72, NULL, NULL, '2024-07-31 12:01:18', '2024-07-31 12:01:18', NULL),
(140, 'HYUNDAI I 10 2012', '40000', '0613015291', '50000 dh', 72, NULL, NULL, '2024-07-31 12:01:53', '2024-07-31 12:01:53', NULL),
(141, 'HYUNDAI I 10 2012', '40000', '0661567300', '37000', 72, NULL, NULL, '2024-07-31 12:25:46', '2024-07-31 12:25:46', NULL),
(142, 'HYUNDAI I 10 2012', '40000', '0684842483', '41000', 72, NULL, NULL, '2024-07-31 14:04:51', '2024-07-31 14:04:51', NULL),
(143, 'HYUNDAI I 10 2012', '40000', '0661567300', '40000', 72, NULL, NULL, '2024-07-31 14:13:18', '2024-07-31 14:13:18', NULL),
(144, 'HYUNDAI I 10 2012', '40000', '0668518250', '46000', 72, NULL, NULL, '2024-07-31 14:51:45', '2024-07-31 14:51:45', NULL),
(145, 'HYUNDAI I 10 2012', '40000', '0720982929', '45500', 72, NULL, NULL, '2024-07-31 14:52:59', '2024-07-31 14:52:59', NULL),
(146, 'HYUNDAI I 10 2012', '40000', '0712568662', '43000', 72, NULL, NULL, '2024-07-31 15:04:27', '2024-07-31 15:04:27', NULL),
(147, 'HYUNDAI I 10 2012', '40000', '0607912395', '50000', 72, NULL, NULL, '2024-07-31 15:32:55', '2024-07-31 15:32:55', NULL),
(148, 'HYUNDAI Tucson 2017', '210000', '0676425320', '200000', 74, 'interesse', 'RDV', '2024-07-31 15:57:51', '2024-08-01 08:43:02', NULL),
(149, 'HYUNDAI I 10 2012', '40000', '+212691439482', '47500', 72, NULL, NULL, '2024-07-31 17:52:54', '2024-07-31 17:52:54', NULL),
(150, 'HYUNDAI I 10 2012', '40000', '0664453158', '57500 DH', 72, NULL, NULL, '2024-07-31 18:02:57', '2024-07-31 18:02:57', NULL),
(151, 'HYUNDAI I 10 2012', '40000', '0635038601', '42000', 72, NULL, NULL, '2024-07-31 20:30:02', '2024-07-31 20:30:02', NULL),
(152, 'HYUNDAI I 10 2012', '40000', '0667543782', '42500', 72, NULL, NULL, '2024-08-01 06:41:11', '2024-08-01 06:41:11', NULL),
(153, 'HYUNDAI I 10 2012', '40000', '0661280467', '41000', 72, NULL, NULL, '2024-08-01 08:12:33', '2024-08-01 08:12:33', NULL),
(154, 'HYUNDAI I 10 2012', '40000', '0602353594', '50000', 72, NULL, NULL, '2024-08-01 09:05:17', '2024-08-01 09:05:17', NULL),
(155, 'HYUNDAI I 10 2012', '40000', '0661-658691', '50000', 72, NULL, NULL, '2024-08-01 09:27:00', '2024-08-01 09:27:00', NULL),
(156, 'HYUNDAI I 10 2012', '40000', '0620083283', '60000 dh', 72, NULL, NULL, '2024-08-01 10:03:12', '2024-08-01 10:03:12', NULL),
(157, 'HYUNDAI I 10 2012', '40000', '0616583549', '40000', 72, NULL, NULL, '2024-08-01 10:43:31', '2024-08-01 10:43:31', NULL),
(158, 'HYUNDAI I 10 2012', '40000', '0663157568', '45000dh', 72, NULL, NULL, '2024-08-01 10:53:23', '2024-08-01 10:53:23', NULL),
(159, 'HYUNDAI I 10 2012', '40000', '0703287146', '50000', 72, NULL, NULL, '2024-08-01 11:25:54', '2024-08-01 11:25:54', NULL),
(160, 'HYUNDAI I 10 2012', '40000', '0604216223', '45000', 72, NULL, NULL, '2024-08-01 11:32:19', '2024-08-01 11:32:19', NULL),
(161, 'HYUNDAI I 10 2012', '40000', '0606664052', '51300', 72, NULL, NULL, '2024-08-01 11:33:11', '2024-08-01 11:33:11', NULL),
(162, 'HYUNDAI I 10 2012', '40000', '0771910711', '45000 dh', 72, NULL, NULL, '2024-08-01 11:47:28', '2024-08-01 11:47:28', NULL),
(163, 'HYUNDAI I 10 2012', '40000', '0600074346', '50000', 72, NULL, NULL, '2024-08-01 12:32:35', '2024-08-01 12:32:35', NULL),
(164, 'HYUNDAI I 10 2012', '40000', '0698969199', '410000', 72, NULL, NULL, '2024-08-01 13:03:12', '2024-08-01 13:03:12', NULL),
(165, 'HYUNDAI I 10 2012', '40000', '0645934814', '45000', 72, NULL, NULL, '2024-08-01 13:13:25', '2024-08-01 13:13:25', NULL),
(166, 'HYUNDAI I 10 2012', '40000', '0662675049', '46000', 72, NULL, NULL, '2024-08-01 13:14:28', '2024-08-01 13:14:28', NULL),
(167, 'HYUNDAI Tucson 2017', '210000', '0635026290', '190000', 74, NULL, NULL, '2024-08-01 16:26:14', '2024-08-01 16:26:14', NULL),
(168, 'HYUNDAI I 10 2012', '40000', '0682151658', '58000 dhs', 72, NULL, NULL, '2024-08-01 17:36:36', '2024-08-01 17:36:36', NULL),
(169, 'HYUNDAI I 10 2012', '40000', '0605750981', '50000dh', 72, NULL, NULL, '2024-08-01 17:38:40', '2024-08-01 17:38:40', NULL),
(170, 'HYUNDAI I 10 2012', '40000', '0627020716', '47000', 72, NULL, NULL, '2024-08-01 17:44:20', '2024-08-01 17:44:20', NULL),
(171, 'HYUNDAI I 10 2012', '40000', '0675885455', '45000', 72, NULL, NULL, '2024-08-01 17:49:29', '2024-08-01 17:49:29', NULL),
(172, 'HYUNDAI I 10 2012', '40000', '0606659367', '40500', 72, NULL, NULL, '2024-08-01 17:50:50', '2024-08-01 17:50:50', NULL),
(173, 'HYUNDAI I 10 2012', '40000', '0606659367', '45000', 72, NULL, NULL, '2024-08-01 17:51:24', '2024-08-01 17:51:24', NULL),
(174, 'HYUNDAI I 10 2012', '40000', '0655-555052', '55000dh', 72, NULL, NULL, '2024-08-01 17:57:54', '2024-08-01 17:57:54', NULL),
(175, 'RENAULT Koleos 2010', '35000', '0626848085', '35000', 60, NULL, NULL, '2024-08-01 17:57:55', '2024-08-01 17:57:55', NULL),
(176, 'HYUNDAI I 10 2012', '40000', '0600024640', '55500', 72, NULL, NULL, '2024-08-01 18:00:44', '2024-08-01 18:00:44', NULL),
(177, 'HYUNDAI I 30 2013', '136000', '0626848085', '130000', 52, NULL, NULL, '2024-08-01 18:01:00', '2024-08-01 18:01:00', NULL),
(178, 'HYUNDAI I 10 2012', '40000', '0708278859', '45000', 72, NULL, NULL, '2024-08-01 18:02:27', '2024-08-01 18:02:27', NULL),
(179, 'HYUNDAI I 10 2012', '40000', '068949', '95000', 72, NULL, NULL, '2024-08-01 18:11:19', '2024-08-02 08:13:21', '2024-08-02 08:13:21'),
(180, 'HYUNDAI I 10 2012', '40000', '0645003054', '42000', 72, NULL, NULL, '2024-08-01 19:06:15', '2024-08-01 19:06:15', NULL),
(181, 'HYUNDAI I 10 2012', '40000', '0601626161', '42.000', 72, NULL, NULL, '2024-08-01 19:07:09', '2024-08-01 19:07:09', NULL),
(182, 'HYUNDAI I 10 2012', '40000', '+212691439482', '47500', 72, NULL, NULL, '2024-08-01 19:16:21', '2024-08-01 19:16:21', NULL),
(183, 'HYUNDAI I 10 2012', '40000', '0687445543', '45000', 72, NULL, NULL, '2024-08-01 19:29:57', '2024-08-01 19:29:57', NULL),
(184, 'HYUNDAI I 10 2012', '40000', '065414353', '100', 72, NULL, NULL, '2024-08-01 19:45:14', '2024-08-01 19:45:14', NULL),
(185, 'HYUNDAI I 10 2012', '40000', '066666666666', '10000', 72, NULL, NULL, '2024-08-01 19:54:11', '2024-08-01 19:54:11', NULL),
(186, 'HYUNDAI I 10 2012', '40000', '0618942425', '41000', 72, NULL, NULL, '2024-08-01 22:38:06', '2024-08-01 22:38:06', NULL),
(187, 'HYUNDAI I 10 2012', '40000', '0662118076', '45500', 72, NULL, NULL, '2024-08-01 23:34:53', '2024-08-01 23:34:53', NULL),
(188, 'HYUNDAI I 10 2012', '40000', '0603092413', '40000', 72, NULL, NULL, '2024-08-01 23:39:36', '2024-08-01 23:39:36', NULL),
(189, 'HYUNDAI I 10 2012', '40000', '0691114080', '49500 DH', 72, NULL, NULL, '2024-08-01 23:52:39', '2024-08-01 23:52:39', NULL),
(190, 'HYUNDAI I 10 2012', '40000', '0668327535', '45000dh', 72, NULL, NULL, '2024-08-02 00:46:30', '2024-08-02 00:46:30', NULL),
(191, 'HYUNDAI I 10 2012', '40000', '0697429159', '40000', 72, NULL, NULL, '2024-08-02 02:49:37', '2024-08-02 02:49:37', NULL),
(192, 'HYUNDAI I 10 2012', '40000', '0708050356', '59000 dh', 72, NULL, NULL, '2024-08-02 03:12:15', '2024-08-02 03:12:15', NULL),
(193, 'HYUNDAI I 10 2012', '40000', 'Yy', '50000 dh', 72, NULL, NULL, '2024-08-02 03:12:44', '2024-08-02 03:12:44', NULL),
(194, 'HYUNDAI I 10 2012', '40000', '77654', '57000 dh', 72, NULL, NULL, '2024-08-02 03:13:04', '2024-08-02 03:13:04', NULL),
(195, 'HYUNDAI I 10 2012', '40000', '0663171340', '48700,00dh', 72, NULL, NULL, '2024-08-02 05:45:12', '2024-08-02 05:45:12', NULL),
(196, 'HYUNDAI I 10 2012', '40000', '0764467075', '40100', 72, NULL, NULL, '2024-08-02 06:35:28', '2024-08-02 06:35:28', NULL),
(197, 'HYUNDAI I 10 2012', '40000', '0676586659', '45000', 72, NULL, NULL, '2024-08-02 08:04:51', '2024-08-02 08:04:51', NULL),
(198, 'HYUNDAI I 10 2012', '40000', '0600870013', '41000', 72, NULL, NULL, '2024-08-02 08:36:51', '2024-08-02 08:36:51', NULL),
(199, 'HYUNDAI I 10 2012', '40000', '0684918776', '46000', 72, NULL, NULL, '2024-08-02 08:49:04', '2024-08-02 08:49:04', NULL),
(200, 'HYUNDAI I 10 2012', '40000', '0631979697', '46000', 72, NULL, NULL, '2024-08-02 08:50:25', '2024-08-02 08:50:25', NULL),
(201, 'HYUNDAI I 10 2012', '40000', '0667543782', '43000', 72, NULL, NULL, '2024-08-02 09:17:34', '2024-08-02 09:17:34', NULL),
(202, 'HYUNDAI I 10 2012', '40000', '0632391089', '43000dh', 72, NULL, NULL, '2024-08-02 09:27:13', '2024-08-02 09:27:13', NULL),
(203, 'HYUNDAI I 10 2012', '40000', '0638065997', '50000dh', 72, NULL, NULL, '2024-08-02 09:36:31', '2024-08-02 09:36:31', NULL),
(204, 'HYUNDAI I 10 2012', '40000', '0625881663', '52000dh', 72, NULL, NULL, '2024-08-02 09:38:03', '2024-08-02 09:38:03', NULL),
(205, 'HYUNDAI I 10 2012', '40000', '0619795253', '49500', 72, NULL, NULL, '2024-08-02 09:57:11', '2024-08-02 09:57:11', NULL),
(206, 'HYUNDAI I 10 2012', '40000', '0617465053', '49000', 72, NULL, NULL, '2024-08-02 12:04:53', '2024-08-02 12:04:53', NULL),
(207, 'HYUNDAI I 10 2012', '40000', '0652086477', 'Oui', 72, NULL, NULL, '2024-08-02 12:30:55', '2024-08-02 12:30:55', NULL),
(208, 'HYUNDAI I 10 2012', '40000', '0652086477', '40000', 72, NULL, NULL, '2024-08-02 12:32:35', '2024-08-02 12:32:35', NULL),
(209, 'HYUNDAI I 10 2012', '40000', '0707888664', '35000', 72, NULL, NULL, '2024-08-02 13:22:53', '2024-08-02 13:22:53', NULL),
(210, 'HYUNDAI I 10 2012', '40000', '0662345694', '50000', 72, NULL, NULL, '2024-08-02 13:23:19', '2024-08-02 13:23:19', NULL),
(211, 'HYUNDAI I 10 2012', '40000', '0663328663', 'Taoufik', 72, NULL, NULL, '2024-08-02 14:11:38', '2024-08-02 14:11:38', NULL),
(212, 'HYUNDAI I 10 2012', '40000', '0670903273', '55000', 72, NULL, NULL, '2024-08-02 14:43:19', '2024-08-02 14:43:19', NULL),
(213, 'HYUNDAI I 10 2012', '40000', '0680972483', '65000', 72, NULL, NULL, '2024-08-02 15:31:00', '2024-08-02 15:33:36', '2024-08-02 15:33:36'),
(214, 'HYUNDAI I 10 2012', '40000', '0676-039422', '42000', 72, NULL, NULL, '2024-08-02 16:02:06', '2024-08-02 16:02:06', NULL),
(215, 'HYUNDAI I 10 2012', '40000', '0678799419', 'Slimane', 72, NULL, NULL, '2024-08-02 16:32:18', '2024-08-02 16:32:18', NULL),
(216, 'HYUNDAI I 10 2012', '40000', '0650153064', '46 000', 72, NULL, NULL, '2024-08-02 17:16:39', '2024-08-02 17:16:39', NULL),
(217, 'HYUNDAI I 10 2012', '40000', '0675382165', '50000', 72, NULL, NULL, '2024-08-02 19:31:29', '2024-08-02 19:31:29', NULL),
(218, 'HYUNDAI I 10 2012', '40000', '0097450610107 plz', '42000dh', 72, NULL, NULL, '2024-08-02 20:01:10', '2024-08-02 20:01:10', NULL),
(219, 'HYUNDAI I 10 2012', '40000', '0667506823', 'يوسف لطرش', 72, NULL, NULL, '2024-08-02 21:04:37', '2024-08-02 21:04:37', NULL),
(220, 'HYUNDAI I 10 2012', '40000', '0667505823', 'يوسف لطرش', 72, NULL, NULL, '2024-08-02 21:05:29', '2024-08-02 21:05:29', NULL),
(221, 'HYUNDAI I 10 2012', '40000', '0655555650', '55500', 72, 'interesse', 'live', '2024-08-02 21:30:54', '2024-08-03 08:31:51', NULL),
(222, 'HYUNDAI I 10 2012', '40000', '0672913111', '46500', 72, NULL, NULL, '2024-08-02 23:09:37', '2024-08-02 23:09:37', NULL),
(223, 'HYUNDAI I 10 2012', '40000', '0670658541', '52000', 72, 'se rappeler', NULL, '2024-08-03 05:53:08', '2024-08-03 08:20:42', NULL),
(224, 'HYUNDAI I 10 2012', '40000', '0670658542', '55000', 72, 'se rappeler', NULL, '2024-08-03 05:53:48', '2024-08-03 08:19:08', NULL),
(225, 'HYUNDAI I 10 2012', '40000', '0667543782', '45000', 72, NULL, NULL, '2024-08-03 08:18:33', '2024-08-03 08:18:33', NULL),
(226, 'HYUNDAI I 10 2012', '40000', '0606466226', '55000', 72, NULL, NULL, '2024-08-03 09:58:26', '2024-08-03 09:58:26', NULL),
(227, 'HYUNDAI I 10 2012', '40000', '0661699922', '45000 dh', 72, NULL, NULL, '2024-08-03 11:02:34', '2024-08-03 11:02:34', NULL),
(228, 'HYUNDAI I 10 2012', '40000', '0666931458', '49000', 72, NULL, NULL, '2024-08-03 12:35:46', '2024-08-03 12:35:46', NULL),
(229, 'HYUNDAI I 10 2012', '40000', '0603859239', '55001', 72, NULL, NULL, '2024-08-03 12:53:04', '2024-08-03 12:53:04', NULL),
(230, 'HYUNDAI I 10 2012', '40000', '0662772752', '46000', 72, NULL, NULL, '2024-08-03 13:20:22', '2024-08-03 13:20:22', NULL),
(231, 'HYUNDAI Tucson 2017', '210000', '0671075723', '190000', 74, 'interesse', 'BG 190000', '2024-08-04 22:31:12', '2024-08-06 08:17:08', NULL),
(232, 'HYUNDAI Tucson 2017', '210000', '0661821520', '200000', 74, 'se rappeler', 'NO', '2024-08-05 16:59:19', '2024-08-13 16:13:39', NULL),
(233, 'HYUNDAI Tucson 2017', '210000', '0661209362', '195000', 74, 'se rappeler', 'NO', '2024-08-06 10:17:19', '2024-08-13 16:13:43', NULL),
(234, 'VOLKSWAGEN Touareg 2022', '690000', '0032489094691', '650000dh', 70, 'se rappeler', 'whatsapp', '2024-08-07 17:58:50', '2024-08-09 09:04:50', NULL),
(235, 'HYUNDAI Tucson 2017', '210000', '0667930788', 'Sh', 74, 'interesse', 'Intéressé SUV BG 200000DH', '2024-08-08 18:48:27', '2024-08-09 08:54:33', NULL),
(236, 'PEUGEOT 3008 2019', '227000', '0667930788', 'voiture', 65, 'interesse', '3008 SUV', '2024-08-10 08:05:40', '2024-08-10 08:57:52', NULL),
(237, 'TOYOTA Yaris 2019', '125000', '0661968570', '118000', 77, 'se rappeler', 'pas répondue', '2024-08-11 09:07:18', '2024-08-13 11:12:58', NULL),
(238, 'HYUNDAI Tucson 2021', '263000', '0661968570', '250000', 67, 'interesse', 'bg max 220000dh', '2024-08-11 09:17:13', '2024-08-13 11:12:34', NULL),
(239, 'HYUNDAI I 10 2012', '63000', '+212766463492', '61000', 72, 'interesse', 'FINANCE kia picanto', '2024-08-13 15:13:58', '2024-08-14 08:21:42', NULL),
(240, 'HYUNDAI I 10 2012', '40000', '0612596210', '40000', 72, NULL, NULL, '2024-08-14 13:27:25', '2024-08-14 13:27:25', NULL),
(241, 'HYUNDAI I 10 2012', '40000', '0656972165', '25000', 72, NULL, NULL, '2024-08-14 13:27:25', '2024-08-14 13:27:25', NULL),
(242, 'PEUGEOT 508 2021', '310000', '0643462727', '300 000,00 DH', 59, 'interesse', 'Finance', '2024-08-14 13:33:49', '2024-08-15 12:01:33', NULL),
(243, 'HYUNDAI I 10 2012', '40000', '0701187253', '38 000', 72, NULL, NULL, '2024-08-14 13:51:34', '2024-08-14 13:51:34', NULL),
(244, 'HYUNDAI I 10 2012', '40000', '0701187253', '39 000', 72, NULL, NULL, '2024-08-14 13:56:03', '2024-08-14 13:56:03', NULL),
(245, 'HYUNDAI I 10 2012', '40000', '0701187253', '45 000', 72, NULL, NULL, '2024-08-14 13:59:29', '2024-08-14 13:59:29', NULL),
(246, 'HYUNDAI I 10 2012', '40000', '0616874113', '43000', 72, NULL, NULL, '2024-08-14 14:02:52', '2024-08-14 14:02:52', NULL),
(247, 'HYUNDAI I 10 2012', '40000', '+212766463492', '43000', 72, NULL, NULL, '2024-08-14 17:34:44', '2024-08-14 17:34:44', NULL),
(248, 'HYUNDAI Tucson 2017', '250000', '0600028181', '240000', 76, 'interesse', 'finance', '2024-08-14 18:55:12', '2024-08-16 08:55:19', NULL),
(249, 'HYUNDAI Tucson 2020', '282000', '0661095623', '270000', 44, 'supprime', 'bdg 250000', '2024-08-14 19:16:03', '2024-08-16 13:11:29', NULL),
(250, 'TOYOTA Yaris 2019', '125000', '0625539938', '115000', 77, 'interesse', 'je vous recontacterai', '2024-08-19 21:14:13', '2024-08-24 08:57:40', NULL),
(251, 'HYUNDAI Tucson 2022', '330000', '0661956000', '300000', 79, 'interesse', 'bg max 300000', '2024-08-23 10:17:44', '2024-08-24 08:44:09', '2024-08-24 08:44:09'),
(252, 'JEEP Wrangler 2018', '340000', '0695486849', '300000', 75, NULL, NULL, '2024-08-24 09:52:27', '2024-08-26 09:31:11', '2024-08-26 09:31:11'),
(253, 'HYUNDAI I 10 2012', '63000', '0680602804', '54000', 72, NULL, 'répond pas', '2024-08-27 11:37:05', '2024-08-28 09:04:02', NULL),
(254, 'HYUNDAI I 10 2012', '63000', '0643580170', '63000dh', 72, 'supprime', 'en cours', '2024-08-27 19:08:33', '2024-08-28 14:34:19', NULL),
(255, 'AUDI A1 2016', '170000', '0678732938', '150000', 57, 'se rappeler', 'pas de réponse', '2024-08-29 18:12:26', '2024-09-10 13:30:00', NULL),
(256, 'HYUNDAI I 10 2012', '63000', '0707535476', '63000', 72, 'se rappeler', 'pas de réponse', '2024-08-29 19:19:18', '2024-09-10 13:29:56', NULL),
(257, 'HYUNDAI Tucson 2022', '330000', '0090', '30000', 79, NULL, NULL, '2024-08-31 08:29:30', '2024-08-31 08:29:54', '2024-08-31 08:29:54'),
(258, 'HYUNDAI Tucson 2022', '330000', '0661202433', 'Tucson', 79, 'interesse', 'financement', '2024-09-02 00:57:22', '2024-09-03 12:14:18', NULL),
(259, 'HYUNDAI Tucson 2022', '330000', '0770080009', '322333', 79, NULL, NULL, '2024-09-02 07:46:14', '2024-09-02 07:46:27', '2024-09-02 07:46:27'),
(260, 'SEAT Ibiza 2017', '120000', '0641988462', '120000', 71, 'se rappeler', 'OK', '2024-09-03 07:37:21', '2024-09-21 13:40:30', NULL),
(261, 'BMW Série 5 2018', '300000', '0662262670', 'Khoya 3ndi passât cc model 07/2019 darba 63 alf f lbyid l3amera o ba9a n9iya bzaf wach tbghi dir m3aya roubriz b BMW', 82, 'se rappeler', 'whatsapp', '2024-09-05 20:31:16', '2024-09-06 14:41:56', '2024-09-06 14:41:56'),
(262, 'HYUNDAI I 10 2012', '63000', '0637267129', 'Oussama elbouchrifi', 72, 'interesse', 'OK', '2024-09-07 17:10:52', '2024-09-21 13:40:26', NULL),
(263, 'BMW Série 5 2018', '300000', '0661162655', 'Hassan', 82, 'se rappeler', 'OK', '2024-09-09 15:50:22', '2024-09-21 13:40:23', NULL),
(264, 'VOLKSWAGEN Tiguan 2021', '540000', '0672206188', '460000', 49, 'supprime', 'OK', '2024-09-14 07:12:42', '2024-09-21 13:40:19', NULL),
(265, 'HONDA CR-V 2014', '170000', '0698058102', '145000', 55, 'se rappeler', 'PROPOSE TOYOTA CHR', '2024-09-19 14:19:48', '2024-09-21 13:38:32', NULL),
(266, 'BMW Série 5 2018', '300000', '0669720917', '250000', 82, 'interesse', 'Reprise 3008 /fes', '2024-09-20 13:18:55', '2024-09-21 13:35:54', NULL),
(267, 'HYUNDAI Tucson 2021', '260000', '0661170462', '225000', 40, 'se rappeler', NULL, '2024-09-20 14:47:22', '2024-09-21 13:27:09', NULL),
(268, 'JEEP Wrangler 2018', '340000', '0661197993', '300000', 75, 'se rappeler', NULL, '2024-09-20 19:53:55', '2024-09-21 13:39:41', NULL),
(269, 'FORD Kuga 2016', '178000', '0661586426', '158000dh', 73, 'supprime', NULL, '2024-09-23 08:57:18', '2024-09-23 09:49:53', NULL),
(270, 'HYUNDAI I 10 2012', '63000', '0665209601', '50000', 72, 'supprime', NULL, '2024-09-23 18:31:38', '2024-09-24 07:31:59', NULL),
(271, 'HYUNDAI I 10 2012', '63000', '0682308911', '50000', 72, 'supprime', NULL, '2024-09-25 06:49:03', '2024-09-25 09:48:33', NULL),
(272, 'TOYOTA Yaris 2019', '125000', '0682308911', '120000', 77, 'interesse', 'BG 100 000DH FINENCE', '2024-09-25 12:11:12', '2024-11-05 10:27:25', NULL),
(273, 'BMW Série 5 2018', '300000', '0666602210', '270000', 82, 'se rappeler', NULL, '2024-09-30 17:48:49', '2024-10-01 09:07:59', NULL),
(274, 'HYUNDAI Tucson 2020', '282000', '0600460850', '265000dh', 44, 'interesse', '3008 finence', '2024-10-02 22:09:15', '2024-10-03 09:11:04', NULL),
(275, 'JEEP Wrangler 2018', '340000', '0635866955', '300000', 75, 'se rappeler', 'vendu', '2024-10-12 18:55:49', '2024-10-24 13:57:58', NULL),
(276, 'HYUNDAI Tucson 2023', '285000', '0661985960', '250000', 95, 'se rappeler', 'vendu', '2024-10-13 15:42:50', '2024-10-24 13:57:56', NULL),
(277, 'DACIA Duster 2022', '200000', '0661956000', '300000', 98, NULL, NULL, '2024-11-04 10:53:26', '2024-11-05 08:53:10', '2024-11-05 08:53:10'),
(278, 'PEUGEOT 3008 2021', '275000', '0661956000', '250000', 92, NULL, NULL, '2024-11-05 10:17:32', '2024-11-05 10:27:14', '2024-11-05 10:27:14'),
(279, 'HYUNDAI I 10 2012', '63000', '0606237978', '40000', 72, 'interesse', 'pour une i 10', '2024-11-11 21:07:49', '2024-11-12 11:48:32', NULL),
(280, 'RENAULT Clio 2019', '128000', '0662393537', '100000', 94, 'se rappeler', 'nrp', '2024-11-18 21:10:04', '2024-11-19 09:57:01', NULL),
(281, 'HYUNDAI Creta 2022', '230000', '0667248460', '210000', 102, 'qualifie', 'a rappler', '2024-11-20 20:33:33', '2024-11-21 09:55:30', NULL),
(282, 'HYUNDAI Creta 2022', '229000', '0643513988', '210000', 34, 'se rappeler', 'nrp', '2024-11-24 09:06:12', '2024-11-25 08:11:51', NULL),
(283, 'HYUNDAI Creta 2022', '230000', '+212643513988', '210000', 102, 'se rappeler', 'nrp', '2024-11-24 09:19:52', '2024-11-25 08:12:47', NULL),
(284, 'LAND ROVER Evoque 2018', '265000', '06661211975', '25000', 96, 'se rappeler', 'nrp', '2024-11-25 19:29:07', '2024-11-27 08:04:27', NULL),
(285, 'LAND ROVER Range Rover Sport SE 2024', '310000', '+212750664166', '280000', 14, 'supprime', 'vendu', '2024-11-26 09:27:47', '2024-11-27 08:04:17', NULL),
(286, 'HYUNDAI I 10 2012', '63000', '0648425329', '60000', 72, 'supprime', 'vendu', '2024-11-27 08:39:13', '2024-11-28 07:49:25', NULL),
(287, 'HYUNDAI I 10 2012', '63000', '0606237978', '50000', 72, 'supprime', 'vendu', '2024-11-27 12:36:05', '2024-11-28 07:49:51', NULL),
(288, 'HYUNDAI I 10 2012', '63000', '0670761862', '50000', 72, 'supprime', 'vendu', '2024-11-27 12:36:38', '2024-11-28 07:50:11', NULL),
(289, 'HYUNDAI Creta 2022', '230000', '0605885405', '200000', 102, 'se rappeler', 'nrp', '2024-12-02 10:01:17', '2024-12-10 07:36:40', NULL),
(290, 'HYUNDAI Creta 2022', '230000', '+212 6 12 58 73 78', '210000', 102, 'se rappeler', 'bv', '2024-12-04 07:00:30', '2024-12-10 13:06:28', NULL),
(291, 'HYUNDAI Tucson 2023', '285000', '+212 6 12 58 73 78', '250000', 95, 'se rappeler', 'bv', '2024-12-04 07:02:19', '2024-12-10 13:06:35', NULL),
(292, 'HYUNDAI Creta 2022', '230000', '0644133377', '210000', 102, 'interesse', 'rdv', '2024-12-11 18:56:08', '2024-12-12 08:18:29', NULL),
(293, 'CITROEN C4x 2023', '205000', '0696859898', '195000', 108, 'supprime', 'vendu', '2024-12-17 00:18:49', '2024-12-17 08:34:14', NULL),
(294, 'TOYOTA Yaris 2019', '125000', '06 61 22 64 08', '120000', 77, 'supprime', 'vendu', '2024-12-19 11:59:34', '2024-12-26 09:42:58', NULL),
(295, 'HYUNDAI I 30 2013', '136000', '06 61 22 64 08', '130000', 52, 'supprime', 'vendu', '2024-12-19 12:02:28', '2024-12-26 09:42:53', NULL),
(296, 'FORD Kuga 2016', '178000', '0698058102', '155000', 73, 'interesse', 'rdv', '2024-12-21 12:53:05', '2024-12-23 08:12:06', NULL),
(297, 'FORD Kuga 2016', '178000', '0698058102', '155000', 73, 'interesse', 'rdv', '2024-12-21 12:53:36', '2024-12-23 08:12:19', NULL),
(298, 'RENAULT Captur 2021', '195000', '06 15 42 33 43', '180000', 105, 'se rappeler', 'la demande de sa fille', '2024-12-22 07:45:15', '2024-12-23 09:48:44', NULL),
(299, 'HYUNDAI Tucson 2024', '365000', '0614087830', '350000', 69, 'supprime', 'vendu', '2024-12-24 21:07:26', '2024-12-26 08:10:37', NULL),
(300, 'DACIA Sandero Stepway 2022', '155000', '0674322198', '145000', 50, 'supprime', 'vendu', '2024-12-24 22:58:58', '2024-12-26 08:09:37', NULL),
(301, 'FIAT Tipo Hatchback 2018', '145000', '0774549341', '70000', 119, NULL, NULL, '2025-01-14 16:30:19', '2025-01-14 16:30:19', NULL),
(302, 'FIAT Tipo Hatchback 2018', '145000', '0774549341', '120000', 119, 'interesse', NULL, '2025-01-14 16:30:55', '2025-01-21 14:26:34', NULL),
(303, 'MERCEDES Classe A 2020', '365000', '0663699694', '338000', 48, 'interesse', NULL, '2025-01-16 17:45:03', '2025-01-21 14:26:30', NULL),
(304, 'LAND ROVER Evoque 2018', '265000', '0661055924', '240000dh', 96, 'se rappeler', NULL, '2025-01-17 08:14:46', '2025-01-23 07:11:05', NULL),
(305, 'FIAT Tipo Hatchback 2018', '145000', '0664532250', '135000', 119, 'se rappeler', 'appel', '2025-01-22 05:12:05', '2025-01-23 07:10:58', NULL),
(306, 'LAND ROVER Evoque 2018', '265000', '0662289698', '250000', 96, 'se rappeler', 'appel', '2025-01-22 17:44:25', '2025-01-23 07:10:55', NULL),
(307, 'VOLKSWAGEN Tiguan 2018', '305000', '0770917292', '250000', 103, NULL, NULL, '2025-01-24 15:27:33', '2025-01-24 15:27:33', NULL),
(308, 'LAND ROVER Range Rover Evoque 2016', '220000', '0660948358', '200000', 93, NULL, NULL, '2025-01-25 08:28:46', '2025-01-25 08:28:46', NULL),
(309, 'LAND ROVER Evoque 2018', '265000', '0660948358', '240000', 96, NULL, NULL, '2025-01-25 08:29:28', '2025-01-25 08:29:28', NULL),
(310, 'HYUNDAI I 10 2012', '63000', '0659064141', '58000', 72, NULL, NULL, '2025-01-26 15:27:02', '2025-01-26 15:27:02', NULL),
(311, 'TOYOTA C-HR 2020', '240000', '0660948358', '220000', 89, NULL, NULL, '2025-01-31 07:01:04', '2025-01-31 07:01:04', NULL),
(312, 'FIAT Tipo Hatchback 2018', '145000', '0774549341', '115000', 119, NULL, NULL, '2025-01-31 10:44:44', '2025-01-31 10:44:44', NULL),
(313, 'HYUNDAI Tucson 2022', '300000', '0690013130', '290000', 107, NULL, NULL, '2025-02-01 11:36:14', '2025-02-01 11:36:14', NULL),
(314, 'FIAT Tipo Hatchback 2018', '145000', '0766691637', '125000', 119, NULL, NULL, '2025-02-01 14:27:16', '2025-02-01 14:27:16', NULL),
(315, 'DACIA Sandero Stepway 2022', '155000', '0708040120', '14000', 50, NULL, NULL, '2025-02-07 17:54:40', '2025-02-07 17:54:40', NULL),
(316, 'RENAULT Kadjar 2020', '167000', '0708040120', '155000', 39, NULL, NULL, '2025-02-07 18:08:45', '2025-02-07 18:08:45', NULL),
(317, 'LAND ROVER Evoque 2018', '265000', '0674120605', '230000', 96, 'se rappeler', NULL, '2025-02-10 11:33:48', '2025-02-13 09:15:50', NULL),
(318, 'CITROEN C5 Aircross 2023', '270000', '0665436301', '240000', 117, 'supprime', 'vendu', '2025-02-11 22:03:47', '2025-02-13 09:15:44', NULL),
(319, 'CITROEN C5 Aircross 2020', '235000', '0665436301', '210000', 109, 'se rappeler', 'Samedi 15/02/2025', '2025-02-11 22:06:43', '2025-02-13 09:14:35', NULL),
(320, 'NISSAN Qashqai 2018', '20000', '0659556668', '190000', 125, 'interesse', 'abdelwahab aujourdhui rendez-vous 19h', '2025-02-12 16:37:33', '2025-02-13 09:14:50', NULL),
(321, 'NISSAN Qashqai 2018', '200000', '+212 666-013115', '185000', 125, NULL, NULL, '2025-02-17 15:17:27', '2025-02-17 15:17:27', NULL),
(322, 'PEUGEOT 3008 2020', '235000', '0661105722', '200000', 127, NULL, NULL, '2025-02-23 21:27:20', '2025-02-23 21:27:20', NULL),
(323, 'MERCEDES Classe A 2020', '365000', '0660093493', 'Soufiane', 48, NULL, NULL, '2025-02-24 13:37:25', '2025-02-24 13:37:25', NULL),
(324, 'BMW X5 2017', '280000', '0701048208', 'Azeddine', 104, 'qualifie', 'affaire conclue', '2025-02-27 23:43:08', '2025-03-14 16:40:49', NULL),
(325, 'VOLKSWAGEN Touareg 2022', '690000', '0661392948', '620000', 70, NULL, NULL, '2025-03-07 21:21:40', '2025-03-07 21:21:40', NULL),
(326, 'JEEP Compass 2020', '250000', '+212672054557', '200000', 129, NULL, NULL, '2025-03-19 14:24:52', '2025-03-19 14:24:52', NULL),
(327, 'RENAULT Captur 2021', '195000', '0663220110', '183000', 105, NULL, NULL, '2025-03-24 22:30:34', '2025-03-24 22:30:34', NULL),
(328, 'PEUGEOT 3008 2019', '230000', '0633926794', '21500', 134, NULL, NULL, '2025-03-27 12:27:53', '2025-03-27 12:27:53', NULL),
(329, 'TESLA Model 3 2021', '380000', '0629603943', '300000', 133, NULL, NULL, '2025-03-31 01:51:39', '2025-03-31 01:51:39', NULL),
(330, 'JEEP Wrangler 2016', '250000', '0033764490387', '200000', 132, NULL, NULL, '2025-04-02 16:39:00', '2025-04-02 16:39:00', NULL),
(331, 'BMW Série 5 2018', '300000', '0650710723', '250000', 82, NULL, NULL, '2025-04-07 08:13:48', '2025-04-07 08:13:48', NULL),
(332, 'TOYOTA Yaris 2019', '125000', '+212624298864', '120 000', 77, NULL, NULL, '2025-04-08 20:38:42', '2025-04-08 20:38:42', NULL),
(333, 'FIAT Tipo Hatchback 2018', '145000', '06 60 26 80 05', 'Sanae mouchtach', 119, NULL, NULL, '2025-04-11 10:04:15', '2025-04-11 10:04:15', NULL),
(334, 'NISSAN Qashqai 2018', '200000', '0666389949', '170000', 125, 'supprime', NULL, '2025-04-12 18:29:37', '2025-04-24 10:18:06', NULL),
(335, 'JEEP Wrangler 2016', '250000', '+212676386436', '220000 dh', 132, 'supprime', NULL, '2025-04-18 21:37:53', '2025-04-24 10:18:01', NULL),
(336, 'JEEP Wrangler 2016', '250000', '0661235885', '210000', 132, 'supprime', NULL, '2025-04-21 16:05:09', '2025-04-24 10:17:57', NULL),
(337, 'HYUNDAI Creta 2022', '230000', '0673477531', '200000', 102, 'supprime', 'deja vendu', '2025-04-23 20:43:11', '2025-04-24 10:18:25', NULL),
(338, 'HYUNDAI Tucson 2021', '280000', '0661458599', '260000', 138, 'supprime', 'pas de réponse', '2025-04-25 17:48:40', '2025-05-03 14:00:32', NULL),
(339, 'HYUNDAI Tucson 2021', '280000', '0641480774', '260000', 138, 'supprime', 'pas de réponse', '2025-04-26 23:54:09', '2025-05-03 14:00:28', NULL),
(340, 'HYUNDAI Tucson 2021', '280000', '0660754726', '270000', 138, 'supprime', 'pas de réponse', '2025-04-29 16:44:58', '2025-05-03 14:00:23', NULL),
(341, 'MERCEDES Classe GLC Coupé 2017', '530000', '0661760085', '450000', 131, 'supprime', 'pas de réponse', '2025-04-30 21:13:47', '2025-05-03 14:00:19', NULL),
(342, 'DS DS 7 Crossback 2021', '280000', '0661069466', '269000', 139, 'interesse', 'rendez-vous 06/05', '2025-05-01 18:29:58', '2025-05-03 13:59:26', NULL),
(343, 'MERCEDES Classe GLA 2024', '495000', '0661299585', '460.000', 136, 'qualifie', 'rendez-vous 09/05', '2025-05-02 20:56:28', '2025-05-03 13:59:36', NULL),
(344, 'HYUNDAI Creta 2022', '230000', '0605885405', '215000', 102, NULL, NULL, '2025-05-03 15:25:36', '2025-05-03 15:25:36', NULL),
(345, 'HYUNDAI Creta 2022', '229000', '0605885405', '210000', 34, NULL, NULL, '2025-05-03 15:38:15', '2025-05-03 15:38:15', NULL),
(346, 'HYUNDAI Tucson 2022', '265000', '0660996446', '250000', 19, NULL, NULL, '2025-05-03 15:43:33', '2025-05-03 15:43:33', NULL),
(347, 'TESLA Model 3 2021', '380000', '0653318885', '200000', 133, NULL, NULL, '2025-05-07 16:17:54', '2025-05-07 16:17:54', NULL),
(348, 'TESLA Model 3 2021', '380000', '0687093339', '400000', 133, NULL, NULL, '2025-05-07 16:33:55', '2025-05-07 16:33:55', NULL),
(349, 'MERCEDES Classe C bluetec 2016', '270000', '0661240100', '250000', 29, NULL, NULL, '2025-05-08 13:47:49', '2025-05-08 13:47:49', NULL),
(350, 'TESLA Model 3 2021', '380000', '0777777777', '10000000', 133, NULL, NULL, '2025-05-08 15:41:35', '2025-05-08 16:47:33', '2025-05-08 16:47:33'),
(351, 'TESLA Model 3 2021', '380000', '0661402783', '240000', 133, NULL, NULL, '2025-05-08 18:44:27', '2025-05-08 18:44:27', NULL),
(352, 'TESLA Model 3 2021', '380000', '0662088846', '350000', 133, NULL, NULL, '2025-05-09 16:13:49', '2025-05-09 16:13:49', NULL),
(353, 'VOLKSWAGEN Golf 8 2022', '330000', '0661064320', '260000', 62, NULL, NULL, '2025-05-09 21:37:26', '2025-05-09 21:37:26', NULL),
(354, 'TESLA Model 3 2021', '380000', '0671718106', '35', 133, NULL, NULL, '2025-05-12 16:30:59', '2025-05-12 16:30:59', NULL),
(355, 'MERCEDES Classe GLA 2024', '495000', '0708050319', 'Négociable', 136, NULL, NULL, '2025-05-15 21:07:47', '2025-05-15 21:07:47', NULL),
(356, 'RENAULT Kadjar 2021', '195000', '0666707309', '183000', 16, NULL, NULL, '2025-05-20 10:07:46', '2025-05-20 10:07:46', NULL),
(357, 'MERCEDES Classe C 2019', '380000', '0625119757', '340 000 dh', 130, NULL, NULL, '2025-05-22 22:01:07', '2025-05-22 22:01:07', NULL),
(358, 'HYUNDAI I 10 2012', '63000', '661300011', '60000', 72, NULL, NULL, '2025-05-23 21:41:06', '2025-05-23 21:41:06', NULL),
(359, 'VOLKSWAGEN Tiguan 2021', '420000', '0661047084', '360000', 140, NULL, NULL, '2025-05-29 12:24:56', '2025-05-29 12:24:56', NULL),
(360, 'MERCEDES Classe C 2022', '480000', '066625546', '450000', 58, NULL, NULL, '2025-05-30 15:01:23', '2025-05-30 15:01:23', NULL),
(361, 'MERCEDES Classe GLA 2024', '495000', '0661053427', '410000', 136, NULL, NULL, '2025-05-30 21:48:55', '2025-05-30 21:48:55', NULL);
INSERT INTO `offres` (`id`, `car`, `prix`, `phone`, `offre`, `idads`, `status`, `comment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(362, 'HYUNDAI Tucson 2017', '210000', '+212 672 957951', '180000', 74, NULL, NULL, '2025-05-31 15:02:15', '2025-05-31 15:02:15', NULL),
(363, 'HYUNDAI Creta 2022', '230000', '+212 672 957951', '200000', 102, NULL, NULL, '2025-06-01 13:28:48', '2025-06-01 13:28:48', NULL),
(364, 'HYUNDAI Creta 2022', '229000', '+212 672 957951', '200000', 34, NULL, NULL, '2025-06-01 13:30:15', '2025-06-01 13:30:15', NULL),
(365, 'RENAULT Kadjar 2021', '195000', '+212 672 957951', '180000', 16, NULL, NULL, '2025-06-01 13:31:36', '2025-06-01 13:31:36', NULL),
(366, 'LAND ROVER Range Rover Sport 2021', '630000', '0763637388', '23099999', 142, NULL, NULL, '2025-06-02 09:23:56', '2025-06-02 09:23:56', NULL),
(367, 'CITROEN C5 Aircross 2020', '215000', '0660036594', '200000', 109, NULL, NULL, '2025-06-04 09:34:51', '2025-06-04 09:34:51', NULL),
(368, 'MERCEDES Classe C bluetec 2016', '270000', '0669720917', '250000', 29, NULL, NULL, '2025-06-04 11:59:11', '2025-06-04 11:59:11', NULL),
(369, 'BMW X1 2017', '210000', '+212 672 957951', '200000', 51, NULL, NULL, '2025-06-08 11:13:27', '2025-06-08 11:13:27', NULL),
(370, 'DS DS 7 Crossback 2021', '280000', '0663622996', '240000', 139, NULL, NULL, '2025-06-09 08:13:19', '2025-06-09 08:13:19', NULL),
(371, 'RENAULT Captur 2021', '195000', '0660946420', '180000', 105, NULL, NULL, '2025-06-09 12:39:04', '2025-06-09 12:39:04', NULL),
(372, 'HYUNDAI Tucson 2016', '190000', '0660946420', '180000', 53, NULL, NULL, '2025-06-09 12:41:57', '2025-06-09 12:41:57', NULL),
(373, 'HYUNDAI Tucson 2016', '190000', '0660946420', '180000', 53, NULL, NULL, '2025-06-10 18:13:04', '2025-06-10 18:13:04', NULL),
(374, 'HYUNDAI Tucson 2016', '190000', '0660946420', '180000', 53, NULL, NULL, '2025-06-10 18:13:07', '2025-06-10 18:13:07', NULL),
(375, 'HYUNDAI Tucson 2016', '190000', '0660946420', '180000', 53, NULL, NULL, '2025-06-10 18:13:09', '2025-06-10 18:13:09', NULL),
(376, 'TOYOTA Yaris 2019', '125000', '0662151482', '120000', 77, NULL, NULL, '2025-06-11 08:15:28', '2025-06-11 08:15:28', NULL),
(377, 'TESLA Model 3 2021', '380000', '0661138677', '250000', 133, NULL, NULL, '2025-06-12 13:11:12', '2025-06-12 13:11:12', NULL),
(378, 'NISSAN Qashqai 2018', '200000', '0667635766', '180000', 125, NULL, NULL, '2025-06-15 18:27:53', '2025-06-15 18:27:53', NULL),
(379, 'BMW X3 2019', '370000', '0661313308', '320000', 143, NULL, NULL, '2025-06-15 22:43:46', '2025-06-15 22:43:46', NULL),
(380, 'TESLA Model 3 2021', '380000', '0681212300', '390000', 133, NULL, NULL, '2025-06-16 06:09:00', '2025-06-16 06:09:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `packs`
--

CREATE TABLE `packs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `description` varchar(125) NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `duration_days` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packs`
--

INSERT INTO `packs` (`id`, `name`, `description`, `price`, `duration_days`, `created_at`, `updated_at`) VALUES
(1, 'Pack 1', 'Annonce gratuite sur Nado.ma', 0, 7, NULL, NULL),
(2, 'Pack 2', '199 DH : 1 semaine sur Nado, Avito, et Moteur.ma', 199, 7, NULL, NULL),
(3, 'Pack 3', '299 DH : 15 jours sur Nado, Avito, et Moteur.ma', 299, 15, NULL, NULL),
(4, 'Pack 4', '499 DH : Showroom (voiture exposée en garage) + 30 jours sur Nado, Avito, et Moteur.ma', 499, 30, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(125) NOT NULL,
  `token` varchar(125) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `guard_name` varchar(125) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(125) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `price` int(11) NOT NULL,
  `features` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publications`
--

CREATE TABLE `publications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(125) NOT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(125) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `placement` enum('left-banner','right-banner','center-banner','first-banner','second-banner','third-banner','leftondetail-banner','rightonindexenchere-banner') DEFAULT 'center-banner',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `publications`
--

INSERT INTO `publications` (`id`, `title`, `content`, `image`, `position`, `placement`, `status`, `created_at`, `updated_at`) VALUES
(6, 'toyota', NULL, 'publications/cJvzRjoXcK1BbVDn83OzzT2z4S0ptQTMQV42Slvn.png', 1, 'center-banner', 1, '2025-07-28 18:04:21', '2025-07-28 18:04:21'),
(10, 'DETAIL PAGE', NULL, 'publications/dTkQ7OlA7IFRSlOCnOnzQx1I435bQm1qykJyzGKI.png', 3, 'leftondetail-banner', 1, '2025-08-02 17:59:31', '2025-08-02 17:59:31'),
(11, 'DJHB', NULL, 'publications/TGzFBhK2NXP0Nj4lj6aoOChiGjrZIsg9eYYatAFd.png', 4, 'first-banner', 1, '2025-08-02 18:01:59', '2025-08-02 18:01:59'),
(12, '212', NULL, 'publications/IMpetKvVdMsAWnxuW83TkPl3oJRqyZpusnUJtTw0.png', 5, 'second-banner', 1, '2025-08-02 18:02:30', '2025-08-02 18:02:30'),
(13, 'test', NULL, 'publications/KhffgImcnVvsnpulc2GJ8EJPGOmJaW3t4cYOsdkd.jpg', 6, 'left-banner', 1, '2025-08-12 14:14:47', '2025-08-12 14:14:47'),
(14, 'test s', NULL, 'publications/HsQcqWdtuue78hVmzcNZnlalBnSdhAjqjAzs3W5N.jpg', 7, 'right-banner', 1, '2025-08-12 14:16:45', '2025-08-12 14:17:01'),
(15, 'test', NULL, 'publications/ktwzVqKor6HKca2EH7FifyBaEsrat8kja57PbnFX.jpg', 8, 'rightonindexenchere-banner', 1, '2025-09-29 11:30:27', '2025-09-29 11:30:27');

-- --------------------------------------------------------

--
-- Table structure for table `reprises`
--

CREATE TABLE `reprises` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `city` varchar(125) NOT NULL,
  `year` int(11) NOT NULL,
  `mark` varchar(125) NOT NULL,
  `modele` varchar(125) NOT NULL,
  `phone` varchar(125) NOT NULL,
  `email` varchar(125) NOT NULL,
  `contacte` varchar(125) NOT NULL,
  `rendezvous` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reprises`
--

INSERT INTO `reprises` (`id`, `name`, `city`, `year`, `mark`, `modele`, `phone`, `email`, `contacte`, `rendezvous`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Oussama Elhadi', 'Casablanca', 2017, 'AUDI', 'A3', '0637916134', 'oussamaelhadi11@gmail.com', 'Telephone', '2025-10-16 23:00:00', '2025-10-10 16:32:04', '2025-10-10 16:32:04', NULL),
(2, 'Oussama Elhadi', 'Casablanca', 2017, 'AUDI', 'A3', '0637916134', 'oussamaelhadi11@gmail.com', 'Telephone', '2025-10-16 23:00:00', '2025-10-10 16:32:54', '2025-10-10 16:32:54', NULL),
(3, 'Oussama Elhadi', 'Casablanca', 2017, 'AUDI', 'A3', '0637916134', 'oussamaelhadi11@gmail.com', 'Telephone', '2025-10-16 23:00:00', '2025-10-10 16:32:58', '2025-10-10 16:32:58', NULL),
(4, 'Oussama Elhadi', 'Casablanca', 2017, 'AUDI', 'A3', '0637916134', 'oussamaelhadi11@gmail.com', 'Telephone', '2025-10-16 23:00:00', '2025-10-10 16:33:25', '2025-10-10 16:33:25', NULL),
(5, 'Oussama vv', 'Casablanca', 2022, 'DFSK', 'K05', '0637916134', 'oussamaelhadi11@gmail.com', 'Telephone', '2025-10-29 23:00:00', '2025-10-10 16:34:08', '2025-10-10 16:34:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `guard_name` varchar(125) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2024-02-06 07:36:40', '2024-02-06 07:36:40'),
(2, 'member', 'web', '2024-02-06 07:36:40', '2024-02-06 07:36:40'),
(3, 'client', 'admin', '2025-07-23 00:25:06', '2025-07-23 00:25:06'),
(4, 'client', 'web', '2025-07-23 13:37:19', '2025-07-23 13:37:19');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `email` varchar(125) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` varchar(125) NOT NULL,
  `password` varchar(125) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `role`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'sys', 'sys@nado.ma', '2025-07-23 13:39:29', 'admin', '$2y$12$zMrawLdJshzgf4CmTUr//.HVDS5HLC4GqzYFfu5uasRk68yOADCJe', NULL, '2024-02-06 07:36:40', '2025-07-23 13:39:29'),
(2, 'nado', 'contact@nado.ma', '2025-07-23 13:40:31', 'admin', '$2y$12$CAxsv7JeZ8EIoJl/cQGV4u32nOABDQXerhFUbHGc2ykTgqd1YYYa6', NULL, '2024-02-06 13:03:14', '2025-07-23 13:40:31'),
(4, 'Prospection', 'nado.auto10@gmail.com', NULL, 'member', '$2y$12$2Lfut26mWXyxLCp58.pQIuxz193LWy/oFc39ja2bpq4NKA6L.Ntg.', NULL, '2024-05-02 11:59:07', '2024-11-04 10:49:49'),
(10, 'kafa', 'redouane.frid@gmail.com', NULL, 'member', '$2y$12$ssv5DaCItOKDdLynzqg1zOlIr9kLAuRtsaH8fvs3NFaQSIgIu96iC', NULL, '2025-09-16 18:20:04', '2025-09-16 18:20:04');

-- --------------------------------------------------------

--
-- Table structure for table `ventes`
--

CREATE TABLE `ventes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `phone` varchar(125) NOT NULL,
  `city` varchar(125) NOT NULL,
  `mark` varchar(125) NOT NULL,
  `modele` varchar(125) NOT NULL,
  `year` int(11) NOT NULL,
  `km` int(11) NOT NULL,
  `carburant` varchar(125) NOT NULL,
  `box` varchar(125) NOT NULL,
  `etat` varchar(125) DEFAULT NULL,
  `type` varchar(125) DEFAULT NULL,
  `origine` varchar(125) DEFAULT NULL,
  `jeveux` varchar(125) NOT NULL,
  `mode` varchar(125) NOT NULL,
  `img_avant` varchar(125) DEFAULT NULL,
  `img_derriere` varchar(125) DEFAULT NULL,
  `img_cartegrise` varchar(125) DEFAULT NULL,
  `rendezvous` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ventes`
--

INSERT INTO `ventes` (`id`, `name`, `phone`, `city`, `mark`, `modele`, `year`, `km`, `carburant`, `box`, `etat`, `type`, `origine`, `jeveux`, `mode`, `img_avant`, `img_derriere`, `img_cartegrise`, `rendezvous`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'mohamed', '0808631836', 'Casablanca', 'BMW', 'M5', 2012, 20000, 'essence', 'automatique', 'très bon', 'occasion', 'WWW au Maroc', '', '', 'bmw-m5-128523.jpg', 'bmw-m5-602746.jpg', 'bmw-m5-196932.jpg', '0000-00-00', '2024-04-15 16:38:09', '2024-04-18 07:33:14', '2024-04-18 07:33:14'),
(2, 'AUTO ENCHERE', '0808631836', 'Rabat', 'DS', 'DS 4S', 2016, 57000, 'hybride', 'manuelle', 'correct', 'neuf', 'dédouané', '', '', 'ds-ds-4s-688340.png', 'ds-ds-4s-109913.png', 'ds-ds-4s-125213.png', '0000-00-00', '2024-04-15 16:56:56', '2024-04-18 07:32:40', '2024-04-18 07:32:40'),
(3, 'Ain Johra', '0808631836', 'Rabat', 'DODGE', 'Caliber', 2012, 122000, 'diesel', 'automatique', 'très bon', 'occasion', 'importé neuf', '', '', 'dodge-caliber-917145.png', 'dodge-caliber-257078.png', 'dodge-caliber-348929.png', '0000-00-00', '2024-04-15 17:03:18', '2024-04-18 07:32:36', '2024-04-18 07:32:36'),
(4, 'Ok', '0625992382', 'Agadir', 'FORD', 'Explorer', 2017, 19000, 'diesel', 'manuelle', 'bon', 'occasion', 'WWW au Maroc', '', '', 'ford-explorer-339840.jpg', 'ford-explorer-913189.jpg', 'ford-explorer-870576.jpg', '0000-00-00', '2024-04-15 18:43:17', '2024-04-18 08:24:52', '2024-04-18 08:24:52'),
(5, 'MOHAMED', '0808631836', 'El Jadida', 'DS', 'DS 3 Cabriolet', 2009, 10000, 'essence', 'manuelle', 'très bon', 'occasion', 'WWW au Maroc', '', '', 'ds-ds-3-cabriolet-219061.jpg', 'ds-ds-3-cabriolet-595988.jpg', 'ds-ds-3-cabriolet-609588.jpg', '0000-00-00', '2024-04-17 11:21:21', '2024-04-18 07:32:46', '2024-04-18 07:32:46'),
(6, 'MOHAMED', '0808631836', 'Casablanca-Jnane Californie', 'NISSAN', 'Juke', 2021, 65000, 'essence', 'automatique', 'très bon', 'occasion', 'WWW au Maroc', '', '', 'nissan-juke-506488.jpg', 'nissan-juke-895189.jpg', 'nissan-juke-830975.jpg', '0000-00-00', '2024-04-18 08:24:37', '2024-05-07 15:54:25', '2024-05-07 15:54:25'),
(7, 'mohammed Bentaleb', '0707323270', 'Marrakech', 'AUDI', 'A1 Sportback', 2022, 1254888, 'diesel', 'manuelle', 'très bon', 'occasion', 'pas encore dédouané', 'vendre ma voiture', 'pack showroom', 'audi-a1-sportback-912416.png', 'audi-a1-sportback-143431.png', 'audi-a1-sportback-883758.png', '0000-00-00', '2024-04-19 14:34:59', '2024-04-19 15:25:42', '2024-04-19 15:25:42'),
(8, 'MOHAMED', '0808631836', 'Nador', 'AUDI', 'A4', 2019, 108000, 'diesel', 'automatique', 'très bon', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'audi-a4-812097.png', 'audi-a4-738126.png', 'audi-a4-228635.jpg', '0000-00-00', '2024-04-19 17:13:12', '2024-04-19 17:58:17', '2024-04-19 17:58:17'),
(9, 'MOHAMED', '0808631836', 'Casablanca-Jnane Californie', 'BMW', 'X4', 2009, 122000, 'diesel', 'automatique', 'très bon', 'occasion', 'dédouané', 'vendre ma voiture', 'pack showroom', 'bmw-x4-561454.jpg', 'bmw-x4-848775.jpg', 'bmw-x4-108326.jpg', '0000-00-00', '2024-04-21 16:51:13', '2024-04-22 18:51:01', '2024-04-22 18:51:01'),
(10, 'MOHAMED', '0808631836', 'Rabat', 'ALFA ROMEO', '8C', 2007, 65000, 'essence', 'manuelle', 'excellent', 'occasion', 'dédouané', 'vendre ma voiture', 'pack showroom', 'alfa-romeo-8c-306527.jpg', 'alfa-romeo-8c-658914.jpg', 'alfa-romeo-8c-551745.jpg', '2024-04-25', '2024-04-22 18:50:35', '2024-04-22 18:50:56', '2024-04-22 18:50:56'),
(11, 'thhfd', '0808631836', 'Oujda', 'DAIHATSU', 'Dodge', 2010, 57000, 'diesel', 'automatique', 'endommagé', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'daihatsu-dodge-903051.jpg', 'daihatsu-dodge-718228.jpg', 'daihatsu-dodge-910456.jpg', '2024-04-15', '2024-04-23 08:40:08', '2024-04-23 08:40:37', '2024-04-23 08:40:37'),
(12, 'MOHAMED', '0808631836', 'Kénitra', 'BMW', 'Série 1 Coupé', 2009, 65000, 'essence', 'manuelle', 'excellent', 'occasion', 'dédouané', 'vendre ma voiture', 'pack showroom', 'bmw-serie-1-coupe-244664.jpg', 'bmw-serie-1-coupe-112303.jpg', 'bmw-serie-1-coupe-745040.jpg', '2024-04-14', '2024-04-23 10:11:05', '2024-04-23 10:11:26', '2024-04-23 10:11:26'),
(13, 'MOHAMED', '0808631836', 'Rabat', 'AUDI', '200', 2014, 65000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'audi-200-101401.jpg', 'audi-200-187767.jpg', 'audi-200-772966.jpg', '2024-04-26', '2024-04-23 11:08:44', '2024-04-23 11:08:58', '2024-04-23 11:08:58'),
(14, 'ben', '0606323210', 'Zenata', 'FIAT', 'Burstner', 2010, 1254888, 'diesel', 'manuelle', 'très bon', 'occasion', 'dédouané', 'vendre ma voiture', 'pack showroom', 'fiat-burstner-243516.png', 'fiat-burstner-453272.png', 'fiat-burstner-246322.png', '2024-04-24', '2024-04-23 11:44:01', '2024-04-23 12:56:12', '2024-04-23 12:56:12'),
(15, 'mohammed Bentaleb', '0707323270', 'Casablanca-Jnane Californie', 'ABARTH', '124 Spider', 2024, 1254888, 'diesel', 'automatique', 'excellent', 'occasion', 'dédouané', 'vendre ma voiture', 'pack showroom', 'abarth-124-spider-214697.png', 'abarth-124-spider-663747.png', 'abarth-124-spider-416468.png', '2024-04-24', '2024-04-23 12:51:55', '2024-04-23 12:56:09', '2024-04-23 12:56:09'),
(16, 'fahim rajaa', '0608351665', 'Casablanca', 'BMW', 'Série 1', 2019, 122000, 'diesel', 'manuelle', 'bon', 'occasion', 'WWW au Maroc', 'estimer ma voiture', 'estimer', 'bmw-serie-1-956139.png', 'bmw-serie-1-147836.png', 'bmw-serie-1-903954.png', '2024-05-09', '2024-05-02 12:27:34', '2024-05-03 08:41:53', '2024-05-03 08:41:53'),
(17, 'Azzouz Ahmed', '+212 666-914361', 'Tanger', 'AUDI', 'A3 Sportback', 2018, 100000, 'diesel', 'automatique', 'excellent', 'occasion', 'dédouané', 'vendre ma voiture', 'khdima distance', 'audi-a3-sportback-248322.jpeg', 'audi-a3-sportback-118351.jpeg', 'audi-a3-sportback-715625.jpeg', '2024-05-07', '2024-05-07 04:24:18', '2024-05-07 15:54:22', '2024-05-07 15:54:22'),
(18, 'Azzouz Ahmed', '+212 666-914361', 'Tanger', 'AUDI', 'A3 Sportback', 2018, 100000, 'diesel', 'automatique', 'excellent', 'occasion', 'dédouané', 'vendre ma voiture', 'khdima distance', 'audi-a3-sportback-493894.jpeg', 'audi-a3-sportback-491154.jpeg', 'audi-a3-sportback-502641.jpeg', '2024-05-07', '2024-05-07 04:24:18', '2024-05-07 04:24:18', NULL),
(19, 'Rachid', '+212 676-138186', 'Casablanca', 'VOLKSWAGEN', 'Tiguan', 2018, 101000, 'diesel', 'automatique', 'très bon', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'khdima distance', 'volkswagen-tiguan-523617.jpeg', 'volkswagen-tiguan-766372.jpeg', 'volkswagen-tiguan-528842.jpeg', '2024-05-07', '2024-05-07 15:34:29', '2024-05-07 15:34:29', NULL),
(20, 'ismail mohamed', '0667116236', 'Casablanca', 'DACIA', 'Duster', 2020, 110000, 'diesel', 'manuelle', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'khdima distance', 'dacia-duster-601248.jpeg', 'dacia-duster-230214.jpeg', 'dacia-duster-828516.jpeg', '2024-05-08', '2024-05-08 10:22:08', '2024-05-08 10:22:08', NULL),
(21, 'Anas', '0666080707', 'Casablanca', 'HYUNDAI', 'Tucson', 2021, 112000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'khdima distance', 'hyundai-tucson-728191.jpg', 'hyundai-tucson-320037.jpg', 'hyundai-tucson-975969.jpg', '2024-05-08', '2024-05-08 14:59:16', '2024-05-08 14:59:16', NULL),
(22, 'Aymen boudhir', '0608351665', 'Casablanca-Jnane Californie', 'OPEL', 'Astra', 2015, 130000, 'diesel', 'automatique', 'très bon', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'opel-astra-757255.jpeg', 'opel-astra-741761.jpeg', 'opel-astra-687794.jpeg', '2024-05-10', '2024-05-11 07:58:17', '2024-05-11 07:58:17', NULL),
(23, 'mohzmrd marouane', '06654992249', 'Casablanca', 'SEAT', 'Arona', 2022, 59000, 'diesel', 'manuelle', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'khdima distance', 'seat-arona-853877.jpeg', 'seat-arona-110507.jpeg', 'seat-arona-140628.jpeg', '2024-05-11', '2024-05-11 09:03:56', '2024-05-11 09:03:56', NULL),
(24, 'Oumar', '0601031619', 'Casablanca', 'HYUNDAI', 'Tucson', 2020, 49000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'khdima distance', 'hyundai-tucson-688285.jpg', 'hyundai-tucson-130199.jpg', 'hyundai-tucson-959480.jpg', '2024-05-13', '2024-05-13 10:55:34', '2024-05-13 10:55:34', NULL),
(25, 'abdeali ait ali', '0617245162', 'Casablanca', 'NISSAN', 'Micra', 2021, 30000, 'diesel', 'manuelle', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'nissan-micra-521510.jpeg', 'nissan-micra-923968.jpeg', 'nissan-micra-333703.jpeg', '2024-05-15', '2024-05-15 13:46:36', '2024-05-15 13:46:36', NULL),
(26, 'abdlekbir lamhader', '0669983723', 'Casablanca', 'DACIA', 'Duster', 2018, 55000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'dacia-duster-574531.jpeg', 'dacia-duster-429010.jpeg', 'dacia-duster-270177.jpeg', '2024-05-14', '2024-05-17 13:14:07', '2024-05-17 13:14:07', NULL),
(27, 'ali', '0661956000', 'Casablanca', 'PEUGEOT', '2008', 2018, 85000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'peugeot-2008-728058.jpeg', 'peugeot-2008-391486.jpeg', 'peugeot-2008-356727.jpeg', '2024-05-20', '2024-05-20 11:48:40', '2024-05-20 11:48:40', NULL),
(28, 'Mr', '+35699560347', 'Oujda', 'VOLKSWAGEN', 'Tiguan', 2021, 52000, 'diesel', 'automatique', 'excellent', 'occasion', 'dédouané', 'vendre ma voiture', 'khdima distance', 'volkswagen-tiguan-287674.jpeg', 'volkswagen-tiguan-405773.jpeg', 'volkswagen-tiguan-795335.jpeg', '2024-05-21', '2024-05-21 15:26:44', '2024-05-21 15:26:44', NULL),
(29, 'rachid', '+212 662153350', 'Casablanca', 'DACIA', 'Sandero Stepway', 2022, 39000, 'diesel', 'manuelle', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'khdima distance', 'dacia-sandero-stepway-453395.jpeg', 'dacia-sandero-stepway-889190.jpeg', 'dacia-sandero-stepway-754772.jpeg', '2024-05-20', '2024-05-24 14:05:12', '2024-05-24 14:05:12', NULL),
(30, '280', '0808631836', 'Rabat', 'FORD', 'F250', 2009, 65000, 'essence', 'automatique', 'excellent', 'occasion', 'dédouané', 'estimer ma voiture', 'estimer', 'ford-f250-854814.png', 'ford-f250-319880.jpg', 'ford-f250-503805.jpg', '2024-05-16', '2024-06-04 11:26:46', '2024-06-04 11:28:17', '2024-06-04 11:28:17'),
(31, 'abdelhak', '+212649744288', 'Casablanca', 'CITROEN', 'C3 Aircross', 2018, 102000, 'diesel', 'manuelle', 'très bon', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'khdima distance', 'citroen-c3-aircross-148324.jpg', 'citroen-c3-aircross-914569.jpg', 'citroen-c3-aircross-496831.jpg', '2024-06-10', '2024-06-07 14:19:23', '2024-06-07 14:19:23', NULL),
(32, 'Aicha', '0769759543', 'Casablanca', 'AUDI', 'A6', 2016, 132000, 'diesel', 'automatique', 'très bon', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'khdima distance', 'audi-a6-301473.jpg', 'audi-a6-724739.jpg', 'audi-a6-235209.jpg', '2024-06-24', '2024-06-12 15:14:45', '2024-06-12 15:14:45', NULL),
(33, 'Ain Johra', '0808631836', 'Casablanca-Jnane Californie', 'ABARTH', '124 Spider', 2022, 65000, 'diesel', 'manuelle', 'très bon', 'occasion', 'dédouané', 'vendre ma voiture', 'pack showroom', 'abarth-124-spider-762578.png', 'abarth-124-spider-498586.png', 'abarth-124-spider-873430.png', '2024-05-13', '2024-07-12 08:32:26', '2024-07-12 08:32:51', '2024-07-12 08:32:51'),
(34, 'MOURAD', '+212 674-218065', 'Casablanca-Jnane Californie', 'HYUNDAI', 'Tucson', 2022, 40000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'hyundai-tucson-733182.jpeg', 'hyundai-tucson-516258.jpeg', 'hyundai-tucson-121386.jpeg', '2024-07-11', '2024-07-12 08:35:55', '2024-07-20 09:15:46', '2024-07-20 09:15:46'),
(35, 'fahim rajaa', '0608351665', 'Casablanca-Jnane Californie', 'PEUGEOT', '3008', 2018, 122000, 'diesel', 'automatique', 'très bon', 'occasion', 'dédouané', 'vendre ma voiture', 'pack showroom', 'peugeot-3008-993750.png', 'peugeot-3008-232159.png', 'peugeot-3008-942339.png', '2024-05-09', '2024-07-12 13:53:45', '2024-07-12 13:54:16', '2024-07-12 13:54:16'),
(36, 'Ali - SAMIA', '0661956000', 'Casablanca', 'PEUGEOT', '3008', 2018, 97000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'khdima distance', 'peugeot-3008-138625.png', 'peugeot-3008-683485.png', 'peugeot-3008-558275.jpeg', '2024-07-12', '2024-07-13 10:11:26', '2024-07-13 10:11:26', NULL),
(37, 'AKRAM', '0662888587', 'Casablanca', 'HYUNDAI', 'Tucson', 2022, 67000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'hyundai-tucson-467605.png', 'hyundai-tucson-634501.png', 'hyundai-tucson-790096.png', '2024-07-15', '2024-07-16 15:10:42', '2024-07-16 15:10:42', NULL),
(38, 'Morad', '0626468791', 'Zenata', 'DODGE', 'Caliber', 2008, 110000, 'diesel', 'automatique', 'très bon', 'neuf', 'WWW au Maroc', 'estimer ma voiture', 'estimer', 'dodge-caliber-707513.jpg', 'dodge-caliber-770528.jpg', 'dodge-caliber-406793.jpeg', '2024-07-01', '2024-07-18 13:47:52', '2024-07-18 13:48:21', '2024-07-18 13:48:21'),
(39, 'MAROUD HABSAT', '0606826108', 'Berrechid', 'HYUNDAI', 'Tucson', 2021, 86000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'hyundai-tucson-378358.jpg', 'hyundai-tucson-985528.jpg', 'hyundai-tucson-704473.jpeg', '2024-07-18', '2024-07-19 10:01:01', '2024-07-19 10:01:01', NULL),
(40, 'Mourad tucson 2022', '0674218065', 'Casablanca', 'HYUNDAI', 'Tucson', 2022, 40000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'hyundai-tucson-251382.png', 'hyundai-tucson-781536.png', 'hyundai-tucson-946248.png', '2024-07-17', '2024-07-20 09:01:50', '2024-07-20 09:01:50', NULL),
(41, 'MOUAAD ESMATT', '0661180559', 'Casablanca', 'HYUNDAI', 'Tucson', 2024, 5000, 'diesel', 'automatique', 'neuf', 'neuf', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'hyundai-tucson-956898.png', 'hyundai-tucson-816831.png', 'hyundai-tucson-476931.jpeg', '2024-07-19', '2024-07-20 09:08:04', '2024-07-20 09:08:04', NULL),
(42, 'MOHAMED AMINE', '0676970334', 'Casablanca', 'VOLKSWAGEN', 'Touareg', 2022, 81000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'volkswagen-touareg-951506.png', 'volkswagen-touareg-592250.png', 'volkswagen-touareg-994548.jpeg', '2024-07-19', '2024-07-20 09:14:16', '2024-07-20 09:14:16', NULL),
(43, 'Hassna koudri', '0693406140', 'Casablanca', 'HYUNDAI', 'Tucson', 2017, 125000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'khdima distance', 'hyundai-tucson-599486.jpeg', 'hyundai-tucson-690342.jpeg', 'hyundai-tucson-944298.jpeg', '2024-07-28', '2024-07-27 15:50:28', '2024-07-27 15:50:28', NULL),
(44, 'EL MAHDI', '0667927041', 'Casablanca', 'HYUNDAI', 'Tucson', 2017, 150000, 'diesel', 'automatique', 'très bon', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'hyundai-tucson-835737.jpg', 'hyundai-tucson-816727.jpg', 'hyundai-tucson-421310.jpg', '2024-08-07', '2024-08-08 13:39:40', '2024-08-08 13:39:40', NULL),
(45, 'DOUNIA', '0770080009', 'Casablanca-Jnane Californie', 'BMW', 'Série 5', 2018, 118000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'bmw-serie-5-440207.JPG', 'bmw-serie-5-616591.JPG', 'bmw-serie-5-155457.JPG', '2024-09-05', '2024-09-06 15:34:36', '2024-09-06 15:34:36', NULL),
(46, 'Haj Moustapha', '+212 658-317084', 'Casablanca-Jnane Californie', 'NISSAN', 'Qashqai', 2019, 51000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'nissan-qashqai-553556.JPG', 'nissan-qashqai-165543.JPG', 'nissan-qashqai-439086.JPG', '2024-09-05', '2024-09-06 15:36:04', '2024-09-21 11:48:08', '2024-09-21 11:48:08'),
(47, 'Hadir ismail', '0674120605', 'Temara', 'OPEL', 'Astra', 2014, 200000, 'diesel', 'manuelle', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'khdima distance', 'opel-astra-333674.jpg', 'opel-astra-252726.jpg', 'opel-astra-341984.jpg', '2024-09-14', '2024-09-10 16:22:49', '2024-10-12 14:04:37', '2024-10-12 14:04:37'),
(48, 'Anas amargoulla', '0639699819', 'Settat', 'MERCEDES', 'Classe A', 2017, 98000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'khdima distance', 'mercedes-classe-a-102936.jpeg', 'mercedes-classe-a-494437.jpeg', 'mercedes-classe-a-177518.png', '2024-11-01', '2024-10-26 18:09:27', '2024-10-26 18:09:27', NULL),
(49, 'mohammed iraqi housseini', '0660155623', 'Casablanca', 'VOLKSWAGEN', 'Touareg', 2019, 106000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'volkswagen-touareg-188742.jpg', 'volkswagen-touareg-292833.jpg', 'volkswagen-touareg-292562.jpg', '2024-11-04', '2024-11-04 11:36:36', '2024-11-04 11:36:36', NULL),
(50, 'ahmed hilal', '0655266876', 'Casablanca', 'VOLKSWAGEN', 'Tiguan', 2018, 100000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'volkswagen-tiguan-803513.jpeg', 'volkswagen-tiguan-919142.jpeg', 'volkswagen-tiguan-479655.jpeg', '2024-11-20', '2024-11-20 10:54:33', '2024-11-20 10:54:33', NULL),
(51, 'Hanane', '0662866965', 'Casablanca', 'RENAULT', 'Captur', 2021, 49000, 'diesel', 'manuelle', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'renault-captur-848319.jpeg', 'renault-captur-750918.jpeg', 'renault-captur-730699.jpeg', '2024-11-22', '2024-11-22 12:42:44', '2024-11-22 12:42:44', NULL),
(52, 'farid zerrad', '0620969040', 'Casablanca', 'AUDI', 'A3', 2019, 76000, 'diesel', 'automatique', 'excellent', 'occasion', 'dédouané', 'vendre ma voiture', 'pack showroom', 'audi-a3-688613.jpeg', 'audi-a3-155857.jpeg', 'audi-a3-679633.jpeg', '2024-11-26', '2024-11-26 08:42:33', '2024-11-26 08:42:33', NULL),
(53, 'imrane zouhair', '0661183848', 'Casablanca-Jnane Californie', 'BMW', 'Série 2', 2023, 60050, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'bmw-serie-2-376556.jpeg', 'bmw-serie-2-374379.jpeg', 'bmw-serie-2-518081.jpeg', '2024-12-16', '2024-12-16 14:53:24', '2024-12-16 14:53:24', NULL),
(54, 'abdelouahab bouzerda', '0637582136', 'Casablanca', 'MERCEDES', 'Classe GLC', 2019, 107000, 'diesel', 'automatique', 'excellent', 'occasion', 'dédouané', 'vendre ma voiture', 'pack showroom', 'mercedes-classe-glc-334913.jpeg', 'mercedes-classe-glc-311236.jpeg', 'mercedes-classe-glc-692574.jpeg', '2024-12-23', '2024-12-26 11:56:38', '2024-12-26 11:56:38', NULL),
(55, 'ABDENASSEURE LAZRAG', '+212 602-171616', 'Casablanca', 'KIA', 'SPORTAGE', 2020, 115000, 'diesel', 'automatique', 'très bon', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'khdima distance', 'kia-sportage-626955.jpg', 'kia-sportage-540778.jpg', 'kia-sportage-421092.jpg', '2025-01-19', '2025-01-21 14:16:29', '2025-01-21 14:16:29', NULL),
(56, 'Hatim Tony Ahmed Abdelfatar', '+212645-007085', 'Casablanca-Jnane Californie', 'PORSCHE', 'Macan', 2021, 67000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'khdima distance', 'porsche-macan-722469.JPG', 'porsche-macan-808050.JPG', 'porsche-macan-974158.jpg', '2025-01-21', '2025-01-21 14:23:11', '2025-01-21 14:23:11', NULL),
(57, '2', 'g', 'Casablanca-Jnane Californie', 'AUDI', 'A1', 2020, 222222, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'estimer ma voiture', 'estimer', 'audi-a1-897551.jpg', 'audi-a1-302701.jpg', 'audi-a1-558105.jpg', '2025-04-02', '2025-04-15 16:41:51', '2025-04-16 15:30:24', '2025-04-16 15:30:24'),
(58, 'HAMZA', '0611640426', 'Casablanca', 'LAND ROVER', 'Range Rover Sport', 2021, 75000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'khdima distance', 'land-rover-range-rover-sport-242375.JPG', 'land-rover-range-rover-sport-258606.JPG', 'land-rover-range-rover-sport-889282.JPG', '2025-05-22', '2025-05-24 13:33:32', '2025-05-24 13:33:32', NULL),
(59, 'YOUSSEF ERGUIG', '0649220068', 'Casablanca', 'MERCEDES', 'Classe GLA', 2024, 23000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'mercedes-classe-gla-496148.JPG', 'mercedes-classe-gla-211944.JPG', 'mercedes-classe-gla-380132.JPG', '2025-03-28', '2025-05-24 13:37:48', '2025-05-24 13:37:48', NULL),
(60, 'AHMED ESSAYH', '06701138603', 'Casablanca', 'DS', 'DS 7 Crossback', 2021, 108250, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'khdima distance', 'ds-ds-7-crossback-521113.JPG', 'ds-ds-7-crossback-757832.JPG', 'ds-ds-7-crossback-451801.JPG', '2025-04-24', '2025-05-24 13:40:31', '2025-05-24 13:40:31', NULL),
(61, 'ABDERRAHIM HAMMATTOU', '0661339383', 'Casablanca-Jnane Californie', 'BMW', 'X3', 2019, 110000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'bmw-x3-369018.JPG', 'bmw-x3-339218.JPG', 'bmw-x3-806648.JPG', '2025-05-29', '2025-06-02 09:01:28', '2025-06-02 09:01:28', NULL),
(62, 'ABDERRAHIM HAMMATTOU', '0661339383', 'Casablanca-Jnane Californie', 'BMW', 'X3', 2019, 110000, 'diesel', 'automatique', 'excellent', 'occasion', 'WWW au Maroc', 'vendre ma voiture', 'pack showroom', 'bmw-x3-577585.JPG', 'bmw-x3-209015.JPG', 'bmw-x3-179653.JPG', '2025-05-29', '2025-06-02 09:01:30', '2025-06-02 09:02:07', '2025-06-02 09:02:07'),
(64, 'Mr RACHID', '0665656565', 'Casablanca', 'VOLKSWAGEN', 'Tiguan', 2021, 129000, 'diesel', 'automatique', 'excellent', 'neuf', 'dédouané', 'vendre ma voiture', 'pack showroom', 'volkswagen-tiguan-635664.JPG', 'volkswagen-tiguan-136364.JPG', 'volkswagen-tiguan-193830.JPG', '2025-06-16', '2025-06-19 08:29:16', '2025-06-19 08:29:16', NULL),
(65, 'Oussama Elhadi', '0637916134', 'Temara', 'BMW', 'Série 3 Cabriolet', 2017, 200000, 'essence', 'automatique', NULL, NULL, NULL, 'vendre ma voiture', 'Pack Distance', 'ventes/uB3ncnnuALnpQvovinZ4FjeOUrMGvEmUoVjPQGZm.jpg', NULL, NULL, '2025-10-06', '2025-10-06 17:27:45', '2025-10-06 17:27:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `videosads`
--

CREATE TABLE `videosads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(125) NOT NULL,
  `video_key` varchar(125) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videosads`
--

INSERT INTO `videosads` (`id`, `title`, `video_key`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'dacia sandero stepway gris 2021', 'w6NfgiRKTlk', '2024-02-06 12:18:49', '2024-02-06 12:18:49', NULL),
(2, 'Skoda Octavia Diesel Manuelle 2019', 'X6g97ZcQOPg', '2024-02-06 12:19:09', '2024-02-06 12:19:09', NULL),
(3, 'Volkswagen Tiguan R-line 2021', '82OkIW8g1AA', '2024-02-06 12:19:23', '2024-02-06 12:19:23', NULL),
(4, 'Volkswagen gtd GOLF 7 plus 2019', 'jqWRDYpOt50', '2024-02-06 12:19:41', '2024-02-06 12:19:41', NULL),
(5, 'Citroen ds3 crossback 2022', 'OQv0p9XJsSk', '2024-02-06 12:20:04', '2024-02-06 12:20:04', NULL),
(6, 'Hyundai Tucson 2022', 'bQnDT1ZRSgU', '2024-02-06 12:20:25', '2024-02-06 12:20:25', NULL),
(7, 'Range Rover Evoque 2018', 'bxTKQ6gVW-8', '2024-02-06 12:21:02', '2024-02-06 12:21:02', NULL),
(8, '208 peugeot 2022', 'Yot-JB9tw30', '2024-02-06 12:21:29', '2024-02-06 12:21:29', NULL),
(9, 'Dacia Sandero Stepway Gris 2021', 'w6NfgiRKTlk', '2024-02-14 13:41:21', '2024-02-15 08:35:14', '2024-02-15 08:35:14'),
(10, 'Renault Kadjar toit panoramique 12-2017', '7dNu9j251d8&ab', '2024-02-14 13:45:51', '2024-02-14 18:20:16', '2024-02-14 18:20:16'),
(11, 'https://www.youtube.com/watch?v=7dNu9j251d8&ab_channel=NADOAUTO', '7dNu9j251d8', '2024-02-14 13:46:52', '2024-02-14 18:20:21', '2024-02-14 18:20:21'),
(12, 'Renault Kadjar Toit Panoramique 12-2017', '7dNu9j251d8', '2024-02-14 14:48:13', '2024-02-16 13:07:12', NULL),
(13, 'Range Rover Sport SE  2016', 'Hyjw_VHg0Mc', '2024-02-14 14:49:18', '2024-02-16 13:04:50', NULL),
(14, 'Hyundai Tucson 2023', 'bfbvFtE87qc', '2024-02-14 14:50:24', '2024-02-14 18:25:28', NULL),
(15, 'Peugeot 208 2022', '2Rfl0uqpRz4', '2024-02-19 13:54:01', '2024-02-19 13:54:01', NULL),
(16, 'BMW 2020 Série 1 Sport 118d', 'TPlfIcutDys', '2024-02-24 21:24:44', '2024-02-24 21:24:44', NULL),
(17, 'Hyundai Tucson 2022', 'k8AYr0UQCq0', '2024-03-01 17:20:25', '2024-03-01 17:20:25', NULL),
(18, 'Audi A4 2019', 'JggUO1rxIwM', '2024-03-08 14:35:40', '2024-03-08 14:35:40', NULL),
(19, 'Mercedes-Benz Classe C bluetec 2014 dédouaner 2022', 'ZsxdWFkuJZg', '2024-03-18 13:23:59', '2024-03-18 13:23:59', NULL),
(20, 'Hyundai i 30 -2019', 'Pl7THzdvtXs', '2024-03-18 13:24:55', '2024-05-07 13:16:24', NULL),
(21, 'Volkswagen Tiguan - 2024', 'LmsM2D7R5-c', '2024-03-30 17:20:02', '2024-05-07 13:16:06', NULL),
(22, 'Mercedes-Benz classe C bluetec -2016', 'lsxpwyEMYS8', '2024-04-04 14:28:56', '2024-04-04 14:28:56', NULL),
(23, 'Nissan Juke - 2021', 'xlPk1i-PTWY', '2024-04-09 15:59:45', '2024-05-07 13:15:58', NULL),
(24, 'Toyota C-HR Hybride Automatique -2017', '4lSP9BM7-6I', '2024-04-26 12:29:33', '2024-05-07 13:15:50', NULL),
(25, 'TOYOTA COROLLA HYBRIDE - 2019', 'e4bzk34pOVI', '2024-04-26 12:30:55', '2024-04-26 12:30:55', NULL),
(26, 'HYUNDAI CRETA - 2022', 'IlPta1Eiutg', '2024-05-04 10:36:14', '2024-05-07 13:15:42', NULL),
(27, 'Volkswagen Touareg -2021', 'QBlmh5Zr4mA', '2024-05-07 13:15:10', '2024-05-07 13:15:37', NULL),
(28, 'Volkswagen Tiguan - 2018', 'lzKSqJlLHv4', '2024-05-08 11:41:30', '2024-05-08 11:41:30', NULL),
(29, 'AUDI Q5 - 2011', 'l_A4Rkf5ds8', '2024-05-08 14:33:17', '2024-05-08 14:33:17', NULL),
(30, 'Hyundai Tucson -2021', 'ZN5VFZoeEQw', '2024-05-09 10:03:39', '2024-05-09 10:03:39', NULL),
(31, 'Seat Arona - 2022', 'rPBFcwuRbAs', '2024-05-11 10:25:47', '2024-05-11 10:25:47', NULL),
(32, 'Mercedes-benz Classe C AMG Line -2023', 'd6E6GC_6F0U', '2024-05-13 09:42:30', '2024-05-13 09:43:06', NULL),
(33, 'Hyundai Tucson - 2020', 'JeSKlruj5NY', '2024-05-13 13:17:07', '2024-05-13 13:17:07', NULL),
(34, 'Dacia Duster  - 2018', 'WKCxW9Hm8K8', '2024-05-18 10:08:55', '2024-05-18 10:16:31', NULL),
(35, 'Mercedes-benz classe A AMG Line - 2020 dédouaner - 2024', 'iAXZxF6OK0E', '2024-05-20 15:07:34', '2024-05-20 15:07:34', NULL),
(36, 'Dacia Sandero Stepway -2022', 'Sa0RDCXP1A0', '2024-05-25 10:28:31', '2024-05-25 10:28:31', NULL),
(37, 'BMW X1 - 2017', 'ePV1jtj5Jao', '2024-05-25 11:31:13', '2024-05-25 11:31:13', NULL),
(38, 'Mercedes-benz classe A - AMG line - 2020', 'CtjPrsS7--Q', '2024-05-25 13:27:54', '2024-05-25 13:27:54', NULL),
(39, 'Hyundai Tucson - 2016', 'XlZ_H40kHmo', '2024-05-30 08:51:11', '2024-05-30 08:51:11', NULL),
(40, 'Honda CR-V 2014', 'bI23nZJPzUU', '2024-07-03 11:30:35', '2024-07-03 11:30:35', NULL),
(41, 'Hyundai Tucson - 2022', 'Mf6k6WBnVe4', '2024-07-03 11:31:15', '2024-07-03 11:31:15', NULL),
(42, 'Peugeot 508 GT line - 2021', 'I_DPY62fuUw', '2024-07-06 16:14:15', '2024-07-06 16:14:15', NULL),
(43, 'Mercedes-benz Classe C AMG - 2022', 'B2rg1CWCj5s', '2024-07-06 16:15:17', '2024-07-06 16:15:17', NULL),
(44, 'TOYOTA Yaris - 2021', 'S8CI2Twvn3Q', '2024-07-09 16:24:16', '2024-07-09 16:24:16', NULL),
(45, 'Volkswagen Golf 8 2L tdi style -2022', '16G4863zEiQ', '2024-07-12 16:38:36', '2024-07-12 16:38:36', NULL),
(46, 'Peugeot 3008 Gt line  -2018', 'JKf9BCwP1tE', '2024-07-12 16:39:35', '2024-07-12 16:39:35', NULL),
(47, 'KIA Picanto -202O', 'C5jk_URqNk0', '2024-07-13 09:00:26', '2024-07-13 09:00:26', NULL),
(48, 'Peugeot 3008 - 2019', '7O6fvWPcCAE', '2024-07-13 15:32:18', '2024-07-16 09:55:07', NULL),
(49, 'Hyundai Tucson - 2022', 'R4nQQRYZkFM', '2024-07-16 09:55:50', '2024-07-16 09:55:50', NULL),
(50, 'Hyundai Tucson - 2021', '5z0kZPr8neI', '2024-07-18 14:39:10', '2024-07-18 14:39:10', NULL),
(51, 'Hyundai Tucson - 2022', 'q_uq02V4j_0', '2024-07-19 14:05:04', '2024-07-19 14:05:04', NULL),
(52, 'Hyundai Tucson 2024-04', 'Xtm_LWXoSEI', '2024-07-20 09:22:29', '2024-07-20 09:22:29', NULL),
(53, 'Volkswagen Touareg  R-line - 2022', 'RvSwfy5mNAE', '2024-07-20 09:23:07', '2024-07-20 09:23:07', NULL),
(54, 'Hyundai i10 - 2012', 'zILLt8rMb00', '2024-07-24 11:16:18', '2024-07-24 11:16:18', NULL),
(55, 'Hyundai Tucson - 2017', 'Pl6rHABhQNo', '2024-07-30 14:54:18', '2024-07-30 14:54:18', NULL),
(56, 'Jeep wrangler sahara - 2018', 'tdWv_qwErFw', '2024-08-05 14:06:47', '2024-08-05 14:06:47', NULL),
(57, 'Volkswagen Golf 7 - 2019', '_v-ShVUpD-o', '2024-08-17 14:21:16', '2024-08-17 14:21:16', NULL),
(58, 'BMW Série5 -2018', 'xBndkM-UGlk', '2024-09-05 15:39:47', '2024-09-05 15:39:47', NULL),
(59, 'Nissan Qashqai-2019-12', 'jQaknrM2fYA', '2024-09-06 13:36:19', '2024-09-27 08:45:18', '2024-09-27 08:45:18'),
(60, 'Ford Kuga Titanium -2016', 'D4Qi2hU9AMs', '2024-09-12 10:15:46', '2024-09-12 10:15:46', NULL),
(61, 'Land Rover evoque bb velar - 2019 - Location', 'yP7_sGplLVE', '2024-09-27 08:45:35', '2024-09-27 08:45:35', NULL),
(62, 'Peugeot 3008 ALLURE - 2021', 'W-oRS_dMYcc', '2024-09-28 11:50:21', '2024-09-28 11:50:21', NULL),
(63, 'Hyundai Tucson - 2022', 'DL-WynUxH_A', '2024-09-28 13:47:30', '2024-09-28 13:47:30', NULL),
(64, 'Hyundai creta  - 2022', '6mQvsMa3rJU', '2024-11-13 08:42:28', '2024-11-13 08:45:10', '2024-11-13 08:45:10'),
(65, 'Hyundai Tucson - 2022', 'sHgQ7YInOuY', '2024-11-13 08:42:29', '2024-11-13 08:44:44', NULL),
(66, 'Hyundai Creta  - 2022', '6mQvsMa3rJU', '2024-11-13 08:43:19', '2024-11-13 08:43:19', NULL),
(67, 'Volkswagen Tiguan - 2018', 'iGX4X2K8wt4', '2024-11-20 13:38:54', '2024-11-20 13:38:54', NULL),
(68, 'BMW X5 -2017', '0WVBRaNmZj0', '2024-11-21 13:37:45', '2024-11-22 15:36:04', NULL),
(69, 'Captur Renault - 2021', 'iZ5iSGkRFLU', '2024-11-22 15:36:57', '2024-11-22 15:36:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `villes`
--

CREATE TABLE `villes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `villes`
--

INSERT INTO `villes` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Casablanca', '2024-02-06 13:36:41', '2024-02-09 12:26:07', NULL),
(2, 'Casablanca-Jnane Californie', '2024-02-09 12:25:59', '2024-05-03 14:51:40', NULL),
(3, 'Marrakech', '2024-02-09 12:26:59', '2024-02-09 12:44:13', NULL),
(4, 'Californie', '2024-02-09 12:38:12', '2024-02-09 12:44:36', NULL),
(5, 'Fès', '2024-02-09 12:38:24', '2024-02-09 12:38:24', NULL),
(6, 'El Jadida', '2024-02-09 12:38:46', '2024-02-09 12:38:46', NULL),
(7, 'Agadir', '2024-02-09 12:39:01', '2024-02-09 12:39:01', NULL),
(8, 'Safi', '2024-02-09 12:39:11', '2024-02-09 12:39:11', NULL),
(9, 'Temara', '2024-02-09 12:39:24', '2024-02-09 12:39:24', NULL),
(10, 'Salé', '2024-02-09 12:39:35', '2024-02-09 12:39:35', NULL),
(11, 'Tétouan', '2024-02-09 12:39:44', '2024-02-09 12:39:44', NULL),
(12, 'Kénitra', '2024-02-09 12:39:53', '2024-02-09 12:39:53', NULL),
(13, 'Essaouira', '2024-02-09 12:40:04', '2024-02-09 12:40:04', NULL),
(14, 'Zenata', '2024-02-09 12:40:31', '2024-02-09 12:40:31', NULL),
(15, 'Oujda', '2024-02-09 12:40:55', '2024-02-09 12:40:55', NULL),
(16, 'Rabat', '2024-02-09 12:41:05', '2024-02-09 12:41:05', NULL),
(17, 'Nador', '2024-02-09 12:41:13', '2024-02-09 12:41:13', NULL),
(18, 'Meknès', '2024-02-09 12:41:48', '2024-02-09 12:41:48', NULL),
(19, 'Settat', '2024-02-09 12:41:55', '2024-02-09 12:41:55', NULL),
(20, 'Benslimane', '2024-02-09 12:42:01', '2024-02-09 12:42:01', NULL),
(21, 'Ifrane', '2024-02-09 12:42:07', '2024-02-09 12:42:07', NULL),
(22, 'Dakhla', '2024-02-09 12:42:13', '2024-02-09 12:42:13', NULL),
(23, 'Taroudant', '2024-02-09 12:42:19', '2024-02-09 12:42:19', NULL),
(24, 'Skhirat', '2024-02-09 12:42:25', '2024-02-09 12:42:25', NULL),
(25, 'Bouznika', '2024-02-09 12:42:31', '2024-02-09 12:42:31', NULL),
(26, 'Tan-Tan', '2024-02-09 12:42:38', '2024-02-09 12:42:38', NULL),
(27, 'Aarab Sebbah Gheris', '2024-02-09 12:42:46', '2024-02-09 12:42:46', NULL),
(28, 'Aarab Sebbah Ziz', '2024-02-09 12:42:53', '2024-02-09 12:42:53', NULL),
(29, 'Abadou', '2024-02-09 12:42:59', '2024-02-09 12:42:59', NULL),
(30, 'Abaynou', '2024-02-09 12:43:12', '2024-02-09 12:43:12', NULL),
(31, 'Tanger', '2024-02-09 12:44:47', '2024-02-09 12:44:47', NULL),
(32, 'Abbou Lakhal', '2024-02-09 12:45:08', '2024-02-09 12:45:08', NULL),
(33, 'Abdelghaya Souahel', '2024-02-09 12:45:18', '2024-02-09 12:45:18', NULL),
(34, 'Abteh', '2024-02-09 12:45:34', '2024-02-09 12:45:34', NULL),
(35, 'Adaghas', '2024-02-09 12:45:41', '2024-02-09 12:45:41', NULL),
(36, 'Adar', '2024-02-09 12:45:48', '2024-02-09 12:45:48', NULL),
(37, 'Adrej', '2024-02-09 12:45:55', '2024-02-09 12:45:55', NULL),
(38, 'Aferkat', '2024-02-09 12:46:01', '2024-02-09 12:46:01', NULL),
(39, 'Afourar', '2024-02-09 12:46:07', '2024-02-09 12:46:07', NULL),
(40, 'Agadir Melloul', '2024-02-09 12:46:14', '2024-02-09 12:46:14', NULL),
(41, 'Agafay', '2024-02-09 12:46:21', '2024-02-09 12:46:21', NULL),
(42, 'Agdz', '2024-02-09 12:46:28', '2024-02-09 12:46:28', NULL),
(43, 'Aghbal', '2024-02-09 12:46:45', '2024-02-09 12:46:45', NULL),
(44, 'Aghbala', '2024-02-09 12:46:52', '2024-02-09 12:46:52', NULL),
(45, 'Aghbalou', '2024-02-09 12:46:58', '2024-02-09 12:46:58', NULL),
(46, 'Aghbalou N\'kerdous', '2024-02-09 12:47:04', '2024-02-09 12:47:04', NULL),
(47, 'Aghouinite', '2024-02-09 12:47:10', '2024-02-09 12:47:10', NULL),
(48, 'Agourai', '2024-02-09 12:47:16', '2024-02-09 12:47:16', NULL),
(49, 'Aguelmous', '2024-02-09 12:47:24', '2024-02-09 12:47:24', NULL),
(50, 'Ahfir', '2024-02-09 12:47:33', '2024-02-09 12:47:33', NULL),
(51, 'Ahlaf', '2024-02-09 12:47:39', '2024-02-09 12:47:39', NULL),
(52, 'Ahl Sidi Lahcen', '2024-02-09 12:47:46', '2024-02-09 12:47:46', NULL),
(53, 'Ahmar Laglalcha', '2024-02-09 12:47:54', '2024-02-09 12:47:54', NULL),
(54, 'Ain Aouda', '2024-02-09 12:48:01', '2024-02-09 12:48:01', NULL),
(55, 'Ain Attig', '2024-02-09 12:48:09', '2024-02-09 12:48:09', NULL),
(56, 'Ain Bida', '2024-02-09 12:48:17', '2024-02-09 12:48:17', NULL),
(57, 'Ain Bni Mathar', '2024-02-09 12:48:26', '2024-02-09 12:48:26', NULL),
(58, 'Ain Cheggag', '2024-02-09 12:48:33', '2024-02-09 12:48:33', NULL),
(59, 'Ain Erreggada', '2024-02-09 12:48:39', '2024-02-09 12:48:39', NULL),
(60, 'Ain Harrouda', '2024-02-09 12:48:46', '2024-02-09 12:48:46', NULL),
(61, 'Ain Johra', '2024-02-09 12:49:22', '2024-02-09 12:49:22', NULL),
(62, 'Ain Harrouda', '2024-02-09 12:50:46', '2024-02-09 12:50:46', NULL),
(63, 'Ain Johra', '2024-02-09 12:50:52', '2024-02-09 12:50:52', NULL),
(64, 'Ain Karma', '2024-02-09 12:50:57', '2024-02-09 12:50:57', NULL),
(65, 'Ain Legdah', '2024-02-09 12:51:02', '2024-02-09 12:51:02', NULL),
(66, 'Ain Leuh', '2024-02-09 12:51:09', '2024-02-09 12:51:09', NULL),
(67, 'Ain Orma', '2024-02-09 12:51:15', '2024-02-09 12:51:15', NULL),
(68, 'Ain Sbit', '2024-02-09 12:51:25', '2024-02-09 12:51:25', NULL),
(69, 'Ain Sfa', '2024-02-09 12:51:30', '2024-02-09 12:51:30', NULL),
(70, 'Ain Taoujdate', '2024-02-09 12:51:35', '2024-02-09 12:51:35', NULL),
(71, 'Ain Tizgha', '2024-02-09 12:51:39', '2024-02-09 12:51:39', NULL),
(72, 'Ait Amira', '2024-02-09 12:51:44', '2024-02-09 12:51:44', NULL),
(73, 'Ait Baha', '2024-02-09 12:51:49', '2024-02-09 12:51:49', NULL),
(74, 'Ait Belkacem', '2024-02-09 12:51:54', '2024-02-09 12:51:54', NULL),
(75, 'Ait Ben Yacoub', '2024-02-09 12:51:59', '2024-02-09 12:51:59', NULL),
(76, 'Ait Boubidmane', '2024-02-09 12:52:05', '2024-02-09 12:52:05', NULL),
(77, 'Ait Bouyahya El Hajjama', '2024-02-09 12:52:10', '2024-02-09 12:52:10', NULL),
(78, 'Aït Iaaza', '2024-02-09 12:52:14', '2024-02-09 12:52:14', NULL),
(79, 'Ait Ichou', '2024-02-09 12:52:19', '2024-02-09 12:52:19', NULL),
(80, 'Ait Imour', '2024-02-09 12:52:23', '2024-02-09 12:52:23', NULL),
(81, 'Aït Iaaza', '2024-02-09 12:52:28', '2024-02-09 12:52:28', NULL),
(82, 'Ait Ichou', '2024-02-09 12:52:32', '2024-02-09 12:52:32', NULL),
(83, 'Ait Imour', '2024-02-09 12:52:38', '2024-02-09 12:52:38', NULL),
(84, 'Ait Ishaq', '2024-02-09 12:52:42', '2024-02-09 12:52:42', NULL),
(85, 'Ait Malek', '2024-02-09 12:52:46', '2024-02-09 12:52:46', NULL),
(86, 'Ait Melloul', '2024-02-09 12:52:50', '2024-02-09 12:52:50', NULL),
(87, 'Ait Milk', '2024-02-09 12:52:55', '2024-02-09 12:52:55', NULL),
(88, 'Ait Mimoun', '2024-02-09 12:53:00', '2024-02-09 12:53:00', NULL),
(89, 'Ait Ouallal', '2024-02-09 12:53:04', '2024-02-09 12:53:04', NULL),
(90, 'Ait Ouribel', '2024-02-09 12:53:09', '2024-02-09 12:53:09', NULL),
(91, 'Ait Ourir', '2024-02-09 12:53:14', '2024-02-09 12:53:14', NULL),
(92, 'Ait Sidi Daoud', '2024-02-09 12:53:18', '2024-02-09 12:53:18', NULL),
(93, 'Ait Yaazem', '2024-02-09 12:53:23', '2024-02-09 12:53:23', NULL),
(94, 'Ait Yadine', '2024-02-09 12:53:29', '2024-02-09 12:53:29', NULL),
(95, 'Ait Youl', '2024-02-09 12:53:34', '2024-02-09 12:53:34', NULL),
(96, 'Ajdir', '2024-02-09 12:53:39', '2024-02-09 12:53:39', NULL),
(97, 'Akarma', '2024-02-09 12:53:43', '2024-02-09 12:53:43', NULL),
(98, 'Akhfennir', '2024-02-09 12:53:48', '2024-02-09 12:53:48', NULL),
(99, 'Akka', '2024-02-09 12:53:54', '2024-02-09 12:53:54', NULL),
(100, 'Aklim', '2024-02-09 12:53:59', '2024-02-09 12:53:59', NULL),
(101, 'Aknoul', '2024-02-09 12:54:04', '2024-02-09 12:54:04', NULL),
(102, 'Al Aaroui', '2024-02-09 12:54:10', '2024-02-09 12:54:10', NULL),
(103, 'Al Firdaous', '2024-02-09 12:54:14', '2024-02-09 12:54:14', NULL),
(104, 'Al Haouz', '2024-02-09 12:54:19', '2024-02-09 12:54:19', NULL),
(105, 'Al Hoceima', '2024-02-09 12:54:24', '2024-02-09 12:54:24', NULL),
(106, 'Allyene', '2024-02-09 12:54:30', '2024-02-09 12:54:30', NULL),
(107, 'Alnif', '2024-02-09 12:54:35', '2024-02-09 12:54:35', NULL),
(108, 'Al Oioun Sidi Mellouk', '2024-02-09 12:54:41', '2024-02-09 12:54:41', NULL),
(109, 'Amalou', '2024-02-09 12:54:46', '2024-02-09 12:54:46', NULL),
(110, 'Amerzgane', '2024-02-09 12:54:51', '2024-02-09 12:54:51', NULL),
(111, 'Ameur Seflia', '2024-02-09 12:55:48', '2024-02-09 12:55:48', NULL),
(112, 'Amghras', '2024-02-09 12:55:53', '2024-02-09 12:55:53', NULL),
(113, 'Amizmiz', '2024-02-09 12:55:58', '2024-02-09 12:55:58', NULL),
(114, 'Amskroud', '2024-02-09 12:56:10', '2024-02-09 12:56:10', NULL),
(115, 'Amtar', '2024-02-09 12:56:17', '2024-02-09 12:56:17', NULL),
(116, 'Anfeg', '2024-02-09 12:56:24', '2024-02-09 12:56:24', NULL),
(117, 'Anjra', '2024-02-09 12:56:28', '2024-02-09 12:56:28', NULL),
(118, 'Aoulouz', '2024-02-09 12:56:33', '2024-02-09 12:56:33', NULL),
(119, 'Aourir', '2024-02-09 12:56:38', '2024-02-09 12:56:38', NULL),
(120, 'Aousserd', '2024-02-09 12:56:42', '2024-02-09 12:56:42', NULL),
(121, 'Aqesri', '2024-02-09 12:57:20', '2024-02-09 12:57:20', NULL),
(122, 'Aquouass Briech', '2024-02-09 12:57:29', '2024-02-09 12:57:29', NULL),
(123, 'Arbaa Sahel', '2024-02-09 12:57:35', '2024-02-09 12:57:35', NULL),
(124, 'Arbaoua', '2024-02-09 12:57:41', '2024-02-09 12:57:41', NULL),
(125, 'Arekmane', '2024-02-09 12:57:46', '2024-02-09 12:57:46', NULL),
(126, 'Arfoud', '2024-02-09 12:57:50', '2024-02-09 12:57:50', NULL),
(127, 'Asilah', '2024-02-09 12:57:55', '2024-02-09 12:57:55', NULL),
(128, 'Asni', '2024-02-09 12:57:59', '2024-02-09 12:57:59', NULL),
(129, 'Assa', '2024-02-09 12:58:04', '2024-02-09 12:58:04', NULL),
(130, 'Assahrij', '2024-02-09 12:58:08', '2024-02-09 12:58:08', NULL),
(131, 'Assa zag', '2024-02-09 12:58:13', '2024-02-09 12:58:13', NULL),
(132, 'Ayir', '2024-02-09 12:58:17', '2024-02-09 12:58:17', NULL),
(133, 'Azemmour', '2024-02-09 12:58:21', '2024-02-09 12:58:21', NULL),
(134, 'Azilal', '2024-02-09 12:58:26', '2024-02-09 12:58:26', NULL),
(135, 'Azla', '2024-02-09 12:58:30', '2024-02-09 12:58:30', NULL),
(136, 'Azlaf', '2024-02-09 12:58:35', '2024-02-09 12:58:35', NULL),
(137, 'Azrou', '2024-02-09 12:58:41', '2024-02-09 12:58:41', NULL),
(138, 'Bab Berred', '2024-02-09 12:58:46', '2024-02-09 12:58:46', NULL),
(139, 'Bab Taza', '2024-02-09 12:58:52', '2024-02-09 12:58:52', NULL),
(140, 'Barkine', '2024-02-09 12:58:57', '2024-02-09 12:58:57', NULL),
(141, 'Bejaad', '2024-02-09 12:59:01', '2024-02-09 12:59:01', NULL),
(142, 'Belfaa', '2024-02-09 12:59:05', '2024-02-09 12:59:05', NULL),
(143, 'Ben Ahmed', '2024-02-09 12:59:10', '2024-02-09 12:59:10', NULL),
(144, 'Ben Guerir', '2024-02-09 12:59:15', '2024-02-09 12:59:15', NULL),
(145, 'Beni Malek', '2024-02-09 12:59:30', '2024-02-09 12:59:30', NULL),
(146, 'Béni Mellal', '2024-02-09 12:59:38', '2024-02-09 12:59:38', NULL),
(147, 'Béni Yakhlef', '2024-02-09 12:59:42', '2024-02-09 12:59:42', NULL),
(148, 'Ben Maachou', '2024-02-09 12:59:48', '2024-02-09 12:59:48', NULL),
(149, 'Ben Smim', '2024-02-09 12:59:53', '2024-02-09 12:59:53', NULL),
(150, 'Ben Taieb', '2024-02-09 12:59:58', '2024-02-09 12:59:58', NULL),
(151, 'Berkane', '2024-02-09 13:00:03', '2024-02-09 13:00:03', NULL),
(152, 'Berrechid', '2024-02-09 13:00:07', '2024-02-09 13:00:07', NULL),
(153, 'Bhalil', '2024-02-09 13:00:12', '2024-02-09 13:00:12', NULL),
(154, 'Bin El Ouidane', '2024-02-09 13:00:16', '2024-02-09 13:00:16', NULL),
(155, 'Biougra', '2024-02-09 13:00:20', '2024-02-09 13:00:20', NULL),
(156, 'Bir Ennasr', '2024-02-09 13:00:25', '2024-02-09 13:00:25', NULL),
(157, 'Bir Jdid', '2024-02-09 13:00:29', '2024-02-09 13:00:29', NULL),
(158, 'Bir Tam Tam', '2024-02-09 13:00:34', '2024-02-09 13:00:34', NULL),
(159, 'Bitit', '2024-02-09 13:00:38', '2024-02-09 13:00:38', NULL),
(160, 'Bizdad', '2024-02-09 13:00:42', '2024-02-09 13:00:42', NULL),
(161, 'Bni Ansar', '2024-02-09 13:00:47', '2024-02-09 13:00:47', NULL),
(162, 'Bni Ayat', '2024-02-09 13:00:51', '2024-02-09 13:00:51', NULL),
(163, 'Bni Bouzra', '2024-02-09 13:00:57', '2024-02-09 13:00:57', NULL),
(164, 'Bni Chiker', '2024-02-09 13:01:01', '2024-02-09 13:01:01', NULL),
(165, 'Bni Chiker', '2024-02-09 13:02:59', '2024-02-09 13:02:59', NULL),
(166, 'Bni Drar', '2024-02-09 13:03:08', '2024-02-09 13:03:08', NULL),
(167, 'Bni Ftah', '2024-02-09 13:03:19', '2024-02-09 13:03:19', NULL),
(168, 'Bni Harchen', '2024-02-09 13:03:25', '2024-02-09 13:03:25', NULL),
(169, 'Bni Hassane', '2024-02-09 13:03:30', '2024-02-09 13:03:30', NULL),
(170, 'Bni Khloug', '2024-02-09 13:03:37', '2024-02-09 13:03:37', NULL),
(171, 'Bni Marghnine', '2024-02-09 13:03:43', '2024-02-09 13:03:43', NULL),
(172, 'Bni Mathar', '2024-02-09 13:03:47', '2024-02-09 13:03:47', NULL),
(173, 'Bni Salah', '2024-02-09 13:03:52', '2024-02-09 13:03:52', NULL),
(174, 'Bni Tadjite', '2024-02-09 13:03:57', '2024-02-09 13:03:57', NULL),
(175, 'Bouadel', '2024-02-09 13:04:07', '2024-02-09 13:04:07', NULL),
(176, 'Bouanane', '2024-02-09 13:04:12', '2024-02-09 13:04:12', NULL),
(177, 'Bouarfa', '2024-02-09 13:04:17', '2024-02-09 13:04:17', NULL),
(178, 'Boudinar', '2024-02-09 13:04:22', '2024-02-09 13:04:22', NULL),
(179, 'Boudnib', '2024-02-09 13:04:29', '2024-02-09 13:04:29', NULL),
(180, 'Boufkrane', '2024-02-09 13:04:34', '2024-02-09 13:04:34', NULL),
(181, 'Boughriba', '2024-02-09 13:04:38', '2024-02-09 13:04:38', NULL),
(182, 'Bouguedra', '2024-02-09 13:04:43', '2024-02-09 13:04:43', NULL),
(183, 'Bouizakarne', '2024-02-09 13:04:47', '2024-02-09 13:04:47', NULL),
(184, 'Boujdour', '2024-02-09 13:04:52', '2024-02-09 13:04:52', NULL),
(185, 'Boujniba', '2024-02-09 13:04:57', '2024-02-09 13:04:57', NULL),
(186, 'Boukhalef', '2024-02-09 13:05:02', '2024-02-09 13:05:02', NULL),
(187, 'Boulanouar', '2024-02-09 13:05:06', '2024-02-09 13:05:06', NULL),
(188, 'Boulaouane', '2024-02-09 13:05:10', '2024-02-09 13:05:10', NULL),
(189, 'Boulemane', '2024-02-09 13:05:14', '2024-02-09 13:05:14', NULL),
(190, 'Boulmane', '2024-02-09 13:05:18', '2024-02-09 13:05:18', NULL),
(191, 'Boumalne-Dadès', '2024-02-09 13:05:23', '2024-02-09 13:05:23', NULL),
(192, 'Boumia', '2024-02-09 13:05:27', '2024-02-09 13:05:27', NULL),
(193, 'Bounaamane', '2024-02-09 13:05:33', '2024-02-09 13:05:33', NULL),
(194, 'Bouskoura', '2024-02-09 13:05:53', '2024-02-09 13:05:53', NULL),
(195, 'Bousselham', '2024-02-09 13:05:57', '2024-02-09 13:05:57', NULL),
(196, 'Bouzemmour', '2024-02-09 13:06:07', '2024-02-09 13:06:07', NULL),
(197, 'Brachoua', '2024-02-09 13:06:11', '2024-02-09 13:06:11', NULL),
(198, 'Bradia', '2024-02-09 13:06:16', '2024-02-09 13:06:16', NULL),
(199, 'Bsara', '2024-02-09 13:06:20', '2024-02-09 13:06:20', NULL),
(200, 'Cabo Negro', '2024-02-09 13:06:25', '2024-02-09 13:06:25', NULL),
(201, 'Cap de l\'eau', '2024-02-09 13:06:30', '2024-02-09 13:06:30', NULL),
(202, 'Chaibate', '2024-02-09 13:06:36', '2024-02-09 13:06:36', NULL),
(203, 'Chakrane', '2024-02-09 13:06:40', '2024-02-09 13:06:40', NULL),
(204, 'Chefchaouen', '2024-02-09 13:06:45', '2024-02-09 13:06:45', NULL),
(205, 'Chellalate', '2024-02-09 13:06:50', '2024-02-09 13:06:50', NULL),
(206, 'Cherrat', '2024-02-09 13:06:55', '2024-02-09 13:06:55', NULL),
(207, 'Chichaoua', '2024-02-09 13:06:59', '2024-02-09 13:06:59', NULL),
(208, 'Chouihia', '2024-02-09 13:07:04', '2024-02-09 13:07:04', NULL),
(209, 'Chtouka', '2024-02-09 13:07:09', '2024-02-09 13:07:09', NULL),
(210, 'Daoura', '2024-02-09 13:07:13', '2024-02-09 13:07:13', NULL),
(211, 'Dar Bel Amri', '2024-02-09 13:07:17', '2024-02-09 13:07:17', NULL),
(212, 'Dar Bni Karrich', '2024-02-09 13:07:21', '2024-02-09 13:07:21', NULL),
(213, 'Dar Bouazza', '2024-02-09 13:07:25', '2024-02-09 13:07:25', NULL),
(214, 'Dar Chaffai', '2024-02-09 13:07:30', '2024-02-09 13:07:30', NULL),
(215, 'Dar El Kebdani', '2024-02-09 13:07:34', '2024-02-09 13:07:34', NULL),
(216, 'Dar Gueddari', '2024-02-09 13:07:39', '2024-02-09 13:07:39', NULL),
(217, 'Dar Jamaa', '2024-02-09 13:07:44', '2024-02-09 13:07:44', NULL),
(218, 'Dar Ould Zidouh', '2024-02-09 13:07:48', '2024-02-09 13:07:48', NULL),
(219, 'Dcheira', '2024-02-09 13:07:53', '2024-02-09 13:07:53', NULL),
(220, 'Dcheïra El Jihadia', '2024-02-09 13:07:59', '2024-02-09 13:07:59', NULL),
(221, 'Debdou', '2024-02-09 13:08:04', '2024-02-09 13:08:04', NULL),
(222, 'Demnate', '2024-02-09 13:08:09', '2024-02-09 13:08:09', NULL),
(223, 'Deroua', '2024-02-09 13:08:14', '2024-02-09 13:08:14', NULL),
(224, 'Dir El Ksiba', '2024-02-09 13:08:18', '2024-02-09 13:08:18', NULL),
(225, 'Drargua', '2024-02-09 13:08:23', '2024-02-09 13:08:23', NULL),
(226, 'Driouch', '2024-02-09 13:08:29', '2024-02-09 13:08:29', NULL),
(227, 'Dzouz', '2024-02-09 13:08:43', '2024-02-09 13:08:43', NULL),
(228, 'Echemmaia', '2024-02-09 13:08:48', '2024-02-09 13:08:48', NULL),
(229, 'El Beddouza', '2024-02-09 13:08:52', '2024-02-09 13:08:52', NULL),
(230, 'El Borouj', '2024-02-09 13:08:57', '2024-02-09 13:08:57', NULL),
(231, 'El Foqra', '2024-02-09 13:09:03', '2024-02-09 13:09:03', NULL),
(232, 'El Gara', '2024-02-09 13:16:50', '2024-02-09 13:16:50', NULL),
(233, 'El Guerdane', '2024-02-09 13:16:54', '2024-02-09 13:16:54', NULL),
(234, 'El Hajeb', '2024-02-09 13:17:00', '2024-02-09 13:17:00', NULL),
(235, 'El Hanchane', '2024-02-09 13:17:04', '2024-02-09 13:17:04', NULL),
(236, 'El Jebha', '2024-02-09 13:17:08', '2024-02-09 13:17:08', NULL),
(237, 'El Kelâa des Sraghna', '2024-02-09 13:17:13', '2024-02-09 13:17:13', NULL),
(238, 'El Ksiba', '2024-02-09 13:17:18', '2024-02-09 13:17:18', NULL),
(239, 'El Maader El Kabir', '2024-02-09 13:17:23', '2024-02-09 13:17:23', NULL),
(240, 'El Majjatia Ouled Taleb', '2024-02-09 13:17:27', '2024-02-09 13:17:27', NULL),
(241, 'El Mansouria', '2024-02-09 13:17:32', '2024-02-09 13:17:32', NULL),
(242, 'El Marsa', '2024-02-09 13:17:37', '2024-02-09 13:17:37', NULL),
(243, 'El Menzeh', '2024-02-09 13:17:41', '2024-02-09 13:17:41', NULL),
(244, 'El Menzel', '2024-02-09 13:17:48', '2024-02-09 13:17:48', NULL),
(245, 'El Outia', '2024-02-09 13:17:53', '2024-02-09 13:17:53', NULL),
(246, 'Errachidia', '2024-02-09 13:17:57', '2024-02-09 13:17:57', NULL),
(247, 'Errahma', '2024-02-09 13:18:03', '2024-02-09 13:18:03', NULL),
(248, 'Er-Rich', '2024-02-09 13:18:10', '2024-02-09 13:18:10', NULL),
(249, 'Er-Rissani', '2024-02-09 13:18:14', '2024-02-09 13:18:14', NULL),
(250, 'Es-Semara', '2024-02-09 13:18:19', '2024-02-09 13:18:31', NULL),
(251, 'Ezzhiliga', '2024-02-09 13:18:36', '2024-02-09 13:18:36', NULL),
(252, 'Farkhana', '2024-02-09 13:18:43', '2024-02-09 13:18:43', NULL),
(253, 'Fask', '2024-02-09 13:18:48', '2024-02-09 13:18:48', NULL),
(254, 'Fdalate', '2024-02-09 13:18:53', '2024-02-09 13:18:53', NULL),
(255, 'Fezna', '2024-02-09 13:18:58', '2024-02-09 13:18:58', NULL),
(256, 'Fezouane', '2024-02-09 13:19:04', '2024-02-09 13:19:04', NULL),
(257, 'Fezouata', '2024-02-09 13:19:09', '2024-02-09 13:19:09', NULL),
(258, 'Figuig', '2024-02-09 13:19:14', '2024-02-09 13:19:14', NULL),
(259, 'Fnideq', '2024-02-09 13:19:19', '2024-02-09 13:19:19', NULL),
(260, 'Foum El Oued', '2024-02-09 13:19:24', '2024-02-09 13:19:24', NULL),
(261, 'Foum Jemaa', '2024-02-09 13:19:31', '2024-02-09 13:19:31', NULL),
(262, 'Foum Oudi', '2024-02-09 13:19:36', '2024-02-09 13:19:36', NULL),
(263, 'Foum zguid', '2024-02-09 13:19:41', '2024-02-09 13:19:41', NULL),
(264, 'Fquih Ben Saleh', '2024-02-09 13:19:45', '2024-02-09 13:19:45', NULL),
(265, 'Freija', '2024-02-09 13:19:50', '2024-02-09 13:19:50', NULL),
(266, 'Galaz', '2024-02-09 13:19:55', '2024-02-09 13:19:55', NULL),
(267, 'Ghafsai', '2024-02-09 13:20:00', '2024-02-09 13:20:00', NULL),
(268, 'Ghiata Al Gharbia', '2024-02-09 13:20:06', '2024-02-09 13:20:06', NULL),
(269, 'Ghmate', '2024-02-09 13:20:10', '2024-02-09 13:20:10', NULL),
(270, 'Goulmima', '2024-02-09 13:20:14', '2024-02-09 13:20:14', NULL),
(271, 'Guelmim', '2024-02-09 13:20:20', '2024-02-09 13:20:20', NULL),
(272, 'Guenfouda', '2024-02-09 13:20:25', '2024-02-09 13:20:25', NULL),
(273, 'Guercif', '2024-02-09 13:20:29', '2024-02-09 13:20:29', NULL),
(274, 'Gueznaia', '2024-02-09 13:20:33', '2024-02-09 13:20:33', NULL),
(275, 'Guigou', '2024-02-09 13:20:37', '2024-02-09 13:20:37', NULL),
(276, 'Guisser', '2024-02-09 13:20:42', '2024-02-09 13:20:42', NULL),
(277, 'Gzenaya Al Janoubia', '2024-02-09 13:20:50', '2024-02-09 13:20:50', NULL),
(278, 'Had Bouhssoussen', '2024-02-09 13:20:54', '2024-02-09 13:20:54', NULL),
(279, 'Had Boumoussa', '2024-02-09 13:20:59', '2024-02-09 13:20:59', NULL),
(280, 'Had Dra', '2024-02-09 13:21:08', '2024-02-09 13:21:08', NULL),
(281, 'Had Kourt', '2024-02-09 13:21:15', '2024-02-09 13:21:15', NULL),
(282, 'Had Soualem', '2024-02-09 13:21:20', '2024-02-09 13:21:20', NULL),
(283, 'Haouzia', '2024-02-09 13:21:24', '2024-02-09 13:21:24', NULL),
(284, 'Hassi Berkane', '2024-02-09 13:21:29', '2024-02-09 13:21:29', NULL),
(285, 'Hattane', '2024-02-09 13:21:34', '2024-02-09 13:21:34', NULL),
(286, 'Houara Oulad Raho', '2024-02-09 13:21:38', '2024-02-09 13:21:38', NULL),
(287, 'Houderrane', '2024-02-09 13:21:42', '2024-02-09 13:21:42', NULL),
(288, 'Hrara', '2024-02-09 13:21:47', '2024-02-09 13:21:47', NULL),
(289, 'Iferni', '2024-02-09 13:21:51', '2024-02-09 13:21:51', NULL),
(290, 'Ifrane Atlas Saghir', '2024-02-09 13:21:56', '2024-02-09 13:21:56', NULL),
(291, 'Ighrem N\'ougdal', '2024-02-09 13:22:02', '2024-02-09 13:22:02', NULL),
(292, 'Ijoukak', '2024-02-09 13:22:06', '2024-02-09 13:22:06', NULL),
(293, 'Imider', '2024-02-09 13:22:13', '2024-02-09 13:22:13', NULL),
(294, 'Imindounit', '2024-02-09 13:22:17', '2024-02-09 13:22:17', NULL),
(295, 'Imintanoute', '2024-02-09 13:22:21', '2024-02-09 13:22:21', NULL),
(296, 'Imlil', '2024-02-09 13:22:26', '2024-02-09 13:22:26', NULL),
(297, 'Imoulass', '2024-02-09 13:22:43', '2024-02-09 13:22:43', NULL),
(298, 'Imouzzer', '2024-02-09 13:22:48', '2024-02-09 13:22:48', NULL),
(299, 'Imouzzer-Kendar', '2024-02-09 13:22:52', '2024-02-09 13:22:52', NULL),
(300, 'Imouzzer Marmoucha', '2024-02-09 13:22:56', '2024-02-09 13:22:56', NULL),
(301, 'Imrabten', '2024-02-09 13:23:00', '2024-02-09 13:23:00', NULL),
(302, 'Imsouane', '2024-02-09 13:23:06', '2024-02-09 13:23:06', NULL),
(303, 'Imzouren', '2024-02-09 13:23:10', '2024-02-09 13:23:10', NULL),
(304, 'Inchaden', '2024-02-09 13:23:15', '2024-02-09 13:23:15', NULL),
(305, 'Inzegan', '2024-02-09 13:23:20', '2024-02-09 13:23:20', NULL),
(306, 'Iqaddar', '2024-02-09 13:23:24', '2024-02-09 13:23:24', NULL),
(307, 'Irohalen', '2024-02-09 13:23:28', '2024-02-09 13:23:28', NULL),
(308, 'Issafen', '2024-02-09 13:23:32', '2024-02-09 13:23:32', NULL),
(309, 'Issaguen', '2024-02-09 13:23:36', '2024-02-09 13:23:36', NULL),
(310, 'Issen', '2024-02-09 13:23:41', '2024-02-09 13:23:41', NULL),
(311, 'Itzer', '2024-02-09 13:23:45', '2024-02-09 13:23:45', NULL),
(312, 'Izemmouren', '2024-02-09 13:23:50', '2024-02-09 13:23:50', NULL),
(313, 'Jaadar', '2024-02-09 13:23:54', '2024-02-09 13:23:54', NULL),
(314, 'Jaidate', '2024-02-09 13:23:58', '2024-02-09 13:23:58', NULL),
(315, 'Jamaat Shaim', '2024-02-09 13:24:05', '2024-02-09 13:24:05', NULL),
(316, 'Jbel Lahbib', '2024-02-09 13:24:12', '2024-02-09 13:24:12', NULL),
(317, 'Jemaa Shaim', '2024-02-09 13:24:17', '2024-02-09 13:24:17', NULL),
(318, 'Jorf', '2024-02-09 13:24:25', '2024-02-09 13:24:25', NULL),
(319, 'Jorf El Melha', '2024-02-09 13:24:29', '2024-02-09 13:24:29', NULL),
(320, 'Jrada', '2024-02-09 13:24:36', '2024-02-09 13:24:36', NULL),
(321, 'Kalaat M\'gouna', '2024-02-09 13:24:40', '2024-02-09 13:24:40', NULL),
(322, 'Kandar Sidi Khiar', '2024-02-09 13:24:44', '2024-02-09 13:24:44', NULL),
(323, 'Karia Ba Mohamed', '2024-02-09 13:24:49', '2024-02-09 13:24:49', NULL),
(324, 'Kasba Tadla', '2024-02-09 13:24:54', '2024-02-09 13:24:54', NULL),
(325, 'Kattara', '2024-02-09 13:24:59', '2024-02-09 13:24:59', NULL),
(326, 'Kechoula', '2024-02-09 13:25:03', '2024-02-09 13:25:03', NULL),
(327, 'Ketama', '2024-02-09 13:25:08', '2024-02-09 13:25:08', NULL),
(328, 'Khemisset', '2024-02-09 13:25:13', '2024-02-09 13:25:13', NULL),
(329, 'Khemisset Chaouia', '2024-02-09 13:25:18', '2024-02-09 13:25:18', NULL),
(330, 'Khemis Sidi Yahya', '2024-02-09 13:25:23', '2024-02-09 13:25:23', NULL),
(331, 'Khénifra', '2024-02-09 13:25:27', '2024-02-09 13:25:27', NULL),
(332, 'Khmis Ksiba', '2024-02-09 13:25:31', '2024-02-09 13:25:31', NULL),
(333, 'Khouribga', '2024-02-09 13:25:37', '2024-02-09 13:25:37', NULL),
(334, 'Korimate', '2024-02-09 13:25:41', '2024-02-09 13:25:41', NULL),
(335, 'Kridid', '2024-02-09 13:25:46', '2024-02-09 13:25:46', NULL),
(336, 'Ksabi Moulouya', '2024-02-09 13:25:51', '2024-02-09 13:25:51', NULL),
(337, 'Ksar el-Kebir', '2024-02-09 13:26:17', '2024-02-09 13:26:17', NULL),
(338, 'Ksar es-Seghir', '2024-02-09 13:26:22', '2024-02-09 13:26:22', NULL),
(339, 'Laaouama', '2024-02-09 13:26:27', '2024-02-09 13:26:27', NULL),
(340, 'Laaounate', '2024-02-09 13:26:33', '2024-02-09 13:26:33', NULL),
(341, 'Laatamna', '2024-02-09 13:26:37', '2024-02-09 13:26:37', NULL),
(342, 'Laattaouia', '2024-02-09 13:26:42', '2024-02-09 13:26:42', NULL),
(343, 'Laattaouia Ech-Chaybia', '2024-02-09 13:26:46', '2024-02-09 13:26:46', NULL),
(344, 'Laâyoune', '2024-02-09 13:26:50', '2024-02-09 13:26:50', NULL),
(345, 'Laäyoune Ain Tizgha', '2024-02-09 13:26:55', '2024-02-09 13:26:55', NULL),
(346, 'Lagfifat', '2024-02-09 13:27:00', '2024-02-09 13:27:00', NULL),
(347, 'Laghnimyine', '2024-02-09 13:27:06', '2024-02-09 13:27:06', NULL),
(348, 'Laghoualem', '2024-02-09 13:27:11', '2024-02-09 13:27:11', NULL),
(349, 'Lagouira', '2024-02-09 13:27:16', '2024-02-09 13:27:16', NULL),
(350, 'Lahraouyine', '2024-02-09 13:27:22', '2024-02-09 13:27:22', NULL),
(351, 'Lakhiaita', '2024-02-09 13:27:28', '2024-02-09 13:27:28', NULL),
(352, 'Lakhnafif', '2024-02-09 13:27:33', '2024-02-09 13:27:33', NULL),
(353, 'Lakhoualqa', '2024-02-09 13:27:37', '2024-02-09 13:27:37', NULL),
(354, 'Lakhssas', '2024-02-09 13:27:41', '2024-02-09 13:27:41', NULL),
(355, 'Lamaachate', '2024-02-09 13:27:45', '2024-02-09 13:27:45', NULL),
(356, 'Lamhadi', '2024-02-09 13:27:49', '2024-02-09 13:27:49', NULL),
(357, 'Lamharza Essahel', '2024-02-09 13:27:53', '2024-02-09 13:27:53', NULL),
(358, 'Lamkansa', '2024-02-09 13:27:57', '2024-02-09 13:27:57', NULL),
(359, 'Laouamra', '2024-02-09 13:28:01', '2024-02-09 13:28:01', NULL),
(360, 'Larache', '2024-02-09 13:28:05', '2024-02-09 13:28:05', NULL),
(361, 'Lkhaloua', '2024-02-09 13:28:10', '2024-02-09 13:28:10', NULL),
(362, 'Lkheng', '2024-02-09 13:28:14', '2024-02-09 13:28:14', NULL),
(363, 'Loudaya', '2024-02-09 13:28:20', '2024-02-09 13:28:20', NULL),
(364, 'Loulad', '2024-02-09 13:28:24', '2024-02-09 13:28:24', NULL),
(365, 'Louta', '2024-02-09 13:28:28', '2024-02-09 13:28:28', NULL),
(366, 'Lqliaa', '2024-02-09 13:28:32', '2024-02-09 13:28:32', NULL),
(367, 'Maaziz', '2024-02-09 13:28:36', '2024-02-09 13:28:36', NULL),
(368, 'Machraa El Ain', '2024-02-09 13:28:44', '2024-02-09 13:28:44', NULL),
(369, 'Madagh', '2024-02-09 13:28:49', '2024-02-09 13:28:49', NULL),
(370, 'Majjat', '2024-02-09 13:28:54', '2024-02-09 13:28:54', NULL),
(371, 'Mallalienne', '2024-02-09 13:28:58', '2024-02-09 13:28:58', NULL),
(372, 'Mansoura', '2024-02-09 13:29:03', '2024-02-09 13:29:03', NULL),
(373, 'Marchouch', '2024-02-09 13:29:07', '2024-02-09 13:29:07', NULL),
(374, 'Martil', '2024-02-09 13:29:11', '2024-02-09 13:29:11', NULL),
(375, 'Massa', '2024-02-09 13:29:15', '2024-02-09 13:29:15', NULL),
(376, 'Mdiq', '2024-02-09 13:29:21', '2024-02-09 13:29:21', NULL),
(377, 'Méchouar Fès Jdid', '2024-02-09 13:29:25', '2024-02-09 13:29:25', NULL),
(378, 'Méchouar Kasba', '2024-02-09 13:29:31', '2024-02-09 13:29:31', NULL),
(379, 'Mechra Bel Ksiri', '2024-02-09 13:29:35', '2024-02-09 13:29:35', NULL),
(380, 'Mediouna', '2024-02-09 13:29:39', '2024-02-09 13:29:39', NULL),
(381, 'Mehdia', '2024-02-09 13:29:43', '2024-02-09 13:29:43', NULL),
(382, 'Meknassa Acharqia', '2024-02-09 13:29:47', '2024-02-09 13:29:47', NULL),
(383, 'Meknassa Al Gharbia', '2024-02-09 13:29:52', '2024-02-09 13:29:52', NULL),
(384, 'Mellila', '2024-02-09 13:29:57', '2024-02-09 13:29:57', NULL),
(385, 'Mers El Kheir', '2024-02-09 13:30:02', '2024-02-09 13:30:02', NULL),
(386, 'Merzouga', '2024-02-09 13:30:06', '2024-02-09 13:30:06', NULL),
(387, 'Messassa', '2024-02-09 13:30:10', '2024-02-09 13:30:10', NULL),
(388, 'Mestegmer', '2024-02-09 13:30:16', '2024-02-09 13:30:16', NULL),
(389, 'Mestferki', '2024-02-09 13:30:23', '2024-02-09 13:30:23', NULL),
(390, 'M\'hamid El Ghizlane', '2024-02-09 13:30:27', '2024-02-09 13:30:27', NULL),
(391, 'M\'haya', '2024-02-09 13:30:31', '2024-02-09 13:30:31', NULL),
(392, 'Midar', '2024-02-09 13:30:35', '2024-02-09 13:30:35', NULL),
(393, 'Midelt', '2024-02-09 13:30:40', '2024-02-09 13:30:40', NULL),
(394, 'Mirleft', '2024-02-09 13:30:44', '2024-02-09 13:30:44', NULL),
(395, 'Missour', '2024-02-09 13:30:54', '2024-02-09 13:30:54', NULL),
(396, 'Mkansa', '2024-02-09 13:30:59', '2024-02-09 13:30:59', NULL),
(397, 'Mograne', '2024-02-09 13:31:06', '2024-02-09 13:31:06', NULL),
(398, 'Moualine El Oued', '2024-02-09 13:31:12', '2024-02-09 13:31:12', NULL),
(399, 'Moulay Abdallah', '2024-02-09 13:31:17', '2024-02-09 13:31:17', NULL),
(400, 'Moulay Bouazza', '2024-02-09 13:31:22', '2024-02-09 13:31:22', NULL),
(401, 'Moulay Bousselham', '2024-02-09 13:31:26', '2024-02-09 13:31:26', NULL),
(402, 'Moulay Bouzarqtoune', '2024-02-09 13:31:30', '2024-02-09 13:31:30', NULL),
(403, 'Moulay Driss Aghbal', '2024-02-09 13:31:35', '2024-02-09 13:31:35', NULL),
(404, 'Moulay Driss Zerhoun', '2024-02-09 13:31:39', '2024-02-09 13:31:39', NULL),
(405, 'Moulay Yaâcoub', '2024-02-09 13:31:58', '2024-02-09 13:31:58', NULL),
(406, 'Moulay Yaccoub', '2024-02-09 13:32:03', '2024-02-09 13:32:03', NULL),
(407, 'M\'qam Tobla', '2024-02-09 13:32:08', '2024-02-09 13:32:08', NULL),
(408, 'Mrir\'t', '2024-02-09 13:32:13', '2024-02-09 13:32:13', NULL),
(409, 'M\'sick', '2024-02-09 13:32:18', '2024-02-09 13:32:18', NULL),
(410, 'Naima', '2024-02-09 13:32:21', '2024-02-09 13:32:21', NULL),
(411, 'Naour', '2024-02-09 13:32:25', '2024-02-09 13:32:25', NULL),
(412, 'N\'khila', '2024-02-09 13:32:30', '2024-02-09 13:32:30', NULL),
(413, 'Nouaceur', '2024-02-09 13:32:34', '2024-02-09 13:32:34', NULL),
(414, 'Ouad Eddahab', '2024-02-09 13:32:47', '2024-02-09 13:32:47', NULL),
(415, 'Ouahat Sidi Brahim', '2024-02-09 13:32:56', '2024-02-09 13:32:56', NULL),
(416, 'Ouaklim', '2024-02-09 13:33:00', '2024-02-09 13:33:00', NULL),
(417, 'Oualidia', '2024-02-09 13:33:07', '2024-02-09 13:33:07', NULL),
(418, 'Oualili', '2024-02-09 13:33:11', '2024-02-09 13:33:20', NULL),
(419, 'Ouaouizeght', '2024-02-09 13:33:26', '2024-02-09 13:33:26', NULL),
(420, 'Ouaoumana', '2024-02-09 13:33:30', '2024-02-09 13:33:30', NULL),
(421, 'Ouaouzgane', '2024-02-09 13:33:34', '2024-02-09 13:33:34', NULL),
(422, 'Ouarzazate', '2024-02-09 13:33:39', '2024-02-09 13:33:39', NULL),
(423, 'Ouazzane', '2024-02-09 13:33:43', '2024-02-09 13:33:43', NULL),
(424, 'Oued Amlil', '2024-02-09 13:33:48', '2024-02-09 13:33:48', NULL),
(425, 'Oued Ifrane', '2024-02-09 13:33:53', '2024-02-09 13:33:53', NULL),
(426, 'Oued Jdida', '2024-02-09 13:33:57', '2024-02-09 13:33:57', NULL),
(427, 'Oued Laou', '2024-02-09 13:34:02', '2024-02-09 13:34:02', NULL),
(428, 'Oued Malha', '2024-02-09 13:34:06', '2024-02-09 13:34:06', NULL),
(429, 'Oued Jdida', '2024-02-09 13:34:11', '2024-02-09 13:34:11', NULL),
(430, 'Oued Laou', '2024-02-09 13:34:16', '2024-02-09 13:34:16', NULL),
(431, 'Oued Malha', '2024-02-09 13:34:21', '2024-02-09 13:34:21', NULL),
(432, 'Oued Zem', '2024-02-09 13:34:25', '2024-02-09 13:34:25', NULL),
(433, 'Ouirgane', '2024-02-09 13:34:29', '2024-02-09 13:34:29', NULL),
(434, 'Ouislane', '2024-02-09 13:34:33', '2024-02-09 13:34:33', NULL),
(435, 'Oukaimden', '2024-02-09 13:34:37', '2024-02-09 13:34:37', NULL),
(436, 'Oulad Abbou', '2024-02-09 13:34:41', '2024-02-09 13:34:41', NULL),
(437, 'Oulad Aissa', '2024-02-09 13:34:46', '2024-02-09 13:34:46', NULL),
(438, 'Oulad Al Toualaa', '2024-02-09 13:34:50', '2024-02-09 13:34:50', NULL),
(439, 'Oulad Dahou', '2024-02-09 13:34:55', '2024-02-09 13:34:55', NULL),
(440, 'Oulad Fares', '2024-02-09 13:34:59', '2024-02-09 13:34:59', NULL),
(441, 'Oulad Frej', '2024-02-09 13:35:03', '2024-02-09 13:35:03', NULL),
(442, 'Oulad Ftata', '2024-02-09 13:35:08', '2024-02-09 13:35:08', NULL),
(443, 'Oulad Ghanem', '2024-02-09 13:35:12', '2024-02-09 13:35:12', NULL),
(444, 'Oulad Hamdane', '2024-02-09 13:35:16', '2024-02-09 13:35:16', NULL),
(445, 'Oulad Hcine', '2024-02-09 13:35:22', '2024-02-09 13:35:22', NULL),
(446, 'Oulad M\'barek', '2024-02-09 13:35:27', '2024-02-09 13:35:27', NULL),
(447, 'Oulad M\'rah', '2024-02-09 13:35:32', '2024-02-09 13:35:32', NULL),
(448, 'Oulad Mtaa', '2024-02-09 13:35:43', '2024-02-09 13:35:43', NULL),
(449, 'Oulad Said', '2024-02-09 13:35:52', '2024-02-09 13:36:19', NULL),
(450, 'Oulad Said L\'oued', '2024-02-09 13:35:58', '2024-02-09 13:36:27', NULL),
(451, 'Oulad Salah', '2024-02-09 13:36:37', '2024-02-09 13:36:37', NULL),
(452, 'Oulad Yahya Louta', '2024-02-09 13:36:45', '2024-02-09 13:36:45', NULL),
(453, 'Oulad Yaich', '2024-02-09 13:36:51', '2024-02-09 13:36:51', NULL),
(454, 'Oulad Youssef', '2024-02-09 13:36:56', '2024-02-09 13:36:56', NULL),
(455, 'Oulad Zidane', '2024-02-09 13:37:02', '2024-02-09 13:37:02', NULL),
(456, 'Ouled Ayad', '2024-02-09 13:37:10', '2024-02-09 13:37:10', NULL),
(457, 'Ouled Berhil', '2024-02-09 13:37:16', '2024-02-09 13:37:16', NULL),
(458, 'Ouled Dlim', '2024-02-09 13:37:20', '2024-02-09 13:37:20', NULL),
(459, 'Ouled Frej', '2024-02-09 13:37:25', '2024-02-09 13:37:25', NULL),
(460, 'Ouled Teïma', '2024-02-09 13:37:30', '2024-02-09 13:37:30', NULL),
(461, 'Oulmes', '2024-02-09 13:37:35', '2024-02-09 13:37:35', NULL),
(462, 'Ounagha', '2024-02-09 13:37:40', '2024-02-09 13:37:40', NULL),
(463, 'Ourika', '2024-02-09 13:37:45', '2024-02-09 13:37:45', NULL),
(464, 'Outat El Haj', '2024-02-09 13:37:49', '2024-02-09 13:37:49', NULL),
(465, 'Ras Ain Rhamna', '2024-02-09 13:37:53', '2024-02-09 13:37:53', NULL),
(466, 'Ras El Ain', '2024-02-09 13:37:58', '2024-02-09 13:37:58', NULL),
(467, 'Ras Ijerri', '2024-02-09 13:38:11', '2024-02-09 13:38:11', NULL),
(468, 'Ratba', '2024-02-09 13:38:29', '2024-02-09 13:38:29', NULL),
(469, 'Rfala', '2024-02-09 13:38:36', '2024-02-09 13:38:36', NULL),
(470, 'Ras Ijerri', '2024-02-09 13:38:41', '2024-02-09 13:38:41', NULL),
(471, 'Ratba', '2024-02-09 13:38:46', '2024-02-09 13:38:46', NULL),
(472, 'Rfala', '2024-02-09 13:38:52', '2024-02-09 13:38:52', NULL),
(473, 'Ribat el Kheir', '2024-02-09 13:39:04', '2024-02-09 13:39:04', NULL),
(474, 'Rima', '2024-02-09 13:39:08', '2024-02-09 13:39:08', NULL),
(475, 'Rissana Janoubia', '2024-02-09 13:39:13', '2024-02-09 13:39:13', NULL),
(476, 'Rissani', '2024-02-09 13:39:17', '2024-02-09 13:39:17', NULL),
(477, 'Rommani', '2024-02-09 13:39:22', '2024-02-09 13:39:22', NULL),
(478, 'Saada', '2024-02-09 13:39:26', '2024-02-09 13:39:26', NULL),
(479, 'Saadla', '2024-02-09 13:39:30', '2024-02-09 13:39:30', NULL),
(480, 'Sabaa Aiyoun', '2024-02-09 13:39:35', '2024-02-09 13:39:35', NULL),
(481, 'Sabbah', '2024-02-09 13:39:39', '2024-02-09 13:39:39', NULL),
(482, 'Sahel Chamali', '2024-02-09 13:39:47', '2024-02-09 13:39:47', NULL),
(483, 'Sahel Oulad H\'riz', '2024-02-09 13:40:04', '2024-02-09 13:40:04', NULL),
(484, 'Saidia', '2024-02-09 13:40:09', '2024-02-09 13:40:16', NULL),
(485, 'Saka', '2024-02-09 13:40:20', '2024-02-09 13:40:20', NULL),
(486, 'Sbouya', '2024-02-09 13:40:26', '2024-02-09 13:40:26', NULL),
(487, 'Sebt Ennabour', '2024-02-09 13:40:30', '2024-02-09 13:40:30', NULL),
(488, 'Sebt Gzoula', '2024-02-09 13:40:37', '2024-02-09 13:40:37', NULL),
(489, 'Sefrou', '2024-02-09 13:40:43', '2024-02-09 13:40:43', NULL),
(490, 'Selouane', '2024-02-09 13:40:47', '2024-02-09 13:40:47', NULL),
(491, 'Sfassif', '2024-02-09 13:40:55', '2024-02-09 13:40:55', NULL),
(492, 'Sidi Abdallah El Bouchouari', '2024-02-09 13:40:59', '2024-02-09 13:40:59', NULL),
(493, 'Sidi Abdallah Ghiat', '2024-02-09 13:41:04', '2024-02-09 13:41:04', NULL),
(494, 'Sidi Abderrazak', '2024-02-09 13:41:09', '2024-02-09 13:41:09', NULL),
(495, 'Sidi Abed', '2024-02-09 13:41:14', '2024-02-09 13:41:14', NULL),
(496, 'Sidi Ahmed Ou Amar', '2024-02-09 13:41:20', '2024-02-09 13:41:20', NULL),
(497, 'Sidi Aissa Ben Ali', '2024-02-09 13:41:24', '2024-02-09 13:41:24', NULL),
(498, 'Sidi Aissa Ben Slimane', '2024-02-09 13:41:29', '2024-02-09 13:41:29', NULL),
(499, 'Sidi Ali', '2024-02-09 13:41:33', '2024-02-09 13:41:33', NULL),
(500, 'Sidi Ali Ben Hamdouche', '2024-02-09 13:41:37', '2024-02-09 13:41:37', NULL),
(501, 'Sidi Allal El Bahraoui', '2024-02-09 13:41:41', '2024-02-09 13:41:41', NULL),
(502, 'Sidi Allal Tazi', '2024-02-09 13:41:46', '2024-02-09 13:41:46', NULL),
(503, 'Sidi Bennour', '2024-02-09 13:41:50', '2024-02-09 13:41:50', NULL),
(504, 'Sidi Bettache', '2024-02-09 13:41:55', '2024-02-09 13:41:55', NULL),
(505, 'Sidi Bibi', '2024-02-09 13:42:01', '2024-02-09 13:42:01', NULL),
(506, 'Sidi Boaal', '2024-02-09 13:42:05', '2024-02-09 13:42:05', NULL),
(507, 'Sidi Boubker', '2024-02-09 13:42:10', '2024-02-09 13:42:10', NULL),
(508, 'Sidi Boukhalkhal', '2024-02-09 13:42:18', '2024-02-09 13:42:18', NULL),
(509, 'Sidi Bouknadel', '2024-02-09 13:42:23', '2024-02-09 13:42:23', NULL),
(510, 'Sidi Boulenouar', '2024-02-09 13:42:29', '2024-02-09 13:42:29', NULL),
(511, 'Sidi Boumehdi', '2024-02-09 13:42:33', '2024-02-09 13:42:33', NULL),
(512, 'Sidi Bou Othmane', '2024-02-09 13:42:38', '2024-02-09 13:42:38', NULL),
(513, 'Sidi Bouzid', '2024-02-09 13:42:43', '2024-02-09 13:42:43', NULL),
(514, 'Sidi Chiker', '2024-02-09 13:42:47', '2024-02-09 13:42:47', NULL),
(515, 'Sidi Dahbi', '2024-02-09 13:42:53', '2024-02-09 13:42:53', NULL),
(516, 'Sidi El Abed', '2024-02-09 13:42:58', '2024-02-09 13:42:58', NULL),
(517, 'Sidi el Aîdi', '2024-02-09 13:43:02', '2024-02-09 13:43:02', NULL),
(518, 'Sidi El Makhfi', '2024-02-09 13:43:06', '2024-02-09 13:43:06', NULL),
(519, 'Sidi El Mekki', '2024-02-09 13:43:10', '2024-02-09 13:43:10', NULL),
(520, 'Sidi Hajjaj', '2024-02-09 13:43:15', '2024-02-09 13:43:15', NULL),
(521, 'Sidi Hajjaj Oued Hassar', '2024-02-09 13:43:19', '2024-02-09 13:43:19', NULL),
(522, 'Sidi Ifni', '2024-02-09 13:43:23', '2024-02-09 13:43:23', NULL),
(523, 'Sidi Jaber', '2024-02-09 13:43:29', '2024-02-09 13:43:29', NULL),
(524, 'Sidi Kacem', '2024-02-09 13:43:34', '2024-02-09 13:43:34', NULL),
(525, 'Sidi Lyamani', '2024-02-09 13:43:48', '2024-02-09 13:43:48', NULL),
(526, 'Sidi Moussa Ben Ali', '2024-02-09 13:43:52', '2024-02-09 13:43:52', NULL),
(527, 'Sidi Moussa El Majdoub', '2024-02-09 13:43:58', '2024-02-09 13:43:58', NULL),
(528, 'Sidi Ouassay', '2024-02-09 13:44:03', '2024-02-09 13:44:03', NULL),
(529, 'Sidi Rahal', '2024-02-09 13:44:09', '2024-02-09 13:44:09', NULL),
(530, 'Sidi Slimane', '2024-02-09 13:44:13', '2024-02-09 13:44:13', NULL),
(531, 'Sidi Slimane Echcharraa', '2024-02-09 13:44:18', '2024-02-09 13:44:18', NULL),
(532, 'Sidi Smail', '2024-02-09 13:44:23', '2024-02-09 13:44:23', NULL),
(533, 'Sidi Taibi', '2024-02-09 13:44:27', '2024-02-09 13:44:27', NULL),
(534, 'Sidi Yahya', '2024-02-09 13:44:31', '2024-02-09 13:44:31', NULL),
(535, 'Sidi Yahya El Gharb', '2024-02-09 13:44:35', '2024-02-09 13:44:35', NULL),
(536, 'Sidi Yahya Zaer', '2024-02-09 13:44:40', '2024-02-09 13:44:40', NULL),
(537, 'Sid L\'mokhtar', '2024-02-09 13:44:45', '2024-02-09 13:44:45', NULL),
(538, 'Sid Zouine', '2024-02-09 13:44:49', '2024-02-09 13:44:49', NULL),
(539, 'Skhinate', '2024-02-09 13:44:53', '2024-02-09 13:44:53', NULL),
(540, 'Skhour Rhamna', '2024-02-09 13:44:59', '2024-02-09 13:44:59', NULL),
(541, 'Skhour Rhamna', '2024-02-09 13:45:04', '2024-02-09 13:45:04', NULL),
(542, 'Skoura M\'daz', '2024-02-09 13:45:08', '2024-02-09 13:45:08', NULL),
(543, 'Smia', '2024-02-09 13:45:13', '2024-02-09 13:45:13', NULL),
(544, 'Souaken', '2024-02-09 13:45:17', '2024-02-09 13:45:17', NULL),
(545, 'Souihla', '2024-02-09 13:45:22', '2024-02-09 13:45:22', NULL),
(546, 'Souk El Arbaa', '2024-02-09 13:45:26', '2024-02-09 13:45:26', NULL),
(547, 'Souk Sebt Ouled Nemma', '2024-02-09 13:45:31', '2024-02-09 13:45:31', NULL),
(548, 'Souk Sebt Ouled Nemma', '2024-02-09 13:45:36', '2024-02-09 13:45:36', NULL),
(549, 'Steha', '2024-02-09 13:45:41', '2024-02-09 13:45:41', NULL),
(550, 'Tabant', '2024-02-09 13:45:46', '2024-02-09 13:45:46', NULL),
(551, 'Tabouda', '2024-02-09 13:45:52', '2024-02-09 13:45:52', NULL),
(552, 'Tabouda', '2024-02-09 13:45:56', '2024-02-09 13:45:56', NULL),
(553, 'Tadighoust', '2024-02-09 13:46:00', '2024-02-09 13:46:00', NULL),
(554, 'Tafersit', '2024-02-09 13:46:06', '2024-02-09 13:46:06', NULL),
(555, 'Tafoughalt', '2024-02-09 13:46:09', '2024-02-09 13:46:09', NULL),
(556, 'Tafraout', '2024-02-09 13:46:14', '2024-02-09 13:46:14', NULL),
(557, 'Tagante', '2024-02-09 13:46:18', '2024-02-09 13:46:18', NULL),
(558, 'Taghazout', '2024-02-09 13:46:22', '2024-02-09 13:46:22', NULL),
(559, 'Taghzout', '2024-02-09 13:46:28', '2024-02-09 13:46:28', NULL),
(560, 'Taghzoute N\'ait Atta', '2024-02-09 13:46:32', '2024-02-09 13:46:32', NULL),
(561, 'Tahannaout', '2024-02-09 13:46:43', '2024-02-09 13:46:43', NULL),
(562, 'Tahla', '2024-02-09 13:46:48', '2024-02-09 13:46:48', NULL),
(563, 'Takate', '2024-02-09 13:46:53', '2024-02-09 13:46:53', NULL),
(564, 'Talat N\'yaaqoub', '2024-02-09 13:46:58', '2024-02-09 13:46:58', NULL),
(565, 'Taliouine', '2024-02-09 13:47:02', '2024-02-09 13:47:02', NULL),
(566, 'Talmakante', '2024-02-09 13:47:07', '2024-02-09 13:47:07', NULL),
(567, 'Talmest', '2024-02-09 13:47:11', '2024-02-09 13:47:11', NULL),
(568, 'Talsint', '2024-02-09 13:47:16', '2024-02-09 13:47:16', NULL),
(569, 'Tameslohte', '2024-02-09 13:47:21', '2024-02-09 13:54:00', NULL),
(570, 'Tamallalt', '2024-02-09 13:47:26', '2024-02-09 13:54:14', '2024-02-09 15:54:14'),
(571, 'Tamallalt', '2024-02-09 13:47:30', '2024-02-09 13:54:18', '2024-02-09 15:54:18'),
(572, 'Tamedit', '2024-02-09 13:47:35', '2024-02-09 13:47:35', NULL),
(573, 'Tamensourt', '2024-02-09 13:47:41', '2024-02-09 13:47:41', NULL),
(574, 'Tameslohte', '2024-02-09 13:47:48', '2024-02-09 13:47:48', NULL),
(575, 'Tamallalt', '2024-02-09 13:54:37', '2024-02-09 13:54:37', NULL),
(576, 'Tamesna', '2024-02-09 13:54:51', '2024-02-09 13:54:51', NULL),
(577, 'Tamezmoute', '2024-02-09 13:54:58', '2024-02-09 13:54:58', NULL),
(578, 'Tamorot', '2024-02-09 13:55:02', '2024-02-09 13:55:02', NULL),
(579, 'Tamouda Bay', '2024-02-09 13:55:08', '2024-02-09 13:55:08', NULL),
(580, 'Tamri', '2024-02-09 13:55:13', '2024-02-09 13:55:13', NULL),
(581, 'Tamsaout', '2024-02-09 13:55:19', '2024-02-09 13:55:19', NULL),
(582, 'Tanant', '2024-02-09 13:55:56', '2024-02-09 13:55:56', NULL),
(583, 'Tangarfa', '2024-02-09 13:56:01', '2024-02-09 13:56:01', NULL),
(584, 'Taounate', '2024-02-09 13:56:06', '2024-02-09 13:56:06', NULL),
(585, 'Taourirt', '2024-02-09 13:56:11', '2024-02-09 13:56:11', NULL),
(586, 'Tarfaya', '2024-02-09 13:56:16', '2024-02-09 13:56:16', NULL),
(587, 'Targuist', '2024-02-09 13:56:21', '2024-02-09 13:56:21', NULL),
(588, 'Tassoultante', '2024-02-09 13:56:26', '2024-02-09 13:56:26', NULL),
(589, 'Tata', '2024-02-09 13:56:30', '2024-02-09 13:56:30', NULL),
(590, 'Tataoute', '2024-02-09 13:56:34', '2024-02-09 13:56:34', NULL),
(591, 'Tatoft', '2024-02-09 13:56:39', '2024-02-09 13:56:39', NULL),
(592, 'Taza', '2024-02-09 13:56:48', '2024-02-09 13:56:48', NULL),
(593, 'Tazart', '2024-02-09 13:56:52', '2024-02-09 13:56:52', NULL),
(594, 'Tazemmourt', '2024-02-09 13:56:57', '2024-02-09 13:56:57', NULL),
(595, 'Taznakht', '2024-02-09 13:57:01', '2024-02-09 13:57:01', NULL),
(596, 'Temsamane', '2024-02-09 13:57:07', '2024-02-09 13:57:07', NULL),
(597, 'Temsia', '2024-02-09 13:57:11', '2024-02-09 13:57:11', NULL),
(598, 'Tendrara', '2024-02-09 13:57:16', '2024-02-09 13:57:16', NULL),
(599, 'Thar Es-Souk', '2024-02-09 13:57:23', '2024-02-09 13:57:23', NULL),
(600, 'Tichla', '2024-02-09 13:57:28', '2024-02-09 13:57:28', NULL),
(601, 'Tiddas', '2024-02-09 13:57:32', '2024-02-09 13:57:32', NULL),
(602, 'Tifarouine', '2024-02-09 13:57:37', '2024-02-09 13:57:37', NULL),
(603, 'Tifelt', '2024-02-09 13:57:42', '2024-02-09 13:57:42', NULL),
(604, 'Tighirt', '2024-02-09 13:57:47', '2024-02-09 13:57:47', NULL),
(605, 'Tikiouine', '2024-02-09 13:57:52', '2024-02-09 13:57:52', NULL),
(606, 'Timahdite', '2024-02-09 13:57:57', '2024-02-09 13:57:57', NULL),
(607, 'Timoulay', '2024-02-09 13:58:01', '2024-02-09 13:58:01', NULL),
(608, 'Timoulilt', '2024-02-09 13:58:05', '2024-02-09 13:58:05', NULL),
(609, 'Tinejdad', '2024-02-09 13:58:09', '2024-02-09 13:58:09', NULL),
(610, 'Tinghir', '2024-02-09 13:58:13', '2024-02-09 13:58:13', NULL),
(611, 'Tissa', '2024-02-09 13:58:18', '2024-02-09 13:58:18', NULL),
(612, 'Tit Mellil', '2024-02-09 13:58:23', '2024-02-09 13:58:23', NULL),
(613, 'Tizgane', '2024-02-09 13:58:26', '2024-02-09 13:58:26', NULL),
(614, 'Tiznit', '2024-02-09 13:58:32', '2024-02-09 13:58:32', NULL),
(615, 'Tlite', '2024-02-09 13:58:36', '2024-02-09 13:58:36', NULL),
(616, 'Tnine Aglou', '2024-02-09 13:58:42', '2024-02-09 13:58:42', NULL),
(617, 'Touama', '2024-02-09 13:58:47', '2024-02-09 13:58:47', NULL),
(618, 'Touissit', '2024-02-09 13:58:51', '2024-02-09 13:58:51', NULL),
(619, 'Tsaft', '2024-02-09 13:58:56', '2024-02-09 13:58:56', NULL),
(620, 'Youssoufia', '2024-02-09 13:59:01', '2024-02-09 13:59:01', NULL),
(621, 'Zag', '2024-02-09 13:59:05', '2024-02-09 13:59:05', NULL),
(622, 'Zagora', '2024-02-09 13:59:09', '2024-02-09 13:59:09', NULL),
(623, 'Zaida', '2024-02-09 13:59:15', '2024-02-09 13:59:15', NULL),
(624, 'Zaïo', '2024-02-09 13:59:20', '2024-02-09 13:59:20', NULL),
(625, 'Zaouia Sidi Tahar', '2024-02-09 13:59:24', '2024-02-09 13:59:24', NULL),
(626, 'Zaouïat Cheikh', '2024-02-09 13:59:28', '2024-02-09 13:59:28', NULL),
(627, 'Zaouiat Sidi Kacem', '2024-02-09 13:59:34', '2024-02-09 13:59:34', NULL),
(628, 'Zeghanghane', '2024-02-09 13:59:38', '2024-02-09 13:59:38', NULL),
(629, 'Zemamra', '2024-02-09 13:59:42', '2024-02-09 13:59:42', NULL),
(630, 'Zemrane', '2024-02-09 13:59:47', '2024-02-09 13:59:47', NULL),
(631, 'Zenata', '2024-02-09 13:59:52', '2024-02-09 13:59:52', NULL),
(632, 'Mohammedia', '2025-01-20 15:13:57', '2025-01-21 14:24:28', '2025-01-21 16:24:28'),
(633, 'Mohammedia', '2025-01-21 14:15:27', '2025-01-21 14:15:27', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accessoires`
--
ALTER TABLE `accessoires`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `annonces`
--
ALTER TABLE `annonces`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matricule` (`matricule`),
  ADD KEY `annonces_pack_id_foreign` (`pack_id`);

--
-- Indexes for table `autoencheres`
--
ALTER TABLE `autoencheres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `autoencheres_annonce_id_foreign` (`annonce_id`),
  ADD KEY `autoencheres_client_id_foreign` (`client_id`);

--
-- Indexes for table `avistexts`
--
ALTER TABLE `avistexts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `avisvideos`
--
ALTER TABLE `avisvideos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_email_unique` (`email`),
  ADD KEY `clients_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `client_types`
--
ALTER TABLE `client_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_types_name_unique` (`name`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entretiens`
--
ALTER TABLE `entretiens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entretiens_annonce_id_foreign` (`annonce_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `favorites_client_id_annonce_id_unique` (`client_id`,`annonce_id`),
  ADD KEY `favorites_annonce_id_foreign` (`annonce_id`);

--
-- Indexes for table `financements`
--
ALTER TABLE `financements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `financement_settings`
--
ALTER TABLE `financement_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `financement_settings_key_unique` (`key`);

--
-- Indexes for table `imgsliders`
--
ALTER TABLE `imgsliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_media_annonce_unique` (`annonces_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `models_user_id_foreign` (`user_id`),
  ADD KEY `models_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `nado_auto_encheres`
--
ALTER TABLE `nado_auto_encheres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nado_auto_encheres_client_id_foreign` (`client_id`);

--
-- Indexes for table `nado_auto_encheres_bid`
--
ALTER TABLE `nado_auto_encheres_bid`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nado_auto_encheres_bid_enchere_id_foreign` (`enchere_id`),
  ADD KEY `nado_auto_encheres_bid_client_id_foreign` (`client_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `offres`
--
ALTER TABLE `offres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packs`
--
ALTER TABLE `packs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `publications`
--
ALTER TABLE `publications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reprises`
--
ALTER TABLE `reprises`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `ventes`
--
ALTER TABLE `ventes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videosads`
--
ALTER TABLE `videosads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `villes`
--
ALTER TABLE `villes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accessoires`
--
ALTER TABLE `accessoires`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `annonces`
--
ALTER TABLE `annonces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `autoencheres`
--
ALTER TABLE `autoencheres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `avistexts`
--
ALTER TABLE `avistexts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `avisvideos`
--
ALTER TABLE `avisvideos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `client_types`
--
ALTER TABLE `client_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `entretiens`
--
ALTER TABLE `entretiens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `financements`
--
ALTER TABLE `financements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `financement_settings`
--
ALTER TABLE `financement_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `imgsliders`
--
ALTER TABLE `imgsliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1289;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1018;

--
-- AUTO_INCREMENT for table `nado_auto_encheres`
--
ALTER TABLE `nado_auto_encheres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nado_auto_encheres_bid`
--
ALTER TABLE `nado_auto_encheres_bid`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `offres`
--
ALTER TABLE `offres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=381;

--
-- AUTO_INCREMENT for table `packs`
--
ALTER TABLE `packs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publications`
--
ALTER TABLE `publications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `reprises`
--
ALTER TABLE `reprises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ventes`
--
ALTER TABLE `ventes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `videosads`
--
ALTER TABLE `videosads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `villes`
--
ALTER TABLE `villes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=634;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `annonces`
--
ALTER TABLE `annonces`
  ADD CONSTRAINT `annonces_pack_id_foreign` FOREIGN KEY (`pack_id`) REFERENCES `packs` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `autoencheres`
--
ALTER TABLE `autoencheres`
  ADD CONSTRAINT `autoencheres_annonce_id_foreign` FOREIGN KEY (`annonce_id`) REFERENCES `annonces` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `autoencheres_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entretiens`
--
ALTER TABLE `entretiens`
  ADD CONSTRAINT `entretiens_annonce_id_foreign` FOREIGN KEY (`annonce_id`) REFERENCES `annonces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_annonce_id_foreign` FOREIGN KEY (`annonce_id`) REFERENCES `annonces` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `fk_media_annonce` FOREIGN KEY (`annonces_id`) REFERENCES `annonces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_media_annonce_unique` FOREIGN KEY (`annonces_id`) REFERENCES `annonces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `media_annonce_id_foreign` FOREIGN KEY (`annonces_id`) REFERENCES `annonces` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `models`
--
ALTER TABLE `models`
  ADD CONSTRAINT `models_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `models_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `nado_auto_encheres`
--
ALTER TABLE `nado_auto_encheres`
  ADD CONSTRAINT `nado_auto_encheres_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `nado_auto_encheres_bid`
--
ALTER TABLE `nado_auto_encheres_bid`
  ADD CONSTRAINT `nado_auto_encheres_bid_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `nado_auto_encheres_bid_enchere_id_foreign` FOREIGN KEY (`enchere_id`) REFERENCES `nado_auto_encheres` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
