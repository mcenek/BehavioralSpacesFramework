for i = 0:14
    for i2 = 1:4
        i
        i2
        filecomp = sprintf ('V%drep%d',i,i2);
        filesave = sprintf ('Res%drep%d',i,i2);
        for its = 0:14
            for its2 = 1:4
                fileapprox = sprintf ('V%drep%d',its,its2);
                eval (['MSE = MSEfunc(',filecomp,',',fileapprox,');']);
                eval ([filesave,'(its+1,its2)=MSE;']);
            end
        end
    end
end
