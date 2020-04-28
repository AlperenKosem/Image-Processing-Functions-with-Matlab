function outimg = quantizeImage(img, q)

    if q == 1
        q = 256;
    elseif q == 2
        q = 128;
    elseif q == 4
        q = 64;     
    elseif q == 8
        q = 32;
    elseif q == 16
        q = 16;
    elseif q == 32
        q = 8;
    elseif q == 64
        q = 4;
    elseif q == 128
        q = 2;
    elseif q == 256
        q = 1;
    else
        q = q;
    end

    %img = color2gray(img);
    [row_size, column_size] = size(img);
    for i = 1 : 1 : row_size
        for j = 1 : 1 : column_size
            outimg(i , j) = (img(i, j) / q) * q;
        end
    end
end