range = 9;
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