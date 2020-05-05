function filt_img =  LaplacianHPF(image,sigma)
    
     [row_size,column_size] = size(image);
     filt_img = zeros(row_size, column_size);
     
    for i = 1 : row_size
        for j = 1 : column_size
            
              filt_img(i, j) =  (-1 / pi * sigma^4)*(1-(((i - row_size / 2)^2+(j - column_size / 2) ^ 2)));
        end
    end
    
     filt_img = 1 - filt_img / max(filt_img(:));
end