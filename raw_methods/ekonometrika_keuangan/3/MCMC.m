%Markov Chain Monte Carlo ;

clear ;

rep = 20 ;
phi = [0.3846 0.6154] ;
q = [0.5 0.5; 0.7 0.3] ;

Xn = 1 ;
for i = 1:rep ;
     if Xn == 1 ;
         if rand < q(Xn,1)
             X = 1 ;
         else 
             X = 2 ;
         end ;
     else
         if rand < q(Xn,1)
             X = 1 ;
         else 
             X = 2 ;
         end ;
     end ;
     alpha = min(1, phi(X)*q(X,Xn)/(phi(Xn)*q(Xn,X))) ;
     if rand < alpha 
         Xnext = X ;
     else
         Xnext = Xn ;
     end ;
xsim(i,1) = Xnext ;
Xn = Xnext ;
end ;
