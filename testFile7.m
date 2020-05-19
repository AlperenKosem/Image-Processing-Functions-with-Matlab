clear all
close all
clc
    

image = imread('airfield-05.tif');

[x, y, z] = size(image);

 for i = 1 : 1 : x
    for j = 1 : 1 : y
        gray_image(i, j) = image(i, j);
    end
 end
 
  
%% Gaussian Noise

variance = 0.01;
mean = 0.1;
gaussianNoised = gaussianNoise(gray_image,variance, mean);
gaussianNoisedImg = ( 255 * gaussianNoised ) + double(gray_image);
gaussianNoisedImg = uint8(gaussianNoisedImg);


imshow(gaussianNoised)
title('Gaussian Noise')
figure

imshow(gaussianNoisedImg)
title('Gaussian Noised Image')

figure

%% Uniform Noise

 lower = 10;
 higher = 65 ;
 
 UniformNoised = uniformNoise(image,lower,higher);
 
UniformNoisedImg = (UniformNoised ) + double(gray_image);
UniformNoisedImg = uint8(UniformNoisedImg);


imshow(uint8(UniformNoised))
title('Uniform Noise')
figure

imshow(UniformNoisedImg)
title('Uniform Noised Image')

figure
 
%% Exponential Noise

coef = 100 ;
expNoiesed = exponentialNoise(image,coef);

expNoiesedImg = (expNoiesed ) + double(gray_image);
expNoiesedImg = uint8(expNoiesedImg);


imshow(uint8(expNoiesed))
title('Exponential Noise')
figure

imshow(expNoiesedImg)
title('Exponential Noised Image')
figure






 %% Salt Pepper Noise 
 
 low = 4;
 high = 250;
 outimg = saltPepperNoise(gray_image, low, high);

 saltPepperNoisedImg = (outimg) .* double(gray_image);
 saltPepperNoisedImg = uint8(saltPepperNoisedImg);
 
 imshow(outimg)
 title('Salt Pepper Noise')
 figure
 
 imshow(saltPepperNoisedImg)
 title('Salt Pepper Noised Image')

 figure
 
 
 %% Testing Max Filter
 % Reduce dark noise, increace bright noise
 % for Pepper Noise
 
 filterSize = 3 ;
  
maxFilteredImg = maxFilter(gaussianNoisedImg,filterSize);
subplot(2 ,2 ,1)
imshow(maxFilteredImg)   
s1 = 'Max Filter for Gaussian Noised Image';
title(s1)

maxFilteredImg = maxFilter(UniformNoisedImg,filterSize);
subplot(2 ,2 ,2)
imshow(maxFilteredImg)   
s1 = 'Max Filter for Uniform Noised Image';
title(s1)

maxFilteredImg = maxFilter(expNoiesedImg,filterSize);
subplot(2 ,2 ,3)
imshow(maxFilteredImg)   
s1 = 'Max Filter for Exponential Noised Image';
title(s1)

maxFilteredImg = maxFilter(saltPepperNoisedImg,filterSize);
subplot(2 ,2 ,4)
imshow(maxFilteredImg) 
s1 = 'Max Filter for Salt-Pepper Noised Image';
title(s1)

figure


 
 %% Testing Min Filter
 % Reduce bright noise, increace dark noise
 % for Salt Noise 
  
filterSize = 3 ;
  
minFilteredImg = minFilter(gaussianNoisedImg,filterSize);
subplot(2 ,2 ,1)
imshow(minFilteredImg)   
s1 = 'Min Filter for Gaussian Noised Image';
title(s1)

minFilteredImg = minFilter(UniformNoisedImg,filterSize);
subplot(2 ,2 ,2)
imshow(minFilteredImg)   
s1 = 'Min Filter for Uniform Noised Image';
title(s1)

minFilteredImg = minFilter(expNoiesedImg,filterSize);
subplot(2 ,2 ,3)
imshow(minFilteredImg)   
s1 = 'Min Filter for Exponential Noised Image';
title(s1)

minFilteredImg = minFilter(saltPepperNoisedImg,filterSize);
subplot(2 ,2 ,4)
imshow(minFilteredImg) 
s1 = 'Min Filter for Salt-Pepper Noised Image';
title(s1)

figure


 
 %% Testing Median Filter
 % For Salt - Pepper Noise
 
 filterSize = 3 ;
 medianFilteredImg = medianFilter(saltPepperNoisedImg,filterSize);
 
 imshow(medianFilteredImg)
 title('Median Filtered Image for Salt Pepper Noise')
 figure
 
 %% Testing Mid Point Filter
 % each pixel is replaced with the average of maximum and minimum  
 % of color values of the pixels in a surrounding region
 
 filterSize = 3;
 
%  midPointFilteredImg = midPointFilter(UniformNoisedImg,filterSize);
%  
%  imshow(midPointFilteredImg)
%  title('Mid Point Filtered Image')
%  figure
 
 midFilteredImg = midPointFilter(gaussianNoisedImg,filterSize);
subplot(2 ,2 ,1)
imshow(midFilteredImg)   
s1 = 'Mid Point Filter for Gaussian Noised Image';
title(s1)

midFilteredImg = midPointFilter(UniformNoisedImg,filterSize);
subplot(2 ,2 ,2)
imshow(midFilteredImg)   
s1 = 'Mid Point Filter for Uniform Noised Image';
title(s1)

midFilteredImg = midPointFilter(expNoiesedImg,filterSize);
subplot(2 ,2 ,3)
imshow(midFilteredImg)   
s1 = 'Mid Point Filter for Exponential Noised Image';
title(s1)

midFilteredImg = midPointFilter(saltPepperNoisedImg,filterSize);
subplot(2 ,2 ,4)
imshow(midFilteredImg) 
s1 = 'Mid Point Filter for Salt-Pepper Noised Image';
title(s1)

figure
 
 
 %% Arithmetic Mean Filter
 % removes short tailed noise such as uniform and Gaussian type noise from the image at the cost of blurring the image
 
%  arithmMeanFilteredImg = arithmeticMeanFilter(UniformNoisedImg);
%  imshow(arithmMeanFilteredImg)
%  title('Arithmetic Mean Filtered Image for Uniform Noised Image')
%  figure
%  
%  arithmMeanFilteredImg = arithmeticMeanFilter(gaussianNoisedImg);
%  imshow(arithmMeanFilteredImg)
%  title('Arithmetic Mean Filtered Image for Gaussian Noised Image')
%  figure
 
arithmMeanFilteredImg = arithmeticMeanFilter(gaussianNoisedImg);
subplot(2 ,2 ,1)
imshow(arithmMeanFilteredImg)   
s1 = 'Arithmetic Mean Filter for Gaussian Noised Image';
title(s1)

arithmMeanFilteredImg = arithmeticMeanFilter(UniformNoisedImg);
subplot(2 ,2 ,2)
imshow(arithmMeanFilteredImg)   
s1 = 'Arithmetic Mean Filter for Uniform Noised Image';
title(s1)

arithmMeanFilteredImg = arithmeticMeanFilter(expNoiesedImg);
subplot(2 ,2 ,3)
imshow(arithmMeanFilteredImg)   
s1 = 'Arithmetic Mean Filter for Exponential Noised Image';
title(s1)

arithmMeanFilteredImg = arithmeticMeanFilter(saltPepperNoisedImg);
subplot(2 ,2 ,4)
imshow(arithmMeanFilteredImg) 
s1 = 'Arithmetic Mean Filter for Salt-Pepper Noised Image';
title(s1)

figure


 
 %%  Geometric Mean Filter
 % color value of each pixel is replaced with the geometric mean of color values of the pixels in a surrounding region
 
%  geometricMeanFilteredImg = geometricMeanFilter(UniformNoisedImg);
%  imshow(geometricMeanFilteredImg)
%  title('Geometric Mean Filtered Image')
%  figure
 
 geometricMeanFilteredImg = geometricMeanFilter(gaussianNoisedImg);
subplot(2 ,2 ,1)
imshow(geometricMeanFilteredImg)   
s1 = 'Geometric Mean Filter for Gaussian Noised Image';
title(s1)

geometricMeanFilteredImg = geometricMeanFilter(UniformNoisedImg);
subplot(2 ,2 ,2)
imshow(geometricMeanFilteredImg)   
s1 = 'Geometric Mean Filter for Uniform Noised Image';
title(s1)

geometricMeanFilteredImg = geometricMeanFilter(expNoiesedImg);
subplot(2 ,2 ,3)
imshow(geometricMeanFilteredImg)   
s1 = 'Geometric Mean Filter for Exponential Noised Image';
title(s1)

geometricMeanFilteredImg = geometricMeanFilter(saltPepperNoisedImg);
subplot(2 ,2 ,4)
imshow(geometricMeanFilteredImg) 
s1 = 'Geometric Mean Filter for Salt-Pepper Noised Image';
title(s1)


 