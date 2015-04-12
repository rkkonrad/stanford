%% Part B
clear; close all;
load('hw7_data.mat');

A = [ 1:1500; ones(1,1500)];
A = A';
param = (A'*A)\A'*X; %Do least squares
Xtilde = X - A*param;

disp(['The optimal slope, a, of the line is: ' num2str(param(1))]);
disp(['The optimal y-intercept of the line is: ' num2str(param(2))]);

figure; hold; 
plot(X);
plot(Xtilde, 'r');
title('A plot of the data with the trend removed');
legend('X', 'X with trend removed');

%% Part C

Kx1 = computeCovariance(Xtilde(1:500,1));
Kx2 = computeCovariance(Xtilde(501:1000));
Kx3 = computeCovariance(Xtilde(1001:1500));

figure;hold; 
plot(Kx1);
plot(Kx2 ,'--');
plot(Kx3), '-.-';
legend('X(1:500)', 'X(501:1000)', 'X(1001, 1500)');

% Theses plots exactly hold with our stationarity assumptions. We see some
% interesting properties that hold with our knowledge of the system. When m
% is low (not much time between months) we expect the sea levels to be
% roughly similar and therefore highly correlated, which is what we see on
% the graphs. Then we see this wavy pattern, which corresponds to the sea
% levels changing with the seasons. 

% These graphs support out notion of stationarity because we can see that
% for the 3 different time segments, they each give a very similar
% covariance function. The covariance functions do not depend on a function
% of absolute time, only on the difference between time values. 
