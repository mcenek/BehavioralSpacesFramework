function [x,y,z] = importwithtimeandcatagories (file)
%Pulls data with tick times and agent names from the supplied file, then
%organizes the data so each agent is in chronological order
rawImport = importdata (file,',');
categories = rawImport.textdata (:,3);
categories = strfind (categories,'sockeye');
categories = cellfun (@isempty,categories);
A = rawImport.data;
B= cellfun(@str2double,rawImport.textdata (:,1:2));
importData = horzcat (B,A);
x = importData (categories,:);
y = importData (~categories,:);
z = importData;
end