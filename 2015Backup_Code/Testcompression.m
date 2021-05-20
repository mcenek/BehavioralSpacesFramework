clear
range = 9;
dims = 4;
if dims > 9
    dims = 9;
end
%testm = uint8(importfile1('C:\Users\Spencer\documents\MATLAB\data.txt'))';
columns = '';
location = range;
%RMatrix = zeros((dims^range)+1);
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

res = zeros (1,4);
for i = 1:size (columnheaders,1)
    pres = Compmat (columnheaders(i,:),dims);
    index = find(all(bsxfun(@eq,pres,res),2));
    if size (index,1) == 0
        res (end+1,:) = pres;
    end
end
res = res(2:end,:);
