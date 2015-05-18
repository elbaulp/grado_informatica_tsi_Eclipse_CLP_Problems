:-lib(ic_global).
:-lib(ic).

/*
En diez celdas numeradas del 0 al 9 se inscribe un
número de 10 dígitos tal que cada celda i indica el número total de ocurrencias
del dígito i en el número. Encontrar ese número.
Modelar este problema como PSR y escribir un programa en ECLiPSe que lo
resuelva. Información: El número es 6210001000. Pista: Buscar en la
documentación de Eclipse la restricción global representada por el predicado
occurrences(i,L,N) y plantear el problema y el programa basándose en este
predicado.
*/

go(A) :-
        dim(A, [10]),
        A[1..10] :: 0..9,

        % occurrences(++Value, +Vars, ?N) The value Value occurs in Vars N times
        ( for(I,1,10), param(A) do
          X is I - 1,
          occurrences(X, A, Y),
          A[I] #= Y
        ),

        labeling(A).
