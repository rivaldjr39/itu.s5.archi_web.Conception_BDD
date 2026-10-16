CREATE TABLE ingredients (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE unite_ingredient(
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL
);

CREATE TABLE stock_ingredient (
    id SERIAL PRIMARY KEY,
    id_ingredient INT NOT NULL REFERENCES ingredients(id),
    quantite INT NOT NULL CHECK (quantite >= 0),
    id_unite INT NOT NULL REFERENCES unite_ingredient(id),
    date_peremption DATE NOT NULL
);

CREATE TABLE ingredients_plat (
    id SERIAL PRIMARY KEY,
    id_ingredient INT NOT NULL REFERENCES ingredients(id),
    id_plat INT NOT NULL REFERENCES plat(id),
    quantite INT NOT NULL CHECK (quantite > 0),
    date_utilisation DATE NOT NULL
    
);

INSERT INTO ingredients (nom) VALUES 
('Riz'),
('Bredes'),
('Viande de zebu'),
('Oignon'),
('Ail'),
('Tomate'),
('Poivron'),
('Carotte'),
('Courgette'),
('Pomme de terre'),
('Haricot'),
('Lentille'),
('Pois chiche'),
('Pâtes'),
('Poulet'),
('Boeuf'),
('Porc'),
('Poisson'),
('Crevette'),
('Laitue'),
('Épinard'),
('Chou-fleur'),
('Brocoli'),
('Champignon'),
('Fromage');

INSERT INTO unite_ingredient (libelle) VALUES 
('grammes'),
('kilogrammes'),
('litres'),
('millilitres'),
('pièces'),
('tasses'),
('cuillères à soupe'),
('cuillères à café');


INSERT INTO stock_ingredient (id_ingredient, quantite, id_unite, date_peremption) VALUES 
(1, 500, 1, '2026-10-12'),
(2, 200, 1, '2026-10-12'),
(3, 1000, 1, '2026-11-15'),
(4, 50, 5, '2026-10-20'),CREATE TABLE ingredients (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE unite_ingredient(
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL
);

CREATE TABLE stock_ingredient (
    id SERIAL PRIMARY KEY,
    id_ingredient INT NOT NULL REFERENCES ingredients(id),
    quantite INT NOT NULL CHECK (quantite >= 0),
    id_unite INT NOT NULL REFERENCES unite_ingredient(id),
    date_peremption DATE NOT NULL
);

CREATE TABLE ingredients_plat (
    id SERIAL PRIMARY KEY,
    id_ingredient INT NOT NULL REFERENCES ingredients(id),
    id_plat INT NOT NULL REFERENCES plat(id),
    quantite INT NOT NULL CHECK (quantite > 0),
    date_utilisation DATE NOT NULL
    
);

INSERT INTO ingredients (nom) VALUES 
('Riz'),
('Bredes'),
('Viande de zebu'),
('Oignon'),
('Ail'),
('Tomate'),
('Poivron'),
('Carotte'),
('Courgette'),
('Pomme de terre'),
('Haricot'),
('Lentille'),
('Pois chiche'),
('Pâtes'),
('Poulet'),
('Boeuf'),
('Porc'),
('Poisson'),
('Crevette'),
('Laitue'),
('Épinard'),
('Chou-fleur'),
('Brocoli'),
('Champignon'),
('Fromage');

INSERT INTO unite_ingredient (libelle) VALUES 
('grammes'),
('kilogrammes'),
('litres'),
('millilitres'),
('pièces'),
('tasses'),
('cuillères à soupe'),
('cuillères à café');


INSERT INTO stock_ingredient (id_ingredient, quantite, id_unite, date_peremption) VALUES 
(1, 500, 1, '2026-10-12'),
(2, 200, 1, '2026-10-12'),
(3, 1000, 1, '2026-11-15'),
(4, 50, 5, '2026-10-20'),
(5, 30, 5, '2026-10-25'),
(6, 100, 1, '2026-12-15'),
(7, 80, 1, '2026-11-10'),
(8, 60, 1, '2026-12-05'),
(9, 70, 1, '2026-11-20'),
(10, 90, 1, '2026-12-01');

INSERT INTO ingredients_plat (id_ingredient, id_plat, quantite, date_utilisation) VALUES 
(1, 1, 250, '2026-10-12'),
(2, 1, 100, '2026-10-12'),
(3, 1, 150, '2026-10-12'),
(4, 2, 20, '2026-10-20'),
(5, 2, 10, '2026-10-20'),
(6, 3, 40, '2026-11-01'),
(7, 3, 30, '2026-11-01'),
(8, 4, 25, '2026-11-05'),
(9, 4, 35, '2026-11-05'),
(10, 5, 45, '2026-11-10');

