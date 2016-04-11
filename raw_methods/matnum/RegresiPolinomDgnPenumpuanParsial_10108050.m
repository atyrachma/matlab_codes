clear all;
clc;
disp('ELIMINASI GAUSS MATRIKS 3X3 DENGAN PENUMPUAN PARSIAL UNTUK REGRESI POLINOM DERAJAT2')
disp('===================================================================================')
disp(' ')
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
    A(i,n+1)=sumyixi(i);
end

    
disp ('Matriks awal')
A


disp(' ')
disp('Tahap Eliminasi')
for k=1:n
    m=k;
    for i=k+1:n
        if abs(A(i,k))> abs(A(m,k))
            m=i;
        end
    end
    if m ~= k
        for j=k:n+1
            s=A(k,j);
            A(k,j)=A(m,j);
            A(m,j)=s;
        end
    end
    if abs(A(k,k))<10^-15 
        disp('Proses Gagal')
        break
    end
    for i=k+1:n
        p=A(i,k)/A(k,k);
        for j=k+1:n+1
            A(i,j)=A(i,j)-p*A(k,j)
        end
        A(i,k)=0
    end
end

disp('Tahap Penyulihan Mundur')
    if abs(A(n,n))<10^-15
        disp('Proses Gagal')
        break
    end
    x(n)=A(n,n+1)/A(n,n);
    for k=n-1:-1:1
        s=0;
        for i=k+1:n
            s=s+A(k,i)*x(i);
        end
        x(k)=(A(k,n+1)-s)/A(k,k);
        a(k)=x(k)
    end
disp('Solusi Sistem Persamaan Linear pada Matriks A adalah')
for k=1:n
   disp(['a',num2str(k-1),' = ',num2str(x(k))])
end
