function outimg = morphologicalGradientFilter(image)

    dilationed_img = dilationFilter(image);
    erosioned_image = erosionFilter(image);
    
    outimg = uint8(double(dilationed_img) - double(erosioned_image));
    
end