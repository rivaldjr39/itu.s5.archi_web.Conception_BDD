CREATE TABLE prix (
    id SERIAL PRIMARY KEY,
    id_plat INT NOT NULL REFERENCES plat(id),
    prix NUMERIC(10, 2) NOT NULL CHECK (prix > 0),
    date_debut TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO prix (id_plat, prix) VALUES
(1, (SELECT prix FROM plat WHERE id = 1)),
(2, (SELECT prix FROM plat WHERE id = 2)),
(3, (SELECT prix FROM plat WHERE id = 3)),
(4, (SELECT prix FROM plat WHERE id = 4)),
(5, (SELECT prix FROM plat WHERE id = 5)),
(6, (SELECT prix FROM plat WHERE id = 6)),
(7, (SELECT prix FROM plat WHERE id = 7));


ALTER TABLE plat DROP COLUMN prix;


INSERT  into  prix(id_plat, prix) VALUES
(1, 7500);

ALTER TABLE commandes ADD COLUMN montant_total NUMERIC(10, 2) DEFAULT 0;
UPDATE commandes SET montant_total = (
    SELECT SUM(prix.prix * commande_plat.quantite)
    FROM commande_plat
    JOIN prix ON commande_plat.id_plat = prix.id_plat
    WHERE commande_plat.id_commande = commandes.id
);
