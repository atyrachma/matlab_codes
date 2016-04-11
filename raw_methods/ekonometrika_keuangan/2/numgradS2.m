function z=numgradS2(b,x,y)

%Numerical z (numerical gradient of L)
%The output is a vector Kx1

k=length(b);
d=1e-6;
e=eye(k);

for j=1:k; %Numerical gradients
    bplus=b+d*e(:,j);
    fplus=feval('f2',bplus,x);
    Splus=(y-fplus)'*(y-fplus);
    bmin=b-d*e(:,j);
    fmin=feval('f2',bmin,x);
    Smin=(y-fmin)'*(y-fmin);
    z(j,:)=(Splus-Smin)/(2*d);
end