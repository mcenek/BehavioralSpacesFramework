function [ y ] = chisquared(chimat)
x = chimat (1,:);
z = chimat (2,:);
[~,~,pval] = crosstab([x z],[ones(size(x)) 2*ones(size(z))]);
y = pval;
end
