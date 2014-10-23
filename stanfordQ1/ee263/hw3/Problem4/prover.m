A = [1 2 1; 1 -1 -2; -2 1 3; 1 -1 -2; 1 1 0];
[Q, R] = qr(A);
orthA = orth(A);

rank([Q(:,1:2) A]); % Shows that Q1 is the first two columns of Q
rank([Q(:,3:5) A]); % Shows that Q2 is the last three columns of Q

B = Q(:,3:5)';

%% Shows that when y is consistent By = 0
x = [1; 1; 1];
y = A*x;

rank([y A])     % shows that y is in the range of A
B*y             % shows that By=0 when y is consistent (in the range of A)

%% Show that By =/= 0 when y is not consistent
x = [1;1;1];
y = A*x;
y(1,1) = 0;     % introduces a sensor "failure"

rank([y A])     %shows that y is not in the range of A

B*y             %shows that By =/= 0 when y is not consistent (not in the range of A)