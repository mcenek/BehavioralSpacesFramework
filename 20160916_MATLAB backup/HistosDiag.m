clearvars -except statreps totreps range skipped skippedzer fnameprimitive
statreps = 20;
totreps = 14;
its = 0;
its2 = 0;
%fnameprimitive = 'Spread005';

for i = 0:totreps
    for i2 = 1:statreps
        its = its + 1;
        fileindexes(its) = cellstr(sprintf('%sV%dR%drep%d',fnameprimitive,i,range,i2));
    end
end
its = 0;

for i = 0:totreps
    for i2 = 1:statreps
        filename = sprintf ('%sV%dR%drep%d',fnameprimitive,i,range,i2);
        load (filename);
        eval ([filename,' = transmat;']);
    end
end
clear transmat


for i = 0:totreps
    for i2 = 1:statreps
        its = its + 1;
        filecomp = char(fileindexes (its));
        for i4 = 1:816
            res (its,i4) = eval ([filecomp,'(i4,i4)']);
        end
        its2 = 0;
    end
end

for i = 0:totreps
    pfile = sprintf ('Diag%i',i);
    pdiag = res(i*statreps+1:i*statreps+statreps,:);
    eval ([pfile,'=pdiag(1,:);']);
    for i2 = 2:statreps
       eval ([pfile,'=horzcat(',pfile,',pdiag(i2,:));']);
    end
end

%%%Hists SqrtN categories Zeros Included
for i = 0:totreps
    file = sprintf ('Diag%i',i);
    eval (['maxs (i+1) = max (',file,');']);
    mmax = max (maxs);
end
%bincount = floor(sqrt (size (Diag0,2)));
bincount = 30;
bins = 0:(mmax/bincount):mmax;
h = zeros (1,size (bins,2));
for i = 0:totreps
    file = sprintf ('Diag%i',i);
    eval (['h = vertcat (h,histc (full(',file,'),bins));']);
end
h = h./20;
h = h(2:end,:);


%%%Hists SqrtN of the largest catergory Zeros Excluded

for i = 0:totreps
    file = sprintf ('Diag%i',i);
    nfile = sprintf ('DiagN0V%i',i);
    eval ([nfile,'=',file,'(',file,'~= 0);']);
end


for i = 0:totreps
    file = sprintf ('DiagN0V%i',i);
    eval (['maxs (i+1) = max (',file,');']);
    eval (['smaxs (i+1) = size(',file,',2);']);
    mmax = max (maxs);
    smax = max (smaxs);
end
%bincount = floor(sqrt (smax));
bincount = 30;
bins = 0:(mmax/bincount):mmax;

hn0 = zeros (1,size (bins,2));
for i = 0:totreps
    file = sprintf ('DiagN0V%i',i);
    eval (['hn0 = vertcat (hn0,histc (full(',file,'),bins));']);
end
hn0 = hn0./20;
hn0 = hn0(2:end,:);