ALTER TABLE plat ADD type_plat VARCHAR(50) NOT NULL DEFAULT 'classique' CHECK
(type_plat IN ('classique','menu'));

CREATE TABLE menu_plat(
    id SERIAL PRIMARY KEY,
    id_menu INT NOT NULL REFERENCES plat(id),
    id_plat INT NOT NULL REFERENCES plat(id),
    quantite INT NOT NULL CHECK (quantite > 0),
    PRIMARY KEY(id_menu, id_plat),
    CHECK(id_menu != id_plat)
    
);

INSERT INTO categories(nom) VALUES
('Menu');   
INSERT INTO plat (nom, id_categories, type_plat) VALUES
('Menu Romazava', (SELECT id FROM categories WHERE nom='Menu'),'menu');

INSERT INTO prix(id_plat, prix, date_debut) VALUES
((SELECT id FROM plat WHERE nom='Menu Romazava'), 8000, '2026-06-01');

INSERT INTO menu_plat(id_menu, id_plat, quantite) VALUES
((SELECT id FROM plat WHERE nom='Menu Romazava'), (SELECT id FROM plat WHERE nom='Ranon apango'), 1),
((SELECT id FROM plat WHERE nom='Menu Romazava'), (SELECT id FROM plat WHERE nom='Mofo Gasy'), 1);