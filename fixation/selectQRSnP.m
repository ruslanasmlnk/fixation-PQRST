clear
matName = strcat('healthy.mat');
load(matName);
PQRST = val(500:1150);
P = val(601:718);
QRS = val(756:967);
T = val(984:1133);
save('PQRST.mat', 'PQRST', '-mat')
save('P.mat', 'P', '-mat')
save('QRS.mat', 'QRS', '-mat')
save('T.mat', 'T', '-mat')
plot((1:length(PQRST))*1e-3,PQRST)