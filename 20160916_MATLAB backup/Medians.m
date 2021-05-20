clearvars -except Mres
MSEcomp = zeros (300);
sizeMres = size (Mres,1);
for i = 1:(sizeMres/5)
    MSEcomp (:,i) = median (Mres (:,i:i+5),2);
end

for i = 1:(sizeMres/5)
    MSEcomp2 (i,:) = median (MSEcomp (i:i+5,:),1);
end
MSEcomp2 = MSEcomp2 (1:60,1:60);