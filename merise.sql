CREATE TABLE salle(
   id_salle SERIAL,
   num_salle VARCHAR(255) NOT NULL,
   CONSTRAINT PK_salle PRIMARY KEY(id_salle),
   CONSTRAINT AK_salle UNIQUE(num_salle)
);

CREATE TABLE professeur(
   id_prof SERIAL,
   code_d_identifiant_prof VARCHAR(50) NOT NULL,
   prenom VARCHAR(50) NOT NULL,
   nom VARCHAR(50) NOT NULL,
   matière VARCHAR(255),
   CONSTRAINT PK_professeur PRIMARY KEY(id_prof),
   CONSTRAINT AK_professeur UNIQUE(code_d_identifiant_prof)
);

CREATE TABLE etudiant(
   id_etudiant SERIAL,
   code_etudiant VARCHAR(50) NOT NULL,
   nom VARCHAR(255) NOT NULL,
   prenom VARCHAR(255) NOT NULL,
   diplome VARCHAR(255),
   ville VARCHAR(255),
   CONSTRAINT PK_etudiant PRIMARY KEY(id_etudiant),
   CONSTRAINT AK_etudiant UNIQUE(code_etudiant)
);

CREATE TABLE Matière(
   id_matiere SERIAL,
   nom_matière VARCHAR(255) NOT NULL,
   CONSTRAINT PK_Matière PRIMARY KEY(id_matiere),
   CONSTRAINT AK_Matière UNIQUE(nom_matière)
);

CREATE TABLE cours(
   id_cours SERIAL,
   heure_debut TIMESTAMP NOT NULL,
   heure_fin TIMESTAMP NOT NULL,
   id_prof INTEGER NOT NULL,
   id_matiere INTEGER NOT NULL,
   id_salle INTEGER NOT NULL,
   CONSTRAINT PK_cours PRIMARY KEY(id_cours),
   CONSTRAINT AK_cours_ident UNIQUE(id_salle, heure_debut, heure_fin),
   CONSTRAINT FK_cours_professeur FOREIGN KEY(id_prof) REFERENCES professeur(id_prof),
   CONSTRAINT FK_cours_Matière FOREIGN KEY(id_matiere) REFERENCES Matière(id_matiere),
   CONSTRAINT FK_cours_salle FOREIGN KEY(id_salle) REFERENCES salle(id_salle)
);

CREATE TABLE assoc_etudiant_cours(
   id_cours INTEGER,
   id_etudiant INTEGER,
   CONSTRAINT PK_assoc_etudiant_cours PRIMARY KEY(id_cours, id_etudiant),
   CONSTRAINT FK_assoc_etudiant_cours_cours FOREIGN KEY(id_cours) REFERENCES cours(id_cours),
   CONSTRAINT FK_assoc_etudiant_cours_etudiant FOREIGN KEY(id_etudiant) REFERENCES etudiant(id_etudiant)
);
