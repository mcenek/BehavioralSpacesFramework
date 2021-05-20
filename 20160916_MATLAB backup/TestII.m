%range and dims given
clear
range = 3;
dims = 4;

if dims < 3
    break
end

%initialize variables
for i = 3:dims
    A = sprintf('%i',i);
    eval (['res',A,'=zeros(1,i);']);
end
%create initial step
res3 = res3(2:end);
for i = range:-1:0
res3 = vertcat (res3,newsumtable (i));
end
res3 = res3(2:end,:);
res3 = horzcat((range - sum(res3,2)),res3);

%iterate
for i = 3:dims
    for i2 = range:-1:1
        
    end
end
%delete
%y = res;