function [ y ] = cor( x,range,dims )
%COR finds location of x in RMatrix, independent of dimension
pcor = 1;
for its = 1:range
    pcor = pcor +(x(1,its)-1)*(dims^(its-1));
end
y = (pcor+1);
end

