clear; close all;
load('/Users/rkkonrad/stanford/stanfordQ1/ee263/final/problem1/subsp.mat');

disp(['The rank of A1 is : ' num2str(rank(A1))]);
disp(['The rank of A2 is : ' num2str(rank(A2))]);

[QF1,RF1] = qr(A1); %full qr factorization
Q1 = QF1(:,1:rank(A1)); % orthonormal basis for range(A1)

[QF2,RF2] = qr(A2); %full qr factorization
Q2 = QF2(:,1:rank(A2)); %orthonormal basis for range(A2)

disp('The dot products are:');
dot = Q1'*Q2

% Because the dot product between the column matrix Q1 and every column of
% Q2 is not 0, this means that Q1 can be expressed by some linear
% combination of the columns of Q2. Therefore the ranges of A1 and A2
% overlap.

% Therefore we can we that even in 1 time step, with the right choices for
% x1(0) and x2(0) the could meet each other at the same location.