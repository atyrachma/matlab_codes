clear all;
clc;

n=3;
x=[1 6 4];
fx=[0 1.791759469 1.386294361];
z=1.5;
eps=10^-6;

plama=fx(1);
faktor=1;
b(1)=fx(1);
i=2;
lanjut=true;
while (i<=n) && lanjut
    i
    b(i)=fx(i);
    for j=i-1:-1:1
        b(j)=(b(j+1)-b(j))/(x(i)-x(j));
    end
    faktor=faktor*(z-x(i-1));
    galat=b(1)*faktor;
    pnewton=plama+galat
    if abs(galat)<eps
        lanjut=false;
    end
    plama=pnewton;
    i=i+1;
end
    
disp(['Jadi, nilai f(2)= ',num2str(pnewton)])    