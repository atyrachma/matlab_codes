function L = L1(b,x,y)
 
%Log of likelihood function for the Cobb-Doughlass production function
%L = L1(b,x,y), the output is a vector 1x1
 
T  = length(x);
f  = f1(b,x);
s2 = (y-f)'*(y-f)/T;
L  = -0.5*(log(2*pi*s2)+(y-f)'*(y-f)/s2);