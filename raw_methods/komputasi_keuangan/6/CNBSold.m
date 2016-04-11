clear all;clc;format short g
% MA5262 Komputasi Keuangan
% Tugas Program Penentuan Solusi PDP dengan Metode Crank Nicolson
% Aty Rachmawati (10108050)
disp('Program Penentuan Solusi PDP dengan Metode Crank Nicolson')
tic

% Crank-Nicolson for a European put

K = 4; sigma = 0.3; r = 0.03; T = 1;
L = 10; M = 50; Nt = 50; k = T/Nt; h = L/M;

% K = 47; sigma = 0.24; r = 0.15; T = 146/365;
% L = 50; M = 50; Nt = 50; k = T/Nt; h = L/M;

S0(1,1)=0;
S0(M+1,1)=L;
for i=2:M
    S0(i,1)=S0(i-1,1)+h;
end
t=0;
d1=(log(S0/K)+(r+sigma^2/2)*(T-t))/(sigma*sqrt(T-t));
d2=d1-sigma*sqrt(T-t);
C=S0.*normcdf(d1,0,1)-K*exp(-r*(T-0))*normcdf(d2,0,1);
P=C+K*exp(-r*(T-t))-S0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

T1=zeros(M-1);
T1(1:2,1)=[0;-1];
T1(M-2:M-1,M-1)=[1;0];
v1=[1;0;-1];
for i=2:M-2
    T1(i-1:i+1,i)=v1;
end

D1=eye(M-1); 
D2=eye(M-1);
for i=1:M-1
    D1(i,i)=i*D1(i,i);
    D2(i,i)=i^2*D2(i,i);
end

T2=zeros(M-1);
T2(1:2,1)=[-2;1];
T2(M-2:M-1,M-1)=[1;-2];
v2=[1;-2;1];
for i=2:M-2
    T2(i-1:i+1,i)=v2;
end

F = (1-r*k)*eye(M-1,M-1) + 0.5*k*sigma^2*D2*T2 + 0.5*k*r*D1*T1;
B = (1+r*k)*eye(M-1,M-1) - 0.5*k*sigma^2*D2*T2 - 0.5*k*r*D1*T1;

A1 = 0.5*(eye(M-1,M-1) + F);
A2 = 0.5*(eye(M-1,M-1) + B);

% VP = zeros(M-1,Nt+1);

VP(:,1) = max(K-[h:h:L-h]',0); %syarat awal untuk opsi put
VC(:,1) = max([h:h:L-h]'-K,0); %syarat awal untuk opsi call

for i = 1:Nt
tau = (i-1)*k;
p1 = k*(0.5*sigma^2 - 0.5*r)*K*exp(-r*(tau));
q1 = k*(0.5*sigma^2 - 0.5*r)*K*exp(-r*(tau+k));
rhs1 = A1*VP(:,i) + [0.5*(p1+q1); zeros(M-2,1)];
rhs2 = A1*VC(:,i) + [0.5*(p1+q1); zeros(M-2,1)];
XP = A2\rhs1;
XC = A2\rhs2;
VP(:,i+1) = XP;
VC(:,i+1) = XC;
end

% VP berukuran M-1 x M-1 dengan i-> langkah ds dan j-> langkah dt pada VP(i,j)
% syarat batas untuk put
SBP1 = K*exp(-r*[0:k:T]);
SBP2 = zeros(1,Nt+1);
% syarat batas untuk call
SBC1 = zeros(1,Nt+1);
SBC2 = L*ones(1,Nt+1);


VP = [SBP1;VP;SBP2];
VC = [SBC1;VC;SBC2];


% % Crank-Nicolson for a European put
% % clf
% %%%%%%% Problem and method parameters %%%%%%%
% K = 4; sigma = 0.3; r = 0.03; T = 1;
% L = 10; M = 50; Nt = 50; k = T/Nt; h = L/M;
% S0=1; t=0;
% d1=(log(S0/K)+(r+sigma^2/2)*(T-t))/(sigma*sqrt(T-t));
% d2=d1-sigma*sqrt(T-t);
% C=S0*normcdf(d1,0,1)-K*exp(-r*(T-0))*normcdf(d2,0,1)
% P=C+K*exp(-r*(T-t))-S0
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% T1 = diag(ones(M-2,1),1) - diag(ones(M-2,1),-1)
% m=size(T1,1)+1
% 
% T2 = -2*eye(M-1,M-1) + diag(ones(M-2,1),1) + diag(ones(M-2,1),-1)
% 
% mvec = [1:M-1]
% 
% D1 = diag(mvec)
% 
% D2 = diag(mvec.^2)
% 
% F = (1-r*k)*eye(M-1,M-1) + 0.5*k*sigma^2*D2*T2 + 0.5*k*r*D1*T1
% B = (1+r*k)*eye(M-1,M-1) - 0.5*k*sigma^2*D2*T2 - 0.5*k*r*D1*T1
% 
% A1 = 0.5*(eye(M-1,M-1) + F)
% A2 = 0.5*(eye(M-1,M-1) + B)
% 
% U = zeros(M-1,Nt+1);  %ukurannya 49x51
% U(:,1) = max(K-[h:h:L-h]',0) %syarat awal untuk opsi put
% 
% for i = 1:Nt
% tau = (i-1)*k;
% p1 = k*(0.5*sigma^2 - 0.5*r)*K*exp(-r*(tau));
% q1 = k*(0.5*sigma^2 - 0.5*r)*K*exp(-r*(tau+k));
% rhs = A1*U(:,i) + [0.5*(p1+q1); zeros(M-2,1)]; %49x1
% X = A2\rhs; %49x1
% U(:,i+1) = X ;
% end
% % U berukuran m-1 x Nt+1 dengan i-> langkah h dan j-> langkah k pada U(i,j)
% bca = K*exp(-r*[0:k:T])
% bcb = zeros(1,Nt+1)
% contoh=[h:h:L-h]'
% U = [bca;U;bcb]

% mesh([0:k:T],[0:h:L],U)
% xlabel('T-t'), ylabel('S'), zlabel('Put Value')


% h1=0.1; k1=0.0005; lambda1=0.05; %soal (a)
% h2=0.1; k2=0.01; lambda2=1;      %soal (b)
% alpha=1;
% t=0.5;
% h=h1;
% k=k2;             % = k1 atau k2	
% level=round(t/k); % banyak subselang untuk t
% m=1/h;
% lambda=alpha^2*k/h^2;

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
% 
% %leftside matrix
% A=zeros(m-1,m-1);
% A(1:2,1)=[1+lambda;-lambda/2];
% A(m-2:m-1,m-1)=[-lambda/2;1+lambda];
% v=[-lambda/2;1+lambda;-lambda/2];
% for i=2:m-2
%     A(i-1:i+1,i)=v;
% end
% A;
% C=inv(A);
% % rightside matrix
% B=2*eye(m-1)-A;
% for i=1:level
%     W(i+1,2:m)=C*B*W(i,2:m)';
% end
% 
% toc
% 
% wcn=W(level+1,:)' %solusi metode CN
% galatcn=abs(wcn-u') %galat metode CN
% teks = {'x' 'Eksak' 'CN' 'GalatCN'}; tcell=cellstr(teks);
% [tcell ;num2cell([x' u' wcn galatcn])]

% figure(1)
% hold on
% plot(x,u,'.b')
% plot(x,W(level+1,:),'.r')
% xlabel('x')
% ylabel('u(x,0.5)')
% title('Plot Solusi PDP untuk t=0.5')
% hold off
% 
% figure(2)
% for j=1:level+1
%   for i=1:m+1
%         hold on
%         plot(x(i),W(j,i),'.m')
%   end
% end
% xlabel('x')
% ylabel('W')
% title('Plot Solusi PDP dari CN untuk t=0.5')
% hold off