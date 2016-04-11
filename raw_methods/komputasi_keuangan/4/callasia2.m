% Menghitung opsi call Asia
clear all;
clc;
tic

S0=50;%30;
r=0.07;
sigma=0.3;
B=55;%35; % Barrier Up
T=1;
K=40;%23;

S(1)=S0;
N=1000 %banyaknya simulasi lintasan harga saham
n=252 %banyaknya hari dalam 1 tahun atau diskretisasi
dt=T/n;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Menghitung
for i=1:N
    for j=2:n
%        z(j-1)=normrnd(0,1);
       S(j)=S(j-1)*exp((r-sigma^2/2)*dt+sigma*sqrt(dt)*normrnd(0,1));
    end
    S';
    if max(S)>=B
        CBUO(i)=0;
    else
        CBUO(i)=exp(-r*T)*max(S(n*T)-K,0);
    end
    Srata(i)=mean(S);
    CAO(i)=exp(-r*T)*max(Srata(i)-K,0); %menghitung opsi Asia
end
[Srata' CAO'];

a=mean(CBUO)
bsq=var(CBUO)
bwh=a-1.96*sqrt(bsq/N)
ats=a+1.96*sqrt(bsq/N)

plot(S)


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Pergerakan Harga Saham
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(1)
% for i=1:N
%     hold on
%     plot(i-1,S(i),'.')
% end
% xlabel('t')
% ylabel('S(t)')
% title('Pergerakan Harga Saham Selama 1 Tahun')
% plot(0:0.01:N,K,'-c')
% text(0.25,K,'Strike Price','HorizontalAlignment','left')
% hold off
% grid on
% axis square
% 
% % eksp0=mean(S)
% % eksp=mean(S(2:n+1))
% for k=1:M
%     eksp(k)=mean(S(2:n+1));
%     Y(k)=exp(-r*n/N)*max(eksp(k)-K,0);
% end
% Y
% ekspY=mean(Y)
% varY=var(Y)

% Vt=exp(-r*T)*max(St-ones(M,1)*K,zeros(M,1))
% eksp=mean(Vt)
toc

