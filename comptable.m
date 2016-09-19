function [ y ] = comptable( range,dims )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
workspace
range = range+1
res = zeros (range,dims);
res (1:range,1) = 1;
res (1,1:dims) = 1;

for i = 2:range
    for i2 = 2:dims
        res (i,i2) = res(i-1,i2) + res (i,i2-1);
    end
end
y = res;
end

