clear all;
clc;
f=inline('exp(x)')
a=0
b=4
eps=10^-6
fa=f(a)
fb=f(b)
maxiter=30;
R(1,1)=(b-a)/2*(fa+fb);
j=1;
lanjut=true;
while (j<=maxiter) && lanjut
    n=2^j;
    h=(b-a)/n;
    s=0;
    x=a;
    for i=1:(n/2)
        x=(2*i-1)*h;
        s=s+f(x);
    end
    R(j+1,1)=(R(j,1))/2 + h*s
    for k=1:j
        R(j+1,k+1)=(4^k*R(j+1,k)-R(j,k))/(4^k-1)
    end
    galat=abs((R(j+1,j+1)-R(j,j))/R(j+1,j+1));
    if galat <= eps
        Rmbrg=R(j+1,j+1)
        lanjut=false;
    end
    j=j+1
end

if galat > eps
    disp ('Proses Belum Konvergen')
    Rmbrg=R(j+1,j+1)
end