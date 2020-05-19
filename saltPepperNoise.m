function outimg = saltPepperNoise(image,low,high)

    [m, n] = size(image);
    rand_img = 255 .* rand(m,n);
    
    outimg =  ones(m,n);
    %outimg = image;
    outimg(rand_img <= low) = 0;  
    outimg(rand_img >= high) = 255; 
    
    
end
