clear all;
clc;
disp('Metode Tali Busur (Secant)')
f=inline ('1/(x^2+2*x)-1')
disp('(Tebakan awal 0.05 dan 0.5 dan iterasi maksimum 20)')
a=10.05;
b=10.06;
eps=10^-6;
maks=20;
n=1
fa=f(a);
fb=f(b);
c=a-fa*(b-a)/(fb-fa);
fc=f(c);
delta=abs(c-b)/abs(c);


if delta < 10^-6 
    disp('Proses Gagal')
    break
end

while (delta >= eps)
        a=b;
        b=c;
        fa=f(a);
        fb=f(b);
        c=a-fa*(b-a)/(fb-fa);
        fc=f(c);
        delta=abs(c-b)/abs(c);
        akar_iterasi=c
        if delta > eps
            n=n+1
        end         
 
end

Banyaknya_iterasi=n
Akar=c
