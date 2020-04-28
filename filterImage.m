function outimg = filterImage(image, filter) 
    
    [row_size, column_size] = size(image);
    padded_image = padImage(image, row_size +1, column_size +1);
    [padded_x, padded_y] = size(padded_image);
    padded_image = double(padded_image);
    new_img = double( zeros(padded_x  , padded_y));

    for i = 1 : 1 : padded_x - 2
        for j = 1 : 1 : padded_y  - 2

            new_img(i+1,j+1) = (padded_image(i,j) * filter(1,1) +  padded_image(i,j+1) * filter(1,2) + padded_image(i,j+2) * filter(1,3) + padded_image(i+1,j) * filter(2,1) + padded_image(i+2,j) * filter(3,1) + padded_image(i+1,j+1) * filter(2,2) + padded_image(i+1,j+2) * filter(2,3) + padded_image(i+2,j+2) * filter(3,3)) ;                

        end
    end
    
    outimg = uint8(new_img);
    
end