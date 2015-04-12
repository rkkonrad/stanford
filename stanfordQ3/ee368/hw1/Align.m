function [ aligned, outdx, outdy] = Align( f, g)
% Aligns frame f to g by minimizing the mean squared difference

search = 20;
minMSE = Inf;
for dx = -search:2:search
    for dy = -search:2:search
         frameTform = zeros(size(f));
%         A = [1 0 dx; 0 1 dy; 0 0 1];
%         tform = maketform('affine', A.');
%         [height, width, channels] = size(f);
%         frameTform = imtransform(f, tform, 'bilinear', ...
%                                  'XData', [1 width], 'YData', [1 height], ...
%                                  'FillValues', zeros(channels,1));
%         
        frameTform = imtranslate(f, [dx,dy], 'FillValues', zeros(3,1));


        % Calculates the MSE
        mse = norm( reshape(frameTform, [], 1) - reshape(g, [], 1));
         
        if(mse < minMSE)
           minMSE = mse;
           aligned = frameTform;
           outdx = dx;
           outdy = dy;
        end
    end
end

end

