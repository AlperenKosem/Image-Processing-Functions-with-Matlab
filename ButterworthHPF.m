function filt_img =  ButterworthHPF(image, D0, n)
    % D0 : cutoff frequency
    % n  : order
    
    
    [row_size,column_size] = size(image);
    filt_img =  zeros(row_size, column_size);
    
    for i = 1 : row_size
        for j = 1 : column_size
           
            filt_img(i, j) = 1 / (1 + (D0 / sqrt((i - row_size / 2) ^ 2 + (j - column_size / 2) ^ 2)) ^ (2 * n));
            
        end
    end
end