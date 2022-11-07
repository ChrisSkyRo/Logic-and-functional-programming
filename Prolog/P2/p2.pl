% Doubles the occurences of prime numbers in a list of integers

% double_primes(L: List, RL: List)
% L - the list of numbers to double the occurences of prime numbers on
% RL - the lists that results
% flux model (i, o) or (i, i)

double_primes([], []).

double_primes([H|T], [H|[H|RL1]]) :-
    prime(H),
    double_primes(T, RL1).

double_primes([H|T], [H|RL1]) :-
    not(prime(H)),
    double_primes(T, RL1).

% execution call: double_primes([3, 7, 22, 44, 17], RL).
% solution: RL = [3, 3, 7, 7, 22, 44, 17, 17]

% checks if a number is prime
prime(2).

prime(3).

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

% Doubles the occurences of prime numbers in each sublist of integers from a heterogeneous list

% double_primes_sublist(L: List, RL: List)
% L - the heterogeneous list
% RL - the list that results
% flux model (i, o) or (i, i)

% execution call: double_primes_sublist([1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5], RL).
% solution: RL = [1, [2, 2, 3, 3], 4, 5, [1, 4, 6], 3, [1, 3, 3, 7, 7, 9, 10], 5]

double_primes_sublist([], []).

double_primes_sublist([H|T], [RL1|RL2]) :-
    list(H),
    double_primes(H, RL1),
    double_primes_sublist(T, RL2).

double_primes_sublist([H|T], [H|RL1]) :-
    not(list(H)),
    double_primes_sublist(T, RL1).

% checks for non empty list
list([_|_]).
