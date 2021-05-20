clear
skipped = 0;
skippedzer = 0;
load ('blookup.mat')
totreps = 14;
statreps = 10;
lengthsteps = 49;
fnameprimitive = 'Lengthconvergence';

it = 1;
it2 = 1;

for visionits = 0:totreps
for lengthits = 0:lengthsteps
tickindex = ((lengthits+3)*100);
clearvars -except it it2 fnameprimitive visionits skipped leadersnum blookup skippedzer totreps statreps lengthits lengthsteps tickindex
range = 15;
importfile = sprintf ('C:\\Users\\Spencer\\documents\\MATLAB\\Netlogo\\DNA%ddata%d.txt',visionits,tickindex);
testm = uint8(newimport(importfile));
%Max range for 32 bit is approximately 44, size of the matrix increases as
%sum(blookup(1:(range+1))
location = 0;
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
emptyrows = all (~RData,2);
emptyrows = find (emptyrows == 1);

its2 = 1;
while its2 <= statreps
threshold = 0.05;
chi2L = 1:size(RData);
sums = sum(RData,2);
firstleader = find (sums == max(sums));
firstleader = firstleader(1);


%STATS
for its3 = 1:size(emptyrows,1)
    chi2L = chi2L(chi2L ~= emptyrows (its3));
end
rmat = zeros(1,size(RData,1))';
%leaders = chi2L (randmat);
leaders = firstleader;
rmat (firstleader) = 1;
leadercomp = zeros (1,size(RData,1));
chi2L = chi2L (chi2L ~= firstleader);
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

% 
% clear transmat
% location = 0;
% transmat = zeros(size(RData,1));
% %rmat = ones (816,1);
% for its = 0:(size(testm,1)-((range*2)))
%     %for previous and future of an agent, write event in the result matrix
%     %incrementing the value by 1
%     location = location + 1;
%     ahist = testm(location:location+(range-1))';
%     if isempty (find (ahist == 0, 1))
%         ahist = compmat (ahist);
%     else
%         continue
%     end
%     %if there is a 0 in the history or future of an agent, that indicates 
%     %a break between one agent's history and the next, which is garbage
%     %data and is therefore skipped
%     afut = testm(location+range:location+(range*2-1))';
%     if isempty (find (afut == 0, 1))
%         afut = compmat (afut);
%     else
%         continue
%     end
%     xcor = compressedindex(ahist,range,blookup);
%     ycor = compressedindex(afut,range,blookup);
%     if rmat(xcor) ~= 1
%         xcor = rmat (xcor);
%     end
%     if rmat (ycor) ~= 1
%         ycor = rmat (ycor);
%     end
%     if xcor == 0
%         skippedzer = skippedzer + 1;
%         continue
%     end
%     if ycor == 0
%         skippedzer = skippedzer + 1;
%         continue
%     end
%     prevvalue = transmat(ycor,xcor);
%     transmat(ycor,xcor) = prevvalue + 1;
%     
% end

fname = sprintf ('%sV%dR%drep%dT%d',fnameprimitive,visionits,range,its2,tickindex);
% exportdata (transmat,fname);
% transmat = sparse(transmat);
% save (fname,'transmat');


if it > statreps
    it = 1;
    it2 = it2 + 1;
end
leadersnum (it,it2) = size (leaders,2);
its2 = its2+1
it = it + 1;
end
lengthits
visionits
end
end
leadername = sprintf ('%sTickwiseLeaders',fnameprimitive);
save (leadername, 'leadersnum')
% 
% clearvars -except statreps totreps skipped skippedzer
% statreps = 20;
% totreps = 14;
% its = 0;
% its2 = 0;
% 
% for i = 0:totreps
%     for i2 = 1:statreps
%         its = its + 1;
%         fileindexes(its) = cellstr(sprintf('CompressedChiSquaredV%dR15rep%d',i,i2));
%     end
% end
% its = 0;
% 
% for i = 0:totreps
%     for i2 = 1:statreps
%         filename = sprintf ('CompressedChiSquaredV%dR15rep%d',i,i2);
%         load (filename);
%         eval ([filename,' = sparse(transmat);']);
%     end
% end
% clear transmat
% 
% Mres = zeros (300);
% for i = 0:totreps
%     for i2 = 1:statreps
%         its = its + 1
%         filecomp = char(fileindexes (its));
%         for i = 0:totreps
%             for i2 = 1:statreps
%                 its2 = its2 + 1;
%                 fileapprox = char(fileindexes (its2));
%                 eval (['MSE = MSEfunc(',filecomp,',',fileapprox,');']);
%                 Mres (its,its2) = MSE;
%             end
%         end
%         its2 = 0;
%     end
% end