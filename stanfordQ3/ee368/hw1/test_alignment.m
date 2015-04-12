clear all;
close all;


vidSky1 = VideoReader('hw1_data/hw1_sky_1.avi');

numFrames1 = get(vidSky1, 'NumberOfFrames');

% Read in 1st frame
frame = im2double(read(vidSky1, 1));


dx = 4;
dy = -5;

A = [1 0 dx; 0 1 dy; 0 0 1];
tform = maketform('affine', A.');
[height, width, channels] = size(frame);
frameTform = imtransform(frame, tform, 'bilinear', ...
                         'XData', [1 width], 'YData', [1 height], ...
                         'FillValues', zeros(channels,1));
                     
frame_aligned = Align(frameTform , frame);

figure;
subplot(1,3,1); imshow(frame); title('frame');
subplot(1,3,2); imshow(frameTform); title('shifted frame');
subplot(1,3,3); imshow(frame_aligned); title('aligned frame');

norm( reshape(frame, [], 1) - reshape(frameTform, [], 1))
norm( reshape(frame, [], 1) - reshape(frame_aligned, [], 1))