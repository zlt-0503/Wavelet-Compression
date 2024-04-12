function [approx, detail] = haar_wavelet_transform(signal)
    % Haar wavelet transformation function for one-dimensional signals
    
    N = length(signal);
    if mod(N, 2) ~= 0
        error('The length of the signal must be even.');
    end
    
    % Initialize coefficients
    approx = zeros(1, N/2);
    detail = zeros(1, N/2);

    % Haar filters
    for i = 1:2:N-1
        approx((i+1)/2) = (signal(i) + signal(i+1)) / sqrt(2);
        detail((i+1)/2) = (signal(i) - signal(i+1)) / sqrt(2);
    end
end
