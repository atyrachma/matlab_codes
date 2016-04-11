function f = phi2(X,par)

x = X(1) ;
y = X(2) ;
n = par(1) ;
alpha = par(2) ;
beta = par(3) ;
if y<=1 & y>= 0 ;
f = nchoosek(n,x)*y^(x+alpha-1)*(1-y)^(n-x+beta-1) ;
else
    f = 0 ;
end ;