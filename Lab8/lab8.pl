ex1:-see('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),read_list_str(List),seen,ex1(List,0,Res),write(Res),told.
ex1([],Res,Res):-!.
ex1([H|T],K,Res):-length(H,L),(L>K -> K1 is L,ex1(T,K1,Res);ex1(T,K,Res)).

ex2:-  see('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),read_list_str(List), seen, space(List,0,Kol),nl,write(Kol).
space([],Kol,Kol):-!.
space([H|T],Kol,Kol_space):-(count_space(H)->name(H1,H), write(H1),nl,Kol1 is Kol+1,space(T,Kol1,Kol_space);space(T,Kol,Kol_space)).

count_space([]):-!.
count_space([H|_]):-H is 32,!,fail.
count_space([_|T]):-count_space(T).


