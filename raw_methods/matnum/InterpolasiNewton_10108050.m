%{
Aty Rachmawati
10108050
K-01
Praktikum Matematika Numerik V
%}
clear all;
clc;

disp(' ')
disp('POLINOM INTERPOLASI (BEDA TERBAGI) NEWTON')
disp(' ')
disp('=========================================================================================================')
ndata=9; %jumlah data
n=9; %n-1=derajat polinom
disp(' ')
disp('Diketahui data berikut ')
x=[-2.5 -2 -1.9 -1 0 1 1.5 2 2.5]
fx=[35.94 -8.8 -3.61 -0.6 4 -0.4 -0.2 16.8 86.13]
eps=10^-5;
z=0.5;
disp(' ')
disp(['Misalkan nilai f(',num2str(z),') dihampiri dengan polinom derajat ',num2str(n-1)])
disp(' ')
disp(['Berikut ini adalah nilai hampiran f(',num2str(z),') untuk polinom derajat k'])
plama=fx(1);
faktor=1;
k=0;
a(1)=fx(1);
pnewton=a(1);
i=2;
lanjut=true;
while (i<=n) && lanjut
    k=i-1 %nilai hampiran f(z) untuk tiap derajat akan ditampilkan
    a(i)=fx(i);
    for j=i-1:-1:1
        a(j)=(a(j+1)-a(j))/(x(i)-x(j));
    end
    faktor=faktor*(z-x(i-1));
    galat=a(1)*faktor;
    pnewton=plama+galat
    if abs(galat)<eps
        lanjut=false;
    end
    plama=pnewton;
    i=i+1;
end
disp(' ')
disp('---------------------------------------------------------------------------------------------------------')
disp(' ')
disp(['Jadi, nilai hampiran f(',num2str(z),')= ',num2str(pnewton)])    