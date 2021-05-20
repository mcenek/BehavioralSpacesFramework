location = range;
transmat = zeros (816);
for its = 0:(size(testm)-((range*2)+1))
    %for previous and future of an agent, write event in the result matrix
    %incrementing the value by 1
    location = location + 1;
    ahist = testm(((location - range):(location - 1)),1)';
    if isempty (find (ahist == 0, 1))
        ahist = compmat (ahist);
    else
        continue
    end
    %if there is a 0 in the history, that indicates a break between one
    %agent's history and the next, which is garbage data and is therefore
    %skipped
    afut = testm(((location + 1):(location + range)),1)';
    if isempty (find (afut == 0, 1))
        afut = compmat (afut);
    else
        continue
    end
    xcor = compressedindex(ahist,range,blookup);
    ycor = compressedindex(afut,range,blookup);
    if rmat(xcor) ~= 1
        xcor = rmat (xcor);
    end
    if rmat (ycor) ~= 1
        ycor = rmat (ycor);
    end
    prevvalue = transmat(ycor,xcor);
    transmat(ycor,xcor) = prevvalue + 1;
    
end