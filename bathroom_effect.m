function outimg =  bathroom_effect(image)


    [Nx, Ny, Nz] = size(image);
    
    new_image = double(image);
    
    for i = 16 : 1: Nx 
        for j = 1 : 1 : Ny
            
            new_image(i,j,: ) = image( i + mod(i , 32) - 16 , j , : );
            
        end
    end
    outimg = uint8(new_image);
    
    
    
    
end