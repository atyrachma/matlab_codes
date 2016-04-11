function [row,mi]=MRT(a,b)
m=length(a);
c=1:m;
a=a(:);
b=b(:);
l=c(b>0);
[mi,row]=min(a(l)./b(l));
row=l(row);