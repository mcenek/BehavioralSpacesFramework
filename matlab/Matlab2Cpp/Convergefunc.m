function [ y ] = Convergefunc( a,b )
pres = zeros (1,10000);
for i = 1:10000
c = a*b;
pres (i) = sum(sum(c));
b=a*c';
end 
y = pres;
end

