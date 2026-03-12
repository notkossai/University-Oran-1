% Faits 
 % [homme]
  homme(omar). homme(said). homme(fethi). homme(adam).

 % [femme]
  femme(leila). femme(samira). femme(imene). femme(maria).

 % [fruit]
  fruit(pommes). fruit(oranges). fruit(tomate).

 % [legumes]
  legumes(carrotes). legumes(épinard).

 % [soda]
  soda(coca). soda(fonta). soda(pepsi).

 % [tabac]
  tabac(cigarette). tabac(chicha). tabac(cigarette_elct). tabac(cigare).

 % [aime]
  aime(adam, pommes).
  aime(omar, cigarette). aime(omar, cigare). aime(omar, fanta). aime(omar, pommes).
  aime(samira, coca). aime(samira, oranges). aime(samira, cigarette_elct).
  aime(said, oranges). aime(said, chicha).
  aime(leila, tomate). aime(leila, carrotes). aime(leila, épinard).
  aime(imene, pommes). aime(imene, carrotes). aime(imene, épinard).
  aime(maria, fanta). aime(maria, chicha).
  aime(fethi, pepsi). aime(fethi, coca). aime(fethi, cigarette).


% Règles
 % [bonne_sante()]
  bonne_sante(X) :- 
     aime(X, Y),
     (fruit(Y); legumes(Y)),
     !.    % Arrête la recherche une fois trouvé une solution

 % [mauvaise_sante()]
  mauvaise_sante(X) :- 
     aime(X, Y),
     (soda(Y); tabac(Y)),
     !.


% Requêtes
 /* Quels sont les légumes ?
  ?- legume(X).*/

 /* Quels sont les types de tabac ?
  ?- tabac(X).*/

 /* Que aime « fethi » ?
  ?- aime(fethi, X).*/

 /* Que aime « Samira » ?
  ?- aime(samira, X).*/
 
 /* Que aime « leila » ?
  ?- aime(leila, X).*/

 /* Quels personnes aiment les carottes ?
  ?- aime(X, carottes).*/

 /* Quels sont les personnes en mauvaise santé ?
  ?- mauvaise_sante(X).*/

 /* Quels sont les personnes en bonne santé ?
  ?- bonne_sante(X).*/
