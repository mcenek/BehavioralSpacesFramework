totreps = 14;
statreps = 20;
for its = 0:totreps
    for i2 = 1:statreps
        filename = sprintf ('CompressedChiSquaredV%dR15rep%d',its,i2);
        compfilename = sprintf ('RandomseedProbmatV%drep%d',its,i2);
        load (filename);
        transmat = full(transmat);
        tot = sum(sum(transmat));
        transmat  = transmat ./ tot;
        exportdata (transmat,compfilename);
    end
end