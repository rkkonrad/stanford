clear; close all;
A = [0.5 1 0.1; -0.1 0.5 -0.1; 0.2 0 0.9];
B = [1;0;0];
C = [0 1 0];

K = linspace(-2, 2,100000);

mineig = 0;
for i = 1:length(K)
   Ahat = A+K(i)*B*C;
   E = eig(Ahat);
   Eig(i) = max((abs(E)));
end

[mineig, minindex] = min(Eig);
minK = K(minindex);

disp(['The optimal K such that the feedback system is maximilly damped is ' num2str(minK)]);
disp(['The value for the minimized maximum e-value is: ' num2str(mineig)]);
%%
plot(K, Eig);
title('Plot of K verses the maximum values of the e-values')
xlabel('K');
ylabel('max e-value');
figure;
plot(K(90000:100000), Eig((90000:100000)));
title('Plot of K verses the maximum values of the e-values')
xlabel('K');
ylabel('max e-value');