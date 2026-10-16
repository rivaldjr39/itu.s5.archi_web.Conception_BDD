-- Je veux la liste de mes plat avec leur prix 
SELECT nom  , prix FROM plat ORDER BY PRIX DESC;

 compris les catégories sans plat
SELECT c.nom AS categorie, COUNT(p.id) AS nombre_de_plats
FROM categories c
LEFT JOIN plat p ON c.id = p.id_categories
GROUP BY c.nom
ORDER BY nombre_de_plats DESC;

--montant total de chaque commande
SELECT c.id AS commande_id, SUM(p.prix * cp.quantite) AS montant_total
FROM commandes c
JOIN commande_plat cp ON c.id = cp.id_commande
JOIN plat p ON cp.id_plat = p.id
GROUP BY c.id
ORDER BY c.id;  

--liste des commandes avec le nom du client, en affichant « client de passage » quand il n'y en a pas
SELECT c.id AS commande_id, COALESCE(cl.nom || ' ' || cl.prenom, 'client de passage') AS client_nom
FROM commandes c
LEFT JOIN clients cl ON c.id_client = cl.id
ORDER BY c.id;

--nombre de commandes et chiffre d'affaires par serveur
SELECT s.id AS serveur_id, COUNT(c.id) AS nombre_de_commandes, SUM(p.prix * cp.quantite) AS chiffre_affaires
FROM serveurs s
LEFT JOIN commandes c 
ON s.id = c.id_serveur
LEFT JOIN commande_plat cp 
ON c.id = cp.id_commande
LEFT JOIN plat p 
ON cp.id_plat = p.id
GROUP BY s.id
ORDER BY chiffre_affaires DESC;