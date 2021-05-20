skipped = 0;
skippedzer = 0;
load ('blookup.mat')
totreps = 14;
statreps = 10;
for visionits = 0:14

clearvars -except visionits skipped leadersnum blookup skippedzer totreps statreps
range = 15;
importfile = sprintf ('C:\\YourFileLocationHere\\DNAdata%d.txt',visionits);
testm = uint8(importfile1(importfile))';
%Max range for 32 bit is approximately 44, size of the matrix increases as
%sum(blookup(1:(range+1))
location = range;
columnheaders = compressedheaders (range);
RMatrix = zeros((size(columnheaders,1)+1));
%Generates individual result matrix

for its = 1:(size (columnheaders))
    columnheaders2 (its,1) = singlenumber(columnheaders(its,:)); %#ok<SAGROW>
end

%convert (dims^range) x dims matrix into single number to save memory and
%become searchable
for its = 1:(size (columnheaders))
    %import column headers into the final results matrix
    RMatrix(1,its+1) = columnheaders2(its,1);  
    RMatrix(its+1,1) = columnheaders2(its,1);
end


for its = 0:(size(testm)-((range*2)+1))
    %for previous and future of an agent, write event in the result matrix
    %incrementing the value by 1
    location = location + 1;
    ahist = testm(((location - range):(location - 1)),1)';
    if isempty (find (ahist == 0, 1))
        ahist = compmat (ahist);
    else
        continue
    end
    %if there is a 0 in the history, that indicates a break between one
    %agent's history and the next, which is garbage data and is therefore
    %skipped
    afut = testm(((location + 1):(location + range)),1)';
    if isempty (find (afut == 0, 1))
        afut = compmat (afut);
    else
        continue
    end
    xcor = compressedindex(ahist,range,blookup)+1;
    ycor = compressedindex(afut,range,blookup)+1;
    prevvalue = RMatrix(ycor,xcor);
    RMatrix(ycor,xcor) = prevvalue + 1;
end 

RData = RMatrix(2:end,2:end);
emptyrows = all (~RData,2);
emptyrows = find (emptyrows == 1);

its2 = 1;
while its2 <= statreps
threshold = 0;


chi2L = 1:size(RData);
for its3 = 1:size(emptyrows,1)
    chi2L = chi2L(chi2L ~= emptyrows (its3));
end
randmat = ceil(size(chi2L,2) * rand(1));
rmat = zeros(1,size(RData,1))';
%leaders = chi2L (randmat);
leaders = chi2L(randmat);
rmat (randmat) = 1;
leadercomp = zeros (1,size(RData,1));
chi2L = chi2L (chi2L ~= randmat);
% p2chi = zeros (1,size(RData,2));
while size(chi2L) > 0
    randmat = ceil(size(chi2L,2) * rand(1));
    randmat = chi2L(randmat);
    for its = leaders
        leadercomp (its) = chisquared(its,randmat,RData);
    end
    [M,I] = max (leadercomp);
    if M > threshold
        rmat (randmat) = I;
        chi2L = chi2L (chi2L ~= randmat);
    else
        rmat(randmat) = 1;
        leaders = horzcat (leaders,randmat);
        chi2L = chi2L (chi2L ~= randmat);
    end
end
if size (leaders,2) == 1
    skipped = skipped + 1;
    continue
end

clear transmat
location = range;
transmat = zeros(size(RData,1));
%rmat = ones (816,1);
for its = 0:(size(testm)-((range*2)+1))
    %for previous and future of an agent, write event in the result matrix
    %incrementing the value by 1
    location = location + 1;
    ahist = testm(((location - range):(location - 1)),1)';
    if isempty (find (ahist == 0, 1))
        ahist = compmat (ahist);
    else
        continue
    end
    %if there is a 0 in the history, that indicates a break between one
    %agent's history and the next, which is garbage data and is therefore
    %skipped
    afut = testm(((location + 1):(location + range)),1)';
    if isempty (find (afut == 0, 1))
        afut = compmat (afut);
    else
        continue
    end
    xcor = compressedindex(ahist,range,blookup);
    ycor = compressedindex(afut,range,blookup);
    if rmat(xcor) ~= 1
        xcor = rmat (xcor);
    end
    if rmat (ycor) ~= 1
        ycor = rmat (ycor);
    end
    if xcor == 0
        skippedzer = skippedzer + 1;
        continue
    end
    if ycor == 0
        skippedzer = skippedzer + 1;
        continue
    end
    prevvalue = transmat(ycor,xcor);
    transmat(ycor,xcor) = prevvalue + 1;
    
end
fname = sprintf ('CompressedChiSquaredV%dR%drep%d',visionits,range,its2);
exportdata (transmat,fname);
transmat = sparse(transmat);
save (fname,'transmat');
leadersnum (visionits+1,its2) = size (leaders,2);
its2 = its2+1
end
visionits
end
clearvars -except statreps totreps skipped skippedzer
for its = 0:totreps
    for i2 = 1:statreps
        filename = sprintf ('CompressedChiSquaredV%dR15rep%d',its,i2);
        compfilename = sprintf ('V%drep%d',its,i2);
        load (filename);
        eval ([compfilename,' = sparse(transmat);']);
    end
end
clear transmat
for i = 0:totreps
    for i2 = 1:statreps
        filecomp = sprintf ('V%drep%d',i,i2);
        filesave = sprintf ('Res%drep%d',i,i2);
        for its = 0:totreps
            for its2 = 1:statreps
                fileapprox = sprintf ('V%drep%d',its,its2);
                eval (['MSE = MSEfunc(',filecomp,',',fileapprox,');']);
                eval ([filesave,'(its+1,its2)=MSE;']);
            end
        end
    end
end
for i = 0:totreps
    varname = sprintf ('res%d',i);
    first = sprintf ('Res%drep1',i);
    eval ([varname,'= full(',first,');']);
    for i2 = 2:statreps
        cat = sprintf ('Res%drep%d',i,i2);
        eval ([varname,'= full (horzcat (',varname,',',cat,'));']);        
    end
end
meds = zeros (15,1);
for i = 0:totreps
    orgfile = sprintf ('res%d',i);
    resfile = sprintf ('med%d',i);
    eval (['pres=median(',orgfile,',2);']);
    meds = horzcat (meds,pres);
end
meds = meds(:,2:end);
