clear
%TwoSampleChiSquare = true;
%SeededFirstRow = true;
range = 15;
dims = 4;
%totreps = 1;
statreps = 5;
thresholds = [0.1,0.3,0.6,0.9];
savefolder = 'C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\Results'; 
initialize = true;
%IsTickwise = true; 
%{
If true, the data should be formatted [move],[tick],
[agent ID],[move],[tick],[agent] etc, if false should be formatted [move],
[move],[move] etc.} 


%totreps corresponds to the number of different ABM datasets imported,
%statreps corresponds to the number of times each dataset is computed -
%this is purely for convenience as each result is created and saved before
%the next is computed, and results do not differ if each is computed
%independently or sequentially

%columnheaders = compressedheaders (range,dims);
%use this line of code to find the behavioral vectors which correspond to
%each row and column of the transition matrix RData. The result should be
%the same size as RData, and each column is the count of that vector within
%the given range. 
%}
Fname = 'C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\MaxData'; 
FtoImport = alltxt(Fname);

for j = 3:size (FtoImport,2)
for j2 = 1:3
[testmchinook,testmsockeye,testmall] = mergeimport (FtoImport(2,j));
switch j2
    case 1
        testm = testmchinook;
    case 2
        testm = testmsockeye;
    case 3
        testm = testmall;
end
ctable = comptable (range, dims);
ressize = ctable (end,end);
rmat = zeros (ressize,1) - 1;
%Means nothing gets rearranged. Used so the same mex can be reused after
%the stats component, where rows need to be merged based on leader-follower
%data
HistFutTable = makeHistFutTablewithRearrange_mex (testm,range,dims,rmat);

%makeHistFutTablewithRearrange, converted to C++ for
%improved performance

% emptyrows = all (~HistFutTable,2);
% emptyrows = find (emptyrows == 1);

for threshold = thresholds
    its2 = 1;
    clear transmat
for its2 = 1:statreps
    rmat = Stats_func (HistFutTable,threshold);
    %{
    %%%%%%%
% %The statistical threshold for the chi squared test
% 
% chi2L = 1:size(HistFutTable);
% sums = sum(HistFutTable,2);
% firstleader = find (sums == max(sums));
% firstleader = firstleader (1);
% %The first leader is seeded in order to ensure that it is not an extremely
% %sparse row of the matrix - which creates problems with the chi square test
% %of independence
% 
% % %Statistical Correlation
% for its3 = 1:size(emptyrows,1)
%     x = emptyrows (its3);
%     chi2L = chi2L(chi2L ~= x);
% end
% rmat = zeros(1,size(HistFutTable,1))';
% %leaders = chi2L (randmat);
% leaders = firstleader;
% rmat (firstleader) = -1;
% followers = 0;
% leadercomp = zeros (1,size(HistFutTable,1));
% chi2L = chi2L (chi2L ~= firstleader);
% chis = zeros (2,size(HistFutTable,2));
% % p2chi = zeros (1,size(RData,2));
% while size(chi2L) > 0
%     randmat = ceil(size(chi2L,2) * rand(1));
%     randmat = chi2L(randmat);
%     for its = leaders
%         chis = [HistFutTable(its,:);HistFutTable(randmat,:)];
%         leadercomp (its) = chisquared(chis);
%     end
%     [M,I] = max (leadercomp);
%     if M > threshold
%         rmat (randmat) = I;
%         chi2L = chi2L (chi2L ~= randmat);
%     else
%         rmat(randmat) = -1;
%         leaders = horzcat (leaders,randmat);   %#ok
%         chi2L = chi2L (chi2L ~= randmat);
%     end
% end

%%%%%%%%%
%}
clear transmat
floc = 0;

transmat = makeHistFutTablewithRearrange_mex (testm,range,dims,rmat);

switch j2
    case 1
        fnameAA = 'chinook';
    case 2
        fnameAA = 'sockeye';
    case 3
        fnameAA = 'all';
end
fnameA = sprintf ('P%1.1fR%i',threshold,its2);
%fname = char(files (1,fileloc(2)));
pfname = FtoImport (1,j);
fnameB = strcat (pfname);
%fname = sprintf ('%s',fnameprimitive);
fname = char(strcat (fnameAA,fnameA,fnameB));
fpath = char(strcat (savefolder,'\\',fname,'.csv'));
exportdata (transmat,fpath);
%exportdata is used to export to xls format, such as if the data will be
%used in Gephi. Save is used to save data in the matlab format for easy
%retrieval such as for the MSE_Compare script

% transmat = sparse(transmat);
save (strcat (savefolder,'\\matfiles\\',fname,'.mat'),'transmat');
end
end


end
end
%tickwisesave (transmat,'SwarmingAnalysis')
%MSE_Compare