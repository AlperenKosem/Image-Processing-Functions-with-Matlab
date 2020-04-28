function outimg = unsharpMasking(image, lowPassFilter, k) 
       
     lowPassImg = filterImage(image,lowPassFilter);
     [row_size, column_size] = size(image);
     image =  padImage(image, row_size +1, column_size +1); 
     highPassImg = image - lowPassImg;
    
     outimg = image + k * highPassImg;

end