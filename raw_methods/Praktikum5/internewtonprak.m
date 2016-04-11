clear all;
clc;
x=[-2.5 -2 -1.9 -1 0 1 1.5 2 2.5]
fx=[35.94 -8.8 -3.61 -0.6 4 -0.4 -0.2 16.8 86.13]
eps=10^-5;
xb=0.5;

n=3; %n=derajat
ndata=9;

for i=1:n+1
    koef(i)=(fx(i+1)-fx(i))/(x(i+1)-x(i));
end

a(1)=fx(1)
a(2)=koef(1)
a(3)=(koef(2)-koef(1))/(x(3)-x(1))

%polinom
i=1
px(1)=fx(1);
sum=xb-x(1);
px(2)=px(1)+a(2)*sum
krit=(px(2)-px(1))/px(2);

while krit > eps
    i=i+1
    sum=sum*(xb-x(i));
    px(i+1)=px(i)+(sum*a(i+1))
    krit=(px(i+1)-px(i))/px(i+1);
end
