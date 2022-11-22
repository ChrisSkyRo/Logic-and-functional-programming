% Replace every non prime number with its divisors

% add_divisors(L: List, RL: List)
% L - the list to alter
% RL - the list that results
% flux model (i, o) or (i, i)

add_divisors([], []).

add_divisors([H|T], [H|RL]) :-
    prime(H),
    add_divisors(T, RL).

add_divisors([H|T], RL) :-
    not(prime(H)),
    get_divisors(H, 1, RL1),
    add_divisors(T, RL2),
    concatenate(RL1, RL2, RL).

% execution call: add_divisors([1, 2, 3, 4, 5, 6, 7, 8], RL).
% solution: RL = [1, 2, 3, 1, 2, 4, 5, 1, 2, 3, 6, 7, 1, 2, 4, 8]

% checks if a number is prime
prime(2):-!.

prime(3):-!.

prime(X) :-
    X > 3,
    X mod 2 =\= 0,
    prime_(X, 3).

prime_(X, N) :-
    N*N > X.

prime_(X, N) :-
    N*N =< X,
    X mod N =\= 0,
       M is N + 2,
       prime_(X, M).

% returns the list of divisors of a number
get_divisors(N, D, []) :-
    D > N.

get_divisors(N, D, [D|RL]) :-
    D =< N,
    N mod D =:= 0,
        DD is D + 1,
        get_divisors(N, DD, RL).

get_divisors(N, D, RL) :-
    D =< N,
    N mod D =\= 0,
        DD is D + 1,
        get_divisors(N, DD, RL).

% concatenates two lists
concatenate([H|T], L2, [H|RL]) :-
    concatenate(T, L2, RL).

concatenate([], [H|T], [H|RL]) :-
    concatenate([], T, RL).

concatenate([], [], []).
