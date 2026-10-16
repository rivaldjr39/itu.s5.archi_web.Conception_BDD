CREATE TABLE carte (
    id SERIAL PRIMARY KEY,
    plat VARCHAR(100) NOT NULL,
    categorie VARCHAR(100) NOT NULL,
    prix INT NOT NULL
);


INSERT INTO carte (plat , categorie, prix) VALUES
('Romazava', 'Plat Malagasy ', 7000),
('Ravitoto sy heanakisoa', 'Plat Malagasy' , 8000),
('Akoho sy voanio', 'Plat Malagasy ', 8500),
('Misao', 'Plat Chinois' , 6000),
('Soupe Chinois', 'Soupe ', 5000),
('Mofo Gasy', 'dessert et gouter' , 1000),
('Ranon apango', 'Boisson', 500);



