function outimg = externalBoundaryFilter(image)
    
    dilationed_image = dilationFilter(image);
    
    [row_size, column_size] = size(image);
    outimg = zeros(row_size, column_size);
    dilationed_image = double(dilationed_image);
    
    
    outimg = abs(double(dilationed_image) - double(image)) ; %-255 ile ilgili bir durum var
    outimg = uint8(outimg);
    
%     for i = 1 : 1 : row_size
%         for j = 1 : 1 : column_size
%             
%              outimg(i,j) = abs(dilationed_image(i,j) - image(i,j)) ;
%              
%         end
%     end

end