-- Je veux la liste de mes plat avec leur prix 
SELECT nom  , prix FROM plat ORDER BY PRIX DESC;

--Je range mes plats par catégorie : plats malagasy, plats chinois, soupes, desserts, boissons
SELECT p.nom, p.prix, c.nom AS categorie
FROM plat p
JOIN categories c ON p.id_categories = c.id
ORDER BY c.nom, p.prix DESC;