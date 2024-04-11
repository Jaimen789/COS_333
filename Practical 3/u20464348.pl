%Task 1
%Facts

speaks(catalina, spanish).
speaks(pablo, spnaish).
speaks(john, english).
speaks(rachel, english).
speaks(john, german).
speaks(johanna, german).

%Rules
bilingual(X, L1, L2) :-
    speaks(X, L1),
    speaks(X, L2),
    dif(L1,L2).

canCommunicateTranslated(X,Y):-
    speaks(X, L1),
    speaks(Y, L2),
    dif(L1,L2),
    bilingual(_,L1,L2),
    dif(X,Y).

%Task 2
maximumElement(0,[]).
maximumElement(H, [H|T]):-
    maximumElement(TMax, T),
    H >= TMax.

maximumElement(TMax, [H|T]):-
    maximumElement(TMax,T),
    H < TMax.
