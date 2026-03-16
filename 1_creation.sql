CREATE DATABASE gestion_evenements;
USE gestion_evenements;

CREATE TABLE Fournisseur(
-- Attributs
Id_fournisseur INT, 
Nom_fournisseur VARCHAR(100) NOT NULL,
-- Clé primaire
PRIMARY KEY (Id_fournisseur));

CREATE TABLE DJ(
-- Attributs
Id_DJ INT, 
Nom_DJ VARCHAR(100) NOT NULL, 
-- Clé primaire
PRIMARY KEY (Id_DJ));

CREATE TABLE BDE( 
-- Attributs
Id_BDE INT, 
Nom_BDE VARCHAR(100) NOT NULL, 
-- Clé primaire
PRIMARY KEY (Id_BDE));

CREATE TABLE Participant( 
-- Attributs
Id_participant INT, 
Nom_participant VARCHAR(50) NOT NULL, 
Prenom_participant VARCHAR(50) NOT NULL, 
Email_participant VARCHAR(100) NOT NULL,
-- Clé primaire
PRIMARY KEY (Id_participant));

CREATE TABLE Boisson( 
-- Attributs
Id_boisson INT, 
Nom_boisson VARCHAR(100) NOT NULL, 
Prix_boisson DECIMAL(8,2) NOT NULL,
-- Clé primaire
PRIMARY KEY (Id_boisson));

CREATE TABLE Type_billet( 
-- Attributs
Nom_type VARCHAR(50), 
Prix_billet_type DECIMAL(8,2) NOT NULL, 
-- Clé primaire
PRIMARY KEY (Nom_type));

CREATE TABLE Lieu_evenement(
-- Attributs
Lieu_event VARCHAR(150), 
Capacite_max_event INT NOT NULL, 
-- Clé primaire
PRIMARY KEY (Lieu_event));

CREATE TABLE Evenement( 
-- Attributs
Id_event INT, 
Nom_event VARCHAR(100) NOT NULL, 
Date_event DATE NOT NULL,
Heure_debut_event TIME NOT NULL, 
Heure_fin_event TIME NOT NULL, 
Statut_event VARCHAR(20) NOT NULL, 
Budget_previsionnel_event DECIMAL(10,2) NOT NULL, 
-- Clé primaire
PRIMARY KEY (Id_event), 
-- Clé étrangère 
Lieu_event VARCHAR(150) NOT NULL, 
FOREIGN KEY (Lieu_event) REFERENCES Lieu_evenement(Lieu_event) 
ON UPDATE CASCADE  -- Gère automatiquement modification et suppression liés aux clés étrangère
ON DELETE CASCADE);

CREATE TABLE Incident( 
-- Attributs
Id_incident INT,
Description_incident VARCHAR(255) NOT NULL,
-- Clé primaire
PRIMARY KEY (Id_incident),
-- Clé étrangère
Id_event INT NOT NULL,
FOREIGN KEY (Id_event) REFERENCES Evenement(Id_event)
ON UPDATE CASCADE
ON DELETE CASCADE);

CREATE TABLE Inscription( 
-- Attributs
Id_inscription INT,
-- Clé primaire
PRIMARY KEY (Id_inscription),
-- Clé étrangères
Id_participant INT NOT NULL,
FOREIGN KEY (Id_participant) REFERENCES Participant(Id_participant)
ON UPDATE CASCADE
ON DELETE CASCADE,
Id_event INT NOT NULL,
FOREIGN KEY (Id_event) REFERENCES Evenement(Id_event)
ON UPDATE CASCADE
ON DELETE CASCADE);

CREATE TABLE Billet( 
-- Attributs
Id_billet INT,
Statut_billet VARCHAR(20),
-- Clé primaire
PRIMARY KEY (Id_billet),
UNIQUE (Id_inscription),
-- Clé étrangère
Id_inscription INT,
FOREIGN KEY (Id_inscription) REFERENCES Inscription(Id_inscription)
ON UPDATE CASCADE
ON DELETE CASCADE,
Nom_type VARCHAR(50) NOT NULL,
FOREIGN KEY (Nom_type) REFERENCES Type_billet(Nom_type)
ON UPDATE CASCADE
ON DELETE CASCADE);

CREATE TABLE Paiement( 
-- Attributs
Id_paiement INT,
Montant_paiement DECIMAL(8,2) NOT NULL,
Mode_paiement VARCHAR(30) NOT NULL,
Statut_paiement VARCHAR(20) NOT NULL,
Date_paiement DATE NOT NULL,
-- Clé primaire
PRIMARY KEY (Id_paiement),
UNIQUE (Id_inscription),
-- Clé étrangère
Id_inscription INT,
FOREIGN KEY (Id_inscription) REFERENCES Inscription(Id_inscription)
ON UPDATE CASCADE
ON DELETE CASCADE);

CREATE TABLE Organise( 
-- Attributs
Id_event INT,
Id_BDE INT,
-- Clé primaire
PRIMARY KEY (Id_event, Id_BDE),
-- Clé étrangère
FOREIGN KEY (Id_event) REFERENCES Evenement(Id_event)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (Id_BDE) REFERENCES BDE(Id_BDE)
ON UPDATE CASCADE
ON DELETE CASCADE);

CREATE TABLE Anime( 
-- Attributs
Id_event INT,
Id_DJ INT,
Cachet_DJ DECIMAL(10,2) NOT NULL,
-- Clé primaire
PRIMARY KEY (Id_event, Id_DJ),
-- Clé étrangère
FOREIGN KEY (Id_event) REFERENCES Evenement(Id_event)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (Id_DJ) REFERENCES DJ(Id_DJ)
ON UPDATE CASCADE
ON DELETE CASCADE);

CREATE TABLE Dispose_de(
-- Attributs
Id_event INT,
Id_fournisseur INT,
Id_boisson INT,
Quantite_livree INT NOT NULL,
-- Clé primaire
PRIMARY KEY (Id_event, Id_fournisseur, Id_boisson),
-- Clé étrangère
FOREIGN KEY (Id_event) REFERENCES Evenement(Id_event)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (Id_fournisseur) REFERENCES Fournisseur(Id_fournisseur)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (Id_boisson) REFERENCES Boisson(Id_boisson)
ON UPDATE CASCADE
ON DELETE CASCADE);

CREATE TABLE Implique_dans(
-- Attributs
Id_participant INT,
Id_incident INT,
-- Clé primaire
PRIMARY KEY (Id_participant, Id_incident),
-- Clé étrangère
FOREIGN KEY (Id_participant) REFERENCES Participant(Id_participant)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (Id_incident) REFERENCES Incident(Id_incident)
ON UPDATE CASCADE
ON DELETE CASCADE);

CREATE TABLE Collabore(
-- Attributs
Id_BDE INT NOT NULL,
Id_BDE_collaborateur INT,
-- Clé primaire
PRIMARY KEY (Id_BDE, Id_BDE_collaborateur),
FOREIGN KEY (Id_BDE) REFERENCES BDE(Id_BDE)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (Id_BDE_collaborateur) REFERENCES BDE(Id_BDE)
ON UPDATE CASCADE
ON DELETE CASCADE);