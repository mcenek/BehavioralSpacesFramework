function [ y ] = chisquaredDEBUG(chimat)
x = chimat (1,:);
z = chimat (2,:);
%[~,~,pval] = crosstab([x z],[ones(size(x)) 2*ones(size(z))]);
[~,~,pval2] = abridgedcrosstab([x z],[ones(size(x)) 2*ones(size(z))]);
y = pval2;
end
