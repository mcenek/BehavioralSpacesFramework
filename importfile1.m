function data = importfile1(file)
fid = fopen(file);
A = textscan(fid, '%s');
A = A{:};
A = horzcat(A{:});
A = eval(['[',A,'];']);
data = A;
fclose(fid);
end