 clear
% % cook up some sample data
% k = 5;
% p = rand(1,k); p = p./sum(p);
% M = 200; N = 250;
% x = randsample(1:k,M,true,p); m = histc(x,1:k);
% y = randsample(1:k,N,true,p); n = histc(y,1:k);

load ('chis');

cats = size (chis,2);
M = cats;
N = cats;
k = cats;
m = chis (1,:);
n = chis (2,:);

% Do the test by hand
phat = (m+n) ./ (M+N);
em = phat*M; en = phat*N;
chi2 = sum(([m n] - [em en]).^2 ./ [em en]);
df = k-1;
pval1 = 1 - chi2cdf(chi2,df);



% Use CROSSTAB
pval2 = chisquaredDEBUG (chis);