function [ y ] = compressedindex( x,ctable,range,dims )
%for a  given vector, find its index within the transition space matrix
%workspace;
py = 1;
range = range + 1;
for i = 1:dims-2
    if x(i) == 0
    else
         py = py + sum(ctable((range - (x(i)-1):range),(dims-i)));
         range = range - x(i);
    end  
end
y = py + x (end-1);
end

