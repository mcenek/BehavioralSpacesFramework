function [ y ] = chisquared( locationa,locationb,matrix )
chimat(1,:) = matrix(locationa,:);
chimat(2,:) = matrix(locationb,:);
rowtotal = sum(chimat,2);
coltotal = sum(chimat,1);
gridtotal = sum(sum(chimat));
expected = zeros(2,size(matrix,2));
for ia = 1:2
    for ib = 1:size(chimat,2)
        expected(ia,ib) = (rowtotal(ia)*coltotal(ib))/gridtotal;
    end
end
chi2stat = (((chimat - expected).^2) ./ expected);
chi2nan = isnan(chi2stat);
chi2stat(chi2nan) = 0;
chi2stat = sum(sum(chi2stat));
py = chi2stat;
y = 1 - chi2cdf(chi2stat,1);
end
