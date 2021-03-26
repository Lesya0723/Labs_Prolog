write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

append1([],List,List):-!.
append1([H1|Tail],List,[H1|Tail1]):-append(Tail,List,Tail1).

wr_str3:-read_str(A,Length),write_str(A),write(","),write_str(A),write(","),write_str(A),write(","),write(Length).

kolvo_words:-read_str(A,_),append1([32],A,A1),kol_slov(A1,0,Kol),write(Kol).
kol_slov([_|[]],Kol,Kol):-!.
kol_slov([H1|[H2|T]],K,Kol):-(H1=32,H2\=32 -> K1 is K+1,kol_slov([H2|T],K1,Kol);kol_slov([H2|T],K,Kol)).

ex4:-read_str(A,Length),(Length>5 -> ex4(A),reverse(A,RES),ex4(RES);
	   ex4(A,Length)).
ex4([H1|[H2|[H3|_]]]):-put(H1),put(H2),put(H3),!.
ex4([_|_],0):-!.
ex4([H|T],Length):-put(H),L1 is Length-1,ex4([H|T],L1).

index:-read_str(L,_),index(L,0).
index([],_):-!.
index([H|T],Res):-Res1 is Res+1,(0 is Res1 mod 3 -> put(H),index(T,Res1);index(T,Res1)).

ex7_1:- read_str(S,_), kolvo_p_m(S, Res), write("Количество плюсов и минусов = "),write(Res).
kolvo_p_m([], Res, Res) :- !.
kolvo_p_m([H|T], Count, Res) :-((H = 43 | H = 45) ->Count1 is Count + 1;Count1 is Count),kolvo_p_m(T, Count1, Res).
kolvo_p_m(List, Res) :- kolvo_p_m(List, 0, Res).

ex7_2:- read_str(S,_), count_posle0(S, Res), write("Количество = "),write(Res).
count_posle0([_], Res, Res) :- !.
count_posle0([_|[H2|T]], Count, Res) :-(H2 = 48 ->Count1 is Count + 1;Count1 is Count),count_posle0([H2|T], Count1, Res).
count_posle0(List, Res) :- count_posle0(List, 0, Res).

