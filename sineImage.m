function outimg = sineImage(f, direction)

    N = 256 ;
    image = uint8(zeros(N,N));

    if strcmp(direction,'vertical')
        for i = 1 : 1 : N 
            for j = 1 : 1 :N 
                image(i,j) =uint8( 128 * (1 + sin( (2 * pi * f * j) / N ))) ;
            end
        end
    end
    
    if strcmp(direction,'horizontal')
        for i = 1 : 1 : N 
            for j = 1 : 1 :N 
                image(i,j) =uint8( 128 * (1 + sin( (2 * pi * f * i) / N ))) ;
            end
        end
    end
    
    outimg = image;

end