function L = Lt1(b,x,y)
 
%Log of likelihood function for the Cobb-Doughlass production function
%L = Lt1(b,x,y), the output is a vector Tx1
 
T  = length(y);
f  = f1(b,x);
s2 = (y-f)'*(y-f)/T;
L  = -0.5*(log(2*pi*s2) + ((y-f).^2)./s2);