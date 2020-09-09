function [mu, sigma2] = gaussianId(X)
% returns the estimated identities of the a dataset of Gaussian Distribution

    [m, n] = size(X);
    
    mu = sum(X)/m;                  % Compute Mean
    sigma2 = sum((X - mu).^2)/m;    % Compute Variance
end
