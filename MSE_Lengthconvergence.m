clearvars -except statreps totreps skipped skippedzer fnameprimitive
statreps = 4;
totreps = 14;
its = 0;
its2 = 0;
fnameprimitive = 'Lengthconvergence';

visions = 300:100:5200;
Count_res = zeros (16,50);
Count_res (1,1:50) = visions;
Count_res = horzcat ([0,0:14]',Count_res);

for i = 0:totreps
for visionits = visions
    pres = 0;
    for i2 = 1:statreps
        filename = sprintf ('%sV%dR15rep%dT%d',fnameprimitive,i,i2,visionits);
        load (filename);
        transmat = delfreerows (transmat);
        transmat = full (transmat);
        sums = sum(transmat,1);
        sums = find (sums > 0);
        pres (end+1) = size (sums,2);
        if i2 == statreps
            Count_res ((i+2),(visionits/100-1)) = median (pres(2:end)) ;
        end
    end
end
end
clear transmat
