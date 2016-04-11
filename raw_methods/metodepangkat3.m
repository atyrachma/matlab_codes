clear all;
clc;
eps=10^-6;
x0=[1;1;1]
k=length(x0)
for i=1:k
    xt(i,1)=x0(i);
end
A=[3 -1 0;-1 2 -1;0 -1 3]
lanjut=true;

iter=1
yt(:,1)=A*xt(:,1);
y=yt(:,1)
c=max(abs(y))
ct(2)=c;
xt(:,2)=1/(c)*yt(:,1);
x=xt(:,2)

while lanjut
    iter=iter+1
    yt(:,iter)=A*xt(:,iter);
    y=yt(:,iter)
    c=max(abs(y))
    ct(iter+1)=c;
    xt(:,iter+1)=1/(c)*yt(:,iter);
    x=xt(:,iter+1)
    galat=abs((ct(iter+1)-ct(iter))/ct(iter));
    if galat<=eps
        lanjut=false;
    end
end
disp(' ')
disp('=================================================================')
disp(['Nilai Karakteristik = ',num2str(c)])
disp(' ')
disp('Vektor Karakteristik = ')
disp(x)