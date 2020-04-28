function outimg = padImage(image, nrp, ncp)

    [row_size, column_size] = size(image);
    outimg = uint8( zeros(nrp  , ncp));
    
    [new_size_x, new_size_y] = size(outimg) ;

    for i = 1 : 1 : new_size_x
        for j = 1 : 1 : new_size_y
            if( i <= round( (new_size_x - row_size) /2) ||  i >= (row_size + round((nrp - row_size)/2) ) || j <= round( (new_size_y - column_size) /2) || j >= (column_size + round((ncp - column_size)/2) ))

                outimg(i,j) = 0;
            else
                outimg(i,j) = image(i - round( (new_size_x - row_size) /2) ,j - round( (new_size_y - column_size) /2));

            end
        end
    end


end