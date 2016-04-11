clear all
clc

%nilai masukan untuk opsi
r=0.06;
T=1;
t=0;
tau=T-t;
S0=50;
K=60;
sigma=0.1;
L=4*S0;
h=1;
k1=0.0005;
k2=0.01;
m1=tau/k1; %waktu
m2=tau/k2; %waktu
m3=L/h; %panjang step
lamda1=k1/(h^2);
lamda2=k2/(h^2);

%opsi Call
%menghitung solusi eksak dari Black-Scholes
i=0;
for S=0:1:L
    i=i+1; 
    d1=(log(S/K)+(r+0.5*(sigma^2))*(T-t))/(sigma*sqrt(T-t));
    d2=d1-sigma*sqrt(T-t);
    C(i)=S*normcdf(d1,0,1)-K*exp(-r*(T-t))*normcdf(d2,0,1);
end;

%membuat matriks D1
D1=zeros(m3-1,m3-1);
a=1;
for i=1:m3-1
    D1(i,i)=a;
a=a+1;
end

%membuat matriks D2
D2=zeros(m3-1,m3-1);
b=1;
for i=1:m3-1
    D2(i,i)=b^2;
b=b+1;
end

%membuat matriks T1
T1=zeros(m3-1,m3-1);
T1(1,1:2) = [0 1];
T1(m3-1,m3-2:m3-1) = [-1 0];
z1=[-1 0 1];
for i=2:m3-2
    T1(i,i-1:i+1)=z1;
end

%membuat matriks T2
T2=zeros(m3-1,m3-1);
T2(1:2,1) = [-2;1];
T2(m3-2:m3-1,m3-1) = [1;-2];
z2=[1;-2;1];
for i=2:m3-2
    T2(i-1:i+1,i)=z2;
end

i=0;
for S=0:1:L
    i=i+1; 
    V(i,1)=max(S-K,0);
end

F=(1-r*k1)*eye(m3-1)+0.5*k1*sigma^2*D2*T2+0.5*k1*r*D1*T1;
for j=2:m1+1 %waktu
    V(1,j)=0;
    V(m3+1,j)=L;
    p=zeros(m3-1,1);
    p(1,j)=0.5*k1*(sigma^2-r)*V(1,j);
    p(m3-1,j)=0.5*k1*(m3-1)*(sigma^2*(m3-1)+r)*V(m3+1,j);
    V(2:m3,j)=F*V(2:m3,j-1)+p(:,j);
end
Vakhir= V(:,m1+1);
selisih= abs(C'-Vakhir);
