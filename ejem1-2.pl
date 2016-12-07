hombre(javier).
hombre(pedro).
hombre(jorge).
hombre(alfonso).
hombre(juan).
mujer(maria).
mujer(carmen).
mujer(teresa).
mujer(alicia).
progenitor(javier,pedro).
progenitor(javier,teresa).
progenitor(jorge,alicia).
progenitor(maria,pedro).
progenitor(maria,teresa).
progenitor(pedro,alfonso).
progenitor(pedro,juan).
progenitor(carmen,juan).
progenitor(carmen,alfonso).
progenitor(teresa,alicia).
padre(X,Y):- progenitor(X,Y), hombre(X).
madre(X,Y):- progenitor(X,Y), mujer(X).

hijo(X,Y) :- progenitor(Y,X).
abuelo(X,Y) :- padre(X,Z),progenitor(Z,Y).
hermano(X,Y) :- padre(Z,X),padre(Z,Y),madre(W,X),madre(W,Y), X \= Y.
tio(X,Y) :- progenitor(Z,Y), hermano(X,Z).
descendiente(X,Y) :- progenitor(Y,Z),descendiente(X,Z).
descendiente(X,Y) :- progenitor(Y,X).
