function [ J, impulse ] = estimateResponse( N,M, x_known, y_known )

B=zeros(N,M);

%Constructs the B Matrix
for i=1:N
    if(i <= M)
        B(i, :) = [zeros(1,M-i) x_known(1:i)'];
    else
        B(i, :) = x_known(i-M+1:i);
    end
end

%Least Squares to estimate the impulse
impulse = (B'*B)\B'*y_known;

% Cost function calculation
J = norm(y_known - B*impulse)^2;


end

