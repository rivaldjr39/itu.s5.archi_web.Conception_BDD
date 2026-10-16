CREATE TABLE serveurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telephone VARCHAR(15) NOT NULL
);
INSERT INTO serveurs (nom, prenom, email, telephone) VALUES
('Njaka', 'Rakoto', 'rakoto.njaka@example.com', '034 12 345 70'),
('Lalao', 'Rasoa', 'rasoa.lalao@example.com', '034 12 345 71');

CREATE TABLE tables (
    id SERIAL PRIMARY KEY,
    numero INT NOT NULL UNIQUE,
    capacite INT NOT NULL
);
INSERT INTO tables (numero, capacite) VALUES
(1, 4),
(2, 6),
(3, 2),
(4, 8),
(5, 4),
(6, 2),
(7, 6),
(8, 4);

ALTER TABLE commandes ADD COLUMN id_serveur INT REFERENCES serveurs(id);
ALTER TABLE commandes ADD COLUMN id_table INT REFERENCES tables(id);
UPDATE commandes SET id_serveur = 1, id_table = 1 WHERE id = 1;
UPDATE commandes SET id_serveur = 2, id_table = 2 WHERE id = 2;
UPDATE commandes SET id_serveur = 1, id_table = 3 WHERE id = 3;
UPDATE commandes SET id_serveur = 2, id_table = 4 WHERE id = 4;
