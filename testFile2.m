clear all
close all
clc

image = imread('MONALISA.tif');


gray_image =  rgb2gray(image);

    
 bin = [64 128 256];   
    
 
 imshow(gray_image)
 figure
 
for i = 1 : 1 : 3
    
    histogramValues_pure = getHistogram(gray_image,bin(i));
    subplot(3 ,1 ,i)
    bar(histogramValues_pure)    
    
    s1 = 'bin level : ';
    s2 = num2str(bin(i));
    s = strcat(s1,s2);
    title(s)
end
figure


bin = [ 64 0 128 0 256 0];
for i = 1 : 2 : 6
    
    [histogramValues, out_img] = histogramEqualization (gray_image,bin(i));
    
    subplot(3 ,2 ,i)
    imshow(out_img)
    
    subplot(3 ,2 ,i+1)
    bar(histogramValues)    
   
     
    s1 = 'bin level : ';
    s2 = num2str(bin(i));
    s = strcat(s1,s2);
    title(s)
end





