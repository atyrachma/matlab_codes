%Gibbs sampler
%2 Mei 2012
%Prepsred by M. Syamsuddin

clear ;

xLama = 1 ;
yLama = 0.5 ;

rep   = 1000 ;

n     = 10 ;
alpha = 1 ;
beta  = 2 ;

for i = 1:rep ;
    xBaru = binornd(n,yLama) ;
    yBaru = betarnd(xLama+alpha,n-xLama+beta) ;
    
    sample(i,:) = [xBaru yBaru] ;
    
    xLama = xBaru ;
    yLama = yBaru ;
end ;