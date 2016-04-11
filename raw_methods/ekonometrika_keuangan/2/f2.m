function f = f2(b,x);
% CES Function
L = x(:,1);
K = x(:,2);
 
b1 = b(1,:);
b2 = b(2,:);
b3 = b(3,:);
b4 = b(4,:);
 
f=b1*(b2*(L.^b3)+(1-b2)*(K.^b3)).^(b4/b3);