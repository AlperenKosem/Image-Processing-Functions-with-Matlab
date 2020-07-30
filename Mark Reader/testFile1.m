clear all
close all
clc

image = imread('testImg5.jpeg');

gray_image = rgb2gray(image);

% imshow(gray_image)


threshold = 25;  
thresholded_image = threshold_image(gray_image,threshold);
% imshow(thresholded_image)

[total_answers, answer] = getQuestion(thresholded_image);

% figure
%   [J, rect] = imcrop(thresholded_image);

for k = 1 : 5
    if answer(k) < 0
        fprintf("%d. Soru için cevap verilmemistir.\n", k)
    else
        fprintf("%d. Soru için verilen cevap = %d\n", k, answer(k))
    end
end



function thresholded_image = threshold_image(image,threshold)
    [sizeX, sizeY, z] = size(image);
    
      
    for q = 1 : sizeX
        for w = 1 : sizeY
            if (image(q, w) < threshold)
                    image(q, w) = 1;
            else
                image(q, w) = 0;
            end
        end
    end
%     figure
%     imshow(image * 255);
    thresholded_image = uint8(image) ;
    
end
    
    
function [total_answers, answer] = getQuestion(image)


    locationX = 250; %1x1'in x konumu
    locationY = 65;  %1 x1' y konumu

    answer = [0 0 0 0 0 ];
    total_answers = zeros(5);

    for i = 1 : 5 
        for j = 1 : 5
            
            totalFilterValue = findFilterValue(image, locationX, locationY);
            total_answers(i,j) = totalFilterValue;
            locationX = locationX + 35;
            
        end
        
        locationX = 250;   %sütunlari sifirliyor
        locationY = locationY + 105; %sütunlari her seferinde 100 arttiriyor
        
    end

    %%%% ??klar bulundu, simdi anlamlandirilacak 
%     max value be onun indexi bulunarak hangi sorunun nesi oldu?u
%     aç?klanacak
    
   
    [M,answer] = max(total_answers,[],2,'includenan'); %reference : https://www.mathworks.com/help/matlab/ref/max.html#d120e766626
   %%% max degerleri bulunarak hangi sikkin nerede olduguna indexlerine
   %%% bakarak karar verildi
   for i = 1 : length(M)
        if (M(i) < 20 )
            answer(i) = -1;
        end
   end
  
end

function totalFilterValue = findFilterValue(image,locationX,locationY)
    totalFilterValue = 0;
    for x = 1 : 30
        for y = 1 : 40
            
            totalFilterValue = totalFilterValue + double(image( locationY + y , locationX + x));
            
        end
    end      
end







% image = imread('testImg1.jpeg');
% figure
% imshow(image)
% [xi,yi] = getpts
%imtool(image)









