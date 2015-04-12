clear; close all;

a = [1 1/2 1/4 1/8 1/16 1/32];
aflip = fliplr(a);
a = [a, zeros(1,100)];

Kx = toeplitz(a);

N = length(a);
Kxcirc = toeplitz(a);

% Alters the top right corner of Kx
Kxcirc(1, N-length(aflip)+2:N) = aflip(1:end-1);
Kxcirc(2, N-length(aflip)+3:N) = aflip(1:end-2);
Kxcirc(3, N-length(aflip)+4:N) = aflip(1:end-3);
Kxcirc(4, N-length(aflip)+5:N) = aflip(1:end-4);
Kxcirc(5, N-length(aflip)+6:N) = aflip(1:end-5);

%Alters the bottom left corner of Kx
Kxcirc(N-4, 1:length(aflip)-5) = a(6:6);
Kxcirc(N-3, 1:length(aflip)-4) = a(5:6);
Kxcirc(N-2, 1:length(aflip)-3) = a(4:6);
Kxcirc(N-1, 1:length(aflip)-2) = a(3:6);
Kxcirc(N, 1:length(aflip)-1) = a(2:6);

[V,D] = eig(Kx);
[Vt, Dt] = eig(Kxcirc);

figure; hold;
stem(diag(D),'b');
stem(diag(Dt),'r');
title('Eigenvalues of Kx and of circular Kx');
legend('Eigenvalues of Kx', 'Eigenvalues of circular Kx','Location', 'NorthWest');

% We can see that the eigenvalues of Kx and of Kx altered to be circular
% are very very similar. 