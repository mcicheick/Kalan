# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Hôte: localhost (MySQL 5.5.25)
# Base de données: lycee
# Temps de génération: 2014-09-09 20:45:38 +0000
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
  `ELEVE_ID` bigint(20) NOT NULL,
  `MATIERE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ELEVE_ID`,`MATIERE_ID`),
  KEY `FK85BD8070E7E067B6` (`MATIERE_ID`),
  KEY `FK85BD8070AA65B1F6` (`ELEVE_ID`),
  CONSTRAINT `FK85BD8070AA65B1F6` FOREIGN KEY (`ELEVE_ID`) REFERENCES `T_ELEVES` (`id`),
  CONSTRAINT `FK85BD8070E7E067B6` FOREIGN KEY (`MATIERE_ID`) REFERENCES `T_MATIERES` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `AS_ELEVES_MATIERES` WRITE;
/*!40000 ALTER TABLE `AS_ELEVES_MATIERES` DISABLE KEYS */;

INSERT INTO `AS_ELEVES_MATIERES` (`ELEVE_ID`, `MATIERE_ID`)
VALUES
	(1,1);

/*!40000 ALTER TABLE `AS_ELEVES_MATIERES` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table AS_PROFESSEURS_MATIERES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AS_PROFESSEURS_MATIERES`;

CREATE TABLE `AS_PROFESSEURS_MATIERES` (
  `MATIERE_ID` bigint(20) NOT NULL,
  `PROFESSEUR_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`MATIERE_ID`,`PROFESSEUR_ID`),
  KEY `FK471FA433E7E067B6` (`MATIERE_ID`),
  KEY `FK471FA433AB11B81E` (`PROFESSEUR_ID`),
  CONSTRAINT `FK471FA433AB11B81E` FOREIGN KEY (`PROFESSEUR_ID`) REFERENCES `T_PROFESSEURS` (`id`),
  CONSTRAINT `FK471FA433E7E067B6` FOREIGN KEY (`MATIERE_ID`) REFERENCES `T_MATIERES` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table AS_USERS_RIGHTS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AS_USERS_RIGHTS`;

CREATE TABLE `AS_USERS_RIGHTS` (
  `RIGHT_ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`USER_ID`),
  KEY `FK979BAAFB47140EFE` (`USER_ID`),
  KEY `FK979BAAFB55835B96` (`RIGHT_ID`),
  CONSTRAINT `FK979BAAFB47140EFE` FOREIGN KEY (`USER_ID`) REFERENCES `T_USERS` (`id`),
  CONSTRAINT `FK979BAAFB55835B96` FOREIGN KEY (`RIGHT_ID`) REFERENCES `T_RIGHTS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
	(1,'741a7ae499cef9548beb80567e03fbbb0dd6de4d','2014-09-07 22:48:19','create table T_ADMINISTRATEURS (\n  id                        bigint auto_increment not null,\n  CREATE_DATE               datetime,\n  MODIFY_DATE               datetime,\n  PRENOM                    varchar(255),\n  NOM                       varchar(255),\n  DATE_NAISSANCE            datetime,\n  LOGIN                     varchar(255),\n  EMAIL                     varchar(255),\n  PASSWORD                  varchar(255),\n  PHOTO_URL                 varchar(255),\n  DESCRIPTION               text,\n  POSTE                     varchar(255),\n  user_id                   bigint,\n  constraint pk_T_ADMINISTRATEURS primary key (id))\n;\ncreate table T_CRENEAU_HORAIRES (\n  id                        bigint auto_increment not null,\n  CREATE_DATE               datetime,\n  MODIFY_DATE               datetime,\n  TYPE_CRENEAU              varchar(6),\n  DESCRIPTION               text,\n  DATE_CRENEAU              datetime,\n  HEURE_DEBUT               varchar(255),\n  HEURE_FIN                 varchar(255),\n  salle_id                  bigint,\n  matiere_id                bigint,\n  emploi_du_temps_id        bigint,\n  constraint ck_T_CRENEAU_HORAIRES_TYPE_CRENEAU check (TYPE_CRENEAU in (\'COURS\',\'TD\',\'OTHERS\')),\n  constraint pk_T_CRENEAU_HORAIRES primary key (id))\n;\ncreate table T_ELEVES (\n  id                        bigint auto_increment not null,\n  CREATE_DATE               datetime,\n  MODIFY_DATE               datetime,\n  PRENOM                    varchar(255),\n  NOM                       varchar(255),\n  DATE_NAISSANCE            datetime,\n  LOGIN                     varchar(255),\n  EMAIL                     varchar(255),\n  PASSWORD                  varchar(255),\n  PHOTO_URL                 varchar(255),\n  DESCRIPTION               text,\n  filiere_id                bigint,\n  group_id                  bigint,\n  emploi_du_temps_id        bigint,\n  tuteur_id                 bigint,\n  constraint pk_T_ELEVES primary key (id))\n;\ncreate table AS_ELEVES_MATIERES (\n  ELEVE_ID                  bigint,\n  MATIERE_ID                bigint)\n;\ncreate table EMPLOI_DU_TEMPS (\n  id                        bigint auto_increment not null,\n  CREATE_DATE               datetime,\n  MODIFY_DATE               datetime,\n  DATE_DEBUT                datetime,\n  DATE_FIN                  datetime,\n  constraint pk_EMPLOI_DU_TEMPS primary key (id))\n;\ncreate table T_FILIERES (\n  id                        bigint auto_increment not null,\n  CREATE_DATE               datetime,\n  MODIFY_DATE               datetime,\n  CODE                      varchar(255),\n  NOM                       varchar(255),\n  DESCRIPTION               text,\n  constraint pk_T_FILIERES primary key (id))\n;\ncreate table T_GROUPS (\n  id                        bigint auto_increment not null,\n  CREATE_DATE               datetime,\n  MODIFY_DATE               datetime,\n  CODE                      varchar(255),\n  NUMERO                    integer,\n  CAPACITE                  integer,\n  constraint pk_T_GROUPS primary key (id))\n;\ncreate table T_MATIERES (\n  id                        bigint auto_increment not null,\n  CREATE_DATE               datetime,\n  MODIFY_DATE               datetime,\n  CODE                      varchar(255),\n  INTITULE                  varchar(255),\n  constraint pk_T_MATIERES primary key (id))\n;\ncreate table T_NOTES (\n  id                        bigint auto_increment not null,\n  CREATE_DATE               datetime,\n  MODIFY_DATE               datetime,\n  COEF                      double,\n  VALUE                     double,\n  PERIODE                   varchar(10),\n  ANNEE                     varchar(255),\n  CODE_MATIERE              varchar(255),\n  eleve_id                  bigint,\n  constraint ck_T_NOTES_PERIODE check (PERIODE in (\'TRIMESTRE1\',\'TRIMESTRE2\',\'TRIMESTRE3\',\'SEMESTRE1\',\'SEMESTRE2\')),\n  constraint pk_T_NOTES primary key (id))\n;\ncreate table T_PROFESSEURS (\n  id                        bigint auto_increment not null,\n  CREATE_DATE               datetime,\n  MODIFY_DATE               datetime,\n  PRENOM                    varchar(255),\n  NOM                       varchar(255),\n  DATE_NAISSANCE            datetime,\n  LOGIN                     varchar(255),\n  EMAIL                     varchar(255),\n  PASSWORD                  varchar(255),\n  PHOTO_URL                 varchar(255),\n  DESCRIPTION               varchar(255),\n  emploi_du_temps_id        bigint,\n  constraint pk_T_PROFESSEURS primary key (id))\n;\ncreate table AS_PROFESSEURS_MATIERES (\n  PROFESSEUR_ID             bigint,\n  MATIERE_ID                bigint)\n;\ncreate table T_RIGHTS (\n  id                        bigint auto_increment not null,\n  CREATE_DATE               datetime,\n  MODIFY_DATE               datetime,\n  VALUE                     varchar(15),\n  constraint ck_T_RIGHTS_VALUE check (VALUE in (\'EDIT_ARTICLE\',\'EDIT_ATTACHMENT\',\'EDIT_COMMENT\',\'ADMIN\',\'MODERATOR\',\'SU\',\'USER\')),\n  constraint uq_T_RIGHTS_VALUE unique (VALUE),\n  constraint pk_T_RIGHTS primary key (id))\n;\ncreate table T_SALLES (\n  id                        bigint auto_increment not null,\n  CREATE_DATE               datetime,\n  MODIFY_DATE               datetime,\n  CODE                      varchar(255),\n  BATIMENT                  varchar(255),\n  constraint pk_T_SALLES primary key (id))\n;\ncreate table T_USERS (\n  id                        bigint auto_increment not null,\n  CREATE_DATE               datetime,\n  MODIFY_DATE               datetime,\n  PRENOM                    varchar(255),\n  NOM                       varchar(255),\n  DATE_NAISSANCE            datetime,\n  LOGIN                     varchar(255),\n  EMAIL                     varchar(255),\n  PASSWORD                  varchar(255),\n  PHOTO_URL                 varchar(255),\n  DESCRIPTION               varchar(255),\n  ROLE                      varchar(9),\n  constraint ck_T_USERS_ROLE check (ROLE in (\'ADMIN\',\'MODERATOR\',\'SU\',\'USER\')),\n  constraint pk_T_USERS primary key (id))\n;\ncreate table AS_USERS_RIGHTS (\n  user_id                   bigint,\n  right_id                  bigint)\n;\nalter table T_ADMINISTRATEURS add constraint fk_T_ADMINISTRATEURS_user_1 foreign key (user_id) references T_USERS (id) on delete restrict on update restrict;\ncreate index ix_T_ADMINISTRATEURS_user_1 on T_ADMINISTRATEURS (user_id);\nalter table T_CRENEAU_HORAIRES add constraint fk_T_CRENEAU_HORAIRES_salle_2 foreign key (salle_id) references T_SALLES (id) on delete restrict on update restrict;\ncreate index ix_T_CRENEAU_HORAIRES_salle_2 on T_CRENEAU_HORAIRES (salle_id);\nalter table T_CRENEAU_HORAIRES add constraint fk_T_CRENEAU_HORAIRES_matiere_3 foreign key (matiere_id) references T_MATIERES (id) on delete restrict on update restrict;\ncreate index ix_T_CRENEAU_HORAIRES_matiere_3 on T_CRENEAU_HORAIRES (matiere_id);\nalter table T_CRENEAU_HORAIRES add constraint fk_T_CRENEAU_HORAIRES_emploiDuTemps_4 foreign key (emploi_du_temps_id) references EMPLOI_DU_TEMPS (id) on delete restrict on update restrict;\ncreate index ix_T_CRENEAU_HORAIRES_emploiDuTemps_4 on T_CRENEAU_HORAIRES (emploi_du_temps_id);\nalter table T_ELEVES add constraint fk_T_ELEVES_filiere_5 foreign key (filiere_id) references T_FILIERES (id) on delete restrict on update restrict;\ncreate index ix_T_ELEVES_filiere_5 on T_ELEVES (filiere_id);\nalter table T_ELEVES add constraint fk_T_ELEVES_group_6 foreign key (group_id) references T_GROUPS (id) on delete restrict on update restrict;\ncreate index ix_T_ELEVES_group_6 on T_ELEVES (group_id);\nalter table T_ELEVES add constraint fk_T_ELEVES_emploiDuTemps_7 foreign key (emploi_du_temps_id) references EMPLOI_DU_TEMPS (id) on delete restrict on update restrict;\ncreate index ix_T_ELEVES_emploiDuTemps_7 on T_ELEVES (emploi_du_temps_id);\nalter table T_ELEVES add constraint fk_T_ELEVES_tuteur_8 foreign key (tuteur_id) references T_PROFESSEURS (id) on delete restrict on update restrict;\ncreate index ix_T_ELEVES_tuteur_8 on T_ELEVES (tuteur_id);\nalter table AS_ELEVES_MATIERES add constraint fk_AS_ELEVES_MATIERES_eleve_9 foreign key (ELEVE_ID) references T_ELEVES (id) on delete restrict on update restrict;\ncreate index ix_AS_ELEVES_MATIERES_eleve_9 on AS_ELEVES_MATIERES (ELEVE_ID);\nalter table AS_ELEVES_MATIERES add constraint fk_AS_ELEVES_MATIERES_matiere_10 foreign key (MATIERE_ID) references T_MATIERES (id) on delete restrict on update restrict;\ncreate index ix_AS_ELEVES_MATIERES_matiere_10 on AS_ELEVES_MATIERES (MATIERE_ID);\nalter table T_NOTES add constraint fk_T_NOTES_eleve_11 foreign key (eleve_id) references T_ELEVES (id) on delete restrict on update restrict;\ncreate index ix_T_NOTES_eleve_11 on T_NOTES (eleve_id);\nalter table T_PROFESSEURS add constraint fk_T_PROFESSEURS_emploiDuTemps_12 foreign key (emploi_du_temps_id) references EMPLOI_DU_TEMPS (id) on delete restrict on update restrict;\ncreate index ix_T_PROFESSEURS_emploiDuTemps_12 on T_PROFESSEURS (emploi_du_temps_id);\nalter table AS_PROFESSEURS_MATIERES add constraint fk_AS_PROFESSEURS_MATIERES_professeur_13 foreign key (PROFESSEUR_ID) references T_PROFESSEURS (id) on delete restrict on update restrict;\ncreate index ix_AS_PROFESSEURS_MATIERES_professeur_13 on AS_PROFESSEURS_MATIERES (PROFESSEUR_ID);\nalter table AS_PROFESSEURS_MATIERES add constraint fk_AS_PROFESSEURS_MATIERES_matiere_14 foreign key (MATIERE_ID) references T_MATIERES (id) on delete restrict on update restrict;\ncreate index ix_AS_PROFESSEURS_MATIERES_matiere_14 on AS_PROFESSEURS_MATIERES (MATIERE_ID);\nalter table AS_USERS_RIGHTS add constraint fk_AS_USERS_RIGHTS_user_15 foreign key (USER_ID) references T_USERS (id) on delete restrict on update restrict;\ncreate index ix_AS_USERS_RIGHTS_user_15 on AS_USERS_RIGHTS (USER_ID);\nalter table AS_USERS_RIGHTS add constraint fk_AS_USERS_RIGHTS_right_16 foreign key (RIGHT_ID) references T_RIGHTS (id) on delete restrict on update restrict;\ncreate index ix_AS_USERS_RIGHTS_right_16 on AS_USERS_RIGHTS (RIGHT_ID);\n','SET FOREIGN_KEY_CHECKS=0;\ndrop table T_ADMINISTRATEURS;\ndrop table T_CRENEAU_HORAIRES;\ndrop table T_ELEVES;\ndrop table AS_ELEVES_MATIERES;\ndrop table EMPLOI_DU_TEMPS;\ndrop table T_FILIERES;\ndrop table T_GROUPS;\ndrop table T_MATIERES;\ndrop table T_NOTES;\ndrop table T_PROFESSEURS;\ndrop table AS_PROFESSEURS_MATIERES;\ndrop table T_RIGHTS;\ndrop table T_SALLES;\ndrop table T_USERS;\ndrop table AS_USERS_RIGHTS;\nSET FOREIGN_KEY_CHECKS=1;\n','applied','Table \'t_administrateurs\' already exists [ERROR:1050, SQLSTATE:42S01]');

/*!40000 ALTER TABLE `play_evolutions` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table T_ADMINISTRATEURS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_ADMINISTRATEURS`;

CREATE TABLE `T_ADMINISTRATEURS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `DATE_NAISSANCE` datetime DEFAULT NULL,
  `DESCRIPTION` longtext,
  `EMAIL` varchar(255) DEFAULT NULL,
  `LOGIN` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PHOTO` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `POSTE` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7FAB9B5047140EFE` (`user_id`),
  CONSTRAINT `FK7FAB9B5047140EFE` FOREIGN KEY (`user_id`) REFERENCES `T_USERS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table T_ATTACHMENTS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_ATTACHMENTS`;

CREATE TABLE `T_ATTACHMENTS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `FICHIER` varchar(255) DEFAULT NULL,
  `administrateur_id` bigint(20) DEFAULT NULL,
  `eleve_id` bigint(20) DEFAULT NULL,
  `professeur_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7231E0251B2C32DE` (`administrateur_id`),
  KEY `FK7231E025AB11B81E` (`professeur_id`),
  KEY `FK7231E025AA65B1F6` (`eleve_id`),
  CONSTRAINT `FK7231E0251B2C32DE` FOREIGN KEY (`administrateur_id`) REFERENCES `T_ADMINISTRATEURS` (`id`),
  CONSTRAINT `FK7231E025AA65B1F6` FOREIGN KEY (`eleve_id`) REFERENCES `T_ELEVES` (`id`),
  CONSTRAINT `FK7231E025AB11B81E` FOREIGN KEY (`professeur_id`) REFERENCES `T_PROFESSEURS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `T_ATTACHMENTS` WRITE;
/*!40000 ALTER TABLE `T_ATTACHMENTS` DISABLE KEYS */;

INSERT INTO `T_ATTACHMENTS` (`id`, `CREATE_DATE`, `MODIFY_DATE`, `DESCRIPTION`, `FICHIER`, `administrateur_id`, `eleve_id`, `professeur_id`)
VALUES
	(1,'2014-09-08 00:00:00','2014-09-08 00:00:00','Je ne sais pas quoi dire au fait!','30e16c08-a7e0-4e47-8cf8-5035fc4528c6|image/png',NULL,1,NULL);

/*!40000 ALTER TABLE `T_ATTACHMENTS` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table T_CRENEAU_HORAIRES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_CRENEAU_HORAIRES`;

CREATE TABLE `T_CRENEAU_HORAIRES` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `DATE_CRENEAU` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `HEURE_DEBUT` varchar(255) DEFAULT NULL,
  `HEURE_FIN` varchar(255) DEFAULT NULL,
  `TYPE_CRENEAU` varchar(255) DEFAULT NULL,
  `emploiDuTemps_id` bigint(20) DEFAULT NULL,
  `matiere_id` bigint(20) DEFAULT NULL,
  `salle_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE9CF6636E7E067B6` (`matiere_id`),
  KEY `FKE9CF66361B266D6` (`emploiDuTemps_id`),
  KEY `FKE9CF66361EF6FDB6` (`salle_id`),
  CONSTRAINT `FKE9CF66361B266D6` FOREIGN KEY (`emploiDuTemps_id`) REFERENCES `EMPLOI_DU_TEMPS` (`id`),
  CONSTRAINT `FKE9CF66361EF6FDB6` FOREIGN KEY (`salle_id`) REFERENCES `T_SALLES` (`id`),
  CONSTRAINT `FKE9CF6636E7E067B6` FOREIGN KEY (`matiere_id`) REFERENCES `T_MATIERES` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `T_CRENEAU_HORAIRES` WRITE;
/*!40000 ALTER TABLE `T_CRENEAU_HORAIRES` DISABLE KEYS */;

INSERT INTO `T_CRENEAU_HORAIRES` (`id`, `CREATE_DATE`, `MODIFY_DATE`, `DATE_CRENEAU`, `DESCRIPTION`, `HEURE_DEBUT`, `HEURE_FIN`, `TYPE_CRENEAU`, `emploiDuTemps_id`, `matiere_id`, `salle_id`)
VALUES
	(1,'2014-09-08 00:00:00','2014-09-08 00:00:00','2014-09-15 00:00:00','La lecture','10:00','12:00','COURS',1,1,1);

/*!40000 ALTER TABLE `T_CRENEAU_HORAIRES` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table T_ELEVES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_ELEVES`;

CREATE TABLE `T_ELEVES` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `DATE_NAISSANCE` datetime DEFAULT NULL,
  `DESCRIPTION` longtext,
  `EMAIL` varchar(255) DEFAULT NULL,
  `LOGIN` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PHOTO` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `emploiDuTemps_id` bigint(20) DEFAULT NULL,
  `filiere_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `tuteur_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3160BC9137E2CB16` (`filiere_id`),
  KEY `FK3160BC91B4E1BD65` (`tuteur_id`),
  KEY `FK3160BC91C8B3DCB6` (`group_id`),
  KEY `FK3160BC911B266D6` (`emploiDuTemps_id`),
  CONSTRAINT `FK3160BC911B266D6` FOREIGN KEY (`emploiDuTemps_id`) REFERENCES `EMPLOI_DU_TEMPS` (`id`),
  CONSTRAINT `FK3160BC9137E2CB16` FOREIGN KEY (`filiere_id`) REFERENCES `T_FILIERES` (`id`),
  CONSTRAINT `FK3160BC91B4E1BD65` FOREIGN KEY (`tuteur_id`) REFERENCES `T_PROFESSEURS` (`id`),
  CONSTRAINT `FK3160BC91C8B3DCB6` FOREIGN KEY (`group_id`) REFERENCES `T_GROUPS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `T_ELEVES` WRITE;
/*!40000 ALTER TABLE `T_ELEVES` DISABLE KEYS */;

INSERT INTO `T_ELEVES` (`id`, `CREATE_DATE`, `MODIFY_DATE`, `DATE_NAISSANCE`, `DESCRIPTION`, `EMAIL`, `LOGIN`, `NOM`, `PASSWORD`, `PHOTO`, `PRENOM`, `emploiDuTemps_id`, `filiere_id`, `group_id`, `tuteur_id`)
VALUES
	(1,'2014-09-07 00:00:00','2014-09-07 00:00:00','1989-02-03 00:00:00','Je m\'appelle cheick mahady sissoko','cheickm.sissoko@ldkk.ml','cheickm.sissoko','SISSOKO','secretentrevoisin','8e3630d2-ed9e-47a1-9c91-c0af5dec81f7|image/jpeg','Cheick Mahady',NULL,1,1,NULL);

/*!40000 ALTER TABLE `T_ELEVES` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table T_EMPLOI_DU_TEMPS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_EMPLOI_DU_TEMPS`;

CREATE TABLE `T_EMPLOI_DU_TEMPS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `DATE_DEBUT` datetime DEFAULT NULL,
  `DATE_FIN` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `T_EMPLOI_DU_TEMPS` WRITE;
/*!40000 ALTER TABLE `T_EMPLOI_DU_TEMPS` DISABLE KEYS */;

INSERT INTO `T_EMPLOI_DU_TEMPS` (`id`, `CREATE_DATE`, `MODIFY_DATE`, `DATE_DEBUT`, `DATE_FIN`)
VALUES
	(1,'2014-09-08 00:00:00','2014-09-08 00:00:00','2014-09-08 00:00:00','2014-09-29 00:00:00');

/*!40000 ALTER TABLE `T_EMPLOI_DU_TEMPS` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table T_FILIERES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_FILIERES`;

CREATE TABLE `T_FILIERES` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `NOM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `T_FILIERES` WRITE;
/*!40000 ALTER TABLE `T_FILIERES` DISABLE KEYS */;

INSERT INTO `T_FILIERES` (`id`, `CREATE_DATE`, `MODIFY_DATE`, `CODE`, `DESCRIPTION`, `NOM`)
VALUES
	(1,'2014-09-07 00:00:00','2014-09-07 00:00:00','INFORMATIQUE','Une petite description.','Réseaux et sécurité');

/*!40000 ALTER TABLE `T_FILIERES` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table T_GROUPS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_GROUPS`;

CREATE TABLE `T_GROUPS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `CAPACITE` int(11) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `NUMERO` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `T_GROUPS` WRITE;
/*!40000 ALTER TABLE `T_GROUPS` DISABLE KEYS */;

INSERT INTO `T_GROUPS` (`id`, `CREATE_DATE`, `MODIFY_DATE`, `CAPACITE`, `CODE`, `NUMERO`)
VALUES
	(1,'2014-09-07 00:00:00','2014-09-07 00:00:00',30,'Group one',1);

/*!40000 ALTER TABLE `T_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table T_INFORMATIONS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_INFORMATIONS`;

CREATE TABLE `T_INFORMATIONS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `CONTENT` longtext,
  `INFORMATION_TYPE` varchar(255) DEFAULT NULL,
  `submenu_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5EFCAAD21B0EE1B6` (`submenu_id`),
  CONSTRAINT `FK5EFCAAD21B0EE1B6` FOREIGN KEY (`submenu_id`) REFERENCES `T_SUBMENUS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table T_MAINTENANCES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_MAINTENANCES`;

CREATE TABLE `T_MAINTENANCES` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `CAUSE` varchar(255) DEFAULT NULL,
  `DATE_RANGE` varchar(255) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `ONGOING` bit(1) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table T_MATIERES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_MATIERES`;

CREATE TABLE `T_MATIERES` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `INTITULE` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `T_MATIERES` WRITE;
/*!40000 ALTER TABLE `T_MATIERES` DISABLE KEYS */;

INSERT INTO `T_MATIERES` (`id`, `CREATE_DATE`, `MODIFY_DATE`, `CODE`, `INTITULE`)
VALUES
	(1,'2014-09-07 00:00:00','2014-09-07 00:00:00','MAT311','Analyse réelle et complexe');

/*!40000 ALTER TABLE `T_MATIERES` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table T_NOTES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_NOTES`;

CREATE TABLE `T_NOTES` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `ANNEE` varchar(255) DEFAULT NULL,
  `CODE_MATIERE` varchar(255) DEFAULT NULL,
  `COEF` double DEFAULT NULL,
  `VALUE` double DEFAULT NULL,
  `PERIODE` varchar(255) DEFAULT NULL,
  `eleve_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2182AF6AA65B1F6` (`eleve_id`),
  CONSTRAINT `FK2182AF6AA65B1F6` FOREIGN KEY (`eleve_id`) REFERENCES `T_ELEVES` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `T_NOTES` WRITE;
/*!40000 ALTER TABLE `T_NOTES` DISABLE KEYS */;

INSERT INTO `T_NOTES` (`id`, `CREATE_DATE`, `MODIFY_DATE`, `ANNEE`, `CODE_MATIERE`, `COEF`, `VALUE`, `PERIODE`, `eleve_id`)
VALUES
	(1,'2014-09-08 00:00:00','2014-09-08 00:00:00','2014','MAT311',5,20,'TRIMESTRE1',1);

/*!40000 ALTER TABLE `T_NOTES` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table T_PROFESSEURS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_PROFESSEURS`;

CREATE TABLE `T_PROFESSEURS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `DATE_NAISSANCE` datetime DEFAULT NULL,
  `DESCRIPTION` longtext,
  `EMAIL` varchar(255) DEFAULT NULL,
  `LOGIN` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PHOTO` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `emploiDuTemps_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE1FB98F21B266D6` (`emploiDuTemps_id`),
  CONSTRAINT `FKE1FB98F21B266D6` FOREIGN KEY (`emploiDuTemps_id`) REFERENCES `EMPLOI_DU_TEMPS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table T_RIGHTS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_RIGHTS`;

CREATE TABLE `T_RIGHTS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `VALUE` (`VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table T_SALLES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_SALLES`;

CREATE TABLE `T_SALLES` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `BATIMENT` varchar(255) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `T_SALLES` WRITE;
/*!40000 ALTER TABLE `T_SALLES` DISABLE KEYS */;

INSERT INTO `T_SALLES` (`id`, `CREATE_DATE`, `MODIFY_DATE`, `BATIMENT`, `CODE`)
VALUES
	(1,'2014-09-08 00:00:00','2014-09-08 00:00:00','P543','Poisson');

/*!40000 ALTER TABLE `T_SALLES` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table T_SUBMENUS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_SUBMENUS`;

CREATE TABLE `T_SUBMENUS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `ORDRE` int(11) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table T_USERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `T_USERS`;

CREATE TABLE `T_USERS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `DATE_NAISSANCE` datetime DEFAULT NULL,
  `DESCRIPTION` longtext,
  `EMAIL` varchar(255) DEFAULT NULL,
  `LOGIN` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PHOTO` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




--
-- Dumping routines (PROCEDURE) for database 'lycee'
--
DELIMITER ;;

# Dump of PROCEDURE new_procedure
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `new_procedure` */;;
/*!50003 SET SESSION SQL_MODE=""*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `new_procedure`()
BEGIN

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
