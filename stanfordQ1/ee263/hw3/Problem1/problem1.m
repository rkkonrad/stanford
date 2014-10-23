Starget = 3.8;

Gfull = [1 0.2 0.1; 0.1 2 0.1; 0.3 0.1 3]
Gdiag = diag(diag(Gfull));
Gdiag_miss = Gfull - Gdiag

sigma = [0.01; 0.01; 0.01];

A = Gdiag - Gdiag_miss .* Starget;
B = Starget .* sigma;

p = inv(A)*B