function outimg = medianFilter(image,filterSize)



    [raw_size, column_size] = size(image);
    
    filter = zeros(filterSize,filterSize);
    
    padded_image = padImage(image, raw_size + filterSize - 2, column_size + filterSize -2);
    
    [padded_x, padded_y] = size(padded_image);
    padded_image = double(padded_image);
    
    

        for i = 1 : 1 : padded_x - (filterSize - 2) - 1
            for j = 1 : 1 : padded_y  - (filterSize - 2) - 1
                for x = 1 : 1 : filterSize
                    for y = 1 : 1 :filterSize
                        filter(x,y) = padded_image(i + x - 1  , y + j - 1 ); %create a kernel
                    end
                end

                filter = filter(:); % kernel should be one dimensional because of median(),max(),min() function of matlab 2018b and lower versions           
                image(i + (filterSize - 1) / 2 ,j + (filterSize - 1) / 2) = uint8(median(filter));
                filter = zeros(filterSize,filterSize); % Because of  Out of memory error

            end
        end


    
    outimg = image;



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