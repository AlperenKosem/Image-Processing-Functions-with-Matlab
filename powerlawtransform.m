function outimg = powerlawtransform(img, pow)

    const = 2;
    %img = color2gray(img);
    [row_size, column_size] = size(img);
    
    img = im2double(img); %due to Integers can only be raised to positive integral powers error.
    
    for i = 1 : 1 : row_size
        for j = 1 : 1 : column_size
            
            outimg(i, j) = const * (double(img(i, j)) .^ pow); 
                            
        end
    end
end