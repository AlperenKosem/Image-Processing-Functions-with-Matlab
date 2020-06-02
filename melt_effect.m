function outimg = melt_effect(image)
    
    [Nx, Ny, Nz] = size(image);
    
    image = double(image);
    new_image = image;
    
    for color_layer = 1 : 3
        for i = 1 : Nx
            for j = 1 : Ny - 10 
                if image(i , j, color_layer) <  image(i , j + 1, color_layer)


                     c = new_image(i , j + 10, color_layer);
                     new_image(i , j + 10, color_layer) = new_image(i , j, color_layer) ;
                     new_image(i , j, color_layer) = c ;

                end
            end
        end
    end

     
    
    outimg = uint8(new_image);
    

end


