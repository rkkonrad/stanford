function [ Kx ] = computeCovariance( Xres)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

N = length(Xres);
Xbar = mean(Xres);
Kx = zeros(1,N);
for m = 0:length(Xres)-1
    for i = 0:N-m-1
        Kx(m+1) = Kx(m+1)+ (Xres(i+1)-Xbar)*(Xres(i+1+m)-Xbar);
    end
    Kx(m+1) = Kx(m+1)/(N-m);
end
end

