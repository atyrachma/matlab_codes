function z = numgradLt1(b,x,y)
%Numerical z (numerical gradient of Lt1)
%The output is a matrix TxK
 
k = length(b);
d = 1e-6;
e = eye(k);
 
for j=1:k   %numerical gradients
    bplus  = b + d*e(:,j);
    Ltplus = feval('Lt1',bplus,x,y);
    bmin   = b - d*e(:,j);
    Ltmin  = feval('Lt1',bmin,x,y);
    z(:,j) = (Ltplus - Ltmin)/(2*d);
end;