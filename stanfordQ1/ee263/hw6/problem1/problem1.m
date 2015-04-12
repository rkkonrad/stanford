clear;
close all;
h = 0.1;
m = 1;
alpha = 0.1;
K = 100;
M = 4;

pdes = [2,2; -2,3; 4,-3; -4,-2];

% Create the "fat" A matrix
A = zeros(M,K);
A(1,:) = createRow(10,K);
A(2,:) = createRow(30,K);
A(3,:) = createRow(40,K);
A(4,:) = createRow(80,K);
A = h^2/m*A;

f = A'/(A*A')*pdes;
J = 0;
for i = 1:K
   J = J + norm(f(i,:))^2;
end

['The optimal value of J is ' num2str(J)]

%Create whole matrix A
A = zeros(K,K);
for i = 3:K
    A(i,:) = createRow(i,K);
end
p = h^2*A*f;
figure;hold;
plot(p(:,1), p(:,2));
scatter(2,2, 'o');
scatter(-2,3, 'o');
scatter(4,-3, 'o');
scatter(-4,-2, 'o');
xlabel('x');
ylabel('y');

figure;hold;
subplot(211);plot(f(:,1)');
xlabel('k');
ylabel('force');
subplot(212);plot(f(:,2)');
xlabel('k');
ylabel('force');
