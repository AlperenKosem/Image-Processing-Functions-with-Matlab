clear all
close all
clc

% image = imread('testImg3.jpeg');

test_image_sayisi = cell(1,8);

for i=1:length(test_image_sayisi)
    test_image_sayisi{i}=imread(sprintf('testImg%d.jpeg',i)); %reference https://www.mathworks.com/matlabcentral/answers/2389-how-to-read-jpg-images-in-a-loop
end

toplam_cevap_sayisi = zeros(length(test_image_sayisi),5);

for len = 1 : length(test_image_sayisi)
    
    image = test_image_sayisi{len};
    gray_image = rgb2gray(image);

%     imshow(gray_image)


    threshold = 25;  
    thresholded_image = threshold_image(gray_image,threshold);
    
%     figure
%     imshow(thresholded_image * 255)   
%     figure

    [total_answers, answer] = getQuestion(thresholded_image);
    
    
    toplam_cevap_sayisi(len,:) = transpose(answer);
    


    for k = 1 : 5
        if answer(k) < 0
            fprintf("%d. Soru için cevap verilmemistir.\n", k)
        else
            fprintf("%d. Soru için verilen cevap = %d\n", k, answer(k))
        end
    end
    fprintf("\n")
    fprintf(" %d. Anket Bitmistir ------ \n",len)
    fprintf("\n")
    
end

 [sizeX, sizeY, z] = size(toplam_cevap_sayisi);
 cevap1lerin_sayisi = 0;
 cevap2lerin_sayisi = 0;
 cevap3lerin_sayisi = 0;
 cevap4lerin_sayisi = 0;
 cevap5lerin_sayisi = 0;
 cevapsiz = 0;
 for i = 1 : sizeX
     for j = 1 : sizeY
         if (toplam_cevap_sayisi(i,j) == 1 )
             cevap1lerin_sayisi = cevap1lerin_sayisi + 1 ;
         elseif (toplam_cevap_sayisi(i,j) == 2 )
             cevap2lerin_sayisi = cevap2lerin_sayisi + 1;
         elseif (toplam_cevap_sayisi(i,j) == 3 )
             cevap3lerin_sayisi = cevap3lerin_sayisi + 1;
         elseif (toplam_cevap_sayisi(i,j) == 4 )
             cevap4lerin_sayisi = cevap4lerin_sayisi + 1;
         elseif (toplam_cevap_sayisi(i,j) == 5 )
             cevap5lerin_sayisi = cevap5lerin_sayisi + 1;
         else
             cevapsiz = cevapsiz + 1 ;
         end
     end
 end
 
fprintf(" Toplam 1'e verilen cevap orani = %d / %d \n", cevap1lerin_sayisi, sizeX * sizeY );
fprintf(" Toplam 2'ye verilen cevap orani = %d / %d \n", cevap2lerin_sayisi, sizeX * sizeY );
fprintf(" Toplam 3'e verilen cevap orani = %d / %d \n", cevap3lerin_sayisi, sizeX * sizeY );
fprintf(" Toplam 4'e verilen cevap orani = %d / %d \n", cevap4lerin_sayisi, sizeX * sizeY );
fprintf(" Toplam 5'e verilen cevap orani = %d / %d \n", cevap5lerin_sayisi, sizeX * sizeY );
fprintf(" Toplam cevapsiz birakilan cevap orani = %d / %d \n", cevapsiz, sizeX * sizeY );


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
    

    thresholded_image = image ;
    

    
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