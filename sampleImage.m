function outimg = sampleImage(img, sampling_ratio)
    %img = color2gray(img);
    [row_size, column_size] = size(img) ;    
    outimg = img(1:1/sampling_ratio:row_size,1:1/sampling_ratio:column_size);