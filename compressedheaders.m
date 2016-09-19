function [ y ] = compressedheaders( range )
res = zeros (1,3);
res (1,4) = range;
i = 1;
while 1
    s2 = res (i,1) + res (i,2);
    if (range-s2) == 0
        if res (i,1) == range
            break
        else
        ptable = horzcat (res (i,1) + 1,0,0,range - (res(i,1)+1));
        res = vertcat (res,ptable);
        i = i+1;
        end
    else
        cdtable = sumtable (range-s2);
        abtable = repmat (res (i,1:2),size(cdtable,1),1);
        ptable = horzcat (abtable,cdtable);
        res = vertcat (res,ptable);
        ptable = horzcat (res (i,1),res (i,2) + 1,0,range - (res(i,1)+(res(i,2)+1)));
        res = vertcat (res,ptable);
        i = i + size (cdtable,1) + 1;
    end
end
y = res;
end

