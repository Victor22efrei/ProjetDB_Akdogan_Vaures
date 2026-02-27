                                                  ** README Selene Akdogan / Victor Vaures **

## Prompt :

Tu travailles dans le domaine de l’organisation professionnelle de soirées étudiantes et d’événements universitaires.
Ton entreprise a comme activité l’organisation et la gestion complète d’événements étudiants tels que des soirées d’intégration, galas, afterworks, soirées à thème et festivals inter-écoles.
C’est une entreprise événementielle privée comparable à des agences spécialisées dans l’événementiel étudiant comme Alliance Événement, Magnum Event ou Student Event Agency.
Les données ont été collectées à partir d’entretiens avec les organisateurs d’événements et de retours d’expérience issus de la gestion de bars étudiants et professionnels, de boîtes de nuit et de festivals universitaires.
Inspire-toi des sites web suivant :
- https://www.eventbrite.fr
- https://www.shotgun.live


Ton entreprise veut appliquer MERISE pour concevoir un système d'information. Tu es chargé de la partie analyse, c’est-à-dire de collecter les besoins auprès de l’entreprise. Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet, tu dois lui fournir les informations nécessaires pour qu’il applique ensuite lui-même les étapes suivantes de conception et développement de la base de données. L’étudiant ne s’y connait pas en soirée, donc tu ne dois pas utiliser de vocabulaire technique, éviter les redondances et assurer une cohérence logique.

D’abord, établis avec précision les règles de gestion des données de ton entreprise, sous la forme d'une liste à puce. Elle doit correspondre aux informations que fournit quelqu’un qui connaît le fonctionnement de l’entreprise, mais pas comment se construit un système d’information. Les cardinalités doivent être déductibles.

Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes, regroupées dans un tableau : signification de la donnée, type, taille en nombre de caractères ou de chiffres. La taille et le type doivent respecter les types donné dans Looping. Il doit y avoir entre 25 et 35 données. Il sert à fournir des informations supplémentaires sur chaque donnée (taille et type) mais sans a priori sur comment les données vont être modélisées ensuite.
Fournis donc les règles de gestion et le dictionnaire de données.



#

## Règles métiers :

- Chaque événement possède un identifiant unique.
- Un événement a un nom, une date, une heure de début et une heure de fin, un lieu, une capacité maximale et un statut (prévu, annulé, terminé).
- Chaque événement possède un budget prévisionnel fixé avant sa réalisation.
- Un événement peut être organisé en partenariat avec un ou plusieurs BDE.
- Un BDE peut participer à l’organisation de plusieurs événements.
- Des BDE peuvent collaborer entre eux pour organiser un même événement.
- Chaque participant doit être enregistré pour pouvoir s’inscrire à un événement.
- Un participant possède un identifiant unique, un nom, un prénom et un email.
- Un participant peut s’inscrire à plusieurs événements.
- Chaque inscription possède un identifiant unique.
- Une inscription est nominative et liée à un seul participant et un seul événement.
- Une inscription correspond à un seul billet.
- Une inscription peut être gratuite ou payante.
- Une inscription peut donner lieu à un paiement.
- Chaque billet possède un identifiant unique, une catégorie (standard, VIP, early…), un prix associé et un statut (valide, annulé, utilisé).
- Un billet est associé à une seule inscription, et donc à un seul événement.
- Un participant peut détenir plusieurs billets pour différents événements.
- Un paiement correspond à une seule inscription.
- Un paiement possède un montant, un mode (CB, espèces, virement), un statut (accepté, refusé, en attente) et une date de paiement.
- Un DJ peut être programmé pour un ou plusieurs événements.
- Un événement peut accueillir un ou plusieurs DJ.
- Chaque DJ possède un identifiant unique et un nom.
- Pour chaque prestation d’un DJ lors d’un événement, un cachet est défini et enregistré.
- Un fournisseur peut fournir plusieurs boissons.
- Une boisson peut être fournie par plusieurs fournisseurs.
- Chaque boisson possède un identifiant unique, un nom et un prix unitaire.
- Pour chaque relation entre un fournisseur, une boisson et un événement, la quantité livrée est enregistrée.
- Un événement peut être associé à zéro ou plusieurs incidents.
- Tout incident survenu pendant un événement doit être enregistré.
- Un incident est associé à un événement précis.
- Un incident peut impliquer un ou plusieurs participants.
- Chaque incident possède un identifiant unique et une description.

## 

## Dictionnaire de données :


| Signification de la donnée              | Type (Looping)   | Taille |

|----------------------------------------|------------------|--------|

| Identifiant événement                  | Entier           | 6      |

| Nom événement                          | Texte            | 100    |

| Date événement                         | Date             | —      |

| Heure début événement                  | Heure            | —      |

| Heure fin événement                    | Heure            | —      |

| Lieu événement                         | Texte            | 150    |

| Capacité maximale                      | Entier           | 5      |

| Statut événement                       | Texte            | 20     |

| Budget prévisionnel                    | Décimal (10,2)   | 10     |

| Identifiant BDE                        | Entier           | 5      |

| Nom BDE                                | Texte            | 100    |

| Identifiant participant                | Entier           | 6      |

| Nom participant                        | Texte            | 50     |

| Prénom participant                     | Texte            | 50     |

| Email participant                      | Texte            | 100    |

| Identifiant inscription                | Entier           | 6      |

| Identifiant billet                     | Entier           | 6      |

| Catégorie billet                       | Texte            | 50     |

| Prix billet                            | Décimal (8,2)    | 8      |

| Statut billet                          | Texte            | 20     |

| Identifiant paiement                   | Entier           | 6      |

| Montant paiement                       | Décimal (8,2)    | 8      |

| Mode paiement                          | Texte            | 30     |

| Statut paiement                        | Texte            | 20     |

| Date paiement                          | Date             | —      |

| Identifiant DJ                         | Entier           | 5      |

| Nom DJ                                 | Texte            | 100    |

| Cachet DJ (dans Anime)                 | Décimal (10,2)   | 10     |

| Identifiant fournisseur                | Entier           | 5      |

| Nom fournisseur                        | Texte            | 100    |

| Identifiant boisson                    | Entier           | 5      |

| Nom boisson                            | Texte            | 100    |

| Prix boisson                           | Décimal (8,2)    | 8      |

| Quantité livrée                        | Entier           | 6      |

| Identifiant incident                   | Entier           | 6      |

| Description incident                   | Texte            | 255    |

##

## Problèmes rencontrés et solutions apportées :

- Afin de respecter la 3ème forme normale (3FN), nous avons créé une entité Type_billet. En effet, le prix ne dépend pas directement du billet lui-même, mais de son type (standard, VIP, early, etc.). Conserver le prix dans l’entité Billet aurait créé une dépendance fonctionnelle indirecte, puisque plusieurs billets d’un même type auraient partagé le même prix. En isolant le type de billet dans une entité distincte, nous supprimons cette redondance et assurons que chaque attribut dépend uniquement de la clé primaire de son entité. Ainsi, Nom_type identifie le type de billet et détermine les autres attributs associés, notamment le prix.

- Le billet a été modélisé comme une entité faible dépendant de l’inscription, car il ne peut exister que si une inscription existe. Logiquement, chaque inscription correspond à un billet (1,1). Cependant, dans Looping, nous avons dû représenter la cardinalité en (0,1) pour des contraintes techniques de l’outil, même si dans les règles métier et le dictionnaire, l’existence du billet reste obligatoire. Cependant, nous avons estimé qu’il était plus cohérent de permettre qu’une inscription puisse ne pas générer de billet plutôt que d’autoriser plusieurs billets par inscription (1,n). Ce choix permet notamment d’enregistrer certains profils, comme les organisateurs ou intervenants, en tant que participants sans qu’un billet ne soit nécessaire.
## 

## MCD - Partie 1
![MCD](Loopingfinal.jpg)

