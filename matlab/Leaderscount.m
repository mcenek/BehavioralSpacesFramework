totreps = 14;
statreps = 20;
leaderscount = zeros (statreps,totreps);
for its = 0:totreps
    for i2 = 1:statreps
        filename = sprintf ('%sV%dR15rep%d',fnameprimitive,its,i2);
        load (filename);
        transmat = full (transmat);
        sums = sum(transmat,1);
        sums = find (sums > 0);
        leaderscount (i2,its+1) = size (sums,2);
    end
end