function compress_and_save_image(original_image_path, compressed_image_path, threshold)
    % This function compresses an image, saves the compressed image, and prints size information
    % Inputs:
    %   original_image_path - Path to the original image
    %   compressed_image_path - Path where the compressed image will be saved
    %   threshold - Threshold value for wavelet compression
    
    % Start the timer
    tic;
    
    % Read the original image
    original_image = imread(original_image_path);
    
    % Check if the image is RGB and convert to grayscale
    if size(original_image, 3) == 3
        original_image = rgb2gray(original_image);
    end
    
    % Display the original image size in bytes
    original_info = whos('original_image');
    fprintf('Original Image Size: %d bytes\n', original_info.bytes);
    
    % Compress the image
    compressed_image = compress_image(original_image, threshold);
    
    % Save the compressed image
    imwrite(compressed_image, compressed_image_path);
    
    % Display the compressed image size in bytes
    compressed_info = whos('compressed_image');
    fprintf('Compressed Image Memory Size: %d bytes\n', compressed_info.bytes);
    
    % Optional: Save and compare file sizes
    imwrite(original_image, 'temp_original.png', 'png');
    imwrite(compressed_image, 'temp_compressed.png', 'png');
    file_info_original = dir('temp_original.png');
    file_info_compressed = dir('temp_compressed.png');
    fprintf('Original Image File Size: %d bytes\n', file_info_original.bytes);
    fprintf('Compressed Image File Size: %d bytes\n', file_info_compressed.bytes);
    
    % Delete temporary files
    delete('temp_original.png');
    delete('temp_compressed.png');
    
    % Stop the timer and display the elapsed time
    elapsed_time = toc;
    fprintf('Total time taken to compress and save the image: %.3f seconds\n', elapsed_time);
end
