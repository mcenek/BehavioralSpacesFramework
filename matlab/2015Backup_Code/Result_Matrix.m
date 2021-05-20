clear
range = 3;
dims = 3;
testlength = 10000;
testm = uint8(ceil(rand (testlength,1) * dims));
columns = '';
%RMatrices = cell(1,1);%Saves finished result matrices for reference
RMatrix = zeros((dims^range)+1,'uint32');%Generates individual result matrix if
%not in ResultMatrices

plcolumnheader = (1:dims);
for its = 1:range
    eval(['header', num2str(its), '= plcolumnheader;']);
    %create variables for each component of the range
    columns = strcat(columns,'header',num2str(its),',');
    %record how many variables were made in order to combine them later
end
columns = columns(1:(end-1));
eval(['columnheaders =uint8(allcomb(',columns,'));']);
%Cartesian product of each component made in the previous for loop

for its = 1:(dims^range)
    %convert matrices in columnheaders to single numbers in order to save
    %memory when imported into RMatrix
    RMatrix(1,its+1) = singlenumber(columnheaders(its,:));
    RMatrix(its+1,1) = singlenumber(columnheaders(its,:));
end

