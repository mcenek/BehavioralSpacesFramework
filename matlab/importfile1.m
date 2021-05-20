function data = importfile1(file)
fid = fopen(file);
A = textscan(fid, '%s');
A = A{:};
A = horzcat(A{:});
if A(1) == ','
    A = A(2:end);
end
if A(end) == ','
    A = A(1:end-1);
end

A = eval(['[',A,'];']);

data = A';
fclose(fid);
end