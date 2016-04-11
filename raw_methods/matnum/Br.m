function [m,j]=Br(d)

ind=find(d<0);
if ~isempty(ind)
    j=ind(1);
    m=d(j);
else
    m=[];
    j=[];
end