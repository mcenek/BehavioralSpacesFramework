clear fnames pnames

statreps = 20;
totreps = 14;
its = 0;
its2 = 0;
%fnameprimitive = 'Spread005';

for i = 0:totreps
    fnames (i+1) = cellstr(sprintf ('PV%i',i));
end

% 
% for i = 0:totreps
%     for i2 = 1:statreps
%         filename = sprintf ('%sV%dR%drep%d',fnameprimitive,i,range,i2);
%     end
% end

% its = 0;
% 
% %for i = 0:totreps
%     for i2 = 1:statreps
%         its = its + 1;
%         PV0 = horzcat (fileindexes (its),',');
%     end
% %end
% 
% % 
% % for i = 0:totreps
% %     for i2 = 1:statreps
% %         filename = sprintf ('%sV%dR%drep%d',fnameprimitive,i,range,i2);
% %         
% %     end
% % end