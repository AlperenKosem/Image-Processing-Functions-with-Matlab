function outimg = exponentialNoise(image,coef)


    [m, n] = size(image);
    
    for i = 1 : 1 : m
        for j = 1 : 1 : n
            outimg(i,j) = coef * exp(- coef * rand);
        end
    end


end