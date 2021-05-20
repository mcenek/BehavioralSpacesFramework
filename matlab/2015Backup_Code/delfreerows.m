function [ y ] = delfreerows( data )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
data( all(~data,2), : ) = [];
y = data;

end

