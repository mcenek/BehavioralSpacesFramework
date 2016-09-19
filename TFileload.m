for i = 1:20
    fileload = sprintf ('TestchiV5R15rep%i.mat',i);
    load (fileload);
    transmat = full(transmat);
    run = sprintf ('New%i = transmat;',i);
    eval (run);
end
