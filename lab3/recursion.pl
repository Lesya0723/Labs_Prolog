max(X,Y,X):-X>Y. 
max(_,Y,Y).

max(X,Y,Z,X):-X>=Y,X>=Z.
max(_,Y,Z,Y):-Y>=Z.      
max(_,_,Z,Z).

fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is N*X1.  

fact(1,CurX,CurX):-!.
fact(N,CurX,X):-N1 is N-1,CurX1 is CurX*N, fact(N1,CurX1,X).  
factorial(N,X):-fact(N,1,X).

fibUp(1,1):-!.                                                     
fibUp(2,1):-!.
fibUp(N,X):-N1 is N-1, fibUp(N1,X1), N2 is N-2, fibUp(N2,X2), X is X1+X2.

fibDown(1,_,Y2,Y2):-!.
fibDown(2,_,Y2,Y2):-!.
fibDown(N,Y1,Y2,X):-Y3 is Y1+Y2, N1 is N-1, fibDown(N1,Y2,Y3,X).
fibD(N,X):-fibDown(N,1,1,X).

sumUp(N,N):-N<10,!.     
sumUp(N,Sum):-N1 is N mod 10, N2 is N div 10, sumUp(N2,Sum1),Sum is Sum1+N1.

sum(N,X):-sum(N,0,X),!.
sum(0,CurX,CurX):-!.             
sum(N,CurX,X):-N1 is N mod 10,N2 is N div 10,X2 is CurX+N1,sum(N2,X2,X).

maxUp(X,X):- X<10,!.         
maxUp(X,N):- X1 is X div 10, X2 is X mod 10, maxUp(X1,N1), ( X2<N1 ->  N =  N1;N = X2).

maxDown(0, Max, Max) :- !.
maxDown(N, CurM, Max):-N1 is N mod 10, N2 is N div 10,(N1 < CurM -> CurM1 is CurM; CurM1 is N1),maxDown(N2, CurM1, Max).
maxDown(N, Max):- maxDown(N, 0, Max).

sum3Up(0,0):-!.
sum3Up(N,X):-N1 is N div 10, sum3Up(N1,X1), delna3(N,Y), X is X1+Y.

delna3(X,Y):- X mod 10 mod 3 =:= 0 , Y is X mod 10,!.
delna3(_,Y):-Y is 0,!.
sum_1(0,Sum,Sum):-!.
sum_1(N,X,Sum):- N1 is N div 10,delna3(N,Y),Sum1 is X+Y, sum_1(N1,Sum1,Sum).
sum_1(N,Sum):-sum_1(N,0,Sum).


nod(A,A,A):-!. 
nod(A,B,Nod):-A>=B,C is A mod B, nod(C,B,Nod).
nod(A,B,Nod):-A<B,C is B mod A, nod(A,C,Nod).


is_prime(1):-!.
is_prime(N) :-N > 1,prime(N, 2).
prime(N, D) :-  N =< D.
prime(N, D) :-  N > D, N mod D =\= 0, D1 is D + 1,prime(N, D1).


kolDel(_,0,0):-!.
kolDel(N,L,X):-N mod L =:= 0,L1 is L-1, kolDel(N,L1,X1), X is X1+1; N mod L=\= 0, L1 is L -1, kolDel(N,L1,X1), X is X1.
kolDel(N,X):-kolDel(N,N,X).


kol_mutually_prime_up(_,0,0):-!.
kol_mutually_prime_up(N,CurX,X):-nod(N,CurX,Nod),Nod =:= 1,CurX1 is CurX-1,kol_mutually_prime_up(N,CurX1,X1),X is X1+1;
nod(N,CurX,Nod),Nod =\= 1, CurX1 is CurX-1,kol_mutually_prime_up(N,CurX1,X1), X is X1.
kol_mutually_prime_up(N,X):-kol_mutually_prime_up(N,N,X).

mutually_prime(X,Y,Z):-nod(X,Y,Nod),Nod =:= 1, Z is 1,!.
mutually_prime(_,_,Z):- Z is 0,!.

kol_mutually_prime_down(N,N,X,X):-!.
kol_mutually_prime_down(N,CurX,Kol,X):- mutually_prime(N,CurX,Nod),CurX1 is CurX+1, Kol1 is Kol+Nod,kol_mutually_prime_down(N,CurX1,Kol1,X).

kol_mutually_prime_down(N,X):-kol_mutually_prime_down(N,1,0,X).
