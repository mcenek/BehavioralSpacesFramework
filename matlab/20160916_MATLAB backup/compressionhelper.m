function [ y ] = compressionhelper( x,z )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
py = 0;
for i = 1:x
py = py + ((z+2)-i);
end
y = py;

end

