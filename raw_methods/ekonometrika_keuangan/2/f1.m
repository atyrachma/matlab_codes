function f = f1(b,x);
% CD Function
L = x(:,1);
K = x(:,2);
 
b1 = b(1,:);
b2 = b(2,:);
b3 = b(3,:);
 
f = b1*(L.^b2).*(K.^b3);