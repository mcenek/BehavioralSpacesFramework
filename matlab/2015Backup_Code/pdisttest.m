function [ y,z ] = pdisttest( RData )
threshold = 0.02;
chi2L = 1:size(RData);
randmat = ceil(size(chi2L,2) * rand(1));
rmat = zeros(1,size(RData,1))';
%leaders = chi2L (randmat);
leaders = chi2L(randmat);
rmat (randmat) = 1;
leadercomp = zeros (1,size(RData,1));
chi2L = chi2L (chi2L ~= randmat);
% p2chi = zeros (1,size(RData,2));
while size(chi2L) > 0
    randmat = ceil(size(chi2L,2) * rand(1));
    randmat = chi2L(randmat);
    for its = leaders
        tmat = vertcat (RData(randmat,:),RData(its,:));
        leadercomp (1,its) = pdist(tmat);
    end
    [M,I] = max (leadercomp);
    if M > threshold
        rmat (randmat) = I;
        chi2L = chi2L (chi2L ~= randmat);
    else
        rmat(randmat) = 1;
        leaders = horzcat (leaders,randmat);
        chi2L = chi2L (chi2L ~= randmat);
    end
end
y = rmat;
z = size (leaders,2);
end

