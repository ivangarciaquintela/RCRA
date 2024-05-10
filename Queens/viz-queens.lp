#script (python)
from clingo.symbol import String
def pos(x,y):
    return String(f"{str(x)},{str(y)}!")
#end.

dim(M+1):-#max{N:cell(_,N)}=M.
node((X,Y)):-cell(X,Y).
attr(node,(X,Y),width,1):-cell(X,Y).
attr(node,(X,Y),shape,square):-cell(X,Y).
attr(node,(X,Y),pos,@pos(Y,M-X)):-cell(X,Y),dim(M).
attr(node,(X,Y),style,filled):-cell(X,Y).
attr(node,(X,Y),fillcolor,gray):-cell(X,Y),(X+Y)\2=0.
attr(node,(X,Y),fillcolor,white):-cell(X,Y),(X+Y)\2!=0.
attr(node,(X,Y),label,"♕"):-queen(X,Y).
attr(node,(X,Y),label," "):-cell(X,Y), not queen(X,Y).
attr(node,(X,Y),fontsize,"50"):-queen(X,Y).
