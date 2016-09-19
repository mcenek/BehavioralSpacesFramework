function y = newimport (file)
fid = fopen(file);
A = textscan(fid, '%s');
A = A{:};
A = horzcat(A{:});
data = zeros (size (A,2),1);
for i = 1: size (A,2)
    data (i) = str2double (A(i));
end 
y = data;
% if A(1) == ','
%     A = A(2:end);
% end
% if A(end) == ','
%     A = A(1:end-1);
% end
% 
% A = eval(['[',A,'];']);

fclose(fid);
end