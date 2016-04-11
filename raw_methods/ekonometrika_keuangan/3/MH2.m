% Metropolis Hasting
% noninformative prior

clear all;
clc;
format long

rep=10000;
y=[4.74 7.11 5.31 6.26 6.09 8.52 2.78 7.38 5.44 5.72]; % dari hal 120
betac=mean(y);
sigmac=std(y);
T=length(y);
nu=T-1;
par=[betac sigmac T nu];
x=[10 1]; % current state
rep=10000; % original size of sample
nburn=0.1; % size of burning-out sample
nsample=10;

alpha=ones(rep,1);
xsim=ones(rep,2);
prop=unifrnd(-1,1,rep,2);

for i=1:rep
    xnext=x+prop(i,:); % proposal state
    alpha(i,:)=fs151(xnext,par)/fs151(x,par);
    if rand < min(1,alpha(i,:))
        x=xnext; %current state
    end
    xsim(i,:)=x;
    if mod(i,rep/10)==1
        disp(i);
    end
end

xsim=xsim(nburn*rep+1:rep,:);
betasim=reshape(xsim(:,1),nsample,(1-nburn)*rep/sample);
sigmasim=reshape(xsim(:,2),nsample,(1-nburn)*rep/sample);
betapost=betasim(nsample,:)';
sigmapost=sigmasim(nsample,:)';
otobeta=autocorr(betapost);
otosigma=autocorr(sigmacost);


subplot(1,2,1)
histfit(betapost,50)
subplot(1,2,2)
histfit(sigmapost,50)

t1=toc;