% Facts: Define parent relationships
parent(john, mary).
parent(john, bob).
parent(jane, mary).
parent(jane, bob).
parent(mary, lisa).
parent(bob, patrick).

% Rules: Define different types of relationships
father(Father, Child) :-
    parent(Father, Child),
    male(Father).

mother(Mother, Child) :-
    parent(Mother, Child),
    female(Mother).

% Define sibling relationship
sibling(Sibling1, Sibling2) :-
    parent(Parent, Sibling1),
    parent(Parent, Sibling2),
    Sibling1 \= Sibling2.

% Define grandfather relationship
grandfather(Grandfather, Grandchild) :-
    parent(Parent, Grandchild),
    father(Grandfather, Parent).

% Define grandmother relationship
grandmother(Grandmother, Grandchild) :-
    parent(Parent, Grandchild),
    mother(Grandmother, Parent).

% Define male and female individuals
male(john).
male(bob).
male(patrick).

female(jane).
female(mary).
female(lisa).

% Example queries
% Querying who are the children of John and Jane
% ?- parent(john, Child).
% Output: Child = mary
% Child = bob

% ?- parent(jane, Child).
% Output: Child = mary
% Child = bob

% Querying for siblings
% ?- sibling(mary, bob).
% Output: true (since Mary and Bob are siblings)

% Querying for grandparents
% ?- grandfather(X, patrick).
% Output: X = john

% ?- grandmother(X, lisa).
% Output: X = jane
