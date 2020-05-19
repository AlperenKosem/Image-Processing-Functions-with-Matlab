function outimg = uniformNoise(image,lower,higher)

    [m, n] = size(image);
    
    for i = 1 : 1 : m
        for j = 1 : 1 : n
            
            %outimg(i,j) = lower + rand * (higher - lower);
            outimg(i,j) =  lower +  rand * (higher - lower);

        end
    end
end

%     random = 255 .* rand(m,n);
%     
%     for i = 1 : 1 : m
%         for j = 1 : 1 : n
%             if  lower < random(i,j) && random(i,j) < higher
%                 
%              outimg(i,j) = 255 * 1 / (lower - higher );
%  
%             end
%         end
%     end