clear all;
clc;
disp('Metode Tali Busur (Sekan)')
f=inline ('1/(x^2+2*x)-1')
disp('(Tebakan awal 0.05 dan 0.5)')
a=0.05;
b=0.5;
eps=10^-6;

fa=f(a);
fb=f(b);
n=1

c=b-fb*(b-a)/(fb-fa);
fc=f(c);
delta=abs(c-b)/abs(c);

while (delta >= eps)
        a=b;
        b=c;
        fa=f(a);
        fb=f(b);
        c=b-fb*(b-a)/(fb-fa);
        fc=f(c);
        delta=abs(c-b)/abs(c);
        akar_iterasi=c
        if delta > eps
            n=n+1
        end         
 
end

Banyaknya_iterasi=n
Akar=c
