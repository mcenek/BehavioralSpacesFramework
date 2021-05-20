clear header columnheader2
header = zeros (1,size(columnheaders2,2));
columnheader2 = vertcat (header,columnheaders2);
side = zeros (size(columnheader2,1),dims+1);
columnheader2 = horzcat (columnheader2,side);

for its = 1:dims
    columnheader2 (1,its+(range+1)) = its;
end

%Tally the number of each movement in columnheaders2, rather than tallying
%the movements themselves, in order to avoid the problem of 11112 looking
%completely differant than 21111,12111,11211 and 11121. 