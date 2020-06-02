function outimg = oil_paint_effect(image,filterSize)

[Nx, Ny, Nz] = size(image);

filter = zeros(filterSize,filterSize);
    
image = double(image);

    for color_layer = 1 : 1 : 3
        for i = 1 : 1 : Nx  - (filterSize - 2) - 1
            for j = 1 : 1 : Ny  - (filterSize - 2) - 1
                for x = 1 : 1 : filterSize
                    for y = 1 : 1 :filterSize
                        filter(x,y) = image(i + x - 1  , y + j - 1, color_layer ); %create a kernel
                    end
                end

                filter = filter(:); % kernel should be one dimensional because of median(),max(),min() function of matlab 2018b and lower versions           
          %---
                [modevalue] = mode(filter) ; % find most frequently used color in the kernel
                image(i,j,color_layer) = modevalue ;
          %---
           
                filter = zeros(filterSize,filterSize); 

            end
        end
    end
    
    
      image = uint8(image);
      outimg = image;
      

end