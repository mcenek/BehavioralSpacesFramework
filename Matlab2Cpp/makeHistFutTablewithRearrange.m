function [ y ] = makeHistFutTablewithRearrange( testm,range,dims,rmat )

ctable = comptable (range, dims);
ressize = ctable (end,end);
HistFutTable = zeros (ressize);
for its = 1:(size(testm,2)-(range*2))
    %for previous and future of an agent, write event in the result matrix
    %incrementing the value by 1
    
    ahist = testm(1,its:its+(range-1));
    if isempty (find (ahist == 0, 1))
        ahist = compmat (ahist,dims);
    else
        continue
    end
    %if there is a 0 in the history or future of an agent, that indicates 
    %a break between one agent's history and the next, which is garbage
    %data and is therefore skipped
    afut = testm(1,its+range:its+(range*2-1));
    if isempty (find (afut == 0, 1))
        afut = compmat (afut,dims);
    else
        continue
    end
    xcor = compressedindex(ahist,ctable,range,dims);
    ycor = compressedindex(afut,ctable,range,dims);
    if rmat(xcor) ~= -1
        xcor = rmat (xcor);
    end
    if rmat (ycor) ~= -1
        ycor = rmat (ycor);
    end
    if xcor == 0 || ycor == 0
        continue
    end

     prevvalue = HistFutTable(ycor,xcor);
     HistFutTable(ycor,xcor) = prevvalue + 1;
end
y = HistFutTable;
end

