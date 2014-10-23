A1 = [1 0; 2 3; 1 1];
A2 = [1 1; 1 4; 0 1];
A3 = [0 1; 3 2; 1 0];

y = [1 ; 1 ; 1];

%Avg then estimate
Aavg = 1/3 * (A1 + A2 + A3);
Xae = inv(Aavg'*Aavg)*Aavg' * y

%Estimate then Avg
x1 = inv(A1'*A1)*A1'*y;
x2 = inv(A2'*A2)*A2'*y;
x3 = inv(A3'*A3)*A3'*y;

Xea = 1/3*(x1+x2+x3)