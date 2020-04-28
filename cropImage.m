function outimg = cropImage (image, cropArray) 

        x1 = round(cropArray(1) / 2);
        y1 = round(cropArray(2) / 2);
        x2 = round(cropArray(3) / 2);
        y2 = round(cropArray(4) / 2);
        
        [row_size, column_size] = size(image);
            
        for i = 1 : 1 : row_size - x1 - x2
            for j = 1 : 1 : column_size - y1 - y2

                    outimg(i,j) = image(x1+i,y1+j);

            end
        end
        
        
end