function image = rectangleImage(width, height)

N = 256 ;
image = 255 * uint8(ones(N,N));
    
    center_x = round(N/2);
    center_y = round(N/2);
    X1 = center_x - round(height / 2);
    Y1 = center_y - round(width / 2);
    X2 = X1 + height;
    Y2 = Y1 + width;
    
    for i=X1:X2
        image(i,Y1) = 0;
    end
    for i=X1:X2
        image(i,Y2) = 0;
    end
    for i=Y1:Y2
        image(X1,i) = 0;
    end
    for i=Y1:Y2
        image(X2,i) = 0;
    end
    
end