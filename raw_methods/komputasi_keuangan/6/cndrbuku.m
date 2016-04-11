%CH24 Program for Chapter 24
%
clear all
clc
% Crank-Nicolson for a European put
clf
%%%%%%% Problem and method parameters %%%%%%%

K = 4; sigma = 0.3; r = 0.03; T = 1; L = 10; M=50; h = L/M;
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

E = 4; sigma = 0.3; r = 0.03; T = 1;
L = 10; Nx = 50; Nt = 50; k = T/Nt; h = L/Nx;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T1 = diag(ones(Nx-2,1),1) - diag(ones(Nx-2,1),-1);
T2 = -2*eye(Nx-1,Nx-1) + diag(ones(Nx-2,1),1) + diag(ones(Nx-2,1),-1);
mvec = [1:Nx-1];
D1 = diag(mvec);
D2 = diag(mvec.^2);
F = (1-r*k)*eye(Nx-1,Nx-1) + 0.5*k*sigma^2*D2*T2 + 0.5*k*r*D1*T1;
B = (1+r*k)*eye(Nx-1,Nx-1) - 0.5*k*sigma^2*D2*T2 - 0.5*k*r*D1*T1;
A1 = 0.5*(eye(Nx-1,Nx-1) + F);
A2 = 0.5*(eye(Nx-1,Nx-1) + B);
U = zeros(Nx-1,Nt+1);
U(:,1) = max(E-[h:h:L-h]',0);
U2(:,1) = max([h:h:L-h]'-E,0);
for i = 1:Nt
tau = (i-1)*k;
p1 = k*(0.5*sigma^2 - 0.5*r)*E*exp(-r*(tau));
q1 = k*(0.5*sigma^2 - 0.5*r)*E*exp(-r*(tau+k));
rhs = A1*U(:,i) + [0.5*(p1+q1); zeros(Nx-2,1)];
rhs2 = A1*U2(:,i) + [0.5*(p1+q1); zeros(Nx-2,1)];
X = A2\rhs;
X2 = A2\rhs2;
U(:,i+1) = X;
U2(:,i+1) = X2;
end
bca = E*exp(-r*[0:k:T]);
bcb = zeros(1,Nt+1);
U = [bca;U;bcb];

bca2 = zeros(1,Nt+1);
bcb2 = L*ones(1,Nt+1);
U2 = [bca2;U2;bcb2];

% mesh([0:k:T],[0:h:L],U)
% xlabel('T-t'), ylabel('S'), zlabel('Put Value')