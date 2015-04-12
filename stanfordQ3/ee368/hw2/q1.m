%% Question 1. Part A
clear all;
close all;

load('hw2_data/hw2_XYZ.mat');
load('hw2_data/hw2_face.mat');
load('hw2_data/hw2_light.mat');
load('hw2_data/hw2_display.mat');

[x y z] = size(face1Spectrum);

A = XYZSpectra' * display1Spectra;
B = [ XYZSpectra(:,1)' .* light1Spectrum;
      XYZSpectra(:,2)' .* light1Spectrum;
      XYZSpectra(:,3)' .* light1Spectrum];
T = inv(A) * B;


%% Question 1. Part B
faceRGB = zeros(x,y,3);
for i = 1:x
    for j = 1:y
        p = face1Spectrum(i,j,:);
        w = T * p(:);
        faceRGB(i,j,:) = w.^(1/2.2);
    end
end

imshow(faceRGB);
title('RGB image with gamma pre-distortion');

%% Question 1. Part C
p = face1Spectrum(47,149,:);
prod = light1Spectrum' .* p(:);
figure;
plot(prod);
title('Scene x Illuminant');
xlabel('Wavelength (nm)');
ylabel('Energy');

w = T * p(:);
disppx = w(1) * display1Spectra(:,1) + w(2) * display1Spectra(:,2) + w(3) * display1Spectra(:,3);
figure; plot(disppx);
title('Display Emission');
xlabel('Wavelength (nm)');
ylabel('Energy');

% Because both of these spectra map to the same perceived color, these two
% spectra are metamers. 