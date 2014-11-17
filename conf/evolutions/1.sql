# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table T_ADMINISTRATEURS (
  id                        bigint auto_increment not null,
  CREATE_DATE               datetime,
  MODIFY_DATE               datetime,
  PRENOM                    varchar(255),
  NOM                       varchar(255),
  DATE_NAISSANCE            datetime,
  LOGIN                     varchar(255),
  EMAIL                     varchar(255),
  PASSWORD                  varchar(255),
  PHOTO_URL                 varchar(255),
  DESCRIPTION               varchar(255),
  POSTE                     varchar(255),
  user_id                   bigint,
  constraint pk_T_ADMINISTRATEURS primary key (id))
;

create table T_CRENEAU_HORAIRES (
  id                        bigint auto_increment not null,
  CREATE_DATE               datetime,
  MODIFY_DATE               datetime,
  TYPE_CRENEAU              varchar(6),
  DESCRIPTION               varchar(255),
  DATE_CRENEAU              datetime,
  HEURE_DEBUT               varchar(255),
  HEURE_FIN                 varchar(255),
  salle_id                  bigint,
  matiere_id                bigint,
  emploi_du_temps_id        bigint,
  constraint ck_T_CRENEAU_HORAIRES_TYPE_CRENEAU check (TYPE_CRENEAU in ('COURS','TD','OTHERS')),
  constraint pk_T_CRENEAU_HORAIRES primary key (id))
;

create table T_ELEVES (
  id                        bigint auto_increment not null,
  CREATE_DATE               datetime,
  MODIFY_DATE               datetime,
  PRENOM                    varchar(255),
  NOM                       varchar(255),
  DATE_NAISSANCE            datetime,
  LOGIN                     varchar(255),
  EMAIL                     varchar(255),
  PASSWORD                  varchar(255),
  PHOTO_URL                 varchar(255),
  DESCRIPTION               varchar(255),
  filiere_id                bigint,
  group_id                  bigint,
  emploi_du_temps_id        bigint,
  tuteur_id                 bigint,
  constraint pk_T_ELEVES primary key (id))
;

create table AS_ELEVES_MATIERES (
  ELEVE_ID                  bigint,
  MATIERE_ID                bigint)
;

create table EMPLOI_DU_TEMPS (
  id                        bigint auto_increment not null,
  CREATE_DATE               datetime,
  MODIFY_DATE               datetime,
  DATE_DEBUT                datetime,
  DATE_FIN                  datetime,
  constraint pk_EMPLOI_DU_TEMPS primary key (id))
;

create table T_FILIERES (
  id                        bigint auto_increment not null,
  CREATE_DATE               datetime,
  MODIFY_DATE               datetime,
  CODE                      varchar(255),
  NOM                       varchar(255),
  DESCRIPTION               varchar(255),
  constraint pk_T_FILIERES primary key (id))
;

create table T_GROUPS (
  id                        bigint auto_increment not null,
  CREATE_DATE               datetime,
  MODIFY_DATE               datetime,
  CODE                      varchar(255),
  NUMERO                    integer,
  CAPACITE                  integer,
  constraint pk_T_GROUPS primary key (id))
;

create table T_MATIERES (
  id                        bigint auto_increment not null,
  CREATE_DATE               datetime,
  MODIFY_DATE               datetime,
  CODE                      varchar(255),
  INTITULE                  varchar(255),
  constraint pk_T_MATIERES primary key (id))
;

create table T_NOTES (
  id                        bigint auto_increment not null,
  CREATE_DATE               datetime,
  MODIFY_DATE               datetime,
  COEF                      double,
  VALUE                     double,
  PERIODE                   varchar(10),
  ANNEE                     varchar(255),
  CODE_MATIERE              varchar(255),
  eleve_id                  bigint,
  constraint ck_T_NOTES_PERIODE check (PERIODE in ('TRIMESTRE1','TRIMESTRE2','TRIMESTRE3','SEMESTRE1','SEMESTRE2')),
  constraint pk_T_NOTES primary key (id))
;

create table T_PROFESSEURS (
  id                        bigint auto_increment not null,
  CREATE_DATE               datetime,
  MODIFY_DATE               datetime,
  PRENOM                    varchar(255),
  NOM                       varchar(255),
  DATE_NAISSANCE            datetime,
  LOGIN                     varchar(255),
  EMAIL                     varchar(255),
  PASSWORD                  varchar(255),
  PHOTO_URL                 varchar(255),
  DESCRIPTION               varchar(255),
  emploi_du_temps_id        bigint,
  constraint pk_T_PROFESSEURS primary key (id))
;

create table AS_PROFESSEURS_MATIERES (
  PROFESSEUR_ID             bigint,
  MATIERE_ID                bigint)
;

create table T_RIGHTS (
  id                        bigint auto_increment not null,
  CREATE_DATE               datetime,
  MODIFY_DATE               datetime,
  VALUE                     varchar(15),
  constraint ck_T_RIGHTS_VALUE check (VALUE in ('EDIT_ARTICLE','EDIT_ATTACHMENT','EDIT_COMMENT','ADMIN','MODERATOR','SU','USER')),
  constraint uq_T_RIGHTS_VALUE unique (VALUE),
  constraint pk_T_RIGHTS primary key (id))
;

create table T_SALLES (
  id                        bigint auto_increment not null,
  CREATE_DATE               datetime,
  MODIFY_DATE               datetime,
  CODE                      varchar(255),
  BATIMENT                  varchar(255),
  constraint pk_T_SALLES primary key (id))
;

create table T_USERS (
  id                        bigint auto_increment not null,
  CREATE_DATE               datetime,
  MODIFY_DATE               datetime,
  PRENOM                    varchar(255),
  NOM                       varchar(255),
  DATE_NAISSANCE            datetime,
  LOGIN                     varchar(255),
  EMAIL                     varchar(255),
  PASSWORD                  varchar(255),
  PHOTO_URL                 varchar(255),
  DESCRIPTION               varchar(255),
  ROLE                      varchar(9),
  constraint ck_T_USERS_ROLE check (ROLE in ('ADMIN','MODERATOR','SU','USER')),
  constraint pk_T_USERS primary key (id))
;

create table AS_USERS_RIGHTS (
  user_id                   bigint,
  right_id                  bigint)
;

alter table T_ADMINISTRATEURS add constraint fk_T_ADMINISTRATEURS_user_1 foreign key (user_id) references T_USERS (id) on delete restrict on update restrict;
create index ix_T_ADMINISTRATEURS_user_1 on T_ADMINISTRATEURS (user_id);
alter table T_CRENEAU_HORAIRES add constraint fk_T_CRENEAU_HORAIRES_salle_2 foreign key (salle_id) references T_SALLES (id) on delete restrict on update restrict;
create index ix_T_CRENEAU_HORAIRES_salle_2 on T_CRENEAU_HORAIRES (salle_id);
alter table T_CRENEAU_HORAIRES add constraint fk_T_CRENEAU_HORAIRES_matiere_3 foreign key (matiere_id) references T_MATIERES (id) on delete restrict on update restrict;
create index ix_T_CRENEAU_HORAIRES_matiere_3 on T_CRENEAU_HORAIRES (matiere_id);
alter table T_CRENEAU_HORAIRES add constraint fk_T_CRENEAU_HORAIRES_emploiDuTemps_4 foreign key (emploi_du_temps_id) references EMPLOI_DU_TEMPS (id) on delete restrict on update restrict;
create index ix_T_CRENEAU_HORAIRES_emploiDuTemps_4 on T_CRENEAU_HORAIRES (emploi_du_temps_id);
alter table T_ELEVES add constraint fk_T_ELEVES_filiere_5 foreign key (filiere_id) references T_FILIERES (id) on delete restrict on update restrict;
create index ix_T_ELEVES_filiere_5 on T_ELEVES (filiere_id);
alter table T_ELEVES add constraint fk_T_ELEVES_group_6 foreign key (group_id) references T_GROUPS (id) on delete restrict on update restrict;
create index ix_T_ELEVES_group_6 on T_ELEVES (group_id);
alter table T_ELEVES add constraint fk_T_ELEVES_emploiDuTemps_7 foreign key (emploi_du_temps_id) references EMPLOI_DU_TEMPS (id) on delete restrict on update restrict;
create index ix_T_ELEVES_emploiDuTemps_7 on T_ELEVES (emploi_du_temps_id);
alter table T_ELEVES add constraint fk_T_ELEVES_tuteur_8 foreign key (tuteur_id) references T_PROFESSEURS (id) on delete restrict on update restrict;
create index ix_T_ELEVES_tuteur_8 on T_ELEVES (tuteur_id);
alter table AS_ELEVES_MATIERES add constraint fk_AS_ELEVES_MATIERES_eleve_9 foreign key (ELEVE_ID) references T_ELEVES (id) on delete restrict on update restrict;
create index ix_AS_ELEVES_MATIERES_eleve_9 on AS_ELEVES_MATIERES (ELEVE_ID);
alter table AS_ELEVES_MATIERES add constraint fk_AS_ELEVES_MATIERES_matiere_10 foreign key (MATIERE_ID) references T_MATIERES (id) on delete restrict on update restrict;
create index ix_AS_ELEVES_MATIERES_matiere_10 on AS_ELEVES_MATIERES (MATIERE_ID);
alter table T_NOTES add constraint fk_T_NOTES_eleve_11 foreign key (eleve_id) references T_ELEVES (id) on delete restrict on update restrict;
create index ix_T_NOTES_eleve_11 on T_NOTES (eleve_id);
alter table T_PROFESSEURS add constraint fk_T_PROFESSEURS_emploiDuTemps_12 foreign key (emploi_du_temps_id) references EMPLOI_DU_TEMPS (id) on delete restrict on update restrict;
create index ix_T_PROFESSEURS_emploiDuTemps_12 on T_PROFESSEURS (emploi_du_temps_id);
alter table AS_PROFESSEURS_MATIERES add constraint fk_AS_PROFESSEURS_MATIERES_professeur_13 foreign key (PROFESSEUR_ID) references T_PROFESSEURS (id) on delete restrict on update restrict;
create index ix_AS_PROFESSEURS_MATIERES_professeur_13 on AS_PROFESSEURS_MATIERES (PROFESSEUR_ID);
alter table AS_PROFESSEURS_MATIERES add constraint fk_AS_PROFESSEURS_MATIERES_matiere_14 foreign key (MATIERE_ID) references T_MATIERES (id) on delete restrict on update restrict;
create index ix_AS_PROFESSEURS_MATIERES_matiere_14 on AS_PROFESSEURS_MATIERES (MATIERE_ID);
alter table AS_USERS_RIGHTS add constraint fk_AS_USERS_RIGHTS_user_15 foreign key (USER_ID) references T_USERS (id) on delete restrict on update restrict;
create index ix_AS_USERS_RIGHTS_user_15 on AS_USERS_RIGHTS (USER_ID);
alter table AS_USERS_RIGHTS add constraint fk_AS_USERS_RIGHTS_right_16 foreign key (RIGHT_ID) references T_RIGHTS (id) on delete restrict on update restrict;
create index ix_AS_USERS_RIGHTS_right_16 on AS_USERS_RIGHTS (RIGHT_ID);



# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

drop table T_ADMINISTRATEURS;

drop table T_CRENEAU_HORAIRES;

drop table T_ELEVES;

drop table AS_ELEVES_MATIERES;

drop table EMPLOI_DU_TEMPS;

drop table T_FILIERES;

drop table T_GROUPS;

drop table T_MATIERES;

drop table T_NOTES;

drop table T_PROFESSEURS;

drop table AS_PROFESSEURS_MATIERES;

drop table T_RIGHTS;

drop table T_SALLES;

drop table T_USERS;

drop table AS_USERS_RIGHTS;

SET FOREIGN_KEY_CHECKS=1;

