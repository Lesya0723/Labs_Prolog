read_str(A):-get0(X),r_str(X,A,[]).

del_1st([_|T],T).

r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).

read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

in_list_exlude1([El|T],El,T).
in_list_exlude1([H|T],El,[H|Tail]):-in_list_exlude1(T,El,Tail).

get_graph_edges(V,E):-get_V(V),write(V),nl,write("Edges"),nl,get_edges(V,E),write(E).

get_V(V):-read(N),write("Vertexes"),nl,N1 is N+1,get_V(V1,N1),del_1st(V1,V).
get_V([],0):-!.
get_V([H|T],N):-read_str(X),name(H,X),N1 is N-1,get_V(T,N1).


get_edges(V,E):-read(M),get0(_),get_edges(V,E,[],M,0).
get_edges(_,E,E,M,M):-!.
get_edges(V,E,Edges,M,Count):-get_edge(V,Edge),append(Edges,[Edge],E1),Count1 is Count+1,get_edges(V,E,E1,M,Count1).

get_edge(V,[V1,V2]):-write("Edge"),nl,read_str(X),name(V1,X),check_vertex(V,V1),read_str(Y),name(V2,Y),check_vertex(V,V2).


in_list1([El|_],El):-!.
in_list1([_|T],El):-in_list1(T,El).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

append1([],X,X):-!.
append1([H|T],X,[H |Z]):-append1(T,X,Z).


check_vertex([V1|_],V1):-!.
check_vertex([_|T],V1):-check_vertex(T,V1).




gamilton:-get_graph_edges(V,E),gamilton(V,E).


gamilton(V,E):-b_a_r(V,_,Way),way_check(Way,E),write(Way).

way_check([H|T],E):-append1([H|T],[H],Way),w_c(Way,E).
w_c([_],_):-!.
w_c([V1,V2|T],E):-in_list1(E,[V1,V2]),w_c([V2|T],E).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

b_a_r([],Perm1,Perm1):-!.
b_a_r(A,Perm,Perm1):-in_list_exlude(A,El,A1),b_a_r(A1,[El|Perm],Perm1).




euler:-get_graph_edges(V,E),euler(V,E).

euler(_,E):-b_a_r(E,_,Way),way_edge_check(Way),write(Way).
way_edge_check([H|T]):-append1([H|T],[H],Way),w_e_c(Way).
w_e_c([_]):-!.
w_e_c([[_,X]|[[X|Y]|Tail]]):-w_e_c([[X|Y]|Tail]).

euler_N:-get_graph_edges(V,E),euler_N(V,E).

euler_N(_,E):-b_a_r(E,_,Way),way_edge_check_N(Way),write(Way).
way_edge_check_N([H|T]):-append1([H|T],[H],Way),w_e_c_N(Way).
w_e_c_N([_]):-!.
w_e_c_N([[_,X]|[[X,Y]|Tail]]):-w_e_c_N([[X,Y]|Tail]).
w_e_c_N([[_,X]|[[Y,X]|Tail]]):-w_e_c_N([[X,Y]|Tail]).


raskras(K):-get_graph_edges(V,E),make_ar(K,C),raskras(V,E,C,[],Itog),write(Itog).

make_ar(0,[]):-!.
make_ar(K,[K|Tail]):-K1 is K-1,make_ar(K1,Tail).

raskras([],_,_,Itog,Itog):-!.
raskras([V|Vtail],E,C,Ras,Itog):-
	in_list(C,Color),check_color(V,E,Color,Ras),append1(Ras,[[V,Color]],Ras1),
	raskras(Vtail,E,C,Ras1,Itog).

check_color(_,_,_,[]):-!.
check_color(V,E,C1,[[_,C2]|Tail]):-C1\=C2,check_color(V,E,C1,Tail),!.
check_color(V,E,Col,[[Ver,Col]|Tail]):-
	not(in_list1(E,[V,Ver])),not(in_list1(E,[Ver,V])),
	check_color(V,E,Col,Tail).



make_way:-
	get_graph_edges(V,E),write("Otkuda"),nl,read_str(X),name(I,X),
	write("Kuda"),nl,read_str(Y),name(S,Y),make_way(V,E,I,S,Way),
	write_way(Way).

make_way(V,E,I,S,Way):-in_list_exlude(V,I,Tail),make_way(Tail,E,I,S,[I],Way).
make_way(_,_,S,S,Way,Way):-!.
make_way(V,E,I,S,Cur_Way,Way):-	in_list_exlude(V,X,Tail),in_list1(E,[I,X]),
								append1(Cur_Way,[X],C_W),make_way(Tail,E,X,S,C_W,Way).

write_way([V]):-write(" "),write(V),write("."),!.
write_way([V|Tail]):-write(" "),write(V),write(" -"),write_way(Tail).

list_len([],0):-!.
list_len([_|T],L):-list_len(T,L1),L is L1+1.


short_way:-get_graph_edges(V,E),write("Otkuda"),nl,read_str(X),name(I,X),
	write("Kuda"),nl,read_str(Y),name(S,Y),list_len(V,Len),
	short_way(V,E,I,S,Way,Len+1),write_way(Way).

short_way(V,E,I,S,Way,Len):-short_way(V,E,I,S,Way,_,Len).
short_way(V,E,I,S,Way,_,Len):-
	make_way(V,E,I,S,Cur_Way1),list_len(Cur_Way1,L),L<Len,!,short_way(V,E,I,S,Way,Cur_Way1,L).
short_way(_,_,_,_,Way,Way,_).


ex10_5:-see('C:/Users/Admin/Documents/Prolog/лр9/in.txt'),read_graph(_,E1),seen,write(E1),nl,not(par(E1,[])).
read_graph(H,T):-   read_list_str([H|T]).
par([H|E1],S):-par([H],E1,T),check_par(T,S),write(T),nl,par(E1,[H|S]).
par(T,[],T).
par(T,[[A,B]|E],T1):-check_edge(T,[A,B])->par([[A,B]|T],E,T1);par(T,E,T1).

check_par(_,[]):-!.
check_par(T,[[A,B]|N]):-check_edge(T,[A,B])->!,fail;check_par(T,N),!.

check_edge([],_):-!.check_edge([[X,Y]|_],[X,Y]):-!,fail.check_edge([[X,Y]|_],[Y,X]):-!,fail.check_edge([[_,Y]|_],[Y,_]):-!,fail.check_edge([[_,Y]|_],[_,Y]):-!,fail.
check_edge([[X,_]|_],[_,X]):-!,fail.check_edge([[X,_]|_],[X,_]):-!,fail.check_edge([_|T],[A,B]):-check_edge(T,[A,B]),!.
