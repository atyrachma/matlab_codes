clear all;
clc;
tic
h1=0.1; k1=0.0005; lambda1=0.05;
h2=0.1; k2=0.01; lambda2=1;
alpha=1;
t=0.5;
h=h1;
k=k1;
level=round(t/k);
m=1/h;
for i=1:m+1
    W(i,1)=0;
end
lambda=alpha^2*k/h^2;

A=zeros(m-1,m-1);
A(1:2,1)=[1+lambda;-lambda/2];
A(m-2:m-1,m-1)=[-lambda/2;1+lambda];
v=[-lambda/2;1+lambda;-lambda/2];
for i=2:m-2
    A(i-1:i+1,i)=v;
end
A
C=inv(A);
B=2*eye(m-1)-A;

for i=1:m+1;
    x(i)=(i-1)*h;
end

for i=1:m
    W(1,i+1)=sin(pi*x(i+1));
end
for i=1:level+1
    W(i,1)=0; W(i,m+1)=0;
end

for i=1:level
    W(i+1,2:m)=C*B*W(i,2:m)';
end
u=exp(-pi^2*t)*sin(pi*x); %solusi eksak
W(1001,:)
toc

