:- lib(ic).
:- lib(ic_search).
:- lib(branch_and_bound).

/*
 La variable Cambio es la que dice la cantidad a devolver, en céntimos,
 Es decir, Cambio = 200 quiere decir que quremos 200 cénticmos,
 Para ese valor, la solución del programa es la siguiente:

 [[200, 1, [1, 0, 0, 0, 0, 0, 0, 0]]]
 Que quiere decir, para cambiar 200 centimos con las menores monedas posibles,
 da una moneda de dos euros

 Para 250:
 [[250, 2, [1, 0, 1, 0, 0, 0, 0, 0]]]
*/
cambio(N):-
        Cambio = N,
        % List is the (possibly empty) list of all instances of Term such that Goal is provable. 
        findall(
                [Cambio,NumMonedas,LD],
                cambios(LD,NumMonedas,Cambio),L),
        writeln(L).


cambios([DosEuros, UnEuro, CinCent, VeinteCent, DiezCent, CincoCent, DosCent, UnCent],NumMonedas,Cambio) :-

        LD = [DosEuros, UnEuro, CinCent, VeinteCent, DiezCent, CincoCent, DosCent, UnCent],

        LD :: 0..100, %% 100 céntimos en un euro

        % Valores de las monedas en céntimos
        200*DosEuros+100*UnEuro+50*CinCent+20*VeinteCent+10*DiezCent+5*CincoCent+2*DosCent+1*UnCent #= Cambio,

        % Número de monedas, es lo que queremos minimizar
        DosEuros+UnEuro+CinCent+VeinteCent+DiezCent+CincoCent+DosCent+UnCent #= NumMonedas,

        % Buscar la solución, con heurísica smallest, cogiendo valores del dominio lo más alto posibles
        minimize(search(LD,0,smallest,indomain_max,complete,[]),NumMonedas).
