clear
load ('stateA.mat');
clearvars -except FtoImport thresholds statreps savefolder
sourcefolder = strcat (savefolder,'\\matfiles\\');
MSEsavefolder = strcat (savefolder,'\\MSE\\');
columnreorder = [1,9,8,5:-1:2,7,6];
PFtoImport = FtoImport (1,:)';
FtoImport = cell (9,1);
for i = 1:9
    %Get the order right for the final matrix
    FtoImport(columnreorder(i)) = PFtoImport (i);
end
%create list of all file comparison paths
caseprimitives = cell (1,12);
reps = 0;
for i = thresholds
    for i2 = 1:3
        reps = reps + 1;
        switch i2
            case 1
                    partA = 'chinook';
            case 2
                    partA = 'sockeye';
            case 3
                    partA = 'all';
        end
        partB = sprintf ('P%1.1f',i);
        caseprimitives (reps) = cellstr(strcat (partA,partB));
    end
end


for i = 12
    curcase = caseprimitives (i);
    MSE = zeros (9,9);
    for i5 = 5
        compA = FtoImport (i5);
        for i6 = 9
            compB = FtoImport (i6);
            res = zeros (5,5);
                for i2 = 1
                    Amat = strcat (sourcefolder,caseprimitives(i),sprintf ('R%i',i2),compA,'.mat');
                    load (Amat{1});
                    Amat = transmat;
                    for i3 = 5
                        Bmat = strcat (sourcefolder,caseprimitives(i),sprintf ('R%i',i2),compB,'.mat');
                        load (Bmat{1});
                        Bmat = transmat;
                        res (i2,i3) = Convergefunc (Amat,Bmat);
                    end
                end
                MSE (i5,i6) = median (res(:));
        end
    end
    exportdata (MSE,strcat (MSEsavefolder,curcase{1},'Convergence','.csv'));
    save (strcat (MSEsavefolder,curcase{1},'Convergence','.mat'),'res');
end
