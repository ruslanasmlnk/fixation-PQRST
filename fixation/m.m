clear; clc
matName = strcat('healthy.mat');
load(matName);
load P.mat P; load QRS.mat QRS; load T.mat T;
k = 0; 
arrcoef = zeros(1, length(val)-length(P)+1); 
for i = 1:(length(val)-length(P)+1)
    PQRSTvokne = val(i:length(P)+k); 
    coefcorr = corrcoef(PQRSTvokne, P);
    arrcoef(i) = coefcorr(1, 2);
    k = k + 1;
end
posP = zeros(1,length(arrcoef)); posp = 1;
for i=1:length(arrcoef)-1
    if arrcoef(i) > 0.98 && arrcoef(i+1) < 0.98 
        % 0.98 - ПОДГОН под 104 пациента!
        % надо через обновление эталонного сделать
        formatSpec = "Положение P: %f сек\n";
        fprintf(formatSpec, i/1e3)
        posP(posp) = i;
        posp = posp + 1;
    end
end
posP(~posP)=[]; 
plot((1:length(val))/1e3,val); grid on

k = 0; 
arrcoef = zeros(1, length(val)-length(QRS)+1); 
for i = 1:(length(val)-length(QRS)+1)
    PQRSTvokne = val(i:length(QRS)+k); 
    coefcorr = corrcoef(PQRSTvokne, QRS);
    arrcoef(i) = coefcorr(1, 2);
    k = k + 1;
end
posQRS = zeros(1,length(arrcoef)); posqrs = 1;
for i=1:length(arrcoef)-1
    if arrcoef(i) > 0.98 && arrcoef(i+1) < 0.98
        formatSpec = "Положение QRS: %f сек\n";
        fprintf(formatSpec, i/1e3)
        posQRS(posqrs) = i;
        posqrs = posqrs + 1;
    end
end
posQRS(~posQRS)=[]; 

k = 0; 
arrcoef = zeros(1, length(val)-length(T)+1); 
for i = 1:(length(val)-length(T)+1)
    PQRSTvokne = val(i:length(T)+k); 
    coefcorr = corrcoef(PQRSTvokne, T);
    arrcoef(i) = coefcorr(1, 2);
    k = k + 1;
end
posT = zeros(1,length(arrcoef)); post = 1;
for i=1:length(arrcoef)-1
    if arrcoef(i) > 0.98 && arrcoef(i+1) < 0.98
        formatSpec = "Положение T: %f сек\n";
        fprintf(formatSpec, i/1e3)
        posT(post) = i;
        post = post + 1;
    end
end
posT(~posT)=[]; 