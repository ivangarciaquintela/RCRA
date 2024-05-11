% Definir las coordenadas de las filas y columnas
c(0..n-1).
r(0..n-1).
dir(h;v).
% Black Points.
black(X, Y) :- black(N), X = N / n, Y = N \ n.

% White Points.
white(X, Y) :- white(N), X = N / n, Y = N \ n.

% Points.
point(X,Y) :- white(X,Y), r(X), c(Y).
point(X,Y) :- black(X,Y), r(X), c(Y).

% Line conection.
{line(S,X,Y)} :- dir(S), r(X), c(Y).
:- line(h,X,n-1), r(X).
:- line(v,n-1,Y), c(Y).

% Rule to cross points.
through(X,Y) :- line(S,X,Y), r(X), c(Y), dir(S).
through(X,Y+1) :- line(h,X,Y), Y < n-1, r(X), c(Y).
through(X+1,Y) :- line(v,X,Y), X < n-1, r(X), c(Y).

:- point(X,Y), not through(X,Y).

% Every cell is connected by 2 ways
:- 3 {line(h,X,Y); line(v,X,Y); line(v,X-1,Y); line(h,X,Y-1)}, through(X,Y).
:- {line(h,X,Y); line(v,X,Y); line(v,X-1,Y); line(h,X,Y-1)} 1, through(X,Y).

% Every cell is avaliable from other cells.
% Adjacent
adj(X,Y,X+1,Y) :- line(v,X,Y), X<n.
adj(X,Y,X,Y+1) :- line(h,X,Y), Y<n.
adj(X,Y,W,Z) :- adj(W,Z,X,Y).
% Avaliable
available(X,Y,X,Y) :- through(X,Y), r(X), c(Y).
available(X,Y,X',Y') :- adj(X1,Y1,X,Y), available(X1,Y1,X',Y'), r(X), c(Y), r(X'), c(Y'), r(X1), c(Y1).
:- through(X,Y), through(X',Y'), not available(X,Y,X',Y').

% Turn at black point
:- black(X,Y), line(v,X,Y), line(v,X-1,Y), r(X), c(Y).
:- black(X,Y), line(h,X,Y), line(h,X,Y-1), r(X), c(Y).

% Straight line throught white point
:- white(X,Y),r(X), c(Y), 1 {line(h,X,Y); line(h,X,Y-1)}, 1 {line(v,X,Y); line(v,X-1,Y)}.

% Turn line the previous and/or next to white point
:- white(X,Y), line(h,X,Y), line(h,X,Y-1), line(h,X,Y-2), line(h,X,Y+1).
:- white(X,Y), line(v,X,Y), line(v,X-1,Y), line(v,X+1,Y), line(v,X-2,Y).

% Straight line the next and previous to black.
:- black(X,Y),1 {line(v,X,Y+1); line(v,X-1,Y+1)}, line(h,X,Y).
:- black(X,Y),1 {line(v,X,Y-1); line(v,X-1,Y-1)}, line(h,X,Y-1).
:- black(X,Y),1 {line(h,X+1,Y); line(h,X+1,Y-1)}, line(v,X,Y).
:- black(X,Y),1 {line(h,X-1,Y-1); line(h,X-1,Y)},line(v,X-1,Y).


% Parse to decode.
seg(A,B) :- line(h, X, Y), A = X * n + Y, B=A+1.
seg(A,B) :- line(v, X, Y), A = X * n + Y, B=A+n.

#show seg/2.