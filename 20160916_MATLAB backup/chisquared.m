function [ y ] = chisquared(chimat)
rowtotal = sum(chimat,2);
coltotal = sum(chimat,1);
gridtotal = sum(sum(chimat));
expected = (rowtotal * coltotal) / gridtotal;
chi2stat = (((chimat - expected).^2) ./ expected);
chi2stat(isnan(chi2stat)) = 0;
chi2stat = sum(sum(chi2stat));
y = 1 - gammainc((chi2stat/2), 1);
end
