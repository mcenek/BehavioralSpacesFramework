function [ y ] = compmat( x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
py = zeros (1,4);
for i = 1:4
    pfind = find (x == i);
    py (i) = size (pfind,2);
end
y = py;
end

