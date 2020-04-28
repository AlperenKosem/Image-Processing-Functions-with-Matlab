function outimg =  bitplaneslicing( img, bitplaneNumber)
    
    %img = color2gray(img);
    [row_size, column_size] = size(img);
   
    
    for i = 1 : 1 : row_size
        for j = 1 : 1 : column_size
            
            binVal = decimalToBinaryVector(img(i, j), 8); %https://www.mathworks.com/help/daq/decimaltobinaryvector.html            
            outimg(i,j) = binVal(8 - bitplaneNumber);
            
        end
    end
end