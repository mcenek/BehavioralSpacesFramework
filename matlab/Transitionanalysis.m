clear transmat
location = range;
transmat = zeros(size(RData,1));
for its = 0:(size(testm)-((range*2)+1))
    %for previous and future of an agent, write event in the result matrix
    %incrementing the value by 1
    location = location + 1;
    ahist = testm(((location - range):(location - 1)),1)';
    afut = testm(((location + 1):(location + range)),1)';
    xcor = compressedindex(ahist,range,blookup)+1;
    ycor = compressedindex(afut,range,blookup)+1;
    if rmat(xcor) ~= 1
        xcor = rmat (xcor);
    end
    if rmat (ycor) ~= 1
        ycor = rmat (ycor);
    end
    
    prevvalue = transmat(ycor,xcor);
    transmat(ycor,xcor) = prevvalue + 1;
end 