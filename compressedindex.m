function [ y ] = compressedindex( x,range,blookup )
y = (sum(blookup(1:(range+1))) - sum(blookup(1:((range+1)-x(1)))))+compressionhelper(x(2),(range-x(1)))+((x(3) + x(4)) - x(4)) + 1;
end