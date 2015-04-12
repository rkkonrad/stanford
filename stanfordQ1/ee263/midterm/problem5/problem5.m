clear;
channel;

%where impulse4' = [h4 h3 h2 h1];
[J4, impulse4]  = estimateResponse(N,4,x_known,y_known)

%% Part B)
for i=3:10
    J(i) = estimateResponse(N,i,x_known,y_known);
end

figure;
plot(3:10, J(3:10));
xlabel('Length of impulse response');
ylabel('Cost Function');

J(3:10)

%% Part C)

%where impulse7' = [h7 h6 h5 h4 h3 h2 h1];
[J7, impulse7] = estimateResponse(N,7,x_known,y_known);


%Create H matrix
M = 7;
H = zeros(N+10,N);
for i = 1:N+10
    if (i<=M)
        H(i, 1:i) = impulse7(flip(1:i))';
        %H(i, 1:i) = flip(1:i);
    elseif(i>N)
        H(i,i-M+1:N) = impulse7(flip(i-N+1:7))';
        %H(i,i-M+1:N) = flip(i-N+1:7);
    else
        %H(i, i-M+1:i-M+7) = flip(1:7);
        H(i, i-M+1:i-M+7) = impulse7(flip(1:7))';
    end
end

x_est = (H'*H)\H'*y_unknown;
figure;
stem(x_est(1:40));
title('Stem plot of x-estimated');
['The residual for the estimated x for N values is: ' num2str( norm( y_unknown(1:N) - H(1:N,1:N)*x_est(1:N))^2)]


