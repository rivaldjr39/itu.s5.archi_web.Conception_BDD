CREATE TABLE paiements (
    id SERIAL PRIMARY KEY,
    date_paiement TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    montant INT NOT NULL
);

CREATE TABLE type_paiements (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE paiement_commande (
    id SERIAL PRIMARY KEY,
    id_paiement INT REFERENCES paiements(id),
    id_commande INT REFERENCES commandes(id),
    id_type_paiement INT REFERENCES type_paiements(id)
);

INSERT INTO type_paiements (nom) VALUES
('Espèces'),
('Mvola'),
('Orange Money'),
('Airtel Money');

INSERT INTO paiements (date_paiement, montant) VALUES
('2026-06-01 12:30:00', 10000),
('2026-06-02 19:00:00', 5000),
('2026-06-03 14:45:00', 6000);
 
INSERT INTO paiement_commande (id_paiement, id_commande, id_type_paiement) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3);

