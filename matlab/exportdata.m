function data = exportdata(variable,filename)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
fname =filename;
%fname = sprintf ('C:\\Users\\Spencer\\Documents\\MATLAB\\Paper1Revision\\Data\\%s.csv',filename);
fid = fopen(fname,'w');
dlmwrite (fname,variable);
fclose(fid);
end

