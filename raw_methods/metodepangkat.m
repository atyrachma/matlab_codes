clear all;
clc;
eps=10^-3;
x1=[1;1;1]
k=length(x1)
for i=1:k
    x(i,1)=x1(i);
end
A=[3 -1 0;-1 2 -1;0 -1 3]
[m,n]=size(A);
iterasi=1
y(:,1)=A*x(:,1)
disp(['y(',num2str(0),')='])
disp(y)
for j=1:k
%cari bilangan mutlak terbesar
      for a=1:k-1
          maxidx=a;
          for b=a+1:k
              if abs(y(b))>abs(y(maxidx))
                  maxidx=b;
              end
          end
      end
end
c2=y(maxidx);
disp(['c(',num2str(1),')='])
disp(c2)
x=1/c2*y;
disp(['x(',num2str(1),')='])
disp(x)

y2=A*x2
for j=1:k
%cari bilangan mutlak terbesar
      for a=1:k-1
          maxidx=a;
          for b=a+1:k
              if abs(y2(b))>abs(y2(maxidx))
                  maxidx=b;
              end
          end
      end
end
c3=y2(maxidx)
x2=1/c3*y2



% lanjut=true;
% i=1;
% galat=abs
% y=A*x
% while lanjut
%     for j=1:k
%         y(j,i)=A*x(j,i);
%         find c(i+1)=max
%         x(j,i+1)=1/c(i+1)*y(j,i);
%     end
%     galat=abs((c(i+1)-c(i))/c(i+1));
%     if galat 

% kalo ada matriks a yg elemennya n buah, maka cari mutlak bilangan terbesar
% for i=1:n-1
%     maxidx=i;
%     for k=i+1:n
%         if abs(a(k))>abs(a(maxidx))
%             maxidx=k;
%         end
%     end
% end
% nmax=a(maxidx)
% xa=[1;1;1]
% pjg=length(xa)
% it=1
% ya=A*xa
% tempx=xa;
% tempy=ya;
% c(it+1)=blll
% xa=1/(c(it+1))*ya
% 
