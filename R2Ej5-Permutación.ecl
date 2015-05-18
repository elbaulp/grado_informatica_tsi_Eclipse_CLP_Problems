:-lib(ic).

% Considerar el siguiente problema:
% Encontrar una permutación de los números 1 al 10 tal que:
% - 6 está en la 7a posición
% - cada número a partir del segundo es, o bien 3 unidades mayor, o bien 2
% unidades menor que su predecesor.
% Modelar este problema como un PSR y escribir un programa en ECLiPSe que lo
% resuelva. Información: La única solución es 3 1 4 2 5 8 6 9 7 10. (MENTIRA!!!!!!)

% Ejemplos:
%   A = [](3, 1, 4, 2, 5, 8, 6, 9, 7, 10)
%   A = [](8, 1, 4, 2, 5, 3, 6, 9, 7, 10)

permutacion(A) :-
        dim(A, [10]),
        A :: 1..10,
        alldifferent(A),
        A[7] #= 6,

        ( for(I,3,10), param(A) do
              A[I] #= A[I-1]+3 or A[I] #= A[I-1] - 2
        ),

        %labeling(A).
        search(A, 0, smallest, indomain_middle, complete, []).
