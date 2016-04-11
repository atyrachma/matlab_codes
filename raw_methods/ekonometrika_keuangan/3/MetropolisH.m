% Metropolis Hasting

clear all;
clc;
format long

rep=10000;
alpha=ones(rep,1);
xsim=ones(rep,2);
nburn=0.1;
nsample=10/5/100;
for i=1:rep
    x1=x(1);
    x2=x(2);
    x1next=x1+prop1(i,:);
    x2next=x2+prop2(i,:);
    xnext=[x1next x2next];
    alpha(i,:)=fs145(xnext,par)/fs145(x,par);
    if rand < min(1,alpha(i,:))
        x=xnext;
    end
    xsim(i,:)=x;
    if mod(i,rep/10)==0
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
