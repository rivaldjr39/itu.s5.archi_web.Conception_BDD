CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

INSERT INTO categories (nom) VALUES
('Plat Malagasy '),
('Plat Chinois'),
('Soupe '),
('dessert et gouter'),
('Boisson');

ALTER TABLE plat ADD id_categories INT REFERENCES categories(id);
UPDATE plat SET id_categories = 1 WHERE categorie = 'Plat Malagasy ';
UPDATE plat SET id_categories = 2 WHERE categorie = 'Plat Chinois';
UPDATE plat SET id_categories = 3 WHERE categorie = 'Soupe ';
UPDATE plat SET id_categories = 4 WHERE categorie = 'dessert et gouter';
UPDATE plat SET id_categories = 5 WHERE categorie = 'Boisson';

ALTER TABLE plat DROP COLUMN categorie;