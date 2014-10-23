%% Read image data in from files
clear;
train0 = readData('hw4-data/train0/');
train2 = readData('hw4-data/train2/');

%% A) Compute Covariance Matrix, Eigenvalues, and Eigenvectors of Training Set
digitTrain = [train0 train2];
[meanT, covT, eigVecT, eigValT] = compute(digitTrain);
eigVecT = eigVecT(:,1:20);      %picks out 20 most important eigenVectors

projT0 = eigVecT'*train0;       %projects training data onto new basis
projT2 = eigVecT'*train2;       %projects training data onto new basis

%% B) Compute Covariance Matrix, Eigenvalues, and Eigenvectors of test Set
[meanP0, covP0, eigVecP0, eigValP0] = compute(projT0);
[meanP2, covP2, eigVecP2, eigValP2] = compute(projT2);

%% C) Running classifier on test0 and test1
test0 = readData('hw4-data/test0/');
test2 = readData('hw4-data/test2/');

% Project test data onto U basis
projTest0 = eigVecT'*test0;
projTest2 = eigVecT'*test2;

%Classifies each test data to be either 0 or 1
dec0 = zeros(1,size(projTest0,2));
dec2 = zeros(1,size(projTest2,2));
for i = 1:size(projTest0,2)
    dec0(i) = MLclassifier( projTest0(:,i), meanP0, covP0, meanP2, covP2);
    dec2(i) = MLclassifier( projTest2(:,i), meanP0, covP0, meanP2, covP2);
end

error0 = sum(dec0 == 2);
error2 = sum(dec2 == 0);

%Error reporting
['Misdetection rate of the 0 digit is ' num2str(100*error0/size(test0,2)) '%']
['Misdetection rate of the 2 digit is ' num2str(100*error2/size(test2,2)) '%']


