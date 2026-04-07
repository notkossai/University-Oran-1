% afficher les nombres de N à 1
val_aff(0).
val_aff(N):- N > 0, write(N), nl, N1 is N - 1, val_aff(N1).

% afficher les nombres de 1 à N
val_sup(1):- write(1), nl.
val_sup(N):- N > 1, N1 is N - 1, val_sup(N1),  write(N), nl.

% afficher "bonjour" N fois 
ecrit(0).
ecrit(N):- N > 0, write('bonjour'), nl, N1 is N -1, ecrit(N1).

% Ce programme affiche les nombres de N à 1
% val_aff(5) afficher: 5 4 3 2 1

