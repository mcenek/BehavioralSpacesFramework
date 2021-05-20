clear
res = zeros (19);
res = horzcat (ones(19,1),res);
res = vertcat (ones(1,20),res);
for i = 2:20
    for i2 = 2:20
        res(i,i2) = res(i-1,i2) + res (i,i2-1);
    end
end

res = res (1:16,1:8);