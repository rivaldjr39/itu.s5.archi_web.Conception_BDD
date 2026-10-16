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
    id_unite INT NOT NULL REFERENCES unite_ingredient(id)
);

CREATE TABLE ingredients_plat (
    id SERIAL PRIMARY KEY,
    id_ingredient INT NOT NULL REFERENCES ingredients(id),
    id_plat INT NOT NULL REFERENCES plat(id),
    quantite INT NOT NULL CHECK (quantite > 0),
    id_unite INT NOT NULL REFERENCES unite_ingredient(id)
);