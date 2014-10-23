function [ meanX, cov, eigVec, eigVal] = compute( digit )
%This function computes all of the calculations needed for problem 5
    % Expects a 784x4999 matrix thats holds all of the image data

meanX = mean(digit, 2); %takes mean of the corresponding elements of each Xi
dim = size(digit,1);
sum = zeros(dim);
for i = 1:size(digit,2)
    sum = sum + 1/size(digit,2)*(digit(:,i) - meanX)*(digit(:,i) - meanX)';
end
cov = sum;

[eigVec, eigVal] = eig(cov);

end

