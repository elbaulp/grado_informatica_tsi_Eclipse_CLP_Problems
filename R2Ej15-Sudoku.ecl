:- lib(ic).
:- import alldifferent/1 from ic_global.

%
% ECLiPSe sample code - Sudoku problem
%
%	This is a puzzle, originating from Japan, where you have a
%	9x9 grid, consisting of 9 3x3 sub-grids. The challenge is
%	to fill the grid with numbers from 1 to 9 such that every row,
%	every column, and every 3x3 sub-grid contains the digits 1 to 9.
%	Some of these numbers are given, which is the way different
%	instances of the problem are made. The solution is usually unique.
%
%	Compile this file with ECLiPSe and call e.g.
%	:- solve(1).
%
% Author: Joachim Schimpf, IC-Parc
%


solve(ProblemName) :-
	problem(ProblemName, Board),
	print_board(Board),
	sudoku(3, Board),
	print_board(Board).


sudoku(N, Board) :-
	N2 is N*N,
	dim(Board, [N2,N2]),
	Board[1..N2,1..N2] :: 1..N2,
	( for(I,1,N2), param(Board,N2) do
	    Row is Board[I,1..N2],
	    alldifferent(Row),
	    Col is Board[1..N2,I],
	    alldifferent(Col)
	),
	( multifor([I,J],1,N2,N), param(Board,N) do
	    ( multifor([K,L],0,N-1), param(Board,I,J), foreach(X,SubSquare) do
		X is Board[I+K,J+L]
	    ),
	    alldifferent(SubSquare)
	),
	term_variables(Board, Vars),
	labeling(Vars).


print_board(Board) :-
	dim(Board, [N,N]),
	( for(I,1,N), param(Board,N) do
	    ( for(J,1,N), param(Board,I) do
	    	X is Board[I,J],
		( var(X) -> write("  _") ; printf(" %2d", [X]) )
	    ), nl
	), nl.


%----------------------------------------------------------------------
% Sample data
%----------------------------------------------------------------------

problem(1, [](
    [](_, 1, _, 6, _, 7, _, _, 4),
    [](_, 4, 2, _, _, _, _, _, _),
    [](8, 7, _, 3, _, _, 6, _, _),
    [](_, 8, _, _, 7, _, _, 2, _),
    [](_, _, _, 8, 9, 3, _, _, _),
    [](_, 3, _, _, 6, _, _, 1, _),
    [](_, _, 8, _, _, 6, _, 4, 5),
    [](_, _, _, _, _, _, 1, 7, _),
    [](4, _, _, 9, _, 8, _, 6, _))).
