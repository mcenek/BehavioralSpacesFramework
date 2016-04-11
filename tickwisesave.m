function [y] = tickwisesave( transmat )
A = transmat (:,3);
edges = unique(A);
counts = histc(A(:), edges);
transmat = sortrows (transmat,3);
res = zeros (size (counts,1),816);
for i = 1:size (edges,1)
    pres = zeros (816);
    for i2 = 1:counts(i)
        pres (transmat (i2,1),transmat (i2,2)) = pres (transmat (i2,1),transmat (i2,2)) + 1;
    end
    for i2 = 1:816
        res (i,i2) = sum (pres (i2,:)) + sum (pres (:,i2));
    end
end
y = res;
end

