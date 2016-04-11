clear all; clc;
l=1;
t=0.5;	
h=0.1;
m=l/h;
alpha=1;
for i=1:m+1;
    x(i)=(i-1)*h;
end
u=exp(-pi^2*t)*sin(pi*x); %solusi eksak

%Menghitung Solusi PDP dengan nilai k yang berbeda
for level=1:1000
    W=[];
    k=t/level;
    lambda=alpha^2*k/h^2;
    for i=1:m
        W(1,i+1)=sin(pi*x(i+1));
    end

    for i=1:level+1
        W(i,1)=0; W(i,m+1)=0;
    end

    %leftside matrix
A=zeros(m-1,m-1);
A(1:2,1)=[1+lambda;-lambda/2];
A(m-2:m-1,m-1)=[-lambda/2;1+lambda];
v=[-lambda/2;1+lambda;-lambda/2];
for i=2:m-2
    A(i-1:i+1,i)=v;
end
A;
C=inv(A);

% rightside matrix
B=2*eye(m-1)-A;

for i=1:level
    W(i+1,2:m)=C*B*W(i,2:m)';
end

wcn=W(level+1,:)';
galatcn=abs(wcn-u');
error(:,level)=wcn; %selisih solusi untuk suatu k
end
 
for i=1:length(x)
    figure(i)
    plot(error(i,:))
    title('Plot Solusi terhadap Banyak Level')
    xlabel('banyak level (j)')
    ylabel(['solusi saat t=0.5 dan x=',num2str(x(i))])
end
