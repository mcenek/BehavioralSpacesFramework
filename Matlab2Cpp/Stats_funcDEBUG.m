function [ rmat ] = Stats_funcDEBUG( HistFutTable,threshold )
emptyrows = all (~HistFutTable,2);
emptyrows = find (emptyrows == 1);

chi2L = (1:size(HistFutTable));
sums = sum(HistFutTable,2);
firstleader = find (sums == max(sums));
firstleader = firstleader (1);
%The first leader is seeded in order to ensure that it is not an extremely
%sparse row of the matrix - which creates problems with the chi square test
%of independence

% %Statistical Correlation
for its3 = 1:size(emptyrows,1)
    x = emptyrows (its3);
    chi2L = chi2L(chi2L ~= x);
end
rmat = zeros(1,size(HistFutTable,1))';
%leaders = chi2L (randmat);
leaders = firstleader;
rmat (firstleader) = -1;
leadercomp = zeros (1,size(HistFutTable,1));
chi2L = chi2L (chi2L ~= firstleader);
chis = zeros (2,size(HistFutTable,2));
% p2chi = zeros (1,size(RData,2));
while size(chi2L) > 0
    randmat = ceil(size(chi2L,2) * rand(1));
    randmat = chi2L(randmat);
    for its = leaders
        chis = [HistFutTable(its,:);HistFutTable(randmat,:)];
        leadercomp (its) = chisquaredDEBUG(chis);
    end
    [M,I] = max (leadercomp);
    if M > threshold
        rmat (randmat) = I;
        chi2L = chi2L (chi2L ~= randmat);
    else
        rmat(randmat) = -1;
        leaders = horzcat (leaders,randmat);   %#ok
        chi2L = chi2L (chi2L ~= randmat);
    end
end


end

