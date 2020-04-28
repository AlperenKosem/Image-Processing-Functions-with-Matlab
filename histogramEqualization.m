function [histogramValues, out_img]= histogramEqualization (gray_image,bin)

    histogram = getHistogram(gray_image, bin);
    [row_size, column_size] = size(gray_image);


    cumulative_hist = cumsum(histogram);

    cdf_min = min(cumulative_hist);

    normalized = (1 ./ ((row_size * column_size) - cdf_min)) .* (cumulative_hist - cdf_min) ;

    cdf = round (normalized .* (bin - 1));


    out_img = zeros([row_size column_size]);

    for i = 1 : 1 : row_size
        for j = 1 : 1 : column_size

            for pixel = 1 : 1 : bin
                if(gray_image(i,j) == ( pixel - 1) )
                    out_img(i,j) = cdf(pixel);

                end

            end
        end
    end
    
    out_img = uint8(out_img);
    histogramValues = getHistogram(out_img,bin);
    

end