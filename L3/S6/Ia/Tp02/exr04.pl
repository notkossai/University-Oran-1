% calcul la somme des N premiers entiers
som(0,0).
som(N,S):- N > 0, N1 is N-1, som(N1,S1), S is S1 + N.

% calcul le factorielle 
fact(0,1).
fact(N,F):- N > 0, N1 is N-1, fact(N1,F1), F is N * F1.

% vérifie si un nombre est pair
nbre_p(0).
nbre_p(X):- X > 0, X1 is X-2, nbre_p(X1).

% vérifie si un nombre est impair
nbre_imp(1).
nbre_imp(X):- X > 1, X1 is X-2, nbre_imp(X1).

