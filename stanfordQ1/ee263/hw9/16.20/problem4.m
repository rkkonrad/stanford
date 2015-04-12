clear; close all;
grademodeldata;

[U,Sigma,V] = svd(G);
u1 = U(:,1);
v1 = V(:,1);
s1 = Sigma(1,1);

a = m*s1*v1/sum(1./u1);
d = m./(sum(1./u1)*u1);

Ghat = (1./d)*a';

sumJ=0;
sumRMS = 0;
for i=1:m
    for j=1:n
        sumJ = sumJ + (G(i,j) - Ghat(i,j))^2;
        sumRMS = sumRMS + G(i,j)^2;
    end
end
J1 = sqrt(sumJ/(m*n));
RMS = sqrt(sumRMS/(m*n));
fraction = J1/RMS;

disp(['The optimal cost J is ' num2str(J1)]);
disp(['The RMS value of G is ' num2str(RMS)]);
disp(['The ratio of the optimal cost to the RMS value is ' num2str(fraction)]);
disp('The difficulties are as follows:');
d