clear all;
clc;
disp('Metode Tali Busur (Sekan)')
f=inline ('(1/(x^2+2*x))-1')
disp('(Tebakan awal 0.05 dan 0.5)')
a=9.05;
b=0.5;
eps=10^-6;
fa=f(a);
fb=f(b);
n=1
cl=2*b-a;
c=b-fb*(b-a)/(fb-fa);
fc=f(c);
delta=abs(c-cl)/abs(c);
cl=c;
akar_iterasi=cl


while (delta >= eps)
    a=b;
    b=c;
    fa=f(a);
    fb=f(b);
    if delta>eps
       n=n+1
     end
    c=b-fb*(b-a)/(fb-fa);
    fc=f(c);
    delta=abs(c-cl)/abs(c);
    cl=c;
    akar_iterasi=cl
end
 
Banyaknya_iterasi=n
Akar=cl
