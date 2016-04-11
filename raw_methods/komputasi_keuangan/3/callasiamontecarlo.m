% Menghitung opsi call Asia
clear all;
clc;
tic
S0=50;
r=0.07;
sigma=0.3;
T=1;
K=45;
M=10;
k=5;
S(1)=S0;
N=252
n=252
dt=T/n
deltaT=1/N;

for i=1:n
   z(i)=normrnd(0,1);
   S(i+1)=S(i)*exp((r-sigma^2/2)*dt+sigma*sqrt(dt)*z(i));
end
S

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pergerakan Harga Saham
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
for i=1:n+1
    hold on
    plot(i-1,S(i),'.k')
end
xlabel('t')
ylabel('S(t)')
title('Pergerakan Harga Saham Selama 1 Tahun')
plot(0:0.01:N,K,'-c')
text(0.25,K,'Strike Price','HorizontalAlignment','left')
hold off
grid on
axis square

% eksp0=mean(S)
% eksp=mean(S(2:n+1))
for k=1:M
    eksp(k)=mean(S(2:n+1));
    Y(k)=exp(-r*n/N)*max(eksp(k)-K,0);
end
Y
ekspY=mean(Y)
varY=var(Y)

% Vt=exp(-r*T)*max(St-ones(M,1)*K,zeros(M,1))
% eksp=mean(Vt)
toc

