function [ y ] = c2vect2( x )
resloc = 0;
res = zeros (2,1,'uint16');
for i = 1:size (x,1)
    resloc = resloc + 1;
    res (1,resloc) = 0;
    res (2,resloc) = 0;
    for i2 = 1:size (x,2)
        if x(i,i2) ~= 0
            resloc = resloc + 1;
            res (1,resloc) = x(i,i2);
            res (2,resloc) = i2;
        end
    end
end
y = res (:,2:end);
end