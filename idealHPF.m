function filt_img =  idealHPF(image, D0)

     [row_size,column_size] = size(image);
     filt_img = zeros(row_size, column_size);
     
    for i = 1 : row_size
        for j = 1 : column_size
            if (sqrt((i - row_size / 2)^2 + (j - column_size / 2)^2) <= D0)
                filt_img(i, j) = 0;
            else
                filt_img(i, j) = 1;
            end
        end
    end
end