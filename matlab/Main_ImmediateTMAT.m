clear
TwoSampleChiSquare = true;
SeededFirstRow = false;
skipped = 0;
skippedzer = 0;
load ('blookup.mat')
%Dataset used in the compression algorithm to help computational speed
range = 15; 
totreps = 14;
statreps = 4;
thresholds = [0.6,0.9];

%totreps corresponds to the number of different ABM datasets imported,
%statreps corresponds to the number of times each dataset is computed -
%this is purely for convenience as each result is created and saved before
%the next is computed, and results do not differ if each is computed
%independently
fnameprimitive = 'ImmediateTMAT';
for visionits = 12
clearvars -except SeededFirstRow TwoSampleChiSquare thresholds location range visionits skipped leadersnum blookup skippedzer totreps statreps fnameprimitive
location = 0;
%importfile = sprintf ('C:\\Users\\Spencer\\documents\\MATLAB\\Paper1Revision\\Netlogo\\DNA%ddata.txt',visionits);
importfile = sprintf ('DNAdata14.txt');
%Import path, must be changed to where data is. The model is currently
%setup for non-delineated data, if results are in csv format the line
%immediately below this comment should read 'testm = uint8(importfile1(importfile))';
testm = uint8(newimport(importfile));
%Max range for 32 bit is approximately 44, size of the matrix increases as
%sum(blookup(1:(range+1))

columnheaders = compressedheaders (range);
RMatrix = zeros((size(columnheaders,1)+1));

for its = 1:(size (columnheaders))
    columnheaders2 (its,1) = singlenumber(columnheaders(its,:)); %#ok<SAGROW>
end

for its = 1:(size (columnheaders))
    RMatrix(1,its+1) = columnheaders2(its,1);  
    RMatrix(its+1,1) = columnheaders2(its,1);
end
%Headers are used in order to make the resulting data sensical - for
%specific indices the funciton 'compressedindex' should be used, these are
%for reference only and have some ambiguity

for its = 0:(size(testm,1)-((range*2)))
    %for previous and future of an agent, write event in the result matrix
    %incrementing the value by 1 in the location corresponding to its
    %behavior
    location = location + 1;
    ahist = testm(location:location+(range-1))';
    if isempty (find (ahist == 0, 1))
        ahist = compmat (ahist);
    else
        continue
    end
    %if there is a 0 in the history or future of an agent, that indicates 
    %a break between one agent's history and the next, which is garbage
    %data and is therefore skipped. This preserves the deliniation between
    %agents
    afut = testm(location+range:location+(range*2-1))';
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
%Two preliminary matrices are created - RMatrix has headers which indicate
%the behavior that datapoint came from, while RData does not have these
%headers and therefore is easier to compute with
emptyrows = all (~RData,2);
emptyrows = find (emptyrows == 1);
its2 = 1;
for threshold = thresholds

%The statistical threshold for the chi squared test
for its2 = 1:statreps
    its2
    threshold
    visionits
chi2L = 1:size(RData);
sums = sum(RData,2);
if SeededFirstRow
firstleader = find (sums == max(sums));
firstleader = firstleader (1);
else
    while 1
        firstleader = ceil (rand * 816);
        if sums (firstleader) == 0
        else 
            break
        end
    end
        
end
% else
%     firstleader = rand 
%The first leader is seeded in order to ensure that it is not an extremely
%sparse row of the matrix - which creates problems with the chi square test
%of independence

% %Statistical Correlation
for its3 = 1:size(emptyrows,1)
    chi2L = chi2L(chi2L ~= emptyrows (its3));
end
rmat = zeros(1,size(RData,1))';
%leaders = chi2L (randmat);
leaders = firstleader;
rmat (firstleader) = -1;
leadercomp = zeros (1,size(RData,1));
chi2L = chi2L (chi2L ~= firstleader);
% p2chi = zeros (1,size(RData,2));

while size(chi2L) > 0
    randmat = ceil(size(chi2L,2) * rand(1));
    randmat = chi2L(randmat);
    for its = leaders
        if TwoSampleChiSquare
            chis = [RData(its,:);RData(randmat,:)];
            leadercomp (its) = chisquaredtwosamp(chis);
        else
            chis = [RData(its,:);RData(randmat,:)];  %#ok
            leadercomp (its) = chisquared(chis);
        end
    end
    [M,I] = max (leadercomp);
    if M > threshold
        rmat (randmat) = I;
        chi2L = chi2L (chi2L ~= randmat);
    else
        rmat(randmat) = -1;
        leaders = horzcat (leaders,randmat);   %#ok
        chi2L = chi2L (chi2L ~= randmat);
    end
end


clear transmat
location = 0;
transmat = zeros(size(RData,1));
%rmat = ones (816,1);
for its = 0:(size(testm,1)-((range*2)))
    %for previous and future of an agent, write event in the result matrix
    %incrementing the value by 1
    location = location + 1;
    ahist = testm(location:location+(range-1))';
    if isempty (find (ahist == 0, 1))
        ahist = compmat (ahist);
    else
        continue
    end
    %if there is a 0 in the history or future of an agent, that indicates 
    %a break between one agent's history and the next, which is garbage
    %data and is therefore skipped
    afut = testm(location+1:location+range)';
    if isempty (find (afut == 0, 1))
        afut = compmat (afut);
    else
        continue
    end
    xcor = compressedindex(ahist,range,blookup);
    ycor = compressedindex(afut,range,blookup);
    if rmat(xcor) ~= -1
        xcor = rmat (xcor);
    end
    if rmat (ycor) ~= -1
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
prfname = strrep (num2str(threshold),'.','_');
resfname = sprintf ('Results%sV%drep%dThresh%s',fnameprimitive,visionits,its2,prfname);
rmatfname = sprintf ('LeadFollow%sV%drep%dThresh%s',fnameprimitive,visionits,its2,prfname);
%exportdata (transmat,fname);
%exportdata is used to export to xls format, such as if the data will be
%used in Gephi. Save is used to save data in the matlab format for easy
%retrieval
transmat = sparse(transmat);
save (resfname,'transmat');
save (rmatfname,'rmat');
leadersnum (visionits+1,its2) = size (leaders,2);
its2 = its2+1;
end
end
visionits
end
leadername = sprintf ('%sLeadersnums',fnameprimitive);
save (leadername,'leadersnum');

%MSE_Compare