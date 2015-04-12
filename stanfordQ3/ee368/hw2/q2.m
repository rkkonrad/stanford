%% Question 3. Part A
clear all;
close all;

page1 = imread('hw2_data/hw2_book_page_1.jpg');
page2 = imread('hw2_data/hw2_book_page_2.jpg');

T1 = graythresh(page1);
T2 = graythresh(page2);

binary1 = (page1 > T1*255);
binary2 = (page2 > T2*255);

figure; imshow(binary1);
title('Binary image for page 1');
figure; hold;
imhist(page1);
plot([T1*255 T1*255], [0 1e5], 'r');
title('Histogram with Otsu threshold for page 1');

figure; imshow(binary2);
title('Binary image for page 2');
figure; hold;
imhist(page2);
plot([T2*255 T2*255], [0 1e5], 'r');
title('Histogram with Otsu threshold for page 2');

% We can see that the global histogram thresholding works well enough in
% the parts of the page that have been pressed flat against the scanner.
% However, the parts that have been curved back due to the spine of the
% book, this thresholding method breaks down and we can see that the
% characters at those parts of the image aren't correctly classified. 

%% Question 3. Part B

% For Page 1
[row col] = size(page1);
varThresh = 100;
stepWidth = 16;
tileWidth = 32;

mask = ones(row,col);

for i = 1: col/stepWidth
    indCol = (i-1)*stepWidth + 1 : i*stepWidth;
    tile = page1(:, indCol);
    varTile = var(double(tile(:)));
    meanTile = mean(tile(:));
    otsuThresh = graythresh(tile);
    
    % Threshold based on local mean (if low variance)
    if(varTile < varThresh)
        if(meanTile < otsuThresh*255)
           mask(:, indCol) = 0;
        else
            mask(:,indCol) = 1;
        end
        continue;  
    end
    mask(:,indCol) = im2bw(tile, otsuThresh);
end

figure; imshow(mask);
title('Page 1 with locally adaptive thresholding');

% For Page 2
[row col] = size(page2);
varThresh = 100;
stepWidth = 16;
tileWidth = 32;

mask = ones(row,col);

for i = 1: col/stepWidth
    indCol = (i-1)*stepWidth + 1 : i*stepWidth;
    tile = page2(:, indCol);
    varTile = var(double(tile(:)));
    meanTile = mean(tile(:));
    otsuThresh = graythresh(tile);
    
    % Threshold based on local mean (if low variance)
    if(varTile < varThresh)
        if(meanTile < otsuThresh*255)
           mask(:, indCol) = 0;
        else
            mask(:,indCol) = 1;
        end
        continue;  
    end
    mask(:,indCol) = im2bw(tile, otsuThresh);
end

figure; imshow(mask);
title('Page 2 with locally adaptive thresholding');

% We can see large improvements when using locally adaptive thresholding.
% The non-uniform illumination is no longer a problem along the spine of
% the book. Each character is clearly identifiable.