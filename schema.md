# Schema 
- plat (**id** , nom , prix , #id_categories) (modifier)
- categories (**id** , nom ) (nouveau)
- commandes(**id**, date_commande, #id_clent?, #id_serveur, #id_table)(modifier)
- commande_plat(**id**,**# id_commande**, **# id_plat** quantite) (nouveau)
- clients(**id**, nom, prenom, email, telephone) (nouveau)
- serveurs(**id**, nom, prenom, email, telephone)(nouveau)
- tables ( **id**, numero, capacite )(nouveau)