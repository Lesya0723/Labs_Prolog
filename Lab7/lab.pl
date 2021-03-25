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
