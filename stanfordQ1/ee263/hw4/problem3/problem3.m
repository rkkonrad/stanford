vts_data

%Row 1
Yx1 = Y(1,1:99);
Yz1 = Y(1,2:100);
a1 = inv(Yx1*Yx1')*Yx1*Yz1';
a1 = [a1 0 0];

%Row 2
Yx2 = Y(1:2,1:99);
Yz2 = Y(2,2:100);
a2 = inv(Yx2*Yx2')*Yx2*Yz2';
a2 = [a2' 0];

%Row 3
Yx3 = Y(1:3,1:99);
Yz3 = Y(3,2:100);
a3 = inv(Yx3*Yx3')*Yx3*Yz3';
a3 = a3';

A = [a1;a2;a3];

mse = 0;
for i=2:T
    mse = mse + norm(A*Y(:,i-1) - Y(:,i))^2;
end

mse = 1/(T-1) * mse;
