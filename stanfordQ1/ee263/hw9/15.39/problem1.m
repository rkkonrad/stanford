clear; close all;
% This method is the same as the one in the analytical method proposed on
% the previous page. 
A = [1,0.4,-0.2,0.3;0.4,1,0,-0.1;-0.2,0,1,0.8;0.3,-0.1,0.8,1];
B = zeros(4,4); B(2,3) = 1; B(3,2) = 1;

%Finding the inverse of the square root of A
Ainvhalf = inv(sqrtm(A));

eigs = eig(Ainvhalf * B * Ainvhalf);
pos = find(eigs > 1e-5); % Removes the "zeros" from the outputed eigenvalues
neg = find(eigs < -1e-5);
C23min = min(-1./eigs(pos));
C23max = max(-1./eigs(neg));

disp(['The value of C23 is bounded by ' num2str(C23min) ' and ' ...
       num2str(C23max) ' for the given matrix']);