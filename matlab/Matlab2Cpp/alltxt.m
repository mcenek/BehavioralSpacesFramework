function [ filepaths ] = alltxt( folder )
%This function creates a cell array with the path of all the text files in
%the desired folder. Each subfolder is contained in a separate page of the
%cell array. This can be used in order to quickly set up an iterator for a
%large dataset. 
folderdir = dir (folder);
filepaths = cell (1,1);
subfolders = cell (1,1);
for i = 1:size (folderdir,1);
    if folderdir(i).isdir
        txtfiles = txtlist (strcat (folder,'\\',folderdir(i).name));
        if ~isequal (txtfiles,{[]});
            filepaths (end+1) = {txtfiles}; %#ok
            subfolders (end+1) = {folderdir(i).name}; %#ok
        end
    end
end
filepaths = filepaths (2:end);
subfolders = subfolders (2:end);
filepaths = vertcat (subfolders,filepaths);
end

