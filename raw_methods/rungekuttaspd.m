%Praktikum Matematika Numerik VI
%Metode Runge Kutta
%Aty Rachmawati_10108050
clear all;
clc;
syms t y x
i=1;
eps=10^-3;
h=0.1;
n=20;
t0=0;
f=cos(t)-5*x-4*y;    % f(t,y,x)=y'(t)=cos(t)-5*x-4*y
g=x-y+t0;            % g(t,y,x)=x'(t)=x-y+t0
t_iter(1)=0;
y_iter(1)=-5;
x_iter(1)=3;
disp('Sistem Persamaan Diferensial dengan Dua Masalah Nilai Awal')
disp('x(0)=3 , y(0)=-5')
disp('dy/dt=cos(t)-5*x-4*y =f(t,y,x)')
disp('dx/dt=x-y+t0         =g(t,y,x)')
disp(' ')
%t_iter adalah matriks 21x1 yang memuat t0 hingga t21
%x_iter adalah matriks 21x1 yang memuat x0 hingga x21
%y_iter adalah matriks 21x1 yang memuat y0 hingga y21

for i=1:n
f1=subs(f,{t,y,x},{t_iter(i),y_iter(i),x_iter(i)});
g1=subs(g,{t,y,x},{t_iter(i),y_iter(i),x_iter(i)});
k1=h*f1;
l1=h*g1;
f2=subs(f,{t,y,x},{(t_iter(i)+h/2),(y_iter(i)+k1/2),(x_iter(i)+l1/2)});
g2=subs(g,{t,y,x},{(t_iter(i)+h/2),(y_iter(i)+k1/2),(x_iter(i)+l1/2)});
k2=h*f2;
l2=h*g2;
f3=subs(f,{t,y,x},{(t_iter(i)+h/2),(y_iter(i)+k2/2),(x_iter(i)+l2/2)});
g3=subs(g,{t,y,x},{(t_iter(i)+h/2),(y_iter(i)+k2/2),(x_iter(i)+l2/2)});
k3=h*f3;
l3=h*g3;
f4=subs(f,{t,y,x},{(t_iter(i)+h),(y_iter(i)+k3),(x_iter(i)+l3)});
g4=subs(g,{t,y,x},{(t_iter(i)+h),(y_iter(i)+k3),(x_iter(i)+l3)});
k4=h*f4;
l4=h*g4;
y_iter(i+1)=y_iter(i)+1/6*(k1+2*k2+2*k3+k4);
x_iter(i+1)=x_iter(i)+1/6*(l1+2*l2+2*l3+l4);
t_iter(i+1)=t_iter(i)+h;
end
disp('SPD di atas diselesaikan dengan menggunakan Metode Runge Kutta Orde 4')
disp(' ')
disp('Berikut ini berturut-turut adalah nilai t,y, dan x (secara vertikal)')
[t_iter;y_iter;x_iter]
[t_iter(i+1);y_iter(i+1);x_iter(i+1)]
disp('Solusi sistem persamaan diferensial di atas adalah')
disp(['y(',num2str(t_iter(i+1)),')=',num2str(y_iter(i+1))])
disp(['x(',num2str(t_iter(i+1)),')=',num2str(x_iter(i+1))])