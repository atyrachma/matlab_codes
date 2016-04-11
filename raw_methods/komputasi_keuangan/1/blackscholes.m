% MA5262 Komputasi Keuangan
% Tugas Program Penentuan Harga Opsi
% Aty Rachmawati (10108050)
disp('Rumus Black Scholes untuk Menentukan Harga Opsi')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Masukan 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S0=10;
r=0.07;
sigma=0.3;
T=1;
K=15;
t=0; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Perhitungan
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d1=(log(S0/K)+(r+sigma^2/2)*(T-t))/(sigma*sqrt(T-t));
d2=d1-sigma*sqrt(T-t);
C=S0*normcdf(d1,0,1)-K*exp(-r*(T-0))*normcdf(d2,0,1)
P=C+K*exp(-r*(T-t))-S0

