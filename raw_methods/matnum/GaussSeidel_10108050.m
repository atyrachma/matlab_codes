clear all;
clc;
disp('Penyelesaian SPL Melalui Metode Gauss-Seidel')
disp('=================================================================================')
A=[7 1 -1 -2 2;-2 10 3 2 2;-3 2 12 4 2;-4 2 3 -12 2;2 3 -3 -2 11]
b=[4;33;47;-13;6]
x=[0;0;0;0;0];
n=5;
iter=0;
galat=0;
for i=1:n
    s=0;
    for j=1:n
        if j~=i
            s=s+(A(i,j)*x(j));
        end
    end
    xbaru=(b(i)-s)/A(i,i);
    s=abs((xbaru-x(i))/xbaru);
    if s>galat
        galat=s;
    end
    x(i)=xbaru
end

if galat<10^-6
    disp('Selesai');
    disp('----------------------------------------------------------------------------')

    break
end
iter=iter+1;
if iter>10000
    disp('Proses Belum Konvergen'); 
    break   
end

while (galat >= 10^-6)
    galat=0;
for i=1:n
    s=0;
    for j=1:n
        if j~=i
            s=s+(A(i,j)*x(j));
        end
    end
    xbaru=(b(i)-s)/A(i,i);
    s=abs((xbaru-x(i))/xbaru);
    if s>galat
        galat=s;
    end
    x(i)=xbaru
end


if galat < (10^-6)
    disp('Selesai');
    disp('----------------------------------------------------------------------------')

    break
end
iter=iter+1;
if iter>10000
    disp('Proses Belum Konvergen');
   break
end
end

Jumlah_Iterasi=iter

disp('Solusi SPL: ')
for i=1:n
    disp(['x',num2str(i),'=',num2str(x(i))])
end