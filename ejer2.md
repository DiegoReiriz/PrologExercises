# ejercicio 2

## 1. Implementación de un autómata no determinista

Sea el siguiente autómata finito no determinista, donde cada posible transición viene etiquetada por la letra que acepta y la transición lambda (vacía) está sin etiquetar. El estado final es el estado e3.

### a) Represente el autómata por los siguientes hechos (Esto sería la base de hechos inicial o conjunto de predicados iniciales):

- e1 es el estado inicial.
- e3 es un estado final.
- hay 7 transiciones en el autómata, cinco que están etiquetadas y dos que no (transiciones lambda). Representa cada transición, mediante un predicado con tres argumentos: estado de partida, etiqueta de la transición y estado resultante

```prolog
inicio(e1).
fin(e3).
transicion(e1,a,e1).
transicion(e1,a,e2).
transicion(e1,b,e1).
transicion(e2,b,e3).
transicion(e2,_,e4).
transicion(e3,_,e1).
transicion(e3,b,e4).
```

### b) Implemente las reglas necesarias que verifiquen si el autómata acepta o no una determinada lista de caracteres de entrada

```prolog
aceptaCadena([X|R]) :- inicio(A), transicion(A, X, Y), aceptaCadena2(R, Y).
aceptaCadena2([X|[]], E) :- fin(F), transicion(E,X,F).
aceptaCadena2([X|R], E) :- transicion(E, X, Y), aceptaCadena2(R, Y).
```

### c) ¿Cómo realizaría la consulta para saber qué cadena de longitud 3 acepta el autómata?

```prolog
?- aceptaCadena([X,Y,Z]).
X = Y, Y = a,
Z = b ;
X = Z, Z = b,
Y = a ;
```

### d) Implemente una regla que permita consultar si el autómata acepta una cadena de longitud determinada.



### e) Implemente una regla que permita consultar las cadenas de longitud menor o igual que una dada que acepta el autómata. Nota: chequee el predicado predefinido between
