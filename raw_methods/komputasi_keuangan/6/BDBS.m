clear all;clc;format short g
% MA5262 Komputasi Keuangan
% Tugas Program Penentuan Solusi PDP Black Schole dengan Metode Backward Difference
% Aty Rachmawati (10108050)
disp('Program Penentuan Solusi PDP Black Schole dengan Metode Backward Difference')
tic

K = 5; sigma = 0.3; r = 0.03; T = 1;
L = 10; M = 50; Nt = 50; k = T/Nt; h = L/M;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Penentuan Solusi dengan Rumus Eksak
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
% Penentuan Solusi dengan Metode Backward Difference
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

B = (1+r*k)*eye(M-1,M-1) - 0.5*k*sigma^2*D2*T2 - 0.5*k*r*D1*T1;

VP(:,1) = max(K-[h:h:L-h]',0); %syarat awal opsi put Eropa
VC(:,1) = max([h:h:L-h]'-K,0); %syarat awal opsi call Eropa

for i = 1:Nt
tau = (i-1)*k;
q1 = k*(0.5*sigma^2 - 0.5*r)*K*exp(-r*(tau+k));
rhs1 = VP(:,i) + [q1; zeros(M-2,1)];
rhs2 = VC(:,i) + [q1; zeros(M-2,1)];
VP(:,i+1) = B\rhs1;
VC(:,i+1) = B\rhs2;
end

% syarat batas untuk opsi put Eropa
SBP1 = K*exp(-r*[0:k:T]);
SBP2 = zeros(1,Nt+1);

% syarat batas untuk opsi call Eropa
SBC1 = zeros(1,Nt+1);
SBC2 = L*ones(1,Nt+1);

VP = [SBP1;VP;SBP2];
VC = [SBC1;VC;SBC2];

[VP(:,Nt+1) P abs(P-VP(:,M+1)) S0] % VP(:,Nt+1) solusi numerik untuk put
[VC(:,Nt+1) C abs(C-VC(:,M+1)) S0] % VC(:,Nt+1) solusi numerik untuk call

toc