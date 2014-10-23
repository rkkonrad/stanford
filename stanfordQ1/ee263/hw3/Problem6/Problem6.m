clear;
tomo_data;

l = zeros(N, n_pixels^2);
for j = 1:N
    lj = line_pixel_length(lines_d(j), lines_theta(j), n_pixels);
    l(j,:) = reshape(lj, 1, n_pixels^2);
end

psuedoInv = inv(l'*l)*l';
X = psuedoInv * y;

imagesc(reshape(X,30,30));
colormap gray;
axis image;
