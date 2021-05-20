function [ y ] = sumtable( x )
py(1,1) = 0;
py (1,2) = x;
for i = 2:(x)
    py (i,1) = py (i-1,1) + 1;
    py (i,2) = py (i-1,2) - 1;
end
y = rot90(py,2);
end

