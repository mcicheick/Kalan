# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Hôte: localhost (MySQL 5.5.25)
# Base de données: lycee
# Temps de génération: 2014-09-07 18:42:14 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table AS_ELEVES_MATIERES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AS_ELEVES_MATIERES`;

CREATE TABLE `AS_ELEVES_MATIERES` (
  `ELEVE_ID` bigint(20) DEFAULT NULL,
  `MATIERE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table AS_ELEVES_MATIERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AS_ELEVES_MATIERS`;

CREATE TABLE `AS_ELEVES_MATIERS` (
  `ELEVE_ID` bigint(20) DEFAULT NULL,
  `MATIERE_ID` bigint(20) DEFAULT NULL,
  KEY `ix_AS_ELEVES_MATIERES_eleve_9` (`ELEVE_ID`),
  KEY `ix_AS_ELEVES_MATIERES_matiere_10` (`MATIERE_ID`),
  CONSTRAINT `fk_AS_ELEVES_MATIERES_matiere_10` FOREIGN KEY (`MATIERE_ID`) REFERENCES `T_MATIERES` (`id`),
  CONSTRAINT `fk_AS_ELEVES_MATIERES_eleve_9` FOREIGN KEY (`ELEVE_ID`) REFERENCES `t_eleves` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table AS_PROFESSEURS_MATIERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AS_PROFESSEURS_MATIERS`;

CREATE TABLE `AS_PROFESSEURS_MATIERS` (
  `PROFESSEUR_ID` bigint(20) DEFAULT NULL,
  `MATIERE_ID` bigint(20) DEFAULT NULL,
  KEY `ix_AS_PROFESSEURS_MATIERES_professeur_12` (`PROFESSEUR_ID`),
  KEY `ix_AS_PROFESSEURS_MATIERES_matiere_13` (`MATIERE_ID`),
  CONSTRAINT `fk_AS_PROFESSEURS_MATIERES_matiere_13` FOREIGN KEY (`MATIERE_ID`) REFERENCES `T_MATIERES` (`id`),
  CONSTRAINT `fk_AS_PROFESSEURS_MATIERES_professeur_12` FOREIGN KEY (`PROFESSEUR_ID`) REFERENCES `t_professeurs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table AS_USERS_RIGHTS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AS_USERS_RIGHTS`;

CREATE TABLE `AS_USERS_RIGHTS` (
  `USER_ID` bigint(20) DEFAULT NULL,
  `RIGHT_ID` bigint(20) DEFAULT NULL,
  KEY `ix_AS_USERS_RIGHTS_user_14` (`USER_ID`),
  KEY `ix_AS_USERS_RIGHTS_right_15` (`RIGHT_ID`),
  CONSTRAINT `fk_AS_USERS_RIGHTS_right_15` FOREIGN KEY (`right_id`) REFERENCES `T_RIGHTS` (`id`),
  CONSTRAINT `fk_AS_USERS_RIGHTS_user_14` FOREIGN KEY (`user_id`) REFERENCES `T_USERS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table EMPLOI_DU_TEMPS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EMPLOI_DU_TEMPS`;

CREATE TABLE `EMPLOI_DU_TEMPS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `DATE_DEBUT` datetime DEFAULT NULL,
  `DATE_FIN` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table play_evolutions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `play_evolutions`;

CREATE TABLE `play_evolutions` (
  `id` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `applied_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `apply_script` text,
  `revert_script` text,
  `state` varchar(255) DEFAULT NULL,
  `last_problem` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `play_evolutions` WRITE;
/*!40000 ALTER TABLE `play_evolutions` DISABLE KEYS */;

INSERT INTO `play_evolutions` (`id`, `hash`, `applied_at`, `apply_script`, `revert_script`, `state`, `last_problem`)
VALUES
	(1,'3092ccb1661292a897db0751a0a85c957c7ae397','2014-09-07 20:35:56','create table T_ADMINISTRATEURS (\nid                        bigint auto_increment not null,\nCREATE_DATE               datetime,\nMODIFY_DATE               datetime,\nPRENOM                    varchar(255),\nNOM                       varchar(255),\nDATE_NAISSANCE            datetime,\nLOGIN                     varchar(255),\nEMAIL                     varchar(255),\nPASSWORD                  varchar(255),\nPHOTO_URL                 varchar(255),\nDESCRIPTION               varchar(255),\nPOSTE                     varchar(255),\nuser_id                   bigint,\nconstraint pk_T_ADMINISTRATEURS primary key (id))\n;\n\ncreate table T_CRENEAU_HORAIRES (\nid                        bigint auto_increment not null,\nCREATE_DATE               datetime,\nMODIFY_DATE               datetime,\nTYPE_CRENEAU              varchar(6),\nDESCRIPTION               varchar(255),\nDATE_CRENEAU              datetime,\nHEURE_DEBUT               varchar(255),\nHEURE_FIN                 varchar(255),\nsalle_id                  bigint,\nmatiere_id                bigint,\nemploi_du_temps_id        bigint,\nconstraint ck_T_CRENEAU_HORAIRES_TYPE_CRENEAU check (TYPE_CRENEAU in (\'COURS\',\'TD\',\'OTHERS\')),\nconstraint pk_T_CRENEAU_HORAIRES primary key (id))\n;\n\ncreate table T_ELEVES (\nid                        bigint auto_increment not null,\nCREATE_DATE               datetime,\nMODIFY_DATE               datetime,\nPRENOM                    varchar(255),\nNOM                       varchar(255),\nDATE_NAISSANCE            datetime,\nLOGIN                     varchar(255),\nEMAIL                     varchar(255),\nPASSWORD                  varchar(255),\nPHOTO_URL                 varchar(255),\nDESCRIPTION               varchar(255),\nfiliere_id                bigint,\ngroup_id                  bigint,\nemploi_du_temps_id        bigint,\ntuteur_id                 bigint,\nconstraint pk_T_ELEVES primary key (id))\n;\n\ncreate table AS_ELEVES_MATIERES (\nELEVE_ID                  bigint,\nMATIERE_ID                bigint)\n;\n\ncreate table EMPLOI_DU_TEMPS (\nid                        bigint auto_increment not null,\nCREATE_DATE               datetime,\nMODIFY_DATE               datetime,\nDATE_DEBUT                datetime,\nDATE_FIN                  datetime,\nconstraint pk_EMPLOI_DU_TEMPS primary key (id))\n;\n\ncreate table T_FILIERES (\nid                        bigint auto_increment not null,\nCREATE_DATE               datetime,\nMODIFY_DATE               datetime,\nCODE                      varchar(255),\nNOM                       varchar(255),\nDESCRIPTION               varchar(255),\nconstraint pk_T_FILIERES primary key (id))\n;\n\ncreate table T_GROUPS (\nid                        bigint auto_increment not null,\nCREATE_DATE               datetime,\nMODIFY_DATE               datetime,\nCODE                      varchar(255),\nNUMERO                    integer,\nCAPACITE                  integer,\nconstraint pk_T_GROUPS primary key (id))\n;\n\ncreate table T_MATIERES (\nid                        bigint auto_increment not null,\nCREATE_DATE               datetime,\nMODIFY_DATE               datetime,\nCODE                      varchar(255),\nINTITULE                  varchar(255),\nconstraint pk_T_MATIERES primary key (id))\n;\n\ncreate table T_NOTES (\nid                        bigint auto_increment not null,\nCREATE_DATE               datetime,\nMODIFY_DATE               datetime,\nCOEF                      double,\nVALUE                     double,\nPERIODE                   varchar(10),\nANNEE                     varchar(255),\nCODE_MATIERE              varchar(255),\neleve_id                  bigint,\nconstraint ck_T_NOTES_PERIODE check (PERIODE in (\'TRIMESTRE1\',\'TRIMESTRE2\',\'TRIMESTRE3\',\'SEMESTRE1\',\'SEMESTRE2\')),\nconstraint pk_T_NOTES primary key (id))\n;\n\ncreate table T_PROFESSEURS (\nid                        bigint auto_increment not null,\nCREATE_DATE               datetime,\nMODIFY_DATE               datetime,\nPRENOM                    varchar(255),\nNOM                       varchar(255),\nDATE_NAISSANCE            datetime,\nLOGIN                     varchar(255),\nEMAIL                     varchar(255),\nPASSWORD                  varchar(255),\nPHOTO_URL                 varchar(255),\nDESCRIPTION               varchar(255),\nemploi_du_temps_id        bigint,\nconstraint pk_T_PROFESSEURS primary key (id))\n;\n\ncreate table AS_PROFESSEURS_MATIERES (\nPROFESSEUR_ID             bigint,\nMATIERE_ID                bigint)\n;\n\ncreate table T_RIGHTS (\nid                        bigint auto_increment not null,\nCREATE_DATE               datetime,\nMODIFY_DATE               datetime,\nVALUE                     varchar(15),\nconstraint ck_T_RIGHTS_VALUE check (VALUE in (\'EDIT_ARTICLE\',\'EDIT_ATTACHMENT\',\'EDIT_COMMENT\',\'ADMIN\',\'MODERATOR\',\'SU\',\'USER\')),\nconstraint uq_T_RIGHTS_VALUE unique (VALUE),\nconstraint pk_T_RIGHTS primary key (id))\n;\n\ncreate table T_SALLES (\nid                        bigint auto_increment not null,\nCREATE_DATE               datetime,\nMODIFY_DATE               datetime,\nCODE                      varchar(255),\nBATIMENT                  varchar(255),\nconstraint pk_T_SALLES primary key (id))\n;\n\ncreate table T_USERS (\nid                        bigint auto_increment not null,\nCREATE_DATE               datetime,\nMODIFY_DATE               datetime,\nPRENOM                    varchar(255),\nNOM                       varchar(255),\nDATE_NAISSANCE            datetime,\nLOGIN                     varchar(255),\nEMAIL                     varchar(255),\nPASSWORD                  varchar(255),\nPHOTO_URL                 varchar(255),\nDESCRIPTION               varchar(255),\nROLE                      varchar(9),\nconstraint ck_T_USERS_ROLE check (ROLE in (\'ADMIN\',\'MODERATOR\',\'SU\',\'USER\')),\nconstraint pk_T_USERS primary key (id))\n;\n\ncreate table AS_USERS_RIGHTS (\nuser_id                   bigint,\nright_id                  bigint)\n;\n\nalter table T_ADMINISTRATEURS add constraint fk_T_ADMINISTRATEURS_user_1 foreign key (user_id) references T_USERS (id) on delete restrict on update restrict;\ncreate index ix_T_ADMINISTRATEURS_user_1 on T_ADMINISTRATEURS (user_id);\nalter table T_CRENEAU_HORAIRES add constraint fk_T_CRENEAU_HORAIRES_salle_2 foreign key (salle_id) references T_SALLES (id) on delete restrict on update restrict;\ncreate index ix_T_CRENEAU_HORAIRES_salle_2 on T_CRENEAU_HORAIRES (salle_id);\nalter table T_CRENEAU_HORAIRES add constraint fk_T_CRENEAU_HORAIRES_matiere_3 foreign key (matiere_id) references T_MATIERES (id) on delete restrict on update restrict;\ncreate index ix_T_CRENEAU_HORAIRES_matiere_3 on T_CRENEAU_HORAIRES (matiere_id);\nalter table T_CRENEAU_HORAIRES add constraint fk_T_CRENEAU_HORAIRES_emploiDuTemps_4 foreign key (emploi_du_temps_id) references EMPLOI_DU_TEMPS (id) on delete restrict on update restrict;\ncreate index ix_T_CRENEAU_HORAIRES_emploiDuTemps_4 on T_CRENEAU_HORAIRES (emploi_du_temps_id);\nalter table T_ELEVES add constraint fk_T_ELEVES_filiere_5 foreign key (filiere_id) references T_FILIERES (id) on delete restrict on update restrict;\ncreate index ix_T_ELEVES_filiere_5 on T_ELEVES (filiere_id);\nalter table T_ELEVES add constraint fk_T_ELEVES_group_6 foreign key (group_id) references T_GROUPS (id) on delete restrict on update restrict;\ncreate index ix_T_ELEVES_group_6 on T_ELEVES (group_id);\nalter table T_ELEVES add constraint fk_T_ELEVES_emploiDuTemps_7 foreign key (emploi_du_temps_id) references EMPLOI_DU_TEMPS (id) on delete restrict on update restrict;\ncreate index ix_T_ELEVES_emploiDuTemps_7 on T_ELEVES (emploi_du_temps_id);\nalter table T_ELEVES add constraint fk_T_ELEVES_tuteur_8 foreign key (tuteur_id) references T_PROFESSEURS (id) on delete restrict on update restrict;\ncreate index ix_T_ELEVES_tuteur_8 on T_ELEVES (tuteur_id);\nalter table AS_ELEVES_MATIERES add constraint fk_AS_ELEVES_MATIERES_eleve_9 foreign key (ELEVE_ID) references T_ELEVES (id) on delete restrict on update restrict;\ncreate index ix_AS_ELEVES_MATIERES_eleve_9 on AS_ELEVES_MATIERES (ELEVE_ID);\nalter table AS_ELEVES_MATIERES add constraint fk_AS_ELEVES_MATIERES_matiere_10 foreign key (MATIERE_ID) references T_MATIERES (id) on delete restrict on update restrict;\ncreate index ix_AS_ELEVES_MATIERES_matiere_10 on AS_ELEVES_MATIERES (MATIERE_ID);\nalter table T_NOTES add constraint fk_T_NOTES_eleve_11 foreign key (eleve_id) references T_ELEVES (id) on delete restrict on update restrict;\ncreate index ix_T_NOTES_eleve_11 on T_NOTES (eleve_id);\nalter table T_PROFESSEURS add constraint fk_T_PROFESSEURS_emploiDuTemps_12 foreign key (emploi_du_temps_id) references EMPLOI_DU_TEMPS (id) on delete restrict on update restrict;\ncreate index ix_T_PROFESSEURS_emploiDuTemps_12 on T_PROFESSEURS (emploi_du_temps_id);\nalter table AS_PROFESSEURS_MATIERES add constraint fk_AS_PROFESSEURS_MATIERES_professeur_13 foreign key (PROFESSEUR_ID) references T_PROFESSEURS (id) on delete restrict on update restrict;\ncreate index ix_AS_PROFESSEURS_MATIERES_professeur_13 on AS_PROFESSEURS_MATIERES (PROFESSEUR_ID);\nalter table AS_PROFESSEURS_MATIERES add constraint fk_AS_PROFESSEURS_MATIERES_matiere_14 foreign key (MATIERE_ID) references T_MATIERES (id) on delete restrict on update restrict;\ncreate index ix_AS_PROFESSEURS_MATIERES_matiere_14 on AS_PROFESSEURS_MATIERES (MATIERE_ID);\nalter table AS_USERS_RIGHTS add constraint fk_AS_USERS_RIGHTS_user_15 foreign key (USER_ID) references T_USERS (id) on delete restrict on update restrict;\ncreate index ix_AS_USERS_RIGHTS_user_15 on AS_USERS_RIGHTS (USER_ID);\nalter table AS_USERS_RIGHTS add constraint fk_AS_USERS_RIGHTS_right_16 foreign key (RIGHT_ID) references T_RIGHTS (id) on delete restrict on update restrict;\ncreate index ix_AS_USERS_RIGHTS_right_16 on AS_USERS_RIGHTS (RIGHT_ID);','SET FOREIGN_KEY_CHECKS=0;\n\ndrop table T_ADMINISTRATEURS;\n\ndrop table T_CRENEAU_HORAIRES;\n\ndrop table T_ELEVES;\n\ndrop table AS_ELEVES_MATIERES;\n\ndrop table EMPLOI_DU_TEMPS;\n\ndrop table T_FILIERES;\n\ndrop table T_GROUPS;\n\ndrop table T_MATIERES;\n\ndrop table T_NOTES;\n\ndrop table T_PROFESSEURS;\n\ndrop table AS_PROFESSEURS_MATIERES;\n\ndrop table T_RIGHTS;\n\ndrop table T_SALLES;\n\ndrop table T_USERS;\n\ndrop table AS_USERS_RIGHTS;\n\nSET FOREIGN_KEY_CHECKS=1;','applied','Table \'emploi_du_temps\' already exists [ERROR:1050, SQLSTATE:42S01]');

/*!40000 ALTER TABLE `play_evolutions` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table T_ADMINISTRATEURS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_ADMINISTRATEURS`;

CREATE TABLE `T_ADMINISTRATEURS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `DATE_NAISSANCE` datetime DEFAULT NULL,
  `LOGIN` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PHOTO_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `POSTE` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table T_CRENEAU_HORAIRES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_CRENEAU_HORAIRES`;

CREATE TABLE `T_CRENEAU_HORAIRES` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `TYPE_CRENEAU` varchar(6) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `DATE_CRENEAU` datetime DEFAULT NULL,
  `HEURE_DEBUT` varchar(255) DEFAULT NULL,
  `HEURE_FIN` varchar(255) DEFAULT NULL,
  `salle_id` bigint(20) DEFAULT NULL,
  `matiere_id` bigint(20) DEFAULT NULL,
  `emploi_du_temps_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table T_ELEVES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_ELEVES`;

CREATE TABLE `T_ELEVES` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `DATE_NAISSANCE` datetime DEFAULT NULL,
  `LOGIN` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PHOTO_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `filiere_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `emploi_du_temps_id` bigint(20) DEFAULT NULL,
  `tuteur_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table T_FILIERES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_FILIERES`;

CREATE TABLE `T_FILIERES` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table T_GROUPS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_GROUPS`;

CREATE TABLE `T_GROUPS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `NUMERO` int(11) DEFAULT NULL,
  `CAPACITE` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table T_MATIERES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_MATIERES`;

CREATE TABLE `T_MATIERES` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `INTITULE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table T_NOTES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_NOTES`;

CREATE TABLE `T_NOTES` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `COEF` double DEFAULT NULL,
  `VALUE` double DEFAULT NULL,
  `PERIODE` varchar(10) DEFAULT NULL,
  `ANNEE` varchar(255) DEFAULT NULL,
  `CODE_MATIERE` varchar(255) DEFAULT NULL,
  `eleve_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_T_NOTES_eleve_11` (`eleve_id`),
  CONSTRAINT `fk_T_NOTES_eleve_11` FOREIGN KEY (`eleve_id`) REFERENCES `T_ELEVES` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table T_PROFESSEURS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_PROFESSEURS`;

CREATE TABLE `T_PROFESSEURS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `DATE_NAISSANCE` datetime DEFAULT NULL,
  `LOGIN` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PHOTO_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `emploi_du_temps_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_T_PROFESSEURS_emploiDuTemps_11` (`emploi_du_temps_id`),
  CONSTRAINT `fk_T_PROFESSEURS_emploiDuTemps_11` FOREIGN KEY (`emploi_du_temps_id`) REFERENCES `EMPLOI_DU_TEMPS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table T_RIGHTS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_RIGHTS`;

CREATE TABLE `T_RIGHTS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `VALUE` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_T_RIGHTS_VALUE` (`VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table T_SALLES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_SALLES`;

CREATE TABLE `T_SALLES` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `BATIMENT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table T_USERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_USERS`;

CREATE TABLE `T_USERS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `DATE_NAISSANCE` datetime DEFAULT NULL,
  `LOGIN` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PHOTO_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `ROLE` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
