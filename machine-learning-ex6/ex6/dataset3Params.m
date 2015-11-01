function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
ind=[0.01 0.03 0.1 0.3 1 3 10 30];

x1 = [1 2 1]; x2 = [0 4 -1];
error=100;

for i=1:1:size(ind,2)
    for j=1:1:size(ind,2)

        C_temp=ind(1,i);
        sigma_temp=ind(1,j);
        

        model= svmTrain(X, y, C_temp, @(x1, x2) gaussianKernel(x1, x2, sigma_temp)); 

        predictions = svmPredict(model, Xval);

        error_temp=mean(double(predictions ~= yval));
        
        if error_temp<error
            error=error_temp;
            C=ind(i);
            sigma=ind(j);
        end
    end
end

% =========================================================================

end
