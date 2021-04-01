write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).


read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).


build_all_razm_p:-read_str(A,_),read(K),tell('C:/Users/Admin/Documents/Prolog/лр9/in.txt'),not(b_a_rp(A,K,[])),told.

b_a_rp(_,0,Perm1):-write_str(Perm1),nl,!,false.
b_a_rp(A,N,Perm):-in_list(A,El),N1 is N-1,b_a_rp(A,N1,[El|Perm]).

build_all_perm:-read_str(A,_),tell('C:/Users/Admin/Documents/Prolog/лр9/in.txt'),not(b_a_p(A,[])),told.

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

b_a_p([],Perm1):-write_str(Perm1),nl,!,fail.
b_a_p(A,Perm):-in_list_exlude(A,El,A1),b_a_p(A1,[El|Perm]).

build_all_razm:-read_str(A,_),read(K),tell('C:/Users/Admin/Documents/Prolog/лр9/in.txt'),not(b_a_r(A,K,[])),told.

b_a_r(_,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_r(A,N,Perm):-in_list_exlude(A,El,A1),N1 is N-1,b_a_r(A1,N1,[El|Perm]).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[_|Set]):-sub_set(Sub_set,Set).
pr_subset(A):-sub_set(B,A),write_str(B),nl,fail.
subset:-read_str(A,_),tell('C:/Users/Admin/Documents/Prolog/лр9/in.txt'),not(pr_subset(A)),told.

sochet([],0,_):-!.
sochet([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet(Sub_set,K1,Set).
sochet(Sub_set,K,[_|Set]):-sochet(Sub_set,K,Set).
pr_sochet(A,K):-sochet(B,K,A),write_str(B),nl,fail.
wsochet:-read_str(A,_),read(K),tell('C:/Users/Admin/Documents/Prolog/лр9/in.txt'),not(pr_sochet(A,K)),told.

sochet_p([],0,_):-!.
sochet_p([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet_p(Sub_set,K1,[H|Set]).
sochet_p(Sub_set,K,[_|Set]):-sochet_p(Sub_set,K,Set).
pr_sochet_p(A,K):-sochet_p(B,K,A),write_str(B),nl,fail.
wsochet_p:-read_str(A,_),read(K),tell('C:/Users/Admin/Documents/Prolog/лр9/in.txt'),not(pr_sochet_p(A,K)),told.

make(0,[]):-!.
make(K,[K|Tail]):-K1 is K-1,make(K1,Tail).

razm_p:-tell('C:/Users/Admin/Documents/Prolog/лр9/in.txt'),not(aa_razm_),told.
razm_P:-make(5,Pos),sochet(Pos_a,2,Pos),put(Word,Pos_a,[97]),in_list([98,99,100,101,102],S1),in_free_pos(Word,S1),in_list([98,99,100,101,102],S2),
in_free_pos(Word,S2),in_list([98,99,100,101,102],S3),in_free_pos(Word,S3),write_str(Word),nl,fail.

put_(Word,[Head1,Head2],[Sim]):-select_pos(Word,Head1,Sim),select_pos(Word,Head2,Sim).

select_pos(Word,H,Res):-(H is 1->Word=[Res,_,_,_,_],!);(H is 2->Word=[_,Res,_,_,_],!);(H is 3->Word=[_,_,Res,_,_],!);(H is 4->Word=[_,_,_,Res,_],!);(H is 5->Word=[_,_,_,_,Res]).

in_free_pos([H1,H2,H3,H4,H5],Res):-(var(H1)->H1 is Res),!;(var(H2)->H2 is Res),!;
(var(H3)->H3 is Res),!;(var(H4)->H4 is Res),!;(var(H5)->H5 is Res).

aa_razm:-tell('C:/Users/Admin/Documents/Prolog/лр9/in.txt'),not(aa_razm_),told.
aa_razm_:-make(5,Pos),sochet(Pos_a,2,Pos),put_(Res,Pos_a,[97]),in_list_exlude([98,99,100,101,102],St1,N),in_free_pos(Res,St1),in_list_exlude(N,St2,N1),in_free_pos(Res,St2),in_list_exlude(N1,St3,_),in_free_pos(Res,St3),
write_str(Res),nl,fail.

ex4:-tell('C:/Users/Admin/Documents/Prolog/лр9/in.txt'),not(exr4),told.
exr4:-make(5,Pos),sochet(Pos_s,2,Pos),in_list([97,98,99,100,101,102],Simb),put_(Res,Pos_s,[Simb]),in_list_exlude([97,98,99,100,101,102],Simb,List),in_list_exlude(List,St1,N),in_free_pos(Res,St1),in_list_exlude(N,St2,N1),
in_free_pos(Res,St2),in_list_exlude(N1,St3,_),in_free_pos(Res,St3),write_str(Res),nl,fail.


ex5:-tell('C:/Users/Admin/Documents/Prolog/лр9/in.txt'),not(exr5),told.
exr5:-make(6,Pos),sochet([H1,H2],2,Pos),in_list([97,98,99,100,101,102],Sim1),put_6(Res,[H1,H2],[Sim1]),in_list_exlude([97,98,99,100,101,102],Sim1,NList),
in_list_exlude(Pos,H1,NPos),in_list_exlude(NPos,H2,NNPos),sochet(Pos_,2,NNPos),in_list(NList,Simbol2),put_6(Res,Pos_,[Simbol2]),in_list_exlude(NList,Simbol2,LSimbol),in_list_exlude(LSimbol,S1,LSimbol1),
in_free_pos6(Res,S1),in_list_exlude(LSimbol1,S2,_),in_free_pos6(Res,S2),write_str(Res),nl,fail.

put_6(Word,[Head1,Head2],[Sim]):-select_pos6(Word,Head1,Sim),select_pos6(Word,Head2,Sim).

select_pos6(Word,Head,Sim):-(Head is 1->Word=[Sim,_,_,_,_,_],!);(Head is 2->Word=[_,Sim,_,_,_,_],!);(Head is 3->Word=[_,_,Sim,_,_,_],!);(Head is 4->Word=[_,_,_,Sim,_,_],!);(Head is 5->Word=[_,_,_,_,Sim,_],!);
(Head is 6->Word=[_,_,_,_,_,Sim]).

in_free_pos6([H1,H2,H3,H4,H5,H6],Sim):-(var(H1)->H1 is Sim),!;(var(H2)->H2 is Sim),!; (var(H3)->H3 is Sim),!; (var(H4)->H4 is Sim),!;(var(H5)->H5 is Sim),!; (var(H6)->H6 is Sim).


ex6:-tell('C:/Users/Admin/Documents/Prolog/лр9/in.txt'),not(exr6),told.
exr6:-make(7,Pos),sochet([H1,H2],2,Pos),in_list([97,98,99,100,101,102],Simb1), put_7(Word,[H1,H2],[Simb1]),
in_list_exlude([97,98,99,100,101,102],Simb1,NList),in_list_exlude(Pos,H1,NPos),in_list_exlude(NPos,H2,NNPos),
sochet(Pos_,3,NNPos),in_list(NList,Simb2),put_n(Word,Pos_,[Simb2]),in_list_exlude(NList,Simb2,LastSimb),in_list_exlude(LastSimb,S1,LastSimb1),in_free_pos7(Word,S1),in_list_exlude(LastSimb1,S2,_),
in_free_pos7(Word,S2),write_str(Word),nl,fail.

put_7(Word,[H1,H2],[Sim]):-select_pos7(Word,H1,Sim),select_pos7(Word,H2,Sim).
select_pos7(Word,Head,Sim):-(Head is 1->Word=[Sim,_,_,_,_,_,_],!);(Head is 2->Word=[_,Sim,_,_,_,_,_],!);(Head is 3->Word=[_,_,Sim,_,_,_,_],!);(Head is 4->Word=[_,_,_,Sim,_,_,_],!);  (Head is 5->Word=[_,_,_,_,Sim,_,_],!);(Head is 6->Word=[_,_,_,_,_,Sim,_],!);(Head is 7->Word=[_,_,_,_,_,_,Sim]).

put_n(Word,[H1,H2, H3],[Res]):-select_pos7(Word,H1,Res),select_pos7(Word,H2,Res), select_pos7(Word,H3,Res).

in_free_pos7([H1,H2,H3,H4,H5,H6,H7],Sim):-(var(H1)->H1 is Sim),!;(var(H2)->H2 is Sim),!;(var(H3)->H3 is Sim),!;(var(H4)->H4 is Sim),!;(var(H5)->H5 is Sim),!;(var(H6)->H6 is Sim),!;
(var(H7)->H7 is Sim).


ex7:-tell('C:/Users/Admin/Documents/Prolog/лр9/in.txt'),not(exr7),told.
exr7:-make(9,Pos),sochet([H1,H2],2,Pos),in_list([97,98,99,100,101,102],Simb1), put_pos9(Word,[H1,H2],[Simb1]),in_list_exlude([97,98,99,100,101,102],Simb1,NList),in_list_exlude(Pos,H1,NPos),in_list_exlude(NPos,H2,NNPos),
sochet([H3, H4],2,NNPos),in_list(NList,Simb2),put_pos9(Word,[H3,H4],[Simb2]),in_list_exlude(NList,Simb2,NList_),in_list_exlude(NNPos,H3,EPos),in_list_exlude(EPos,H4,Pos_),
sochet(Pos1_,3,Pos_),in_list_exlude(NList_,Simb3, LastSimbol),put_pos93(Word,Pos1_,[Simb3]),in_list_exlude(LastSimbol,S1,LastSimb1),in_free_pos9(Word,S1),		 in_list_exlude(LastSimb1,S2,_),
in_free_pos9(Word,S2),write_str(Word),nl,fail.
put_pos9(Word,[H1,H2],[Res]):-select_pos9(Word,H1,Res),select_pos9(Word,H2,Res).
select_pos9(Word,H,Sim):-(H is 1->Word=[Sim,_,_,_,_,_,_,_,_],!);(H is 2->Word=[_,Sim,_,_,_,_,_,_,_],!);(H is 3->Word=[_,_,Sim,_,_,_,_,_,_],!);(H is 4->Word=[_,_,_,Sim,_,_,_,_,_],!);
(H is 5->Word=[_,_,_,_,Sim,_,_,_,_],!);(H is 6->Word=[_,_,_,_,_,Sim,_,_,_],!);(H is 7->Word=[_,_,_,_,_,_,Sim,_,_],!);(H is 8->Word=[_,_,_,_,_,_,_,Sim,_],!);
(H is 9->Word=[_,_,_,_,_,_,_,_,Sim]).

put_pos93(Word,[H1,H2,H3],[Res]):-select_pos9(Word,H1,Res),select_pos9(Word,H2,Res), select_pos9(Word,H3,Res).

in_free_pos9([H1,H2,H3,H4,H5,H6,H7,H8,H9],Sim):-(var(H1)->H1 is Sim),!;(var(H2)->H2 is Sim),!;(var(H3)->H3 is Sim),!;(var(H4)->H4 is Sim),!;(var(H5)->H5 is Sim),!;(var(H6)->H6 is Sim),!;
(var(H7)->H7 is Sim),!;(var(H8)->H8 is Sim),!;(var(H9)->H9 is Sim).

ex8:-tell('C:/Users/Admin/Documents/Prolog/лр9/in.txt'),write_str([[97],[97],[97],[97]]),nl,not(exr8),told.
exr8:- make(4,Pos),in_list(Pos,I),in_list([98,99,100,101,102],Simb1),put_pos4(Word,[I],[Simb1]), in_list_exlude([98,99,100,101,102],Simb1,_),		 in_free_pos4(Word,[97]),		 in_free_pos4(Word,[97]),		 in_free_pos4(Word,[97]),		 write_str(Word),nl,fail.
put_pos4(Word,[H1],[Res]):-select_pos4(Word,H1,Res).select_pos4(Word,H,Sim):-(H is 1->Word=[Sim,_,_,_],!);(H is 2->Word=[_,Sim,_,_],!);(H is 3->Word=[_,_,Sim,_],!);(H is 4->Word=[_,_,_,Sim],!).
in_free_pos4([H1,H2,H3,H4],Sim):-(var(H1)->H1 is Sim),!;(var(H2)->H2 is Sim),!;(var(H3)->H3 is Sim),!;(var(H4)->H4 is S

ex9:-tell('C:/Users/Admin/Documents/Prolog/лр9/in.txt'),not(exr9),nl,told.
exr9:-make(7,Pos),sochet(Pos_a,3,Pos),put_73(Word,Pos_a,[97]),in_list([97,98,99,100,101,102],S1),in_free_pos7(Word,S1),in_list([97,98,99,100,101,102],S2),in_free_pos7(Word,S2),
in_list([97,98,99,100,101,102],S3),in_free_pos7(Word,S3),in_list([97,98,99,100,101,102],S3),in_free_pos7(Word,S3),
write_str(Word),nl,fail.
