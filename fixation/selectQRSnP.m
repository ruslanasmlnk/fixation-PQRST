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
% k = 0;
% arrcoef = zeros(1, length(PQRST)-length(P)+1);
% for i = 1:(length(PQRST)-length(P)+1)
%     PQRSTokno = PQRST(i:length(P)+k);
%     coefcorr = corrcoef(PQRSTokno,P);
%     arrcoef(i) = coefcorr(1,2);
%     k = k + 1;
% end
% [xmax,imax]=max(arrcoef);
