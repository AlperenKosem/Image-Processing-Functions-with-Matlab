clear all
close all
clc
    
%% Erosion Filter

image = imread('coins.png');
imshow(image)
title("before thresholded")
figure

gray_image = color2gray(image);
thresholded_image = threshold(gray_image, 165);
    
% imshow(thresholded_image)
% figure
        
erosioned_image = erosionFilter(thresholded_image);


subplot(1,2,1)
imshow(gray_image)
title('original image')

subplot(1,2,2)
imshow(erosioned_image)
title('erosioned image')
figure

%% Dilation Filter

image = imread('coins.png');


gray_image = color2gray(image);
thresholded_image = threshold(gray_image, 165);

imshow(thresholded_image)
figure
        
dilationed_image = dilationFilter(thresholded_image);
    
subplot(1,2,1)
imshow(gray_image)
title('original image')

subplot(1,2,2)
imshow(dilationed_image)
title('dilationed image')
figure

%% Opening Filter

image = imread('coins.png');

gray_image = color2gray(image);
thresholded_image = threshold(gray_image, 175);
    
        
openned_image = openningFilter(thresholded_image);
    
subplot(1,2,1)
imshow(gray_image)
title('original image')

subplot(1,2,2)
imshow(openned_image)
title('openned image')
figure

%% Closing Filter

image = imread('coins.png');

gray_image = color2gray(image);
thresholded_image = threshold(gray_image, 175);
    
        
closed_image = closingFilter(thresholded_image);
    
subplot(1,2,1)
imshow(gray_image)
title('original image')

subplot(1,2,2)
imshow(closed_image)
title('closed image')
figure

%% External Boundary Filter

image = imread('coins.png');

gray_image = color2gray(image);
thresholded_image = threshold(gray_image, 100);
% imshow(thresholded_image)
% figure
        
externalBoundaried_image = externalBoundaryFilter(thresholded_image);
    
subplot(1,2,1)
imshow(gray_image)
title('original image')

subplot(1,2,2)
imshow(externalBoundaried_image)
title('External Boundaried image')
figure
  
%% Morphological Gradient Filter

image = imread('coins.png');

gray_image = color2gray(image);
thresholded_image = threshold(gray_image, 100);
% imshow(thresholded_image)
% figure
        
morphologicalGradiented_image = morphologicalGradientFilter(thresholded_image);
    
subplot(1,2,1)
imshow(gray_image)
title('original image')

subplot(1,2,2)
imshow(morphologicalGradiented_image)
title('Morphological Gradiented image')


%% SubFunctions
function outimg = threshold(image, border)
        


   [x, y] = size(image);
    
    outimg = image;
    
    for i = 1 : 1 : x
        for j = 1 : 1 : y
            if image(i,j) > border
                
                outimg(i,j) = 255;
                
            else
                
                outimg(i,j) = 0;
            end
            
        end
    end
end


function gray_image = color2gray(image)

    [x, y, z] = size(image);
    
     for i = 1 : 1 : x
        for j = 1 : 1 : y
            gray_image(i, j) = image(i, j);
        end
    end

end
    

