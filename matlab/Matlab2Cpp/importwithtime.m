function y = importwithtime (file)
%Pulls data with tick times and agent names from the supplied file, then
%organizes the data so each agent is in chronological order
rawImport = importdata (file,',');
rawImport (:,2) = rawImport(:,2) - min (rawImport(:,2)) + 1;
%As only the relative order and identifier matters, sets the minimum tick
%number and agent ID to 1
rawImport (:,3) = rawImport(:,3) - min (rawImport(:,3)) + 1;
rawImport = rawImport';
rawImport = rawImport(:);
rawImport(isnan(rawImport(:,1)),:)=[];
rawImport = reshape (rawImport,3,size(rawImport,1)/3);
rawImport = unique (rawImport','rows');
%Removes duplicates from the imported dataset
rawImport = sortrows (rawImport,[2 3]);
%Sort first based on agent ID, then on tick number. This way each agent's
%history should be separate and chronological
rawImport = (rawImport (:,1)');
%%%% To convert from one dimensionality to another (in this case 16-->4)
rawImport = rawImport - 1;
rawImport = uint8(floor (rawImport ./ 4) + 1);
%%%%
y = uint8(rawImport);
end