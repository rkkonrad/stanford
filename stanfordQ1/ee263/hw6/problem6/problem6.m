clear; close all;

A=[-0.1005    1.0939    2.0428    4.4599
   -1.0880   -0.1444    5.9859   -3.0481
   -2.0510   -5.9709   -0.1387    1.9229
   -4.4575    3.0753   -1.8847   -0.1164];

[V, D] = eig(A);

%% A
% We can see that the eigenvectors corresponding to lambda 1 and lambda 2
% are just complex conjugates of each other. We also know that the
% invariant plane is defined as the span(real(v), imag(v)). Therefore, the
% two orthonormal basis vectors are simply the real part and the imaginary
% part of the first two eigenvectors.
q1  = real(V(:,1));
q1 = q1/norm(q1);
q2  = imag(V(:,2));
q2 = q2/norm(q2);

%% B
B = null([q1 q2]');
q3 = B(:,1);
q4 = B(:,2);

Q = [q1 q2 q3 q4];
Q'*Q

%% C
x0 = q1;
x = zeros(4,40);
x(:,1) = x0;

alpha = dot(q1, V(:,1));
beta = dot(q1, V(:,2));

l1 = D(1,1);
l2 = D(2,2);
T = 0.1:0.1:40;
for i = 1:length(T)
    %We take a linear combination because q1 is just a linear combination
    %of the first and second eigenvectors.
    x(:,i) = real(alpha*exp(l1*T(i))*V(:,1) + beta*exp(l2*T(i))*V(:,2));
end

subplot(411); plot(x(1,:)');
subplot(412); plot(x(2,:)');
subplot(413); plot(x(3,:)');
subplot(414); plot(x(4,:)');

%% E
sum(abs(Q'*x), 2)