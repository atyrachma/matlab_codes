clear all;
clc;

n=4;
x=[0 1 2 3 4];
fx=[1 0.5403023 -0.4161468 -0.9899925 -0.6535436];
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