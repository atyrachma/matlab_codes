%Metropolis Hasting algorithm
%2 Mei 2012
%Prepsred by M. Syamsuddin

clear all;
clc;

xLama = 1 ;
yLama = 0.5 ;

rep   = 1000 ;

n     = 10 ;
alpha = 1 ;
beta  = 2 ;
par   = [n alpha beta] ;

propx = floor(rand(rep,1)*11) ;
propy = 0.1*unifrnd(-1,1,rep,1) ;

for i = 1:rep ;
    xBaru = propx(i) ;
    yBaru = yLama + propy(i);
    alpha(i) = min(1,phi2([xBaru yBaru],par)/phi2([xLama yLama],par)) ;
    if rand <  alpha(i);
      xLama = xBaru ;
      yLama = yBaru ;
    end ;
        
    sample(i,:) = [xLama yLama] ;
end ;