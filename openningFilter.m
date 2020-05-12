function outimg = openningFilter(image)
    
    erosioned_image = erosionFilter(image);
    openedImg = dilationFilter(erosioned_image);
    
    outimg = openedImg;

end