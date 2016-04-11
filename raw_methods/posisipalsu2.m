clear all;
clc;
disp('Metode Posisi Palsu')
f=inline ('1/(x^2+2*x)-1')
a=0.05;
b=10.00;
eps=10^-6;
fa=f(a);
fb=f(b);
if fa*fb>0 
    disp('Proses Gagal')
    break
end

n=1
clama=2*b-a;
c=b-fb*(b-a)/(fb-fa);
   fc=f(c);
    if fa*fc<0
        b=c;
        fb=fc;
    else
        a=c;
        fa=fc;
    end
   
   delta=abs(c-clama);
   clama=c;
   akar_iterasi=clama

while delta >= eps
   c=b-fb*(b-a)/(fb-fa);
   fc=f(c);
    if fa*fc<0
        b=c;
        fb=fc;
    else
        a=c;
        fa=fc;
    end
   
   delta=abs(c-clama);
   clama=c;
   if delta>eps
       n=n+1
       akar_iterasi=clama
       end
   
       
       
end
Banyaknya_iterasi=n
Akar=c