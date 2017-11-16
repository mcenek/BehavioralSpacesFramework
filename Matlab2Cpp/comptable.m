function [ y ] = comptable( range,dims )
%Generates a reference table for the size of the square transition table
%RData in the main program. Useful for finding which combinations of range
%and dimensions are computationally feasible, and for preallocating
%matrices which store this data. 
range = range+1;
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

