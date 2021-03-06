clear all;
clc;
format short g
tic
h1=0.1; k1=0.0005; lambda1=0.05;
h2=0.1; k2=0.01; lambda2=1;
alpha=1;
t=0.5;
h=h1;
k=k2;
level=round(t/k);
m=1/h;
for i=1:m+1
    W(i,1)=0;
end
lambda=alpha^2*k/h^2;
A=zeros(m-1,m-1);
%backward diff
A(1:2,1)=[(1+2*lambda);-lambda]
A(m-2:m-1,m-1)=[-lambda;1+2*lambda]
v=[-lambda;1+2*lambda;-lambda]
%forward diff
% A(1:2,1)=[(1-2*lambda);lambda];
% A(m-2:m-1,m-1)=[lambda;1-2*lambda];
% v=[lambda;1-2*lambda;lambda];

for i=2:m-2
    A(i-1:i+1,i)=v;
end
A
B=inv(A);
% B=A;
 for i=1:m+1;
    x(i)=(i-1)*h;
end

for i=1:m
    W(1,i+1)=sin(pi*x(i+1));
end
for i=1:level+1
    W(i,1)=0; W(i,m+1)=0;
end

for i=1:level
    W(i+1,2:m)=B*W(i,2:m)';
end
u=exp(-pi^2*t)*sin(pi*x); %solusi eksak

% h1=0.1; k1=0.0005; lambda1=0.05;
% h2=0.1; k2=0.01; lambda2=1;
% alpha=1;
% t=0.5;
% h=h1;
% ks=0.5*h^2/alpha;
% k=k1;
% 
% m=1/h;
% level=round(t/k);
% W(1,1)=0; W(m+1,1)=0;
% lambda=alpha^2*k/h^2;
% 
% for i=1:m+1;
%     x(i)=(i-1)*h;
% end
% 
% for i=1:m
%     W(i+1,1)=sin(pi*x(i+1));
% end
% 
% u=exp(-pi^2*t)*sin(pi*x); %solusi eksak
% 
% for j=1:level
%     for i=2:m
%         W(i,j+1)=(1-2*lambda)*W(i,j)+lambda*(W(i+1,j)+W(i-1,j));
%     end
% end
% 
% w=W(:,level+1)
% hasil=abs(W(:,level+1)-u')
% [u' w hasil]
toc