clear
for its = 0:14
    for i2 = 1:4
        filename = sprintf ('CompressedChiSquaredV%dR15rep%d',its,i2);
        compfilename = sprintf ('V%drep%d',its,i2);
        load (filename);
        eval ([compfilename,' = sparse(transmat);']);
    end
end
clear transmat
    