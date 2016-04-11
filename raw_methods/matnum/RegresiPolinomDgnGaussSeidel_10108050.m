clear all;
clc;
disp('Penyelesaian SPL Melalui Metode Gauss-Seidel untuk Regresi Polinom Derajat2')
disp('=================================================================================')
disp('Data :')
x=[0 1 2 3 4 5]
y=[2.1 7.7 13.6 27.2 40.9 61.1]
ndata=6;
n=3;

%k adalah jumlah sum yang harus dihitung
%j adalah pangkat
k=2*(n-1);

for j=1:k
    sumxi(j)=0;
    sumyixi(j)=0;
end


for j=1:k
    for i=1:ndata
        sumxi(j)=sumxi(j)+(x(i)^j);
        sumyixi(j)=sumyixi(j)+((x(i))^(j-1)*y(i));
    end
end
        
for i=1:k+1
    if i~=1
        box(i)=sumxi(i-1);
    else
        box(i)=ndata;
    end
end

for i=1:n
    for j=1:n
        A(i,j)=box(j+i-1);
    end
end


disp ('Matriks awal')
A
for i=1:n
    b(i)=sumyixi(i);
end
x=[0;0;0;0;0];

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
    x(i)=xbaru;
    a(i)=x(i)
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
    disp(['a',num2str(i-1),'=',num2str(x(i))])
end