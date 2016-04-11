clear all;clc;format short g
% MA5262 Komputasi Keuangan
% Tugas Program Penentuan Solusi PDP dengan Metode Backward Difference
% Aty Rachmawati (10108050)
disp('Program Penentuan Solusi PDP dengan Metode Backward Difference')
tic
h1=0.1; k1=0.0005; lambda1=0.05; %soal (a)
h2=0.1; k2=0.01; lambda2=1;      %soal (b)
alpha=1;
t=0.5;
h=h1;
k=k2;             % = k1 atau k2		
level=round(t/k); % banyak subselang untuk t
m=1/h;
lambda=alpha^2*k/h^2;

for i=1:m+1;
    x(i)=(i-1)*h;
end

u=exp(-pi^2*t)*sin(pi*x); %solusi eksak

for i=1:m
    W(1,i+1)=sin(pi*x(i+1)); %syarat awal
end

for i=1:level+1
    W(i,1)=0; W(i,m+1)=0; %syarat batas
end

A=zeros(m-1,m-1);
A(1:2,1)=[(1+2*lambda);-lambda];
A(m-2:m-1,m-1)=[-lambda;1+2*lambda];
v=[-lambda;1+2*lambda;-lambda];
for i=2:m-2
    A(i-1:i+1,i)=v;
end
A;
B=inv(A);
for i=1:level
    W(i+1,2:m)=B*W(i,2:m)';
end

toc

wbd=W(level+1,:)' %solusi metode BD
galatbd=abs(wbd-u') %galat metode BD
teks = {'x' 'Eksak' 'BD' 'GalatBD'}; tcell=cellstr(teks);
[tcell ;num2cell([x' u' wbd galatbd])]

figure(1)
hold on
plot(x,u,'.b')
plot(x,W(level+1,:),'.r')
xlabel('x')
ylabel('u(x,0.5)')
title('Plot Solusi PDP untuk t=0.5')
hold off

figure(2)
for j=1:level+1
  for i=1:m+1
        hold on
        plot(x(i),W(j,i),'.m')
  end
end
xlabel('x')
ylabel('W')
title('Plot Solusi PDP dari BD untuk t=0.5')
hold off