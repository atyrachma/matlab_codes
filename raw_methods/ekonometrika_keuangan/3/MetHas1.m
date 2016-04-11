 clear ;
tic ; 

rep  = 1000 ;
xold = 20 ;
j    = 1 ;
nsample = 5 ;
nburn   = 0*rep ;
xsim    = zeros(0.9*rep/nsample,1) ;
 
for i = 1:rep ;
    xnew = xold + unifrnd(-2,2,1,1) ;
    if rand < phi1(xnew)/phi1(xold) ;
        xold = xnew ;
    end ;
    %xsim(i,1) = xold ;
    if i > nburn ;
        if mod(i,nsample) == 0 ;
            xsim(j,1) = xold ;
            j = j+1 ;
        end ;
    end ;
end ;

t1 = toc ;