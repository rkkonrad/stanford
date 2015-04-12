%% Part B
clear; close all;
ranking;

T = diag(2+t);
r = (T-M)\(1+w-0.5*t);

disp('The rankings of the  teams are as follows: ');
r

%% Part C
% Using lagrange multipliers as a way to implement a constraint
Ahat = [ 2*A'*A ones(12,1); ones(1,12) 0];
yhat = [2*A'*s; 0];

rlambda = Ahat\yhat;
rtilde = rlambda(1:12,1);

disp('The rankings of the teams are as follows: ');
rtilde

%% Part F
for i = 1:12
   perc(i,1) = w(i)/t(i); 
end

[sortP, indxP] = sort(perc,'descend');
[sortR, indxR] = sort(r, 'descend');
[sortRT, indxRT] = sort(rtilde, 'descend');

indxPself = [8, 11, 4, 7, 2, 5, 1, 9, 12, 6, 3, 10]';

disp('RANKINGS');

disp('Rankings #1: Percentage');
for i = 1:12
   disp(teams{indxPself(i)});
end

disp(' ');
disp('Rankings #2: R');
for i = 1:12
   disp(teams{indxR(i)});
end

disp(' ');
disp('Rankings #3: Rtilde');
for i = 1:12
   disp(teams{indxRT(i)});
end


