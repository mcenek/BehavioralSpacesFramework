clear
range = 3;
dims = 4;
testlength = 100000;
testm = uint8(randi(dims,testlength,1));
columns = '';
location = range;
RMatrix = zeros((dims^range)+1,'uint32');
%Generates individual result matrix
plcolumnheader = (1:dims);
for its = 1:range
    eval(['header', num2str(its), '= plcolumnheader;']);
    %create variables for each component of the range
    columns = strcat(columns,'header',num2str(its),',');
    %record how many variables were made in order to combine them later
end
columns = columns(1:(end-1));
eval(['columnheaders = uint32(allcomb(',columns,'));']);
%Cartesian product of each component made in the previous for loop

for its = 1:(dims^range)
    columnheaders (its,1) = singlenumber(columnheaders(its,:)); %#ok<SAGROW>
end
columnheaders = columnheaders(:,1);
%convert (dims^range) x dims matrix into single number to save memory and
%become searchable

for its = 1:(dims^range)
    %Place column headers in the result matrix
    RMatrix(1,its+1) = columnheaders(its,:);
    RMatrix(its+1,1) = columnheaders(its,:);
end

for its = 0:(size(testm)-((range*2)+1))
    %for previous and future of an agent, write event in the result matrix
    %incrementing the value by 1
    location = location + 1;
    ahist = testm(((location - range):(location - 1)),1)';
    afut = testm(((location + 1):(location + range)),1)';
    xcor = cor(ahist,range,dims);
    ycor = cor(afut,range,dims);
    prevvalue = RMatrix(ycor,xcor);
    RMatrix(ycor,xcor) = prevvalue + 1;
end

% function [ xcor,ycor ] = FindLocationycor( var,x,y )
% xcor = find(var == x);
% ycor = find(var == y);
% end

