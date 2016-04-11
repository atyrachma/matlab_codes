function simplex2fasa(c,A,rel,b)
clc;
%  Program simplex dua fasa
%      min  z = c*x
%      terhadap  A x rel b
%                 x >= 0
%
% Input: 
% matriks A yang berukuran m x n, vektor b yang berukuran m x 1,
% dan vektor c yang berukuran 1 x n.
% Parameter input menyatakan relasi ketaksamaan atau kesamaan di kendala.
% Sebahai contoh, jika kita mempunyai dua kendala 
% x1 + x2 = 2 dan 3 x1 + 4 x2 <=5, maka rel=['=<'].
%
[m,n]=size(A)
k=length(c);
n1=n;
les=0;
neq=0;
red=0;
for i=1:m
    if (rel(i)=='<')
        A=[A vr(m,i)];
        les=les+1;
    elseif (rel(i)=='>')
        A=[A -vr(m,i)];
        else
        neq=neq+1;
    end
end
ncol=length(A)
if les==m
    c=[c zeros(1,ncol-length(c))];
    A=[A;c];
    A=[A [b;0]]
    nc=n1+m+1
    subs=n1+1:n1+m
    av=subs;
else
    A=[A eye(m) b];
    if m>1
        w=-sum(A(1:m,1:ncol));
    else
        w=-A(1,1:ncol);
    end
    c=[c zeros(1,length(A)-length(c))];
    A=[A;c];
    A=[A;[w zeros(1,m) -sum(b)]]
    nc=ncol+m+1
    
%end
%  Yang berikut ini untuk Praktikum II
    subs=ncol+1:ncol+m;
    av=subs;
    [subs,A,z,p1]=loop(A,subs,2,1);
    if p1=='y'
        disp('                   Akhir fasa 1')
        disp('             *************************************')
    end
end
pause
    x=zeros(nc-1,1);
    x(subs)=A(1:m,nc)
    xa=x(av);
    com=intersect(subs,av);
    if (any(xa)~=0)
        disp(sprintf('\n\n         Empty feasible region\n'))
        for i=1:k
        disp(sprintf('    x%d=%d', i,x(i)))
        end
        return
    else
        if ~isempty(com)
            red=1;
        end
    end
    
    A=A(1:m+1,1:nc);
    A=[A(1:m+1,1:ncol) A(1:m+1,nc)]
    [subs,A,z,p1]=loop(A,subs,1,2);
    if p1=='y'
        disp('                   Akhir fasa 2')
        disp('             *************************************')
    end
    for i=1:k
        disp(sprintf('    x%d=%d', i,x(i)))
        end
%end


