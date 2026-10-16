# Reponse 
## etape 1:
- piege 1: pour le prix : je choisis **INT** 
  
- iege 2: identifiant choisit : **SERRIAL**

## etape 2:
- on n'ajoute pas simplement une colonne **categorie VARCHAR(50)** dans le table plat car on ne peut pas distingeur le plat par categorie plus tard 
  
- exemple: un user insert de nouveau gategorie dans le tabale plat et il ne voit pas mais son insertion contient le moindre espace sur le requete sql puis on ne trouve pas cette categorie apres ("Plat Malagasy" et "Plat Malagasy ")

## etape 3:
- on place la quantite dans la table de liaison (commande_plat)

## etape 4: 
- Mon cle etrangere n'est pas **NOT NULL**
- on fait la jointure **LEFT JOIN**
  
## etape 5: 
- le nom table pose probleme car "table" est une requete en sql 
  
