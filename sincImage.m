function image = sincImage(a)

    N = 256 ;
    
    image = uint8(zeros(N,N));
    x = linspace(-a,a,N); % range vector -a to a 
    
    for i = 1 : N
        for j = 1 : N
            if  (x(j) == 0)
                  
                   image(i,j) = 256;
                   
            else
                   image(i,j) = uint8( 128 + 128 * sin( pi *  x(j) ) /( pi * x(j) ));

            end
        end
    end
end