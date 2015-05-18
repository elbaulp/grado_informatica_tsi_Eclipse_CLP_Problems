:- lib(fd).
:- lib(cumulative).

% Ejercicio3: Construcción de una casa

casa(Vars) :-
	% Variables
	Vars=[SA,SB,SC,SD,SE,SF,SG,SH,SI,SEND], % Tiempos de inicio
	Vars::[0..100],

  SA + 7 #=< SB,
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

	cumulative([SA,SB,SC,SD,SE,SF,SG,SH,SI], % Tiempos inicio
	   [7,3,1,8,2,1,1,3,2],	% Duraciones
     [2,3,2,2,1,2,1,1,2], % Cantidad de recursos
		3), 	% Max recursos a usar
minimize(labeling(Vars),SEND).
