function signal = ihaar_wavelet_transform(approx, detail)
    % Inverse Haar wavelet transformation for one-dimensional signals
    
    % Approx and Detail must be the same length
    if length(approx) ~= length(detail)
        error('Approximation and detail coefficients must be of the same length.');
    end
    
    N = length(approx) * 2;
    signal = zeros(1, N);
    
    % Reconstruct the signal from approximation and detail coefficients
    for i = 1:length(approx)
        signal(2*i-1) = (approx(i) + detail(i)) / sqrt(2); % Reconstruct original value
        signal(2*i) = (approx(i) - detail(i)) / sqrt(2);   % Reconstruct original value
    end
end
