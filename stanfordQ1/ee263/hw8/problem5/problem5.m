clear; close all;
%% Part A
A = [-0.1 0.3 0; 0 -0.2 0.1; 0.1 0 -0.1];
[V,D] = eig(A);

%% Part C

e0 = expm(0);
e10 = expm(10*A);

T = 0.1:0.1:9.9;
for i = 1:length(T)
    eT = expm(T(i)*A);
    
    %Create the G
    ones = [1 1 1];
    G = [ [1 1 1]; ones*eT; ones*e10];
    
    %Compute eigen vectors and values
    invG = inv(G);
    [V,D] = eig( invG'*invG );
    
    %Finds the maximum eigenvalue and its position
    for j = 1:3
        eigenval(j) = D(j,j);
    end
    [maxeval, index] = max(eigenval);
    maxevect = V(:,index)/10;
    
    %Calculates the norm
    norms(i) = norm(invG*maxevect);
end

[minnorm, Tindex] = min(norms);

disp(['The minimum maximum norm (optimal accuracy) is : ' num2str(minnorm)]);
disp(['The T generating this norm is : ' num2str(T(Tindex))]);
