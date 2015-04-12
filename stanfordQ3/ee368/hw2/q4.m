%% Question 4. Part A
clear all;
close all;

training{1} = imread('hw2_data/hw2_cone_training_1.jpg');
training{2} = imread('hw2_data/hw2_cone_training_2.jpg');
training{3} = imread('hw2_data/hw2_cone_training_3.jpg');
training{4} = imread('hw2_data/hw2_cone_training_4.jpg');
training{5} = imread('hw2_data/hw2_cone_training_5.jpg');

training_mask{1} = imread('hw2_data/hw2_cone_training_map_1.png');
training_mask{2} = imread('hw2_data/hw2_cone_training_map_2.png');
training_mask{3} = imread('hw2_data/hw2_cone_training_map_3.png');
training_mask{4} = imread('hw2_data/hw2_cone_training_map_4.png');
training_mask{5} = imread('hw2_data/hw2_cone_training_map_5.png');

testing{1} = imread('hw2_data/hw2_cone_testing_1.jpg');
testing{1} = imread('hw2_data/hw2_cone_testing_2.jpg');

numsamples = 100;
subset = zeros(100*5,1,3);
for i = 1:5
    % Subset of cones
    [x y z] = size(training{i});
    cones = training{i} .* training_mask{i};
    subseti = randperm(x*y)';
    img = reshape(training{i}, [], 1, 3);
    subset( (i-1)*numsamples + 1 : i*numsamples, 1,:) = img(subseti(1:numsamples),1,:);
end

scatter3(subset(:,:,1), subset(:,:,2), subset(:,:,3),'r');

