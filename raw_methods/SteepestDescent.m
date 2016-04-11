clear all;
clc;
syms x1 x2
eps=10^-10;
f=[2*x1^2*x2^2-2*x1*x2+2*x1^3+x1^4]


Gradient=jacobian([f],[x1;x2])
Hessian=jacobian([Gradient],[x1;x2])
% x1=input('x1 = ');
% x2=input('x2 = ');
% f(x1,x2)
x1=-1;
x2=0;
subs(x1,x2)
