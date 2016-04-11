clear all;
clc;
disp('Metode Tali Busur (Secant)')
f=inline ('1/(x^2+2*x)-1')
disp('(Tebakan awal 0.05 dan 0.5)')
a=0.05;
b=1.5;
eps=10^-6;
maks=20;
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
    if delta > eps
            n=n+1
    end
    a=b;
    b=c;
    fa=f(a);
    fb=f(b);
    cl=2*b-a;
    c=b-fb*(b-a)/(fb-fa);
    fc=f(c);
    delta=abs(c-cl)/abs(c);
    cl=c;
    akar_iterasi=cl    
 end

Banyaknya_iterasi=n
Akar=c
