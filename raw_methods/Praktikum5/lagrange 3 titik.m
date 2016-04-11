clear all;
clc;

n=4;
x=[1 6 4];
fx=[0 1.791759469 1.386294361];
m=2;

a=0;
for k=1:n
    s=1;
    for i=1:n
        if i~=k
            s=s*((m-x(i))/(x(k)-x(i)));
        end
    end
    s
    L(k)=s;
    a=a+(fx(k)*L(k))
end

disp(['Jadi, nilai f(2)= ',num2str(a)])