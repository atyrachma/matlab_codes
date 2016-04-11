% MA5262 Komputasi Keuangan
% Tugas Program Penentuan Harga Opsi dengan Metode Binomial
% Aty Rachmawati (10108050)
disp('Program Penentuan Harga Opsi Put Eropa')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Masukan 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S0=10;
r=0.07;
sigma=0.3;
T=1;
K=15;
M=59;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Perhitungan
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S(1,1)=S0;
delta=T/M;
beta=1/2*(exp(-r*delta)+exp((r+sigma^2)*delta));
u=beta+sqrt(beta^2-1);
d=beta-sqrt(beta^2-1);
p=(exp(r*delta)-d)/(u-d);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Penentuan Harga Saham yang Mungkin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=M+1:-1:2
    for j=1:i
        S(j,i)=S(1,1)*u^(j-1)*d^(i-j);
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Penentuan Payoff pada Expiration Date
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
payoff=max(K-S(:,M+1),0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Penentuan Harga Opsi Put
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P(:,M+1)=payoff;
for i=M:-1:1
    for j=1:i
        P(j,i)=exp(-r*delta)*(p*P(j+1,i+1)+(1-p)*P(j,i+1));
    end
end
putprice=P(1,1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grafik Fungsi Harga Saham dan Nilai Opsi terhadap Waktu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
for i=1:M+1
    for j=1:i
        hold on
        plot(i-1,S(j,i),'.')
        plot(i-1,P(j,i),'.r')
    end
end
plot(0:0.01:M,K,'-c')
hold off
grid on
axis square
