USE gestion_evenements;

INSERT INTO Fournisseur VALUES
(1,'Metro'),
(2,'Carrefour Pro'),
(3,'France Boissons'),
(4,'Coca Cola Company'),
(5,'RedBull France'),
(6,'PepsiCo'),
(7,'Heineken Distribution'),
(8,'Auchan Pro');


INSERT INTO DJ VALUES
(1,'DJ Snake'),
(2,'Martin Garrix'),
(3,'David Guetta'),
(4,'DJ Kungs'),
(5,'DJ Feder'),
(6,'DJ Bob Sinclar');

INSERT INTO BDE VALUES
(1,'BDE Efrei'),
(2,'BDE CyTech'),
(3,'BDE Epita'),
(4,'BDE ESIEA'),
(5,'BDE CentraleSupelec'),
(6,'BDE Polytech');

INSERT INTO Type_billet VALUES
('Standard',20.00),
('VIP',50.00),
('Early',10.00),
('Staff',0.00);

INSERT INTO Boisson VALUES
(1,'Coca-Cola',2.50),
(2,'Eau minerale',1.50),
(3,'Jus orange',3.00),
(4,'Red Bull',4.50),
(5,'Ice Tea',2.80),
(6,'Sprite',2.50),
(7,'Fanta',2.50),
(8,'Vodka',7.50),
(9,'Bière',4.50),
(10,'Schweppes',3.20),
(11,'Malibu',8.50),
(12,'San Pellegrino',3.50);

INSERT INTO Lieu_evenement VALUES
('Le Duplex Paris',800),
('Le Loft Metropolis Rungis',1000),
('Campus Efrei Villejuif',500),
('La Machine du Moulin Rouge',700),
('Le Trabendo',450),
('Batofar',350),
('Dock B Paris',900),
('Le Chalet du Lac',650);


INSERT INTO Participant VALUES
(1,'Martin','Nelly','nelly.martin@mail.com'),
(2,'Vih','Théo','théo.vih@mail.com'),
(3,'Vih','Andréa','andréa.vih@mail.com'),
(4,'Petit','Ezda','ezda.petit@mail.com'),
(5,'Petit','Victor','victor.petit@mail.com'),
(6,'Richard','Chloe','chloe.richard@mail.com'),
(7,'Garcia','Tom','tom.garcia@mail.com'),
(8,'Moreau','Lina','lina.moreau@mail.com'),
(9,'Fournier','Leo','leo.fournier@mail.com'),
(10,'Girard','Anna','anna.girard@mail.com');

INSERT INTO Evenement VALUES
(1,'Soiree Integration', '2026-09-20','20:00','03:00','prevu',15000,'Le Duplex Paris'),
(2,'Gala Annuel', '2026-11-10','19:00','02:00','prevu',20000,'Dock B Paris'),
(3,'Afterwork BDE', '2026-10-05','18:00','23:00','prevu',5000,'Le Trabendo'),
(4,'Festival Interecoles', '2026-06-15','16:00','02:00','prevu',30000,'Campus Efrei Villejuif'),
(5,'Soiree Halloween', '2025-10-31','21:00','04:00','termine',12000,'La Machine du Moulin Rouge');


INSERT INTO Incident VALUES
(1,'Bagarre entre participants',1),
(2,'Probleme technique sono',2),
(3,'Malaise participant',3),
(4,'Vol de sac',1);

INSERT INTO Inscription VALUES
(1,1,1),
(2,2,1),
(3,3,2),
(4,4,2),
(5,5,3),
(6,6,3),
(7,7,4),
(8,8,5),
(9,9,5),
(10,10,5);

INSERT INTO Billet VALUES
(1,'valide',1,'Standard'),
(2,'valide',2,'VIP'),
(3,'valide',3,'Standard'),
(4,'valide',4,'Early'),
(5,'valide',5,'Standard'),
(6,'valide',6,'VIP'),
(7,'valide',7,'Standard'),
(8,'valide',8,'Early'),
(9,'valide',9,'Standard'),
(10,'valide',10,'VIP');




INSERT INTO Paiement VALUES
(1,20.00,'CB','accepte','2026-09-01',1),
(2,50.00,'CB','accepte','2026-09-02',2),
(3,20.00,'virement','accepte','2026-09-05',3),
(4,10.00,'CB','accepte','2026-09-05',4),
(5,20.00,'especes','accepte','2026-09-07',5),
(6,10.00,'CB','accepte','2025-10-25',8),
(7,20.00,'CB','accepte','2025-10-26',9),
(8,50.00,'virement','accepte','2025-10-26',10);

INSERT INTO Organise VALUES
(1,1),
(1,2),
(2,1),
(3,3),
(4,1),
(5,2);

INSERT INTO Anime VALUES
(1,1,5000),
(2,3,8000),
(3,4,3000),
(4,2,7000),
(5,5,4000);

INSERT INTO Dispose_de VALUES
(1,1,1,200),
(1,1,4,100),
(2,2,1,300),
(2,3,3,150),
(3,4,2,100),
(4,5,4,200),
(5,6,5,120);

INSERT INTO Implique_dans VALUES
(1,1),
(2,1),
(3,2),
(4,3),
(5,4);


INSERT INTO Collabore VALUES
(1,2),
(1,3),
(2,4),
(3,5),
(4,6);







