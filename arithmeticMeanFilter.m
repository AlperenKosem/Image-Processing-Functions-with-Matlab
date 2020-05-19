function outimg = arithmeticMeanFilter(image)

    [row_size, column_size] = size(image);
    padded_image = padImage(image, row_size +1, column_size +1);
    [padded_x, padded_y] = size(padded_image);
    
    padded_image = double(padded_image);
    new_img = double( zeros(padded_x  , padded_y));

    for i = 1 : 1 : padded_x - 2
        for j = 1 : 1 : padded_y  - 2

            new_img(i+1,j+1) = (padded_image(i,j) +  padded_image(i,j+1) + padded_image(i,j+2) + ...
                                padded_image(i+1,j)  + padded_image(i+2,j)  + padded_image(i+1,j+1) + ...
                                padded_image(i+1,j+2) + padded_image(i+2,j+2) + padded_image(i+2,j+1) ) / 9 ;                

        end
    end
    
    
    

    x1 = round((padded_x - row_size) );
    y1 = round((padded_y - column_size) );
    x2 = round((padded_x - row_size - 1) );
    y2 = round((padded_y - column_size - 1) );
    cropArray = [x1 y1 x2 y2];
    cropped_image = cropImage(new_img, cropArray);


    
    outimg = uint8(cropped_image);
    
end

function outimg = padImage(image, nrp, ncp)

    [raw_size, column_size] = size(image);
    outimg = uint8( zeros(nrp  , ncp));
    
    [new_size_x, new_size_y] = size(outimg) ;

    for i = 1 : 1 : new_size_x
        for j = 1 : 1 : new_size_y
            if( i <= round( (new_size_x - raw_size) /2) ||  i >= (raw_size + round((nrp - raw_size)/2) ) || j <= round( (new_size_y - column_size) /2) || j >= (column_size + round((ncp - column_size)/2) ))

                outimg(i,j) = 0;
            else
                outimg(i,j) = image(i - round( (new_size_x - raw_size) /2) ,j - round( (new_size_y - column_size) /2));

            end
        end
    end


end

function outimg = cropImage (image, cropArray) 

        x1 = round(cropArray(1) / 2);
        y1 = round(cropArray(2) / 2);
        x2 = round(cropArray(3) / 2);
        y2 = round(cropArray(4) / 2);
        
        [raw_size, column_size] = size(image);
            
        for i = 1 : 1 : raw_size - x1 - x2
            for j = 1 : 1 : column_size - y1 - y2

                    outimg(i,j) = image(x1+i,y1+j);

            end
        end
        
        

end

