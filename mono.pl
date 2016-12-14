inicio(estado(puerta,abajo,ventana,arriba)).
fin(estado(centro,arriba,centro,arriba)).


transicion(subirSilla(X),estado(X,abajo,X,arriba),estado(X,arriba,X,arriba)).
% transicion(moverSilla,estado(X,aarribaajo,X,arriba),estado(Y,abajo,Y,arriba)).
transicion(moverSilla(Y,centro),estado(Y,abajo,Y,arriba),estado(centro,abajo,centro,arriba)).
% transicion(subirSilla,estado(X,abajo,X,arriba),estado(X,arriba,X,arriba)).
transicion(moverMono(X,Y),estado(X,abajo,Z,arriba),estado(Y,abajo,Z,arriba)).

resolver(STATE, [OP]) :-  fin(FINAL), transicion(OP, STATE, FINAL), !.
resolver(STATE, [OP|OP2]) :- transicion(OP, STATE, STATE2), resolver(STATE2, OP2), !.
