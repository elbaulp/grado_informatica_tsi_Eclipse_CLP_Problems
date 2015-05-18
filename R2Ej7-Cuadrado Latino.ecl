:-lib(ic).
:-lib(ic_global).

cuadrado_latino(N, X) :-
        dim(X, [N,N]), % Declaramos una matriz de NxN, llamada X
        X[1..N,1..N] :: 1..N, % El dominio para toda la matriz es 1..N
        (
            for(I, 1, N), % Desde I = 1 hasta I = N
            param(X, N) % X y N son globales dentro del bucle
        do
            ic_global:alldifferent(X[1..N, I]), % Especificamos las restricciones del problema,
            ic_global:alldifferent(X[I, 1..N])  % Valores distintos para toda la fila y toda la columna
        ).

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
        N = 13,
        cuadrado_latino(N, X),
        search(X, 0, smallest, indomain_middle, complete, []),
        imprime(X).
