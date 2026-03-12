% Faits
 % [homme]
 homme(mostafa). homme(ilyes). homme(samir).

 % [femme]
 femme(sara).

 % [enfant]
 enfant(norhane).

 % [aime]
 aime(samir, tom_jerry).
 aime(mostafa, sara).
 aime(ilyes, sara). aime(ilyes, norhane).


% Règles
 % [adorable()] 
adorable(X) :- 
   aime(_, X),
   (homme(X); femme(X); enfant(X)),
   !.


% Requêtes
 /* Que fait la commande listing(homme) ?
  Affiché tous les faits concernant homme */

 /* Toutes les personnes aimées par ilyes ? 
  ?- listing(aime(ilyes, X)). | aime(ilyes, X). */

 /* mostafa aime quelqu’un? (sans l'afficher)
  ?- aime(mostafa, _). */

