inicio(e1).
fin(e3).


transicion(e1,a,e1).
transicion(e1,a,e2).
transicion(e1,b,e1).
transicion(e2,b,e3).
transicion(e2,_,e4).
transicion(e3,_,e1).
transicion(e3,b,e4).

aceptaCadena([X|R]) :- inicio(A), transicion(A, X, Y), aceptaCadena2(R, Y).
aceptaCadena2([X|[]], E) :- fin(F), transicion(E,X,F).
aceptaCadena2([X|R], E) :- transicion(E, X, Y), aceptaCadena2(R, Y).

cadenaLongitudExacta(C,L) :- length(C,L) ,aceptaCadena(C).
cadenaLongitudMenorExacta(C,L) :- between(0,L,X), length(C,X) ,aceptaCadena(C).


% estados iniciales
% tupla 3 elementos [mono, platanos,silla]
% con valores posibles cada cada elemento [puerta,medio,ventana]
% objetivos finales
%
% operadores
%


% estado(centro,arriba,centro,abajo) :- estado(centro,arriba,centro,arriba).
%
% %subir silla
% estado(X,arriba,centro,arriba) :- estado(X,suelo,centro,arriba).
%
% %mover mono con silla
% estado(Y,suelo,Y,arriba) :- X\=Y, estado(X,suelo,X,arriba).
%
% %mover mono  a silla
% estado(X,suelo,_,arriba) :- estado(Y,suelo,_,arriba), X\=Y.

% moverMono(_,suelo,Y,arriba) :- estado(Y,suelo,Y,arriba).
% moverMonoCaja(_,suelo,_,arriba) :- estado(centro,suelo,centro,arriba) .
% monoSubirCaja(centro,suelo,centro,arriba) :- estado(centro,arriba,centro,arriba).
