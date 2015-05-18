:- lib(fd).
:- lib(cumulative).

% Ejercicio3: Construcción de una casa

casa(Vars) :-
	% Variables
	Vars=[SA,SB,SC,SD,SE,SF,SG,SH,SI,SEND], % Tiempos de inicio
	Vars::[0..100], % Dominio de las variables

  SA + 7 #=< SB, % El tiempo de inicio de la tarea B tiene que empezar despues del tiempo de inicio de la tarea A + su tiempo de inicio
  SA + 7 #=< SD,
  SB + 3 #=< SC,

  SC + 1 #=< SE,
  SD + 8 #=< SE,

  SC + 1 #=< SF,
  SD + 8 #=< SF,

  SC + 1 #=< SG,
  SD + 8 #=< SG,

  SA + 7 #=< SH,

  SF + 1 #=< SI,
  SH + 3 #=< SI,

  SI + 2 #=< SEND,

  minimize(labeling(Vars),SEND). % Minimizamos SEND, que es la tarea final

% SOlución encontrada [0, 7, 10, 11, 25, 19, 27, 20, 23, 25]
