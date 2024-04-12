function compressed_image = compress_image(image, threshold)
    % Image compression using Haar wavelet transform
    
    % Convert image to double
    image = double(image);
    
    % Apply wavelet transform on each row
    transformed_image = zeros(size(image));
    for i = 1:size(image, 1)
        [approx, detail] = haar_wavelet_transform(image(i, :));
        transformed_image(i, 1:length(approx)) = approx;
        transformed_image(i, length(approx)+1:end) = detail;
    end
    
    % Apply wavelet transform on each column
    for j = 1:size(transformed_image, 2)
        [approx, detail] = haar_wavelet_transform(transformed_image(:, j)');
        transformed_image(1:length(approx), j) = approx;
        transformed_image(length(approx)+1:end, j) = detail;
    end
    
    % Thresholding
    transformed_image(abs(transformed_image) < threshold) = 0;
    
    % Inverse transform on each column
    for j = 1:size(transformed_image, 2)
        approx = transformed_image(1:size(image,1)/2, j);
        detail = transformed_image(size(image,1)/2+1:end, j);
        transformed_image(:, j) = ihaar_wavelet_transform(approx, detail);
    end
    
    % Inverse transform on each row
    for i = 1:size(transformed_image, 1)
        approx = transformed_image(i, 1:size(image,2)/2);
        detail = transformed_image(i, size(image,2)/2+1:end);
        transformed_image(i, :) = ihaar_wavelet_transform(approx, detail);
    end
    
    % Convert back to uint8
    compressed_image = uint8(transformed_image);
    
    return
end
