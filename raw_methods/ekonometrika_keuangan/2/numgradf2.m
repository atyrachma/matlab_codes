function z=numgradf2(b,x)

%Numerical z (numerical gradient of f1)

k=length(b);
d=1e-7;
e=eye(k);

for j=1:k; %Numerical gradients
    bplus=b+d*e(:,j);
    fplus=feval('f2',bplus,x);
    bmin=b-d*e(:,j);
    fmin=feval('f2',bmin,x);
    z(:,j)=(fplus-fmin)/(2*d);
end

