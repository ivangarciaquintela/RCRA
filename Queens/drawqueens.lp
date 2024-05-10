#program display.
#const csize=30.
&display{window,h=S,w=S,caption="sudoku"} :- S=csize*n+6.
cell(X,Y) :- X=1..n,Y=1..n.
cellcolor(X,Y,"b") :- cell(X,Y),(X+Y)\2=1.
cellcolor(X,Y,"w") :- cell(X,Y), not cellcolor(X,Y,"b").
cellcontent(X,Y,"queen") :- queen(X,Y).
cellcontent(X,Y,"square") :- cell(X,Y), not queen(X,Y).

&display{image=[V,C,".png"],x=X1,y=Y1} :- 
   cellcontent(X,Y,V), cellcolor(X,Y,C),Y1=(X-1)*csize+3, X1=(Y-1)*csize+3.
