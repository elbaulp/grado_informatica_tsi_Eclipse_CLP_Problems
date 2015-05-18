:- lib(ic).

queens(N, Board) :-
  length(Board, N), % crea una lista de N elementos, llamada Board
  Board :: 1..N,
  % iterate Goals starting with Q1=Board until Cols=[]
  % Es decir, selecciona una reina, Q1, y el en bucle de abajo,
  % recorre todas las reinas restantes.
  ( fromto(Board, [Q1|Cols], Cols, []) do
    %%  Dist varia entre 1 y _
    % Q1 es global aqui
    ( foreach(Q2, Cols), count(Dist,1,_), param(Q1) do
      noattack(Q1, Q2, Dist)
    )
  ).

  noattack(Q1,Q2,Dist) :-
    Q2 #\= Q1,
    Q2 - Q1 #\= Dist,
    Q1 - Q2 #\= Dist.
%% usage
% queens(16, Vars), %model
% labeling(Vars).
