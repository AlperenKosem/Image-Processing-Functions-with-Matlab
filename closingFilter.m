function outimg = closingFilter(image)
    

    dilationed = dilationFilter(image);
    closed_image = erosionFilter(dilationed);
    
    outimg = closed_image;

end