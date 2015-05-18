:-lib(ic).

asignaTareas(Var):-
	Var=[W1, W2, W3, W4],
	Var::[1, 2, 3, 4],

	element(W1, [7,1,3,4], EW1),
	element(W2, [8,2,5,1], EW2),
	element(W3, [4,3,7,2], EW3),
	element(W4, [3,1,6,3], EW4),

	alldifferent(Var),
	EW1+EW2+EW3+EW4#>=19,

	labeling(Var),

	B is EW1+EW2+EW3+EW4,
	write("Coste: "), writeln(B).
