CREATE TABLE clients(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telephone VARCHAR(15) NOT NULL
);
INSERT INTO clients (nom, prenom, email, telephone) VALUES
('Rakoto', 'Jean', 'jean.rakoto@example.com', '034 12 345 67'),
('Rabe', 'Marie', 'marie.rabe@example.com', '034 12 345 68'),
('Andrianarisoa', 'Hery', 'hery.andrianarisoa@example.com', '034 12 345 69');

ALTER TABLE commandes ADD COLUMN id_client INT REFERENCES clients(id);
UPDATE commandes SET id_client = 1 WHERE id = 1;
UPDATE commandes SET id_client = 2 WHERE id = 2;
UPDATE commandes SET id_client = 3 WHERE id = 3;


