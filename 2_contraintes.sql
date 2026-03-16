USE gestion_evenements;


-- Vérification simple du format de l'email
ALTER TABLE Participant
ADD CONSTRAINT ck_participant_email_format
CHECK (Email_participant LIKE '%@%.%');

-- Valeurs autorisées pour le statut d'un événement
ALTER TABLE Evenement
ADD CONSTRAINT ck_evenement_statut
CHECK (Statut_event IN ('prevu', 'annule', 'termine'));


-- Horaires
ALTER TABLE Evenement
ADD CONSTRAINT ck_evenement_heures
CHECK (
    Heure_fin_event > Heure_debut_event
    OR Heure_fin_event < Heure_debut_event
);


-- Le budget prévisionnel ne peut pas être négatif
ALTER TABLE Evenement
ADD CONSTRAINT ck_evenement_budget
CHECK (Budget_previsionnel_event >= 0);


-- La capacité maximale d'un lieu doit être strictement positive
ALTER TABLE Lieu_evenement
ADD CONSTRAINT ck_lieu_capacite
CHECK (Capacite_max_event > 0);

-- Valeurs autorisées pour le statut d'un billet
ALTER TABLE Billet
ADD CONSTRAINT ck_billet_statut
CHECK (Statut_billet IN ('valide', 'annule', 'utilise'));

-- Le prix d'un type de billet ne peut pas être négatif
ALTER TABLE Type_billet
ADD CONSTRAINT ck_type_billet_prix
CHECK (Prix_billet_type >= 0);

-- Le montant d'un paiement ne peut pas être négatif
ALTER TABLE Paiement
ADD CONSTRAINT ck_paiement_montant
CHECK (Montant_paiement >= 0);

-- Valeurs autorisées pour le mode de paiement
ALTER TABLE Paiement
ADD CONSTRAINT ck_paiement_mode
CHECK (Mode_paiement IN ('CB', 'especes', 'virement'));


-- Valeurs autorisées pour le statut du paiement
ALTER TABLE Paiement
ADD CONSTRAINT ck_paiement_statut
CHECK (Statut_paiement IN ('accepte', 'refuse', 'en_attente'));

-- Le prix d'une boisson ne peut pas être négatif
ALTER TABLE Boisson
ADD CONSTRAINT ck_boisson_prix
CHECK (Prix_boisson >= 0);

-- Le cachet d'un DJ ne peut pas être négatif
ALTER TABLE Anime
ADD CONSTRAINT ck_anime_cachet
CHECK (Cachet_DJ >= 0);

-- La quantité livrée doit être strictement positive
ALTER TABLE Dispose_de
ADD CONSTRAINT ck_dispose_quantite
CHECK (Quantite_livree > 0);

ALTER TABLE Evenement
DROP CONSTRAINT ck_evenement_heures;




