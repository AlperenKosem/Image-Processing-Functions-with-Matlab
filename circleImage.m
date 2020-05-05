function image = circleImage(r_ic, r_dis)
    
N = 256 ;
image = 255 * uint8(ones(N,N));
    

[row_size, column_size] = size(image);

center_x = N/2;
center_y = N/2;


for i=1 : row_size
    for j = 1 : column_size        
        if ((i - center_y)^2 + (j - center_x)^2 >= r_ic^2) && ((i - center_y)^2 + (j - center_x)^2 <= r_dis^2)

            image(i,j) = 0 ;
        
        end
    end
end

end