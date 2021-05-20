clear
totreps = 14;
statreps = 4;
visionits = 300:100:5200;
leaderscount = zeros (1);
its2 = 0;

for its = 0:totreps
    for i3 = visionits
        for i2 = 1:statreps
        its2 = its2 + 1
        filename = sprintf ('LengthconvergenceV%dR15rep%dT%d',its,i2,i3);
        load (filename);
        transmat = full (transmat);
        sums = sum(transmat,1);
        sums = find (sums > 0);
        leaderscount (,its+1) = size (sums,2);
        end
    end
end