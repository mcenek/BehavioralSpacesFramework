function data = exportdata(variable,fname)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
fid = fopen(fname,'w');
dlmwrite (fname,variable,'precision',10);
fclose(fid);
end

