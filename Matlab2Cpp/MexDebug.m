clear
TwoSampleChiSquare = true;
SeededFirstRow = false;
range = 15;
dims = 4;
totreps = 1;
statreps = 1;
thresholds = [0.1,0.3,0.6,0.9];
IsTickwise = true; %If true, the data should be formatted [move],[tick],
%[agent ID],[move],[tick],[agent] etc, if false should be formatted [move],
%[move],[move] etc. 

%totreps corresponds to the number of different ABM datasets imported,
%statreps corresponds to the number of times each dataset is computed -
%this is purely for convenience as each result is created and saved before
%the next is computed, and results do not differ if each is computed
%independently or sequentially

% ctable = comptable (range, dims);
% ressize = ctable (end,end);

%columnheaders = compressedheaders (range,dims);
%use this line of code to find the behavioral vectors which correspond to
%each row and column of the transition matrix RData. The result should be
%the same size as RData, and each column is the count of that vector within
%the given range. 
Fname = 'C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\9DNA-Results-0.txt'; 
testm = importwithtime(Fname);

% HistFutTable = zeros (ressize);

%size(testm,1) = nzmax(RData);
%testm = c2vect2 (testm);
ctable = comptable (range, dims);
ressize = ctable (end,end);
rmat = zeros (ressize,1) - 1;
HistFutTable = makeHistFutTable_mex (testm,range,dims);
HistFutTable2 = makeHistFutTablewithRearrange (testm,range,dims,rmat);