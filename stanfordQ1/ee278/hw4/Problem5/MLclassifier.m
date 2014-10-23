function [ xhat ] = MLclassifier( input, mean1, cov1, mean2, cov2 )
%MLclassifier takes in the mean and covariance of two gaussian
%distributions and creates a Maximum Likelihod detector.
    %To have a better understand of my classifier please look at my
    %attached derivation of it in my notes.
dim = length(mean1);
y1 = input - mean1;
y2 = input - mean2;

z = -1*(log(det(cov1)/det(cov2)) + y1'/cov1*y1 - y2'/cov2*y2);

if( z >= 0)
    xhat = 0;
else
    xhat = 2;
end

end

