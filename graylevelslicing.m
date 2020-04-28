function outimg =  graylevelslicing(img, beginingPoint, finishPoint, resultLevel)

    %img = color2gray(img);
    [row_size, column_size] = size(img);
    
    for i = 1 : 1 : row_size
        for j = 1 : 1 : column_size
            if img(i, j) >= beginingPoint && img(i, j) <= finishPoint
                 outimg(i, j) = resultLevel;
            end
        end
    end
end