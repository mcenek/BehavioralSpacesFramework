for i = 0:14
    varname = sprintf ('res%d',i);
    first = sprintf ('Res%drep1',i);
    eval ([varname,'= full(',first,');']);
    for i2 = 2:4
        cat = sprintf ('Res%drep%d',i,i2);
        eval ([varname,'= full (horzcat (',varname,',',cat,'));']);        
    end
end
