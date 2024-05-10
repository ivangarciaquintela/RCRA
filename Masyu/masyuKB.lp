#const n =25.
col(1..n). 
row(1..n). 
dir(v;h).

%Lineas que pasan entre celdas.
{line(S,X,Y)} :- dir(S), col(X), row(Y).
:- line(h,n,Y), row(Y).
:- line(v,X,m), col(X).

%incluimos circulos
:- circle(X,Y), not on(X,Y).

%Pueden ser negros o blancos.
circle(X,Y) :- black(X,Y), col(X), row(Y).
circle(X,Y) :- white(X,Y), col(X), row(Y).

on(X,Y) :- line(S,X,Y), dir(S), col(X), row(Y).
on(X+1,Y) :- line(h,X,Y), col(X), row(Y), X<n.
on(X,Y+1) :- line(v,X,Y), col(X), row(Y), Y<m.

%1.Todas las aristas deben formar un único bucle lineal. 
%No se permiten cruces ni ramificaciones.
%2.El bucle debe pasar por todos los círculos.
%3.Cada círculo blanco debe ser atravesado en línea recta, 
%pero debe haber algún giro en su punto anterior o en el siguiente (o en ambos).
%4.Cada círculo negro debe estar siempre en la esquina de una vuelta, pero sus puntos anterior y siguiente no pueden contener vueltas.
