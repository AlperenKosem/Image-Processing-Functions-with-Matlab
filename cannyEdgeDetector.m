function outimg = cannyEdgeDetector(image, t_low, t_high) 

    [row_size, column_size] = size(image);
    
    image = double(image);

    filter = [2 4 5 4 2;
        4 9 12 9 4;
        5 12 15 12 5;
        4 9 12 9 4
        2 4 5 4 2] / 159 ;

        new_img = double( zeros(row_size  , column_size));

        for i = 1 : 1 : row_size - 4
            for j = 1 : 1 : column_size  - 4

                new_img(i+1,j+1) = (image(i,j) * filter(1,1) +  image(i,j+1) * filter(1,2) + image(i,j+2) * filter(1,3) + image(i+1,j) * filter(2,1) + image(i+2,j) * filter(3,1) + image(i+1,j+1) * filter(2,2) + image(i+1,j+2) * filter(2,3) + image(i+2,j+2) * filter(3,3) + image(i+3, j) * filter(4,1) +  image(i+4, j) * filter(5,1)  + image(i+3,j+1) * filter(4,2) + image(i+4, j+1) * filter(5,2) + image(i+3,j+2) * filter(4,3) + image(i+4, j+2) * filter(5,3) + image(i,j+3) * filter(1,4) + image(i,j+4) * filter(1,5) + image(i+1,j+3) * filter(2,4) + image(i +1 ,j+4) * filter(2,5) + image(i+2,j+3) * filter(3,4) + image(i +2 ,j+4) * filter(3,5) + image(i+3,j+3) * filter(4,4) + image(i+3 ,j+4) * filter(4,5) + image(i+4,j+3) * filter(5,4) + image(i+4 ,j+4) * filter(5,5) ) ;                

            end
        end


        gaus_filtered_image = uint8(new_img);

        Kgx = [-1 0 +1
               -2 0 +2
               -1 0 +1 ];

        Kgy = [-1 -2 -1
                0  0  0
               +1 +2 +1 ];

    Gx = filterImage(gaus_filtered_image,Kgx);
    Gy = filterImage(gaus_filtered_image,Kgy);


    Gx = double(Gx);
    Gy = double(Gy);

    gmag = sqrt(Gx .^ 2 + Gy .^ 2);
    angle = atan2(Gy, Gx) * 180 / pi;

        for i = 1  : 1 : row_size
            for j = 1 : 1 : column_size
                if ((angle(i, j) >= 0 ) && (angle(i, j) < 22.5) || (angle(i, j) >= 157.5) && (angle(i, j) < 202.5) || (angle(i, j) >= 337.5) && (angle(i, j) <= 360))
                    angle(i, j) = 0;
                elseif ((angle(i, j) >= 22.5) && (angle(i, j) < 67.5) || (angle(i, j) >= 202.5) && (angle(i, j) < 247.5))
                    angle(i, j) = 45;
                elseif ((angle(i, j) >= 67.5 && angle(i, j) < 112.5) || (angle(i, j) >= 247.5 && angle(i, j) < 292.5))
                    angle(i, j) = 90;
                elseif ((angle(i, j) >= 112.5 && angle(i, j) < 157.5) || (angle(i, j) >= 292.5 && angle(i, j) < 337.5))
                    angle(i, j) = 135;
                end
            end
        end




    gN = nMax(gmag,angle); 
    gIn = zeros(row_size,column_size);

        for i = 2  : row_size - 1
            for j = 2 : column_size-1
                if (gN(i, j) < t_low)
                    gIn(i, j) = 0;
                elseif (gN(i, j) > t_high)
                    gIn(i, j) = 255;
                elseif ( gN(i+1,j)>t_low || gN(i-1,j)>t_low || gN(i,j+1)>t_low || gN(i,j-1)>t_low || gN(i-1, j-1)>t_low || gN(i-1, j+1)>t_low || gN(i+1, j+1)>t_low || gN(i+1, j-1)>t_low)
                    gIn(i,j) = 255;
                end
            end
        end

        outimg = uint8(gIn);



        function inimg = nMax(inimg,angle)


        [rowSize,columnSize] = size(inimg);

        %outimg = inimg;

        for k = 2 : 1 : rowSize - 1
            for l = 2 : 1 : columnSize - 1
                if angle(k,l) == 0
                    if (inimg(k,l) < inimg(k-1,l)) || (inimg(k,l) < inimg(k+1,l))
                        inimg(k,l) = 0;
                    end
                elseif angle(k,l) == 45
                     if (inimg(k,l) < inimg(k+1,l-1)) || (inimg(k,l) < inimg(k-1,l+1))
                        inimg(k,l) = 0;
                    end
                elseif angle(k,l) == 90
                    if (inimg(k,l) < inimg(k,l-1)) || (inimg(k,l) < inimg(k,l+1))
                        inimg(k,l) = 0;
                    end
                elseif angle(k,l) == 135
                     if (inimg(k,l) < inimg(k-1,l-1)) || (inimg(k,l) < inimg(k+1,l+1))

                        inimg(k,l) = 0;
                    end
                end
            end
        end
    end

       


end