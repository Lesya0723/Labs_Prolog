ex1:-see('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),read_list_str(List),seen,ex1(List,0,Res),write(Res),told.
ex1([],Res,Res):-!.
ex1([H|T],K,Res):-length(H,L),(L>K -> K1 is L,ex1(T,K1,Res);ex1(T,K,Res)).
