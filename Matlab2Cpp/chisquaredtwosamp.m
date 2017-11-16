function [ y ] = chisquaredtwosamp(chimat)
M = size (chimat,1);
N = M;
k = M;

m = chimat (1,:);
n = chimat (2,:);
phat = (m+n) ./ (M+N);
em = phat*M; en = phat*N;
chi2 = sum(([m n] - [em en]).^2 ./ [em en]);
df = k-1;
y = 1 - chi2cdf(chi2,df);
end
