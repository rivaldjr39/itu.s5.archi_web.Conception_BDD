CREATE TABLE paiements (
    id SERIAL PRIMARY KEY,
    id_commande INT NOT NULL REFERENCES commandes(id),
    date_paiement TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    montant INT NOT NULL CHECK (montant > 0),
    mode_paiement VARCHAR(30) NOT NULL
        CHECK (mode_paiement IN (
            'Especes',
            'MVola',
            'Orange Money',
            'Airtel Money'
        )),
    reference_transaction VARCHAR(100)
);

INSERT INTO paiements (id_commande,montant,mode_paiement,reference_transaction) VALUES
(1, 10000, 'Especes', NULL),
(1, 5000, 'MVola', 'MVOLA20261016001'),
(2, 6000, 'Orange Money', 'OM20261016002');