function [ y ] = singlenumber( x )
%Converts array to single number
x = double(x);
if (size(x,1) == 1)
    x=x';
end
for its = 2:(size(x))
    curval = x(its,1);
    preval = x(1,1);
    x(1,1) = (preval*10)+curval;
end
y = x(1,1);
end

