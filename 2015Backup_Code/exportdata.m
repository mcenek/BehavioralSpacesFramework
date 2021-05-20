function data = exportdata(variable,filename)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
fname = sprintf ('C:\\YourFileLocationHere\\%s.csv',filename);
fid = fopen(fname,'w');
dlmwrite (fname,variable);
fclose(fid);
end

