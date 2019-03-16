%1
last([N|nil],N).
last([H|T],X):- last1(T,X).
%2
last_but_1([H,F|nil],H).
last_but_1([H|T],X):- last_but_1(T,X).
%3
kele(X,[H|T],C):- C1 is C -1, kele(X,T,C1).
kele(X,[X|T],1).
%4
len([],0).
len([_|T],L):- len(T,L1), L is L1 +1.
%5
rever([],X,X).
rever([H|T],[_|R],Acc):- rever(T,R,[H|Acc]).
%6
pali(X):- rever(X,_,X).
%7
flatten([],[]).
flatten(X,[X]):- \+ is_list(X).

flatten([H|T],R):- flatten(H,Y), flatten(T,Y1), append(Y,Y1,R).
%8
compress1([H,H|T],R):- compress([H|T],R).
compress1([L,H|T],[H|T1]):- L\=H, compress([H|T],T1).
compress1([],[]).
compress1([X],[X]).




%TODO_Organize_Sol
appen([],[],L3).
appen([],[H|T],[H|T1]):- appen([],T,T1).
appen([H|T],L2,[H|T2]):- appen(T,L2,T2).

value_of(0,0).
value_of(s(X), Y):- value_of(X,Y1), Y is Y1 +1.
perm([],[]).
perm([H|T],L):- perm(T,P), insert(H,P,L).
insert2(X,L,[X|L]).


insert1(X,[],[X]).
insert1(X,[H|T],[X,H|T]).
insert1(X,[H|T],[H|NT]):- insert(X,T,NT).

adds(X,Y,Z):- value_of(X,L), value_of(Y,L1), Z is L + L1.

insert(X,[H|T],[F|R]):- insert(X,T,R).
insert(X,[X|T],[X,L4|R]).
insert(X,[],[X|R]).



sum1([],0).
sum1([H|T],S):-
sum1(T,T1),
S is H + T1.

sum_gen(X,N,R):- subset(R,X), sum1(R) == N.
is_Sorted([]).
is_Sorted([_]).
is_Sorted([X,T1|T2]):- X =< T1, is_Sorted([T1|T2]).

sortt(L,R):- sortt(L,R),is_Sorted(R).

intersect([X|T],[X|R],[X|L]):-
intersect(T,R,L).

intersect([],_,_).
intersect(_,[],_).

mem([X|_],X).
mem([H|T],E):- mem(T,E).


inter([X|T],H,Z):- \+ member(X,H), inter(T,H,Z).

inter([X|T],H,[X|Z]):- member(X,H), inter(T,H,Z).
inter([],_,[]).


union([H|T],Z,[H|Y]):- \+ member(H,Z), union(T,Z,Y).
union([H|T],Z,W):- member(H,Z), union(T,Z,W).
union([],X,X).




drop([H|T],C,R):-
len([H|T],L), C =< L  ,kele(X,[H|T],C), rem(X,[H|T],R), C1 is C *2, drop(T,C1,R).

drop([],_,[]).



repAll([],_,_,[]).
repAll([H|T],X,Y,[H|T2]):-
H \=X, repAll(T,X,Y,T2).

repAll([X|T],X,Y,[Y|T1]):-
  repAll(T,X,Y,T1).

rem(X,[],_).
rem(X,[X|R],R2):- rem(X,R,R2).
rem(X,[F|R],[F|S]) :-
                        X\==F,
                        rem(X,R,S).









rev(L1,L2):- rever(L1,L2,[]).




i2B(D,B):- i2b(D,B,null).
i2b(D,Y,B):-
D > 0,
D mod 2 =:= 0, D1 is D // 2, BN = s0(B),  i2b(D1,Y,BN).

i2b(D,Y,B):-
D >0,p
D mod 2 =:= 1, BN = s1(B), D1 is D // 2, i2b(D1,Y,BN).

i2b(0,X,X).



pack([H, H|HS], [[H|TFR]|TR]):-
    pack([H|HS], [TFR|TR]).
pack([H, T|TS], [[H]|TR]):-
    H \= T,
    pack([T|TS], TR).



compress([X],[X]).
compress([X,X|Xs],Zs) :- compress([X|Xs],Zs).
compress([X,Y|Ys],[X|Zs]) :- X \= Y, compress([Y|Ys],Zs).


mystery([] ,[]).
mystery([X,Y|XS],[Y|YS ]) :-
X > Y,
mystery([X|XS],YS).
mystery([X|XS],[X|YS]) :-
mystery( XS,YS ).

powerset([], []).
powerset([H|T], P) :- powerset(T,P).
powerset([H|T], [H|P]) :- powerset(T,P).


pinch([_|T], P):- append(M,[_],T),
pinch(M,P).
pinch(X, pair(H,L)):- last(X,L), X = [H|_].
