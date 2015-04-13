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
    cones = training{1} .* uint8(repmat(training_mask{1}, [1,1,3]));
    cones = reshape(cones, [], 1, 3);
    cones(find( sum(cones,3) == 0), :) = [];
    
    subseti = randperm(length(cones))';
    subset_cones( (i-1)*numsamples + 1 : i*numsamples, 1,:) = cones(subseti(1:numsamples),:);
    
    % Subset of non_cones
    noncones = training{1} .* uint8(repmat(~training_mask{1}, [1,1,3]));
    noncones = reshape(noncones, [], 1, 3);
    noncones(find(sum(noncones,3) == 0), :) = [];
    
    subseti = randperm(length(noncones))';
    subset_non( (i-1)*numsamples + 1 : i*numsamples, 1,:) = noncones(subseti(1:numsamples),:);
end

figure; hold;
scatter3(subset_cones(:,:,1), subset_cones(:,:,2), subset_cones(:,:,3),'r');
scatter3(subset_non(:,:,1), subset_non(:,:,2), subset_non(:,:,3),'b');
xlabel('R');
ylabel('G');
zlabel('B');
view([0.5,-1,1]);
GRID ON;

% We can see that there is a pretty significant seperation between colors
% found in the cones, and in colors where there are no cones. This is good,
% because it will make image segmentation based on color work well.

%% Question 4. Part B

bins_cones = zeros(16,16,16);
bins_non = zeros(16,16,16);

for k = 1:5
    
    % Cone bins
    cones = training{k} .* uint8(repmat(training_mask{k}, [1,1,3]));
    cones = reshape(cones, [], 1, 3);
    cones(find( sum(cones,3) == 0), :) = [];
    
    for i = 1:length(cones)
        color = cones(i,:);
        index = double(color(:))/16;
        index = floor(index) + 1;
        %indx = sub2ind(size(bins_cones), floor(index) + 1);
        bins_cones(index(1), index(2), index(3)) = ...
                             bins_cones(index(1), index(2), index(3)) + 1;
    end
    
    % Non-cone bins
    noncones = training{k} .* uint8(repmat(~training_mask{k}, [1,1,3]));
    noncones = reshape(noncones, [], 1, 3);
    noncones(find( sum(noncones,3) == 0), :) = [];
    
    for i = 1:length(noncones)
        color = noncones(i,:);
        index = double(color(:))/16;
        index = floor(index) + 1;
        bins_non(index(1), index(2), index(3)) = ...
                             bins_non(index(1), index(2), index(3)) + 1;
    end
end

bins = bins_cones > bins_non;
numOfConeBins = sum(bins(:));
display(['The fraction of bins belonging to the cone class is : ' num2str(numOfConeBins / (16*16*16))]);

%% Question 4. Part C

for k = 1:5
    [x y z] = size(training{k});
    img = training{k};
    mask = zeros(x,y);
    for i = 1:x
        for j = 1:y
            color = img(i,j,:);
            index = double(color(:))/16;
            index = floor(index) + 1;
            mask(i,j) = bins(index(1), index(2), index(3));
        end
    end
    figure;
    imshow(mask);
end
