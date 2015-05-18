:-lib(ic).

horario(Vars):-


%  name_of_boy(A11,"A1").
%  name_of_boy(A12,"A1").
%  name_of_boy(A13,"A1").
%  name_of_boy(A14,"A1").

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

  HorasDescanso = [16, 17, 18, 19, 20],
  Nombres = [A1, A2, A3, A4, A5, A6, A7, A8, A9],

  alldifferent(Vars),

  % Restricciones profesores

  % Asignaturas de dos horas, en horas seguidas
  A12 - A11 #= 5,
  A13 - A14 #= 5,

  A32 - A31 #= 5,
  A33 - A34 #= 5,

  A42 - A41 #= 5,
  A43 - A44 #= 5,

  A52 - A51 #= 5,
  A53 - A54 #= 5,

  A82 - A81 #= 5,
  A83 - A84 #= 5,

  % Asignaturas de 4 horas semanales no pueden darse en dias contiguos
  %A13 #\= A12 + 1,

  % Se descansa en la hora 4
  (
    foreach(V, Vars), param(Vars) do
      (
        foreach(H, HorasDescanso), param(HorasDescanso, V) do
          V #\= H
      )
  ),

  labeling(Vars),
  (
    for(I, 1, 9) do
      printf("A%d ", [I])
  ),
  writeln(""),
  (
    foreach(I, Vars) do
      printf(" %d ", [I])
  ).
