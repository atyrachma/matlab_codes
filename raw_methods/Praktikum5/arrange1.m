clear all;
clc;
x=[-2.5 -2 -1.9 -1 0 1 1.5 2 2.5]
fx=[35.94 -8.8 -3.61 -0.6 4 -0.4 -0.2 16.8 86.13]
eps=10^-5;
xb=0.5;

n=3; %n=derajat
ndata=9;


a(1)=35.94;
a(2)=-89.48;
a(3)=235.633;
a(4)=-189.459;
a(5)=85.62697856;
a(6)=-26.9779729;
a(7)=7.474865979;
a(8)=-1.786196812;
a(9)=0.4009822;

%polinom
i=1
polx(1)=fx(1);
sum=xb-x(1);
polx(2)=polx(1)+a(2)*sum;
polnewton=polx(2)
krit=(polx(2)-polx(1))/polx(2);

while krit > eps
    i=i+1
    sum=sum*(xb-x(i));
    polx(i+1)=polx(i)+(sum*a(i+1));
    polnewton=polx(i+1)
    krit=abs(polx(i+1)-polx(i))/polx(i+1);
end
disp(['Jadi, nilai f(0.5)= ',num2str(polx(i+1))])
