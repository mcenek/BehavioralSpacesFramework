function [ y ] = Complookup( range,dims )
workspace;
res = zeros (dims, range);
range = range + 1;
res = horzcat (ones(dims,1),res);
size (res)
res = vertcat (ones(1,range),res);
for i = 2:dims
    for i2 = 2:range
        res(i,i2) = res(i-1,i2) + res (i,i2-1);
    end
end
y = res ((1:end-1),:);
end

