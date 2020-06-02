function outimg =  solarization_effect(image)

    [Nx, Ny, Nz] = size(image);
    
    new_image = double(image);
 
    maxValue = max(new_image(:)) ; % find maximum intensity
   
    for i = 1 : 1: Nx
        for j = 1 : 1 : Ny
             
            if image(i,j,:) > ( maxValue * i ) / (2 * Nx )
                
                new_image(i,j,: ) = image(i,j,:);
                
            else
                
                new_image(i,j,: ) = maxValue - image(i,j,:);
                
            end
        end
    end
    outimg = uint8(new_image);
end