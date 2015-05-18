:-lib(ic).
:-lib(ic_global).

% PROBLEMA: Un cuadrado mágico de tamaño N es una matriz de tam NxN
%  con dominio en 1..N*N tal que la suma de cada fila, columna y diagonales
%  tiene el mismo valor.

cuadrado_mágico(N, X) :-
  dim(X, [N,N]),
  X[1..N,1..N] :: 1..N*N,

  ic_global:alldifferent(X),

  Sum is N*(N*N+1)//2, % El número mágico
  printf("El número mágico para %d es %d%n", [N,Sum]),

  (
    for(I, 1, N),
    foreach(U,Diag1), % Añadir a la lista Diag1 los elementos que vaya tomando U
    foreach(D,Diag2),
     param(X, N, Sum)
    do
      Sum #= sum(X[I, 1..N]), % La suma de todas las filas iguales
      Sum #= sum(X[1..N, I]), % LA suma de todas las columnas iguales
      U is X[I,I],
      D is X[I, N-I+1]
  ),
  Sum #= sum(Diag1),
  Sum #= sum(Diag2),

  % http://eclipseclp.org/doc/bips/lib/ic/search-6.html
  search(
    X, % La variable
    0, % 0 si la variable es una lista con dominio
    most_constrained, % input_order|first_fail|anti_first_fail|smallest|largest|occurrence|most_constrained|max_regret
    indomain_middle, % Se comienza buscando por valores en mitad del dominio
    complete, % Backtracking permitiendo 5 pasos, complete mejor
    []).


suma(X) :-
    dim(X, [N,N]),
    ( for(I, 1, N),
      foreach(U,Diag1),
      foreach(D,Diag2),
      param(X, N) do
        Y is sum(X[I, 1..N]),
        printf("Suma fila %d: %d%n", [I,Y]),
        T is sum(X[1..N, I]),
        printf("Suma columna %d: %d%n", [I,T]),
        U is X[I,I],
        D is X[I, N-I+1]
    ),
    SumD1 is sum(Diag1),
    SumD2 is sum(Diag2),
    printf("Diagonal 1: %d%nDiagonal2 %d%n",[SumD1,SumD2]).

imprime(X) :-
        dim(X, [N,N]),
        ( for(I, 1, N), param(X, N) do
            ( for(J, 1, N), param(X, I) do
                XX is X[I,J],
                printf("%2d", XX),
                write(" ")
            ),
            nl
        ),nl.

go :-
        N = 5,
        cuadrado_mágico(N, X),
        imprime(X),
        suma(X).
