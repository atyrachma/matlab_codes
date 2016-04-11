% Menghitung opsi call Eropa
clear all;
clc;
tic
S0=50;
r=0.07;
sigma=0.3;
T=1;
K=55;
M=10;
delta=T/M;

psi=normrnd(0,1,M,1)
St=S0*exp((r-sigma^2/2)*T+sigma*sqrt(T)*psi)
Vt=exp(-r*T)*max(St-ones(M,1)*K,zeros(M,1))
eksp=mean(Vt)
toc

