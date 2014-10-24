%% Calculating rows of A
vts_data
% Row 1
Yx1 = Y(1,1:99);
Yz1 = Y(1,2:100);
a1 = inv(Yx1*Yx1')*Yx1*Yz1';
a1 = [a1 0 0];

% Row 2
Yx2 = Y(1:2,1:99);
Yz2 = Y(2,2:100);
a2 = inv(Yx2*Yx2')*Yx2*Yz2';
a2 = [a2' 0];

% Row 3
Yx3 = Y(1:3,1:99);
Yz3 = Y(3,2:100);
a3 = inv(Yx3*Yx3')*Yx3*Yz3';
a3 = a3';

A = [a1;a2;a3]

%% Results

%Calculate Mean Squared Predictor Error
mse = 0;
for i=2:T
    mse = mse + norm(A*Y(:,i-1) - Y(:,i))^2;
end

mse = 1/(T-1) * mse;
['The mean squared predictor error is ' num2str(mse) '.']

%Calculate Mean Square Value
msv = 0;
for i = 1:T
   msv = msv + norm(Y(:,i))^2; 
end

msv = 1/T*msv;
['The mean squared value is ' num2str(msv) '.']

['The ratio of mse to msv is ' num2str(mse/msv)]

%Predict y(T+1)

yhat = A*Y(:,T);

'The predicted value of y(T+1) is'
yhat