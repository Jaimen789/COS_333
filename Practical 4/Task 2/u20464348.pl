elementAt(1, [X|_], X). % Base case: Element is at the first position.

elementAt(N, [_|T], X) :-
    N > 1,            % Ensure N is a positive integer.
    N1 is N - 1,      % Decrement N by 1 for the recursive call.
    elementAt(N1, T, X).
