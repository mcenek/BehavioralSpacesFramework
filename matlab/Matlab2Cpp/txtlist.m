function [ txtpaths ] = txtlist( folder )
%Generates a list of the path for all the txt files in the chosen directory
txtdir = dir (folder);
txtpaths = cell (1,1);
for i = 1:size(txtdir,1);
    if ~isempty(regexp(txtdir(i).name,'\.(txt)$', 'once'));
        A = strcat (folder,'\\',txtdir(i).name);
        txtpaths (end+1) = {A}; %#ok - simplifies code
    end
end
if numel (txtpaths) > 1
txtpaths = txtpaths (2:end)';
end
end

