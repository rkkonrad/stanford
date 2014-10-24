clear;
qplace_data;

A1 = A(:,1:n);
A2 = A(:,n+1:N);

% Placing cells at optimal locations
xfree = -1*(A1'*A1)\A1'*A2*xfixed;
yfree = -1*(A1'*A1)\A1'*A2*yfixed;
view_layout(xfree, yfree, xfixed, yfixed, A)
title('Free cells at optimal location');

% Placing all cells at the origin
xfree = zeros(n,1);
yfree = zeros(n,1);
view_layout(xfree, yfree, xfixed, yfixed, A)
title('All free cells at origin');

% Random cell placement
xfree = rand([n,1]);
yfree = rand([n,1]);
view_layout(xfree, yfree, xfixed, yfixed, A)
title('Free cells at random locations #1');

% Random cell placement #2
xfree = rand([n,1]);
yfree = rand([n,1]);
view_layout(xfree, yfree, xfixed, yfixed, A)
title('Free cells at random locations #2');