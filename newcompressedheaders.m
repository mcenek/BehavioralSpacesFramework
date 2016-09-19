function [ y ] = newcompressedheaders( range,dims )
%dims must be >= 4
%initialize variables
for i = 2:dims
    A = sprintf('%i',i);
    eval (['res',A,'=zeros(1,i);']);
end

if dims == 3
%create initial step
for i = range:-1:0
res2 = vertcat (res2,newsumtable (i));
end
res2 = res2(2:end,:);
res3 = horzcat((range - sum(res2,2)),res2);
end

%iterate recursively to construct final table
for i = dims:-1:4
    A = sprintf('%i',i-1);
    B = sprintf('%i',i);
    eval (['pres',A,'=zeros(1,i-1);']);
    for i2 = range:-1:0
        pres = newcompressedheaders (i2,i-1);
        eval (['res',A,'=vertcat(res',A,',pres);']);
    end
    eval (['res',A,'=res',A,'(2:end,:);']);
    eval (['res',B,'=horzcat((range - sum(res',A,',2)),res',A,');']);
end

A = sprintf ('%i',dims);
eval (['y=uint8(res',A,');']);
end