threshold = 0;
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
        leadercomp (its) = chisquared(its,randmat,RData);
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