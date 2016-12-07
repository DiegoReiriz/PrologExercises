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

## My NOTES

  abuelo(x,Y)
      | x1 / javier
      | Y1 / teresa
  padre(javier,Z), progenitor(Z,teresa)
      |
  progenitor(javier,Z),hombre(javier), progenitor(Z,teresa)
      |
  progenitor(javier,Z),hombre(javier), progenitor(Z,teresa)
      |                                   |
      |z1                                 | z2
      |                                   |
  progenitor(javier,pedro) n/         progenitor(javier,teresa) n/
  hombre(javier)  n/                  hombre(javier)  n/
  progenitor(pedro,teresa) X          progenitor(teresa,teresa) X
-----------------------------------------------------------------------------------------------------------
  abuelo(x,Y)
      | x1 / javier
      | Y1 / alicia
  padre(javier,Z), progenitor(Z,alicia)
      |
  progenitor(javier,Z),hombre(javier), progenitor(Z,alicia)
      |
  progenitor(javier,Z),hombre(javier), progenitor(Z,alicia)
      |                                   |
      |z1=pedro                           | z2 = alica
      |                                   |
  progenitor(javier,pedro) n/         progenitor(javier,teresa) n/
  hombre(javier)  n/                  hombre(jorge)  n/
  progenitor(pedro,alicia) X          progenitor(teresa,alicia) n/
--------------------------------------------------------------------------------------------------------------
  abuelo(javier,Y)
      | Y1 /
  padre(javier,Z), progenitor(Z,Y)
      |
  progenitor(javier,Z),hombre(javier), progenitor(Z,Y)
      |
      |                                                         |
      |z1=pedro                                                 | z2 = alica
      |                                                         |
  progenitor(javier,pedro) n/                                   progenitor(javier,teresa) n/
  hombre(javier)  n/                                            hombre(jorge)  n/
  progenitor(pedro,Y) X                                         progenitor(teresa,Y) n/
      |  y=Alfonso                | y=juan                       | y=Alicia
  progenitor(javier,pedro) n/   progenitor(javier,pedro) n/     progenitor(javier,teresa) n/
  hombre(javier)  n/            hombre(javier)  n/              hombre(jorge)  n/
  progenitor(pedro,Alfonso) X   progenitor(pedro,juan) X        progenitor(teresa,alicia) n/
