u = rand(100, 1);   %uniform random variable between 0 and 1
lambda = 1/2;       %lamba derived from mean
x = -log(1-u)/lambda;   %exponential rv
figure; subplot(5,1,1);
plot(x);
title('Exponential rv');
subplot(5,1,2);
plot(sort(x,'descend'));
title('n = 100');

u = rand(200, 1);   %uniform random variable between 0 and 1
lambda = 1/2;       %lamba derived from mean
x = -log(1-u)/lambda;   %exponential rv
subplot(5,1,3);
plot(sort(x,'descend'))
title('n = 200');

u = rand(500, 1);   %uniform random variable between 0 and 1
lambda = 1/2;       %lamba derived from mean
x = -log(1-u)/lambda;   %exponential rv
subplot(5,1,4);
plot(sort(x,'descend'));
title('n = 500');

u = rand(1000, 1);   %uniform random variable between 0 and 1
lambda = 1/2;       %lamba derived from mean
x = -log(1-u)/lambda;   %exponential rv
subplot(5,1,5);
plot(sort(x,'descend'))
title('n = 1000');