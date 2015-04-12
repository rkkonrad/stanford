%% Part B)
clear;
tempdata;

%Generate the B matrix
B = zeros(168,25);
B(:,1) = 1:168;
for i = 1:7
    B ( (i-1)*24+1:i*24, 2:25) = eye(24);
end

%Least squares to find xhat
xhat = (B'*B)\B'*y;
yhat = B*xhat;
['The value of the trend parameter a is ' num2str(xhat(1,1))]

plot(1:N,y,1:N,yhat, '--')
title('Plot of y and yhat');
xlabel('Hour');
ylabel('Temperature');
legend('y', 'yhat');

%% Part C)
a = xhat(1,1);
p = xhat(2:end,1);
t = 169:192;
t = t';

%Predict future y's given this model
ypred = a*t + p;

plot(1:24,ytom,1:24,ypred, '--')
title('Plot of ytom and ypred');
xlabel('Hour');
ylabel('Temperature');
legend('ytom', 'ypred');

rms = sqrt(1/24*norm(ytom-ypred)^2);
['The RMS value of my prediction error for tomorrows temperature is ' num2str(rms)]

