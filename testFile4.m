clear all
close all
clc

image = imread('GRAZ141.TIF');

for i = 1 : 3
    gray_image = image(:,:);
end

t_low = 30;
t_high = 90;

outimg = cannyEdgeDetector(gray_image, t_low, t_high);

imshow(outimg)