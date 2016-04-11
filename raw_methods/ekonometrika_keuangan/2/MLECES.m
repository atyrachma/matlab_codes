% Maximum Likelihood Estimation 
% Constant Elasticity of Substitution (CES) Production Function
% memerlukan file: f2, L2, Lt2, numgradL2, dan numgradLt2
% 
% program ini akan menaksir parameter b1, b2, b3, dan b4 yang ada pada 
% CES production function: Q=b1*(b2*(L.^b3)+(1-b2)*(K.^b3)).^(b4/b3);

clear all;
clc;
format long
LKy = [5.4293 6.6871 8.1879 
       5.5530 5.5175 7.4104 
       6.7105 6.6477 8.9496 
       6.6425 6.2364 8.3695 
       6.2046 6.6307 8.5519 
       6.1883 6.0521 8.3299 
       6.5191 6.1137 8.4877 
       6.6174 6.7056 9.1260 
       6.5889 6.7393 8.7961 
       6.5439 6.8648 8.7941 
       6.1269 4.4308 6.8657 
       6.8886 3.0445 5.7132 
       6.6931 5.6870 8.1641 
       6.0615 5.6240 7.9482 
       5.4424 6.3026 8.1264 
       6.4983 4.8598 7.2432 
       6.4473 2.8332 5.2521 
       4.0775 6.8090 7.7220 
       6.6983 5.4072 8.0002 
       6.6307 4.9767 7.3157 
       3.9120 5.0814 5.9833 
       6.7130 1.7918 4.4132 
       6.1800 6.7286 8.7229 
       6.5250 6.2558 8.6233 
       4.7536 6.8352 7.8589 
       6.0868 6.2046 8.0981 
       6.1225 5.2204 7.5533 
       5.8348 4.5218 6.8249 
       5.8805 6.1841 8.2967 
       5.0876 6.8395 8.1922];
   
L = LKy(:,1);
K = LKy(:,2);
y = LKy(:,3);
 
x = LKy(:,1:2);
T=length(y);

disp('Maximum Likelihood Estimation with Berndt, Hall, Hall and Hausman Iterations');
 
tic;
%Berndt, Hall, Hall and Hausman Iterations
 
rep = 100%The size of 'rep' depens on the convergence criterion and
            %the initial values
% b = ones(4,1); %Initial values of b for CES Function
b =[0.4;0.4;0.4;0.5] ; % change the initial values of b
 
j1 = 0;
j2 = 0;
tn = 1.1;

for i = 1:rep;
    L     = L2(b,x,y);
    zt    = numgradLt2(b,x,y); %Numerical gradient, TxK
    z     = numgradL2(b,x,y); %Numerical gradient, Kx1
    step  = inv(zt'*zt)*z;
    bnext = b + step;
    Lnext  = L2(bnext,x,y);
    
    if norm(bnext-b) <= 1e-9 & (Lnext-L) <= 1e-9
        disp(['Sudah konvergen. Dengan jumlah iterasinya adalah: ', num2str(i)]);
        break;
    end;
    
    if i == rep
        disp('Belum konvergen, iterasinya perlu ditambah lagi atau dengan mengubah initial values');
        disp(' ');
    end;
    
    b = bnext;
    
end
 
%Final result
bmle  = bnext; %Maximum likelihood estimator of b
Lmle  = Lnext;
f     = f1(bmle,x);
s2mle = (y-f)'*(y-f)/T;
disp('Hasil dari penggunaan iterasi Berndt, Hall, Hall and Hausman')
[bmle' s2mle Lmle]

% Akaike Information Criteria (AIC)
AIC=-2*log(Lmle)+2*length(b)
% Schwart Criteria (SC)
SC=-2*log(Lmle)+log(T)*length(b)
 
