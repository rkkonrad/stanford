%% Question 3
clear all;
close all;

paint1_ref = im2double(imread('hw1_data/hw1_painting_1_reference.jpg'));
paint1_tamp = im2double(imread('hw1_data/hw1_painting_1_tampered.jpg'));
paint2_ref = im2double(imread('hw1_data/hw1_painting_2_reference.jpg'));
paint2_tamp = im2double(imread('hw1_data/hw1_painting_2_tampered.jpg'));

threshold = 0.02;

% Painting 1
[height, width] = size(paint1_ref);

paint1_tamp_aligned = Align(paint1_tamp, paint1_ref);
paint1_diff = abs(paint1_ref - paint1_tamp_aligned);
binary = rgb2gray(paint1_diff);
binary = binary > threshold;

figure;
imshow(binary);
title('Binary difference for painting 1');

% Painting 2
[height, width] = size(paint2_ref);

paint2_tamp_aligned = Align(paint2_tamp, paint2_ref);
paint2_diff = abs(paint2_ref - paint2_tamp_aligned);
binary = rgb2gray(paint2_diff);
binary = binary > threshold;

figure;
imshow(binary);
title('Binary difference for painting 2');