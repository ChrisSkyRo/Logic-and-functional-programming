% Removes all duplicates from a list of numbers

% remove_duplicates(L: List, RL: List)
% L - the list of number to remove the duplicates from
% RL - the list that results after removing
% flux model (i, o) or (i, i)

remove_duplicates([], []).

remove_duplicates([H|T], RL) :-
    appears(T, H),
    remove_elem(T, RL1, H),
    remove_duplicates(RL1, RL).

remove_duplicates([H|T], [H|RL1]) :-
    not(appears(T, H)),
    remove_duplicates(T, RL1).

% execution call: remove_duplicates([1,2,1,4,1,3,4], RL).
% solution: RL = [2, 3]

% checks whether X appears in the list
appears([H|_], X) :-
    H == X.

appears([_|T], X) :-
    appears(T, X).

% Removes all appearances of the max number from a list of integers

% remove_max(L: List, RL: List)
% L - the list of integers to remove the max from
% RL - the list that results after removing
% flux model (i, o) or (i, i)

remove_max(L, RL) :-
    max_list(L, R),
    M is R,
    remove_elem(L, RL, M).

% execution call: remove_max([1,2,10,5,6,7,3,4,8,9], RL).
% solution: RL = [1, 2, 5, 6, 7, 3, 4, 8, 9]

% Calculates the max from a list of integers

% max_list(L: List, R: Integer)
% L - the list of integers we calculate the max for
% R - the result
% flux model (i,o) or (i,i)

max_list([], -2000000). % initializes the max

max_list([H|T], R) :-   % slices the list in head and tail
    max_list(T, R1),    % find the max for the rest of the list
    max(H, R1, R).      % gets the max from the head and the rest of the list

% execution call: max_list([1,2,10,5,6,7,3,4,8,9], R).
% solution: R = 10

% calculate the max of two integers
max(A, B, A) :-
    A >= B.

max(A, B, B) :-
    A < B.

% Removes all occurences of an integer from a list

% remove_elem(L: List, RL: List, M: Integer)
% L - the list from which we want to remove
% RL - the list that results after removing
% M - the integer to remove
% flux model (i,o,i) or (i,i,i)

remove_elem([], [], _).

remove_elem([H|T], [H|RL1], M) :-
    H =\= M,
    remove_elem(T, RL1, M).

remove_elem([H|T], RL, M) :-
    H == M,
    remove_elem(T, RL, M).

% execution call: remove_elem([1,3,10], RL, 10).
% solution: RL = [1, 3]

