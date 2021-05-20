meds = zeros (15,1);
for i = 0:14
    orgfile = sprintf ('res%d',i);
    resfile = sprintf ('med%d',i);
    eval (['pres=median(',orgfile,',2);']);
    meds = horzcat (meds,pres);
end
meds = meds(:,2:end);