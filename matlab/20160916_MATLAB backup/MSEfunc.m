function [ y ] = MSEfunc( x,xapp )
D = abs(x-xapp).^2;
   y = sum(D(:))/numel(x);

end

