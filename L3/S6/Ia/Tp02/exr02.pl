% successeur d'un nombre
 a_pour_successeur(X,Y):- Y is X + 1.

% somme de deux nombres
 somme(X,Y,S):- S is X + Y.

% maximum entre deux nombres 
 max2(X,Y,X):- X >= Y.
 max2(X,Y,Y):- Y > X.
