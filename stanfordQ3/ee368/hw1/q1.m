clear all;
close all;

%% Question 1. Part A

% The overall contrast of the system, from capture to display, is
% reduced because the overall luminance is raised to the power of 2/3
% (which is less than 1). Therefore at the output of the system we have an
% effective luminance of 1000^(2/3) = 100. Therefore, a display with a
% minimum contrast of 100:1 is enough.

contrast_display = 1000^(2/3);
display(['The contrast of the display must be ' num2str(contrast_display) ':1']);

%% Question 1. Part B
hdr_memorial = hdrread('hw1_data/hw1_memorial.hdr');
hdr_atrium = hdrread('hw1_data/hw1_atrium.hdr');

gray_memorial = rgb2gray(hdr_memorial);
gray_atrium = rgb2gray(hdr_atrium);

figure; imshow(gray_memorial);
figure; imshow(gray_atrium);

% We can see that certain portions of the images are either completely
% saturated or completely black. It is hard to see any detail in these
% portions of the images. The parts of the images that are easy to see are
% the parts that are somewhere in the middle of the contrast range, that
% havn't been clipped by the contrast of the display.

%% Question 1. Part C
gamma_memorial = 0.4;
gamma_atrium = 0.5;

gray_memorial_gamma = gray_memorial .^ gamma_memorial;
gray_atrium_gamma = gray_atrium .^ gamma_atrium;

figure; imshow(gray_memorial_gamma);
figure; imshow(gray_atrium_gamma);

display(['The gamma for the memorial scene is : ' num2str(gamma_memorial)]);
display(['The gamma for the atrium scene is : ' num2str(gamma_atrium)]);

%% Question 1. Part D

% Apply same gamma correction to each channel
for i = 1:3
   hdr_memorial_gamma(:,:,i) = hdr_memorial(:,:,i) .^ gamma_memorial; 
   hdr_atrium_gamma(:,:,i) = hdr_atrium(:,:,i) .^ gamma_atrium;
end

figure;
subplot(1,2,1); imshow(hdr_memorial_gamma);
subplot(1,2,2); imshow(hdr_atrium_gamma);
title('Same gamma correction to each color channel');

% Apply different gamma to different channels
gamma_memorial = [0.2, 1.0, 1.0];
gamma_atrium = [1.0, 0.2, 1.0];

for i = 1:3
   hdr_memorial_gamma(:,:,i) = hdr_memorial(:,:,i) .^ gamma_memorial(i); 
   hdr_atrium_gamma(:,:,i) = hdr_atrium(:,:,i) .^ gamma_atrium(i);
end

figure;
subplot(1,2,1); imshow(hdr_memorial_gamma);
subplot(1,2,2); imshow(hdr_atrium_gamma);
title('Different gamma correction for each color channel');

% When you apply different gamma corrections to different channels you
% essentially squeeze the luminances of the different color channels
% differently. The end result is that you get mis colored images. As you
% can see in the images below, when we reduce the contrast of the red
% channel significantly the image becomes more red. The reason for this is
% that large red pixel values get squeezed down to roughly the same values
% as small ones, and when the color channels are normalized and combined to
% create the full color image, there will be much more "high" value red
% pixels on the scale of 0 to 1, thus making the images red. 
