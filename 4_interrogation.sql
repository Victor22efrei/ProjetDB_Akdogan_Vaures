USE gestion_evenements;

-- 1 Obtenir les événements prévus, triés par date croissante
SELECT Id_event, Nom_event, Date_event, Heure_debut_event, Heure_fin_event
FROM Evenement
WHERE Statut_event = 'prevu'
ORDER BY Date_event ASC;

-- 2 Obtenir les événements dont le budget est compris entre 5000 et 20000
SELECT Id_event, Nom_event, Budget_previsionnel_event
FROM Evenement
WHERE Budget_previsionnel_event BETWEEN 5000 AND 20000
ORDER BY Budget_previsionnel_event DESC;

-- 3 Le ou les événements avec le plus d’inscriptions
SELECT E.Nom_event, COUNT(I.Id_inscription) AS nombre_inscriptions
FROM Evenement E
JOIN Inscription I ON E.Id_event = I.Id_event
GROUP BY E.Id_event, E.Nom_event
HAVING COUNT(I.Id_inscription) >= ALL (
    SELECT COUNT(I2.Id_inscription)
    FROM Inscription I2
    GROUP BY I2.Id_event
)
ORDER BY nombre_inscriptions DESC;

-- 4 Compter le nombre d’inscriptions par événement
SELECT Id_event, COUNT(*) AS nombre_inscriptions
FROM Inscription
GROUP BY Id_event;

-- 5 Afficher les événements ayant plus de 2 inscriptions
SELECT Id_event, COUNT(*) AS nombre_inscriptions
FROM Inscription
GROUP BY Id_event
HAVING COUNT(*) > 2;

-- 6 Obtenir les événements n’ayant aucun incident
SELECT Nom_event
FROM Evenement
WHERE Id_event NOT IN (
    SELECT Id_event
    FROM Incident
);

-- 7 Nombre de paiements par CB et par virement pour un événement précis
SELECT Pa.Mode_paiement, COUNT(*) AS nombre_paiements
FROM Paiement Pa
JOIN Inscription I ON Pa.Id_inscription = I.Id_inscription
JOIN Evenement E ON I.Id_event = E.Id_event
WHERE E.Id_event = 5
AND Pa.Mode_paiement IN ('CB', 'virement')
GROUP BY Pa.Mode_paiement;

-- 8 Calculer le prix moyen des boissons par fournisseur
SELECT D.Id_fournisseur, AVG(B.Prix_boisson) AS prix_moyen_boissons
FROM Dispose_de D
JOIN Boisson B ON D.Id_boisson = B.Id_boisson
GROUP BY D.Id_fournisseur;

-- 9 Afficher les DJ dont le cachet moyen est inférieur à 4000
SELECT Id_DJ, AVG(Cachet_DJ) AS cachet_moyen
FROM Anime
GROUP BY Id_DJ
HAVING AVG(Cachet_DJ) < 4000;

-- 10 Boissons commandées pour un événement donné
SELECT E.Nom_event, F.Nom_fournisseur, B.Nom_boisson, D.Quantite_livree
FROM Dispose_de D
JOIN Evenement E ON D.Id_event = E.Id_event
JOIN Fournisseur F ON D.Id_fournisseur = F.Id_fournisseur
JOIN Boisson B ON D.Id_boisson = B.Id_boisson
WHERE E.Nom_event = 'Soiree Halloween';

-- 11 Participants à un événement avec leur mail
SELECT P.Nom_participant, P.Prenom_participant, P.Email_participant
FROM Participant P
JOIN Inscription I ON P.Id_participant = I.Id_participant
JOIN Evenement E ON I.Id_event = E.Id_event
WHERE E.Id_event = 5;

-- 12 Le jour où les gens achètent le plus de billets pour un événement
SELECT Date_paiement, COUNT(*) AS nombre_achats
FROM Paiement P
JOIN Inscription I ON P.Id_inscription = I.Id_inscription
WHERE I.Id_event = 5
GROUP BY Date_paiement
HAVING COUNT(*) >= ALL (
    SELECT COUNT(*)
    FROM Paiement P2
    JOIN Inscription I2 ON P2.Id_inscription = I2.Id_inscription
    WHERE I2.Id_event = 5
    GROUP BY P2.Date_paiement
);

-- 13 Vérifier qu’un participant d’un événement n’est impliqué dans aucun incident
SELECT P.Nom_participant, P.Prenom_participant
FROM Participant P
JOIN Inscription I ON P.Id_participant = I.Id_participant
WHERE I.Id_event = 5
AND NOT EXISTS (
    SELECT 1
    FROM Implique_dans IDA
    JOIN Incident Inc ON IDA.Id_incident = Inc.Id_incident
    WHERE IDA.Id_participant = P.Id_participant
);

-- 14 Vérifier si un étudiant précis était inscrit à un événement
SELECT Nom_participant, Prenom_participant
FROM Participant P
WHERE P.Nom_participant = 'Moreau'
AND EXISTS (
    SELECT 1
    FROM Inscription I
    WHERE I.Id_participant = P.Id_participant
    AND I.Id_event = 5
);



