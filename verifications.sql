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

--iste des commandes non soldées avec le montant dû, le montant payé et le reste à payer.
SELECT
    c.id AS id_commande,
    COALESCE(total_commande.montant_total, 0) AS montant_total,
    COALESCE(total_paiement.montant_paye, 0) AS montant_paye,
    COALESCE(total_commande.montant_total, 0)
        - COALESCE(total_paiement.montant_paye, 0) AS reste_a_payer
FROM commandes c

LEFT JOIN (
    SELECT cp.id_commande,SUM(cp.quantite * p.prix) AS montant_total
    FROM commande_plat cp
    JOIN plat p ON p.id = cp.id_plat
    GROUP BY cp.id_commande
) total_commande
    ON total_commande.id_commande = c.id

LEFT JOIN (
    SELECT id_commande,SUM(montant) AS montant_paye
    FROM paiements
    GROUP BY id_commande
) total_paiement
    ON total_paiement.id_commande = c.id

WHERE
    COALESCE(total_paiement.montant_paye, 0) < COALESCE(total_commande.montant_total, 0)

ORDER BY c.id;


--consommation théorique de chaque ingrédient pour la journée du 12 octobre.
SELECT
    i.nom AS ingredient,
    u.libelle AS unite,
    SUM(ip.quantite * cp.quantite) AS consommation_theorique
FROM commande_plat cp
JOIN plat p ON p.id = cp.id_plat
JOIN ingredients_plat ip ON ip.id_plat = p.id
JOIN ingredients i ON i.id = ip.id_ingredient
JOIN unite_ingredient u ON u.id = 1
JOIN commandes c ON c.id = cp.id_commande
WHERE c.date_commande >= TIMESTAMP '2026-10-12 00:00:00'
  AND c.date_commande < TIMESTAMP '2026-10-13 00:00:00'
  AND ip.date_utilisation = DATE '2026-10-12'
GROUP BY i.id, i.nom, u.libelle
ORDER BY i.nom;


--Vérification : pour chaque menu, son prix, la somme des prix à la carte et l'économie réalisée par le client.
SELECT
    m.nom AS menu,
    m_prix.prix AS prix_menu,
    SUM(p_prix.prix * mp.quantite) AS prix_a_la_carte,
    (SUM(p_prix.prix * mp.quantite) - m_prix.prix) AS economie_realisee
FROM plat m
JOIN menu_plat mp ON mp.id_menu = m.id
JOIN plat p ON p.id = mp.id_plat
JOIN prix m_prix ON m_prix.id_plat = m.id
JOIN prix p_prix ON p_prix.id_plat = p.id
WHERE m.type_plat = 'menu'
GROUP BY m.id, m.nom, m_prix.prix
ORDER BY m.nom; 