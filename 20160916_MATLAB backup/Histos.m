
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
        transmat = full (transmat);
        for i3 = 1:816
        transmat (i3,i3) = 0;
        end
        transmat = sparse (transmat);
        eval ([filename,' = transmat;']);
    end
end
clear transmat

for i = 0:totreps
    ffile = sprintf ('%sV%dR%drep1',fnameprimitive,i,range);
    pfile = sprintf ('PV%i',i);
    eval ([pfile,'=',ffile,';']);
    for i2 = 2:statreps
       filename = sprintf ('%sV%dR%drep%d',fnameprimitive,i,range,i2);
       eval ([pfile,'=horzcat(',pfile,',',filename,');']);
    end
end

for i = 0:totreps
    ffile = sprintf ('PV%i',i);
    pfile = sprintf ('V%i',i);
    eval ([pfile,'=0;']);
    for i = 1:816
        eval ([pfile,' = horzcat (',pfile,',',ffile,'(i,:));']);
    end
    eval ([pfile,'=',pfile,'(2:end);']);
end

% for i = 0:totreps
%     file = sprintf ('V%i',i);
% end

clearvars -except fnameprimitive statreps totreps range V0 V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 ...
HN0V1 HN0V2 HN0V3 HN0V4 HN0V5 HN0V6 HN0V7 ...
HN0V8 HN0V9 HN0V10 HN0V11 HN0V12 HN0V13 HN0V14
maxs = zeros (1,14);

%%%Hists SqrtN categories Zeros Included
for i = 0:totreps
    file = sprintf ('V%i',i);
    eval (['maxs (i+1) = max (',file,');']);
    mmax = max (maxs);
end
%bincount = floor(sqrt (size (V0,2)));
bincount = 30;
bins = 0:(mmax/bincount):mmax;
h = zeros (1,size (bins,2));
for i = 0:totreps
    file = sprintf ('V%i',i);
    eval (['h = vertcat (h,histc (full(',file,'),bins));']);
end
h = h./20;
h = h(2:end,:);


%%%Hists SqrtN of the largest catergory Zeros Excluded

for i = 0:totreps
    file = sprintf ('V%i',i);
    nfile = sprintf ('HN0V%i',i);
    eval ([nfile,'=',file,'(',file,'~= 0);']);
end


for i = 0:totreps
    file = sprintf ('HN0V%i',i);
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
    file = sprintf ('HN0V%i',i);
    eval (['hn0 = vertcat (hn0,histc (full(',file,'),bins));']);
end
hn0 = hn0./20;
hn0 = hn0(2:end,:);
