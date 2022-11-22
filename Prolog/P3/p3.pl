% Generates all possible bets for 4 games
% bets can be 1 (home victory), 'X' (draw), 2 (away victory)
% the last bet cannot be 2
% there must not be more than two 'X' bets

% pronosport(K: Integer, I: Integer, RL: List)
% K - the step of the backtracking
% I - the value being used
% RL - the list that results
% flux model (i, o, o) nedeterminist

pronosport(0, _, RL) :-
    !,
    pronosport(1, _, RL),
    verifyX(RL, 2).

pronosport(5, _, []):-!.

pronosport(K, 1, [1|RL]) :-
    W is K + 1,
    pronosport(W, _, RL).

pronosport(K, 2, ['X'|RL]) :-
    W is K + 1,
    pronosport(W, _, RL).

pronosport(K, 3, [2|RL]) :-
    K =\= 4,
    W is K + 1,
    pronosport(W, _, RL).

% execution call: pronosport(0, I, RL).
% solutions: RL = [1, 1, 1, 1] ;
%            RL = [1, 1, 1, 'X'] ;
%            RL = [1, 1, 'X', 1] ;
%            RL = [1, 1, 'X', 'X'] ;
%            RL = [1, 1, 2, 1] ; ...

% verifies if there were more than two 'X' bets generated
verifyX([], C) :-
    C >= 0.

verifyX(['X'|T], C) :-
    !,
    N is C - 1,
    verifyX(T, N).

verifyX([_|T], C) :-
    verifyX(T, C).
