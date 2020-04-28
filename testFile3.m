clear all
close all
clc

image = imread('GRAZ141.TIF');

for i = 1 : 3
    gray_image = image(:,:);
end



%image = gray_image;

%--------PADDING-------
nrp = 700;
ncp = 500;
padded_image = padImage (gray_image, nrp, ncp);

imshow(padded_image)
title('padded image')
figure

%-----CROPPING---------
[sizeX, sizeY] = size(gray_image);

x1 = round((nrp-sizeX) );
y1 = round((ncp - sizeY) );
x2 = round((nrp - sizeX) );
y2 = round((ncp-sizeY) );
cropArray = [x1 y1 x2 y2];
cropped_image = cropImage(padded_image, cropArray) ;


imshow(cropped_image)
title('cropped image')
figure

%------FILTERS------

xFilter = [-1 0 1 ; -1 0 1 ; -1 0 1] ;
yFilter = [-1 -1 -1 ; 0 0 0 ; 1 1 1 ] ;
lapFilter = [0 1 0 ; 1 -4 1 ; 0 1 0] ; 
gausFilter = [0.0233 0.106 0.0233 ; 0.106 0.421 0.106 ; 0.0233 0.106 0.0233];
uniFilter = 1/9 * ones(3,3);


filter = xFilter;
filtered_image = filterImage(gray_image, filter);
imshow(filtered_image)
title('x Filter')
figure

filter = yFilter;
filtered_image = filterImage(gray_image, filter);
imshow(filtered_image)
title('y Filter')
figure

filter = lapFilter;
filtered_image = filterImage(gray_image, filter);
imshow(filtered_image)
title('Laplacian Filter')
figure

filter = gausFilter;
filtered_image = filterImage(gray_image, filter);
imshow(filtered_image)
title('Gaussian Filter')
figure

filter = uniFilter;
filtered_image = filterImage(gray_image, filter);
imshow(filtered_image)
title('Uniform Filter')
figure








%-----------ORDER ST FILTERING -----------

filterSize_Array = [3 5 7 9];
typeOfStatistics = 'median' ;


for i = 1 : 1 : 4
    
    new_image_med = orderStFiltering(image, filterSize_Array(i), typeOfStatistics) ;
    subplot(2 ,2 ,i)
    imshow(new_image_med)    
    
    s1 = 'Median Filtering, Size of Kernel : ';
    s2 = num2str(filterSize_Array(i));
    s = strcat(s1,s2);
    title(s)
end
figure

typeOfStatistics = 'min' ;

for i = 1 : 1 : 4
    
    new_image_med = orderStFiltering(image, filterSize_Array(i), typeOfStatistics) ;
    subplot(2 ,2 ,i)
    imshow(new_image_med)    
    
    s1 = 'Min Filtering, Size of Kernel : ';
    s2 = num2str(filterSize_Array(i));
    s = strcat(s1,s2);
    title(s)
end
figure

typeOfStatistics = 'max' ;

for i = 1 : 1 : 4
    
    new_image_med = orderStFiltering(image, filterSize_Array(i), typeOfStatistics) ;
    subplot(2 ,2 ,i)
    imshow(new_image_med)    
    
    s1 = 'Max Filtering, Size of Kernel : ';
    s2 = num2str(filterSize_Array(i));
    s = strcat(s1,s2);
    title(s)
end
figure
    
    
uniFilter = 1/9 * ones(3,3);
gausFilter = [0.0233 0.106 0.0233 ; 0.106 0.421 0.106 ; 0.0233 0.106 0.0233];


k_array = [0.1 0.5 0.9 1.3];

for i = 1 : 1 : 4
    
    unsharpedImg = unsharpMasking(gray_image,gausFilter,k_array(i)) ;
    subplot(2 ,2 ,i)
    imshow(unsharpedImg)    
    
    s1 = 'unsharpMasking, k value : ';
    s2 = num2str(k_array(i));
    s = strcat(s1,s2);
    title(s)
end

