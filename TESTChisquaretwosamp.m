%Test old chi square against new chi square using matrix with Cols: (Col1
%Col2 Oldteststat Newteststat, using pvalues). Analyze results. Then check
%the distribution of new test results vs old test results, number of
%leaders and how to achieve an appropriate level of simplification. 
clear
load ('TESTData.mat');
for its3 = 1:size(emptyrows,1)
    chi2L = chi2L(chi2L ~= emptyrows (its3));
end
% chicomp = zeros (5000,4);
rmat = zeros(1,size(RData,1))';
%leaders = chi2L (randmat);
leaders = firstleader;
rmat (firstleader) = 1;
leadercomp = zeros (1,size(RData,1));
chi2L = chi2L (chi2L ~= firstleader);
% i = 0;
% p2chi = zeros (1,size(RData,2));
while size(chi2L) > 0
%     size (chi2L)
%     i = i + 1;
    randmat = ceil(size(chi2L,2) * rand(1));
    randmat = chi2L(randmat);
%     chicomp (i,1) = randmat;
%     chicomp (i,2) = its;
    for its = leaders
            chis = [RData(its,:);RData(randmat,:)];
            leadercomp (its) = chisquaredtwosamp(chis);
%             chicomp (i,3) = leadercomp (its);
%             chis = [RData(its,:);RData(randmat,:)];  
%             leadercomp (its) = chisquared(chis);
%             chicomp (i,4) = leadercomp (its);
    end
    [M,I] = max (leadercomp);
    if M > threshold
        rmat (randmat) = I;
        chi2L = chi2L (chi2L ~= randmat);
    else
        rmat(randmat) = 1;
        leaders = horzcat (leaders,randmat);   %#ok
        chi2L = chi2L (chi2L ~= randmat);
    end
end