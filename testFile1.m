clear all
close all
clc

image = imread('MONALISA.TIF');

image = color2gray(image);
imshow(image)
figure
test_array = [1 2 4 8 16 32 64 128];

for i = 1 : 1 : 6
    
    sampled_image = sampleImage(image,1/test_array(i));
    subplot(3 ,2 ,i)
    imshow(sampled_image)    
    
    s1 = 'sampling Ratio : ';
    s2 = num2str(test_array(i));
    s = strcat(s1,s2);
    title(s)
end
figure

for i = 1 : 1 : 6
    
    quantized_image = quantizeImage(image,test_array(i));
    subplot(3 ,2 ,i)
    imshow(quantized_image)    
    
    s1 = 'Quantazition level : ';
    s2 = num2str(test_array(i));
    s = strcat(s1,s2);
    title(s)
end
figure

test_array2 = [0.3 0.5  0.8 1 2 5 10];
for i = 1 : 1 : 6
    
    powered_image = powerlawtransform(image, test_array2(i));
    
    subplot(3 ,2 ,i)
    imshow(powered_image)    
    
    s1 = 'Power : ';
    s2 = num2str(test_array2(i));
    s = strcat(s1,s2);
    title(s)
end
figure


gray_level_slicied = graylevelslicing(image,32,64,128);
imshow(powered_image)
title('beginingPoint : 32 ,  finishPoint : 64, resultLevel : 128')
figure


test_array3 = [0 1  2 3 4 5 6 7];
for i = 1 : 1 : 8
    
    bitplane_slicied = bitplaneslicing(image, test_array3(i));
    
    subplot(4 ,2 ,i)
    imshow(bitplane_slicied)    
    
    s1 = 'bitplaneNumber : ';
    s2 = num2str(test_array3(i));
    s = strcat(s1,s2);
    title(s)
end


%[row_size, column_size] = size(gray_image) ;
%satir islemi için  gray_image(1,:) = 0
%sutun islemi için  gray_image(:,1)=0

function outimg = color2gray(img)
%     for i = 1 : 3
%         outimg = img(:,:);
%     end
     outimg = rgb2gray(img);

end
%img_red_pixels = image(:,:,1);
%img_green_pixels = image(:,:,2);
%img_blue_pixels = image(:,:,3);
