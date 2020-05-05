clear all
close all
clc

%% Question a1 sine image

f = 5 ;
direction = {'horizontal','vertical'};

for i = 1 : 2
    outimg = sineImage(f, direction(i));
    subplot(1 ,2 ,i)
    imshow(outimg)    
    
    s = strcat(direction(i),' sine image');
    title(s)
    
end
figure

%% Question a2 circle_image


r_ic = 50;
r_dis = 55;
circle_image = circleImage(r_ic, r_dis);


imshow(circle_image);
title('Circle Image');
figure

%% Question a3 rectangleimage


height = 120 ;
width = 80;

rectangle_image = rectangleImage(width, height);
    

imshow(rectangle_image)
title('Rectangle Image')

figure

%% Question a4 sincImage

    range = 5;
    image = sincImage(range);
 

    imshow(image)
    title('sinc Image')
figure
%% Ideal High Pass Filter

image = imread('pepper.tif');



gray_image = image(:,:);


D0 = 20 ;
ideal_filter =  idealHPF(gray_image, D0) ;

f = fftshift(fft2(gray_image));
f1hb = f .* ideal_filter;
filtered_image = ifft2(f1hb);
phase = angle(f1hb);


imshow(ideal_filter);
title('Ideal HPF')
figure


subplot(2,2,1)
imshow(gray_image)
title('original image')

subplot(2,2,2)
fftshow(f1hb)
title('FFT magnitude')

subplot(2,2,3)
fftshow(filtered_image)
title('Ideal HP filtered image')

subplot(2,2,4)
fftshow(phase)
title('FFT phase')
figure


%% butterWorth High Pass Filter


image = imread('pepper.tif');


    gray_image = image(:,:);


D0 = 15;
n = 2;

filter_image =  ButterworthHPF(gray_image, D0, n); % this function returns filter image

f = fftshift(fft2(gray_image));
f1hb = f .* filter_image;
filtered_image = ifft2(f1hb);
phase = angle(f1hb);

fftshow(filter_image)
title('ButterWorth HPF')
figure

subplot(2,2,1)
imshow(gray_image)
title('original image')

subplot(2,2,2)
fftshow(f1hb)
title('FFT magnitude')

subplot(2,2,3)
fftshow(filtered_image)
title('Butterworth HP filtered image')

subplot(2,2,4)
fftshow(phase)
title('FFT phase')
figure


%% Gaussian High Pass Filter


image = imread('pepper.tif');


    gray_image = image(:,:);


sigma = 8;
Gaus_filter =  GaussianHPF(gray_image, sigma);

f = fftshift(fft2(gray_image));
f1hb = f .* Gaus_filter;
filtered_image = ifft2(f1hb);
phase = angle(f1hb);


imshow(Gaus_filter);
title('Gaussian HPF')
figure

subplot(2,2,1)
imshow(gray_image)
title('original image')

subplot(2,2,2)
fftshow(f1hb)
title('FFT magnitude')

subplot(2,2,3)
fftshow(filtered_image)
title('Gaussian HP filtered image')

subplot(2,2,4)
fftshow(phase)
title('FFT phase')
figure

%% Laplacian High Pass Filter


image = imread('pepper.tif');


    gray_image = image(:,:);


sigma = 0.3; 
laplacian_filter =  LaplacianHPF(gray_image, sigma);

f = fftshift(fft2(gray_image));
f1hb = f .* laplacian_filter;
filtered_image = ifft2(f1hb);
phase = angle(f1hb);


imshow(laplacian_filter);
title('Laplacian HPF')
figure


subplot(2,2,1)
imshow(gray_image)
title('original image')

subplot(2,2,2)
fftshow(f1hb)
title('FFT magnitude')

subplot(2,2,3)
fftshow(filtered_image)
title('Laplacian HP filtered image')

subplot(2,2,4)
fftshow(phase)
title('FFT phase')





function fftshow(f,type)  %%this function taken from https://www.mathworks.com/matlabcentral/fileexchange/30946-butterworth-bandpass-filter-for-image-processing
% Usage: FFTSHOW(F,TYPE)
%
% Displays the fft matrix F using imshow, where TYPE must be one of
% 'abs' or 'log'. If TYPE='abs', then then abs(f) is displayed; if
% TYPE='log' then log(1+abs(f)) is displayed. If TYPE is omitted, then
% 'log' is chosen as a default.
%
% Example:
% c=imread('cameraman.tif');
% cf=fftshift(fft2(c));
% fftshow(cf,'abs')
%
    if nargin<2
    type='log';
    end
    if (type=='log')
    fl = log(1+abs(f));
    fm = max(fl(:));
    imshow(im2uint8(fl/fm))
    elseif (type=='abs')
    fa=abs(f);
    fm=max(fa(:));
    imshow(fa/fm)
    else
    error('TYPE must be abs or log.');
    end
end








