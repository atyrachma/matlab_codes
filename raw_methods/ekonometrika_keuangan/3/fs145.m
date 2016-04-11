function f=fs145(x,par)

% posterior pdf di halaman 145

beta=x(1);
sigma=x(2);

betat=par(1);
sigmat=par(2);
tau=par(3);
T=par(4);
nut=par(5);

f=(1/sigma)*exp(-0.5*(tau+T)*((beta-betat)*2)/(sigma*2))*(1/sigma*(nut+1)*exp(-0.5*nut*sigmat*2/(sigma^2));
end
