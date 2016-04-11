clear all;
clc;
disp('ELIMINASI GAUSS MATRIKS 5X5 DENGAN PENUMPUAN PARSIAL')
disp('===================================================================================')
disp(' ')
disp ('Matriks awal')
A=[2.5 3 -2.5 3 -0.5 11; -1.5 4 -3.5 4 -5 4; -1.5 -2.5 -0.5 2 5 5; -4.5 -2.5 -2.5 0.5 -3.5 -2.5; -1 -5 1.5 -5 1.5 -16]

n=5;

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
        x(k)=(A(k,n+1)-s)/A(k,k)
    end
disp('Solusi Sistem Persamaan Linear pada Matriks A adalah')
for k=1:n
   disp(['x',num2str(k),' = ',num2str(x(k))])
end
