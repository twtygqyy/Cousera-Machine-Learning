function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

%X = [ones(m, 1), X]; % Add a column of ones to x
%mu = mean(X);
%X(:,2) = (X(:,2) - mu(2))./ sigma(2);



E=X*theta-y;
   
for i=1:m
    temp=E(i,:).*E(i,:);
    J=J+temp;
end


J=J/(2*m);

% =========================================================================

end
