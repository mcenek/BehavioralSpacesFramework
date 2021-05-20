function [ x,y,z ] = mergeimport( files )
%mergeimport will return all the behaviors from all the files given to it
%in a single vector, ready for analysis. 
files = files{1,1};
[chinook,sockeye,all] = importwithtimeandcatagories (files {1});
for i = 2:size (files,1);
[pchinook,psockeye,pall] = importwithtimeandcatagories (files {i});
chinook = vertcat (chinook,pchinook);
sockeye = vertcat (sockeye,psockeye);
all = vertcat (pall,all);
end
x = processImport(chinook);
y = processImport(sockeye);
z = processImport(all);
end

