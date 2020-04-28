function outimg = orderStFiltering(image, filterSize, typeOfStatistics) 
    
    [row_size, column_size] = size(image);
    
    filter = zeros(filterSize,filterSize);
    
    padded_image = padImage(image, row_size + filterSize - 2, column_size + filterSize -2);
    
    [padded_x, padded_y] = size(padded_image);
    padded_image = double(padded_image);
    
    
    if strcmp(typeOfStatistics,'median')
        
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
        
    elseif strcmp(typeOfStatistics,'min')
        
        for i = 1 : 1 : padded_x - (filterSize - 2) - 1
            for j = 1 : 1 : padded_y  - (filterSize - 2) - 1
                for x = 1 : 1 : filterSize
                    for y = 1 : 1 :filterSize
                        filter(x,y) = padded_image(i + x - 1  , y + j - 1 ); %create a kernel
                    end
                end

                filter = filter(:); % kernel should be one dimensional because of median(),max(),min() function of matlab 2018b and lower versions          
                image(i + (filterSize - 1) / 2 ,j + (filterSize - 1) / 2) = uint8(min(filter));
                filter = zeros(filterSize,filterSize); % Because of  Out of memory error

            end
        end
        
    elseif strcmp(typeOfStatistics,'max')
        
        for i = 1 : 1 : padded_x - (filterSize - 2) - 1
            for j = 1 : 1 : padded_y  - (filterSize - 2) - 1
                for x = 1 : 1 : filterSize
                    for y = 1 : 1 :filterSize
                        filter(x,y) = padded_image(i + x - 1  , y + j - 1 ); %create a kernel
                    end
                end

                filter = filter(:); % kernel should be one dimensional because of median(),max(),min() function of matlab 2018b and lower versions          
                image(i + (filterSize - 1) / 2 ,j + (filterSize - 1) / 2) = uint8(max(filter));
                filter = zeros(filterSize,filterSize); % Because of  Out of memory error

            end
        end               
    end
    
    outimg = image;

end
