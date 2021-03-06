% PDP Parabolik
% u_t=u_xx
% 0<=x<=1
% t>0
% u(0,t)=u(1,t)=0           syarat batas
% u(x,0)=sin (phi*x)        syarat awal
% metode forward (FTCS)
% tentukan solusi pada saat t=0.5
% a)    h=0.1   k=0.0005    lambda=0.05
% b)    h=0.0   k=0.01      lambda=1   
clear all;
clc;
tic
h1=0.1; k1=0.0005; lambda1=0.05;
h2=0.1; k2=0.01; lambda2=1;
t=0.5;
h=h1;
m=1/h;
alpha=1;
W(1,1)=0; W(m+1,1)=0;
k=k1;
level=t/k;
lambda=alpha^2*k/h^2;


for i=1:m+1;
    x(i)=(i-1)*h;
end

for i=1:m
    W(i+1,1)=sin(pi*x(i+1));
end

u=exp(-pi^2*t)*sin(pi*x); %solusi eksak

for j=1:level
    for i=2:m
        W(i,j+1)=(1-2*lambda)*W(i,j)+lambda*(W(i+1,j)+W(i-1,j));
    end
end

w=W(:,level+1)
hasil=abs(W(:,level+1)-u')
[u' w hasil]


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(1)
% for i=1:m+1
%     for j=1:level
%         hold on
%         plot(i,W(i,j),'.')
%     end
% end
% hold off
% grid on
% axis square
% 
toc

