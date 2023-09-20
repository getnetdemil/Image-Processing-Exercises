function [x_tilde] = restoration_wiener(y, h, n)

    Y = fft2(y);
    N = psf2otf(n, size(Y));
    H = psf2otf(h, size(Y));
    
    PNN= N .* conj(N);
    PYY= Y .* conj(Y); % We can use PYY instead of PXX because we can never know X
    
    R = conj(H) ./ ( abs(H).^2 + PNN./PYY );
    
    x_tilde = abs(ifft2(R .* Y ));


end
