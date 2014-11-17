# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Hôte: localhost (MySQL 5.5.25)
# Base de données: lycee
# Temps de génération: 2014-09-07 15:24:33 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table classes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `annee` year(4) DEFAULT NULL,
  `series_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`series_id`),
  KEY `fk_classes_series1_idx` (`series_id`),
  CONSTRAINT `fk_classes_series1` FOREIGN KEY (`series_id`) REFERENCES `series` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table droits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `droits`;

CREATE TABLE `droits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  ` code` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY ` code_UNIQUE` (` code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table eleves
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eleves`;

CREATE TABLE `eleves` (
  `persons_id` int(11) NOT NULL,
  `promotion` int(11) NOT NULL,
  PRIMARY KEY (`persons_id`),
  UNIQUE KEY `persons_id_UNIQUE` (`persons_id`),
  KEY `fk_eleves_users1_idx` (`persons_id`),
  CONSTRAINT `fk_eleves_users1` FOREIGN KEY (`persons_id`) REFERENCES `persons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table eleves_has_classes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eleves_has_classes`;

CREATE TABLE `eleves_has_classes` (
  `eleves_persons_id` int(11) NOT NULL,
  `classes_id` int(10) unsigned NOT NULL,
  `classes_series_id` int(11) NOT NULL,
  PRIMARY KEY (`eleves_persons_id`,`classes_id`,`classes_series_id`),
  KEY `fk_eleves_has_classes_classes1_idx` (`classes_id`,`classes_series_id`),
  KEY `fk_eleves_has_classes_eleves1_idx` (`eleves_persons_id`),
  CONSTRAINT `fk_eleves_has_classes_classes1` FOREIGN KEY (`classes_id`, `classes_series_id`) REFERENCES `classes` (`id`, `series_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_eleves_has_classes_eleves1` FOREIGN KEY (`eleves_persons_id`) REFERENCES `eleves` (`persons_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table emploi_temps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emploi_temps`;

CREATE TABLE `emploi_temps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persons_id` int(11) NOT NULL,
  `annee` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_emploi_temps_persons1_idx` (`persons_id`),
  CONSTRAINT `fk_emploi_temps_persons1` FOREIGN KEY (`persons_id`) REFERENCES `persons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table horaires
# ------------------------------------------------------------

DROP TABLE IF EXISTS `horaires`;

CREATE TABLE `horaires` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matieres_id` int(11) NOT NULL,
  `jour` varchar(45) DEFAULT NULL,
  `heure` varchar(45) DEFAULT NULL,
  `duree` decimal(2,0) DEFAULT NULL,
  `emploi_temps_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_horaires_matieres1_idx` (`matieres_id`),
  KEY `fk_horaires_emploi_temps1_idx` (`emploi_temps_id`),
  CONSTRAINT `fk_horaires_emploi_temps1` FOREIGN KEY (`emploi_temps_id`) REFERENCES `emploi_temps` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_horaires_matieres1` FOREIGN KEY (`matieres_id`) REFERENCES `matieres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table lycees
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lycees`;

CREATE TABLE `lycees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table matieres
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matieres`;

CREATE TABLE `matieres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table persons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `persons`;

CREATE TABLE `persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(45) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `naissance` date DEFAULT NULL,
  `lycees_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_users_lycees_idx` (`lycees_id`),
  CONSTRAINT `fk_users_lycees` FOREIGN KEY (`lycees_id`) REFERENCES `lycees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table persons_has_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `persons_has_roles`;

CREATE TABLE `persons_has_roles` (
  `persons_id` int(11) NOT NULL,
  `roles_id` int(11) NOT NULL,
  PRIMARY KEY (`persons_id`,`roles_id`),
  KEY `fk_persons_has_roles_roles1_idx` (`roles_id`),
  KEY `fk_persons_has_roles_persons1_idx` (`persons_id`),
  CONSTRAINT `fk_persons_has_roles_persons1` FOREIGN KEY (`persons_id`) REFERENCES `persons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_persons_has_roles_roles1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table roles_has_droits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles_has_droits`;

CREATE TABLE `roles_has_droits` (
  `roles_id` int(11) NOT NULL,
  `droits_id` int(11) NOT NULL,
  PRIMARY KEY (`roles_id`,`droits_id`),
  KEY `fk_roles_has_droits_droits1_idx` (`droits_id`),
  KEY `fk_roles_has_droits_roles1_idx` (`roles_id`),
  CONSTRAINT `fk_roles_has_droits_droits1` FOREIGN KEY (`droits_id`) REFERENCES `droits` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_roles_has_droits_roles1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table series
# ------------------------------------------------------------

DROP TABLE IF EXISTS `series`;

CREATE TABLE `series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table series_has_matieres
# ------------------------------------------------------------

DROP TABLE IF EXISTS `series_has_matieres`;

CREATE TABLE `series_has_matieres` (
  `series_id` int(11) NOT NULL,
  `matieres_id` int(11) NOT NULL,
  PRIMARY KEY (`series_id`,`matieres_id`),
  KEY `fk_series_has_matieres_matieres1_idx` (`matieres_id`),
  KEY `fk_series_has_matieres_series1_idx` (`series_id`),
  CONSTRAINT `fk_series_has_matieres_matieres1` FOREIGN KEY (`matieres_id`) REFERENCES `matieres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_series_has_matieres_series1` FOREIGN KEY (`series_id`) REFERENCES `series` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
