clear;  clc;

load('data_2d.mat');                        % Load custom dataset
% load('data_11d.mat');

[mu, sigma_2] = gaussianId(X);              % Create Gaussian Identities

p = predictGaussian(X, mu, sigma_2);        % Training set 

pval = predictGaussian(Xval, mu, sigma_2);  % Cross-validation set

[epsilon, F1] = selectThreshold(yval, pval);% Find the best threshold

fprintf('Threshold: \t\t\t%e\n', epsilon);
fprintf('F1 Score:  \t\t\t%f\n', F1);
fprintf('Outliers found: \t%d \n', sum(p < epsilon));

X_clean = X(p>=epsilon,:);