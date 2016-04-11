function [ y ] = compmat( x,dims )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
py = zeros (1,dims);
for i = 1:dims
    pfind = find (x == i);
    py (i) = size (pfind,2);
end
y = py;
end

