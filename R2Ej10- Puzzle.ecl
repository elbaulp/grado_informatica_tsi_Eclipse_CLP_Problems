:-lib(ic).

triangulo(List):-
  List = [X1,X2,X3,X4,X5,X6,X7,X8,X9,X10],
  List::[1,2,3,4,5,6,7,8,9,10],
  alldifferent(List),
  X1 #= 3,
  abs(X2 - X3) #= X1,
  abs(X4 - X5) #= X2,
  abs(X5 - X6) #= X3,
  abs(X7 - X8) #= X4,
  abs(X8 - X9) #= X5,
  abs(X9 - X10) #= X6,
  
  labeling(List).
  
% Otra forma

triangulo(List):- 
  dim(List,[10,1]),
  List[1..10,1]::[1,2,3,4,5,6,7,8,9,10],
  alldifferent(List),
  List[1,1] #= 3,
  
 (for(I,1,3),param(List) do 
	(for(J,1,I),param(List,I) do
		abs(List[((I*2)+(J-1)+(I//3)),1] - List[((I*2)+J+(I//3)),1])  #= List[(I+J-1+(I//3)),1] 
	)
 ),
 labeling(List).