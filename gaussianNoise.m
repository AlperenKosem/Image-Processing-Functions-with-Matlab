function outimg = gaussianNoise(image,variance,mean)

    [m, n] = size(image);
  
    for i = 1 : 1 : m
        for j = 1 : 1 : n
             outimg(i,j) = sqrt(variance) * randn + mean;
        end
    end



end