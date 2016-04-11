clear all;
clc;
disp('ELIMINASI GAUSS MATRIKS 5x5')
disp('===================================================================================')
disp(' ')
disp ('Matriks awal')
a=[2.5 3 -2.5 3 -0.5 11; -1.5 4 -3.5 4 -5 4; -1.5 -2.5 -0.5 2 5 5; -4.5 -2.5 -2.5 0.5 -3.5 -2.5; -1 -5 1.5 -5 1.5 -16]

n=5;
disp(' ')
disp('Tahap Eliminasi')
for k=1:(n-1)
    if abs(a(k,k))<10^-15
        disp('Proses Gagal')
        break;
    end
    for i=(k+1):n
          p=a(i,k)/a(k,k);
           for j=(k+1):(n+1)
               a(i,j)=a(i,j)-p*a(k,j)
           end
           a(i,k)=0
    end
end
disp('Tahap Penyulihan Mundur')
    if abs(a(n,n))<10^-15
        disp('Proses Gagal')
        break;
    end
    x(n)=a(n,n+1)/a(n,n);
    for k=(n-1):-1:1
        s=0;
        for i=(k+1):n
            s=s+a(k,i)*x(i);
        end
        x(k)=(a(k,n+1)-s)/a(k,k)
    end
disp('Solusi Sistem Persamaan Linear pada Matriks a adalah')
for k=1:n
   disp(['x',num2str(k),' = ',num2str(x(k))])
end