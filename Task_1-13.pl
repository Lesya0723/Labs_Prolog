man(danil).
man(evgen).
man(ivan).
man(maksim).
man(anton).
man(alex).
man(roman).
man(vlad).
man(timofei).
man(semen).
man(dmitry).
man(oleg).

woman(daria).
woman(luba).
woman(lilia).
woman(ksu).
woman(albina).
woman(julia).
woman(valentina).
woman(maria).
woman(anna).
woman(inna).
woman(kate).
woman(anastasia).


parent(danil,evgen).
parent(danil,lilia).
parent(danil,maksim).
parent(danil,albina).


parent(daria,evgen).
parent(daria,lilia).
parent(daria,maksim).
parent(daria,albina).


parent(evgen,alex).
parent(evgen,roman).
parent(luba,alex).
parent(luba,roman).
parent(semen,luba).
parent(inna,luba).

parent(ivan,vlad).
parent(ivan,julia).
parent(lilia,vlad).
parent(lilia,julia).
parent(dmitry,ivan).
parent(kate,ivan).



parent(maksim,valentina).
parent(maksim,maria).
parent(ksu,valentina).
parent(ksu,maria).
parent(oleg,ksu).
parent(anastasia,ksu).


parent(anton,anna).
parent(anton,timofei).
parent(albina,anna).
parent(albina,timofei).
parent(oleg,anton).
parent(anastasia,anton).


men(X):-man(X),write(X),nl,fail.
women(X):-woman(X),write(X),nl,fail.

children(X,Y):-parent(Y,X).
allChildren(Y):-parent(Y,X),write(X),nl,fail.

mother(X,Y):-parent(X,Y),woman(X).
mother(X):-mother(Y,X),write(Y).

son(X,Y):-parent(Y,X),man(X),!.
son(X):-son(Y,X),write(Y),nl,fail.

brother(X,Y):-parent(Z,X),parent(Z,Y),man(X),woman(Z),not(X=Y).
brothers(X):-brother(Y,X),man(Y),write(Y),nl,fail.

sister(X,Y):-parent(Z,X),parent(Z,Y),woman(X),!.
sisters(X):-parent(Z,X),parent(Z,Y),woman(Y),woman(Z),not(Y=X),write(Y),nl,fail.

b_s(X,Y):-parent(Z,X),parent(Z,Y),woman(Z),not(X=Y).
b_s(X):-b_s(Y,X),write(Y),nl,fail.

grand_pa(X,Y):-parent(X,Z),parent(Z,Y),man(X).
grand_pas(X):-grand_pa(Y,X),write(Y),nl,fail.

daughter(X,Y):-parent(Y,X),woman(X),!.
grand_so(X,Y):-son(X,Z),(son(Z,Y);daughter(Z,Y)),man(X),!.
grand_sons(X):-parent(X,Z),parent(Z,Y),man(Y),write(Y),nl,fail.

grand_pa_and_son(X,Y):-(grand_pa(X,Y),!,man(X),man(Y));grand_so(X,Y),man(X),man(Y).

grand_da(X,Y):-daughter(X,Z),(son(Z,Y);daughter(Z,Y)),woman(X),!.
grand_pa_and_da(X,Y):-(grand_pa(X,Y),woman(Y),!);grand_da(X,Y),man(Y).

father(X,Y):-children(Y,X),man(X).
uncle(X,Y):-brother(X,Z),mother(Z,Y);brother(X,Z),father(Z,Y).
uncle(X):-uncle(Y,X),write(Y),nl,fail.

aunt(X,Y):-sister(X,Z),mother(Z,Y);sister(X,Z),father(Z,Y).
aunt(X):-aunt(Y,X),write(Y),nl,fail.

