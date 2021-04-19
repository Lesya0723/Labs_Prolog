:-dynamic summer/2,command/2,stages/2,speed/2,accuracy/2,water/2,ball/2,target/2,grid/2,playh/2,bob/2,barbell/2,height/2,bike/2.


read_str(A) :-get0(X),r_str(X, A, []).
r_str(10, A, A) :- !.
r_str(X, A, B) :-append(B, [X], B1),get0(X1),r_str(X1, A, B1).

summer_r(X,Y):-repeat,(summer(X,Y)->(nl,write(X),nl,write(Y),write("."),retract(summer(X,Y)));X=nil,Y=nil).
command_r(X,Y):-repeat,(command(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(command(X,Y)));X=nil,Y=nil).
stages_r(X,Y):-repeat,(stages(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(stages(X,Y)));X=nil,Y=nil).
speed_r(X,Y):-repeat,(speed(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(speed(X,Y)));X=nil,Y=nil).
accuracy_r(X,Y):-repeat,(accuracy(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(accuracy(X,Y)));X=nil,Y=nil).
water_r(X,Y):-repeat,(water(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(water(X,Y)));X=nil,Y=nil).
ball_r(X,Y):-repeat,(ball(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(ball(X,Y)));X=nil,Y=nil).
target_r(X,Y):-repeat,(target(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(target(X,Y)));X=nil,Y=nil).
grid_r(X,Y):-repeat,(grid(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(grid(X,Y)));X=nil,Y=nil).
playh_r(X,Y):-repeat,(playh(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(playh(X,Y)));X=nil,Y=nil).
bob_r(X,Y):-repeat,(bob(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(bob(X,Y)));X=nil,Y=nil).
barbell_r(X,Y):-repeat,(barbell(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(barbell(X,Y)));X=nil,Y=nil).
height_r(X,Y):-repeat,(height(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(height(X,Y)));X=nil,Y=nil).
bike_r(X,Y):-repeat,(bike(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(bike(X,Y)));X=nil,Y=nil).


prTell:-tell('C:/Users/Admin/Documents/Prolog/лр2/summer.txt'),summer_r(X1,_),X1=nil,told,
     tell('C:/Users/Admin/Documents/Prolog/лр2/command.txt'),command_r(X2,_),X2=nil,told,
     tell('C:/Users/Admin/Documents/Prolog/лр2/stages.txt'),stages_r(X3,_),X3=nil,told,
     tell('C:/Users/Admin/Documents/Prolog/лр2/speed.txt'),speed_r(X4,_),X4=nil,told,
     tell('C:/Users/Admin/Documents/Prolog/лр2/accuracy.txt'),accuracy_r(X5,_),X5=nil,told,
     tell('C:/Users/Admin/Documents/Prolog/лр2/water.txt'),water_r(X6,_),X6=nil,told,
     tell('C:/Users/Admin/Documents/Prolog/лр2/ball.txt'),ball_r(X7,_),X7=nil,told,
     tell('C:/Users/Admin/Documents/Prolog/лр2/target.txt'),target_r(X8,_),X8=nil,told,
     tell('C:/Users/Admin/Documents/Prolog/лр2/grid.txt'),grid_r(X9,_),X9=nil,told,
     tell('C:/Users/Admin/Documents/Prolog/лр2/playh.txt'),playh_r(X10,_),X10=nil,told,
     tell('C:/Users/Admin/Documents/Prolog/лр2/bob.txt'),bob_r(X11,_),X11=nil,told,
     tell('C:/Users/Admin/Documents/Prolog/лр2/barbell.txt'),barbell_r(X12,_),X12=nil,told,
     tell('C:/Users/Admin/Documents/Prolog/лр2/height.txt'),height_r(X13,_),X13=nil,told,
     tell('C:/Users/Admin/Desktop/olesya/bike.txt'),bike_r(X14,_),X14=nil,told.


prSee:-see('C:/Users/Admin/Documents/Prolog/лр2/summer.txt'), get0(Sym1), read_data(Sym1,1), seen,
     see('C:/Users/Admin/Documents/Prolog/лр2/command.txt'), get0(Sym2), read_data(Sym2,2), seen,
     see('C:/Users/Admin/Documents/Prolog/лр2/stages.txt'), get0(Sym3), read_data(Sym3,3), seen,
     see('C:/Users/Admin/Documents/Prolog/лр2/speed.txt'), get0(Sym4), read_data(Sym4,4), seen,
     see('C:/Users/Admin/Documents/Prolog/лр2/accuracy.txt'), get0(Sym5), read_data(Sym5,5), seen,
     see('C:/Users/Admin/Documents/Prolog/лр2/water.txt'), get0(Sym6), read_data(Sym6,6), seen,
     see('C:/Users/Admin/Documents/Prolog/лр2/ball.txt'), get0(Sym7), read_data(Sym7,7), seen,
     see('C:/Users/Admin/Documents/Prolog/лр2/target.txt'), get0(Sym8), read_data(Sym8,8), seen,
     see('C:/Users/Admin/Documents/Prolog/лр2/grid.txt'), get0(Sym9), read_data(Sym9,9), seen,
     see('C:/Users/Admin/Documents/Prolog/лр2/playh.txt'), get0(Sym10), read_data(Sym10,10), seen,
     see('C:/Users/Admin/Documents/Prolog/лр2/bob.txt'), get0(Sym11), read_data(Sym11,11), seen,
     see('C:/Users/Admin/Documents/Prolog/лр2/barbell.txt'), get0(Sym12), read_data(Sym12,12), seen,
     see('C:/Users/Admin/Documents/Prolog/лр2/height.txt'), get0(Sym13), read_data(Sym13,13), seen,
     see('C:/Users/Admin/Documents/Prolog/лр2/bike.txt'), get0(Sym14), read_data(Sym14,14), seen.



read_data(-1, _) :- !.
read_data(_, Flag) :-read_str(Lang),name(X, Lang),read(Y),
            (
              Flag = 1 ->asserta(summer(X, Y));
            (
              Flag = 2 ->asserta(command(X, Y));
            (
              Flag = 3 ->asserta(stages(X, Y));
            (
              Flag = 4 ->asserta(speed(X, Y));
            (
              Flag = 5 ->asserta(accuracy(X, Y));
            (
              Flag = 6 ->asserta(water(X, Y));
            (
              Flag = 7 ->asserta(ball(X, Y));
            (
              Flag = 8 ->asserta(target(X, Y));
            (
              Flag = 9 ->asserta(grid(X, Y));
            (
              Flag = 10 ->asserta(playh(X, Y));
            (
              Flag = 11 ->asserta(bob(X, Y));
            (
              Flag = 12 ->asserta(barbell(X, Y));
            (
              Flag = 13 ->asserta(height(X, Y));
            (
              Flag = 14 ->asserta(bike(X, Y)))))))))))))))),
         get0(Sym),
         read_data(Sym, Flag).










question1(X1):-	write("Is this a summer sport?"),nl,
    write("2.does not depend on the season"),nl,
				write("1. Yes"),nl,
				write("0. No"),nl,

				read(X1).
question2(X2):-	write("Is this sport a team sport?"),nl,
				write("2. all"),nl,

				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X2).

question3(X3):-	write("Does this sport have several stages?"),nl,
                                write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X3).

question4(X4):-	write("Is this sport focused on speed?"),nl,
                                write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X4).
question5(X5):-	write("Is this sport focused on accuracy?"),nl,
                                write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X5).
question6(X6):-	write("Is this sport related to water?"),nl,
    write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X6).
question7(X7):-	write("Is there a ball in this sport?"),nl,
                                write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X7).
question8(X8):-	write("Is there a target in this sport?"),nl,
                                write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X8).
question9(X9):-	write("Is there a net in this sport?"),nl,
                                write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X9).

question10(X10):- write("Do your hands play a major role in this sport?"),nl,
                                write("2.not only hands"),nl,
                                write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X10).
question11(X11):-	write("Is there a bob in this sport?"),nl,
                                write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X11).
question12(X12):-	write("Is a barbell used in this sport?"),nl,
                                write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X12).
question13(X13):-	write("Is this sport related to altitude?"),nl,
                                write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X13).
question14(X14):-	write("Is a bicycle used in this sport?"),nl,

                                write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X14).




pr :-prSee,question1(X1),question2(X2),question3(X3),question4(X4),question5(X5),
        question6(X6),question7(X7),question8(X8),question9(X9),question10(X10),
        question11(X11),question12(X12),question13(X13),question14(X14),

        (summer(X,X1),command(X,X2),stages(X,X3),speed(X,X4),accuracy(X,X5),
         water(X,X6),ball(X,X7),target(X,X8),grid(X,X9),playh(X,X10),
         bob(X,X11),barbell(X,X12),height(X,X13),bike(X,X14),write(X);
         (write("Character -> "),
          read(Character),
          asserta(summer(Character, X1)),
          asserta(command(Character, X2)),
          asserta(stages(Character, X3)),
          asserta(speed(Character, X4)),
          asserta(accuracy(Character, X5)),
          asserta(water(Character, X1)),
          asserta(ball(Character, X1)),
          asserta(target(Character, X1)),
          asserta(grid(Character, X1)),
          asserta(playh(Character, X1)),
          asserta(bob(Character, X1)),
          asserta(barbell(Character, X1)),
          asserta(height(Character, X1)),
          asserta(bike(Character, X1)),
          prTell,nl,
          write("Character was added!"))).
