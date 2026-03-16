Donner les requêtes d’insertion permettant de remplir la base de données dont le modèle relationnel est le suivant :

- **Fournisseur** = (`Id_fournisseur` **(PK)**, `Nom_fournisseur`)
- **DJ** = (`Id_DJ` **(PK)**, `Nom_DJ`)
- **BDE** = (`Id_BDE` **(PK)**, `Nom_BDE`)
- **Participant** = (`Id_participant` **(PK)**, `Nom_participant`, `Prenom_participant`, `Email_participant`)
- **Boisson** = (`Id_boisson` **(PK)**, `Nom_boisson`, `Prix_boisson`)
- **Type_billet** = (`Nom_type` **(PK)**, `Prix_billet_type`)
- **Lieu_evenement** = (`Lieu_event` **(PK)**, `Capacite_max_event`)
- **Evenement** = (`Id_event` **(PK)**, `Nom_event`, `Date_event`, `Heure_debut_event`, `Heure_fin_event`, `Statut_event`, `Budget_previsionnel_event`, `#Lieu_event` **(FK)**)
- **Incident** = (`Id_incident` **(PK)**, `Description_incident`, `#Id_event` **(FK)**)
- **Inscription** = (`Id_inscription` **(PK)**, `#Id_participant` **(FK)**, `#Id_event` **(FK)**)
- **Billet** = (`Id_billet` **(PK)**, `Statut_billet`, `#Id_inscription` **(FK)**, `#Nom_type` **(FK)**)
- **Paiement** = (`Id_paiement` **(PK)**, `Montant_paiement`, `Mode_paiement`, `Statut_paiement`, `Date_paiement`, `#Id_inscription` **(FK)**)
- **Organise** = (`#Id_event` **(FK)**, `#Id_BDE` **(FK)**, **PK**(`#Id_event`, `#Id_BDE`))
- **Anime** = (`#Id_event` **(FK)**, `#Id_DJ` **(FK)**, `Cachet_DJ`, **PK**(`#Id_event`, `#Id_DJ`))
- **Dispose_de** = (`#Id_event` **(FK)**, `#Id_fournisseur` **(FK)**, `#Id_boisson` **(FK)**, `Quantite_livree`, **PK**(`#Id_event`, `#Id_fournisseur`, `#Id_boisson`))
- **Implique_dans** = (`#Id_participant` **(FK)**, `#Id_incident` **(FK)**, **PK**(`#Id_participant`, `#Id_incident`))
- **Collabore** = (`#Id_BDE` **(FK)**, `#Id_BDE_collaborateur` **(FK)**, **PK**(`#Id_BDE`, `#Id_BDE_collaborateur`))

Les clés primaires correspondent aux attributs marqués **(PK)**.  
Les clés étrangères sont identifiées par le symbole `#`, marquées **(FK)**, et font référence aux clés primaires des autres relations.


Je souhaite environ :

- **8 lignes** pour `Fournisseur`
- **6 lignes** pour `DJ`
- **6 lignes** pour `BDE`
- **60 lignes** pour `Participant`
- **12 lignes** pour `Boisson`
- **4 lignes** pour `Type_billet`
- **8 lignes** pour `Lieu_evenement`
- **15 lignes** pour `Evenement`
- **12 lignes** pour `Incident`
- **80 lignes** pour `Inscription`
- **80 lignes** pour `Billet`
- **55 lignes** pour `Paiement`
- **25 lignes** pour `Organise`
- **20 lignes** pour `Anime`
- **40 lignes** pour `Dispose_de`
- **18 lignes** pour `Implique_dans`
- **8 lignes** pour `Collabore`


Je souhaite que certaines valeurs soient présentes :

- dans `Type_billet` : `Standard`, `VIP`, `Early`, `Staff`
- dans `BDE` : `BDE Efrei`
- dans `Lieu_evenement` : `Le Duplex Paris`, `Le Loft Métropolis Rungis`, `Campus Efrei Villejuif`


Les événements doivent être variés : **soirées d’intégration, galas, afterworks, soirées à thème et festivals inter-écoles**.

Le script doit respecter les contraintes suivantes :

- `Statut_event` doit prendre uniquement les valeurs : `prevu`, `annule` ou `termine`
- `Statut_billet` doit prendre uniquement les valeurs : `valide`, `annule` ou `utilise`
- `Mode_paiement` doit prendre uniquement les valeurs : `CB`, `especes` ou `virement`
- `Statut_paiement` doit prendre uniquement les valeurs : `accepte`, `refuse` ou `en_attente`
- les montants, prix, budgets et cachets doivent être **positifs ou nuls**
- `Quantite_livree` doit être **strictement positive**
- `Heure_fin_event` doit être **postérieure** à `Heure_debut_event`
- `Email_participant` doit être **unique**
- un participant ne peut pas avoir **plusieurs inscriptions pour un même événement**
- chaque inscription correspond à **un seul billet**
- chaque inscription peut avoir **au plus un paiement**


Les clés étrangères doivent faire référence à des clés primaires existantes. Donner les lignes en commençant par remplir les tables dans lesquelles il n’y a pas de clés étrangères, puis les tables dans lesquelles les clés étrangères font référence à des clés primaires déjà remplies.
Fournir l’ensemble sous la forme d’un **script SQL prêt à être exécuté**.










