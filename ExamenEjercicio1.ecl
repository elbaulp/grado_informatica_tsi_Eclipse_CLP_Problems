:- lib(ic).

/*
  Una posible asignación es
  Jugadores = [1, 2, 3, 4]
  Pantalones = [4, 2, 3, 1]
  Linea = [1, 2, 4, 3]

  Que se interpreta:
  PAra los pantalones,
  El jugador 4, Lleva pantalones 1, En este caso Tomas lleva rojo
  El jugador 2, lleva pantalones 2 (Azul), Jose
  El jugador 3, lleva pantalones 3 (Cuadros) Bibi lleva cuadros
  El jugador 1, lleva pantalones 4 (Naranajas)  Fede lleva pantalones Narajas

  El jugador 1, está el primero en la linea: Fede
  El jugador 2, segundo, Jose,
  Ej jugador 4, tercero: Tomas,
  Ej jugador 3, Cuarto: Bibi
*/

jugadores(J):-
  J = [Fede, Jose, Bibi, Tomas],
  Pantalones = [Rojo, Azul, Cuadros, Naranja],
  Linea = [Primero, Segundo, Tercero, Cuarto],

  J :: 1..4,
  Pantalones :: 1..4,
  Linea :: 1..4,

  % En este ejemplo, cada variable está representada por un número, es dedir
  % hay 4 Jugadores, Cada uno de ellos tendrá un numero del 1 al 4 asignado

  alldifferent(J),
  alldifferent(Pantalones),
  alldifferent(Linea),

  Jose #= Segundo,
  Bibi #= Cuadros,
  Tomas #\= Primero,
  Tomas #\= Cuarto,
  Tomas #\= Naranja,
  Fede+1 #= Azul,

  flatten([J, Pantalones, Linea], List),
  labeling(List),

  write("Jugadores = "),write(J),nl,
  write("Pantalones = "), write(Pantalones),nl,
  write("Linea = "),write(Linea),nl.
