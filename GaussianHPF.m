function filt_img =  GaussianHPF(image, sigma)

     [row_size,column_size] = size(image);
     filt_img = zeros(row_size, column_size);
     
    for i = 1 : row_size
        for j = 1 : column_size
            
                filt_img(i, j) = 1 - exp(-((i - row_size / 2) ^ 2 + (j - column_size / 2) ^ 2) / (2 * sigma ^ 2));

        end
    end
end