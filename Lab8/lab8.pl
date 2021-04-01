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

ex1_4:-see('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),read_str(A,_,1),seen,tell('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),list_all(A,[],LW),often_word(LW,_,Word,0,_),write_str(Word),told.

list_w(A,LW):-append1([32],A,A1),reverse(A1,AR),list_w(AR,[],LW,[]).
list_w([],LW,LW,_):-!.
list_w([H|T],LW,LWN,W):-((H=32; H=10) -> append([W],LW,LW1),list_w(T,LW1,LWN,[]);
append1([H],W,W1),list_w(T,LW,LWN,W1)).

list_all([],ListAllWord,ListAllWord):-!.
list_all(Stroka,List,ListAllWord):-list_w(Stroka,LW),append1(List,LW,ListAllWord).

kol_repeat([H|T],X,K):-kol_repeat([H|T],X,0,K).
kol_repeat([],_,Kol,Kol):-!.
kol_repeat([H|T],X,K,Kol):-(H=X -> K1 is K+1,kol_repeat(T,X,K1,Kol);kol_repeat(T,X,K,Kol)).

often_word([],Word,Word,Kol,Kol):-!.
often_word([H|T],W,Word,K,Kol):-kol_repeat([H|T],H,K1),(K1>K -> Kol1 = K1,W1=H,often_word(T,W1,Word,K1,Kol1);often_word(T,W,Word,K,Kol)).

ex1_5:-see('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),read_str(A,_,1),seen,tell('C:/Users/Admin/Documents/Prolog/лр8/out.txt'),list_all(A,[],ListWordAllFile), pr_(ListWordAllFile,ListWordAllFile),told.

pr_(_,[]):-!.
pr_(ListWordAllFile,[H|T]):- list_w(H,ListWordInStr),pr(ListWordAllFile,ListWordInStr),write_str(H),nl,pr_(ListWordAllFile,T),!.
pr_(ListWordAllFile,[_|T]):-pr_(ListWordAllFile,T).
pr(_,[]):-true,!.
pr(AllListWord,[H|T]):-kol_repeat(AllListWord,H,KolPovt),KolPovt<2,pr(AllListWord,T),!.
pr(_,[_|_]):-!,fail.

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

ex_3:-see('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),read_str(A,_,1),seen,
tell('C:/Users/Admin/Documents/Prolog/лр8/out.txt'),append(A,[32],A1),date_time(A1),told.

date_time([]):-!.
date_time([32|Tail]):-date_time(Tail),!.
date_time([Head|Tail]):-(day([Head|Tail],[],Day,After_Day)->(month(After_Day,[],Month,After_Month)->(year(After_Month,[],Year,After_Year)->
name(D,Day),write(D),write(" "),name(M,Month),write(M),write(" "),name(Y,Year),write(Y),nl,date_time(After_Year);date_time(After_Month));
date_time(After_Day));date_time(Tail)).
day([32|Tail],Day,Day,Tail):-!.
day([Head|Tail],I,Day,After_Day):-Head >=48,Head =<57,append(I,[Head],I1),day(Tail,I1,Day,After_Day),!.
day([_|_],_,_,_):-!,false.

month([32|Tail],Month,Month,Tail):-!.
month([Head|Tail],I,Month,After_Month):-Head >=97,Head =<122,append(I,[Head],I1),month(Tail,I1,Month,After_Month),!.
month([_|_],_,_,_):-!,false.

year([32|Tail],Year,Year,Tail):-!.
year([Head|Tail],I,Year,After_Year):-Head >=48,Head =<57,append(I,[Head],I1),year(Tail,I1,Year,After_Year),!.
year([_|_],_,_,_):-!,false.


ex4_2:-see('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),read_str(Str,_,_),seen,ex4_2(Str).
ex4_2([]):-!.
ex4_2([H|_]):-H >=97,H =<122,put(H),fail.
ex4_2([_|T]):-ex4_2(T).

ex4_10:-see('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),read_str(Str,_,0),seen,ex4_10(Str,[],Res),write_str(Res).
ex4_10([],Str,Str):-!.
ex4_10([32|T],L,Str):-ex4_10(T,L,Str),!.
ex4_10([H|T],L,Str):-in_list(L,H),ex4_10(T,L,Str),!.
ex4_10([H|T],L,Str):-append(L,[H],L1),ex4_10(T,L1,Str).

ex5:-see('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),read_list_str(A), seen,
tell('C:/Users/Admin/Documents/Prolog/лр8/out.txt'),list_lenght(A,[],List_Lenght),
bubble_sort(List_Lenght,_,A,Sorted_A),write_sort(Sorted_A),told.

write_sort([]):-!.
write_sort([Head|Tail]):-name(Head1,Head),write(Head1),nl,write_sort(Tail).

list_lenght([],Res,Res):-!.
list_lenght([Head|Tail],I,Res):-lenght(Head,Lenght_Head),append(I,[Lenght_Head],I1),list_lenght(Tail,I1,Res).

sorted([], [],[],[]):-!.
sorted([Head], [Head],[HeadStr],[HeadStr]):-!.
sorted([First, Second|Tail], ListWithMaxEnd,[FirstStr, SecondStr|TailStr],ListWithMaxEndStr):-First > Second, !,
sorted(Tail, ListWithMaxEnd,TailStr,ListWithMaxEndStr).
sorted([First, Second|Tail], ListWithMaxEnd,[FirstStr, SecondStr|TailStr], ListWithMaxEndStr):-sorted(Tail, ListWithMaxEnd,TailStr, ListWithMaxEndStr).

bubble_sort(SortedList, SortedList,SortedList_Str,SortedList_Str):-
sorted(SortedList, DoubleSortedList,SortedList_Str,DoubleSortedList_Str),
SortedList = DoubleSortedList,SortedList_Str = DoubleSortedList_Str,!.
bubble_sort(List, SortedList,List_Str,SortedList_Str):-sorted(List, SortedPart,List_Str,SortedPart_List_Str),bubble_sort(SortedPart, SortedList,SortedPart_List_Str,SortedList_Str).

pr6:-see('C:/Users/Admin/Documents/Prolog/лр8/in.txt'),read_list_str(List,_),seen,kol_slov_str(List, L),sort1(List, L,[]).

kol_slov(A,L):-kol_slov(A,[],L),!.
kol_slov([],L, L):-!.
kol_slov([H|T], L_, L):-list_wo(H,LW,0,Kolvo),append1(L_,[Kolvo],L1),kol_slov(T,L1,L).

list_wo(A,LW,_,K):-append1([32],A,A1),reverse(A1,AR),list_wo(AR,[],LW,[],K,0).
list_wo([],LW,LW,_,K,K):-!.
list_wo([H|T],LW,LWN,W,Kolvo,K):-((H=32; H=10) -> append([W],LW,LW1), K1 is K+1,list_wo(T,LW1,LWN,[],Kolvo, K1);
append1([H],W,W1),list_wo(T,LW,LWN,W1,Kolvo,K)).
