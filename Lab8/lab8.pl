read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

ex1:-see('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),read_list_str(List),seen,ex1(List,0,Res),write(Res),told.
ex1([],Res,Res):-!.
ex1([H|T],K,Res):-length(H,L),(L>K -> K1 is L,ex1(T,K1,Res);ex1(T,K,Res)).

ex2:-  see('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),read_list_str(List), seen, space(List,0,Kol),nl,write(Kol).
space([],Kol,Kol):-!.
space([H|T],Kol,Kol_space):-(count_space(H)->name(H1,H), write(H1),nl,Kol1 is Kol+1,space(T,Kol1,Kol_space);space(T,Kol,Kol_space)).

count_space([]):-!.
count_space([H|_]):-H is 32,!,fail.
count_space([_|T]):-count_space(T).

ex1_3:-see('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),read_list_str(List),seen,kol_in_list(List,0,KA),
	  kol_A(List,KA,SrA),write_s(List,SrA).
kol_A([H|T],A,SrA):-length([H|T],L),SrA is A div L.
kol_in_list([],K,K):-!.
kol_in_list([H|T],K,Kol):-ex2_10(H,0,A),K1 is K+A,kol_in_list(T,K1,Kol).
write_s([],_):-!.
write_s([H|T],KolA):-ex2_10(H,0,K),K>KolA,write_str(H),nl,write_s(T,KolA),!.
write_s([_|T],KolA):-write_s(T,KolA),!.

ex2_2:-see('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),read_str(S,_,1),seen,
ex2_2(S),told.
ex2_2([_]):-write("Символы упорядочены"),!.
ex2_2([H1,H2|T]):-H1<H2,!,ex2_2([H2|T]).
ex2_2([_,_|_]):-write("Символы не упорядочены"),!.

ex2_10:-see('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),read_str(Str,_,1),seen,ex2_10(Str,0,Res),write(Res),told.
ex2_10([],Res,Res):-!.
ex2_10([H|T],Kol,Res):-H=65,Kol1 is Kol+1,ex2_10(T,Kol1,Res),!.
ex2_10([_|T],Kol,Res):-ex2_10(T,Kol,Res).

ex2_17:-see('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),read_str(Str,_,_),seen,reverse(Str,A),dot(A,A1),slash(A1,[],Res),name(Res1,Res),write(Res1).
dot([46|T],Res):-append([],T,Res),!.
dot([_|T],Res):-dot(T,Res).
slash([47|_],Res,Res):-!.
slash([H|T],L,Res):-append([H],L,L1),slash(T,L1,Res).

ex4_2:-see('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),read_str(Str,_,_),seen,ex4_2(Str).
ex4_2([]):-!.
ex4_2([H|_]):-H >=97,H =<122,put(H),fail.
ex4_2([_|T]):-ex4_2(T).

ex4_10:-see('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),read_str(Str,_,0),seen,ex4_10(Str,[],Res),write_str(Res).
ex4_10([],Str,Str):-!.
ex4_10([32|T],L,Str):-ex4_10(T,L,Str),!.
ex4_10([H|T],L,Str):-in_list(L,H),ex4_10(T,L,Str),!.
ex4_10([H|T],L,Str):-append(L,[H],L1),ex4_10(T,L1,Str).
