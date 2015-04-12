clear;
temp_control_data;

A = zeros(4,3);

for i= 1:4
    tHat = (T(i, 2:N) - T(i, 1:N-1))';
    P = p(:, 2:N);
    a = (P*P')\P*tHat;
    A(i,:) = a';
end

A

sum = 0;
for i = 2:N
    sum = sum + norm(T(:,i)-T(:,i-1) - A*p(:,i))^2;
end

RMS = sqrt(1/(N-1) * sum);

['The RMS for the estimated value of A is ' num2str(RMS)]