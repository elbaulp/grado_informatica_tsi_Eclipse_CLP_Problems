:-lib(ic).

horario(Vars):-

  Vars =
  [
    % Se imparten 4 horas semanales
    A11, A12, A13, A14,
    A31, A32, A33, A34,
    A41, A42, A43, A44,
    A51, A52, A53, A54,
    % Se imparten 2 horas semanales
    A21, A22,
    A61, A62,
    A71, A72,
    A81, A82,
    % Se imparte una hora semanal
    A91
  ],

  % El dominio representa todo el calendario
  /*
    1  2  3  4  5
    6  7  8  9  10
    ..............
    26 27 28 29 30

    Las columnas son los dias de la semana L..V
    Cada fila representa la franja horaria del aula, 1..6
  */
  Vars :: 1..30,

  HorasDescanso = [4, 10, 16, 22, 28],
  Nombres = [A1, A2, A3, A4, A5, A6, A7, A8, A9],

  alldifferent(Vars),

  % Restricciones profesores

  % Asignaturas de dos horas, en horas seguidas
  A12 - A11 #= 1,
  A14 - A13 #= 1,

  A32 - A31 #= 1,
  A34 - A33 #= 1,

  A42 - A41 #= 1,
  A44 - A43 #= 1,

  A52 - A51 #= 1,
  A54 - A53 #= 1,

  A82 - A81 #= 1,

  % Asignaturas de 4 horas semanales no pueden darse en dias contiguos
  A13 - A12 #> 10,
  A33 - A32 #> 10,
  A43 - A42 #> 10,
  A53 - A52 #> 10,

  A62 - A61 #> 10,
  A22 - A21 #> 10,
  A72 - A71 #> 10,
%  A82 - A81 #> 10,



  % Se descansa en la hora 4
  (
    foreach(V, Vars), param(Vars) do
      (
        foreach(H, HorasDescanso), param(HorasDescanso, V) do
          V #\= H
      )
  ),

  search(
    Vars, % La variable
    0, % 0 si la variable es una lista con dominio
    most_constrained, % input_order|first_fail|anti_first_fail|smallest|largest|occurrence|most_constrained|max_regret
    indomain, % Se comienza buscando por valores en mitad del dominio
    complete, % Backtracking permitiendo 5 pasos, complete mejor
    []),
  (
    for(I, 1, 9) do
      printf("A%d ", [I])
  ),
  writeln(""),
  (
    foreach(I, Vars) do
      printf(" %d ", [I])
  ).
