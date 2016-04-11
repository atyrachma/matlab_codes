function z = numgradL1(b,x,y)
%Numerical z (numerical gradient of Lt1)
%The output is a matrix Kx1
 
k = length(b);
d = 1e-6;
e = eye(k);
 
for j=1:k   %numerical gradients
    bplus  = b + d*e(:,j);
    Lplus = feval('L1',bplus,x,y);
    bmin   = b - d*e(:,j);
    Lmin  = feval('L1',bmin,x,y);
    z(j,:) = (Lplus - Lmin)/(2*d);
end;