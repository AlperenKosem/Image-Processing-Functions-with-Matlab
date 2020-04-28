function histogramValues_pure = getHistogram (inimg, bin)
    %this function include quantizeImage function.
    if bin == 1
        bin = 256;
    elseif bin == 2
        bin = 128;
    elseif bin == 4
        bin = 64;     
    elseif bin == 8
        bin = 32;
    elseif bin == 16
        bin = 16;
    elseif bin == 32
        bin = 8;
    elseif bin == 64
        bin = 4;
    elseif bin == 128
        bin = 2;
    elseif bin == 256
        bin = 1;
    else
        bin = bin;
    end


    [row_size, column_size] = size(inimg);
  
        for i = 1 : 1 : row_size
            for j = 1 : 1 : column_size
                quantized_image(i , j) = (inimg(i, j) / bin) * bin;
            end
        end

    %quantized_image(256 , 256) = 256; %this line for testing, it works
    % well
    
    histogramValues = zeros(256,1);


        for i = 1 : 1 : row_size
            for j = 1 : 1 : column_size
                histogramValues(quantized_image(i, j) + 1) = histogramValues(quantized_image(i, j) + 1) + 1;
            end
        end

    histogramValues_pure = histogramValues(1:bin:256);


end
