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

ex8:-read_str(Str,_),(not((in_list(Str, 119),in_list(Str, 120))) -> write("ошибка");(listElNumb(Str, 119, W),listElNumb(Str, 120, X),(W < X ->write("w  раньше x");write("x раньше w")))).

listElNumb(List,Elem,Number):-listElNumb(List,Elem,0,Number).
listElNumb([H|_],H,Number,Number):-!.
listElNumb([_|T],Elem,I,Number):-I1 is I+1,listElNumb(T,Elem,I1,Number).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

ex9:-read_str(Str1,Number1),read_str(Str2,Number2),(Number1>Number2 -> Number3 is Number1-Number2,write_1(Number3,Str1);Number3 is Number2-Number1,write_1(Number3,Str2)).
write_1(0,_):-!.
write_1(Number,Str):-write_str(Str),Number1 is Number-1,write_1(Number1,Str).

ex10:-read_str(Str,_),ex10(Str,Str1),write_str(Str1).
ex10([H1,H2,H3|T],List1):-H1=97,H2=98,H3=99,List1 = [119,119,119|T],!.
ex10(List,List1):-append1(List,[122,122,122],List1),!.

ex11:-read_str(Str,Length),(Length>10 -> ex11(Str,Str2);ex11(Str,Length,12,Str2)),write_str(Str2).
ex11(Str,Str2):- Str2 = [_,_,_,_,_,_],append1(Str2,_,Str),!.
ex11(Str2,12,_,Str2):-!.
ex11(Str,L,Length,Str2):-L1 is L+1,append1(Str,[111],Str1),ex11(Str1,L1,Length,Str2).

ex14:-read_str(Str,_),ex14(Str,0,Kol),write(Kol).
ex14([],Kol,Kol):-!.
ex14([H|T],Kol,Res):-H>47,H<58,K1 is Kol+1,ex14(T,K1,Res),!.
ex14([_|T],Kol,Res):-ex14(T,Kol,Res),!.

