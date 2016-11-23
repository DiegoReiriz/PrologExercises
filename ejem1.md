## 1. Determina las posibles parejas que vendrán al baile

```Prolog
chica(rosa).
chica(laura).
chica(ana).
chico(pedro).
chico(juan).
chico(pablo).
pareja(X,Y):- chico(X),chica(Y).
```

## Qué respuesta se obtendrá para las siguientes consultas:

### ?-pareja(X,Y).

```Prolog
?- pareja(X,Y).
X = pedro,
Y = rosa ;
X = pedro,
Y = laura ;
X = pedro,
Y = ana ;
X = juan,
Y = rosa ;
X = juan,
Y = laura ;
X = juan,
Y = ana ;
X = pablo,
Y = rosa ;
X = pablo,
Y = laura ;
X = pablo,
Y = ana.
```

### ?-pareja(X,ana).

```Prolog
?- pareja(X,ana).
X = pedro ;
X = juan ;
X = pablo.
```

### ?-pareja(X,juan).

```Prolog
?- pareja(X,juan).
false.
hijo(X,Y) :- progenitor(Y,X).
abuelo(X,Y) :- progenitor(X,Z),progenitor(Z,Y).
hermano(X,Y) :- padre(Z,X),padre(Z,Y),madre(W,X),madre(W,Y), X \= Y.
tio(X,Y) :- progenitor(Z,Y), hermano(X,Z).
descendiente(X,Y) :- progenitor(Y,Z),descendiente(X,Z).
descendiente(X,Y) :- progenitor(Y,X).

```

### ?-pareja(luis,Y).

```Prolog
?- pareja(luis,Y).
false.
```

## 2. Relaciones familiares
```Prolog
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
```

Representa las relaciones de
parentesco

```Prolog
hijo(X,Y) :- progenitor(Y,X).
abuelo(X,Y) :- progenitor(X,Z),progenitor(Z,Y).
hermano(X,Y) :- padre(Z,X),padre(Z,Y),madre(W,X),madre(W,Y), X \= Y.
tio(X,Y) :- progenitor(Z,Y), hermano(X,Z).
descendiente(X,Y) :- progenitor(Y,Z),descendiente(X,Z).
descendiente(X,Y) :- progenitor(Y,X).
```
## Qué respuesta se obtendrá para las siguientes consultas:

### ?- hijo(juan,pedro).

```Prolog
?- hijo(juan,pedro).
true.
```

### ?- abuelo(javier,teresa).

```Prolog
?- abuelo(javier,teresa).
false.
```

### ?- hijo(javier,X).

```Prolog
abuelo(javier,teresa).
false.
```

### ?- hijo(X,pedro).

```Prolog
?- hijo(X,pedro).
X = alfonso ;
X = juan.
```

### ?- descendiente(X,javier).

```Prolog
?- descendiente(X,javier).
X = alfonso ;
X = juan ;
X = alicia ;
X = pedro ;
X = teresa.
```

### ?- hijo(pedro,X).

```Prolog
?- hijo(pedro,X).
X = javier ;
X = maria.
```

### ?- hermano(pedro,X). %

```Prolog
?- hermano(pedro,X).
X = teresa ;
false.
```
