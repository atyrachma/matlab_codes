

clear all;clc;format short g
% MA5262 Komputasi Keuangan
% Tugas Program Penentuan Solusi PDP dengan Metode Forward Difference
% Aty Rachmawati (10108050)
disp('Program Penentuan Solusi PDP dengan Metode Forward Difference')
tic
h1=0.1; k1=0.0005; lambda1=0.05; %soal (a)
h2=0.1; k2=0.01; lambda2=1;      %soal (b)
alpha=1;
t=0.5;
r=0.06;
sigma=0.1;
h=h1;
k=k1;             % = k1 atau k2		
level=round(t/k); % banyak subselang untuk t
m=1/h;
lambda=alpha^2*k/h^2;
S0=50;
T=1;
L=4*S0;

% for i=1:m+1;
%     x(i)=(i-1)*h;
% end
% 
% u=exp(-pi^2*t)*sin(pi*x); %solusi eksak
% 
% for i=1:m
%     W(1,i+1)=sin(pi*x(i+1)); %syarat awal
% end
% 
% for i=1:level+1
%     W(i,1)=0; W(i,m+1)=0; %syarat batas
% end

for i=1:m
    VC(1,i+1)=sin(pi*x(i+1)); %syarat awal
    VC(1,i+1)=; %syarat awal
end

for i=1:level+1
    VC(i,1)=0; VC(i,m+1)=0; %syarat batas
end
D1=eye(m-1); 
D2=eye(m-1);
for i=1:m-1
    D1(i,i)=i*D1(i,i);
    D2(i,i)=i^2*D2(i,i);
end

T1=zeros(m-1);
T1(1:2,1)=[0;-1];
T1(m-2:m-1,m-1)=[1;0];
v1=[1;0;-1];
for i=2:m-2
    T1(i-1:i+1,i)=v1;
end
T1;

T2=zeros(m-1);
T2(1:2,1)=[-2;1];
T2(m-2:m-1,m-1)=[1;-2];
v2=[1;-2;1];
for i=2:m-2
    T2(i-1:i+1,i)=v2;
end
T2;

p=zeros(m-1,1);
F=(1-r*k)*eye(m-1)+1/2*k*sigma^2*D2*T2+1/2*k*r*D1*T1
for i=1:level
    VC(i+1,2:m)=F*VC(i,2:m)'+p;
end

% A=zeros(m-1);
% A(1:2,1)=[(1+2*lambda);-lambda];
% A(m-2:m-1,m-1)=[-lambda;1+2*lambda];
% v=[-lambda;1+2*lambda;-lambda];
% 
% for i=2:m-2
%     A(i-1:i+1,i)=v;
% end
% A;
% 
% for i=1:level
%     W(i+1,2:m)=A*W(i,2:m)';
% end

toc

% wbd=W(level+1,:)' %solusi metode BD
% galatbd=abs(wbd-u') %galat metode BD
% teks = {'x' 'Eksak' 'BD' 'GalatBD'}; tcell=cellstr(teks);
% [tcell ;num2cell([x' u' wbd galatbd])]
