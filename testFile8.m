clear all
close all
clc
    

image = imread('fruits.jpg');

imshow(image)
title('Original Image')

figure


%% Oil Paint Effect

filterSize = 7 ; 
oil_painted_image = oil_paint_effect(image,filterSize);
imshow(oil_painted_image)
title('Oil Paint Effect')
figure

%% Melt Effect

melt_effected = melt_effect(image);
imshow(melt_effected)
title('Melt Effect')


figure

%% Solarization Effect

solarized =  solarization_effect(image);
imshow(solarized)
title('Solarization Effect')

figure

%%  Bathroom Effect

bathroom_image =  bathroom_effect(image);
imshow(bathroom_image)
title('Bathroom Effect')














