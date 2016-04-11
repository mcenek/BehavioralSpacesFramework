testm = uint8(importfile1('C:\YourFileLocationHere\data.txt'))';
leaderstable = zeros (25,4);
load ('blookup.mat')
clearvars -except leaderstable its2 its3 testm
range = 15;
%Max range for 32 bit is approximately 44
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
    xcor = find(ismember (columnheaders,ahist,'rows'))+1;
    ycor = find(ismember (columnheaders,afut,'rows'))+1;
    prevvalue = RMatrix(ycor,xcor);
    RMatrix(ycor,xcor) = prevvalue + 1;
end 

RData = RMatrix(2:end,2:end);

for i = 1:4
threshold = 0;
chi2L = 1:size(RData);
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
