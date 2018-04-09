clear
load PQRST.mat PQRST % ���� ����� ��������, �� �������� ����� ������
load P.mat P; load QRS.mat QRS; load T.mat T; % ��������
k = 0;

arrcoef = zeros(1, length(PQRST)-length(P)+1);
for i = 1:(length(PQRST)-length(P)+1)
    PQRSTvokne = PQRST(i:length(P)+k);
    coefcorr = corrcoef(PQRSTvokne,P);
    arrcoef(i) = coefcorr(1,2);
    k = k + 1;
end
[xmaxP,imaxP] = max(arrcoef);
k=0;
arrcoef = zeros(1, length(PQRST)-length(QRS)+1);
for i = 1:(length(PQRST)-length(QRS)+1)
    PQRSTvokne = PQRST(i:length(QRS)+k);
    coefcorr = corrcoef(PQRSTvokne,QRS);
    arrcoef(i) = coefcorr(1,2);
    k = k + 1;
end
[xmaxQRS,imaxQRS] = max(arrcoef);
k=0;
arrcoef = zeros(1, length(PQRST)-length(T)+1);
for i = 1:(length(PQRST)-length(T)+1)
    PQRSTokno = PQRST(i:length(T)+k);
    coefcorr = corrcoef(PQRSTokno,T);
    arrcoef(i) = coefcorr(1,2);
    k = k + 1;
end
[xmaxY,imaxT] = max(arrcoef);
% ������� ��������� ������� ������� P, QRS � T
formatSpec = "��������� P: %f ���,\n��������� QRS: %f ���,\n��������� T: %f ���\n";
fprintf(formatSpec, imaxP/1e3, imaxQRS/1e3, imaxT/1e3)