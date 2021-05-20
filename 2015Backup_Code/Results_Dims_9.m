clear
range = 6;
dims = 4;
vision = 3;
if dims > 9
    dims = 9;
end
importfile = sprintf ('C:\\YourFileLocationHere\\dataV%d.txt',vision);
testm = uint8(importfile1(importfile))';
columns = '';
location = range;
RMatrix = zeros((dims^range)+1);
%Generates individual result matrix
plcolumnheader = (1:dims);

for its = 1:range
    eval(['header',num2str(its),'= plcolumnheader;']);
    %create variables for each component of the range
    columns = strcat(columns,'header',num2str(its),',');
    %record how many variables were made in order to combine them later
end
columns = columns(1:(end-1));
%Remove last extraneous comma
eval(['columnheaders = allcomb(',columns,');']);
columnheaders2 = columnheaders;
%Cartesian product of each component made in the previous loop
for its = 1:(dims^range)
    columnheaders (its,1) = singlenumber(columnheaders(its,:)); %#ok<SAGROW>
end
columnheaders = columnheaders(:,1);
%convert (dims^range) x dims matrix into single number to save memory and
%become searchable
for its = 1:(dims^range)
    %import column headers into the final results matrix
    RMatrix(1,its+1) = columnheaders(its,1);  
    RMatrix(its+1,1) = columnheaders(its,1);
end


for its = 0:(size(testm)-((range*2)+1))
    %for previous and future of an agent, write event in the result matrix
    %incrementing the value by 1
    location = location + 1;
    ahist = testm(((location - range):(location - 1)),1)';
    ahist = singlenumber(ahist);
    afut = testm(((location + 1):(location + range)),1)';
    afut = singlenumber(afut);
    xcor = find(columnheaders == ahist)+1;
    ycor = find(columnheaders == afut)+1;
    prevvalue = RMatrix(ycor,xcor);
    RMatrix(ycor,xcor) = prevvalue + 1;
end 
RData = double(RMatrix(2:end,2:end));


clearvars -except RData RMatrix testm range columnheaders columnheaders2 vision

% 
% for its2 = 1:4
% threshold = 0.01;
% chi2L = 1:size(RData);
% randmat = ceil(size(chi2L,2) * rand(1));
% rmat = zeros(1,size(RData,1))';
% leaders = chi2L (randmat);
% rmat (randmat) = 1;
% leadercomp = zeros (1,size(RData,1));
% chi2L = chi2L (chi2L ~= randmat);
% % p2chi = zeros (1,size(RData,2));
% while size(chi2L) > 0
%     randmat = ceil(size(chi2L,2) * rand(1));
%     randmat = chi2L(randmat);
%     for its = leaders
%         leadercomp (its) = chisquared(its,randmat,RData);
%     end
%     [M,I] = max (leadercomp);
%     if M > threshold
%         rmat (randmat) = I;
%         chi2L = chi2L (chi2L ~= randmat);
%     else
%         rmat(randmat) = 1;
%         leaders = horzcat (leaders,randmat);
%         chi2L = chi2L (chi2L ~= randmat);
%     end
%     size (leaders,2)
%     size(chi2L,2)
% end
% 
% 
% clear transmat
% location = range;
% transmat = zeros(size(RData,1));
% for its = 0:(size(testm)-((range*2)+1))
%     %for previous and future of an agent, write event in the result matrix
%     %incrementing the value by 1
%     location = location + 1;
%     ahist = testm(((location - range):(location - 1)),1)';
%     ahist = singlenumber(ahist);
%     afut = testm(((location + 1):(location + range)),1)';
%     afut = singlenumber(afut);
%     xcor = find(columnheaders == ahist);
%     ycor = find(columnheaders == afut);
%     
%     if rmat(xcor) ~= 1
%         xcor = rmat (xcor);
%     end
%     if rmat (ycor) ~= 1
%         ycor = rmat (ycor);
%     end
%     
%     prevvalue = transmat(ycor,xcor);
%     transmat(ycor,xcor) = prevvalue + 1;
%     
% end 
% fname = sprintf ('LegacyChiSquaredV%dR%drep%d',vision,range,its2);
% exportdata (transmat,fname);
% end
