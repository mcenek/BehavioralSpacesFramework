% clearvars -except x y m n
% cook up some sample data
k = 5;
p = rand(1,k); p = p./sum(p);
M = 200; N = 250;
x = randsample(1:k,M,true,p); m = histc(x,1:k);
y = randsample(1:k,N,true,p); n = histc(y,1:k);

% Do the test by hand
phat = (m+n) ./ (M+N);
em = phat*M; en = phat*N;
chi2 = sum(([m n] - [em en]).^2 ./ [em en]);
df = k-1;
pval = 1 - chi2cdf(chi2,df);

% Trick CHI2GOF into doing a two sample test. Note the
% nparams value must be such that 2*k - nparams - 1 = k-1
[~,pval2,stats] = chi2gof(1:10,'ctrs',1:10,'freq',[m n], ...
           'expected',[em en],'nparams',k, 'emin',0)

% Use CROSSTAB
[tbl,chi2,pval] = crosstab([x y],[ones(size(x)) 2*ones(size(y))])
