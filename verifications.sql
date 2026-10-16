-- Je veux la liste de mes plat avec leur prix 
SELECT nom  , prix FROM plat ORDER BY PRIX DESC;

--Je range mes plats par catégorie : plats malagasy, plats chinois, soupes, desserts, boissons
SELECT p.nom, p.prix, c.nom AS categorie
FROM plat p
JOIN categories c ON p.id_categories = c.id
ORDER BY c.nom, p.prix DESC;

--montant total de chaque commande
SELECT c.id AS commande_id, SUM(p.prix * cp.quantite) AS montant_total
FROM commandes c
JOIN commande_plat cp ON c.id = cp.id_commande
JOIN plat p ON cp.id_plat = p.id
GROUP BY c.id
ORDER BY c.id ASC;  