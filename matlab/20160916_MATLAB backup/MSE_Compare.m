
clearvars -except statreps totreps range skipped skippedzer fnameprimitive
statreps = 10;
totreps = 14;
its = 0;
its2 = 0;
fnameprimitive = 'ResultsTSampFinal';
thresholds = [0.01,0.05,0.1,0.3,0.6,0.9];
for threshold = thresholds
clearvars -except statreps totreps range skipped skippedzer fnameprimitive threshold thresholds
its = 0;
its2 = 0;
for i = 0:totreps
    for i2 = 1:statreps
        prfname = strrep (num2str(threshold),'.','_');
        its = its + 1;
        fileindexes(its) = cellstr(sprintf('%sV%drep%dThresh%s',fnameprimitive,i,i2,prfname));
    end
end
its = 0;

for i = 0:totreps
    for i2 = 1:statreps
        prfname = strrep (num2str(threshold),'.','_');
        filename = sprintf('%sV%drep%dThresh%s',fnameprimitive,i,i2,prfname);
        load (filename);
        eval ([filename,' = full(transmat);']);
    end
end
clear transmat

Mres = zeros (totreps+1*statreps);
for i = 0:totreps
    for i2 = 1:statreps
        its = its + 1
        filecomp = char(fileindexes (its));
        for i3 = 0:totreps
            for i4 = 1:statreps
                its2 = its2 + 1;
                fileapprox = char(fileindexes (its2));
                eval (['MSE = MSEfunc(',filecomp,',',fileapprox,');']);
                Mres (its,its2) = MSE;
            end
        end
        its2 = 0;
    end
end
prfname = strrep (num2str(threshold),'.','_');
MSEfname = sprintf ('MSE%s',prfname);
exportdata (Mres,MSEfname);
end
