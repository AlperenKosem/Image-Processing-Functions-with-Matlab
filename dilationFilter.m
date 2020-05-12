function outimg = dilationFilter(image)

    plus_kernel = [0 1 0 ; 1 1 1 ; 0 1 0] ;
    
    kernel = 255 * plus_kernel;
    [row_size, column_size] = size(image);

    new_image = zeros(row_size, column_size);
    
  
    
    for i = 1 : 1 : row_size - 2
        for j = 1 : 1 : column_size  - 2
            if  image(i+1, j) == kernel(2,1)  || ...
                image(i, j + 1) == kernel(1 , 2) ||  image(i+1, j+1) == kernel(2,2) ||...
                image(i + 1, j + 2) == kernel(2,3) || image(i+2, j+1 ) == kernel(3 , 2 ) 
                
                   new_image(i,j) = 255;
           
            end
        end
    end

    outimg = uint8(new_image);
    
    
end