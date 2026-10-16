CREATE TABLE commandes (
    id SERIAL PRIMARY KEY,
    date_commande TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE commande_plat (
    id SERIAL PRIMARY KEY,
    id_commande INT REFERENCES commandes(id),
    id_plat INT REFERENCES plat(id),
    quantite INT NOT NULL
);

INSERT INTO commandes (date_commande) VALUES
('2026-06-01 12:00:00'),
('2026-06-02 18:30:00'),
('2026-06-03 14:15:00');

INSERT INTO commande_plat (id_commande, id_plat, quantite) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 3),
(2, 4, 1),
(3, 4, 1),
(3, 5, 2);
