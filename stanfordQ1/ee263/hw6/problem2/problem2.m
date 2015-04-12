clear; close all;
ls_classify_data;

% Least squares to find w and v
Xtilda= [X' ones(N,1)];
z  = (Xtilda'*Xtilda)\Xtilda'*y;

w = z(1:n,1)
v = z(4,1)

% Prediction Results
yhat = sign(w'*Xtest+v)';
correct = sum(yhat == ytest);

false_pos = sum((yhat == 1) & (ytest == -1));
false_neg = sum((yhat == -1) & (ytest == 1));

disp(['The number of correct predictions is ' num2str(correct)]);
disp(['The number of false positives is ' num2str(false_pos)]);
disp(['The number of false negatives is ' num2str(false_neg)]);