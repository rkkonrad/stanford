function [ digit ] = readData( path )
%readData() takes in the path to the image file and imports them
% into an matlab data structure.

files = dir(fullfile(path, '*.pgm'));
digit = zeros(784,length(files));

for i=1:length(files)
    elm = imread( [path files(i).name]);
    digit(:,i) = elm(:);
end

end

