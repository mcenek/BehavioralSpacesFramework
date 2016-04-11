function y = importwithtime (file)
%importwithtime takes a vector of the format [direction],[who],[ticks],
%repeating, and converts it into a matrix where the x coordinate is [who],
%the y coordinate is [ticks] and the contents is [direction]. 
A=importdata (file,',');
A = A';
A = A(:);
A(isnan(A(:,1)),:)=[];
A = reshape (A,3,size(A,1)/3);
A (2,:) = A (2,:) + 1;
RData = zeros (1);
for i = 1:size (A,2)
    if A (3,i) == 0
        continue
    end
    RData(A(2,i),A(3,i)) = A(1,i);
end
y = RData;
end