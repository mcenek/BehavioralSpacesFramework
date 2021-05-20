clear
totreps = 14;
statreps = 4;
thresholds = [0.6,0.9];
fnameprimitive = 'ImmediateTMAT';

for its = 0:totreps
    for i2 = 1:statreps
        for threshold = thresholds
        prfname = strrep (num2str(threshold),'.','_');
        resfname = sprintf ('LeadFollow%sV%drep%dThresh%s',fnameprimitive,its,i2,prfname);
%         filename = sprintf ('%sV%dR15rep%d',fnameprimitive,its,i2);
%         filename2 = sprintf ('%sV%dR15rep%d',fnameprimitive2,its,i2);
        load (resfname);
%        transmat = full (transmat);
        exportdata (rmat,resfname);
        resfname = sprintf ('Results%sV%drep%dThresh%s',fnameprimitive,its,i2,prfname);
%         filename = sprintf ('%sV%dR15rep%d',fnameprimitive,its,i2);
%         filename2 = sprintf ('%sV%dR15rep%d',fnameprimitive2,its,i2);
        load (resfname);
        transmat = full (transmat);
        exportdata (transmat,resfname);
        end
    end
end