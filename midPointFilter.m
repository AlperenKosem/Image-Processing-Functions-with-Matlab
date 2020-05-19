function outimg = midPointFilter(image,filterSize)


     minFilteredImg = minFilter(image,filterSize);
     maxFilteredImg = maxFilter(image,filterSize);
     
     image = 1 / 2 * ( double(maxFilteredImg) + double(minFilteredImg));
   
    
    outimg = uint8(image);



end
