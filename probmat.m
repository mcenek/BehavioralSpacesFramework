function [ y ] = probmat( x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

        tot = sum(sum(x));
        y  = x ./ tot;
end

