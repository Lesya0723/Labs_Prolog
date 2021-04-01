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

make(0,[]):-!.
make(K,[K|Tail]):-K1 is K-1,make(K1,Tail).

razm_p:-tell('C:/Users/Admin/Documents/Prolog/лр9/in.txt'),not(aa_razm_),told.
razm_P:-make(5,Pos),sochet(Pos_a,2,Pos),put(Word,Pos_a,[97]),in_list([98,99,100,101,102],S1),in_free_pos(Word,S1),in_list([98,99,100,101,102],S2),
in_free_pos(Word,S2),in_list([98,99,100,101,102],S3),in_free_pos(Word,S3),write_str(Word),nl,fail.

put(Word,[Head1,Head2],[Sim]):-select_pos(Word,Head1,Sim),select_pos(Word,Head2,Sim).

select_pos(Word,H,Res):-(H is 1->Word=[Res,_,_,_,_],!);(H is 2->Word=[_,Res,_,_,_],!);(H is 3->Word=[_,_,Res,_,_],!);(H is 4->Word=[_,_,_,Res,_],!);(H is 5->Word=[_,_,_,_,Res]).

in_free_pos([H1,H2,H3,H4,H5],Res):-(var(H1)->H1 is Res),!;(var(H2)->H2 is Res),!;
(var(H3)->H3 is Res),!;(var(H4)->H4 is Res),!;(var(H5)->H5 is Res).

