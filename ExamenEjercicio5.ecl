:- lib(fd).
:- lib(cumulative).

casa(Vars) :-
	% Variables
	Tareas = [SA,SB,SC,SD,SE,SF,SG,SH,SI],
	Tareas :: 1..50,
	Vars=[TR1,TR2,TR3],
	Vars::[1..9],

	alldifferent(Vars),
	element(TR1,[4, 3, 3, 2, 4, 3, 1, 1, 2], RTA),
	element(TR2,[7, 5, 1, 5, 2, 2, 2, 3, 3], RTB),
	element(TR3,[10, 7, 4, 8, 6, 1, 3, 5, 4], RTC),

	RTA+RTB+RTC #< END,

	cumulative([SA,SB,SC,SD,SE,SF,SG,SH,SI], % Tiempos inicio
		[4, 3, 3, 2, 4, 3, 1, 1, 2],						% Duraciones para TR1
		[1, 1, 1, 1, 1, 1, 1, 1, 1],2),				 % Usos y cantidad de recursos compartidos

	cumulative([SA,SB,SC,SD,SE,SF,SG,SH,SI], % Tiempos inicio
		[7, 5, 1, 5, 2, 2, 2, 3, 3],						% Duraciones para TR1
		[1, 1, 1, 1, 1, 1, 1, 1, 1],2),				 % Usos y cantidad de recursos compartidos

	cumulative([SA,SB,SC,SD,SE,SF,SG,SH,SI], % Tiempos inicio
		[10, 7, 4, 8, 6, 1, 3, 5, 4],						% Duraciones para TR1
		[1, 1, 1, 1, 1, 1, 1, 1, 1],2),				 % Usos y cantidad de recursos compartidos

	minimize(labeling(Tareas),END).
